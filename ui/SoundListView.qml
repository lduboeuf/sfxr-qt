import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

import sfxr 1.0

ColumnLayout {
    id: root
    property alias model: listView.model
    property alias currentIndex: listView.currentIndex
    signal currentSoundClicked()
    signal soundSelected(string soundName)

    property int innerMargin: 4

    TitleLabel {
        text: qsTr("Sounds")
    }

    ListView {
        id: listView
        Layout.fillWidth: true
        Layout.fillHeight: true
        clip: true
        delegate:SwipableItem {
            highlighted: model.index === listView.currentIndex
            onClicked: {
                if (highlighted) {
                    currentSoundClicked();
                } else {
                    listView.currentIndex = model.index;
                }
            }

            onEditClicked: {
              soundSelected(model.text)
                swipe.close()
            }

            onRemoveClicked: {
                onClicked: {
                    if (listView.count === 1) {
                        // If the item is alone, reset it, do not remove it
                        root.model.resetSoundAtRow(0);
                        return;
                    }

                    if (model.index === listView.currentIndex) {
                        selectAnother();
                    }
                    root.model.remove(model.index);
                }

                function selectAnother() {
                    if (model.index < listView.count - 1) {
                        listView.currentIndex = model.index + 1;
                    } else {
                        listView.currentIndex = model.index - 1;
                    }
                }
            }
        }

//            ItemDelegate {
//            anchors {
//                left: parent.left
//                right: parent.right
//            }
//            text: model.text
//            highlighted: model.index === listView.currentIndex

//            onClicked: {
//                if (highlighted) {
//                    currentSoundClicked();
//                } else {
//                    listView.currentIndex = model.index;
//                }
//            }


//            Button {
//                anchors.right: selectBtn.left
//                anchors.rightMargin: 12
//                anchors.verticalCenter: parent.verticalCenter
//                text: qsTr("MUT")
//                onClicked: {
//                    generator.mutate(sound);
//                }
//            }

//            Button {
//                id:selectBtn
//                anchors {
//                    right: parent.right
//                    rightMargin: innerMargin
//                    verticalCenter: parent.verticalCenter
//                }
//                text: qsTr("edit")
//                //scale: 1.5
//                onClicked: soundSelected(model.text)
//            }

////            Button {
////                id:delBtn
////                anchors {
////                    right: parent.right
////                    rightMargin: innerMargin
////                    verticalCenter: parent.verticalCenter
////                }
////                height: parent.height - 2 * innerMargin
////                width: height
////                flat: true
////                text: "⨯"

////                onClicked: {
////                    if (listView.count === 1) {
////                        // If the item is alone, reset it, do not remove it
////                        root.model.resetSoundAtRow(0);
////                        return;
////                    }

////                    if (model.index === listView.currentIndex) {
////                        selectAnother();
////                    }
////                    root.model.remove(model.index);
////                }

////                function selectAnother() {
////                    if (model.index < listView.count - 1) {
////                        listView.currentIndex = model.index + 1;
////                    } else {
////                        listView.currentIndex = model.index - 1;
////                    }
////                }
////            }
//        }

        ScrollIndicator.vertical: ScrollIndicator {}
    }
}
