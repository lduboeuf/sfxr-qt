import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

import sfxr 1.0


Item {
    id: root

    property alias text: soundItem.text
    property bool expanded: false

    signal triggered()

    function soundAdded(sound){
        soundListModel.addNew(sound)
        listView.currentIndex = 0
    }

    width: parent.width
    height: soundItem.implicitHeight + spacing * 2


    Rectangle {
        id: soundItemWrapper
        //width: parent.width
        color: mouseArea.pressed ? Qt.lighter("#1a1a2e") : "#1a1a2e"
        anchors.fill: parent

        MouseArea {
            id:mouseArea
            anchors.fill: parent
            onClicked: {
                root.triggered()
            }
        }

        RowLayout {
            id:soundItemLayout
            anchors.fill: parent
            spacing: 16          

            Label {
                id:soundItem
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                Layout.leftMargin: 16
                color: mouseArea.pressed ? Qt.darker("white"): "white"
                //Layout.fillWidth: true
                height: implicitHeight + 16
            }

            Image {
                id:soundItemImg
                source: "/assets/add-to-playlist.svg"
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                Layout.rightMargin: 16
                sourceSize.height: soundItem.implicitHeight * 1.2
                sourceSize.width: soundItem.implicitHeight * 1.2
                layer {
                    enabled: true
                    effect: ColorOverlay {
                       color: mouseArea.pressed ? Qt.darker("white"): "white"
                    }
                }

            }

        }
    }
}
