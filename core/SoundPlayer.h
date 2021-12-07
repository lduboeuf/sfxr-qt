#ifndef SOUNDPLAYER_H
#define SOUNDPLAYER_H

#include <QMutex>
#include <QObject>
#include <QElapsedTimer>

#include <memory>

class QTimer;

class Sound;
class Synthesizer;

class SoundPlayer : public QObject {
    Q_OBJECT
    Q_PROPERTY(Sound* sound READ sound WRITE setSound NOTIFY soundChanged)
    Q_PROPERTY(bool loop READ loop WRITE setLoop NOTIFY loopChanged)
    Q_PROPERTY(bool playing READ playing NOTIFY playingChanged)
    Q_PROPERTY(qreal loopTime READ loopTime WRITE setLoopTime NOTIFY loopTimeChanged)
public:
    explicit SoundPlayer(QObject* parent = nullptr);
    ~SoundPlayer();

    Q_INVOKABLE void play();

    Sound* sound() const;
    void setSound(Sound* value);

    bool playing() const;

    bool loop() const;
    void setLoop(bool value);
    qreal loopTime() const;
    void setLoopTime(qreal loopTime);

signals:
    void soundChanged(Sound* value);
    void loopChanged(bool value);
    void loopTimeChanged(qreal value);
    void playingChanged();

private:
    bool mPlaying = false;
    bool mLoop = false;
    qreal mLoopTime = 0.5;
    QElapsedTimer mElapsedTimer;
    QTimer* mPlayTimer;
    QTimer* mPlayLoopTimer;
    Sound* mSound = nullptr;

    mutable QMutex mMutex;
    struct PlayThreadData {
        bool playing = false;
        bool loop = false;
        std::unique_ptr<Synthesizer> synth;
    } mPlayThreadData;

    void sdlAudioCallback(unsigned char* stream, int len);
    void registerCallback();
    void unregisterCallback();
    void schedulePlay();

    void onSoundModified();

    static void staticSdlAudioCallback(void* userdata, unsigned char* stream, int len);
};

#endif // SOUNDPLAYER_H
