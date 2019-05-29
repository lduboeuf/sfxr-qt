import QtQuick 2.0
import QtQuick.Controls 2.2

Item {

    id:root

    property string url
    signal done

    ToolButton {
        id: exportBtn
        anchors.fill: parent
        //anchors.right:  parent.right
        contentItem: Image {
            fillMode: Image.Pad
            sourceSize.width: root.height  * 0.4
            sourceSize.height: root.height  * 0.4
            anchors.centerIn: parent
            source: "/assets/share.svg"
        }
        onClicked:{

            root.url= appFolder + "/output.wav"
            console.log(root.url)
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
