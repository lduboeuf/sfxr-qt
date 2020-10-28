import QtQuick 2.0


Item {
   id: root 
   Flickable {
       anchors.fill: root
       contentWidth: width
       contentHeight: contentItem.implicitHeight
       flickableDirection: Flickable.VerticalFlick
   }
}



