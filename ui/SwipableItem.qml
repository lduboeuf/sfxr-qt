import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
//import QtQuick.Controls.Material 2.1



SwipeDelegate {
    id: swipeDelegate
    width: parent.width


    signal removeClicked(int index)
    signal editClicked(int index)
    signal itemClicked(int index)


    property string iconSource : ""
    property alias indexLabelVisible: indexLabel.visible


    contentItem: RowLayout {
        width: parent.width
        height: parent.height
        spacing: 16

        Label{
            id: indexLabel
            text:index + 1
            visible: false
        }

        Button {
            anchors.left: parent.left
            anchors.rightMargin: 12
            anchors.verticalCenter: parent.verticalCenter
            text: qsTr("MUT")
            onClicked: {
                generator.mutate(sound);
            }
        }

//        ColorOverlay{
//            source:iconLeft
//            anchors.fill: iconLeft
//            //color:Material.foreground
//            cached: true
//        }


        Label{
            //anchors.left: iconLeft.right
            anchors.leftMargin: 16
            //opacity: 0.60
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            //color: Material.foreground
            //font.pixelSize: Qt.application.font.pixelSize * 1.2
            //anchors.left: parent.left
            text: model.text
        }


        Image {
            id: arrowImg
            anchors.right: parent.right
            opacity: 0.60
            anchors.verticalCenter: parent.verticalCenter
            //anchors.horizontalCenter: parent.horizontalCenter
            sourceSize.width: swipeDelegate.height * 0.4
            sourceSize.height: sourceSize.height
            source: "/assets/next.svg"

        }

        MouseArea {
            anchors.fill: arrowImg
            onClicked: swipeDelegate.editClicked(index)
        }



    }

    onClicked: itemClicked(index)




    swipe.left: Rectangle {
        color: SwipeDelegate.pressed ? Qt.darker("red", 1.1) : "red"
        //width: parent.width
        anchors.left: parent.left
        width: parent.width * 0.2
        height: parent.height
        clip: true


        //SwipeDelegate.onClicked: view.model.remove(ourIndex)

        Image {
            id: deleteImg

            anchors.centerIn: parent
            sourceSize.width: parent.height * 0.3
            sourceSize.height: sourceSize.height
            source: "/assets/edit-delete.svg"
        }
        ColorOverlay {
            anchors.fill: deleteImg
            source: deleteImg
            color: "white"  // make image like it lays under red glass
        }

        MouseArea { //workaround for mobile
            anchors.fill: parent
            onClicked: swipeDelegate.removeClicked(index)
        }
    }



    swipe.right: Rectangle {
        color: SwipeDelegate.pressed ? Qt.darker("green", 1.1) : "green"
        anchors.right: parent.right
        width: parent.width * 0.2
        height: parent.height
        clip: true


        //SwipeDelegate.onClicked: view.model.remove(ourIndex)

        Image {
            id: editImg

            anchors.centerIn: parent
            sourceSize.width: parent.height - (parent.height * 0.6)
            sourceSize.height: sourceSize.height
            source: "/assets/edit.svg"
        }
        ColorOverlay {
            anchors.fill: editImg
            source: editImg
            color: "white"  // make image like it lays under red glass
        }

        MouseArea { //workaround for mobile
            anchors.fill: parent
            onClicked: swipeDelegate.editClicked(index)
        }
    }

}
