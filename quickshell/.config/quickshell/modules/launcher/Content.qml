pragma ComponentBehavior: Bound

import "root:/widgets"
import "root:/services"
import "root:/config"

import Quickshell
import QtQuick
import QtQuick.Shapes
import QtQuick.Controls

Item {
    id: root
    required property PersistentProperties visibilities
    implicitHeight: visibilities.launcher ? 200 : 0
    implicitWidth: 600

    Behavior on implicitHeight {
        NumberAnimation {
            duration: Appearance.anim.durations.large
            easing.type: Easing.BezierSpline
            easing.bezierCurve: Appearance.anim.curves.expressiveDefaultSpatial
        }
    }

    Background {
        anchors.fill: parent
    }

    Item {
        id: content
        anchors.fill: parent
        anchors.leftMargin: 8.0
        anchors.rightMargin: 8.0
        anchors.topMargin: 8.0
        clip: true

        TextField {
            id: search
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            font.family: Appearance.font.family.mono
            font.pointSize: Appearance.font.size.smaller

            placeholderText: qsTr("Enter application name...")

            onAccepted: {
                console.log("TEST");
            }

            onFocusChanged: console.log(focus)

            Keys.onEscapePressed: root.visibilities.launcher = false

            Connections {
                target: root.visibilities

                function onLauncherChanged(): void {
                    if (root.visibilities.launcher) {
                        search.focus = true;
                        search.forceActiveFocus();
                    } else {
                        search.text = "";
                        search.focus = false;
                    }
                }
            }
        }
    }
}
