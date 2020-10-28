import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3

import sfxr 1.0

Page {

    id:homeEffect

    property Sound initialSound

    topPadding: 12

    header:ToolBar {
        RowLayout{
            id:headerRow
            anchors.fill: parent

            Rectangle {
                width: headerRow.width
                anchors.bottom: headerRow.bottom
                color:"grey"
                height: 1
            }

            ToolButton {
                id: toolButtonLeft
                anchors.left: parent.left
                contentItem: Image {
                    id:navImage
                    fillMode: Image.Pad
                    sourceSize.width: headerRow.height  * 0.4
                    sourceSize.height: headerRow.height  * 0.4
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "/assets/back.svg"
                }
                onClicked:{
                    soundPlayer.loop = checked;
                    mainStack.pop()
                }

                ColorOverlay {
                    anchors.fill: navImage
                    source: navImage
                    color: "white"
                }

            }

            Label {
                id:titleLbl
                anchors.centerIn: parent
                text: main.sound.name
                color: "white"
            }

            ExportHandler{
                anchors.right: parent.right
                width: parent.height
                height: parent.height
            }


        }
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex
        property real knobSize: (swipeView.height - (swipeView.height*0.25)) / 3 //3 knobs max

        PageWrapper {
            //width: parent.width
            implicitHeight: parent.height
            implicitWidth: parent.width
            WaveFormSelector {
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.6
                sound: main.sound
            }
        }

        PageWrapper {
            Column{
                width: swipeView.width

                SliderGroup {
                    id:envelopGroup
                    width:parent.width
                    //anchors.fill: parent.contentItem
                    knobSize: swipeView.knobSize

                    //width: parent.width
                    text: qsTr("Envelop")
                    sound: main.sound
                    model: ListModel {
                        ListElement {
                            text: qsTr("Attack time")
                            soundProperty: "attackTime"
                        }
                        ListElement {
                            text: qsTr("Sustain time")
                            soundProperty: "sustainTime"
                        }
                        ListElement {
                            text: qsTr("Sustain punch")
                            soundProperty: "sustainPunch"
                        }
                        ListElement {
                            text: qsTr("Decay time")
                            soundProperty: "decayTime"
                        }
                    }
                }


                SliderGroup {
                    //Layout.fillWidth: true
                    width:parent.width
                    knobSize: swipeView.knobSize
                    enabled: sound.waveForm === 0
                    text: qsTr("Square")
                    sound: main.sound
                    model: ListModel {
                        ListElement {
                            text: qsTr("Square duty")
                            soundProperty: "squareDuty"
                        }
                        ListElement {
                            text: qsTr("Duty sweep")
                            soundProperty: "dutySweep"
                            bipolar: true
                        }
                    }
                }

            }

        }

        PageWrapper {
            SliderGroup {
                //anchors.fill: parent.contentItem
                width: swipeView.width
                knobSize: swipeView.knobSize
                text: qsTr("Frequency")
                sound: main.sound
                model: ListModel {
                    ListElement {
                        text: qsTr("Start frequency")
                        soundProperty: "baseFrequency"
                    }
                    ListElement {
                        text: qsTr("Min frequency")
                        soundProperty: "minFrequency"
                    }
                    ListElement {
                        text: qsTr("Slide")
                        soundProperty: "slide"
                        bipolar: true
                    }
                    ListElement {
                        text: qsTr("Delta slide")
                        soundProperty: "deltaSlide"
                        bipolar: true
                    }
                    ListElement {
                        text: qsTr("Vibrato depth")
                        soundProperty: "vibratoDepth"
                    }
                    ListElement {
                        text: qsTr("Vibrato speed")
                        soundProperty: "vibratoSpeed"
                    }
                }
            }
        }
        PageWrapper {

            SliderGroup {
                //anchors.fill: parent.contentItem
                knobSize: swipeView.knobSize
                width: swipeView.width
                text: qsTr("Filters")
                sound: main.sound
                model: ListModel {
                    ListElement {
                        text: qsTr("LP filter cutoff")
                        soundProperty: "lpFilterCutoff"
                    }
                    ListElement {
                        text: qsTr("LP filter cutoff sweep")
                        soundProperty: "lpFilterCutoffSweep"
                        bipolar: true
                    }
                    ListElement {
                        text: qsTr("LP filter resonance")
                        soundProperty: "lpFilterResonance"
                    }
                    ListElement {
                        text: qsTr("HP filter cutoff")
                        soundProperty: "hpFilterCutoff"
                    }
                    ListElement {
                        text: qsTr("HP filter cutoff sweep")
                        soundProperty: "hpFilterCutoffSweep"
                        bipolar: true
                    }
                }
            }

        }
        PageWrapper {
            Column{
                width: swipeView.width
                Layout.fillHeight: true

                SliderGroup {
                    width: parent.width
                    knobSize: swipeView.knobSize
                    text: qsTr("Phaser")
                    sound: main.sound
                    model: ListModel {
                        ListElement {
                            text: qsTr("Phaser offset")
                            soundProperty: "phaserOffset"
                            bipolar: true
                        }
                        ListElement {
                            text: qsTr("Phaser sweep")
                            soundProperty: "phaserSweep"
                            bipolar: true
                        }
                    }
                }


                SliderGroup {
                    width: parent.width
                    knobSize: swipeView.knobSize
                    text: qsTr("Change")
                    sound: main.sound
                    model: ListModel {
                        ListElement {
                            text: qsTr("Change amount")
                            soundProperty: "changeAmount"
                            bipolar: true
                        }
                        ListElement {
                            text: qsTr("Change speed")
                            soundProperty: "changeSpeed"
                        }
                    }
                }
                SliderGroup {
                    width: parent.width
                    knobSize: swipeView.knobSize
                    text: qsTr("Repeat")
                    sound: main.sound
                    model: ListModel {
                        ListElement {
                            text: qsTr("Repeat speed")
                            soundProperty: "repeatSpeed"
                        }
                    }
                }
            }


        }
    }


    Item {
        id: menu
        width: headerRow.height
        y: homeEffect.height / 3
        anchors.right: parent.right
        property double itemDimension: headerRow.height


        Column {
            spacing: 12
            RoundButton {
                id:playBtn
                contentItem:Image {
                    id:playImg
                    fillMode: Image.Pad
                    opacity: 0
                    sourceSize.width: menu.itemDimension  * 0.4
                    sourceSize.height: menu.itemDimension  * 0.4
                    source: "/assets/play.svg"
                }
                background: Rectangle {
                    radius: playBtn.radius
                    color: Qt.darker("#cccccc")
                }
                ColorOverlay {
                    anchors.fill: playImg
                    source: playImg
                    opacity: playBtn.pressed ? 0.5: 1
                    color: "white"
                }
                onClicked: soundPlayer.play();

            }

            RoundButton {
                id:resetBtn
                contentItem: Image {
                    id:resetImg
                    fillMode: Image.Pad
                    sourceSize.width: menu.itemDimension  * 0.4
                    sourceSize.height: menu.itemDimension  * 0.4
                    source: "/assets/undo.svg"
                }
                background: Rectangle {
                    radius: resetBtn.radius
                    color: Qt.darker("#cccccc")
                }
                ColorOverlay {
                    anchors.fill: resetImg
                    source: resetImg
                    color: "white"
                }
                onClicked: {
                    main.sound.resetWith(initialSound);
                }
            }

            RoundButton {
                id:loopBtn
                //enabled: false
                contentItem: Image {
                    id:loopImg
                    fillMode: Image.Pad
                    sourceSize.width: menu.itemDimension  * 0.4
                    sourceSize.height: menu.itemDimension * 0.4
                    source: "/assets/loop.svg"
                }
                background: Rectangle {
                    radius: loopBtn.radius
                    color: Qt.darker("#cccccc")
                }
                onClicked: {
                    soundPlayer.loop = !soundPlayer.loop;
                    if (soundPlayer.loop)
                        soundPlayer.play();


                }

                ColorOverlay {
                    anchors.fill: loopImg
                    opacity: (soundPlayer.loop) ? 1 : 0.4
                    source: loopImg
                    color: "white"
                }

            }


        }

    }





    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        background: Rectangle {
            color:"#333333"
        }

        TabButton {
            text: qsTr("Wave Form")
        }
        TabButton {
            text: qsTr("Envelop")
        }
        TabButton {
            text: qsTr("Frequency")
        }
        TabButton {
            text: qsTr("Filters")
        }
        TabButton {
            text: qsTr("Others")
        }
    }

    Component.onCompleted: {
        initialSound = generator.duplicate(main.sound)
    }


}
