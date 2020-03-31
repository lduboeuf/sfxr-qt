// This file has been generated with qpropgen, any changes made to it will be lost!
#include <BaseSound.h>

BaseSound::BaseSound(QObject* parent)
    : QObject(parent) {
}


QUrl BaseSound::url() const {
    return mUrl;
}
void BaseSound::setUrl(const QUrl& value) {
    
    if (mUrl == value) {
    
        return;
    }
    mUrl = value;
    urlChanged(value);
}

QString BaseSound::category() const {
    return mCategory;
}
void BaseSound::setCategory(const QString& value) {
    
    if (mCategory == value) {
    
        return;
    }
    mCategory = value;
    categoryChanged(value);
}

WaveForm::Enum BaseSound::waveForm() const {
    return mWaveForm;
}
void BaseSound::setWaveForm(const WaveForm::Enum& value) {
    
    if (mWaveForm == value) {
    
        return;
    }
    mWaveForm = value;
    waveFormChanged(value);
}

qreal BaseSound::attackTime() const {
    return mAttackTime;
}
void BaseSound::setAttackTime(qreal value) {
    
    if (qFuzzyCompare(mAttackTime, value)) {
    
        return;
    }
    mAttackTime = value;
    attackTimeChanged(value);
}

qreal BaseSound::sustainTime() const {
    return mSustainTime;
}
void BaseSound::setSustainTime(qreal value) {
    
    if (qFuzzyCompare(mSustainTime, value)) {
    
        return;
    }
    mSustainTime = value;
    sustainTimeChanged(value);
}

qreal BaseSound::sustainPunch() const {
    return mSustainPunch;
}
void BaseSound::setSustainPunch(qreal value) {
    
    if (qFuzzyCompare(mSustainPunch, value)) {
    
        return;
    }
    mSustainPunch = value;
    sustainPunchChanged(value);
}

qreal BaseSound::decayTime() const {
    return mDecayTime;
}
void BaseSound::setDecayTime(qreal value) {
    
    if (qFuzzyCompare(mDecayTime, value)) {
    
        return;
    }
    mDecayTime = value;
    decayTimeChanged(value);
}

qreal BaseSound::baseFrequency() const {
    return mBaseFrequency;
}
void BaseSound::setBaseFrequency(qreal value) {
    
    if (qFuzzyCompare(mBaseFrequency, value)) {
    
        return;
    }
    mBaseFrequency = value;
    baseFrequencyChanged(value);
}

qreal BaseSound::minFrequency() const {
    return mMinFrequency;
}
void BaseSound::setMinFrequency(qreal value) {
    
    if (qFuzzyCompare(mMinFrequency, value)) {
    
        return;
    }
    mMinFrequency = value;
    minFrequencyChanged(value);
}

qreal BaseSound::slide() const {
    return mSlide;
}
void BaseSound::setSlide(qreal value) {
    
    if (qFuzzyCompare(mSlide, value)) {
    
        return;
    }
    mSlide = value;
    slideChanged(value);
}

qreal BaseSound::deltaSlide() const {
    return mDeltaSlide;
}
void BaseSound::setDeltaSlide(qreal value) {
    
    if (qFuzzyCompare(mDeltaSlide, value)) {
    
        return;
    }
    mDeltaSlide = value;
    deltaSlideChanged(value);
}

qreal BaseSound::vibratoDepth() const {
    return mVibratoDepth;
}
void BaseSound::setVibratoDepth(qreal value) {
    
    if (qFuzzyCompare(mVibratoDepth, value)) {
    
        return;
    }
    mVibratoDepth = value;
    vibratoDepthChanged(value);
}

qreal BaseSound::vibratoSpeed() const {
    return mVibratoSpeed;
}
void BaseSound::setVibratoSpeed(qreal value) {
    
    if (qFuzzyCompare(mVibratoSpeed, value)) {
    
        return;
    }
    mVibratoSpeed = value;
    vibratoSpeedChanged(value);
}

