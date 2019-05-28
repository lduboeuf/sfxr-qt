import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3

import sfxr 1.0

Page {

    id:homeEffect
    topPadding: 12

    header:RowLayout{
        id:headerRow
        height: titleLbl.implicitHeight * 3

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
                source: "/assets/home.svg"
            }
            onClicked:{
                soundPlayer.loop = checked;
                mainStack.pop()
            }

//                    ColorOverlay {
//                            id: overlay
//                            anchors.fill: navImage
//                            source: navImage
//                            color: "black"
//                        }


         }




//        ToolButton {
//            //visible: mainStack.depth > 1
//            anchors.left: parent.left
//            anchors.verticalCenter: parent.verticalCenter
//            text: "◀"
//            scale:1.5
//            onClicked:{
//                soundPlayer.loop = checked;
//                mainStack.pop()
//            }

//        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Label {
                id:titleLbl
                text: qsTr("sound: ") + root.selectedSoundName
            }

            CheckBox {
                implicitHeight: titleLbl.implicitHeight
                text: qsTr("Loop")
                checked: soundPlayer.loop
                indicator.width: implicitHeight
                indicator.height: implicitHeight
                onCheckedChanged: {
                    soundPlayer.loop = checked;
                    soundPlayer.play();
                }
            }
        }


    }


    ColumnLayout {
        id: waveFormRow
        width: parent.width

        Label {
            text: qsTr("Wave form")
        }
        WaveFormSelector {
            width: parent.width
            //Layout.fillWidth: true
            //Layout.maximumWidth: homeEffect.width
            sound: root.sound
        }


    }

//    Item {
//        id:menu
//        visible: false
//        GridLayout{
//            id:menuGrid
//            anchors.centerIn: parent
//            rowSpacing: 12
//            columnSpacing: 12
//            columns: 2
//            scale:1.5


//            Button {
//                Layout.fillWidth: true
//                Layout.fillHeight: true
//                text: qsTr("Enveloppe")
//                onClicked: pageStack.push("qrc:/EnvelopEffect.qml")
//            }

//            Button {
//                Layout.fillWidth: true
//                Layout.fillHeight: true
//                text: qsTr("Frequency")
//                onClicked: pageStack.push("qrc:/FrequencyEffect.qml")
//            }

//            Button {
//                Layout.fillWidth: true
//                Layout.fillHeight: true
//                text: qsTr("Filters")
//                onClicked: pageStack.push("qrc:/FilterEffect.qml")
//            }
//            Button {
//                Layout.fillWidth: true
//                Layout.fillHeight: true
//                text: qsTr("Others")
//                onClicked: pageStack.push("qrc:/OthersEffect.qml")
//            }

//        }

//    }

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
            sound: root.sound
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
            sound: root.sound
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
            sound: root.sound
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
            sound: root.sound
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
                text: qsTr("Repeat")
                sound: root.sound
                model: ListModel {
                    ListElement {
                        text: qsTr("Repeat speed")
                        soundProperty: "repeatSpeed"
                    }
                }
            }

            SliderGroup {
                width: parent.width
                knobSize: swipeView.knobSize
                text: qsTr("Phaser")
                sound: root.sound
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
                sound: root.sound
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
