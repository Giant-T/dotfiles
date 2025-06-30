import "root:/widgets"

import Quickshell

Scope {
    id: root

    property bool launcherInterrupted

    CustomShortcut {
        name: "launcher"
        description: "Toggle launcher"
        onPressed: root.launcherInterrupted =  false
        onReleased: {
            if (!root.launcherInterrupted) {
                const visibilities = Visibilities.getForActive();
                visibilities.launcher = !visibilities.launcher
            }
            root.launcherInterrupted = false;
        }
    }
}
