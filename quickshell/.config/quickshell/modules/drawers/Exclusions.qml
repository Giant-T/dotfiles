pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Wayland
import QtQuick

Scope {
    id: root

    required property ShellScreen screen
    required property Item bar

    ExclusionZone {
        anchors.left: true
    }

    ExclusionZone {
        anchors.top: true
        exclusiveZone: root.bar.implicitHeight
    }

    ExclusionZone {
        anchors.right: true
    }

    ExclusionZone {
        anchors.bottom: true
    }

    component ExclusionZone: PanelWindow {
        screen: root.screen
        WlrLayershell.namespace: "bebop-border-exclusion"
        color: "transparent"
        exclusiveZone: 8.0
        mask: Region {}
    }
}
