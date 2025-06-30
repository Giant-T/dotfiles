import "root:/services"
import "root:/widgets"

import Quickshell
import Quickshell.Hyprland
import QtQuick

MouseArea {
    id: root
    required property int index
    readonly property bool occupied: Hyprland.workspaces.values
        .some(workspace => workspace.id == index + 1)
    readonly property bool active: Hyprland.focusedWorkspace.id == index + 1
    implicitWidth: text.width
    implicitHeight: text.height

    enabled: true

    onClicked: (mouse) => {
        if (mouse.button != Qt.LeftButton)
            return;

        Hyprland.dispatch(`workspace ${root.index + 1}`)
    }

    StyledText {
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
    }
}
