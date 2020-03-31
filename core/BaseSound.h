// This file has been generated with qpropgen, any changes made to it will be lost!

#ifndef BASESOUND_H
#define BASESOUND_H

#include <QObject>
#include <QUrl>
#include <WaveForm.h>

class BaseSound : public QObject {
    Q_OBJECT

    Q_PROPERTY(QUrl url READ url
            WRITE setUrl
            NOTIFY urlChanged
    )

    Q_PROPERTY(QString name READ name
            NOTIFY nameChanged
    )

    Q_PROPERTY(QString category READ category
            WRITE setCategory
            NOTIFY categoryChanged
    )

    Q_PROPERTY(bool hasRealUrl READ hasRealUrl
            NOTIFY hasRealUrlChanged
    )

    Q_PROPERTY(WaveForm::Enum waveForm READ waveForm
            WRITE setWaveForm
            NOTIFY waveFormChanged
    )

    Q_PROPERTY(qreal attackTime READ attackTime
            WRITE setAttackTime
            NOTIFY attackTimeChanged
    )

    Q_PROPERTY(qreal sustainTime READ sustainTime
            WRITE setSustainTime
            NOTIFY sustainTimeChanged
    )

    Q_PROPERTY(qreal sustainPunch READ sustainPunch
            WRITE setSustainPunch
            NOTIFY sustainPunchChanged
    )

    Q_PROPERTY(qreal decayTime READ decayTime
            WRITE setDecayTime
            NOTIFY decayTimeChanged
    )

    Q_PROPERTY(qreal baseFrequency READ baseFrequency
            WRITE setBaseFrequency
            NOTIFY baseFrequencyChanged
    )

    Q_PROPERTY(qreal minFrequency READ minFrequency
            WRITE setMinFrequency
            NOTIFY minFrequencyChanged
    )

    Q_PROPERTY(qreal slide READ slide
            WRITE setSlide
            NOTIFY slideChanged
    )

    Q_PROPERTY(qreal deltaSlide READ deltaSlide
            WRITE setDeltaSlide
            NOTIFY deltaSlideChanged
    )

    Q_PROPERTY(qreal vibratoDepth READ vibratoDepth
            WRITE setVibratoDepth
            NOTIFY vibratoDepthChanged
    )

    Q_PROPERTY(qreal vibratoSpeed READ vibratoSpeed
            WRITE setVibratoSpeed
            NOTIFY vibratoSpeedChanged
    )

    Q_PROPERTY(qreal changeAmount READ changeAmount
            WRITE setChangeAmount
            NOTIFY changeAmountChanged
    )

    Q_PROPERTY(qreal changeSpeed READ changeSpeed
            WRITE setChangeSpeed
            NOTIFY changeSpeedChanged
    )

    Q_PROPERTY(qreal squareDuty READ squareDuty
            WRITE setSquareDuty
            NOTIFY squareDutyChanged
    )

    Q_PROPERTY(qreal dutySweep READ dutySweep
            WRITE setDutySweep
            NOTIFY dutySweepChanged
    )

    Q_PROPERTY(qreal repeatSpeed READ repeatSpeed
            WRITE setRepeatSpeed
            NOTIFY repeatSpeedChanged
    )

    Q_PROPERTY(qreal phaserOffset READ phaserOffset
            WRITE setPhaserOffset
            NOTIFY phaserOffsetChanged
    )

    Q_PROPERTY(qreal phaserSweep READ phaserSweep
            WRITE setPhaserSweep
            NOTIFY phaserSweepChanged
    )

    Q_PROPERTY(qreal lpFilterCutoff READ lpFilterCutoff
            WRITE setLpFilterCutoff
            NOTIFY lpFilterCutoffChanged
    )

    Q_PROPERTY(qreal lpFilterCutoffSweep READ lpFilterCutoffSweep
            WRITE setLpFilterCutoffSweep
            NOTIFY lpFilterCutoffSweepChanged
    )

    Q_PROPERTY(qreal lpFilterResonance READ lpFilterResonance
            WRITE setLpFilterResonance
            NOTIFY lpFilterResonanceChanged
    )

    Q_PROPERTY(qreal hpFilterCutoff READ hpFilterCutoff
            WRITE setHpFilterCutoff
            NOTIFY hpFilterCutoffChanged
    )

    Q_PROPERTY(qreal hpFilterCutoffSweep READ hpFilterCutoffSweep
            WRITE setHpFilterCutoffSweep
            NOTIFY hpFilterCutoffSweepChanged
    )

    Q_PROPERTY(qreal volume READ volume
            WRITE setVolume
            NOTIFY volumeChanged
    )

public:
    explicit BaseSound(QObject* parent = nullptr);


    virtual QUrl url() const;
    virtual void setUrl(const QUrl& value);

    virtual QString name() const = 0;

     QString category() const;
     void setCategory(const QString& value);

