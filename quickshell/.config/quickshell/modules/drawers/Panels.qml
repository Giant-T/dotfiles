import "root:/modules/notifications" as Notifications

import Quickshell
import QtQuick

Item {
    id: root
    required property ShellScreen screen
    // required property PersistentProperties visibilities
    required property Item bar

    anchors.fill: parent
    anchors.margins: 8.0
    anchors.topMargin: bar.implicitHeight

    Notifications.Content {
        id: notif
        // visibilities: root.visibilities

        bar: bar

        anchors.right: parent.right
        anchors.top: parent.top
    }
}
