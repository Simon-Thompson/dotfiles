import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: root
    width: 1920
    height: 1080
    visible: true
    title: "QuickShell"
    color: "transparent"
    flags: Qt.Window | Qt.FramelessWindowHint

    TopSection {
        id: topSection
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
    }

    CenterSection {
        id: centerSection
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
    }

    BottomSection {
        id: bottomSection
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
    }
}
