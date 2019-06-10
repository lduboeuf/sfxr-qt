import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

ToolButton {
    id:toolBtn

    ColorOverlay {
        id: overlay
        anchors.fill: toolBtn
        source: toolBtn.contentItem
        color: "white"
    }
}
