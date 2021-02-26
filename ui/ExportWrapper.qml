import QtQuick 2.0

Item {
    id: root

    signal done

    function save() {
        exportHandler.item.save()
    }

    Loader {
        id: exportHandler
        anchors.fill: parent
        Component.onCompleted: {
            //export using content hub for ubuntu touch
            var handler;
            if (typeof UBUNTU_TOUCH !== "undefined"){
                handler = "ubuntu_touch/UTFileExport.qml"
            } else {
                handler = "DefaultExportHandler.qml"
            }
            exportHandler.setSource(Qt.resolvedUrl(handler))
            exportHandler.item.done.connect(function(){ root.done() })


        }
    }

}
