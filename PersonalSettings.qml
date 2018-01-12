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
        width: parent.width/3
        border.width: 1
        border.color: "#03a9f5"
        //color: "yellow"
        Text {
            id: text_laes
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Персонал ЛАЭС-2:"
        }
        TextField {
            id: tf_laes
            anchors.top: text_laes.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: but_laes.left
            anchors.rightMargin: 5
            height: but_laes.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            placeholderText: "Введите фамилию"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_laes.x = mouseX
                    contextMenu_laes.y = mouseY
                    contextMenu_laes.open()
                }
            }
            Menu {
                id: contextMenu_laes
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_laes.selectedText
                    onTriggered: tf_laes.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_laes.selectedText
                    onTriggered: tf_laes.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_laes.canPaste
                    onTriggered: tf_laes.paste()
                }
            }
        }
        Button {
            id: but_laes
            anchors.top: text_laes.bottom
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
                database.insertIntoLAES(tf_laes.text)
                model_laes.updateModel()
                tf_laes.clear()
            }
        }
        Rectangle {
            id: rec_number_laes
            anchors.top: tf_laes.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            height: 30
            width: (parent.width-15)/6
            radius: 10
            color: "#03a9f5"
            Text {
                id: text_number_laes
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                text: qsTr("№")
            }
        }
        Rectangle {
            id: rec_name_laes
            anchors.top: tf_laes.bottom
            anchors.topMargin: 5
            anchors.left: rec_number_laes.right
            anchors.leftMargin: 5
            height: 30
            width: (parent.width-15)*5/6
            radius: 10
            color: "#03a9f5"
            Text {
                id: text_name_laes
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                text: qsTr("Фамилия")
            }
        }
        Rectangle {
            id: rec_list_laes
            anchors.top: rec_number_laes.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: but_del_laes.top
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_laes
                anchors.fill: parent
                property real h: 30
                ListView {
                    id: list_laes
                    anchors.fill: parent
                    clip: true
                    model: model_laes
                    delegate: delegate_laes
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    currentIndex: -1
                    ScrollBar.vertical: ScrollBar { id: vbar_laes;
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
                    id: delegate_laes
                    Item {
                        id: item_table_laes
                        width: rec1.width
                        height: flick_laes.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec1_laes
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: (parent.width-15)/6
                            height: flick_laes.h//text1.height*2
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_laes.col
                            RowLayout {
                                id: lay1_laes
                                anchors.fill: parent
                                Text {
                                    id: text1_laes
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
                            id: rec2_laes
                            anchors.top: parent.top
                            anchors.left: rec1_laes.right
                            anchors.leftMargin: 5
                            width: (parent.width-15)*5/6
                            height: flick_laes.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_laes.col
                            RowLayout {
                                id: lay2_laes
                                anchors.fill: parent
                                Text {
                                    id: text2_laes
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: laes
                                }
                            }
                        }
                        MouseArea {
                            id: mouse_laes
                            anchors.fill: parent
                            onClicked: list_laes.currentIndex = model.index//model0.index()
                        }
                    }//item_table_laes
                }//delegate
                Component {
                    id: highlightBar_laes
                    Rectangle {
                        id: hl1_laes
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_laes.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_laes.currentItem.x
                        y: list_laes.currentItem.y
                    }
                }

            }
        }//rec_list_laes
        Button {
            id: but_del_laes
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_laes.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_laes
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordLAES(model_laes.getId(list_laes.currentIndex))
                model_laes.updateModel()
                list_laes.currentIndex = -1
            }
        }
    }//end rec1
    Rectangle {
        id: rec2
        anchors.top: parent.top
        anchors.left: rec1.right
        height: parent.height
        width: parent.width/3
        border.width: 1
        border.color: "#03a9f5"
        //color: "lightgreen"
        Text {
            id: text_ate
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Персонал АТЭ:"
        }
        TextField {
            id: tf_ate
            anchors.top: text_ate.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: but_ate.left
            anchors.rightMargin: 5
            height: but_ate.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            placeholderText: "Введите фамилию"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_ate.x = mouseX
                    contextMenu_ate.y = mouseY
                    contextMenu_ate.open()
                }
            }
            Menu {
                id: contextMenu_ate
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_ate.selectedText
                    onTriggered: tf_ate.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_ate.selectedText
                    onTriggered: tf_ate.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_ate.canPaste
                    onTriggered: tf_ate.paste()
                }
            }
        }
        Button {
            id: but_ate
            anchors.top: text_ate.bottom
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
                database.insertIntoATE(tf_ate.text)
                model_ate.updateModel()
                tf_ate.clear()
            }
        }
        Rectangle {
            id: rec_number_ate
            anchors.top: tf_ate.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            height: 30
            width: (parent.width-15)/6
            radius: 10
            color: "#03a9f5"
            Text {
                id: text_number_ate
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                text: qsTr("№")
            }
        }
        Rectangle {
            id: rec_name_ate
            anchors.top: tf_ate.bottom
            anchors.topMargin: 5
            anchors.left: rec_number_ate.right
            anchors.leftMargin: 5
            height: 30
            width: (parent.width-15)*5/6
            radius: 10
            color: "#03a9f5"
            Text {
                id: text_name_ate
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                text: qsTr("Фамилия")
            }
        }
        Rectangle {
            id: rec_list_ate
            anchors.top: rec_number_ate.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: but_del_ate.top
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_ate
                anchors.fill: parent
                property real h: 30
                ListView {
                    id: list_ate
                    anchors.fill: parent
                    clip: true
                    model: model_ate
                    delegate: delegate_ate
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    currentIndex: -1
                    ScrollBar.vertical: ScrollBar { id: vbar_ate;
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
                    id: delegate_ate
                    Item {
                        id: item_table_ate
                        width: rec2.width
                        height: flick_ate.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec1_ate
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: (parent.width-15)/6
                            height: flick_ate.h//text1.height*2
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_ate.col
                            RowLayout {
                                id: lay1_ate
                                anchors.fill: parent
                                Text {
                                    id: text1_ate
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
                            id: rec2_ate
                            anchors.top: parent.top
                            anchors.left: rec1_ate.right
                            anchors.leftMargin: 5
                            width: (parent.width-15)*5/6
                            height: flick_ate.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_ate.col
                            RowLayout {
                                id: lay2_ate
                                anchors.fill: parent
                                Text {
                                    id: text2_ate
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: ate
                                }
                            }
                        }
                        MouseArea {
                            id: mouse_ate
                            anchors.fill: parent
                            onClicked: list_ate.currentIndex = model.index//model0.index()
                        }
                    }//item_table_laes
                }//delegate
                Component {
                    id: highlightBar_ate
                    Rectangle {
                        id: hl1_ate
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_ate.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_ate.currentItem.x
                        y: list_ate.currentItem.y
                    }
                }

            }
        }//rec_list_ate
        Button {
            id: but_del_ate
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_ate.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_ate
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordATE(model_ate.getId(list_ate.currentIndex))
                model_ate.updateModel()
                list_ate.currentIndex = -1
            }
        }
    }//end rec2
    Rectangle {
        id: rec3
        anchors.top: parent.top
        anchors.left: rec2.right
        height: parent.height
        width: parent.width/3
        border.width: 1
        border.color: "#03a9f5"
        //color: "tomato"
        Text {
            id: text_fio
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Заполняющие базу:"
        }
        TextField {
            id: tf_fio
            anchors.top: text_fio.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: but_fio.left
            anchors.rightMargin: 5
            height: but_fio.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            placeholderText: "Введите ФИО"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_fio.x = mouseX
                    contextMenu_fio.y = mouseY
                    contextMenu_fio.open()
                }
            }
            Menu {
                id: contextMenu_fio
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_fio.selectedText
                    onTriggered: tf_fio.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_fio.selectedText
                    onTriggered: tf_fio.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_fio.canPaste
                    onTriggered: tf_fio.paste()
                }
            }
        }
        Button {
            id: but_fio
            anchors.top: text_fio.bottom
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
                database.insertIntoFIO(tf_fio.text)
                model_fio.updateModel()
                tf_fio.clear()
            }
        }
        Rectangle {
            id: rec_number_fio
            anchors.top: tf_fio.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            height: 30
            width: (parent.width-15)/6
            radius: 10
            color: "#03a9f5"
            Text {
                id: text_number_fio
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                text: qsTr("№")
            }
        }
        Rectangle {
            id: rec_name_fio
            anchors.top: tf_fio.bottom
            anchors.topMargin: 5
            anchors.left: rec_number_fio.right
            anchors.leftMargin: 5
            height: 30
            width: (parent.width-15)*5/6
            radius: 10
            color: "#03a9f5"
            Text {
                id: text_name_fio
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                text: qsTr("ФИО")
            }
        }
        Rectangle {
            id: rec_list_fio
            anchors.top: rec_number_fio.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: but_del_fio.top
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_fio
                anchors.fill: parent
                property real h: 30
                ListView {
                    id: list_fio
                    anchors.fill: parent
                    clip: true
                    model: model_fio
                    delegate: delegate_fio
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    currentIndex: -1
                    ScrollBar.vertical: ScrollBar { id: vbar_fio;
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
                    id: delegate_fio
                    Item {
                        id: item_table_fio
                        width: rec3.width
                        height: flick_fio.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec1_fio
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: (parent.width-15)/6
                            height: flick_fio.h//text1.height*2
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_fio.col
                            RowLayout {
                                id: lay1_fio
                                anchors.fill: parent
                                Text {
                                    id: text1_fio
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
                            id: rec2_fio
                            anchors.top: parent.top
                            anchors.left: rec1_fio.right
                            anchors.leftMargin: 5
                            width: (parent.width-15)*5/6
                            height: flick_fio.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_fio.col
                            RowLayout {
                                id: lay2_fio
                                anchors.fill: parent
                                Text {
                                    id: text2_fio
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Fiofio
                                }
                            }
                        }
                        MouseArea {
                            id: mouse_fio
                            anchors.fill: parent
                            onClicked: list_fio.currentIndex = model.index//model0.index()
                        }
                    }//item_table_laes
                }//delegate
                Component {
                    id: highlightBar_fio
                    Rectangle {
                        id: hl1_fio
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_fio.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_fio.currentItem.x
                        y: list_fio.currentItem.y
                    }
                }

            }
        }//rec_list_fio
        Button {
            id: but_del_fio
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_fio.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_fio
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordFIO(model_fio.getId(list_fio.currentIndex))
                model_fio.updateModel()
                list_fio.currentIndex = -1
            }
        }
    }//end rec3
}
