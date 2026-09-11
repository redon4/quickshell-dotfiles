pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick
import Quickshell.Services.UPower

Singleton {
    id: root 
    readonly property real charge: UPower.displayDevice.percentage * 100
    readonly property string timeRem: 
    UPower.displayDevice.timeToFull === 0 // if its not plugged in
    ? formatTime(UPower.displayDevice.timeToEmpty)
    : formatTime(UPower.displayDevice.timeToFull)

    readonly property string color: 
    UPower.displayDevice.timeToEmpty === 0 ? "#00ff00" : // gets charged
    charge  <   0 ? "#606060" :
    charge  <   5 ? "#880000" :
    charge  <  20 ? "#ff0000" :
    charge  <  50 ? "#ffba0a" :
    charge === 69 ? "#2060ff" :
    "#009900"


    function formatTime(sec) {
        if (sec <= 0) { return "Unkown" }

        if ( sec < 3600 ) {
            return `${Math.floor(sec / 60)}m`
        }

        let min = Math.floor((sec % 3600) / 60)


        let hours = Math.floor(sec / 3600);

        return `${hours}h ${min}m`

    }
}
