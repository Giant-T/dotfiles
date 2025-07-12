pragma ComponentBehavior: Bound

import "root:/widgets"
import "root:/services"
import "root:/config"

import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes
import QtQuick.Controls

Item {
    id: root
    required property PersistentProperties visibilities
    property real contentHeight: Math.min(300, search.height + (appList.contentHeight === 0 ? 0 : appList.contentHeight + 8.0) + 8.0)
    implicitHeight: visibilities.launcher ? root.contentHeight : 0
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

    function getModelValues(): var {
        const apps = Apps.search(search.text);
        return apps;
    }

    Item {
        id: content
        anchors.fill: parent
        anchors.leftMargin: 8.0
        anchors.rightMargin: 8.0
        anchors.topMargin: 8.0
        clip: true

        ListView {
            id: appList
            anchors.top: parent.top
            anchors.bottom: search.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottomMargin: 8.0
            Layout.fillWidth: true
            clip: true

            model: ScriptModel {
                values: root.getModelValues()
                onValuesChanged: appList.currentIndex = 0
            }
            spacing: 8.0

            delegate: Rectangle {
                implicitHeight: 50
                width: ListView.view?.width ?? 0

                radius: 8.0
                color: Colors.lightBackground
                required property int index
                required property DesktopEntry modelData
                border.color: Colors.active
                border.width: index == appList.currentIndex ? 2.0 : 0

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 8.0
                    clip: true
                    spacing: 8.0

                    IconImage {
                        id: appIcon
                        Layout.fillWidth: true
                        Layout.horizontalStretchFactor: -1

                        implicitSize: 32.0
                        source: Quickshell.iconPath(modelData.icon, true)
                        asynchronous: true
                        visible: false
                        Layout.preferredWidth: visible ? appIcon.implicitSize : 0
                        onStatusChanged: {
                            if (appIcon.status == Image.Ready) {
                                appIcon.visible = true
                            } else {
                                appIcon.visible = false
                            }
                        }
                    }

                    StyledText {
                        Layout.fillWidth: true
                        Layout.horizontalStretchFactor: 1
                        text: modelData.name
                    }
                }
            }

            highlight: Rectangle {
                color: Colors.active
                radius: 8.0
            }
        }

        TextField {
            id: search
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            font.family: Appearance.font.family.mono
            font.pointSize: Appearance.font.size.smaller
            color: Colors.text

            placeholderText: qsTr("Enter application name...")
            background: Rectangle {
                color: Colors.lightBackground
                radius: 8.0
            }

            onAccepted: {
                Apps.launch(appList.currentItem.modelData);
                root.visibilities.launcher = false;
            }

            Keys.onEscapePressed: root.visibilities.launcher = false
            Keys.onUpPressed: appList?.decrementCurrentIndex()
            Keys.onDownPressed: appList?.incrementCurrentIndex()

            Connections {
                target: root.visibilities

                function onLauncherChanged(): void {
                    if (root.visibilities.launcher) {
                        search.focus = true;
                        search.forceActiveFocus();
                    } else {
                        search.text = "";
                        search.focus = false;
                        appList.positionViewAtBeginning();
                        appList.currentIndex = 0;
                    }
                }
            }
        }
    }
}
