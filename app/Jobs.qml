import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2
import "."

ColumnLayout{
    function updateStartJobsModel(startJobOption) {
        startJobModel.append({startJobOption: startJobOption})
        if (startJobComboBox.count > 0 && startJobComboBox.currentIndex == -1)
            startJobComboBox.currentIndex = 0
    }

    Layout.fillWidth: true

    Menu { //Should this menu be for every job or is there some other way?
        id: menu
        width: 108

        MenuItem{ text: qsTr("Pause"); font.pixelSize: Style.textSize; height: 24; }
        MenuItem{ text: qsTr("Stop"); font.pixelSize: Style.textSize; height: 24; }
        MenuItem{ text: qsTr("Cancel"); font.pixelSize: Style.textSize; height: 24 }
        MenuItem{ text: qsTr("Repeat"); font.pixelSize: Style.textSize; height: 24; }
    }

    Rectangle {
        width: parent.width
        height: location_heading.contentHeight // Since "Location" is the biggest word in this row,
                                               // it will be the first to get wrapped
        Text {
            x: 20
            y: 10
            width: parent.width/3 - 20
            text: "Printer"
            font.bold: true
            wrapMode: Text.Wrap
        }

        Text {
            id: location_heading
            x: parent.width/3 + 20
            y: 10
            width: parent.width/3 - 20
            text: "Location"
            font.bold: true
            wrapMode: Text.Wrap
        }

        Text {
            x: 2*parent.width/3 + 20
            y: 10
            width: parent.width/3 - 20
            text: "Status"
            font.bold: true
            wrapMode: Text.Wrap
        }
    }

    ListView {
        id: jobs_view
        width: parent.width
        height: parent.height - 200
        model: jobsList
        y: location_heading.contentHeight + 20

        delegate: Rectangle {
            width: parent.width
            height: Math.max(printer_text.contentHeight, location_text.contentHeight, status_text.contentHeight) + 10
            color: (model.index % 2 == 0) ? "#EEEEEE" : "white"
            property variant stringList: jobsList[index].split('%')

           MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                hoverEnabled: true

                onEntered: { parent.color = "#BDBDBD"}
                onExited:  { parent.color = (model.index % 2 == 0) ? "#EEEEEE" : "white"}
                onClicked: {
                    menu.x = mouseX
                    menu.y = mouseY
                    menu.open()
                }
            }

            Text {
                id: printer_text
                x: 20
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width/3 - 20
                text: stringList[0]
                wrapMode: Text.Wrap
            }

            Text {
                id: location_text
                x: parent.width/3 + 20
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width/3 - 20
                text: stringList[1]
                wrapMode: Text.Wrap
            }

            Text {
                id: status_text
                x: 2*parent.width/3 + 20
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width/3 - 20
                text: stringList[2]
                wrapMode: Text.Wrap
            }
        }
    }

    RowLayout {
        id: startJobRowLayout
        anchors.top: jobs_view.bottom
        anchors.topMargin: 20
        anchors.leftMargin: 20

        Label {
            text: qsTr("Start Job: ")
            font.pixelSize: Style.textSize
        }

        ListModel {
            id: startJobModel
        }

        ComboBox {
            id: startJobComboBox
            font.pixelSize: Style.textSize
            model: startJobModel

            delegate: ItemDelegate {
                width: startJobComboBox.width
                text: qsTr(startJobOption)
                font.pixelSize: Style.textSize
            }
        }
    }

    RowLayout {
        id: saveJobRowLayout
        anchors.top: startJobRowLayout.bottom
        Label {
            text: qsTr("Save Job: ")
            font.pixelSize: Style.textSize
        }

        Switch {
            id: save_job_switch
        }

        Button {
            text: qsTr("Browse")
            font.pixelSize: Style.textSize
            visible: (save_job_switch.checked) ? true : false
            onClicked: { file_dialog.open() }
        }
    }

    RowLayout {
        anchors.top: saveJobRowLayout.bottom
        Label {
            text: qsTr("Location: ")
            font.pixelSize: Style.textSize
            visible: (save_job_switch.checked) ? true : false
        }

        Text {
            id: save_job_location
            text: qsTr("None")
            font.pixelSize: Style.textSize
            visible: (save_job_switch.checked) ? true : false
        }
    }

    FileDialog {
        id: file_dialog
        title: qsTr("Please choose a folder")
        folder: shortcuts.home
        selectFolder: true
        onAccepted: {
            save_job_location.text = file_dialog.fileUrl.toString().substring(7)
            file_dialog.close()
        }
        onRejected: {
            file_dialog.close()
        }
    }
}