    virtual bool hasRealUrl() const = 0;

     WaveForm::Enum waveForm() const;
     void setWaveForm(const WaveForm::Enum& value);

     qreal attackTime() const;
     void setAttackTime(qreal value);

     qreal sustainTime() const;
     void setSustainTime(qreal value);

     qreal sustainPunch() const;
     void setSustainPunch(qreal value);

     qreal decayTime() const;
     void setDecayTime(qreal value);

     qreal baseFrequency() const;
     void setBaseFrequency(qreal value);

     qreal minFrequency() const;
     void setMinFrequency(qreal value);

     qreal slide() const;
     void setSlide(qreal value);

     qreal deltaSlide() const;
     void setDeltaSlide(qreal value);

     qreal vibratoDepth() const;
     void setVibratoDepth(qreal value);

     qreal vibratoSpeed() const;
     void setVibratoSpeed(qreal value);

     qreal changeAmount() const;
     void setChangeAmount(qreal value);

     qreal changeSpeed() const;
     void setChangeSpeed(qreal value);

     qreal squareDuty() const;
     void setSquareDuty(qreal value);

     qreal dutySweep() const;
     void setDutySweep(qreal value);

     qreal repeatSpeed() const;
     void setRepeatSpeed(qreal value);

     qreal phaserOffset() const;
     void setPhaserOffset(qreal value);

     qreal phaserSweep() const;
     void setPhaserSweep(qreal value);

     qreal lpFilterCutoff() const;
     void setLpFilterCutoff(qreal value);

     qreal lpFilterCutoffSweep() const;
     void setLpFilterCutoffSweep(qreal value);

     qreal lpFilterResonance() const;
     void setLpFilterResonance(qreal value);

     qreal hpFilterCutoff() const;
     void setHpFilterCutoff(qreal value);

     qreal hpFilterCutoffSweep() const;
     void setHpFilterCutoffSweep(qreal value);

     qreal volume() const;
     void setVolume(qreal value);


signals:

    void urlChanged(const QUrl& url);

    void nameChanged(const QString& name);

    void categoryChanged(const QString& category);

    void hasRealUrlChanged(bool hasRealUrl);

    void waveFormChanged(const WaveForm::Enum& waveForm);

    void attackTimeChanged(qreal attackTime);

    void sustainTimeChanged(qreal sustainTime);

    void sustainPunchChanged(qreal sustainPunch);

    void decayTimeChanged(qreal decayTime);

    void baseFrequencyChanged(qreal baseFrequency);

    void minFrequencyChanged(qreal minFrequency);

    void slideChanged(qreal slide);

    void deltaSlideChanged(qreal deltaSlide);

    void vibratoDepthChanged(qreal vibratoDepth);

    void vibratoSpeedChanged(qreal vibratoSpeed);

    void changeAmountChanged(qreal changeAmount);

    void changeSpeedChanged(qreal changeSpeed);

    void squareDutyChanged(qreal squareDuty);

    void dutySweepChanged(qreal dutySweep);

    void repeatSpeedChanged(qreal repeatSpeed);

    void phaserOffsetChanged(qreal phaserOffset);

    void phaserSweepChanged(qreal phaserSweep);

    void lpFilterCutoffChanged(qreal lpFilterCutoff);

    void lpFilterCutoffSweepChanged(qreal lpFilterCutoffSweep);

    void lpFilterResonanceChanged(qreal lpFilterResonance);

    void hpFilterCutoffChanged(qreal hpFilterCutoff);

    void hpFilterCutoffSweepChanged(qreal hpFilterCutoffSweep);

    void volumeChanged(qreal volume);

protected:
    QUrl mUrl;
    QString mName;
    QString mCategory;
    bool mHasRealUrl;
    WaveForm::Enum mWaveForm = WaveForm::Square;
    qreal mAttackTime = 0;
    qreal mSustainTime = 0.3;
    qreal mSustainPunch = 0;
    qreal mDecayTime = 0.4;
    qreal mBaseFrequency = 0.3;
    qreal mMinFrequency = 0;
    qreal mSlide = 0;
    qreal mDeltaSlide = 0;
    qreal mVibratoDepth = 0;
    qreal mVibratoSpeed = 0;
    qreal mChangeAmount = 0;
    qreal mChangeSpeed = 0;
    qreal mSquareDuty = 0;
    qreal mDutySweep = 0;
    qreal mRepeatSpeed = 0;
    qreal mPhaserOffset = 0;
    qreal mPhaserSweep = 0;
    qreal mLpFilterCutoff = 1;
    qreal mLpFilterCutoffSweep = 0;
    qreal mLpFilterResonance = 0;
    qreal mHpFilterCutoff = 0;
    qreal mHpFilterCutoffSweep = 0;
    qreal mVolume = 0.5f;
};

#endif // BASESOUND_H
