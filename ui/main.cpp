#include <QApplication>
#include <QIcon>
#include <QDir>
#include <QDebug>
#include <QQmlContext>
#include <QStandardPaths>
#include <QQmlApplicationEngine>

#include "Generator.h"
#include "Sound.h"
#include "SoundListModel.h"
#include "SoundPlayer.h"
#include "WavSaver.h"
#include "Result.h"

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

    qmlRegisterType<Sound>("sfxr", 1, 0, "Sound");
    qmlRegisterType<SoundPlayer>("sfxr", 1, 0, "SoundPlayer");
    qmlRegisterType<Generator>("sfxr", 1, 0, "Generator");
    qmlRegisterType<SoundListModel>("sfxr", 1, 0, "SoundListModel");
    qmlRegisterType<WavSaver>("sfxr", 1, 0, "WavSaver");
    qmlRegisterUncreatableMetaObject(
        WaveForm::staticMetaObject, "sfxr", 1, 0, "WaveForm", "Only enums");

    //WaveForm::registerType();
    Result::registerType();


    QQmlApplicationEngine engine;

#ifdef Q_OS_UBUNTU_TOUCH
    QString localFolder = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    qDebug() << "local folder:" + localFolder;
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
    //clean generated sounds
    QDir d(localFolder);
    d.setNameFilters(QStringList() << "*.*");
    d.setFilter(QDir::Files);
    qDebug() << d.dirName();
    foreach(QString dirFile, d.entryList())
    {
        qDebug() << dirFile;
        d.remove(dirFile);
    }

    engine.rootContext()->setContextProperty("UBUNTU_TOUCH", true);
    engine.rootContext()->setContextProperty("appFolder", localFolder);
#endif

    engine.load(QUrl(QStringLiteral("qrc:/main_mobile.qml")));

    return app.exec();
}
