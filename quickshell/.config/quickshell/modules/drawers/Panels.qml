import "root:/modules/notifications" as Notifications
import "root:/modules/launcher" as Launcher

import Quickshell
import QtQuick

Item {
    id: root
    required property ShellScreen screen
    required property PersistentProperties visibilities
    required property Item bar

    anchors.fill: parent
    anchors.margins: 8.0
    anchors.topMargin: bar.implicitHeight

    Notifications.Content {
        id: notif

        anchors.right: parent.right
        anchors.top: parent.top
    }

    Launcher.Content {
        id: launcher
        visibilities: root.visibilities

        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
