import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
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

    WavSaver {
        id: wavSaver
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



    RowLayout {
        id:headerRow
        width:parent.width
        height: title.implicitHeight * 2

        ToolButton {
            id: backBtn
            visible: mainStack.depth > 1
            anchors.left:  parent.left
            anchors.verticalCenter: headerRow.verticalCenter
            contentItem: Image {
                id:backImg
                fillMode: Image.Pad
                sourceSize.width: headerRow.height  * 0.4
                sourceSize.height: headerRow.height  * 0.4
                source: "/assets/back.svg"
            }
            onClicked:{

                mainStack.pop()

            }

            ColorOverlay {
                anchors.fill: backImg
                source: backImg
                color: "white"
            }

         }



        Label {
            id:title
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: qsTr("Sfxr")
            font.bold: true
        }

        ToolButton {
            id: infoBtn
            anchors.right:  parent.right
            anchors.verticalCenter: headerRow.verticalCenter
            contentItem: Image {
                id:helpImg
                fillMode: Image.Pad
                sourceSize.width: headerRow.height  * 0.4
                sourceSize.height: headerRow.height  * 0.4
                source: "/assets/info.svg"
            }
            onClicked:{

                mainStack.push("qrc:/About.qml")

            }

            ColorOverlay {
                anchors.fill: helpImg
                source: helpImg
                color: "white"
            }

         }



    }

    Rectangle {
        width: parent.width
        anchors.top: headerRow.bottom
        color:"grey"
        height: 1
    }


    Item {
        id:container


        ColumnLayout {

            anchors.fill: parent
            anchors.topMargin: headerRow.height + 12


            spacing: 24

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
