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
        startY: 0

        PathArc {
            relativeX: 8.0
            relativeY: Math.min(8.0, root.height)
            radiusX: 8.0
            radiusY: 8.0
        }
        PathLine {
            x: 0
            y: root.height - 8.0
        }

        PathArc {
            relativeX: 8.0
            relativeY: 8.0
            radiusX: 8.0
            radiusY: 8.0
            direction: PathArc.Counterclockwise
        }
        PathLine {
            x: root.width - 8.0
            y: root.height
        }

        PathArc  {
            relativeX: 8.0
            relativeY: 8.0
            radiusX: 8.0
            radiusY: 8.0
        }
        PathLine {
            x: root.width
            y: 0
        }
        PathLine {
            x: 0
            y: 0
        }
    }
}
