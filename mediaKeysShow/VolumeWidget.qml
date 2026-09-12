import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Io
import QtQuick

Scope {
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

            color: "#1e1e2e"

            //            visible: false

            exclusionMode: ExclusionMode.Ignore
            aboveWindows: true

            anchors.top: true

            implicitHeight: 20
            implicitWidth: 50



            IpcHandler {
                target: "mediaKeysShow" // QuickShellBAR

                function hide() {
                    bar.visible = false
                    // console.log("hide called")
                }

            }

            // Content

            Row {

                Text {
                    color: "#ffffff"
                    text: Volume.volume + "%"

                }
            }

        }

    }

//    Timer {
//        interval: 5000
//
//        onTriggerd: 
//    }
}
