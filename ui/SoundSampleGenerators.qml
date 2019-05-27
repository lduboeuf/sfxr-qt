import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3


import sfxr 1.0

RowLayout {
    spacing: 12

    property Generator generator
    property Sound sound

    ListModel {
        id: samplesList

        ListElement {
            name: qsTr("Pickup/Coin")
        }
        ListElement {
            name: qsTr("Laser/Shoot")
        }
        ListElement {
            name: qsTr("Explosion")
        }
        ListElement {
            name: qsTr("Power Up")
        }
        ListElement {
            name: qsTr("Hit/Hurt")
        }
        ListElement {
            name: qsTr("Jump")
        }
        ListElement {
            name: qsTr("Blip/Select")
        }
    }



        ComboBox{
            id:samplesCb
            model:samplesList
        }

        Button {
            text:qsTr("generate")
            onClicked: {
                switch(samplesCb.currentIndex){
                    case 0:
                        generator.generatePickup();
                        break
                    case 1:
                        generator.generateLaser();
                        break
                    case 2:
                        generator.generateExplosion();
                        break
                    case 3:
                        generator.generatePowerup();
                        break
                    case 4:
                        generator.generateHitHurt();
                        break
                    case 5:
                        generator.generateJump();
                        break
                    case 6:
                        generator.generateBlipSelect();
                        break

                }
            }
        }



}
