// This file has been generated with qpropgen, any changes made to it will be lost!
#include <basesound.h>

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

int BaseSound::waveType() const {
    return wave_type;
}
void BaseSound::setWaveType(int value) {
    
    if (wave_type == value) {
    
        return;
    }
    wave_type = value;
    waveTypeChanged(value);
}

qreal BaseSound::attackTime() const {
    return p_env_attack;
}
void BaseSound::setAttackTime(qreal value) {
    
    if (qFuzzyCompare(p_env_attack, value)) {
    
        return;
    }
    p_env_attack = value;
    attackTimeChanged(value);
}

qreal BaseSound::sustainTime() const {
    return p_env_sustain;
}
void BaseSound::setSustainTime(qreal value) {
    
    if (qFuzzyCompare(p_env_sustain, value)) {
    
        return;
    }
    p_env_sustain = value;
    sustainTimeChanged(value);
}

qreal BaseSound::sustainPunch() const {
    return p_env_punch;
}
void BaseSound::setSustainPunch(qreal value) {
    
    if (qFuzzyCompare(p_env_punch, value)) {
    
        return;
    }
    p_env_punch = value;
    sustainPunchChanged(value);
}

qreal BaseSound::decayTime() const {
    return p_env_decay;
}
void BaseSound::setDecayTime(qreal value) {
    
    if (qFuzzyCompare(p_env_decay, value)) {
    
        return;
    }
    p_env_decay = value;
    decayTimeChanged(value);
}

qreal BaseSound::baseFrequency() const {
    return p_base_freq;
}
void BaseSound::setBaseFrequency(qreal value) {
    
    if (qFuzzyCompare(p_base_freq, value)) {
    
        return;
    }
    p_base_freq = value;
    baseFrequencyChanged(value);
}

qreal BaseSound::minFrequency() const {
    return p_freq_limit;
}
void BaseSound::setMinFrequency(qreal value) {
    
    if (qFuzzyCompare(p_freq_limit, value)) {
    
        return;
    }
    p_freq_limit = value;
    minFrequencyChanged(value);
}

qreal BaseSound::slide() const {
    return p_freq_ramp;
}
void BaseSound::setSlide(qreal value) {
    
    if (qFuzzyCompare(p_freq_ramp, value)) {
    
        return;
    }
    p_freq_ramp = value;
    slideChanged(value);
}

qreal BaseSound::deltaSlide() const {
    return p_freq_dramp;
}
void BaseSound::setDeltaSlide(qreal value) {
    
    if (qFuzzyCompare(p_freq_dramp, value)) {
    
        return;
    }
    p_freq_dramp = value;
    deltaSlideChanged(value);
}

qreal BaseSound::vibratoDepth() const {
    return p_vib_strength;
}
void BaseSound::setVibratoDepth(qreal value) {
    
    if (qFuzzyCompare(p_vib_strength, value)) {
    
        return;
    }
    p_vib_strength = value;
    vibratoDepthChanged(value);
}

qreal BaseSound::vibratoSpeed() const {
    return p_vib_speed;
}
void BaseSound::setVibratoSpeed(qreal value) {
    
    if (qFuzzyCompare(p_vib_speed, value)) {
    
        return;
    }
    p_vib_speed = value;
    vibratoSpeedChanged(value);
}

qreal BaseSound::changeAmount() const {
    return p_arp_mod;
}
void BaseSound::setChangeAmount(qreal value) {
    
    if (qFuzzyCompare(p_arp_mod, value)) {
    
        return;
    }
    p_arp_mod = value;
    changeAmountChanged(value);
}

qreal BaseSound::changeSpeed() const {
    return p_arp_speed;
}
void BaseSound::setChangeSpeed(qreal value) {
    
    if (qFuzzyCompare(p_arp_speed, value)) {
    
        return;
    }
    p_arp_speed = value;
    changeSpeedChanged(value);
}

qreal BaseSound::squareDuty() const {
    return p_duty;
}
void BaseSound::setSquareDuty(qreal value) {
    
    if (qFuzzyCompare(p_duty, value)) {
    
        return;
    }
    p_duty = value;
    squareDutyChanged(value);
}

qreal BaseSound::dutySweep() const {
    return p_duty_ramp;
}
void BaseSound::setDutySweep(qreal value) {
    
    if (qFuzzyCompare(p_duty_ramp, value)) {
    
        return;
    }
    p_duty_ramp = value;
    dutySweepChanged(value);
}

qreal BaseSound::repeatSpeed() const {
    return p_repeat_speed;
}
void BaseSound::setRepeatSpeed(qreal value) {
    
    if (qFuzzyCompare(p_repeat_speed, value)) {
    
        return;
    }
    p_repeat_speed = value;
    repeatSpeedChanged(value);
}

qreal BaseSound::phaserOffset() const {
    return p_pha_offset;
}
void BaseSound::setPhaserOffset(qreal value) {
    
    if (qFuzzyCompare(p_pha_offset, value)) {
    
        return;
    }
    p_pha_offset = value;
    phaserOffsetChanged(value);
}

qreal BaseSound::phaserSweep() const {
    return p_pha_ramp;
}
void BaseSound::setPhaserSweep(qreal value) {
    
    if (qFuzzyCompare(p_pha_ramp, value)) {
    
        return;
    }
    p_pha_ramp = value;
    phaserSweepChanged(value);
}

qreal BaseSound::lpFilterCutoff() const {
    return p_lpf_freq;
}
void BaseSound::setLpFilterCutoff(qreal value) {
    
    if (qFuzzyCompare(p_lpf_freq, value)) {
    
        return;
    }
    p_lpf_freq = value;
    lpFilterCutoffChanged(value);
}

qreal BaseSound::lpFilterCutoffSweep() const {
    return p_lpf_ramp;
}
void BaseSound::setLpFilterCutoffSweep(qreal value) {
    
    if (qFuzzyCompare(p_lpf_ramp, value)) {
    
        return;
    }
    p_lpf_ramp = value;
    lpFilterCutoffSweepChanged(value);
}

qreal BaseSound::lpFilterResonance() const {
    return p_lpf_resonance;
}
void BaseSound::setLpFilterResonance(qreal value) {
    
    if (qFuzzyCompare(p_lpf_resonance, value)) {
    
        return;
    }
    p_lpf_resonance = value;
    lpFilterResonanceChanged(value);
}

qreal BaseSound::hpFilterCutoff() const {
    return p_hpf_freq;
}
void BaseSound::setHpFilterCutoff(qreal value) {
    
    if (qFuzzyCompare(p_hpf_freq, value)) {
    
        return;
    }
    p_hpf_freq = value;
    hpFilterCutoffChanged(value);
}

qreal BaseSound::hpFilterCutoffSweep() const {
    return p_hpf_ramp;
}
void BaseSound::setHpFilterCutoffSweep(qreal value) {
    
    if (qFuzzyCompare(p_hpf_ramp, value)) {
    
        return;
    }
    p_hpf_ramp = value;
    hpFilterCutoffSweepChanged(value);
}

qreal BaseSound::volume() const {
    return sound_vol;
}
void BaseSound::setVolume(qreal value) {
    
    if (qFuzzyCompare(sound_vol, value)) {
    
        return;
    }
    sound_vol = value;
    volumeChanged(value);
}
