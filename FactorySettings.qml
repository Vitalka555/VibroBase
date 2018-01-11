import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3
Item {
    id: item
    Rectangle {
        id: rec1
        anchors.top: parent.top
        anchors.left: parent.left
        height: parent.height
        width: parent.width/2
        border.width: 1
        border.color: "#03a9f5"
        //color: "yellow"
        Text {
            id: text_fac_ed
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Предприятия-изготовители электродвигателей:"
        }
        TextField {
            id: tf_fac_ed
            anchors.top: text_fac_ed.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: but_fac_ed.left
            anchors.rightMargin: 5
            height: but_fac_ed.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            placeholderText: "Введите наименование завода"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_fac_ed.x = mouseX
                    contextMenu_fac_ed.y = mouseY
                    contextMenu_fac_ed.open()
                }
            }
            Menu {
                id: contextMenu_fac_ed
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_fac_ed.selectedText
                    onTriggered: tf_fac_ed.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_fac_ed.selectedText
                    onTriggered: tf_fac_ed.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_fac_ed.canPaste
                    onTriggered: tf_fac_ed.paste()
                }
            }
        }
        Button {
            id: but_fac_ed
            anchors.top: text_fac_ed.bottom
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: height - 10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 20
                color: "white"
                text: "+"
            }
            onClicked: {
                database.insertIntoProizvodElPriv(tf_fac_ed.text)
                model_proizved.updateModel()
                tf_fac_ed.clear()
            }
        }
        Rectangle {
            id: rec_number_fac_ed
            anchors.top: tf_fac_ed.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            height: 30
            width: (parent.width-15)/9
            radius: 10
            color: "#03a9f5"
            Text {
                id: text_number_fac_ed
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                text: qsTr("№")
            }
        }
        Rectangle {
            id: rec_name_fac_ed
            anchors.top: tf_fac_ed.bottom
            anchors.topMargin: 5
            anchors.left: rec_number_fac_ed.right
            anchors.leftMargin: 5
            height: 30
            width: (parent.width-15)*8/9
            radius: 10
            color: "#03a9f5"
            Text {
                id: text_name_fac_ed
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                text: qsTr("Наименование")
            }
        }
        Rectangle {
            id: rec_list_fac_ed
            anchors.top: rec_number_fac_ed.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: but_del_fac_ed.top
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_fac_ed
                anchors.fill: parent
                property real h: 30
                ListView {
                    id: list_fac_ed
                    anchors.fill: parent
                    clip: true
                    model: model_proizved
                    delegate: delegate_fac_ed
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    //currentIndex: window.index
                    ScrollBar.vertical: ScrollBar { id: vbar_fac_ed;
                                                hoverEnabled: true
                                                active: hovered || pressed
                                                orientation: Qt.Vertical
                                                //size: frame.height / content.height
                                                anchors.top: parent.top
                                                anchors.right: parent.right
                                                anchors.bottom: parent.bottom
                                                width: 10
                                    }
                }
                Component {
                    id: delegate_fac_ed
                    Item {
                        id: item_table_fac_ed
                        width: rec1.width
                        height: flick_fac_ed.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec1_fac_ed
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: (parent.width-15)/9
                            height: flick_fac_ed.h//text1.height*2
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_fac_ed.col
                            RowLayout {
                                id: lay1_fac_ed
                                anchors.fill: parent
                                Text {
                                    id: text1_fac_ed
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"
                                    text: number+1
                                }
                            }
                        }
                        Rectangle {
                            id: rec2_fac_ed
                            anchors.top: parent.top
                            anchors.left: rec1_fac_ed.right
                            anchors.leftMargin: 5
                            width: (parent.width-15)*8/9
                            height: flick_fac_ed.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_fac_ed.col
                            RowLayout {
                                id: lay2_fac_ed
                                anchors.fill: parent
                                Text {
                                    id: text2_fac_ed
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Proizvedname
                                }
                            }
                        }
                        MouseArea {
                            id: mouse_fac_ed
                            anchors.fill: parent
                            onClicked: list_fac_ed.currentIndex = model.index//model0.index()
                        }
                    }//item_table_ceh
                }//delegate
                Component {
                    id: highlightBar_fac_ed
                    Rectangle {
                        id: hl1_fac_ed
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_fac_ed.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_fac_ed.currentItem.x
                        y: list_fac_ed.currentItem.y
                    }
                }

            }
        }//rec_list_ceh
        Button {
            id: but_del_fac_ed
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_fac_ed.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_fac_ed
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordProizvodElPriv(model_proizved.getId(list_fac_ed.currentIndex))
                model_proizved.updateModel()
            }
        }
    }//end rec1
    Rectangle {
        id: rec2
        anchors.top: parent.top
        anchors.left: rec1.right
        height: parent.height
        width: parent.width/2
        border.width: 1
        border.color: "#03a9f5"
        //color: "lightgreen"
        Text {
            id: text_fac
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Предприятия-изготовители исполнительных механизмов:"
        }
        TextField {
            id: tf_fac
            anchors.top: text_fac.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: but_fac.left
            anchors.rightMargin: 5
            height: but_fac.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            placeholderText: "Введите наименование завода"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_fac.x = mouseX
                    contextMenu_fac.y = mouseY
                    contextMenu_fac.open()
                }
            }
            Menu {
                id: contextMenu_fac
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_fac.selectedText
                    onTriggered: tf_fac.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_fac.selectedText
                    onTriggered: tf_fac.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_fac.canPaste
                    onTriggered: tf_fac.paste()
                }
            }
        }
        Button {
            id: but_fac
            anchors.top: text_fac.bottom
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: height - 10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 20
                color: "white"
                text: "+"
            }
            onClicked: {
                database.insertIntoProizvodIspMeh(tf_fac.text)
                model_proizvmeh.updateModel()
                tf_fac.clear()
            }
        }
        Rectangle {
            id: rec_number_fac
            anchors.top: tf_fac.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            height: 30
            width: (parent.width-15)/9
            radius: 10
            color: "#03a9f5"
            Text {
                id: text_number_fac
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                text: qsTr("№")
            }
        }
        Rectangle {
            id: rec_name_fac
            anchors.top: tf_fac.bottom
            anchors.topMargin: 5
            anchors.left: rec_number_fac.right
            anchors.leftMargin: 5
            height: 30
            width: (parent.width-15)*8/9
            radius: 10
            color: "#03a9f5"
            Text {
                id: text_name_fac
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                text: qsTr("Наименование")
            }
        }
        Rectangle {
            id: rec_list_fac
            anchors.top: rec_number_fac.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: but_del_fac.top
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_fac
                anchors.fill: parent
                property real h: 30
                ListView {
                    id: list_fac
                    anchors.fill: parent
                    clip: true
                    model: model_proizvmeh
                    delegate: delegate_fac
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    //currentIndex: window.index
                    ScrollBar.vertical: ScrollBar { id: vbar_fac;
                                                hoverEnabled: true
                                                active: hovered || pressed
                                                orientation: Qt.Vertical
                                                //size: frame.height / content.height
                                                anchors.top: parent.top
                                                anchors.right: parent.right
                                                anchors.bottom: parent.bottom
                                                width: 10
                                    }
                }
                Component {
                    id: delegate_fac
                    Item {
                        id: item_table_fac
                        width: rec2.width
                        height: flick_fac.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec1_fac
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: (parent.width-15)/9
                            height: flick_fac.h//text1.height*2
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_fac.col
                            RowLayout {
                                id: lay1_fac
                                anchors.fill: parent
                                Text {
                                    id: text1_fac
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"
                                    text: number+1
                                }
                            }
                        }
                        Rectangle {
                            id: rec2_fac
                            anchors.top: parent.top
                            anchors.left: rec1_fac.right
                            anchors.leftMargin: 5
                            width: (parent.width-15)*8/9
                            height: flick_fac.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_fac.col
                            RowLayout {
                                id: lay2_fac
                                anchors.fill: parent
                                Text {
                                    id: text2_fac
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Proizvmehname
                                }
                            }
                        }
                        MouseArea {
                            id: mouse_fac
                            anchors.fill: parent
                            onClicked: list_fac.currentIndex = model.index//model0.index()
                        }
                    }//item_table_ceh
                }//delegate
                Component {
                    id: highlightBar_fac
                    Rectangle {
                        id: hl1_fac
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_fac.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_fac.currentItem.x
                        y: list_fac.currentItem.y
                    }
                }

            }
        }//rec_list_tipmeh
        Button {
            id: but_del_fac
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_fac.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_fac
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordProizvodIspMeh(model_proizvmeh.getId(list_fac.currentIndex))
                model_proizvmeh.updateModel()
            }
        }
    }//end rec2
}
