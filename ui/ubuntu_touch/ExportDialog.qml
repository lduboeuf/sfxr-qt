import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Dialog {
    id: dialog
    property alias fileName: name.text

    x: (parent.width - width) / 2
    y: (parent.height - height) / 4
    parent: ApplicationWindow.overlay

    focus: true
    modal: true
    title: qsTr('Export sound')
    standardButtons: Dialog.Ok | Dialog.Cancel

    ColumnLayout {
        spacing: 20
        anchors.fill: parent
        Label {
            elide: Label.ElideRight
            text: qsTr("Please enter a name :")
            Layout.fillWidth: true
        }
        TextField {
            id: name
            color: "black"
            focus: true
            maximumLength: 18
            placeholderText: qsTr("sound name")
            Layout.fillWidth: true
        }
    }

    onAccepted: {
       //
    }


}






