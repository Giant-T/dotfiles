import "root:/services"

import Quickshell
import QtQuick
import QtQuick.Shapes

Shape {
    id: background
    ShapePath {
        strokeWidth: -1
        fillColor: Colors.background

        startX: -8.0
        startY: 0

        PathArc  {
            relativeX: 8.0
            relativeY: Math.min(8.0, background.height)
            radiusX: 8.0
            radiusY: 8.0
        }
        PathLine {
            x: 0
            y: background.height - 8.0
        }

        PathArc {
            relativeX: 8.0
            relativeY: 8.0
            radiusX: 8.0
            radiusY: 8.0
            direction: PathArc.Counterclockwise
        }
        PathLine {
            x: background.width - 8.0
            y: background.height
        }

        PathArc  {
            relativeX: 8.0
            relativeY: 8.0
            radiusX: 8.0
            radiusY: 8.0
        }
        PathLine {
            x: background.width
            y: 0
        }
        PathLine {
            x: 0
            y: 0
        }
    }
}
