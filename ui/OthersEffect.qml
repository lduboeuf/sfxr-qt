import QtQuick 2.0
import QtQuick.Layouts 1.3




Column{


   CollapseButton {}


    SliderGroup {
       //Layout.fillWidth: true
        width: parent.width
        enabled: sound.waveType === 0
        text: qsTr("Square")
        sound: root.sound
        model: ListModel {
            ListElement {
                text: qsTr("Square duty")
                soundProperty: "squareDuty"
            }
            ListElement {
                text: qsTr("Duty sweep")
                soundProperty: "dutySweep"
                bipolar: true
            }
        }
    }

    SliderGroup {
        width: parent.width
        text: qsTr("Repeat")
        sound: root.sound
        model: ListModel {
            ListElement {
                text: qsTr("Repeat speed")
                soundProperty: "repeatSpeed"
            }
        }
    }

    SliderGroup {
        width: parent.width
        text: qsTr("Phaser")
        sound: root.sound
        model: ListModel {
            ListElement {
                text: qsTr("Phaser offset")
                soundProperty: "phaserOffset"
                bipolar: true
            }
            ListElement {
                text: qsTr("Phaser sweep")
                soundProperty: "phaserSweep"
                bipolar: true
            }
        }
    }


    SliderGroup {
       width: parent.width
        text: qsTr("Change")
        sound: root.sound
        model: ListModel {
            ListElement {
                text: qsTr("Change amount")
                soundProperty: "changeAmount"
                bipolar: true
            }
            ListElement {
                text: qsTr("Change speed")
                soundProperty: "changeSpeed"
            }
        }
    }
}



