import QtQuick 2.15

Rectangle {
    height: 50
    color: "transparent"
    property string currentTime: Qt.formatTime(new Date(), "hh:mm:ss")

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: currentTime = Qt.formatTime(new Date(), "hh:mm:ss")
    }

    Text {
        anchors.centerIn: parent
        text: "Top Section"
    }

    Text {
        text: currentTime
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 16
        font.pixelSize: 18
        color: "white"
    }
}
