pragma ComponentBehavior: Bound

import "root:/modules/bar"
import "root:/services"

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
                regions: regions.instances
            }

            anchors.top: true
            anchors.bottom: true
            anchors.left: true
            anchors.right: true

            Variants {
                id: regions
                model: panels.children

                Region {
                    required property Item modelData
                    x: modelData.x + 8.0
                    y: modelData.y + bar.implicitHeight
                    width: modelData.width
                    height: modelData.height
                    intersection: Intersection.Subtract
                }
            }

            HyprlandFocusGrab {
                active: visibilities.launcher
                windows: [win]
                onCleared: {
                    visibilities.launcher = false;
                }
            }

            Item {
                id: background
                anchors.fill: parent
                visible: true

                Border {
                    bar: bar
                }
            }

            PersistentProperties {
                id: visibilities
                property bool launcher
                Component.onCompleted: Visibilities.screens[scope.modelData] = this
            }

            Panels {
                id: panels
                screen: scope.modelData
                bar: bar
                visibilities: visibilities
            }

            Bar {
                id: bar
                screen: scope.modelData
            }
        }
    }
}
