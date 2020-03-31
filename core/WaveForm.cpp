#include <WaveForm.h>

//#include <QQmlEngine>



WaveForm::Enum WaveForm::random(const std::vector<WaveForm::Enum>& values) {
    int idx = std::rand() % values.size();
    return values.at(idx);
}

//void registerType() {
//    qRegisterMetaType<WaveForm::Enum>();
//    qmlRegisterUncreatableMetaObject(
//        WaveForm::staticMetaObject, "sfxr", 1, 0, "WaveForm", "Only enums");
//}

//} // namespace WaveForm
