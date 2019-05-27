#include <QApplication>
#include <QIcon>
#include <QQmlApplicationEngine>

#include "generator.h"
#include "soundlistmodel.h"
#include "sound.h"
#include "soundplayer.h"
#include "wavsaver.h"

#include <SDL.h>

int main(int argc, char* argv[]) {

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);
    app.setOrganizationDomain("agateau.com");
    app.setApplicationName("sfxr-qt");
    app.setApplicationDisplayName("SFXR Qt");


    QIcon icon;
    for(int size: {16, 32, 48}) {
        icon.addFile(QString(":/icons/sfxr-qt-%1.png").arg(size));
    }
    app.setWindowIcon(icon);

    QQmlApplicationEngine engine;
    qmlRegisterType<Sound>("sfxr", 1, 0, "Sound");
    qmlRegisterType<SoundPlayer>("sfxr", 1, 0, "SoundPlayer");
    qmlRegisterType<Generator>("sfxr", 1, 0, "Generator");
    qmlRegisterType<SoundListModel>("sfxr", 1, 0, "SoundListModel");
    qmlRegisterType<WavSaver>("sfxr", 1, 0, "WavSaver");
    engine.load(QUrl(QStringLiteral("qrc:/main_mobile.qml")));

    return app.exec();
}
