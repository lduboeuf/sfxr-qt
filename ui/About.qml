
import QtQuick 2.0
import QtQuick.Controls 2.2

Item {
    id: helpScreen

    signal backPressed()
    property real textSize :12
//    property real textSize: Math.min(width, height) * 0.04 <= 0
//                            ? 8
//                            : Math.min(width, height) * 0.02

    //width: 500
    //height: 360
    //radius: 4
    //color: "#999999"
    clip: true



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
  Start the application, then select some of the &quot;Preset&quot; on
  the top to generate random sounds.
  If you find a sound that is sort of interesting but not quite what you want,
  you can play with the knobs around until it sounds more suitable.
</p>

<p>&quot;Mutate&quot; slightly alters the current parameters to automatically create a variation of the sound.</p>

<h2>Advanced usage</h2>

<p>Parameter description:</p>

<ul>
  <li>The top four buttons select the base waveform.</li>
  <li>First four parameters control the volume envelope Attack is the beginning of the sound, longer attack means a smoother start. Sustain is how long the volume is held constant before fading out. Increase Sustain Punch to cause a popping effect with increased (and falling) volume during the sustain phase. Decay is the fade-out time.</li>
  <li>Next six are for controlling the sound pitch or frequency. Start frequency is pretty obvious. Has a large impact on the overall sound. Min frequency represents a cutoff that stops all sound if it's passed during a downward slide. Slide sets the speed at which the frequency should be swept (up or down). Delta slide is the &quot;slide of slide&quot;, or rate of change in the slide speed. Vibrato depth/speed makes for an oscillating frequency effect at various strengths and rates.</li>
  <li>Then we have two parameters for causing an abrupt change in pitch after a certain delay. Amount is pitch change (up or down) and Speed indicates time to wait before changing the pitch.</li>
  <li>Following those are two parameters specific to the squarewave waveform. The duty cycle of a square describes its shape in terms of how large the positive vs negative sections are. It can be swept up or down by changing the second parameter.</li>
  <li>Repeat speed, when not zero, causes the frequency and duty parameters to be reset at regular intervals while the envelope and filter continue unhindered. This can make for some interesting pulsating effects.</li>
  <li>Phaser offset overlays a delayed copy of the audio stream on top of itself, resulting in a kind of tight reverb or sci-fi effect. This parameter can also be swept like many others.</li>
  <li>Finally, the bottom five sliders control two filters which are applied after all other effects. The first one is a resonant lowpass filter which has a sweepable cutoff frequency. The other is a highpass filter which can be used to remove undesired low frequency hum in lighter sounds.</li>
</ul>

<p>
For an introduction to sound theory: <a href=\"http://www.drpetter.se/article_sound.html\"> here</a>
</p>

<h2>Copyright</h2>

<p>
  <a rel=\"noopener\" href=\"http://www.drpetter.se/\">Tomas Pettersson</a>, 2007<br />
  <a href=\"https://stammel.net/\">Guido Stammel</a>, 2018<br />
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
