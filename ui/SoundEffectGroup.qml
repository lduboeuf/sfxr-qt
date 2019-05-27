import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

ColumnLayout {

    property alias title: groupTitle.text

    RowLayout {
        width: parent.width
        height: groupTitle.implicitHeight *2

        Rectangle {
            anchors.fill: parent
            color:"blue"
        }


        Label {
            id:groupTitle
            //Layout.fillWidth: true
            anchors.left: parent.left
            //Layout.alignment: Qt.AlignLeft
            //text: root.text
            font.bold: true
        }

        Label {
            anchors.right:  parent.right
            //Layout.alignment: Qt.AlignRight
            text: "▼"
            //onClicked: pageStack.pop()
        }

        MouseArea {
            anchors.fill: parent
            onClicked: pageStack.pop()
        }



        }

}
