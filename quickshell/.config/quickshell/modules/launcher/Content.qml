pragma ComponentBehavior: Bound

import "root:/widgets"
import "root:/services"
import "root:/config"
import Quickshell
import QtQuick

Item {
    id: root

    required property PersistentProperties visibilities
    readonly property int padding: Appearance.padding.large
    readonly property int rounding: Appearance.rounding.large

    implicitWidth: listWrapper.width + padding * 2
    implicitHeight: searchWrapper.height + listWrapper.height + padding * 2

    anchors.top: parent.top
    anchors.horizontalCenter: parent.horizontalCenter

    Item {
        id: listWrapper

        implicitWidth: list.width
        implicitHeight: list.height + root.padding

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: searchWrapper.top
        anchors.bottomMargin: root.padding

        ContentList {
            id: list

            visibilities: root.visibilities
            search: search
            padding: root.padding
            rounding: root.rounding
        }
    }

    Rect {
        id: searchWrapper

        color: Colors.background
        radius: 8.0

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: root.padding

        implicitHeight: Math.max(searchIcon.implicitHeight, search.implicitHeight, clearIcon.implicitHeight)

        MaterialIcon {
            id: searchIcon

            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: root.padding

            text: "search"
            color: Colors.text
        }

        TextField {
            id: search

            anchors.left: searchIcon.right
            anchors.right: clearIcon.left
            anchors.leftMargin: Appearance.spacing.small
            anchors.rightMargin: Appearance.spacing.small

            topPadding: Appearance.padding.larger
            bottomPadding: Appearance.padding.larger

            placeholderText: qsTr("Search...")
            background: null

            onAccepted: {
                const currentItem = list.currentList?.currentItem;
                if (currentItem) {
                    Apps.launch(currentItem.modelData);
                    root.visibilities.launcher = false;
                }
            }

            Keys.onUpPressed: list.currentList?.decrementCurrentIndex()
            Keys.onDownPressed: list.currentList?.incrementCurrentIndex()

            Keys.onEscapePressed: root.visibilities.launcher = false

            Connections {
                target: root.visibilities

                function onLauncherChanged(): void {
                    if (root.visibilities.launcher)
                        search.focus = true;
                    else {
                        search.text = "";
                        const current = list.currentList;
                        if (current)
                            current.currentIndex = 0;
                    }
                }

                function onSessionChanged(): void {
                    if (root.visibilities.launcher && !root.visibilities.session)
                        search.focus = true;
                }
            }
        }

        MaterialIcon {
            id: clearIcon

            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: root.padding

            width: search.text ? implicitWidth : implicitWidth / 2
            opacity: {
                if (!search.text)
                    return 0;
                if (mouse.pressed)
                    return 0.7;
                if (mouse.containsMouse)
                    return 0.8;
                return 1;
            }

            text: "close"
            color: Colors.text

            MouseArea {
                id: mouse

                anchors.fill: parent
                hoverEnabled: true
                cursorShape: search.text ? Qt.PointingHandCursor : undefined

                onClicked: search.text = ""
            }

            Behavior on width {
                NumberAnimation {
                    duration: Appearance.anim.durations.small
                    easing.type: Easing.BezierSpline
                    easing.bezierCurve: Appearance.anim.curves.standard
                }
            }

            Behavior on opacity {
                NumberAnimation {
                    duration: Appearance.anim.durations.small
                    easing.type: Easing.BezierSpline
                    easing.bezierCurve: Appearance.anim.curves.standard
                }
            }
        }
    }
}
