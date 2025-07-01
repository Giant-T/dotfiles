pragma Singleton

import Quickshell
import Quickshell.Services.Notifications
import QtQuick

Singleton {
    id: root
    readonly property ListModel list: ListModel{}

    function remove(notif) {
        for (let i = 0; i < root.list.count; i++) {
            const item = root.list.get(i);
            if (item.notification === notif) {
                notif.dismiss();
                root.list.remove(i);
                return;
            }
        }
    }

    Timer { // Cleans up the list of notifications every seconds
        id: cleanupTimer
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            const now = Date.now();
            for (let i = 0; i < root.list.count; i++) {
                const item = root.list.get(i);
                if (item.expireAt <= now) {
                    item.notification.expire();
                    root.list.remove(i);
                }
            }
        }
    }

    NotificationServer {
        id: server

        onNotification: notif => {
            notif.tracked = true;
            const timeout = (notif.expireTimeout > 0 ? notif.expireTimeout : 5) * 1000;
            const expireAt = Date.now() + timeout;
            root.list.append({
                notification: notif,
                appName: notif.appName,
                summary: notif.summary,
                body: notif.body,
                expireAt: expireAt,
            });
        }
    }
}
