pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    readonly property string date: clock.date
    property string week: "00"

    SystemClock {
        id: clock
        precision: SystemClock.Minutes

        onDateChanged: {
            weekFetcher.running = true
        }
    }

    Process {
        id: weekFetcher
        command: ["date", "+%V"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: week = this.text.trim()
        }
    }
}
