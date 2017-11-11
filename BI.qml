import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.LocalStorage 2.0
//import QtQuick.Controls.Material 2.2
import QtQuick.Controls.Styles 1.4

Item {
    id: item
    Page {
        anchors.fill: parent
    Rectangle {
        id: rec_0
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 55
    }
    footer:    ToolBar {
            id: rec_button
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            ToolButton {
                id: but_creat
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: 5
                text: "Создать"
                onClicked: {
                    stackView.replace(creatBI)
                    tool_left.visible = false
                    tool_left1.visible = true
                }
            }
            ToolButton {
                id: but_redakt
                anchors.bottom: parent.bottom
                //anchors.bottomMargin: 5
                anchors.left: but_creat.right
                anchors.leftMargin: 5
    //            highlighted: true
    //            Material.accent: Material.LightBlue
                text: "Редактировать"
            }
            ToolButton {
                id: but_delete
                anchors.bottom: parent.bottom
                //anchors.bottomMargin: 5
                anchors.right: parent.right
                anchors.rightMargin: 5
    //            highlighted: true
    //            Material.accent: Material.LightBlue
                text: "Удалить"
                onClicked: {
//                    database.removeRecord(model0.getId(list.currentIndex))
//                    model0.updateModel()
                }
            }
        }
    }

}
