// This file has been generated with qpropgen, any changes made to it will be lost!

#ifndef BASEWAVSAVER_H
#define BASEWAVSAVER_H

#include <QObject>

class BaseWavSaver : public QObject {
    Q_OBJECT

    Q_PROPERTY(int bits READ bits
            WRITE setBits
            NOTIFY bitsChanged
    )

    Q_PROPERTY(int frequency READ frequency
            WRITE setFrequency
            NOTIFY frequencyChanged
    )

public:
    explicit BaseWavSaver(QObject* parent = nullptr);


     int bits() const;
     void setBits(int value);

     int frequency() const;
     void setFrequency(int value);


signals:

    void bitsChanged(int bits);

    void frequencyChanged(int frequency);

private:
    int mBits = 16;
    int mFrequency = 44100;
};

#endif // BASEWAVSAVER_H
