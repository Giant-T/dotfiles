pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    readonly property Font font: Font {}

    component Font: QtObject {
        readonly property string mono: "0xProto"
        readonly property double size: 12.0
    }
}
