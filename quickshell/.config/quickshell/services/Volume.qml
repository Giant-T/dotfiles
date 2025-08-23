pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Singleton {
    id: root
    readonly property PwNodeAudio audio: Pipewire.defaultAudioSink.audio
    readonly property real volume: (audio.volume * 100).toFixed(1)
    readonly property bool muted: audio.muted

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }
}
