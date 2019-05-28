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


    RowLayout {
        id:title
        width: parent.width

        Label {
            id:lbl
            Layout.fillWidth: true
            anchors.left: parent.left
            //Layout.alignment: Qt.AlignLeft
            text: root.text
            font.bold: true

        }
        Rectangle {
            height: 1
            color: "grey"
            width: parent.width
            anchors.topMargin: 4
            anchors.top: lbl.bottom
        }






    }


    GridLayout {
        id:container
        columns: 2
        rowSpacing: 12
        columnSpacing: 12

        anchors.horizontalCenter: parent.horizontalCenter



        Repeater {
            model: root.model
            //Row {
            // width: parent.width

            Column {



                SoundSlider {
                    id: slider
                    sound: root.sound
                    soundProperty: model.soundProperty
                    bipolar: model.bipolar === true
                    //implicitWidth: root.knobSize
                    //implicitHeight: root.knobSize
                    width: root.knobSize
                    height: root.knobSize
                    //width: parent.width * 2 / 3


                }

                Label {
                    text: model.text
                    anchors.horizontalCenter: slider.horizontalCenter
                    anchors.topMargin: 12
                }

            }

        }

    }
}
