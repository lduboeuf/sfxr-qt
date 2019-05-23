// This file has been generated with qpropgen, any changes made to it will be lost!
#include <basewavsaver.h>

BaseWavSaver::BaseWavSaver(QObject* parent)
    : QObject(parent) {
}


int BaseWavSaver::bits() const {
    return mBits;
}
void BaseWavSaver::setBits(int value) {
    
    if (mBits == value) {
    
        return;
    }
    mBits = value;
    bitsChanged(value);
}

int BaseWavSaver::frequency() const {
    return mFrequency;
}
void BaseWavSaver::setFrequency(int value) {
    
    if (mFrequency == value) {
    
        return;
    }
    mFrequency = value;
    frequencyChanged(value);
}
