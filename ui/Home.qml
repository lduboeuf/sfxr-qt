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

    header:ToolBar{
        RowLayout {
            id:headerRow
            anchors.fill: parent

            Rectangle {
                width: parent.width
                anchors.bottom: parent.bottom
                color:"grey"
                height: 1
            }

            Label {
                id:title
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Sfxr")
                font.bold: true
            }

            ToolButton {
                id: infoBtn
                anchors.right:  parent.right
                anchors.verticalCenter: headerRow.verticalCenter
                contentItem: Image {
                    id:helpImg
                    fillMode: Image.Pad
                    sourceSize.width: headerRow.height  * 0.4
                    sourceSize.height: headerRow.height  * 0.4
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

        }}



    Label {
        id: lblTitle
        text: qsTr("Pick a sound:")
        padding: 16
    }

    Flickable {
        anchors {
            top:lblTitle.bottom
            bottom: parent.bottom
            left:parent.left
            right: parent.right
        }

        contentWidth: parent.width
        contentHeight: soundlist.height


        Column {
            id: soundlist
            width: parent.width
            spacing: 6

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
