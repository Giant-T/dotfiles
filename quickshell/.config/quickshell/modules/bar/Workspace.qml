import "root:/services"

import Quickshell
import Quickshell.Hyprland
import QtQuick

Item {
    id: root
    required property int index
    readonly property bool occupied: Hyprland.workspaces.values
        .some(workspace => workspace.id == index + 1)
    readonly property bool active: Hyprland.focusedWorkspace.id == index + 1
    implicitWidth: text.width
    implicitHeight: text.height

    anchors.verticalCenter: parent.verticalCenter

    Text {
        anchors.verticalCenter: parent.verticalCenter
        id: text

        function getIcon() {
            if (occupied) {
                return "●"
            } else {
                return "○"
            }
        }

        function getColor() {
            if (active) {
                return Colors.active
            } else {
                return Colors.text
            }
        }

        text: getIcon()
        color: getColor()
        font.family: Appearance.font.mono
        font.pointSize: Appearance.font.size
    }
}
