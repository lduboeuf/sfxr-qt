import QtQuick 2.0
import QtQuick.Layouts 1.3


ColumnLayout{

    //CollapseButton {}

    SliderGroup {
        id:envelopGroup

        width: parent.width
        text: qsTr("Envelop")
        sound: root.sound
        model: ListModel {
            ListElement {
                text: qsTr("Attack time")
                soundProperty: "attackTime"
            }
            ListElement {
                text: qsTr("Sustain time")
                soundProperty: "sustainTime"
            }
            ListElement {
                text: qsTr("Sustain punch")
                soundProperty: "sustainPunch"
            }
            ListElement {
                text: qsTr("Decay time")
                soundProperty: "decayTime"
            }
        }
    }
}





