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
    property alias soundListModel: soundListModel
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
    }

    SoundListModel {
        id: soundListModel
    }


    Generator {
        id: generator
        onSoundGenerated: {
            main.sound = sound
            soundListModel.addNew(sound)
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
