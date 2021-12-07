
import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3

Page {
    id: helpScreen
    signal backPressed()
    property real textSize :10

    header: ToolBar {
//        RowLayout {
//            anchors.fill: parent

            ToolButton {
                id: backBtn
                contentItem: Image {
                    id:backImg
                    fillMode: Image.Pad
                    sourceSize.width: header.height  * 0.4
                    sourceSize.height: header.height  * 0.4
                    source: "/assets/back.svg"
                }
                onClicked:{
                    mainStack.pop()
                }

                ColorOverlay {
                    anchors.fill: backImg
                    source: backImg
                    color: "white"
                }

            }

            Label {
                id:title
                anchors.centerIn: parent
//                horizontalAlignment: Qt.AlignHCenter
//                verticalAlignment: Qt.AlignVCenter
//                Layout.fillWidth: true
                text: qsTr("About")
                font.bold: true
            }

//            ToolButton {
//                //fake item for position ok
//            }
 //       }
    }


    Flickable {
        id: flickable

        anchors.fill: parent
        anchors.topMargin: 32
        anchors.leftMargin: 4
        anchors.rightMargin: 4

        //anchors.margins: 20
        contentHeight: column.height

        Column {
            id: column



            width: parent.width

            Item {
                width: parent.width

                height: projectInfo.height

                Label {
                    id: projectInfo

                    width: parent.width
                    wrapMode: Text.WordWrap
                    textFormat: Text.RichText
                    font.pointSize: helpScreen.textSize

                    text: "<h2>Basic usage</h2>

<p>
  Pick some of the &quot;Preset&quot; on the top to generate random sounds.
  If you find a sound that is sort of interesting but not quite what you want,
  you can play with the sliders around until it sounds more suitable.
</p>

<p>&quot;Mutate&quot; (MUT) slightly alters the current parameters to automatically create a variation of the sound.</p>

<p>
For an introduction to sound theory: <a href=\"http://www.drpetter.se/article_sound.html\"> here</a>
</p>

<h2>Copyright</h2>

<p>
  <a rel=\"noopener\" href=\"http://www.drpetter.se/\">Tomas Pettersson</a>, 2007<br />
  <a href=\"https://stammel.net/\">Guido Stammel</a>, 2018<br />
  <a href=\"https://github.com/agateau/\">Aurélien Gâteau</a>, 2019<br />
<a href=\"https://github.com/lduboeuf/\">Lionel Duboeuf</a>, 2019<br />
  <a href=\"https://github.com/ubports/ubuntu-themes\">Suru svg icons </a><br />
  Home icon made by <a href=\"https://www.flaticon.com/authors/darius-dan\">Darius Dan</a>
</p>

<h2>License</h2>

<p>
  Permission is hereby granted, free of charge, to any person
  obtaining a copy of this software and associated documentation
  files (the &quot;Software&quot;), to deal in the Software without
  restriction, including without limitation the rights to use,
  copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the
  Software is furnished to do so, subject to the following
  conditions:
</p>

<p>
  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.
</p>

<p>
  THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  OTHER DEALINGS IN THE SOFTWARE.
</p>"

                    onLinkActivated: Qt.openUrlExternally(link)
                }


            }
        }
    }
}
