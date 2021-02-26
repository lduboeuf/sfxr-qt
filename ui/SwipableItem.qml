import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

SwipeDelegate {
    id: swipeDelegate
    width: parent.width
    //height: lbl.implicitHeight + spacing * 2
    //spacing: 16

    signal removeClicked(int index)
    signal editClicked(int index)
    signal itemClicked(int index)
    signal saveClicked(int index)
    signal muteSoundRequested()

    property string iconSource : ""
    property alias indexLabelVisible: indexLabel.visible
    property int count

    contentItem: RowLayout {
        width: swipeDelegate.width
        height: lbl.implicitHeight + spacing * 2
        spacing: 16
        Image {
            id: playImg
            Layout.alignment: Qt.AlignVCenter
            //anchors.verticalCenter: parent.verticalCenter
            //sourceSize.width: swipeDelegate.height * 0.4
            //sourceSize.height: sourceSize.height
            source: "/assets/play.svg"

            ColorOverlay {
                anchors.fill: parent
                opacity: swipeDelegate.pressed ? 0.8 :0.4
                source: playImg
                color: "white"
            }
        }



        Label{
            id: indexLabel
            //Layout.alignment: Qt.AlignVCenter
            text:index + 1
            visible: false
        }

        Label{
            id:lbl
            //Layout.alignment: Qt.AlignVCenter
            text: model.text + "#" + (count - index)
        }

        Row {
            height: parent.height
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            spacing: 12
            Button {
                id:mutBtn
                height: parent.height
                text: qsTr("MUT")
                onClicked: swipeDelegate.muteSoundRequested()
            }
            Button {
                id:effectBtn
                height: parent.height
                //Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                //Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
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


            //Layout.fillWidth: true
//            Row{
//                id: btnGroup
//                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
//                width: childrenRect.width
//                //height: parent.height
//                spacing: 12

//                Button {
//                    id:mutBtn
//                    //Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
//                    text: qsTr("MUT")
//                    onClicked: swipeDelegate.muteSoundRequested()
//                }

//                Button {
//                    id:effectBtn
//                    //Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
//                    contentItem: Image {
//                        id: arrowImg
//                        fillMode: Image.Pad
//                        source: "/assets/tune.svg"
//                    }

//                    ColorOverlay {
//                        anchors.fill: arrowImg
//                        source: arrowImg
//                        color: "white"
//                    }

//                    onClicked: {
//                        swipeDelegate.editClicked(index)
//                    }
//                }
//            //}
//        }


    }
    onClicked: itemClicked(index)

    swipe.left: Rectangle {
        color: SwipeDelegate.pressed ? Qt.darker("red", 1.1) : "red"
        anchors.left: parent.left
        width: parent.width * 0.2
        height: parent.height
        clip: true

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

        Image {
            id: shareImg
            anchors.centerIn: parent
            sourceSize.width: parent.height * 0.3
            sourceSize.height: sourceSize.height
            source: "/assets/share.svg"
        }
        ColorOverlay {
            anchors.fill: shareImg
            source: shareImg
            color: "white"  // make image like it lays under red glass
        }

        MouseArea { //workaround for mobile
            anchors.fill: parent
            onClicked: swipeDelegate.saveClicked(index)
        }
    }
}
