import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    property alias general: general
    property alias moreOptions: moreOptions

    id: applicationWindow
    visible: true
    width: 650
    height: 500
    minimumWidth: 650
    minimumHeight: 500
    maximumWidth: 650
    maximumHeight: 500
    title: qsTr("Print Document")

    General {
        id: general
        visible: true
    }

    MoreOptions {
        id: moreOptions
        visible: false
    }
}
