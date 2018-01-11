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
        height: parent.height/2
        width: parent.width/3
        border.width: 1
        border.color: "#03a9f5"
        //color: "yellow"
        Text {
            id: text_ceh
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Цех:"
        }
        TextField {
            id: tf_ceh
            anchors.top: text_ceh.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: but_ceh.left
            anchors.rightMargin: 5
            height: but_ceh.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            placeholderText: "Введите наименование цеха"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_ceh.x = mouseX
                    contextMenu_ceh.y = mouseY
                    contextMenu_ceh.open()
                }
            }
            Menu {
                id: contextMenu_ceh
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_ceh.selectedText
                    onTriggered: tf_ceh.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_ceh.selectedText
                    onTriggered: tf_ceh.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_ceh.canPaste
                    onTriggered: tf_ceh.paste()
                }
            }
        }
        Button {
            id: but_ceh
            anchors.top: text_ceh.bottom
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
                database.insertIntoCeh(tf_ceh.text)
                model_ceh.updateModel()
                tf_ceh.clear()
            }
        }
        Rectangle {
            id: rec_number_ceh
            anchors.top: tf_ceh.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            height: 30
            width: (parent.width-15)/6
            radius: 10
            color: "#03a9f5"
            Text {
                id: text_number_ceh
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                text: qsTr("№")
            }
        }
        Rectangle {
            id: rec_name_ceh
            anchors.top: tf_ceh.bottom
            anchors.topMargin: 5
            anchors.left: rec_number_ceh.right
            anchors.leftMargin: 5
            height: 30
            width: (parent.width-15)*5/6
            radius: 10
            color: "#03a9f5"
            Text {
                id: text_name_ceh
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                text: qsTr("Наименование")
            }
        }
        Rectangle {
            id: rec_list_ceh
            anchors.top: rec_number_ceh.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: but_del_ceh.top
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_ceh
                anchors.fill: parent
                property real h: 30
                ListView {
                    id: list_ceh
                    anchors.fill: parent
                    clip: true
                    model: model_ceh
                    delegate: delegate_ceh
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    //currentIndex: window.index
                    ScrollBar.vertical: ScrollBar { id: vbar_ceh;
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
                    id: delegate_ceh
                    Item {
                        id: item_table_ceh
                        width: rec1.width
                        height: flick_ceh.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec1_ceh
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: (parent.width-15)/6
                            height: flick_ceh.h//text1.height*2
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_ceh.col
                            RowLayout {
                                id: lay1_ceh
                                anchors.fill: parent
                                Text {
                                    id: text1_ceh
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
                            id: rec2_ceh
                            anchors.top: parent.top
                            anchors.left: rec1_ceh.right
                            anchors.leftMargin: 5
                            width: (parent.width-15)*5/6
                            height: flick_ceh.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_ceh.col
                            RowLayout {
                                id: lay2_ceh
                                anchors.fill: parent
                                Text {
                                    id: text2_ceh
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Cehname
                                }
                            }
                        }
                        MouseArea {
                            id: mouse_ceh
                            anchors.fill: parent
                            onClicked: list_ceh.currentIndex = model.index//model0.index()
                        }
                    }//item_table_ceh
                }//delegate
                Component {
                    id: highlightBar_ceh
                    Rectangle {
                        id: hl1_ceh
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_ceh.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_ceh.currentItem.x
                        y: list_ceh.currentItem.y
                    }
                }

            }
        }//rec_list_ceh
        Button {
            id: but_del_ceh
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_ceh.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_ceh
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordCeh(model_ceh.getId(list_ceh.currentIndex))
                model_ceh.updateModel()
            }
        }
    }//end rec1
    Rectangle {
        id: rec2
        anchors.top: parent.top
        anchors.left: rec1.right
        height: parent.height/2
        width: parent.width/3
        border.width: 1
        border.color: "#03a9f5"
        //color: "lightgreen"
        Text {
            id: text_tipmeh
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Тип механизма:"
        }
        TextField {
            id: tf_tipmeh
            anchors.top: text_tipmeh.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: but_tipmeh.left
            anchors.rightMargin: 5
            height: but_tipmeh.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            placeholderText: "Введите наименование механизма"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tipmeh.x = mouseX
                    contextMenu_tipmeh.y = mouseY
                    contextMenu_tipmeh.open()
                }
            }
            Menu {
                id: contextMenu_tipmeh
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_tipmeh.selectedText
                    onTriggered: tf_tipmeh.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_tipmeh.selectedText
                    onTriggered: tf_tipmeh.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_tipmeh.canPaste
                    onTriggered: tf_tipmeh.paste()
                }
            }
        }
        Button {
            id: but_tipmeh
            anchors.top: text_tipmeh.bottom
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
                database.insertIntoTipMehanizma(tf_tipmeh.text)
                model_tipmeh.updateModel()
                tf_tipmeh.clear()
            }
        }
        Rectangle {
            id: rec_number_tipmeh
            anchors.top: tf_tipmeh.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            height: 30
            width: (parent.width-15)/6
            radius: 10
            color: "#03a9f5"
            Text {
                id: text_number_tipmeh
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                text: qsTr("№")
            }
        }
        Rectangle {
            id: rec_name_tipmeh
            anchors.top: tf_tipmeh.bottom
            anchors.topMargin: 5
            anchors.left: rec_number_tipmeh.right
            anchors.leftMargin: 5
            height: 30
            width: (parent.width-15)*5/6
            radius: 10
            color: "#03a9f5"
            Text {
                id: text_name_tipmeh
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                text: qsTr("Наименование")
            }
        }
        Rectangle {
            id: rec_list_tipmeh
            anchors.top: rec_number_tipmeh.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: but_del_tipmeh.top
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_tipmeh
                anchors.fill: parent
                property real h: 30
                ListView {
                    id: list_tipmeh
                    anchors.fill: parent
                    clip: true
                    model: model_tipmeh
                    delegate: delegate_tipmeh
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    //currentIndex: window.index
                    ScrollBar.vertical: ScrollBar { id: vbar_tipmeh;
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
                    id: delegate_tipmeh
                    Item {
                        id: item_table_tipmeh
                        width: rec2.width
                        height: flick_tipmeh.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec1_tipmeh
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: (parent.width-15)/6
                            height: flick_tipmeh.h//text1.height*2
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_tipmeh.col
                            RowLayout {
                                id: lay1_tipmeh
                                anchors.fill: parent
                                Text {
                                    id: text1_tipmeh
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
                            id: rec2_tipmeh
                            anchors.top: parent.top
                            anchors.left: rec1_tipmeh.right
                            anchors.leftMargin: 5
                            width: (parent.width-15)*5/6
                            height: flick_tipmeh.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_tipmeh.col
                            RowLayout {
                                id: lay2_tipmeh
                                anchors.fill: parent
                                Text {
                                    id: text2_tipmeh
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Tipmehname
                                }
                            }
                        }
                        MouseArea {
                            id: mouse_tipmeh
                            anchors.fill: parent
                            onClicked: list_tipmeh.currentIndex = model.index//model0.index()
                        }
                    }//item_table_ceh
                }//delegate
                Component {
                    id: highlightBar_tipmeh
                    Rectangle {
                        id: hl1_tipmeh
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_tipmeh.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_tipmeh.currentItem.x
                        y: list_tipmeh.currentItem.y
                    }
                }

            }
        }//rec_list_tipmeh
        Button {
            id: but_del_tipmeh
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_tipmeh.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_tipmeh
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordTipMehanizma(model_tipmeh.getId(list_tipmeh.currentIndex))
                model_tipmeh.updateModel()
            }
        }
    }//end rec2
    Rectangle {
        id: rec3
        anchors.top: parent.top
        anchors.left: rec2.right
        height: parent.height/2
        width: parent.width/3
        border.width: 1
        border.color: "#03a9f5"
        //color: "tomato"
        Text {
            id: text_tippermeh
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Тип передаточного механизма:"
        }
        TextField {
            id: tf_tippermeh
            anchors.top: text_tippermeh.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: but_tippermeh.left
            anchors.rightMargin: 5
            height: but_tippermeh.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            placeholderText: "Введите наименование механизма"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tippermeh.x = mouseX
                    contextMenu_tippermeh.y = mouseY
                    contextMenu_tippermeh.open()
                }
            }
            Menu {
                id: contextMenu_tippermeh
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_tippermeh.selectedText
                    onTriggered: tf_tippermeh.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_tippermeh.selectedText
                    onTriggered: tf_tippermeh.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_tippermeh.canPaste
                    onTriggered: tf_tippermeh.paste()
                }
            }
        }
        Button {
            id: but_tippermeh
            anchors.top: text_tippermeh.bottom
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
                database.insertIntoTipPeredatochnogoMehanizma(tf_tippermeh.text)
                model_tippermeh.updateModel()
                tf_tippermeh.clear()
            }
        }
        Rectangle {
            id: rec_number_tippermeh
            anchors.top: tf_tippermeh.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            height: 30
            width: (parent.width-15)/6
            radius: 10
            color: "#03a9f5"
            Text {
                id: text_number_tippermeh
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                text: qsTr("№")
            }
        }
        Rectangle {
            id: rec_name_tippermeh
            anchors.top: tf_tippermeh.bottom
            anchors.topMargin: 5
            anchors.left: rec_number_tippermeh.right
            anchors.leftMargin: 5
            height: 30
            width: (parent.width-15)*5/6
            radius: 10
            color: "#03a9f5"
            Text {
                id: text_name_tippermeh
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                text: qsTr("Наименование")
            }
        }
        Rectangle {
            id: rec_list_tippermeh
            anchors.top: rec_number_tippermeh.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: but_del_tippermeh.top
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_tippermeh
                anchors.fill: parent
                property real h: 30
                ListView {
                    id: list_tippermeh
                    anchors.fill: parent
                    clip: true
                    model: model_tippermeh
                    delegate: delegate_tippermeh
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    //currentIndex: window.index
                    ScrollBar.vertical: ScrollBar { id: vbar_tippermeh;
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
                    id: delegate_tippermeh
                    Item {
                        id: item_table_tippermeh
                        width: rec3.width
                        height: flick_tippermeh.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec1_tippermeh
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: (parent.width-15)/6
                            height: flick_tippermeh.h//text1.height*2
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_tippermeh.col
                            RowLayout {
                                id: lay1_tippermeh
                                anchors.fill: parent
                                Text {
                                    id: text1_tippermeh
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
                            id: rec2_tippermeh
                            anchors.top: parent.top
                            anchors.left: rec1_tippermeh.right
                            anchors.leftMargin: 5
                            width: (parent.width-15)*5/6
                            height: flick_tippermeh.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_tippermeh.col
                            RowLayout {
                                id: lay2_tippermeh
                                anchors.fill: parent
                                Text {
                                    id: text2_tippermeh
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Tippermehname
                                }
                            }
                        }
                        MouseArea {
                            id: mouse_tippermeh
                            anchors.fill: parent
                            onClicked: list_tippermeh.currentIndex = model.index//model0.index()
                        }
                    }//item_table_ceh
                }//delegate
                Component {
                    id: highlightBar_tippermeh
                    Rectangle {
                        id: hl1_tippermeh
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_tippermeh.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_tippermeh.currentItem.x
                        y: list_tippermeh.currentItem.y
                    }
                }

            }
        }//rec_list_tippermeh
        Button {
            id: but_del_tippermeh
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_tippermeh.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_tippermeh
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordTipPeredatochnogoMehanizma(model_tippermeh.getId(list_tippermeh.currentIndex))
                model_tippermeh.updateModel()
            }
        }
    }//end rec3
    Rectangle {
        id: rec4
        anchors.top: rec1.bottom
        anchors.left: parent.left
        height: parent.height/2
        width: parent.width/3
        border.width: 1
        border.color: "#03a9f5"
        //color: "lightblue"
        Text {
            id: text_tipper
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Тип передачи:"
        }
        TextField {
            id: tf_tipper
            anchors.top: text_tipper.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: but_tipper.left
            anchors.rightMargin: 5
            height: but_tipper.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            placeholderText: "Введите наименование передачи"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tipper.x = mouseX
                    contextMenu_tipper.y = mouseY
                    contextMenu_tipper.open()
                }
            }
            Menu {
                id: contextMenu_tipper
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_tipper.selectedText
                    onTriggered: tf_tipper.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_tipper.selectedText
                    onTriggered: tf_tipper.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_tipper.canPaste
                    onTriggered: tf_tipper.paste()
                }
            }
        }
        Button {
            id: but_tipper
            anchors.top: text_tipper.bottom
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
                database.insertIntoTipPeredachi(tf_tipper.text)
                model_tipper.updateModel()
                tf_tipper.clear()
            }
        }
        Rectangle {
            id: rec_number_tipper
            anchors.top: tf_tipper.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            height: 30
            width: (parent.width-15)/6
            radius: 10
            color: "#03a9f5"
            Text {
                id: text_number_tipper
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                text: qsTr("№")
            }
        }
        Rectangle {
            id: rec_name_tipper
            anchors.top: tf_tipper.bottom
            anchors.topMargin: 5
            anchors.left: rec_number_tipper.right
            anchors.leftMargin: 5
            height: 30
            width: (parent.width-15)*5/6
            radius: 10
            color: "#03a9f5"
            Text {
                id: text_name_tipper
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                text: qsTr("Наименование")
            }
        }
        Rectangle {
            id: rec_list_tipper
            anchors.top: rec_number_tipper.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: but_del_tipper.top
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_tipper
                anchors.fill: parent
                property real h: 30
                ListView {
                    id: list_tipper
                    anchors.fill: parent
                    clip: true
                    model: model_tipper
                    delegate: delegate_tipper
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    //currentIndex: window.index
                    ScrollBar.vertical: ScrollBar { id: vbar_tipper;
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
                    id: delegate_tipper
                    Item {
                        id: item_table_tipper
                        width: rec4.width
                        height: flick_tipper.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec1_tipper
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: (parent.width-15)/6
                            height: flick_tipper.h//text1.height*2
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_tipper.col
                            RowLayout {
                                id: lay1_tipper
                                anchors.fill: parent
                                Text {
                                    id: text1_tipper
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
                            id: rec2_tipper
                            anchors.top: parent.top
                            anchors.left: rec1_tipper.right
                            anchors.leftMargin: 5
                            width: (parent.width-15)*5/6
                            height: flick_tipper.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_tipper.col
                            RowLayout {
                                id: lay2_tipper
                                anchors.fill: parent
                                Text {
                                    id: text2_tipper
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Tippername
                                }
                            }
                        }
                        MouseArea {
                            id: mouse_tipper
                            anchors.fill: parent
                            onClicked: list_tipper.currentIndex = model.index//model0.index()
                        }
                    }//item_table_ceh
                }//delegate
                Component {
                    id: highlightBar_tipper
                    Rectangle {
                        id: hl1_tipper
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_tipper.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_tipper.currentItem.x
                        y: list_tipper.currentItem.y
                    }
                }

            }
        }//rec_list_tippermeh
        Button {
            id: but_del_tipper
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_tipper.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_tipper
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordTipPeredachi(model_tipper.getId(list_tipper.currentIndex))
                model_tipper.updateModel()
            }
        }
    }//end rec4
    Rectangle {
        id: rec5
        anchors.top: rec2.bottom
        anchors.left: rec4.right
        height: parent.height/2
        width: parent.width*2/3
        border.width: 1
        border.color: "#03a9f5"
        //color: "violet"
        Text {
            id: text_programm_number
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Номер программы ПНР:"
        }
        Text {
            id: text_programm_name
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: parent.width/2+5
            font.pixelSize: 15
            text: "Наименование программы ПНР:"
        }
        TextField {
            id: tf_programm_number
            anchors.top: text_programm_number.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: parent.width/2+5
            height: but_programm.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            placeholderText: "Введите номер программы"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_programm_number.x = mouseX
                    contextMenu_programm_number.y = mouseY
                    contextMenu_programm_number.open()
                }
            }
            Menu {
                id: contextMenu_programm_number
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_programm_number.selectedText
                    onTriggered: tf_programm_number.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_programm_number.selectedText
                    onTriggered: tf_programm_number.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_programm_number.canPaste
                    onTriggered: tf_programm_number.paste()
                }
            }
        }
        TextField {
            id: tf_programm_name
            anchors.top: text_programm_name.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: parent.width/2+5
            anchors.right: but_programm.left
            anchors.rightMargin: 5
            height: but_programm.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            placeholderText: "Введите наименование программы"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_programm_name.x = mouseX
                    contextMenu_programm_name.y = mouseY
                    contextMenu_programm_name.open()
                }
            }
            Menu {
                id: contextMenu_programm_name
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_programm_name.selectedText
                    onTriggered: tf_programm_name.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_programm_name.selectedText
                    onTriggered: tf_programm_name.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_programm_name.canPaste
                    onTriggered: tf_programm_name.paste()
                }
            }
        }
        Button {
            id: but_programm
            anchors.top: text_programm_name.bottom
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
                database.insertIntoBazaProgram(tf_programm_number.text, tf_programm_name.text)
                model_program.updateModel()
                tf_programm_number.clear()
                tf_programm_name.clear()
            }
        }
        Rectangle {
            id: rec_number_programm
            anchors.top: tf_programm_number.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            height: 30
            width: (parent.width-30)/12
            radius: 10
            color: "#03a9f5"
            Text {
                id: text_number_programm
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                text: qsTr("№")
            }
        }
        Rectangle {
            id: rec_name_programm
            anchors.top: tf_programm_number.bottom
            anchors.topMargin: 5
            anchors.left: rec_number_programm.right
            anchors.leftMargin: 5
            height: 30
            width: (parent.width-30)*5.5/12+5
            radius: 10
            color: "#03a9f5"
            Text {
                id: text_name_programm
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                text: qsTr("Номер")
            }
        }
        Rectangle {
            id: rec_naim_programm
            anchors.top: tf_programm_number.bottom
            anchors.topMargin: 5
            anchors.left: rec_name_programm.right
            anchors.leftMargin: 5
            height: 30
            width: (parent.width-30)*5.5/12+5
            radius: 10
            color: "#03a9f5"
            Text {
                id: text_naim_programm
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                text: qsTr("Наименование")
            }
        }
        Rectangle {
            id: rec_list_programm
            anchors.top: rec_number_programm.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: but_del_programm.top
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_programm
                anchors.fill: parent
                property real h: 40
                ListView {
                    id: list_programm
                    anchors.fill: parent
                    clip: true
                    model: model_program
                    delegate: delegate_programm
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    //currentIndex: window.index
                    ScrollBar.vertical: ScrollBar { id: vbar_programm;
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
                    id: delegate_programm
                    Item {
                        id: item_table_programm
                        width: rec5.width
                        height: flick_programm.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec1_programm
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: (parent.width-30)/12
                            height: flick_programm.h//text1.height*2
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_programm.col
                            RowLayout {
                                id: lay1_programm
                                anchors.fill: parent
                                Text {
                                    id: text1_programm
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
                            id: rec2_programm
                            anchors.top: parent.top
                            anchors.left: rec1_programm.right
                            anchors.leftMargin: 5
                            width: (parent.width-30)*5.5/12+5
                            height: flick_programm.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_programm.col
                            RowLayout {
                                id: lay2_programm
                                anchors.fill: parent
                                Text {
                                    id: text2_programm
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Programnomer
                                }
                            }
                        }
                        Rectangle {
                            id: rec3_programm
                            anchors.top: parent.top
                            anchors.left: rec2_programm.right
                            anchors.leftMargin: 5
                            width: (parent.width-30)*5.5/12+5
                            height: flick_programm.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_programm.col
//                            RowLayout {
//                                id: lay3_programm
//                                anchors.fill: parent
                                Text {
                                    id: text3_programm
                                    //anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 5
                                    anchors.right: parent.right
                                    anchors.rightMargin: 5
                                    width: parent.width-10
                                    wrapMode: Text.WordWrap
                                    maximumLineCount: 2
                                    //wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Programname
                                }
//                            }
                        }
                        MouseArea {
                            id: mouse_programm
                            anchors.fill: parent
                            onClicked: list_programm.currentIndex = model.index//model0.index()
                        }
                    }//item_table_ceh
                }//delegate
                Component {
                    id: highlightBar_programm
                    Rectangle {
                        id: hl1_programm
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_programm.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_programm.currentItem.x
                        y: list_programm.currentItem.y
                    }
                }

            }
        }//rec_list_programm
        Button {
            id: but_del_programm
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_programm.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_programm
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordBazaProgram(model_program.getId(list_programm.currentIndex))
                model_program.updateModel()
            }
        }
    }
}//end rec5
