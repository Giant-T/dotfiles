import "root:/services"
import "root:/config"
import "root:/widgets"

import Quickshell
import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root
    required property string appName
    required property string summary
    required property string body

    Layout.alignment: Qt.AlignTop
    width: ListView.view?.width ?? 550
    implicitHeight: 100
    radius: 8.0
    // Ajouter une scroll bar + maxHeight
    color: Colors.lightBackground

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 8.0
        spacing: 4.0

        StyledText {
            text: appName ? `${appName} | ${summary}` : summary
            font.pointSize: Appearance.font.size.larger
            Layout.alignment: Qt.AlignTop
        }

        StyledText {
            text: body
            Layout.alignment: Qt.AlignTop
        }
    }
}
