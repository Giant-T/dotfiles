import "root:/widgets"
import "root:/services"

import Quickshell

Scope {
    id: root

    property bool launcherInterrupted

    CustomShortcut {
        name: "launcher"
        description: "Toggle launcher"
        onPressed: root.launcherInterrupted =  false
        onReleased: {
            const visibilities = Visibilities.getForActive();
            visibilities.launcher = !visibilities.launcher
        }
    }
}
