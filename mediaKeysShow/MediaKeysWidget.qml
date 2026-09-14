import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Io
import QtQuick

Scope {
    id: root

    property bool widgetVisible: false
    property bool timerRunning: false

    Variants {

        model: Quickshell.screens

        PanelWindow {
            id: volume

            // # Weird Stuff

            // the screen from the screens list will be injected into this
            // property (from docs)
            required property var modelData
            screen: modelData

            // # Visiblity


            visible: root.widgetVisible

            exclusionMode: ExclusionMode.Ignore
            aboveWindows: true

            anchors.bottom: true
            margins.bottom: 20

            implicitHeight: 35
            implicitWidth: 100


            color: "#1e1e2e"

            IpcHandler {
                target: "mediaKeysShow" // QuickShellBAR

                function unhide() {
                    root.widgetVisible = true
                    // console.log("before: " + root.timerRunning)
                    if (root.timerRunning === true ) {
                        // if it wouldn't get reset here, the timerRunning = true
                        // doesnt restart the timer and the widget disappears
                        // while you are pressing button
                        root.timerRunning = false
                    }
                    root.timerRunning = true

                    // console.log("after: " + root.timerRunning)
                }

            }

            // Content

            Row {
                anchors.centerIn: parent
                spacing: 5

                Text {
                    color: "#ffffff"
                    // so that it doesn't change the layout
                    text: Volume.volume.toString().padStart(3, " ") + "%"
                }

                Rectangle {
                    color: "#000000"
                    implicitWidth: 50
                    implicitHeight: 20

                    anchors.verticalCenter: parent.verticalCenter

                    Rectangle {
                        // this exist so that
                        // 1. the layout doesnt change when this gets smaller
                        // 2. the black bg from the parent is a nice effect
                        color: "#aaaaaa"

                        implicitWidth: parent.width * (Volume.volume / 100)
                        implicitHeight: parent.height
                    }
                }
            }
        }

    }

    Timer {
        interval: 2000
        running: root.timerRunning

        onTriggered: {
            root.widgetVisible = false
            // needs to be reset manually
            root.timerRunning = false
        }
    }
}
