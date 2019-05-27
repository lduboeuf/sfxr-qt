import QtQuick 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

import sfxr 1.0

RowLayout {
    id: root
    property Sound sound

    ButtonGroup {
        buttons: root.children
        checkedButton: buttons[sound.waveType]
        onCheckedButtonChanged: {
            for (var i = 0; i < buttons.length; ++i) {
                if (buttons[i].checked) {
                    sound.waveType = i;
                    return;
                }
            }
        }
    }

    Button {
        Layout.fillWidth: true
        checkable: true
        text: qsTr("Square")
    }

    Button {
        Layout.fillWidth: true
        checkable: true
        text: qsTr("Sawtooth")
    }

    Button {
        Layout.fillWidth: true
        checkable: true
        text: qsTr("Sine")
    }

    Button {
        Layout.fillWidth: true
        checkable: true
        text: qsTr("Noise")
    }
}
