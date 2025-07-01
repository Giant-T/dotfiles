import "root:/services"
import "root:/widgets"

import Quickshell
import QtQuick

Item {
    id: root
    required property ShellScreen screen

    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right

    implicitHeight: child.implicitHeight + 8.0 * 2

    Item {
        id: child

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        implicitHeight: Math.max(32.0)

        Workspaces {
            anchors.left: parent.left
            anchors.leftMargin: 16.0
            anchors.verticalCenter: parent.verticalCenter
        }

        StyledText {
            // TODO: add music controls
            text: Player.active ? [Player.active.trackArtist, Player.active.trackTitle].filter(s => !!s).join(" - ") : "";

            width: 550.0
            elide: Text.ElideRight
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
        }

        StyledText {
            text: Time.time
            anchors.right: parent.right
            anchors.rightMargin: 16.0
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
