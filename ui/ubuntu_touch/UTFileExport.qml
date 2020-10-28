import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0


Item {

    id:root

    property string url
    signal done

    ToolButton {
        id: exportBtn
        anchors.fill: parent
        //anchors.right:  parent.right
        contentItem: Image {
            id:shareImg
            fillMode: Image.Pad
            sourceSize.width: root.height  * 0.4
            sourceSize.height: root.height  * 0.4
            anchors.centerIn: parent
            source: "/assets/share.svg"
        }

        ColorOverlay {
            anchors.fill: shareImg
            source: shareImg
            color: "white"
        }
        onClicked:{

            exportNameDialog.open()
//            var r = Math.random().toString(36).substring(2, 7)
//            root.url= appFolder + "/sfxr-"+ r +".wav"
//            console.log(root.url)

//            //save first locally before exporting
//            wavSaver.save(sound, root.url);
//            picker.show()

        }

     }

    ExportDialog{
        id: exportNameDialog
        onAccepted: {

            root.url= appFolder + "/" + fileName +".wav"

            //save first locally before exporting
            wavSaver.save(sound, root.url);
            picker.show()

        }
    }


    UTFileExportHandler{
        id: picker
        url:"file://" + root.url
        onDone: {
            root.done()
        }

    }
}
