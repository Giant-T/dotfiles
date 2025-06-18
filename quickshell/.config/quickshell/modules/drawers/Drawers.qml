pragma ComponentBehavior: Bound

import "root:/modules/bar"

import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick

Variants {
    model: Quickshell.screens

    Scope {
        id: scope
        required property ShellScreen modelData

        PanelWindow {
            id: win

            screen: scope.modelData
            WlrLayershell.namespace: "bebop-drawers"
            color: "transparent"
            WlrLayershell.exclusionMode: ExclusionMode.Ignore
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

            Exclusions {
                screen: scope.modelData
                bar: bar
            }

            mask: Region {
                x: 8.0
                y: 8.0 + bar.implicitHeight
                width: win.width - 8.0
                height: win.height - 8.0 - bar.implicitHeight 
                intersection: Intersection.Xor
            }

            anchors.top: true
            anchors.bottom: true
            anchors.left: true
            anchors.right: true

            Item {
                id: background
                anchors.fill: parent
                visible: true

                Border {
                    bar: bar
                }
            }

            Bar {
                id: bar
                screen: scope.modelData
            }
        }
    }
}
