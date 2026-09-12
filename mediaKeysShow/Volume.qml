pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    readonly property PwNode sink: Pipewire.defaultAudioSink

    PwObjectTracker {
        objects: [sink]
    }
    readonly property real volume: (sink.ready) ? 
    Math.round(Pipewire.defaultAudioSink.audio.volume * 100) :
    -1
}
