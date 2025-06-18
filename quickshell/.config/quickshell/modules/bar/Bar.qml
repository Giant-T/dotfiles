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
    }
}
