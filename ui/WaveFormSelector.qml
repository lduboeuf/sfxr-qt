import QtQuick 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

import sfxr 1.0


Item {
    id: root
    property Sound sound
    height: childrenRect.height
    width: childrenRect.width

    Column {

        spacing: 6

        ListModel {
            id: waveFormModel
            // Must be kept in sync with WaveForm::Enum in WaveForm.h
            ListElement {
                waveForm: WaveForm.Square
                text: qsTr("Square")
            }
            ListElement {
                waveForm: WaveForm.Sawtooth
                text: qsTr("Sawtooth")
            }
            ListElement {
                waveForm: WaveForm.Triangle
                text: qsTr("Triangle")
            }
            ListElement {
                waveForm: WaveForm.Sine
                text: qsTr("Sine")
            }
            ListElement {
                waveForm: WaveForm.Noise
                text: qsTr("Noise")
            }
        }

        Label {
            text: qsTr("Wave form")
            font.bold: true
        }

        ButtonGroup {
            id: buttonGroup
        }

        Repeater {
            model: waveFormModel
            Button {
                checkable: true
                // Need to cast because waveFormModel.waveForm is an int
                checked: Number(sound.waveForm) === model.waveForm
                text: model.text
                width: root.width
                height: implicitHeight * 2
                ButtonGroup.group: buttonGroup
                onCheckedChanged: {
                    if (checked) {
                        sound.waveForm = model.waveForm;
                    }
                }
            }
        }
    }
}
