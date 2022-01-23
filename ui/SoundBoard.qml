import QtQuick 2.0
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3

import sfxr 1.0

Page {

    id:homeEffect

    property Sound initialSound
    spacing: 16
    header: ToolBar {
        ToolButton {
            id: toolButtonLeft
            contentItem: Image {
                id:navImage
                fillMode: Image.Pad
                sourceSize.width: header.height  * 0.4
                sourceSize.height: header.height  * 0.4
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
            text: main.sound.name
            elide: Label.ElideRight
            anchors.centerIn: parent
        }

        Row {
            anchors.right: parent.right
            ToolButton {
                id: infoBtn
                visible: tabBar.currentIndex > 0
                contentItem: Image {
                    id:helpImg
                    fillMode: Image.Pad
                    sourceSize.width: header.height  * 0.4
                    sourceSize.height: header.height  * 0.4
                    source: "/assets/help.svg"
                }
                onClicked:{
                    help.toggle()
                }

                ColorOverlay {
                    anchors.fill: helpImg
                    source: helpImg
                    color: "white"
                }
            }

            ToolButton {
                id: exportBtn
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

                ColorOverlay {
                    anchors.fill: shareImg
                    source: shareImg
                    color: "white"
                }
            }
        }
    }

    Item {
        id: help

        function toggle() {

            if (helpPopup.visible) {
                helpPopup.close()
                return;
            }
            helpPopup.content = ""
            //"Envelop", "Frequency", "Filters", "Others"
            if (tabBar.currentIndex==1) {
                helpPopup.content = helpPopup.envelopHelp
            } else if (tabBar.currentIndex==2) {
                helpPopup.content = helpPopup.frequencyHelp
            } else if (tabBar.currentIndex==3) {
                helpPopup.content = helpPopup.filtersHelp
            } else if (tabBar.currentIndex==4) {
                helpPopup.content = helpPopup.othersHelp
            }

            if (helpPopup.content !== "") {
                helpPopup.open()
            }
        }
    }

    Helps{ id: helpPopup}

    SwipeView {
        id: swipeView
        anchors.fill: parent

        currentIndex: tabBar.currentIndex
        property real knobSize: (swipeView.height - (swipeView.height*0.25)) / 3 //3 knobs max

        Flickable {
            id: waveFormPage
            height: swipeView.height
            width: swipeView.width
            contentWidth: width
            contentHeight: waveFormSelector.height
            flickableDirection: Flickable.VerticalFlick

            WaveFormSelector {
                id:waveFormSelector
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.6
                sound: main.sound
            }
        }

        Flickable {
            id: envelopPage
            height: swipeView.height
            width: swipeView.width
            contentWidth: width
            contentHeight: contentItem.height
            flickableDirection: Flickable.VerticalFlick
            Column{
                width: swipeView.width

                SliderGroup {
                    id:envelopGroup
                    width:parent.width
                    knobSize: swipeView.knobSize

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

        Flickable {
            id: frequencyPage
            height: swipeView.height
            width: swipeView.width
            contentWidth: width
            contentHeight: contentItem.height
            flickableDirection: Flickable.VerticalFlick
            SliderGroup {
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
        Flickable {
            id: filtersPage
            height: swipeView.height
            width: swipeView.width
            contentWidth: width
            contentHeight: contentItem.height
            flickableDirection: Flickable.VerticalFlick

            SliderGroup {
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
        Flickable {
            id: othersPage
            height: swipeView.height
            width: swipeView.width
            contentWidth: width
            contentHeight: contentItem.height
            flickableDirection: Flickable.VerticalFlick
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
        width: header.height
        //y: header.height * 2
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 50

        property double itemDimension: header.height

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
                    opacity: soundPlayer.playing ? 1 : 0.5
                    color: "white"
                }
                onClicked: soundPlayer.play();

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
                }
                onPressAndHold: {
                    soundPlayer.loop = true
                    popup.open()
                    loopTimeSlider.visible = true
                }

                ColorOverlay {
                    anchors.fill: loopImg
                    opacity: (soundPlayer.loop) ? 1 : 0.4
                    source: loopImg
                    color: "white"
                }

                Popup {
                    id: popup

                    parent: Overlay.overlay
                    //x: Math.round((parent.width - width) * 0.7)
                    x: menu.x - width
                    //y: Math.round((parent.height - height) / 2)
                    y: menu.y

                    Column {

                        width: parent.width
                        Label {
                            //width: parent.width
                            anchors.horizontalCenter: popup.horizontalCenter
                            color: "white"
                            text: qsTr("loop speed")
                        }

                        Slider {
                            id: loopTimeSlider
                            width: parent.width
                            anchors.horizontalCenter: popup.horizontalCenter
                            orientation: Qt.Vertical

                            from: 0.2
                            to:0.8
                            value: soundPlayer.loopTime
                            onValueChanged: {
                                soundPlayer.loopTime = value;
                            }
                            stepSize: 0.1

                        }
                    }
                }

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


        }

    }


    footer: TabBar {
        id: tabBar
        currentIndex: 0

        onCurrentIndexChanged: console.log("olala ", currentIndex)
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
