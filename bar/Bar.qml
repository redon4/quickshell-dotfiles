import Quickshell
import Quickshell.Io
import QtQuick
import "widgets"

Scope {
    Variants {

        model: Quickshell.screens

        PanelWindow {
            id: bar

// # Weird Stuff

            // the screen from the screens list will be injected into this
            // property (from docs)
            required property var modelData
            screen: modelData

// # Visiblity

            color: "#1e1e2e"

            visible: false

            exclusionMode: ExclusionMode.Ignore
            aboveWindows: true


            IpcHandler {
                target: "qsbar" // QuickShellBAR

                function hide() {
                    bar.visible = false
                    // console.log("hide called")
                }

                function unhide() { // unhide because SHOW IS PREDEFINED
                    bar.visible = true
                    // console.log("show called")
                }
            }

// # Positioning

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 40

// # Widgets

            DateWidget {
                color: "#ffffff"
                anchors.left: parent.left
                anchors.leftMargin: 15

                anchors.verticalCenter: parent.verticalCenter
            }

            TimeWidget {
                color: "#ffffff"
                anchors.centerIn: parent
            }

            BatteryWidget { 
                color: "#ffffff"
                anchors.right: parent.right
                anchors.rightMargin: 15

                anchors.verticalCenter: parent.verticalCenter
                
            }
        }

    }

}
