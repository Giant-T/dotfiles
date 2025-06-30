import "root:/services"
import "root:/config"
import "root:/widgets"

import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    required property Item bar
    readonly property int numberOfNotifs: Notifications.list.count

    implicitWidth: 550
    implicitHeight: Math.min(numberOfNotifs > 0 ? 100 * numberOfNotifs + 8 * (numberOfNotifs + 1) : 0, 600)

    Behavior on implicitHeight {
        NumberAnimation {
            duration: Appearance.anim.durations.expressiveDefaultSpatial
            easing.type: Easing.BezierSpline
            easing.bezierCurve: Appearance.anim.curves.expressiveDefaultSpatial
        }
    }

    Rectangle {
        // TODO: add rounded in corners
        color: Colors.background
        bottomLeftRadius: 8.0
        anchors.fill: parent
    }

    ScrollView {
        anchors.fill: parent
        anchors.topMargin: 8.0
        anchors.bottomMargin: 8.0
        anchors.leftMargin: 8.0
        clip: true

        ListView {
            id: notificationList
            spacing: 8.0
            anchors.fill: parent
            model: Notifications.list
            delegate: Notification { }

            remove: Transition {
                NumberAnimation {
                    properties: "opacity"
                    from: 1.0
                    to: 0.0
                    duration: Appearance.anim.durations.expressiveDefaultSpatial
                    easing.type: Easing.BezierSpline
                    easing.bezierCurve: Appearance.anim.curves.expressiveDefaultSpatial
                }
            }
        }
    }
}
