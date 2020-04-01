import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

import sfxr 1.0


Column {
    id: root

    property alias text: soundItem.text
    property alias model :soundListModel
    property bool expanded: false

    signal triggered()

    function soundAdded(sound){
        soundListModel.addNew(sound)
        listView.currentIndex = 0
    }



    SoundListModel {
        id: soundListModel
    }

    Rectangle {
        id: soundItemWrapper
        width: parent.width
        color: mouseArea.pressed ? Qt.lighter("#2f2f2f"):"#2f2f2f"
        //height: soundItem.height
        implicitWidth: soundItemLayout.implicitWidth
        implicitHeight: soundItemLayout.implicitHeight

        RowLayout {
            id:soundItemLayout
            anchors.fill: parent
            spacing: 16

            Rectangle {
                id:fakeMargin
                width: 12
            }

            Image {
                id:soundItemImg
                source: "/assets/add-to-playlist.svg"
                sourceSize.height: soundItem.implicitHeight * 1.2
                sourceSize.width: soundItem.implicitHeight * 1.2
            }

            ColorOverlay {
                anchors.fill: soundItemImg
                source: soundItemImg
                color: mouseArea.pressed ? "white": Qt.darker("white")
            }

            Label {
                id:soundItem
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
                height: implicitHeight + 16
            }


            MouseArea {
                id:mouseArea
                anchors.fill: parent
                onClicked: {
                    root.triggered()
                    listView.currentIndex = 0
                }
            }


            ToolButton {
                id: expandCollapseBtn
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                enabled: listView.count > 0
                contentItem: Image {
                    id:expandImg
                    fillMode: Image.Pad
                    sourceSize.width: soundItem.implicitHeight  * 0.8
                    sourceSize.height: soundItem.implicitHeight  * 0.8
                    source: {
                        if (soundListModel.count == 0) return "";
                        return root.expanded ? "/assets/go-next.svg" : "/assets/go-down.svg"

                    }
                }
                onClicked: root.expanded = !root.expanded

                ColorOverlay {
                    anchors.fill: expandImg
                    source: expandImg
                    color: "white"
                }

            }
        }

    }





    ListView {
        id: listView
        model: root.model
        width: parent.width
        onCountChanged: root.expanded = ( count > 0 )
        clip: true
        verticalLayoutDirection: ListView.TopToBottom

        function calculateListViewHeight(){
            /* calculate ListView dimensions based on content */
            var listViewHeight = 0
            for (var i = 0; i < listView.contentItem.children.length -1; i++) {
                listViewHeight += listView.contentItem.children[i].height
            }
            return listViewHeight
        }

        add: Transition {
                NumberAnimation { properties: "opacity"; from: 0; to: 1.0; duration: 600; easing:Easing.OutInQuad }
        }
        delegate:SwipableItem {
            id:soundDelegate
            highlighted: model.index === listView.currentIndex
            count: listView.count

            onClicked: {
               listView.currentIndex = model.index
               main.sound = model.sound
               soundPlayer.play();
            }

            onEditClicked: {
                listView.currentIndex = model.index
                main.sound = model.sound
                mainStack.push("qrc:/SoundBoard.qml")
                swipe.close()
            }

            onMuteSoundRequested: {
                generator.mutate(sound);
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
                    //console.log("ok removed")
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

        Behavior on height {
            NumberAnimation {
                easing.type: Easing.InOutQuad
            }
        }


    }

    states:[
        State{
            name:"collapse"
            when: !root.expanded
            PropertyChanges { target: listView; height:0 }
        },
        State{
            name:"expanded"
            when: root.expanded
            PropertyChanges { target: listView; height: calculateListViewHeight() }
        }


    ]



}
