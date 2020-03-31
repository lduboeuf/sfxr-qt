import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3

import sfxr 1.0

Page {

    id:homeEffect
    topPadding: 12

    header:ToolBar {
        RowLayout{
            id:headerRow
            anchors.fill: parent

            Rectangle {
                width: parent.width
                anchors.bottom: parent.bottom
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
                text: qsTr("sound: ") + main.sound.name
                color: titleLblMouseArea.pressed ? Qt.darker("white") : "white"

                MouseArea {
                    id:titleLblMouseArea
                    anchors.fill: parent
                    onClicked:soundPlayer.play();
                }

                Image {
                    id:playImg
                    fillMode: Image.Pad
                    opacity: 0
                    sourceSize.width: headerRow.height  * 0.4
                    sourceSize.height: headerRow.height  * 0.4
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "/assets/play.svg"
                }

                ColorOverlay {
                    anchors.fill: playImg
                    source: playImg
                    opacity: titleLblMouseArea.pressed ? 1: 0
                    color: "white"
                }
            }

            ToolButton {
                id: menuButton
                //anchors.right:  parent.right
                anchors.right: parent.right
                width:headerRow.height
                //height: width
                text: "⋮"
                onClicked: menu.open()

                Menu {
                    id: menu
                    width: menuButton.width
                    y: menuButton.height

                    MenuItem {
                        text: "Loop"
                        ToolButton {
                            id:loopBtn
                            //enabled: false
                            contentItem: Image {
                                id:loopImg
                                fillMode: Image.Pad
                                sourceSize.width: headerRow.height  * 0.4
                                sourceSize.height: headerRow.height  * 0.4
                                anchors.centerIn: loopBtn
                                source: "/assets/loop.svg"
                            }
                            onClicked: {
                                soundPlayer.loop = !soundPlayer.loop;
                                if (soundPlayer.loop)
                                    soundPlayer.play();

                               // menu.close()

                            }


                            ColorOverlay {
                                anchors.fill: loopImg
                                opacity: (soundPlayer.loop) ? 1 : 0.4
                                source: loopImg
                                color: "white"
                            }

                        }
                    }

                    MenuItem {
                        text: "Export"
                        ExportHandler{
                            id:exportHandler
                            width: menuButton.width
                            height: menuButton.height
                        }

                        ColorOverlay {
                            anchors.fill: exportHandler
                            source: exportHandler
                            color: "white"
                        }

                    }

                    enter: Transition {
                        NumberAnimation { property: "opacity"; from: 0.0; to: 1.0 }
                    }

                }


            }

        }
    }

    ColumnLayout {
        id: waveFormRow
        width: parent.width
        Layout.fillWidth: true

        Label {
            text: qsTr("Wave form")
            font.bold: true
        }
        WaveFormSelector {
            width: waveFormRow.width
            sound: main.sound
        }


    }


    SwipeView {
        id: swipeView
        anchors {
            top: waveFormRow.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            //margins: 12
        }
        currentIndex: tabBar.currentIndex
        property real knobSize: (swipeView.height - (swipeView.height*0.25)) / 3 //3 knobs max

        Column{
            anchors.fill: parent.contentItem

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
                enabled: sound.waveType === 0
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

        SliderGroup {
            anchors.fill: parent.contentItem
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
        SliderGroup {
            anchors.fill: parent.contentItem
            knobSize: swipeView.knobSize
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

        Column{
            anchors.fill: parent.contentItem

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

        // FrequencyEffect{}
        // FilterEffect{}
        // OthersEffect{}

    }



    //    StackView {
    //        id:pageStack
    //        anchors {
    //            top: waveFormRow.bottom
    //            left: parent.left
    //            right: parent.right
    //            bottom: parent.bottom
    //            margins: 12
    //        }
    //        pushEnter: Transition {
    //            PropertyAnimation {
    //                property: "opacity"
    //                from: 0
    //                to:1
    //                duration: 200
    //            }
    //            PropertyAnimation {
    //                property: "x"
    //                from: pageStack.width / 2
    //                //to:0
    //                duration: 200
    //            }
    //            PropertyAnimation {
    //                property: "y"
    //                from: pageStack.height / 2
    //                //to:0
    //                duration: 200
    //            }
    ////            PropertyAnimation {
    ////                property: "width"
    ////                from: 1
    ////                //to:pageStack.width
    ////                duration: 200
    ////            }
    ////            PropertyAnimation {
    ////                property: "height"
    ////                from: 1
    ////                //to:pageStack.height
    ////                duration: 200
    ////            }
    //            PropertyAnimation {
    //                property: "scale"
    //                from: 0
    //                to:1
    //                //to:pageStack.height
    //                duration: 200
    //            }
    //        }
    //        pushExit: Transition {
    //            PropertyAnimation {
    //                property: "opacity"
    //                from: 1
    //                to:0
    //                duration: 200
    //            }
    //        }
    //        popExit: Transition {
    //                PropertyAnimation {
    //                    property: "width"
    //                    to:1
    //                    duration: 200
    //                }
    //                PropertyAnimation {
    //                    property: "height"
    //                    to:1
    //                    duration: 200
    //                }
    //                PropertyAnimation {
    //                    property: "x"
    //                    to:pageStack.width / 2
    //                    duration: 200
    //                }
    //                PropertyAnimation {
    //                    property: "y"
    //                    to:pageStack.height / 2
    //                    duration: 200
    //                }

    //            }
    //        popEnter: Transition {
    //                PropertyAnimation {
    //                    property: "opacity"
    //                    from: 0
    //                    to:1
    //                    duration: 200
    //                }
    //            }
    //        initialItem:menu

    //    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        background: Rectangle {
            color:"#333333"
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


}
