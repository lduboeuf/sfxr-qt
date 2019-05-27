import QtQuick 2.0
import QtQuick.Layouts 1.3


ColumnLayout{

    CollapseButton {}

SliderGroup {
    width: parent.width
    text: qsTr("Filters")
    sound: root.sound
    model: ListModel {
        ListElement {
            text: qsTr("LP filter cutoff")
            soundProperty: "lpFilterCutoff"
        }
        ListElement {
            text: qsTr("LP filter cutoff sweep")
            soundProperty: "lpFilterCutoffSweep"
            bipolar: true
        }
        ListElement {
            text: qsTr("LP filter resonance")
            soundProperty: "lpFilterResonance"
        }
        ListElement {
            text: qsTr("HP filter cutoff")
            soundProperty: "hpFilterCutoff"
        }
        ListElement {
            text: qsTr("HP filter cutoff sweep")
            soundProperty: "hpFilterCutoffSweep"
            bipolar: true
        }
    }
}
}
