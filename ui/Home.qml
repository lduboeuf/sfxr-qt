import QtQuick 2.7
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3



Page {
    id: home
    spacing: 16

    function collapseAllExceptCurrent(currentSoundItem){
        for (var i = 0; i < soundlist.children.length; i++) {
            var item = soundlist.children[i]
            if (item !== currentSoundItem && item.expanded){
                soundlist.children[i].expanded = false
            }
        }
    }


    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            ToolButton {
                //fake item for position ok
            }

            Label {
                text: qsTr("Sfxr")
                font.bold: true
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            ToolButton {
                id: infoBtn
                //Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                contentItem: Image {
                    id:helpImg
                    fillMode: Image.Pad
                    sourceSize.width: header.height  * 0.4
                    sourceSize.height: header.height  * 0.4
                    source: "/assets/info.svg"
                }
                onClicked:{
                    mainStack.push("qrc:/About.qml")
                }

                ColorOverlay {
                    anchors.fill: helpImg
                    source: helpImg
                    color: "white"
                }
            }
        }
    }

    ExportWrapper {
        id: exportWrapper
    }


    Label {
        id: lblTitle
        text: qsTr("Pick a sound:")
        padding: 16
    }

    Flickable {
        property int padding: 6
        flickableDirection: Flickable.VerticalFlick
        anchors {
            top:lblTitle.bottom
            bottom: parent.bottom
            left:parent.left
            //leftMargin: padding
            rightMargin: padding
            right: parent.right
        }

        contentWidth: parent.width - padding * 2
        contentHeight: soundlist.height


        Column {
            id: soundlist
            width: parent.width
            spacing: 2

            SoundItem {
                id:randomSounds
                text: qsTr("Randomize")
                width: parent.width
                onTriggered: {
                    currentSoundItem = this
                    generator.randomize(sound.waveForm);
                }
            }

            SoundItem {
                text: qsTr("Simple Sound")
                width: parent.width
                onTriggered: {
                    currentSoundItem = this
                    generator.generateEmpty();
                }
            }

            SoundItem {
                id: pickupSounds
                text: qsTr("Pickup/Coin")
                width: parent.width
                onTriggered: {
                    currentSoundItem = this
                    generator.generatePickup();
                }
            }

            SoundItem {
                text: qsTr("Laser/Shoot")
                width: parent.width
                onTriggered: {
                    currentSoundItem = this
                    generator.generateLaser();
                }
            }

            SoundItem {
                text: qsTr("Explosion")
                width: parent.width
                onTriggered: {
                    currentSoundItem = this
                    generator.generateExplosion();
                }
            }

            SoundItem {
                text: qsTr("Power Up")
                width: parent.width
                onTriggered: {
                    currentSoundItem = this
                    generator.generatePowerup();
                }
            }

            SoundItem {
                text: qsTr("Hit/Hurt")
                width: parent.width
                onTriggered: {
                    currentSoundItem = this
                    generator.generateHitHurt();
                }
            }

            SoundItem {
                text: qsTr("Jump")
                width: parent.width
                onTriggered: {
                    currentSoundItem = this
                    generator.generateJump();
                }
            }

            SoundItem {
                text: qsTr("Blip/Select")
                width: parent.width
                onTriggered: {
                    currentSoundItem = this
                    generator.generateBlipSelect();
                }
            }

        }
    }
}
