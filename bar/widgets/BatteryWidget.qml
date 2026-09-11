import QtQuick
import Quickshell.Services.UPower
import ".."

Row {
    id: root

    spacing: 5

    property color
    color: "#ffffff"
    Text {
        id: batteryCharge
        color: root.color
        text: `${Battery.charge}%`

    }

    Rectangle {
        color: Battery.color
        implicitHeight: parent.height
        implicitWidth: parent.height
    }

    Text {
        id: batteryTime
        color: root.color
        text: `${Battery.timeRem} rem.`

        anchors.leftMargin: 30
    }
}
