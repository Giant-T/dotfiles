pragma ComponentBehavior: Bound

import Quickshell
import QtQuick
import QtQuick.Layouts

Item {
    id: root

    RowLayout {
        id: layout
        spacing: 8.0
        layer.enabled: true
        layer.smooth: true

        anchors.verticalCenter: parent.verticalCenter
        

        Repeater {
            model: 5
            anchors.verticalCenter: parent.verticalCenter

            Workspace {
            }
        }
    }
}
