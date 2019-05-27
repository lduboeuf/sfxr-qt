import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.2

ApplicationWindow {
    visible: true
    width:380
    height: 520


    GridLayout{
        width: parent.width
        columns:4
        Repeater {
            model:5
            Dial{
                Layout.fillWidth: true
                Layout.fillHeight:  true
                Text{
                    text:"kikou"
                }
            }
        }
    }



}
