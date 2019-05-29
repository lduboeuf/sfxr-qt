#include <QApplication>
#include <QIcon>
#include <QDir>
#include <QDebug>
#include <QQmlContext>
#include <QStandardPaths>
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
    app.setOrganizationName("me.lduboeuf.sfxr");
    app.setApplicationName("sfxr");
    app.setApplicationDisplayName("SFXR Qt");


    QIcon icon;
    for(int size: {16, 32, 48}) {
        icon.addFile(QString(":/icons/sfxr-qt-%1.png").arg(size));
    }
    app.setWindowIcon(icon);

    QQmlApplicationEngine engine;

#ifdef Q_OS_UBUNTU_TOUCH
    QString localFolder = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QFileInfo uDir(localFolder);
    if (!uDir.exists())
    {
        // The modules directory doesn't exist, lets create it.
        qDebug() << "Creating directory " << QDir::toNativeSeparators(uDir.filePath());
        if (!QDir("/").mkpath(uDir.filePath()))
        {
            throw std::runtime_error(QString("Could not create directory: " +uDir.filePath()).toStdString());
        }
        QFileInfo uDir2(localFolder);
        if (!uDir2.isWritable())
        {
            throw std::runtime_error(QString("Directory is not writable: " +uDir2.filePath()).toStdString());
        }
    }
    engine.rootContext()->setContextProperty("UBUNTU_TOUCH", true);
    engine.rootContext()->setContextProperty("appFolder", localFolder);
#endif


    qmlRegisterType<Sound>("sfxr", 1, 0, "Sound");
    qmlRegisterType<SoundPlayer>("sfxr", 1, 0, "SoundPlayer");
    qmlRegisterType<Generator>("sfxr", 1, 0, "Generator");
    qmlRegisterType<SoundListModel>("sfxr", 1, 0, "SoundListModel");
    qmlRegisterType<WavSaver>("sfxr", 1, 0, "WavSaver");
    engine.load(QUrl(QStringLiteral("qrc:/main_mobile.qml")));

    return app.exec();
}
