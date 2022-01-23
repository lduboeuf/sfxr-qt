import QtQuick 2.0
import QtQuick.Controls 2.12

Popup {
    padding: 10

    property alias content: content.text

    property string frequencyHelp: "<h3>Controlling the sound pitch or frequency:</h3>
            <ul>
              <li> Start frequency is pretty obvious. Has a large impact on the overall sound.</li>
              <li> Min frequency represents a cutoff that stops all sound if it's passed during a downward slide.</li>
              <li> Slide sets the speed at which the frequency should be swept (up or down).</li>
               <li> Delta slide is the \"slide of slide\", or rate of change in the slide speed.</li>
            <li> Vibrato depth/speed makes for an oscillating frequency effect at various strengths and rates.</li>
            </ul>"

    property string envelopHelp: "<h3>control the volume envelope</h3>
        <ul>
           <li> Attack is the beginning of the sound, longer attack means a smoother start.</li>
            <li> Sustain is how long the volume is held constant before fading out. Increase Sustain Punch to cause a popping effect with increased (and falling) volume during the sustain phase.</li>
            <li> Decay is the fade-out time.</li>
        </ul>
        <h4>specific to the squarewave waveform:</h4>
        <ul>
            <li> The duty cycle of a square describes its shape in terms of how large the positive vs negative sections are. It can be swept up or down by changing the second parameter.</li>
        </ul>"

    property string filtersHelp: "<h3>Filters:</h3>
    <ul><li>Sliders control two filters which are applied after all other effects. The first one is a resonant lowpass filter which has a sweepable cutoff frequency. The other is a highpass filter which can be used to remove undesired low frequency hum in lighter sounds.</li>
</li></ul>"

    property string othersHelp: "<h3>Others:</h3>
        <ul>
            <li>Phaser offset overlays a delayed copy of the audio stream on top of itself, resulting in a kind of tight reverb or sci-fi effect. This parameter can also be swept like many others.</li>
            <li>Changes cause an abrupt change in pitch after a certain delay. Amount is pitch change (up or down) and Speed indicates time to wait before changing the pitch.</li>
            <li>Repeat speed, when not zero, causes the frequency and duty parameters to be reset at regular intervals while the envelope and filter continue unhindered. This can make for some interesting pulsating effects.</li>
        </ul>"

    contentItem: Text {
        id: content
        color: "white"
        width: parent.width
        wrapMode: Text.WordWrap
    }
}