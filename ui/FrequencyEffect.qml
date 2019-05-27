import QtQuick 2.0
import QtQuick.Layouts 1.3


ColumnLayout{

    CollapseButton {}
SliderGroup {
    width: parent.width
    text: qsTr("Frequency")
    sound: root.sound
    model: ListModel {
        ListElement {
            text: qsTr("Start frequency")
            soundProperty: "baseFrequency"
        }
        ListElement {
            text: qsTr("Min frequency")
            soundProperty: "minFrequency"
        }
        ListElement {
            text: qsTr("Slide")
            soundProperty: "slide"
            bipolar: true
        }
        ListElement {
            text: qsTr("Delta slide")
            soundProperty: "deltaSlide"
            bipolar: true
        }
        ListElement {
            text: qsTr("Vibrato depth")
            soundProperty: "vibratoDepth"
        }
        ListElement {
            text: qsTr("Vibrato speed")
            soundProperty: "vibratoSpeed"
        }
    }
}
}
