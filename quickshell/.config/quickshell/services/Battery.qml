pragma Singleton

import Quickshell
import Quickshell.Services.UPower
import QtQuick

Singleton {
    id: root
    readonly property real percentage: Math.round(UPower.displayDevice.percentage * 100)
    readonly property string timeToEmpty: {
        const s = UPower.displayDevice.timeToEmpty;
        const hours = Math.floor(s / 3600) % 60;
        const minutes = Math.floor(s / 60) % 60;
        return `${hours < 10 ? '0' + hours : hours }:${minutes < 10 ? '0' + minutes : minutes}`;
    }
}
