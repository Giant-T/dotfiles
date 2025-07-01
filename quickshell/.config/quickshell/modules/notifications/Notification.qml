import "root:/services"
import "root:/config"
import "root:/widgets"

import Quickshell
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root
    required property int notifId
    required property string appName
    required property string summary
    required property string body

    Layout.alignment: Qt.AlignTop
    width: ListView.view?.width ?? 550
    implicitHeight: 100
    radius: 8.0
    // Ajouter une scroll bar + maxHeight
    color: Colors.lightBackground

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: () => {
            Notifications.remove(notifId);
        }

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 8.0
            spacing: 4.0

            StyledText {
                id: title
                text: appName ? `${appName} | ${summary}` : summary
                font.pointSize: Appearance.font.size.larger
                Layout.alignment: Qt.AlignTop
                Layout.fillWidth: true
                elide: Text.ElideRight
            }

            StyledText {
                id: description
                text: body
                color: Colors.darkText
                wrapMode: Text.Wrap
                elide: Text.ElideRight
                Layout.alignment: Qt.AlignTop
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }
}