qreal BaseSound::changeAmount() const {
    return mChangeAmount;
}
void BaseSound::setChangeAmount(qreal value) {
    
    if (qFuzzyCompare(mChangeAmount, value)) {
    
        return;
    }
    mChangeAmount = value;
    changeAmountChanged(value);
}

qreal BaseSound::changeSpeed() const {
    return mChangeSpeed;
}
void BaseSound::setChangeSpeed(qreal value) {
    
    if (qFuzzyCompare(mChangeSpeed, value)) {
    
        return;
    }
    mChangeSpeed = value;
    changeSpeedChanged(value);
}

qreal BaseSound::squareDuty() const {
    return mSquareDuty;
}
void BaseSound::setSquareDuty(qreal value) {
    
    if (qFuzzyCompare(mSquareDuty, value)) {
    
        return;
    }
    mSquareDuty = value;
    squareDutyChanged(value);
}

qreal BaseSound::dutySweep() const {
    return mDutySweep;
}
void BaseSound::setDutySweep(qreal value) {
    
    if (qFuzzyCompare(mDutySweep, value)) {
    
        return;
    }
    mDutySweep = value;
    dutySweepChanged(value);
}

qreal BaseSound::repeatSpeed() const {
    return mRepeatSpeed;
}
void BaseSound::setRepeatSpeed(qreal value) {
    
    if (qFuzzyCompare(mRepeatSpeed, value)) {
    
        return;
    }
    mRepeatSpeed = value;
    repeatSpeedChanged(value);
}

qreal BaseSound::phaserOffset() const {
    return mPhaserOffset;
}
void BaseSound::setPhaserOffset(qreal value) {
    
    if (qFuzzyCompare(mPhaserOffset, value)) {
    
        return;
    }
    mPhaserOffset = value;
    phaserOffsetChanged(value);
}

qreal BaseSound::phaserSweep() const {
    return mPhaserSweep;
}
void BaseSound::setPhaserSweep(qreal value) {
    
    if (qFuzzyCompare(mPhaserSweep, value)) {
    
        return;
    }
    mPhaserSweep = value;
    phaserSweepChanged(value);
}

qreal BaseSound::lpFilterCutoff() const {
    return mLpFilterCutoff;
}
void BaseSound::setLpFilterCutoff(qreal value) {
    
    if (qFuzzyCompare(mLpFilterCutoff, value)) {
    
        return;
    }
    mLpFilterCutoff = value;
    lpFilterCutoffChanged(value);
}

qreal BaseSound::lpFilterCutoffSweep() const {
    return mLpFilterCutoffSweep;
}
void BaseSound::setLpFilterCutoffSweep(qreal value) {
    
    if (qFuzzyCompare(mLpFilterCutoffSweep, value)) {
    
        return;
    }
    mLpFilterCutoffSweep = value;
    lpFilterCutoffSweepChanged(value);
}

qreal BaseSound::lpFilterResonance() const {
    return mLpFilterResonance;
}
void BaseSound::setLpFilterResonance(qreal value) {
    
    if (qFuzzyCompare(mLpFilterResonance, value)) {
    
        return;
    }
    mLpFilterResonance = value;
    lpFilterResonanceChanged(value);
}

qreal BaseSound::hpFilterCutoff() const {
    return mHpFilterCutoff;
}
void BaseSound::setHpFilterCutoff(qreal value) {
    
    if (qFuzzyCompare(mHpFilterCutoff, value)) {
    
        return;
    }
    mHpFilterCutoff = value;
    hpFilterCutoffChanged(value);
}

qreal BaseSound::hpFilterCutoffSweep() const {
    return mHpFilterCutoffSweep;
}
void BaseSound::setHpFilterCutoffSweep(qreal value) {
    
    if (qFuzzyCompare(mHpFilterCutoffSweep, value)) {
    
        return;
    }
    mHpFilterCutoffSweep = value;
    hpFilterCutoffSweepChanged(value);
}

qreal BaseSound::volume() const {
    return mVolume;
}
void BaseSound::setVolume(qreal value) {
    
    if (qFuzzyCompare(mVolume, value)) {
    
        return;
    }
    mVolume = value;
    volumeChanged(value);
}
