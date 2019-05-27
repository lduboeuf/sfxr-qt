import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import sfxr 1.0

Page {

    id:homeEffect
    topPadding: 12

    header:RowLayout{

        height: titleLbl.implicitHeight * 3

        Rectangle {
            width: parent.width
            anchors.bottom: parent.bottom
            color:"grey"
            height: 1
        }

        ToolButton {
            //visible: mainStack.depth > 1
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            text: "◀"
            scale:1.5
            onClicked:{
                soundPlayer.loop = checked;
                mainStack.pop()
            }

        }

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

    Item {
        id:menu
        GridLayout{
            id:menuGrid
            anchors.centerIn: parent
            rowSpacing: 12
            columnSpacing: 12
            columns: 2
            scale:1.5


            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: qsTr("Enveloppe")
                onClicked: pageStack.push("qrc:/EnvelopEffect.qml")
            }

            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: qsTr("Frequency")
                onClicked: pageStack.push("qrc:/FrequencyEffect.qml")
            }

            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: qsTr("Filters")
                onClicked: pageStack.push("qrc:/FilterEffect.qml")
            }
            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: qsTr("Others")
                onClicked: pageStack.push("qrc:/OthersEffect.qml")
            }

        }

    }




    StackView {
        id:pageStack
        anchors {
            top: waveFormRow.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            margins: 12
        }
        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 200
            }
            PropertyAnimation {
                property: "x"
                from: pageStack.width / 2
                //to:0
                duration: 200
            }
            PropertyAnimation {
                property: "y"
                from: pageStack.height / 2
                //to:0
                duration: 200
            }
//            PropertyAnimation {
//                property: "width"
//                from: 1
//                //to:pageStack.width
//                duration: 200
//            }
//            PropertyAnimation {
//                property: "height"
//                from: 1
//                //to:pageStack.height
//                duration: 200
//            }
            PropertyAnimation {
                property: "scale"
                from: 0
                to:1
                //to:pageStack.height
                duration: 200
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 200
            }
        }
        popExit: Transition {
                PropertyAnimation {
                    property: "width"
                    to:1
                    duration: 200
                }
                PropertyAnimation {
                    property: "height"
                    to:1
                    duration: 200
                }
                PropertyAnimation {
                    property: "x"
                    to:pageStack.width / 2
                    duration: 200
                }
                PropertyAnimation {
                    property: "y"
                    to:pageStack.height / 2
                    duration: 200
                }

            }
        popEnter: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 0
                    to:1
                    duration: 200
                }
            }
        initialItem:menu

    }

}
