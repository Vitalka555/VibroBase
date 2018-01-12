import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2

Item {
    id: item
    Rectangle {
        id: rec_buttons
        anchors.centerIn: parent
        width: text_common.width
        height: but_common.height+but_manufacturers.height+but_personal.height+but_norms.height+60
        Button {
            id: but_common
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            width: text_common.width+50
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_common
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 20
                color: "white"
                text: "Общие таблицы списков"
            }
            onClicked: {
                stackView.replace(commonSettings)
                tool_left.visible = false
                tool_left1.visible = false
                tool_left2.visible = false
                tool_left3.visible = true
            }
        }
        Button {
            id: but_manufacturers
            anchors.top: but_common.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            width: but_common.width
            height: but_common.height
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_manufacturers
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 20
                color: "white"
                text: "Производители"
            }
            onClicked: {
                stackView.replace(factorySettings)
                tool_left.visible = false
                tool_left1.visible = false
                tool_left2.visible = false
                tool_left3.visible = true
            }
        }
        Button {
            id: but_personal
            anchors.top: but_manufacturers.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            width: but_common.width
            height: but_common.height
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_personal
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 20
                color: "white"
                text: "Персонал"
            }
            onClicked: {
                stackView.replace(personalSettings)
                tool_left.visible = false
                tool_left1.visible = false
                tool_left2.visible = false
                tool_left3.visible = true
            }
        }
        Button {
            id: but_norms
            anchors.top: but_personal.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            width: but_common.width
            height: but_common.height
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_norms
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 20
                color: "white"
                text: "Нормы вибрации"
            }
            onClicked: {
                stackView.replace(vibrationSettings)
                tool_left.visible = false
                tool_left1.visible = false
                tool_left2.visible = false
                tool_left3.visible = true
            }
        }
    }

}
