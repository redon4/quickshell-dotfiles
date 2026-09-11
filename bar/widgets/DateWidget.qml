import QtQuick
import ".."

Text {
    text: {
        Qt.formatDateTime(Time.date, "ddd dd. | MM./MMM") 
        + ` | CW ${Time.week} | ` 
        + Qt.formatDateTime(Time.date, "yyyy") 
    }
}
