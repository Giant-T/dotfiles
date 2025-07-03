import "root:/services"
import "root:/config"
import "root:/widgets"

import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts

// TODO: after launcher
// - Expand button
// - info icon if no provided appIcon
// - value hints
// - hold notification on hover
// - app actions?
Rectangle {
    id: root
    required property int notifId
    required property string appName
    required property string appIcon
    required property string summary
    required property string body

    Layout.alignment: Qt.AlignTop
    width: ListView.view?.width ?? 550
    implicitHeight: Math.min(contentHeight, 100)
    readonly property real contentHeight: {
        let iconH = icon.implicitSize;
        let contentH = title.implicitHeight + description.implicitHeight + content.spacing;
        return Math.max(iconH, contentH) + 8.0 * 2;
    }

    clip: true
    radius: 8.0
    color: Colors.lightBackground

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: () => {
            Notifications.remove(notifId);
        }

        RowLayout {
            spacing: 8.0
            clip: true
            anchors.fill: parent
            anchors.margins: 8.0

            IconImage {
                id: icon
                anchors.top: parent.top
                Layout.fillWidth: true
                Layout.horizontalStretchFactor: -1

                implicitSize: 50.0
                source: Quickshell.iconPath(root.appIcon)
                asynchronous: true
                visible: root.appIcon !== ""
                Layout.preferredWidth: visible ? implicitSize: 0
            }

            ColumnLayout {
                id: content
                spacing: 4.0
                anchors.margins: 8.0
                Layout.fillWidth: true
                Layout.horizontalStretchFactor: 1
                clip: true

                StyledText {
                    id: title

                    text: appName ? `${appName} • ${summary}` : summary
                    font.pointSize: Appearance.font.size.larger
                    maximumLineCount: 1
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                }

                StyledText {
                    id: description

                    text: body
                    color: Colors.darkText
                    wrapMode: Text.Wrap
                    maximumLineCount: undefined
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                }
            }
        }
    }
}
