pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root
    readonly property list<DesktopEntry> apps: DesktopEntries.applications.values.filter(entry => !entry.noDisplay || entry.runInTerminal)

    function search(query: string): var { // TODO: change it to fuzzy finding
        return apps.filter(app => app.name.toLowerCase().includes(query.toLowerCase()));
    }

    function launch(entry: DesktopEntry): void {
        entry.execute();
    }
}
