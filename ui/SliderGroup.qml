import QtQuick 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

import sfxr 1.0

ColumnLayout {
    id: root
    property string text
    property Sound sound
    property ListModel model

    property real knobSize: 100
            Label {
                id:lbl
                //Layout.fillWidth: true
                //anchors.left: parent.left
                //Layout.alignment: Qt.AlignLeft
                text: root.text
                font.bold: true

            }

//    RowLayout {
//        id:title
//        width: parent.width
//        //anchors.horizontalCenter: parent.horizontalCenter

//        Label {
//            id:lbl
//            //Layout.fillWidth: true
//            anchors.left: parent.left
//            //Layout.alignment: Qt.AlignLeft
//            text: root.text
//            font.bold: true

//        }
//        Rectangle {
//            height: 1
//            color: "grey"
//            width: root.width
//            anchors.topMargin: 4
//            anchors.top: lbl.bottom
//        }


//    }


    Repeater {
        model: root.model
        //Row {
        // width: parent.width

        Column {
            anchors.horizontalCenter: parent.horizontalCenter

            SoundSlider {
                id: slider
                sound: root.sound
                width:root.width * 0.6
                soundProperty: model.soundProperty
                bipolar: model.bipolar === true

            }

            Label {
                text: model.text
                anchors.horizontalCenter: slider.horizontalCenter
            }

        }

    }

}
