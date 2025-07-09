import "root:/services"

import Quickshell
import QtQuick
import QtQuick.Shapes

Shape {
    id: root
    ShapePath {
        strokeWidth: -1
        fillColor: Colors.background

        startX: -8.0
        startY: root.height

        PathArc {
            x: 0
            relativeY: -Math.min(8.0, root.height)
            radiusX: 8.0
            radiusY: 8.0
            direction: PathArc.Counterclockwise
        }
        PathLine {
            x: 0
            y: 8.0
        }

        PathArc {
            relativeX: 8.0
            relativeY: -8.0
            radiusX: 8.0
            radiusY: 8.0
        }
        PathLine {
            x: root.width - 8.0
            y: 0
        }

        PathArc {
            relativeX: 8.0
            relativeY: 8.0
            radiusX: 8.0
            radiusY: 8.0
        }
        PathLine {
            x: root.width
            y: root.height <= 8 ? root.height : root.height - 8.0
        }

        PathArc {
            x: root.width + 8.0
            y: root.height
            radiusX: 8.0
            radiusY: 8.0
            direction: PathArc.Counterclockwise
        }
        PathLine {
            x: -8.0
            y: root.height
        }
    }
}
