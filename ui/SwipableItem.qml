import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0



SwipeDelegate {
    id: swipeDelegate
    width: parent.width
    height: lbl.implicitHeight + spacing * 2
    spacing: 16

    signal removeClicked(int index)
    signal editClicked(int index)
    signal itemClicked(int index)
    signal muteSoundRequested()


    property string iconSource : ""
    property alias indexLabelVisible: indexLabel.visible


    contentItem: RowLayout {
        spacing: 16

        Image {
            id: playImg
            sourceSize.width: swipeDelegate.height * 0.4
            sourceSize.height: sourceSize.height
            source: "/assets/play.svg"

        }

        ColorOverlay {
            anchors.fill: playImg
            opacity: swipeDelegate.pressed ? 0.8 :0.4
            source: playImg
            color: "white"
        }


        Label{
            id: indexLabel
            text:index + 1
            visible: false
        }



        Label{
            id:lbl
            text: model.text
        }





        Row{
            anchors.right: parent.right
            Layout.alignment: Qt.AlignVCenter
            height: parent.height
            spacing: 12

            Button {
                id:mutBtn
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("MUT")
                onClicked: swipeDelegate.muteSoundRequested()
            }

            Button {
                id:effectBtn
                anchors.verticalCenter: parent.verticalCenter
                contentItem: Image {
                    id: arrowImg
                    fillMode: Image.Pad
                    source: "/assets/tune.svg"

                }

                ColorOverlay {
                    anchors.fill: arrowImg
                    source: arrowImg
                    color: "white"
                }

                onClicked: {
                    swipeDelegate.editClicked(index)
                }
            }
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
            color: "white"
        }


    }

}
