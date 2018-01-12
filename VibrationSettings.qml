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
        height: parent.height/3
        width: parent.width/5
        border.width: 1
        border.color: "#03a9f5"
        //color: "yellow"
        Text {
            id: text_normhh
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Норма, холостой ход:"
        }
        TextField {
            id: tf_normhh
            anchors.top: text_normhh.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: but_normhh.left
            anchors.rightMargin: 5
            height: but_normhh.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            //placeholderText: "Введите наименование цеха"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_normhh.x = mouseX
                    contextMenu_normhh.y = mouseY
                    contextMenu_normhh.open()
                }
            }
            Menu {
                id: contextMenu_normhh
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_normhh.selectedText
                    onTriggered: tf_normhh.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_normhh.selectedText
                    onTriggered: tf_normhh.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_normhh.canPaste
                    onTriggered: tf_normhh.paste()
                }
            }
        }
        Button {
            id: but_normhh
            anchors.top: text_normhh.bottom
            anchors.right: but_del_normhh.left
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
                tf_normhh.text = tf_normhh.text.replace(",", ".")
                database.insertIntoNormHh(tf_normhh.text)
                model_normhh.updateModel()
                tf_normhh.clear()
            }
        }
        Button {
            id: but_del_normhh
            anchors.top: text_normhh.bottom
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_normhh.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_normhh
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordNormHh(model_normhh.getId(list_normhh.currentIndex))
                model_normhh.updateModel()
                list_normhh.currentIndex = -1
            }
        }
        Rectangle {
            id: rec_list_normhh
            anchors.top: tf_normhh.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_normhh
                anchors.fill: parent
                property real h: 30
                ListView {
                    id: list_normhh
                    anchors.fill: parent
                    clip: true
                    model: model_normhh
                    delegate: delegate_normhh
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    currentIndex: -1
                    ScrollBar.vertical: ScrollBar { id: vbar_normhh;
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
                    id: delegate_normhh
                    Item {
                        id: item_table_normhh
                        width: rec1.width
                        height: flick_normhh.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec2_normhh
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: parent.width-10
                            height: flick_normhh.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_normhh.col
                            RowLayout {
                                id: lay2_normhh
                                anchors.fill: parent
                                Text {
                                    id: text2_normhh
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Normhhzn
                                    Component.onCompleted: {
                                        text2_normhh.text = text2_normhh.text.replace(".",",")
                                    }
                                }
                            }
                        }
                        MouseArea {
                            id: mouse_normhh
                            anchors.fill: parent
                            onClicked: list_normhh.currentIndex = model.index//model0.index()
                        }
                    }//item_table_normhh
                }//delegate
                Component {
                    id: highlightBar_normhh
                    Rectangle {
                        id: hl1_normhh
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_normhh.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_normhh.currentItem.x
                        y: list_normhh.currentItem.y
                    }
                }

            }
        }//rec_list_normhh
    }//end rec1
    Rectangle {
        id: rec2
        anchors.top: parent.top
        anchors.left: rec1.right
        height: parent.height/3
        width: parent.width/5
        border.width: 1
        border.color: "#03a9f5"
        //color: "yellow"
        Text {
            id: text_normnomed
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Норма эл/дв, номинальный режим:"
            Component.onCompleted: {
                if(text_normnomed.width>(rec2.width-10)){
                    text_normnomed.text = "Норма эл/дв, ном.реж.:"
                }
            }
        }
        TextField {
            id: tf_normnomed
            anchors.top: text_normnomed.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: but_normnomed.left
            anchors.rightMargin: 5
            height: but_normnomed.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            //placeholderText: "Введите наименование цеха"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_normnomed.x = mouseX
                    contextMenu_normnomed.y = mouseY
                    contextMenu_normnomed.open()
                }
            }
            Menu {
                id: contextMenu_normnomed
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_normnomed.selectedText
                    onTriggered: tf_normnomed.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_normnomed.selectedText
                    onTriggered: tf_normnomed.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_normnomed.canPaste
                    onTriggered: tf_normnomed.paste()
                }
            }
        }
        Button {
            id: but_normnomed
            anchors.top: text_normnomed.bottom
            anchors.right: but_del_normnomed.left
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
                tf_normnomed.text = tf_normnomed.text.replace(",", ".")
                database.insertIntoNormNomED(tf_normnomed.text)
                model_normnomed.updateModel()
                tf_normnomed.clear()
            }
        }
        Button {
            id: but_del_normnomed
            anchors.top: text_normnomed.bottom
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_normnomed.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_normnomed
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordNormNomED(model_normnomed.getId(list_normnomed.currentIndex))
                model_normnomed.updateModel()
                list_normnomed.currentIndex = -1
            }
        }
        Rectangle {
            id: rec_list_normnomed
            anchors.top: tf_normnomed.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_normnomed
                anchors.fill: parent
                property real h: 30
                ListView {
                    id: list_normnomed
                    anchors.fill: parent
                    clip: true
                    model: model_normnomed
                    delegate: delegate_normnomed
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    currentIndex: -1
                    ScrollBar.vertical: ScrollBar { id: vbar_normnomed;
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
                    id: delegate_normnomed
                    Item {
                        id: item_table_normnomed
                        width: rec2.width
                        height: flick_normnomed.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec2_normnomed
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: parent.width-10
                            height: flick_normnomed.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_normnomed.col
                            RowLayout {
                                id: lay2_normnomed
                                anchors.fill: parent
                                Text {
                                    id: text2_normnomed
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Normnomedzn
                                    Component.onCompleted: {
                                        text2_normnomed.text = text2_normnomed.text.replace(".",",")
                                    }
                                }
                            }
                        }
                        MouseArea {
                            id: mouse_normnomed
                            anchors.fill: parent
                            onClicked: list_normnomed.currentIndex = model.index//model0.index()
                        }
                    }//item_table_normhh
                }//delegate
                Component {
                    id: highlightBar_normnomed
                    Rectangle {
                        id: hl1_normnomed
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_normnomed.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_normnomed.currentItem.x
                        y: list_normnomed.currentItem.y
                    }
                }

            }
        }//rec_list_normnomed
    }//end rec2
    Rectangle {
        id: rec3
        anchors.top: parent.top
        anchors.left: rec2.right
        height: parent.height/3
        width: parent.width/5
        border.width: 1
        border.color: "#03a9f5"
        //color: "yellow"
        Text {
            id: text_normnom
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Норма механизм, номинальный режим:"
            Component.onCompleted: {
                if(text_normnom.width>(rec2.width-10)){
                    text_normnom.text = "Норма механизм, ном.реж.:"
                }
            }
        }
        TextField {
            id: tf_normnom
            anchors.top: text_normnom.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: but_normnom.left
            anchors.rightMargin: 5
            height: but_normnom.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            //placeholderText: "Введите наименование цеха"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_normnom.x = mouseX
                    contextMenu_normnom.y = mouseY
                    contextMenu_normnom.open()
                }
            }
            Menu {
                id: contextMenu_normnom
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_normnom.selectedText
                    onTriggered: tf_normnom.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_normnom.selectedText
                    onTriggered: tf_normnom.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_normnom.canPaste
                    onTriggered: tf_normnom.paste()
                }
            }
        }
        Button {
            id: but_normnom
            anchors.top: text_normnom.bottom
            anchors.right: but_del_normnom.left
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
                tf_normnom.text = tf_normnom.text.replace(",", ".")
                database.insertIntoNormNom(tf_normnom.text)
                model_normnom.updateModel()
                tf_normnom.clear()
            }
        }
        Button {
            id: but_del_normnom
            anchors.top: text_normnom.bottom
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_normnom.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_normnom
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordNormNom(model_normnom.getId(list_normnom.currentIndex))
                model_normnom.updateModel()
                list_normnom.currentIndex = -1
            }
        }
        Rectangle {
            id: rec_list_normnom
            anchors.top: tf_normnom.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_normnom
                anchors.fill: parent
                property real h: 30
                ListView {
                    id: list_normnom
                    anchors.fill: parent
                    clip: true
                    model: model_normnom
                    delegate: delegate_normnom
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    currentIndex: -1
                    ScrollBar.vertical: ScrollBar { id: vbar_normnom;
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
                    id: delegate_normnom
                    Item {
                        id: item_table_normnom
                        width: rec3.width
                        height: flick_normnom.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec2_normnom
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: parent.width-10
                            height: flick_normnom.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_normnom.col
                            RowLayout {
                                id: lay2_normnom
                                anchors.fill: parent
                                Text {
                                    id: text2_normnom
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Normnomzn
                                    Component.onCompleted: {
                                        text2_normnom.text = text2_normnom.text.replace(".",",")
                                    }
                                }
                            }
                        }
                        MouseArea {
                            id: mouse_normnom
                            anchors.fill: parent
                            onClicked: list_normnom.currentIndex = model.index//model0.index()
                        }
                    }//item_table_normhh
                }//delegate
                Component {
                    id: highlightBar_normnom
                    Rectangle {
                        id: hl1_normnom
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_normnom.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_normnom.currentItem.x
                        y: list_normnom.currentItem.y
                    }
                }

            }
        }//rec_list_normnom
    }//end rec3
    Rectangle {
        id: rec4
        anchors.top: parent.top
        anchors.left: rec3.right
        height: parent.height/3
        width: parent.width/5
        border.width: 1
        border.color: "#03a9f5"
        //color: "yellow"
        Text {
            id: text_normrded
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Норма эл/дв, рабочий диапазон:"
            Component.onCompleted: {
                if(text_normrded.width>(rec4.width-10)){
                    text_normrded.text = "Норма эл/дв, раб.диап.:"
                }
            }
        }
        TextField {
            id: tf_normrded
            anchors.top: text_normrded.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: but_normrded.left
            anchors.rightMargin: 5
            height: but_normrded.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            //placeholderText: "Введите наименование цеха"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_normrded.x = mouseX
                    contextMenu_normrded.y = mouseY
                    contextMenu_normrded.open()
                }
            }
            Menu {
                id: contextMenu_normrded
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_normrded.selectedText
                    onTriggered: tf_normrded.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_normrded.selectedText
                    onTriggered: tf_normrded.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_normrded.canPaste
                    onTriggered: tf_normrded.paste()
                }
            }
        }
        Button {
            id: but_normrded
            anchors.top: text_normrded.bottom
            anchors.right: but_del_normrded.left
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
                tf_normrded.text = tf_normrded.text.replace(",", ".")
                database.insertIntoNormRdED(tf_normrded.text)
                model_normrded.updateModel()
                tf_normrded.clear()
            }
        }
        Button {
            id: but_del_normrded
            anchors.top: text_normrded.bottom
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_normrded.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_normrded
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordNormRdED(model_normrded.getId(list_normrded.currentIndex))
                model_normrded.updateModel()
                list_normrded.currentIndex = -1
            }
        }
        Rectangle {
            id: rec_list_normrded
            anchors.top: tf_normrded.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_normrded
                anchors.fill: parent
                property real h: 30
                ListView {
                    id: list_normrded
                    anchors.fill: parent
                    clip: true
                    model: model_normrded
                    delegate: delegate_normrded
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    currentIndex: -1
                    ScrollBar.vertical: ScrollBar { id: vbar_normrded;
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
                    id: delegate_normrded
                    Item {
                        id: item_table_normrded
                        width: rec4.width
                        height: flick_normrded.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec2_normrded
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: parent.width-10
                            height: flick_normrded.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_normrded.col
                            RowLayout {
                                id: lay2_normrded
                                anchors.fill: parent
                                Text {
                                    id: text2_normrded
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Normrdedzn
                                    Component.onCompleted: {
                                        text2_normrded.text = text2_normrded.text.replace(".",",")
                                    }
                                }
                            }
                        }
                        MouseArea {
                            id: mouse_normrded
                            anchors.fill: parent
                            onClicked: list_normrded.currentIndex = model.index//model0.index()
                        }
                    }//item_table_normhh
                }//delegate
                Component {
                    id: highlightBar_normrded
                    Rectangle {
                        id: hl1_normrded
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_normrded.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_normrded.currentItem.x
                        y: list_normrded.currentItem.y
                    }
                }

            }
        }//rec_list_normrded
    }//end rec4
    Rectangle {
        id: rec5
        anchors.top: parent.top
        anchors.left: rec4.right
        height: parent.height/3
        width: parent.width/5
        border.width: 1
        border.color: "#03a9f5"
        //color: "yellow"
        Text {
            id: text_normrd
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Норма механизм, рабочий диапазон:"
            Component.onCompleted: {
                if(text_normrd.width>(rec5.width-10)){
                    text_normrd.text = "Норма механизм, раб.диап.:"
                }
            }
        }
        TextField {
            id: tf_normrd
            anchors.top: text_normrd.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: but_normrd.left
            anchors.rightMargin: 5
            height: but_normrd.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            //placeholderText: "Введите наименование цеха"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_normrd.x = mouseX
                    contextMenu_normrd.y = mouseY
                    contextMenu_normrd.open()
                }
            }
            Menu {
                id: contextMenu_normrd
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_normrd.selectedText
                    onTriggered: tf_normrd.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_normrd.selectedText
                    onTriggered: tf_normrd.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_normrd.canPaste
                    onTriggered: tf_normrd.paste()
                }
            }
        }
        Button {
            id: but_normrd
            anchors.top: text_normrd.bottom
            anchors.right: but_del_normrd.left
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
                tf_normrd.text = tf_normrd.text.replace(",", ".")
                database.insertIntoNormRd(tf_normrd.text)
                model_normrd.updateModel()
                tf_normrd.clear()
            }
        }
        Button {
            id: but_del_normrd
            anchors.top: text_normrd.bottom
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_normrd.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_normrd
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordNormRd(model_normrd.getId(list_normrd.currentIndex))
                model_normrd.updateModel()
                list_normrd.currentIndex = -1
            }
        }
        Rectangle {
            id: rec_list_normrd
            anchors.top: tf_normrd.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_normrd
                anchors.fill: parent
                property real h: 30
                ListView {
                    id: list_normrd
                    anchors.fill: parent
                    clip: true
                    model: model_normrd
                    delegate: delegate_normrd
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    currentIndex: -1
                    ScrollBar.vertical: ScrollBar { id: vbar_normrd;
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
                    id: delegate_normrd
                    Item {
                        id: item_table_normrd
                        width: rec5.width
                        height: flick_normrd.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec2_normrd
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: parent.width-10
                            height: flick_normrd.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_normrd.col
                            RowLayout {
                                id: lay2_normrd
                                anchors.fill: parent
                                Text {
                                    id: text2_normrd
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Normrdzn
                                    Component.onCompleted: {
                                        text2_normrd.text = text2_normrd.text.replace(".",",")
                                    }
                                }
                            }
                        }
                        MouseArea {
                            id: mouse_normrd
                            anchors.fill: parent
                            onClicked: list_normrd.currentIndex = model.index//model0.index()
                        }
                    }//item_table_normhh
                }//delegate
                Component {
                    id: highlightBar_normrd
                    Rectangle {
                        id: hl1_normrd
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_normrd.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_normrd.currentItem.x
                        y: list_normrd.currentItem.y
                    }
                }

            }
        }//rec_list_normrd
    }//end rec5
    Rectangle {
        id: rec6
        anchors.top: rec1.bottom
        anchors.left: parent.left
        height: parent.height/3
        width: parent.width/5
        border.width: 1
        border.color: "#03a9f5"
        //color: "yellow"
        Text {
            id: text_ogrnomed
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Ограничение эл/дв, номинальный режим:"
            Component.onCompleted: {
                if(text_ogrnomed.width>(rec6.width-10)){
                    text_ogrnomed.text = "Огр. эл/дв, ном.реж.:"
                }
            }
        }
        TextField {
            id: tf_ogrnomed
            anchors.top: text_ogrnomed.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: but_ogrnomed.left
            anchors.rightMargin: 5
            height: but_ogrnomed.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            //placeholderText: "Введите наименование цеха"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_ogrnomed.x = mouseX
                    contextMenu_ogrnomed.y = mouseY
                    contextMenu_ogrnomed.open()
                }
            }
            Menu {
                id: contextMenu_ogrnomed
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_ogrnomed.selectedText
                    onTriggered: tf_ogrnomed.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_ogrnomed.selectedText
                    onTriggered: tf_ogrnomed.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_ogrnomed.canPaste
                    onTriggered: tf_ogrnomed.paste()
                }
            }
        }
        Button {
            id: but_ogrnomed
            anchors.top: text_ogrnomed.bottom
            anchors.right: but_del_ogrnomed.left
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
                tf_ogrnomed.text = tf_ogrnomed.text.replace(",", ".")
                database.insertIntoOgrNomED(tf_ogrnomed.text)
                model_ogrnomed.updateModel()
                tf_ogrnomed.clear()
            }
        }
        Button {
            id: but_del_ogrnomed
            anchors.top: text_ogrnomed.bottom
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_ogrnomed.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_ogrnomed
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordOgrNomED(model_ogrnomed.getId(list_ogrnomed.currentIndex))
                model_ogrnomed.updateModel()
                list_ogrnomed.currentIndex = -1
            }
        }
        Rectangle {
            id: rec_list_ogrnomed
            anchors.top: tf_ogrnomed.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_ogrnomed
                anchors.fill: parent
                property real h: 30
                ListView {
                    id: list_ogrnomed
                    anchors.fill: parent
                    clip: true
                    model: model_ogrnomed
                    delegate: delegate_ogrnomed
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    currentIndex: -1
                    ScrollBar.vertical: ScrollBar { id: vbar_ogrnomed;
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
                    id: delegate_ogrnomed
                    Item {
                        id: item_table_ogrnomed
                        width: rec6.width
                        height: flick_ogrnomed.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec2_ogrnomed
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: parent.width-10
                            height: flick_ogrnomed.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_ogrnomed.col
                            RowLayout {
                                id: lay2_ogrnomed
                                anchors.fill: parent
                                Text {
                                    id: text2_ogrnomed
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Ogrnomedzn
                                    Component.onCompleted: {
                                        text2_ogrnomed.text = text2_ogrnomed.text.replace(".",",")
                                    }
                                }
                            }
                        }
                        MouseArea {
                            id: mouse_ogrnomed
                            anchors.fill: parent
                            onClicked: list_ogrnomed.currentIndex = model.index//model0.index()
                        }
                    }//item_table_normhh
                }//delegate
                Component {
                    id: highlightBar_ogrnomed
                    Rectangle {
                        id: hl1_ogrnomed
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_ogrnomed.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_ogrnomed.currentItem.x
                        y: list_ogrnomed.currentItem.y
                    }
                }

            }
        }//rec_list_normrd
    }//end rec6
    Rectangle {
        id: rec7
        anchors.top: rec1.bottom
        anchors.left: rec6.right
        height: parent.height/3
        width: parent.width/5
        border.width: 1
        border.color: "#03a9f5"
        //color: "yellow"
        Text {
            id: text_ogrnom
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Ограничение механизм, номинальный режим:"
            Component.onCompleted: {
                if(text_ogrnom.width>(rec7.width-10)){
                    text_ogrnom.text = "Огр. механизм, ном.реж.:"
                }
            }
        }
        TextField {
            id: tf_ogrnom
            anchors.top: text_ogrnom.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: but_ogrnom.left
            anchors.rightMargin: 5
            height: but_ogrnom.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            //placeholderText: "Введите наименование цеха"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_ogrnom.x = mouseX
                    contextMenu_ogrnom.y = mouseY
                    contextMenu_ogrnom.open()
                }
            }
            Menu {
                id: contextMenu_ogrnom
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_ogrnom.selectedText
                    onTriggered: tf_ogrnom.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_ogrnom.selectedText
                    onTriggered: tf_ogrnom.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_ogrnom.canPaste
                    onTriggered: tf_ogrnom.paste()
                }
            }
        }
        Button {
            id: but_ogrnom
            anchors.top: text_ogrnom.bottom
            anchors.right: but_del_ogrnom.left
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
                tf_ogrnom.text = tf_ogrnom.text.replace(",", ".")
                database.insertIntoOgrNom(tf_ogrnom.text)
                model_ogrnom.updateModel()
                tf_ogrnom.clear()
            }
        }
        Button {
            id: but_del_ogrnom
            anchors.top: text_ogrnom.bottom
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_ogrnom.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_ogrnom
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordOgrNom(model_ogrnom.getId(list_ogrnom.currentIndex))
                model_ogrnom.updateModel()
                list_ogrnom.currentIndex = -1
            }
        }
        Rectangle {
            id: rec_list_ogrnom
            anchors.top: tf_ogrnom.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_ogrnom
                anchors.fill: parent
                property real h: 30
                ListView {
                    id: list_ogrnom
                    anchors.fill: parent
                    clip: true
                    model: model_ogrnom
                    delegate: delegate_ogrnom
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    currentIndex: -1
                    ScrollBar.vertical: ScrollBar { id: vbar_ogrnom;
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
                    id: delegate_ogrnom
                    Item {
                        id: item_table_ogrnom
                        width: rec6.width
                        height: flick_ogrnom.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec2_ogrnom
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: parent.width-10
                            height: flick_ogrnom.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_ogrnom.col
                            RowLayout {
                                id: lay2_ogrnom
                                anchors.fill: parent
                                Text {
                                    id: text2_ogrnom
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Ogrnomzn
                                    Component.onCompleted: {
                                        text2_ogrnom.text = text2_ogrnom.text.replace(".",",")
                                    }
                                }
                            }
                        }
                        MouseArea {
                            id: mouse_ogrnom
                            anchors.fill: parent
                            onClicked: list_ogrnom.currentIndex = model.index//model0.index()
                        }
                    }//item_table_normhh
                }//delegate
                Component {
                    id: highlightBar_ogrnom
                    Rectangle {
                        id: hl1_ogrnom
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_ogrnom.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_ogrnom.currentItem.x
                        y: list_ogrnom.currentItem.y
                    }
                }

            }
        }//rec_list_normrd
    }//end rec7
    Rectangle {
        id: rec8
        anchors.top: rec1.bottom
        anchors.left: rec7.right
        height: parent.height/3
        width: parent.width/5
        border.width: 1
        border.color: "#03a9f5"
        //color: "yellow"
        Text {
            id: text_ogrrded
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Ограничение эл/дв, рабочий диапазон:"
            Component.onCompleted: {
                if(text_ogrrded.width>(rec8.width-10)){
                    text_ogrrded.text = "Огр. эл/дв, раб.диап.:"
                }
            }
        }
        TextField {
            id: tf_ogrrded
            anchors.top: text_ogrrded.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: but_ogrrded.left
            anchors.rightMargin: 5
            height: but_ogrrded.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            //placeholderText: "Введите наименование цеха"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_ogrrded.x = mouseX
                    contextMenu_ogrrded.y = mouseY
                    contextMenu_ogrrded.open()
                }
            }
            Menu {
                id: contextMenu_ogrrded
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_ogrrded.selectedText
                    onTriggered: tf_ogrrded.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_ogrrded.selectedText
                    onTriggered: tf_ogrrded.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_ogrrded.canPaste
                    onTriggered: tf_ogrrded.paste()
                }
            }
        }
        Button {
            id: but_ogrrded
            anchors.top: text_ogrrded.bottom
            anchors.right: but_del_ogrrded.left
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
                tf_ogrrded.text = tf_ogrrded.text.replace(",", ".")
                database.insertIntoOgrRdED(tf_ogrrded.text)
                model_ogrrded.updateModel()
                tf_ogrrded.clear()
            }
        }
        Button {
            id: but_del_ogrrded
            anchors.top: text_ogrrded.bottom
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_ogrrded.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_ogrrded
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordOgrRdED(model_ogrrded.getId(list_ogrrded.currentIndex))
                model_ogrrded.updateModel()
                list_ogrrded.currentIndex = -1
            }
        }
        Rectangle {
            id: rec_list_ogrrded
            anchors.top: tf_ogrrded.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_ogrrded
                anchors.fill: parent
                property real h: 30
                ListView {
                    id: list_ogrrded
                    anchors.fill: parent
                    clip: true
                    model: model_ogrrded
                    delegate: delegate_ogrrded
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    currentIndex: -1
                    ScrollBar.vertical: ScrollBar { id: vbar_ogrrded;
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
                    id: delegate_ogrrded
                    Item {
                        id: item_table_ogrrded
                        width: rec8.width
                        height: flick_ogrrded.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec2_ogrrded
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: parent.width-10
                            height: flick_ogrrded.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_ogrrded.col
                            RowLayout {
                                id: lay2_ogrrded
                                anchors.fill: parent
                                Text {
                                    id: text2_ogrrded
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Ogrrdedzn
                                    Component.onCompleted: {
                                        text2_ogrrded.text = text2_ogrrded.text.replace(".",",")
                                    }
                                }
                            }
                        }
                        MouseArea {
                            id: mouse_ogrrded
                            anchors.fill: parent
                            onClicked: list_ogrrded.currentIndex = model.index//model0.index()
                        }
                    }//item_table_normhh
                }//delegate
                Component {
                    id: highlightBar_ogrrded
                    Rectangle {
                        id: hl1_ogrrded
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_ogrrded.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_ogrrded.currentItem.x
                        y: list_ogrrded.currentItem.y
                    }
                }

            }
        }//rec_list_ogrrded
    }//end rec8
    Rectangle {
        id: rec9
        anchors.top: rec1.bottom
        anchors.left: rec8.right
        height: parent.height/3
        width: parent.width/5
        border.width: 1
        border.color: "#03a9f5"
        //color: "yellow"
        Text {
            id: text_ogrrd
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Ограничение механизм, рабочий диапазон:"
            Component.onCompleted: {
                if(text_ogrrd.width>(rec9.width-10)){
                    text_ogrrd.text = "Огр. механизм, раб.диап.:"
                }
            }
        }
        TextField {
            id: tf_ogrrd
            anchors.top: text_ogrrd.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: but_ogrrd.left
            anchors.rightMargin: 5
            height: but_ogrrd.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            //placeholderText: "Введите наименование цеха"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_ogrrd.x = mouseX
                    contextMenu_ogrrd.y = mouseY
                    contextMenu_ogrrd.open()
                }
            }
            Menu {
                id: contextMenu_ogrrd
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_ogrrd.selectedText
                    onTriggered: tf_ogrrd.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_ogrrd.selectedText
                    onTriggered: tf_ogrrd.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_ogrrd.canPaste
                    onTriggered: tf_ogrrd.paste()
                }
            }
        }
        Button {
            id: but_ogrrd
            anchors.top: text_ogrrd.bottom
            anchors.right: but_del_ogrrd.left
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
                tf_ogrrd.text = tf_ogrrd.text.replace(",", ".")
                database.insertIntoOgrRd(tf_ogrrd.text)
                model_ogrrd.updateModel()
                tf_ogrrd.clear()
            }
        }
        Button {
            id: but_del_ogrrd
            anchors.top: text_ogrrd.bottom
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_ogrrd.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_ogrrd
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordOgrRd(model_ogrrd.getId(list_ogrrd.currentIndex))
                model_ogrrd.updateModel()
                list_ogrrd.currentIndex = -1
            }
        }
        Rectangle {
            id: rec_list_ogrrd
            anchors.top: tf_ogrrd.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_ogrrd
                anchors.fill: parent
                property real h: 30
                ListView {
                    id: list_ogrrd
                    anchors.fill: parent
                    clip: true
                    model: model_ogrrd
                    delegate: delegate_ogrrd
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    currentIndex: -1
                    ScrollBar.vertical: ScrollBar { id: vbar_ogrrd;
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
                    id: delegate_ogrrd
                    Item {
                        id: item_table_ogrrd
                        width: rec9.width
                        height: flick_ogrrd.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec2_ogrrd
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: parent.width-10
                            height: flick_ogrrd.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_ogrrd.col
                            RowLayout {
                                id: lay2_ogrrd
                                anchors.fill: parent
                                Text {
                                    id: text2_ogrrd
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Ogrrdzn
                                    Component.onCompleted: {
                                        text2_ogrrd.text = text2_ogrrd.text.replace(".",",")
                                    }
                                }
                            }
                        }
                        MouseArea {
                            id: mouse_ogrrd
                            anchors.fill: parent
                            onClicked: list_ogrrd.currentIndex = model.index//model0.index()
                        }
                    }//item_table_normhh
                }//delegate
                Component {
                    id: highlightBar_ogrrd
                    Rectangle {
                        id: hl1_ogrrd
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_ogrrd.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_ogrrd.currentItem.x
                        y: list_ogrrd.currentItem.y
                    }
                }

            }
        }//rec_list_ogrrd
    }//end rec9
    Rectangle {
        id: rec10
        anchors.top: rec1.bottom
        anchors.left: rec9.right
        height: parent.height/3
        width: parent.width/5
        border.width: 1
        border.color: "#03a9f5"
        //color: "yellow"
        Text {
            id: text_otkaznomed
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Отказ эл/дв, номинальный режим:"
            Component.onCompleted: {
                if(text_otkaznomed.width>(rec10.width-10)){
                    text_otkaznomed.text = "Отказ эл/дв, ном.реж.:"
                }
            }
        }
        TextField {
            id: tf_otkaznomed
            anchors.top: text_otkaznomed.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: but_otkaznomed.left
            anchors.rightMargin: 5
            height: but_otkaznomed.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            //placeholderText: "Введите наименование цеха"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_otkaznomed.x = mouseX
                    contextMenu_otkaznomed.y = mouseY
                    contextMenu_otkaznomed.open()
                }
            }
            Menu {
                id: contextMenu_otkaznomed
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_otkaznomed.selectedText
                    onTriggered: tf_otkaznomed.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_otkaznomed.selectedText
                    onTriggered: tf_otkaznomed.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_otkaznomed.canPaste
                    onTriggered: tf_otkaznomed.paste()
                }
            }
        }
        Button {
            id: but_otkaznomed
            anchors.top: text_otkaznomed.bottom
            anchors.right: but_del_otkaznomed.left
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
                tf_otkaznomed.text = tf_otkaznomed.text.replace(",", ".")
                database.insertIntoOtkazNomED(tf_otkaznomed.text)
                model_otkaznomed.updateModel()
                tf_otkaznomed.clear()
            }
        }
        Button {
            id: but_del_otkaznomed
            anchors.top: text_otkaznomed.bottom
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_otkaznomed.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_otkaznomed
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordOtkazNomED(model_otkaznomed.getId(list_otkaznomed.currentIndex))
                model_otkaznomed.updateModel()
                list_otkaznomed.currentIndex = -1
            }
        }
        Rectangle {
            id: rec_list_otkaznomed
            anchors.top: tf_otkaznomed.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_otkaznomed
                anchors.fill: parent
                property real h: 30
                ListView {
                    id: list_otkaznomed
                    anchors.fill: parent
                    clip: true
                    model: model_otkaznomed
                    delegate: delegate_otkaznomed
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    currentIndex: -1
                    ScrollBar.vertical: ScrollBar { id: vbar_otkaznomed;
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
                    id: delegate_otkaznomed
                    Item {
                        id: item_table_otkaznomed
                        width: rec10.width
                        height: flick_otkaznomed.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec2_otkaznomed
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: parent.width-10
                            height: flick_otkaznomed.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_otkaznomed.col
                            RowLayout {
                                id: lay2_otkaznomed
                                anchors.fill: parent
                                Text {
                                    id: text2_otkaznomed
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Otkaznomedzn
                                    Component.onCompleted: {
                                        text2_otkaznomed.text = text2_otkaznomed.text.replace(".",",")
                                    }
                                }
                            }
                        }
                        MouseArea {
                            id: mouse_otkaznomed
                            anchors.fill: parent
                            onClicked: list_otkaznomed.currentIndex = model.index//model0.index()
                        }
                    }//item_table_normhh
                }//delegate
                Component {
                    id: highlightBar_otkaznomed
                    Rectangle {
                        id: hl1_otkaznomed
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_otkaznomed.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_otkaznomed.currentItem.x
                        y: list_otkaznomed.currentItem.y
                    }
                }

            }
        }//rec_list_otkaznomed
    }//end rec10
    Rectangle {
        id: rec11
        anchors.top: rec6.bottom
        anchors.left: parent.left
        height: parent.height/3
        width: parent.width/5
        border.width: 1
        border.color: "#03a9f5"
        //color: "yellow"
        Text {
            id: text_otkaznom
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Отказ механизм, номинальный режим:"
            Component.onCompleted: {
                if(text_otkaznom.width>(rec11.width-10)){
                    text_otkaznom.text = "Отказ механизм, ном.реж.:"
                }
            }
        }
        TextField {
            id: tf_otkaznom
            anchors.top: text_otkaznom.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: but_otkaznom.left
            anchors.rightMargin: 5
            height: but_otkaznom.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            //placeholderText: "Введите наименование цеха"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_otkaznom.x = mouseX
                    contextMenu_otkaznom.y = mouseY
                    contextMenu_otkaznom.open()
                }
            }
            Menu {
                id: contextMenu_otkaznom
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_otkaznom.selectedText
                    onTriggered: tf_otkaznom.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_otkaznom.selectedText
                    onTriggered: tf_otkaznom.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_otkaznom.canPaste
                    onTriggered: tf_otkaznom.paste()
                }
            }
        }
        Button {
            id: but_otkaznom
            anchors.top: text_otkaznom.bottom
            anchors.right: but_del_otkaznom.left
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
                tf_otkaznom.text = tf_otkaznom.text.replace(",", ".")
                database.insertIntoOtkazNom(tf_otkaznom.text)
                model_otkaznom.updateModel()
                tf_otkaznom.clear()
            }
        }
        Button {
            id: but_del_otkaznom
            anchors.top: text_otkaznom.bottom
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_otkaznom.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_otkaznom
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordOtkazNom(model_otkaznom.getId(list_otkaznom.currentIndex))
                model_otkaznom.updateModel()
                list_otkaznom.currentIndex = -1
            }
        }
        Rectangle {
            id: rec_list_otkaznom
            anchors.top: tf_otkaznom.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_otkaznom
                anchors.fill: parent
                property real h: 30
                ListView {
                    id: list_otkaznom
                    anchors.fill: parent
                    clip: true
                    model: model_otkaznom
                    delegate: delegate_otkaznom
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    currentIndex: -1
                    ScrollBar.vertical: ScrollBar { id: vbar_otkaznom;
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
                    id: delegate_otkaznom
                    Item {
                        id: item_table_otkaznom
                        width: rec11.width
                        height: flick_otkaznom.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec2_otkaznom
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: parent.width-10
                            height: flick_otkaznom.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_otkaznom.col
                            RowLayout {
                                id: lay2_otkaznom
                                anchors.fill: parent
                                Text {
                                    id: text2_otkaznom
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Otkaznomzn
                                    Component.onCompleted: {
                                        text2_otkaznom.text = text2_otkaznom.text.replace(".",",")
                                    }
                                }
                            }
                        }
                        MouseArea {
                            id: mouse_otkaznom
                            anchors.fill: parent
                            onClicked: list_otkaznom.currentIndex = model.index//model0.index()
                        }
                    }//item_table_normhh
                }//delegate
                Component {
                    id: highlightBar_otkaznom
                    Rectangle {
                        id: hl1_otkaznom
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_otkaznom.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_otkaznom.currentItem.x
                        y: list_otkaznom.currentItem.y
                    }
                }

            }
        }//rec_list_otkaznom
    }//end rec11
    Rectangle {
        id: rec12
        anchors.top: rec6.bottom
        anchors.left: rec11.right
        height: parent.height/3
        width: parent.width/5
        border.width: 1
        border.color: "#03a9f5"
        //color: "yellow"
        Text {
            id: text_otkazrded
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Отказ эл/дв, рабочий диапазон:"
            Component.onCompleted: {
                if(text_otkazrded.width>(rec12.width-10)){
                    text_otkazrded.text = "Отказ эл/дв, раб.диап.:"
                }
            }
        }
        TextField {
            id: tf_otkazrded
            anchors.top: text_otkazrded.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: but_otkazrded.left
            anchors.rightMargin: 5
            height: but_otkazrded.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            //placeholderText: "Введите наименование цеха"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_otkazrded.x = mouseX
                    contextMenu_otkazrded.y = mouseY
                    contextMenu_otkazrded.open()
                }
            }
            Menu {
                id: contextMenu_otkazrded
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_otkazrded.selectedText
                    onTriggered: tf_otkazrded.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_otkazrded.selectedText
                    onTriggered: tf_otkazrded.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_otkazrded.canPaste
                    onTriggered: tf_otkazrded.paste()
                }
            }
        }
        Button {
            id: but_otkazrded
            anchors.top: text_otkazrded.bottom
            anchors.right: but_del_otkazrded.left
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
                tf_otkazrded.text = tf_otkazrded.text.replace(",", ".")
                database.insertIntoOtkazRdED(tf_otkazrded.text)
                model_otkazrded.updateModel()
                tf_otkazrded.clear()
            }
        }
        Button {
            id: but_del_otkazrded
            anchors.top: text_otkazrded.bottom
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_otkazrded.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_otkazrded
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordOtkazRdED(model_otkazrded.getId(list_otkazrded.currentIndex))
                model_otkazrded.updateModel()
                list_otkazrded.currentIndex = -1
            }
        }
        Rectangle {
            id: rec_list_otkazrded
            anchors.top: tf_otkazrded.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_otkazrded
                anchors.fill: parent
                property real h: 30
                ListView {
                    id: list_otkazrded
                    anchors.fill: parent
                    clip: true
                    model: model_otkazrded
                    delegate: delegate_otkazrded
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    currentIndex: -1
                    ScrollBar.vertical: ScrollBar { id: vbar_otkazrded;
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
                    id: delegate_otkazrded
                    Item {
                        id: item_table_otkazrded
                        width: rec12.width
                        height: flick_otkazrded.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec2_otkazrded
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: parent.width-10
                            height: flick_otkazrded.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_otkazrded.col
                            RowLayout {
                                id: lay2_otkazrded
                                anchors.fill: parent
                                Text {
                                    id: text2_otkazrded
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Otkazrdedzn
                                    Component.onCompleted: {
                                        text2_otkazrded.text = text2_otkazrded.text.replace(".",",")
                                    }
                                }
                            }
                        }
                        MouseArea {
                            id: mouse_otkazrded
                            anchors.fill: parent
                            onClicked: list_otkazrded.currentIndex = model.index//model0.index()
                        }
                    }//item_table_normhh
                }//delegate
                Component {
                    id: highlightBar_otkazrded
                    Rectangle {
                        id: hl1_otkazrded
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_otkazrded.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_otkazrded.currentItem.x
                        y: list_otkazrded.currentItem.y
                    }
                }

            }
        }//rec_list_otkazrded
    }//end rec12
    Rectangle {
        id: rec13
        anchors.top: rec6.bottom
        anchors.left: rec12.right
        height: parent.height/3
        width: parent.width/5
        border.width: 1
        border.color: "#03a9f5"
        //color: "yellow"
        Text {
            id: text_otkazrd
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Отказ механизм, рабочий диапазон:"
            Component.onCompleted: {
                if(text_otkazrd.width>(rec13.width-10)){
                    text_otkazrd.text = "Отказ механизм, раб.диап.:"
                }
            }
        }
        TextField {
            id: tf_otkazrd
            anchors.top: text_otkazrd.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: but_otkazrd.left
            anchors.rightMargin: 5
            height: but_otkazrd.height
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            //placeholderText: "Введите наименование цеха"
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_otkazrd.x = mouseX
                    contextMenu_otkazrd.y = mouseY
                    contextMenu_otkazrd.open()
                }
            }
            Menu {
                id: contextMenu_otkazrd
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_otkazrd.selectedText
                    onTriggered: tf_otkazrd.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_otkazrd.selectedText
                    onTriggered: tf_otkazrd.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_otkazrd.canPaste
                    onTriggered: tf_otkazrd.paste()
                }
            }
        }
        Button {
            id: but_otkazrd
            anchors.top: text_otkazrd.bottom
            anchors.right: but_del_otkazrd.left
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
                tf_otkazrd.text = tf_otkazrd.text.replace(",", ".")
                database.insertIntoOtkazRd(tf_otkazrd.text)
                model_otkazrd.updateModel()
                tf_otkazrd.clear()
            }
        }
        Button {
            id: but_del_otkazrd
            anchors.top: text_otkazrd.bottom
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: text_del_otkazrd.width+10
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                id: text_del_otkazrd
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
                color: "white"
                text: "Удалить"
            }
            onClicked: {
                database.removeRecordOtkazRd(model_otkazrd.getId(list_otkazrd.currentIndex))
                model_otkazrd.updateModel()
                list_otkazrd.currentIndex = -1
            }
        }
        Rectangle {
            id: rec_list_otkazrd
            anchors.top: tf_otkazrd.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            color: "transparent"
            Flickable {
                id: flick_otkazrd
                anchors.fill: parent
                property real h: 30
                ListView {
                    id: list_otkazrd
                    anchors.fill: parent
                    clip: true
                    model: model_otkazrd
                    delegate: delegate_otkazrd
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    currentIndex: -1
                    ScrollBar.vertical: ScrollBar { id: vbar_otkazrd;
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
                    id: delegate_otkazrd
                    Item {
                        id: item_table_otkazrd
                        width: rec13.width
                        height: flick_otkazrd.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                        Rectangle {
                            id: rec2_otkazrd
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: parent.width-10
                            height: flick_otkazrd.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table_otkazrd.col
                            RowLayout {
                                id: lay2_otkazrd
                                anchors.fill: parent
                                Text {
                                    id: text2_otkazrd
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Otkazrdzn
                                    Component.onCompleted: {
                                        text2_otkazrd.text = text2_otkazrd.text.replace(".",",")
                                    }
                                }
                            }
                        }
                        MouseArea {
                            id: mouse_otkazrd
                            anchors.fill: parent
                            onClicked: list_otkazrd.currentIndex = model.index//model0.index()
                        }
                    }//item_table_normhh
                }//delegate
                Component {
                    id: highlightBar_otkazrd
                    Rectangle {
                        id: hl1_otkazrd
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: flick_otkazrd.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list_otkazrd.currentItem.x
                        y: list_otkazrd.currentItem.y
                    }
                }

            }
        }//rec_list_otkazrd
    }//end rec13
}
