import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.LocalStorage 2.0
import QtQuick.Controls.Material 2.2
import QtQuick.Controls.Styles 1.4

Item {
    id: item
    Page {
        id: page
        anchors.fill: parent
        Text {
            id: text_name
            anchors.verticalCenter: tf_name.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Наименование подшипника:"
        }
        TextField {
            id: tf_name
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: text_name.right
            anchors.leftMargin: 5
            focus: true
            selectByMouse: true
            persistentSelection: true
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_name.x = mouseX
                    contextMenu_name.y = mouseY
                    contextMenu_name.open()
                }
            }
            Menu {
                id: contextMenu_name
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_name.selectedText
                    onTriggered: tf_name.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_name.selectedText
                    onTriggered: tf_name.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_name.canPaste
                    onTriggered: tf_name.paste()
                }
            }
        }
        Text {
            id: text_obRU
            anchors.verticalCenter: tf_obRU.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "ОбозначениеRU:"
        }
        TextField {
            id: tf_obRU
            anchors.top: tf_name.bottom
            anchors.topMargin: 5
            anchors.right: tf_dinamic.right
            anchors.left: text_obRU.right
            anchors.leftMargin: 5
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_obRU.x = mouseX
                    contextMenu_obRU.y = mouseY
                    contextMenu_obRU.open()
                }
            }
            Menu {
                id: contextMenu_obRU
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_obRU.selectedText
                    onTriggered: tf_obRU.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_obRU.selectedText
                    onTriggered: tf_obRU.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_obRU.canPaste
                    onTriggered: tf_obRU.paste()
                }
            }
        }
        Text {
            id: text_obEN
            anchors.verticalCenter: tf_obEN.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "ОбозначениеEN:"
        }
        TextField {
            id: tf_obEN
            anchors.top: tf_obRU.bottom
            anchors.topMargin: 5
            anchors.right: tf_dinamic.right
            anchors.left: text_obEN.right
            anchors.leftMargin: 5
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_obEN.x = mouseX
                    contextMenu_obEN.y = mouseY
                    contextMenu_obEN.open()
                }
            }
            Menu {
                id: contextMenu_obEN
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_obEN.selectedText
                    onTriggered: tf_obEN.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_obEN.selectedText
                    onTriggered: tf_obEN.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_obEN.canPaste
                    onTriggered: tf_obEN.paste()
                }
            }
        }
        Text {
            id: text_D
            anchors.verticalCenter: tf_D.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Наружный диаметр, мм:"
        }
        TextField {
            id: tf_D
            anchors.top: tf_obEN.bottom
            anchors.topMargin: 5
            anchors.right: tf_dinamic.right
            anchors.left: tf_dinamic.left
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_D.x = mouseX
                    contextMenu_D.y = mouseY
                    contextMenu_D.open()
                }
            }
            Menu {
                id: contextMenu_D
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_D.selectedText
                    onTriggered: tf_D.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_D.selectedText
                    onTriggered: tf_D.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_D.canPaste
                    onTriggered: tf_D.paste()
                }
            }
        }
        Text {
            id: text_d
            anchors.verticalCenter: tf_d.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Внутренний диаметр, мм:"
        }
        TextField {
            id: tf_d
            anchors.top: tf_D.bottom
            anchors.topMargin: 5
            anchors.right: tf_dinamic.right
            anchors.left: tf_dinamic.left
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_d.x = mouseX
                    contextMenu_d.y = mouseY
                    contextMenu_d.open()
                }
            }
            Menu {
                id: contextMenu_d
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_d.selectedText
                    onTriggered: tf_d.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_d.selectedText
                    onTriggered: tf_d.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_d.canPaste
                    onTriggered: tf_d.paste()
                }
            }
        }
        Text {
            id: text_B
            anchors.verticalCenter: tf_B.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Ширина подшипника, мм:"
        }
        TextField {
            id: tf_B
            anchors.top: tf_d.bottom
            anchors.topMargin: 5
            anchors.right: tf_dinamic.right
            anchors.left: tf_dinamic.left
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_B.x = mouseX
                    contextMenu_B.y = mouseY
                    contextMenu_B.open()
                }
            }
            Menu {
                id: contextMenu_B
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_B.selectedText
                    onTriggered: tf_B.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_B.selectedText
                    onTriggered: tf_B.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_B.canPaste
                    onTriggered: tf_B.paste()
                }
            }
        }
        Text {
            id: text_dtk
            anchors.verticalCenter: tf_dtk.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Диаметр тел качения, мм:"
        }
        TextField {
            id: tf_dtk
            anchors.top: tf_B.bottom
            anchors.topMargin: 5
            anchors.right: tf_dinamic.right
            anchors.left: tf_dinamic.left
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_dtk.x = mouseX
                    contextMenu_dtk.y = mouseY
                    contextMenu_dtk.open()
                }
            }
            Menu {
                id: contextMenu_dtk
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_dtk.selectedText
                    onTriggered: tf_dtk.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_dtk.selectedText
                    onTriggered: tf_dtk.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_dtk.canPaste
                    onTriggered: tf_dtk.paste()
                }
            }
        }
        Text {
            id: text_z
            anchors.verticalCenter: tf_z.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Количество тел качения, шт:"
        }
        TextField {
            id: tf_z
            anchors.top: tf_dtk.bottom
            anchors.topMargin: 5
            anchors.right: tf_dinamic.right
            anchors.left: tf_dinamic.left
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_z.x = mouseX
                    contextMenu_z.y = mouseY
                    contextMenu_z.open()
                }
            }
            Menu {
                id: contextMenu_z
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_z.selectedText
                    onTriggered: tf_z.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_z.selectedText
                    onTriggered: tf_z.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_z.canPaste
                    onTriggered: tf_z.paste()
                }
            }
        }
        Text {
            id: text_u
            anchors.verticalCenter: tf_u.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Угол контакта, град:"
        }
        TextField {
            id: tf_u
            anchors.top: tf_z.bottom
            anchors.topMargin: 5
            anchors.right: tf_dinamic.right
            anchors.left: tf_dinamic.left
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_u.x = mouseX
                    contextMenu_u.y = mouseY
                    contextMenu_u.open()
                }
            }
            Menu {
                id: contextMenu_u
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_u.selectedText
                    onTriggered: tf_u.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_u.selectedText
                    onTriggered: tf_u.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_u.canPaste
                    onTriggered: tf_u.paste()
                }
            }
        }
        Text {
            id: text_m
            anchors.verticalCenter: tf_m.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Масса, кг:"
        }
        TextField {
            id: tf_m
            anchors.top: tf_u.bottom
            anchors.topMargin: 5
            anchors.right: tf_dinamic.right
            anchors.left: tf_dinamic.left
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_m.x = mouseX
                    contextMenu_m.y = mouseY
                    contextMenu_m.open()
                }
            }
            Menu {
                id: contextMenu_m
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_m.selectedText
                    onTriggered: tf_m.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_m.selectedText
                    onTriggered: tf_m.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_m.canPaste
                    onTriggered: tf_m.paste()
                }
            }
        }
        Text {
            id: text_static
            anchors.verticalCenter: tf_static.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Статическая грузоподъемность, Н:"
        }
        TextField {
            id: tf_static
            anchors.top: tf_m.bottom
            anchors.topMargin: 5
            anchors.right: tf_dinamic.right
            anchors.left: tf_dinamic.left
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_static.x = mouseX
                    contextMenu_static.y = mouseY
                    contextMenu_static.open()
                }
            }
            Menu {
                id: contextMenu_static
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_static.selectedText
                    onTriggered: tf_static.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_static.selectedText
                    onTriggered: tf_static.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_static.canPaste
                    onTriggered: tf_static.paste()
                }
            }
        }
        Text {
            id: text_dinamic
            anchors.verticalCenter: tf_dinamic.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Динамическая грузоподъемность, Н:"
        }
        TextField {
            id: tf_dinamic
            anchors.top: tf_static.bottom
            anchors.topMargin: 5
            width: 100
            anchors.left: text_dinamic.right
            anchors.leftMargin: 5
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_dinamic.x = mouseX
                    contextMenu_dinamic.y = mouseY
                    contextMenu_dinamic.open()
                }
            }
            Menu {
                id: contextMenu_dinamic
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_dinamic.selectedText
                    onTriggered: tf_dinamic.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_dinamic.selectedText
                    onTriggered: tf_dinamic.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_dinamic.canPaste
                    onTriggered: tf_dinamic.paste()
                }
            }
        }
        footer: ToolBar {
                id: rec_button
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                ToolButton {
                    id: but_save
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    text: "Сохранить"
                    onClicked: {
                        tf_d.text = tf_d.text.replace(",", ".")
                        tf_D.text = tf_D.text.replace(",", ".")
                        tf_B.text = tf_B.text.replace(",", ".")
                        tf_dtk.text = tf_dtk.text.replace(",", ".")
                        tf_z.text = tf_z.text.replace(",", ".")
                        tf_u.text = tf_u.text.replace(",", ".")
                        tf_m.text = tf_m.text.replace(",", ".")
                        tf_static.text = tf_static.text.replace(",", ".")
                        tf_dinamic.text = tf_dinamic.text.replace(",", ".")
                        database.insertIntoBearing(tf_name.text, tf_obRU.text, tf_obEN.text, tf_d.text, tf_D.text, tf_B.text,
                                                   tf_dtk.text, tf_z.text, tf_u.text, tf_m.text, tf_static.text, tf_dinamic.text)
                        model_podsh.updateModel()
                        stackView.replace(bearingSettings)
                        tool_left3.visible = true
                        tool_left4.visible = false
                    }
                }
                ToolButton {
                    id: but_cancel
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                    text: "Отмена"
                    onClicked: {
                        stackView.replace(bearingSettings)
                        tool_left3.visible = true
                        tool_left4.visible = false
                    }
                }
            }
    }
}
