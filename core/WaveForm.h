#ifndef WAVEFORM_H
#define WAVEFORM_H

#include <QObject>

class WaveForm : public QObject {
  Q_OBJECT
  Q_ENUMS(Enum)

// Must be kept in sync with WaveFormSelector.qml
public:
    enum Enum {
    // These 4 values must not change to keep compatibility with .sfxr files
    Square = 0,
    Sawtooth = 1,
    Sine = 2,
    Noise = 3,
    Triangle,
};

static Enum random(const std::vector<Enum>& values);

//void registerType();
};

Q_DECLARE_METATYPE(WaveForm::Enum)
#endif // WAVEFORM_H
