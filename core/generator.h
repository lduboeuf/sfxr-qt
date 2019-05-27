#ifndef GENERATOR_H
#define GENERATOR_H

#include <QObject>

class Sound;

/**
 * Randomly generate sounds. The new sound is passed in the soundGenerated()
 * signal. Generator is the initial owner of the generated sound.
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
    //Q_INVOKABLE void generateRandom();

    Q_INVOKABLE void mutate(Sound* sound);

signals:
    void soundGenerated(Sound* sound);

private:
    Sound* createSound(const QString& name);
    int counter =0;
};

#endif // GENERATOR_H
