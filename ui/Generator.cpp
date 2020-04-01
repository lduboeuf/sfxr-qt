#include "Generator.h"

#include <QQmlEngine>

#include <Sound.h>
#include <SoundUtils.h>

using std::move;

Generator::Generator(QObject* parent) : QObject(parent) {
}

void Generator::generatePickup() {
    auto sound = SoundUtils::generatePickup();
    sound->setCategory("Pickup");
    finish(move(sound), tr("Pickup"));
}

void Generator::generateLaser() {
    auto sound = SoundUtils::generateLaser();
    sound->setCategory("Laser");
    finish(move(sound), tr("Laser"));
}

void Generator::generateEmpty() {
    auto sound = SoundUtils::generateEmpty();
    sound->setCategory("Empty");
    finish(move(sound), tr("Empty"));
}

void Generator::generateExplosion() {
    auto sound = SoundUtils::generateExplosion();
    sound->setCategory("Explosion");
    finish(move(sound), tr("Explosion"));
}

void Generator::generatePowerup() {
    auto sound = SoundUtils::generatePowerup();
    sound->setCategory("Power up");
    finish(move(sound), tr("Power up"));
}

void Generator::generateHitHurt() {
    auto sound = SoundUtils::generateHitHurt();
    sound->setCategory("Hit");
    finish(move(sound), tr("Hit"));
}

void Generator::generateJump() {
    auto sound = SoundUtils::generateJump();
    sound->setCategory("Jump");
    finish(move(sound), tr("Jump"));
}

void Generator::generateBlipSelect() {
    auto sound = SoundUtils::generateBlipSelect();
    sound->setCategory("Blip");
    finish(move(sound), tr("Blip"));
}

void Generator::randomize(WaveForm::Enum waveForm) {
    auto sound = SoundUtils::randomize(waveForm);
    sound->setCategory("Randomize");
    finish(move(sound), tr("Randomize"));
}

void Generator::mutate(Sound* source) {
    auto sound = std::make_unique<Sound>();
    sound->fromOther(source);
    SoundUtils::mutate(sound.get());
    //QString cname = source->name() + QStringLiteral("%1").arg(counter++);
    finish(move(sound), source->name());
}

void Generator::finish(std::unique_ptr<Sound> soundPtr, const QString& name) {
    auto sound = soundPtr.release();
    sound->setUnsavedName(name);
    QQmlEngine::setObjectOwnership(sound, QQmlEngine::CppOwnership);
    soundGenerated(sound);
}

Sound* Generator::duplicate(Sound* soundSource) {
    auto sound = new Sound;
    sound->fromOther(soundSource);
    QQmlEngine::setObjectOwnership(sound, QQmlEngine::CppOwnership);
    return sound;
}
