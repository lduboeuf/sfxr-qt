import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2
import QtGraphicalEffects 1.0
//export

Item {
    id:root

    signal done()

    FileDialog {
        id: exportWavFileDialog
        selectExisting: false
        title: qsTr("Export as WAV")
        nameFilters: [qsTr("Wav files") + " (*.wav)",
            qsTr("All files") + " (*)"]
        onAccepted: {
            wavSaver.save(main.sound, fileUrl);
            root.done()
        }
    }

    Component {
        id:fakeComponent
        Item{}
    }

    Component {
        id:standardExportButton


        ToolButton {
            id: exportBtn
            //signal done() //hack to make qml engine not complaining about Connections onDone not found

            anchors.right:  parent.right
            contentItem: Image {
                id:shareImg
                fillMode: Image.Pad
                sourceSize.width: root.height  * 0.4
                sourceSize.height: root.height  * 0.4
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                source: "/assets/share.svg"
            }
            onClicked:{
                exportWavFileDialog.open();

            }

            ColorOverlay {
                anchors.fill: shareImg
                source: shareImg
                color: "white"
            }

         }
    }

    Loader {
        id: exportHandler
        anchors.fill: parent
        sourceComponent: (typeof UBUNTU_TOUCH === "undefined") ? standardExportButton : fakeComponent
        Component.onCompleted: {
            //export using content hub for ubuntu touch
            if (typeof UBUNTU_TOUCH !== "undefined"){
                exportHandler.setSource("ubuntu_touch/UTFileExport.qml")
                exportHandler.item.done.connect(onDone)
            }

            function onDone(){
                root.done()
            }
        }
    }


}
