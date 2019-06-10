#include "soundplayer.h"

#include <QTimer>

#include <SDL2/SDL.h>

#include <sound.h>
#include <synthesizer.h>

static const int SCHEDULED_PLAY_DELAY = 200;

class BufferStrategy : public Synthesizer::SynthStrategy {
public:
    BufferStrategy(float* buffer)
        : buffer(buffer) {
    }
    void write(float ssample) override {
        *buffer++ = qBound(-1.f, ssample, 1.f);;
    }
private:
    float* buffer;
};

SoundPlayer::SoundPlayer(QObject* parent)
    : QObject(parent)
    , mPlayTimer(new QTimer(this)) {

    if(SDL_Init(SDL_INIT_AUDIO) < 0) exit(0);

    mPlayThreadData.synth.reset(new Synthesizer);

    mPlayTimer->setInterval(SCHEDULED_PLAY_DELAY);
    mPlayTimer->setSingleShot(true);
    connect(mPlayTimer, &QTimer::timeout, this, &SoundPlayer::play);
    registerCallback();
}

SoundPlayer::~SoundPlayer() {
    unregisterCallback();
}

Sound* SoundPlayer::sound() const {
    return mSound;
}

void SoundPlayer::setSound(Sound* value) {
    if (mSound == value) {
        return;
    }
    if (mSound) {
        disconnect(mSound, nullptr, this, nullptr);
    }
    mSound = value;
    if (mSound) {
        connect(mSound, &Sound::waveTypeChanged, this, &SoundPlayer::onSoundModified);

        connect(mSound, &Sound::attackTimeChanged, this, &SoundPlayer::onSoundModified);
        connect(mSound, &Sound::sustainTimeChanged, this, &SoundPlayer::onSoundModified);
        connect(mSound, &Sound::sustainPunchChanged, this, &SoundPlayer::onSoundModified);
        connect(mSound, &Sound::decayTimeChanged, this, &SoundPlayer::onSoundModified);

        connect(mSound, &Sound::baseFrequencyChanged, this, &SoundPlayer::onSoundModified);
        connect(mSound, &Sound::minFrequencyChanged, this, &SoundPlayer::onSoundModified);
        connect(mSound, &Sound::slideChanged, this, &SoundPlayer::onSoundModified);
        connect(mSound, &Sound::deltaSlideChanged, this, &SoundPlayer::onSoundModified);
        connect(mSound, &Sound::vibratoDepthChanged, this, &SoundPlayer::onSoundModified);
        connect(mSound, &Sound::vibratoSpeedChanged, this, &SoundPlayer::onSoundModified);

        connect(mSound, &Sound::changeAmountChanged, this, &SoundPlayer::onSoundModified);
        connect(mSound, &Sound::changeSpeedChanged, this, &SoundPlayer::onSoundModified);

        connect(mSound, &Sound::squareDutyChanged, this, &SoundPlayer::onSoundModified);
        connect(mSound, &Sound::dutySweepChanged, this, &SoundPlayer::onSoundModified);

        connect(mSound, &Sound::repeatSpeedChanged, this, &SoundPlayer::onSoundModified);

        connect(mSound, &Sound::phaserOffsetChanged, this, &SoundPlayer::onSoundModified);
        connect(mSound, &Sound::phaserSweepChanged, this, &SoundPlayer::onSoundModified);

        connect(mSound, &Sound::lpFilterCutoffChanged, this, &SoundPlayer::onSoundModified);
        connect(mSound, &Sound::lpFilterCutoffSweepChanged, this, &SoundPlayer::onSoundModified);
        connect(mSound, &Sound::lpFilterResonanceChanged, this, &SoundPlayer::onSoundModified);
        connect(mSound, &Sound::hpFilterCutoffChanged, this, &SoundPlayer::onSoundModified);
        connect(mSound, &Sound::hpFilterCutoffSweepChanged, this, &SoundPlayer::onSoundModified);

        connect(mSound, &Sound::volumeChanged, this, &SoundPlayer::onSoundModified);
    } else {
        mPlaying = false;
    }
    {
        QMutexLocker lock(&mMutex);
        mPlayThreadData.playing = mPlaying;
        if (mSound) {
            mPlayThreadData.synth->init(mSound);
        }
    }
    soundChanged(value);
}

bool SoundPlayer::loop() const {
    return mLoop;
}

void SoundPlayer::setLoop(bool value) {
    if (mLoop == value) {
        return;
    }
    mLoop = value;
    {
        QMutexLocker lock(&mMutex);
        mPlayThreadData.loop = mLoop;
    }
    loopChanged(value);
}

void SoundPlayer::play() {
    mPlaying = true;
    {
        QMutexLocker lock(&mMutex);
        mPlayThreadData.playing = mPlaying;
        mPlayThreadData.synth->start();
    }
}

void SoundPlayer::staticSdlAudioCallback(void* userdata, unsigned char* stream, int len) {
    SoundPlayer* player = reinterpret_cast<SoundPlayer*>(userdata);
    player->sdlAudioCallback(stream, len);
}

void SoundPlayer::sdlAudioCallback(unsigned char* stream, int len) {
    QMutexLocker lock(&mMutex);
    if (mPlayThreadData.playing) {
        unsigned int l = len / 2;
        float fbuf[l];
        memset(fbuf, 0, sizeof(fbuf));
        BufferStrategy strategy(fbuf);
        mPlayThreadData.playing = mPlayThreadData.synth->synthSample(l, &strategy);
        while (l--) {
            float f = qBound(-1.f, fbuf[l], 1.f);
            ((Sint16*)stream)[l] = (Sint16)(f * 32767);
        }
        if (mPlayThreadData.loop && !mPlayThreadData.playing) {
            mPlayThreadData.playing = true;
            mPlayThreadData.synth->start();
        }
    } else {
        memset(stream, 0, len);
    }
}

void SoundPlayer::registerCallback() {
    SDL_AudioSpec des;
    des.freq = 44100;
    //des.freq = 16000;
    des.format = AUDIO_S16SYS;
    des.channels = 1;
    des.samples = 4096;
    des.callback = staticSdlAudioCallback;
    des.userdata = this;

    if (SDL_OpenAudio(&des, NULL) != 0) {
        fprintf(stderr, "Failed to init audio %s\n", SDL_GetError());
        exit(1);
    }
    SDL_PauseAudio(0);
}

void SoundPlayer::unregisterCallback() {
    SDL_CloseAudio();
}

void SoundPlayer::onSoundModified() {
    {
        QMutexLocker lock(&mMutex);
        mPlayThreadData.synth->init(mSound);
    }
    schedulePlay();
}

void SoundPlayer::schedulePlay() {
    mPlayTimer->start();
}
