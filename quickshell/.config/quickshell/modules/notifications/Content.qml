import "root:/services"
import "root:/config"
import "root:/widgets"

import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Shapes

Item {
    id: root
    readonly property int numberOfNotifs: Notifications.list.count

    implicitWidth: 550
    implicitHeight: Math.min(numberOfNotifs > 0 ? notificationList.contentHeight + 8.0 * 2 : 0, 600)

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

            move: Transition {
                NumberAnimation {
                    properties: "y"
                    duration: Appearance.anim.durations.large
                    easing.type: Easing.BezierSpline
                    easing.bezierCurve: Appearance.anim.curves.expressiveDefaultSpatial
                }
            }
            displaced: Transition {
                NumberAnimation {
                    properties: "y"
                    duration: Appearance.anim.durations.large
                    easing.type: Easing.BezierSpline
                    easing.bezierCurve: Appearance.anim.curves.expressiveDefaultSpatial
                }
            }
            remove: Transition {
                NumberAnimation {
                    properties: "opacity,scale"
                    from: 1.0
                    to: 0.0
                    duration: Appearance.anim.durations.large + 100
                    easing.type: Easing.BezierSpline
                    easing.bezierCurve: Appearance.anim.curves.standard
                }
            }
        }
    }
}
