import QtQuick 2.0
import QtQuick.Controls 2.2

Rectangle {
    width: parent.width
    height: 1
    color:"grey"
    ToolButton{
        text: "▼"
        padding: 0

        anchors.right: parent.right
        scale: 1.5
        onClicked: pageStack.pop()

    }
}
