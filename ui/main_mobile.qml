import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0

import sfxr 1.0

ApplicationWindow {
    id: main
    visible: true
    height: 640
    width: 380

    property real margin: 12
    property SoundItem currentSoundItem: null
    property Sound sound:Sound{}
    property alias exportWrapper: exportManager

    WavSaver {
        id: wavSaver
    }

    ExportWrapper {
        id: exportManager
    }

    SoundPlayer {
        id: soundPlayer
        sound: main.sound
        property bool startup: true
        onSoundChanged: {
            // Hack to avoid playing directly at startup
            if (startup) {
                startup = false;
                return;
            }
            play();
        }
    }

    Generator {
        id: generator
        onSoundGenerated: {
            main.sound = sound
            home.collapseAllExceptCurrent(currentSoundItem)
            currentSoundItem.soundAdded(sound)
        }
    }

    Home {
        id: home
    }

    StackView{
        id:mainStack
        anchors.fill: parent
        initialItem: home
    }

}
