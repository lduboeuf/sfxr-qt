import QtQuick 2.9
import QtQuick.Controls 2.2


Button {
    id: btn
    property alias name: btnText.text

    //height: btnText.implicitHeight * 4
    antialiasing: true

    Accessible.name: text
    Accessible.description: "This button does " + text
    Accessible.role: Accessible.Button
    Accessible.onPressAction: {
        btn.clicked()
    }

    contentItem: Text{
        id:btnText
        text: text
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    background: Rectangle {
        color: btn.pressed   ?  Qt.lighter("#16213e"): "#16213e"
        opacity: 0.5
        border.width: 2
        border.color: "#e94560"
        radius: 20
        smooth: true
    }

}
