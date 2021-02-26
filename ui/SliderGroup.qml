import QtQuick 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

import sfxr 1.0

Column {
    id: root
    property string text
    property Sound sound
    property ListModel model

    property real knobSize: 100
    spacing: 12
    Label {
        id:lbl
        text: root.text
        font.bold: true
    }

    Repeater {
        model: root.model

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
