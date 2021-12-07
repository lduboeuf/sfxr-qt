import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3

import sfxr 1.0

Page {
    id: home
    spacing: 16

    header: ToolBar {
        Label {
            text: qsTr("Sfxr")
            font.bold: true
            anchors.centerIn: parent
        }

        ToolButton {
            id: infoBtn
            anchors.right: parent.right
            contentItem: Image {
                id:helpImg
                fillMode: Image.Pad
                sourceSize.width: header.height  * 0.4
                sourceSize.height: header.height  * 0.4
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

    ExportWrapper {
        id: exportWrapper
    }

    GridLayout {
        anchors.fill: parent
        anchors.margins: 2
        rowSpacing: 20
        columnSpacing: 2
        flow:  width > height ? GridLayout.LeftToRight : GridLayout.TopToBottom
        Flickable {
            id: flickable
            property int padding: 6
            flickableDirection: Flickable.VerticalFlick
            ScrollBar.vertical: ScrollBar {
                width: 4
                active: true;
            }

            Layout.fillWidth: true
            Layout.fillHeight: true
            contentWidth: parent.width
            contentHeight: soundlist.height

            GridLayout {
                id: soundlist
                columns: 2
                width: flickable.width
                height: flickable.height
                columnSpacing: 4
                rowSpacing: 4

                HomeButton {
                    id:randomSounds
                    name: qsTr("Randomize")
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    onClicked: {
                        currentSoundItem = this
                        generator.randomize(sound.waveForm);
                    }
                }

                HomeButton {
                    name: qsTr("Simple Sound")
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    onClicked: {
                        console.log('kikou Simple Sound')
                        currentSoundItem = this
                        generator.generateEmpty();
                    }
                }

                HomeButton {
                    id: pickupSounds
                    name: qsTr("Pickup/Coin")
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    onClicked: {
                        currentSoundItem = this
                        generator.generatePickup();
                    }
                }

                HomeButton {
                    name: qsTr("Laser/Shoot")
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    onClicked: {
                        currentSoundItem = this
                        generator.generateLaser();
                    }
                }

                HomeButton {
                    name: qsTr("Explosion")
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    onClicked: {
                        currentSoundItem = this
                        generator.generateExplosion();
                    }
                }

                HomeButton {
                    name: qsTr("Power Up")
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    onClicked: {
                        currentSoundItem = this
                        generator.generatePowerup();
                    }
                }

                HomeButton {
                    name: qsTr("Hit/Hurt")
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    onClicked: {
                        currentSoundItem = this
                        generator.generateHitHurt();
                    }
                }

                HomeButton {
                    name: qsTr("Jump")
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    onClicked: {
                        currentSoundItem = this
                        generator.generateJump();
                    }
                }

                HomeButton {
                    name: qsTr("Blip/Select")
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    onClicked: {
                        currentSoundItem = this
                        generator.generateBlipSelect();
                    }
                }

            }
        }

        Rectangle {
            id:soundHome
            width: parent.width

            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#1a1a2e"

            property int index: 0
            property int nbSound: 0

            Rectangle {
                id:separator
                width: parent.width
                height: 4
                color:Qt.lighter("#1a1a2e")
            }

            Label {
                id: lblPlaceHolder
                visible: main.soundListModel.count == 0
                anchors.centerIn: parent
                text: qsTr("Pick a sound")
                padding: 16
            }


            ListView {
                id: listView
                anchors {
                    top: separator.bottom
                    right: parent.right
                    left: parent.left
                    bottom: parent.bottom
                }
                model:main.soundListModel
                onCountChanged: currentIndex = 0
                delegate: Rectangle {
                    id: soundRow
                    color: soundRowMouseArea.pressed ? Qt.lighter("#1a1a2e") : "#1a1a2e"
                    width: parent.width
                    height: soundTitle.implicitHeight * 3

                    MouseArea {
                        id: soundRowMouseArea
                        anchors.fill: parent
                        onClicked: {
                            listView.currentIndex = index
                            main.sound = model.sound
                            soundPlayer.play();
                        }
                    }

                    HomeButton {
                        id:mutBtn
                        name: qsTr("MUT")
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: soundRow.left
                        anchors.leftMargin: 12
                        onClicked: generator.mutate(model.sound);
                    }
                    Label {
                        id: soundTitle
                        text: model.text + "#" + (listView.count - index)
                        color:"#e94560"
                        font.bold: true
                        minimumPointSize: 12
                        elide: Label.ElideRight
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: mutBtn.right
                        anchors.leftMargin: 12
                    }

                    Image {
                        id: playImg
                        anchors.centerIn: parent
                        fillMode: Image.Pad
                        sourceSize.width: soundRow.height / 2
                        sourceSize.height: soundRow.height / 2
                        source: "/assets/play.svg"
                    }
                    ColorOverlay {
                        anchors.fill: playImg
                        source: playImg
                        //color: soundRow.color
                        color: soundPlayer.playing && listView.currentIndex == index ? Qt.lighter("#1a1a2e") : "#1a1a2e"
                    }

                    Row {
                        anchors.right: soundRow.right
                        height: soundRow.height

                        ToolButton {
                            id:effectBtn
                            anchors.verticalCenter: parent.verticalCenter
                            contentItem: Image {
                                id: arrowImg
                                fillMode: Image.Pad
                                sourceSize.width: soundRow.height  / 2
                                sourceSize.height: soundRow.height  / 2
                                //fillMode: Image.Pad
                                source: "/assets/tune.svg"
                            }

                            onClicked: {
                                mainStack.push("qrc:/SoundBoard.qml")
                            }
                            ColorOverlay {
                                anchors.fill: arrowImg
                                source: arrowImg
                                color: "white"
                            }
                        }
                        ToolButton {
                            id: share
                            anchors.verticalCenter: parent.verticalCenter
                            contentItem: Image {
                                id:shareImg
                                fillMode: Image.Pad
                                sourceSize.width: soundRow.height  * 0.4
                                sourceSize.height: soundRow.height  * 0.4
                                source: "/assets/share.svg"
                            }
                            onClicked:{
                                main.exportWrapper.save()
                            }
                            ColorOverlay {
                                anchors.fill: shareImg
                                source: shareImg
                                color: "white"
                            }
                        }

                    }
                    Rectangle {
                        width: parent.width
                        height: 1
                        color:Qt.lighter("#1a1a2e")
                    }
                }

                add: Transition {
                    NumberAnimation { property: "opacity"; from: 0; to: 1.0; duration: 400 }
                }
            }

        }

    }

}
