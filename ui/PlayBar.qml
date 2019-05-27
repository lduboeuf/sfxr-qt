import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

import sfxr 1.0

RowLayout {
    property SoundPlayer soundPlayer
    Button {
        id: playButton
        Layout.minimumWidth: implicitWidth * 1.5
        Layout.minimumHeight: implicitHeight * 1.5
        text: qsTr("Play")
        onClicked: {
            soundPlayer.play();
        }
    }
    CheckBox {
        text: qsTr("Loop")
        checked: soundPlayer.loop
        onCheckedChanged: {
            soundPlayer.loop = checked;
        }
    }

}
