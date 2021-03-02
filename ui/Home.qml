import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3

import sfxr 1.0

Page {
    id: home
    spacing: 16

    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            ToolButton {
                visible: false
                //fake item for position ok
            }

            Label {
                text: qsTr("Sfxr")
                font.bold: true
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            ToolButton {
                id: infoBtn
                //Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
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

            Column {
                id: soundlist
                width: flickable.width
                spacing: 2

                SoundItem {
                    id:randomSounds
                    text: qsTr("Randomize")
                    width: parent.width
                    onTriggered: {
                        currentSoundItem = this
                        generator.randomize(sound.waveForm);
                    }
                }

                SoundItem {
                    text: qsTr("Simple Sound")
                    width: parent.width
                    onTriggered: {
                        currentSoundItem = this
                        generator.generateEmpty();
                    }
                }

                SoundItem {
                    id: pickupSounds
                    text: qsTr("Pickup/Coin")
                    width: parent.width
                    onTriggered: {
                        currentSoundItem = this
                        generator.generatePickup();
                    }
                }

                SoundItem {
                    text: qsTr("Laser/Shoot")
                    width: parent.width
                    onTriggered: {
                        currentSoundItem = this
                        generator.generateLaser();
                    }
                }

                SoundItem {
                    text: qsTr("Explosion")
                    width: parent.width
                    onTriggered: {
                        currentSoundItem = this
                        generator.generateExplosion();
                    }
                }

                SoundItem {
                    text: qsTr("Power Up")
                    width: parent.width
                    onTriggered: {
                        currentSoundItem = this
                        generator.generatePowerup();
                    }
                }

                SoundItem {
                    text: qsTr("Hit/Hurt")
                    width: parent.width
                    onTriggered: {
                        currentSoundItem = this
                        generator.generateHitHurt();
                    }
                }

                SoundItem {
                    text: qsTr("Jump")
                    width: parent.width
                    onTriggered: {
                        currentSoundItem = this
                        generator.generateJump();
                    }
                }

                SoundItem {
                    text: qsTr("Blip/Select")
                    width: parent.width
                    onTriggered: {
                        currentSoundItem = this
                        generator.generateBlipSelect();
                    }
                }

            }
        }
        Rectangle {
            id:soundHome
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#1a1a2e"

            property int index: 0
            property int nbSound: 0

            Rectangle {
                width: parent.width
                height: 4
                color:Qt.lighter("#1a1a2e")
            }

            ToolBar {
                id: toolbar
                visible: main.sound && main.soundListModel.count > 0
                width: parent.width

                Rectangle {
                    color: "#1a1a2e"
                    anchors.fill: parent
                    ToolButton {
                        id: sliderBack
                        //enabled: slider.currentIndex >0
                        visible: slider.currentIndex < slider.count -1

                        anchors.left: parent.left
                        contentItem: Image {
                            id:sliderBackImg
                            fillMode: Image.Pad
                            sourceSize.width: header.height  * 0.4
                            sourceSize.height: header.height  * 0.4
                            source: "/assets/back.svg"
                        }
                        onClicked:{
                            slider.incrementCurrentIndex()
                        }
                    }
                    Label {
                        id: soundTitle
                        text: main.sound.name + "#" + (slider.count - slider.currentIndex)
                        color:"#e94560"
                        font.bold: true
                        minimumPointSize: 12
                        elide: Label.ElideRight
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    HomeButton {
                        id:mutBtn
                        name: qsTr("MUT")
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: sliderNext.left
                        anchors.rightMargin: 12
                        onClicked: generator.mutate(main.sound);
                    }
                    ToolButton {
                        id: sliderNext
                        anchors.right: parent.right
                        //enabled: slider.currentIndex < slider.count -1
                        visible: slider.currentIndex >0
                        contentItem: Image {
                            id:sliderNextImg
                            fillMode: Image.Pad
                            sourceSize.width: header.height  * 0.4
                            sourceSize.height: header.height  * 0.4
                            source: "/assets/next.svg"
                        }
                        onClicked:{
                            slider.decrementCurrentIndex()
                        }
                    }

                }
                Rectangle {
                    width: parent.width
                    height: 2
                    //anchors.top: toolbar
                    anchors.topMargin: -1
                    color: "#16213e"
                }
            }

            Label {
                id: lblPlaceHolder
                visible: main.soundListModel.count == 0
                anchors.centerIn: parent
                text: qsTr("Pick a sound")
                padding: 16
            }

            SwipeView{
                id:slider

                property int currentCount: 0

                anchors {
                    top: toolbar.bottom
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                    margins: 16
                }
                currentIndex:  slider.count - 1
                clip:true//setting it make item outside of view invisible
                Repeater {
                    model:main.soundListModel
                    Item {
                        id: soundSelection
                        property int btnSize: width / 4
                        RowLayout {

                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            //anchors.margins: 36
                            spacing: 16
                            HomeButton {
                                id:playBtn
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                Layout.minimumWidth: btnSize
                                Layout.minimumHeight: btnSize

                                contentItem: Image {
                                    id: playImg
                                    fillMode: Image.Pad
                                    sourceSize.width: btnSize / 2
                                    sourceSize.height: btnSize / 2
                                    source: "/assets/play.svg"
                                }

                                ColorOverlay {
                                    anchors.fill: playImg
                                    source: playImg
                                    color: "white"
                                }

                                onClicked: {
                                    soundPlayer.play()
                                }
                            }
                            HomeButton {
                                id:effectBtn
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                Layout.minimumWidth: btnSize
                                Layout.minimumHeight: btnSize
                                contentItem: Image {
                                    id: arrowImg
                                    sourceSize.width: btnSize / 2
                                    sourceSize.height: btnSize / 2
                                    fillMode: Image.Pad
                                    source: "/assets/tune.svg"
                                }

                                ColorOverlay {
                                    anchors.fill: arrowImg
                                    source: arrowImg
                                    color: "white"
                                }

                                onClicked: {
                                    mainStack.push("qrc:/SoundBoard.qml")
                                }
                            }
                        }
                        RowLayout {
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom

                            ToolButton {
                                id: share
                                contentItem: Image {
                                    id:shareImg
                                    fillMode: Image.Pad
                                    sourceSize.width: header.height  * 0.4
                                    sourceSize.height: header.height  * 0.4
                                    source: "/assets/share.svg"
                                }
                                onClicked:{
                                    main.exportWrapper.save()
                                }
                            }

                            ToolButton {
                                id: remove
                                //anchors.right: parent.right
                                contentItem: Image {
                                    id:removeImg
                                    fillMode: Image.Pad
                                    sourceSize.width: header.height  * 0.4
                                    sourceSize.height: header.height  * 0.4
                                    source: "/assets/edit-delete.svg"
                                }
                                onClicked:{
                                    main.soundListModel.remove(slider.currentIndex);
                                }

                            }
                        }
                    }
                }

                onCurrentIndexChanged: {
                    if (currentIndex > -1) {
                        main.sound = main.soundListModel.soundForRow(currentIndex)
                        soundPlayer.play();
                    }
                }

            }
        }
    }
}
