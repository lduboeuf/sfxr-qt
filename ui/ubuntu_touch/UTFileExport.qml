import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

Item {

    id:root

    property string url
    signal done

    function save() {
        exportNameDialog.open()
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
