#ifndef GENERATOR_H
#define GENERATOR_H

#include <QObject>

#include <memory>

#include <WaveForm.h>

class Sound;

/**
 * QML wrapper over SoundUtils functions.
 * The new sound is passed in the soundGenerated() signal. Generator is the
 * initial owner of the generated sound.
 */
class Generator : public QObject {
    Q_OBJECT
public:
    explicit Generator(QObject* parent = nullptr);

    Q_INVOKABLE void generatePickup();
    Q_INVOKABLE void generateLaser();
    Q_INVOKABLE void generateExplosion();
    Q_INVOKABLE void generatePowerup();
    Q_INVOKABLE void generateHitHurt();
    Q_INVOKABLE void generateJump();
    Q_INVOKABLE void generateBlipSelect();
    Q_INVOKABLE void randomize(WaveForm::Enum waveForm);
    Q_INVOKABLE void generateEmpty();

    Q_INVOKABLE void mutate(Sound* sound);
    Q_INVOKABLE Sound* duplicate(Sound* soundSource);

signals:
    void soundGenerated(Sound* sound);

private:
    void finish(std::unique_ptr<Sound> soundPtr, const QString& name);
    int counter = 0;
};

#endif // GENERATOR_H
