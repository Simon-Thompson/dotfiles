import Quickshell
import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt.labs.folderlistmodel 2.1

// Popup wrapper so we can open it with a keybind
Item {
Popup {
    id: pickerPopup
    modal: true
    focus: true
    implicitWidth: 900
    implicitHeight: 600

    // --- Wallpaper directory ---
    FolderListModel {
        id: wallpapers
        folder: "/home/vacuum/Pictures/Wallpapers"
        nameFilters: ["*.jpg", "*.jpeg", "*.png", "*.webp"]
    }

    Column {
        anchors.fill: parent
        spacing: 10
        padding: 10

        // --- Toolbar ---
        Row {
            spacing: 10

            ComboBox {
                id: transitionType
                model: ["fade", "grow", "wipe", "outer", "inner"]
                currentIndex: 0
            }

            Slider {
                id: duration
                from: 200
                to: 3000
                value: 800
                width: 200
            }

            Label {
                text: duration.value.toFixed(0) + " s"
            }

            Button {
                text: "Random"
                onClicked: {
                    if (wallpapers.count > 0) {
                        let idx = Math.floor(Math.random() * wallpapers.count)
                        let file = wallpapers.get(idx).fileURL

                        shell.runCommand(
                            `awww img "${file}" --transition-type ${transitionType.currentText} --transition-duration ${duration.value}`
                        )

                        shell.runCommand(`echo "${file}" > ~/.cache/last-wallpaper`)
                    }
                }
            }
        }

        // --- Wallpaper grid ---
        GridView {
            id: grid
            anchors.fill: parent
            cellWidth: 200
            cellHeight: 120
            model: wallpapers
            clip: true

            delegate: Rectangle {
                implicitWidth: 180
                implicitHeight: 100
                border.width: 1
                border.color: "#444"
                radius: 4

                Image {
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectCrop
                    source: fileURL
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        shell.runCommand(
                            `awww img "${fileURL}" --transition-type ${transitionType.currentText} --transition-duration ${duration.value}`
                        )

                        // Save last wallpaper
                        shell.runCommand(`echo "${fileURL}" > ~/.cache/last-wallpaper`)

                        // Close popup after selection (optional)
                        pickerPopup.close()
                    }
                }
            }
        }
    }
}
}

