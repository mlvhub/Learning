import QtQuick 2.4
import QtQuick.Controls 1.3

ApplicationWindow {
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true

    property date myDate: "2014-05-30"

    VerticalField {
        labelId.text: "New Label"
        textId.text: "1000.00"
    }

    Rectangle {
        width: textId.width+10
        height: textId.height+5
        color: "dodgerBlue"
        anchors.centerIn: parent
        Text {
            x: 0
            y: 30
            id: textId
            text: qsTr("Welcome to QT Quick Fundamentals")
            //anchors.centerIn: parent
            font.pixelSize: 24
        }
    }
}
