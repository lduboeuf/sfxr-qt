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
            id:mutBtn
            anchors.left: parent.left
            //anchors.rightMargin: 12
            anchors.verticalCenter: parent.verticalCenter
            text: qsTr("MUT")
            onClicked: {
                generator.mutate(sound);
            }
        }


        Image {
            id: playImg
            anchors.left: mutBtn.right
            anchors.leftMargin: 4
            //anchors.horizontalCenter: parent.horizontalCenter
            opacity: swipeDelegate.pressed ? 0.8 :0.4
            anchors.verticalCenter: parent.verticalCenter
            //anchors.horizontalCenter: parent.horizontalCenter
            sourceSize.width: swipeDelegate.height * 0.4
            sourceSize.height: sourceSize.height
            source: "/assets/play.svg"

        }

        Label{
            anchors.left: playImg.right
            anchors.leftMargin: 4
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
            source: "/assets/tune.svg"

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


        ExportHandler{
            id:exportHandler
            anchors.centerIn: parent
            width:parent.height
            height: parent.height
            anchors.leftMargin: 12
            anchors.rightMargin: 12
            //anchors.verticalCenter: parent.verticalCenter

            onDone:{
                swipe.close()
            }
        }



       ColorOverlay {
           anchors.fill: exportHandler
           source: exportHandler
           color: "white"  // make image like it lays under red glass
       }



//        Image {
//            id: editImg

//            anchors.verticalCenter: parent.verticalCenter
//            anchors.right: parent.right
//            anchors.margins: 12
//            sourceSize.width: parent.height - (parent.height * 0.6)
//            sourceSize.height: sourceSize.height
//            source: "/assets/tune.svg"
//        }
//        ColorOverlay {
//            anchors.fill: editImg
//            source: editImg
//            color: "white"  // make image like it lays under red glass
//        }

//        MouseArea { //workaround for mobile
//            anchors.fill: editImg
//            onClicked:{
//                swipe.close()
//                swipeDelegate.editClicked(index)
//            }

//        }
    }

}
