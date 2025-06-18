import "root:/services"

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

        Text {
            anchors.right: parent.right
            anchors.rightMargin: 16.0
            anchors.verticalCenter: parent.verticalCenter

            color: Colors.text
            text: Time.time
            font.family: Appearance.font.mono
            font.pointSize: Appearance.font.size
        }
    }
}
