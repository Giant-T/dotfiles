import "root:/services"

import Quickshell
import QtQuick
import QtQuick.Effects

Item {
    id: root
    anchors.fill: parent
    required property Item bar

    Rectangle {
        id: rect

        anchors.fill: parent
        color: Colors.background
        visible: false
    }

    Item {
        id: mask
        anchors.fill: parent
        layer.enabled: true
        visible: false

        Rectangle {
            anchors.fill: parent
            anchors.margins: 8.0
            anchors.topMargin: bar.implicitHeight
            radius: 8.0
        }
    }

    MultiEffect {
        anchors.fill: parent
        maskEnabled: true
        maskInverted: true
        maskSource: mask
        source: rect
        maskThresholdMin: 0.5
        maskSpreadAtMin: 1
    }
}
