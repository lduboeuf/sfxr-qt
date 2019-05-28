import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2

import sfxr 1.0

ApplicationWindow {
    id: root
    visible: true
    height: 640
    width: 380

    property string selectedSoundName



    property real margin: 12



    property Sound sound: {
        var row = soundListView.currentIndex;
        row >= 0 ? soundListModel.soundForRow(row) : null;
    }

    SoundPlayer {
        id: soundPlayer
        sound: root.sound
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

    SoundListModel {
        id: soundListModel
    }

    Generator {
        id: generator
        onSoundGenerated: {
            soundListModel.addNew(sound);
            soundListView.currentIndex = 0;
        }
    }

    Item {
        id:container

        ColumnLayout {

            anchors.fill: parent
            spacing: 24


            Label {
                id:title
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("sfxr")
                font.pixelSize: Qt.application.font.pixelSize * 1.2
            }

            Rectangle {
                width: parent.width
                anchors.bottom: title.bottom
                color:"grey"
                height: 1
            }



            SoundSampleGenerators{
                id: generators
                anchors.horizontalCenter: parent.horizontalCenter
                generator: generator
                sound: root.sound
            }

            SoundListView {
                id: soundListView
                model: soundListModel
                Layout.fillWidth: true
                Layout.fillHeight: true
                onCurrentSoundClicked: {
                    soundPlayer.play();
                }
                onSoundSelected: {
                    root.selectedSoundName = soundName
                    mainStack.push("qrc:/SoundBoard.qml")
                }
            }
        }
    }

    StackView{
        id:mainStack
        anchors.fill: parent
        initialItem: container
    }






}
