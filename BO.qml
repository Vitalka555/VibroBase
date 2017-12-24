import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.LocalStorage 2.0
import QtQuick.Controls.Material 2.2
import QtQuick.Controls.Styles 1.4

Item {
    id: item
//    Component.onCompleted: {
//        mapper.updateData(list.currentIndex)
//    }
    Page {
        anchors.fill: parent
        Rectangle {
            id: rec_0
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: 55
            Rectangle {
                id: rec_01
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                width: height
                border.color: "#03a9f5"
                radius: 10
                Image {
                    id: im_filter
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: "file:./Images/filter.png"
                }
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    NumberAnimation {
                        id: anim_01
                        target: rec_filter
                        property: "y"
                        from: 0
                        to: 50
                        duration: 1000
                        onStopped: {
                            rec_01.color = "#03a9f5"
                            im_filter.source = "file:./Images/filter_white.png"
//                            ma_kks.enabled = true
//                            ma_ceh.enabled = true
                        }
                    }
                    NumberAnimation {
                        id: anim_02
                        target: rec_filter
                        property: "y"
                        from: 50
                        to: 0
                        duration: 1000
                        onStopped: {
                            rec_01.color = "white"
                            im_filter.source = "file:./Images/filter.png"
//                            ma_kks.enabled = false
//                            ma_ceh.enabled = false
                        }
                    }
                    onEntered: {
                        if(rec_filter.y == 0){
                        rec_01.color = "#03a9f5"
                        im_filter.source = "file:./Images/filter_white.png"
                        }
                        if(rec_filter.y == 50){
                            rec_01.color = "white"
                            im_filter.source = "file:./Images/filter.png"
                        }
                    }
                    onExited: {
                        if(rec_filter.y == 0){
                        rec_01.color = "white"
                        im_filter.source = "file:./Images/filter.png"
                        }
                        if(rec_filter.y == 50){
                            rec_01.color = "#03a9f5"
                            im_filter.source = "file:./Images/filter_white.png"
                        }
                    }
                    onClicked: {
                        if(rec_filter.y == 0){
                            anim_01.start()
                        }
                        if(rec_filter.y == 50){
                            anim_02.start()
                        }
                    }
                }
            }

        }

    Rectangle {
        id: rec_filter
        z: -1
        //anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 55
        //color: "lightblue"
        Rectangle {
            id: recf1
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            border.color: "#03a9f5"
            color: "#03a9f5"
            radius: 10
            width: 220
            Text {
                id: f_kks
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 5
                font.pixelSize: 15
                color: "white"
                text: "KKS:"
            }
            TextField {
                id: filter_kks
                Material.theme: Material.Dark
                Material.accent: "white"
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: f_kks.right
                anchors.leftMargin: 5
                color: "white"
                width: 170
                focus: true
                selectByMouse: true
                persistentSelection: true
                text: ""
                MouseArea {
                    acceptedButtons: Qt.RightButton
                    anchors.fill: parent
                    onClicked: {
                        contextMenu_filter_kks.x = mouseX
                        contextMenu_filter_kks.y = mouseY
                        contextMenu_filter_kks.open()
                    }
                }
                Menu {
                    id: contextMenu_filter_kks

                    MenuItem {
                        text: qsTr("Копировать")
                        enabled: filter_kks.selectedText
                        onTriggered: filter_kks.copy()
                    }
                    MenuItem {
                        text: qsTr("Вырезать")
                        enabled: filter_kks.selectedText
                        onTriggered: filter_kks.cut()
                    }
                    MenuItem {
                        text: qsTr("Вставить")
                        enabled: filter_kks.canPaste
                        onTriggered: filter_kks.paste()
                    }
                }
            }

        }
        Rectangle {
            id: recf2
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: recf1.right
            anchors.leftMargin: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            border.color: "#03a9f5"
            color: "#03a9f5"
            radius: 10
            width: 200//220
            Text {
                id: f_ceh
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 5
                font.pixelSize: 15
                color: "white"
                text: "Цех:"
            }
            ComboBox {
                id: filter_combo_ceh
                //visible: false
                property string id: ""
                currentIndex: -1
                anchors.verticalCenter: parent.verticalCenter
                Material.foreground: Material.LightBlue
                anchors.left: f_ceh.right
                anchors.leftMargin: 5
                model: model_ceh
                textRole: 'Cehname'
                width: 100
                //textColor: "white"
                delegate: ItemDelegate {
                    Material.foreground: Material.LightBlue
                    Material.background: Material.LightBlue
                    width: filter_combo_ceh.width
                    text: filter_combo_ceh.textRole ? (Array.isArray(filter_combo_ceh.model) ? modelData[filter_combo_ceh.textRole] : model[filter_combo_ceh.textRole]) : modelData
                    highlighted: filter_combo_ceh.highlightedIndex === index
                }
                onCurrentTextChanged: {
                    if(currentIndex==-1){
                        filter_combo_ceh.id = ""
                    } else {
                    filter_combo_ceh.id = model_ceh.getId(currentIndex)
                    }
                }
            }
            Button {
                id: but_filter_combo_ceh
                //visible: false
                anchors.left: filter_combo_ceh.right
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                width: height
                highlighted: true
                Material.accent: Material.LightBlue
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 20
                    color: "white"
                    text: "X"

                }
                onClicked: {
                    filter_combo_ceh.currentIndex = -1
                }
            }

        }
        Rectangle {
            id: recf3
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: recf2.right
            anchors.leftMargin: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            border.color: "#03a9f5"
            color: "#03a9f5"
            radius: 10
            width: 170
        Text {
            id: f_zd
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            color: "white"
            text: "Здание:"
        }
        TextField {
            id: filter_zd
            Material.theme: Material.Dark
            Material.accent: "white"
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: f_zd.right
            anchors.leftMargin: 5
            width: 100
            //highlighted: true
            //Material.accent: Material.LightBlue
            //placeholderText: "Введите KKS оборудования"
            focus: true
            selectByMouse: true
            persistentSelection: true
            text: ""
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_filter_zd.x = mouseX
                    contextMenu_filter_zd.y = mouseY
                    contextMenu_filter_zd.open()
                }
            }
            Menu {
                id: contextMenu_filter_zd

                MenuItem {
                    text: qsTr("Копировать")
                    enabled: filter_zd.selectedText
                    onTriggered: filter_zd.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: filter_zd.selectedText
                    onTriggered: filter_zd.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: filter_zd.canPaste
                    onTriggered: filter_zd.paste()
                }

               // MenuSeparator {}

            }
        }
    }
        Rectangle {
            id: recf4
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: recf3.right
            anchors.leftMargin: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            border.color: "#03a9f5"
            color: "#03a9f5"
            radius: 10
            width: 355//220
        Text {
            id: f_tipagr
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            color: "white"
            text: "Тип агрегата:"
        }
        ComboBox {
            id: filter_combo_tipagr
            property string id: ""
            currentIndex: -1
            anchors.verticalCenter: parent.verticalCenter
            Material.foreground: Material.LightBlue
            anchors.topMargin: 5
            anchors.left: f_tipagr.right
            anchors.leftMargin: 5
            //displayText:  "Выберите цех"
            width: 190
            //Material.background: Material.LightBlue
            model: model_tipmeh
            textRole: 'Tipmehname'
            delegate: ItemDelegate {
                //id: fdel
                //Material.foreground: Material.LightBlue
                Material.foreground: Material.LightBlue
                Material.background: Material.LightBlue
                width: filter_combo_tipagr.width
                text: filter_combo_tipagr.textRole ? (Array.isArray(filter_combo_tipagr.model) ? modelData[filter_combo_tipagr.textRole] : model[filter_combo_tipagr.textRole]) : modelData
                highlighted: filter_combo_tipagr.highlightedIndex === index

            }

            onCurrentTextChanged: {
                if(currentIndex==-1){
                    filter_combo_tipagr.id = ""
                } else {
                filter_combo_tipagr.id = model_tipmeh.getId(currentIndex)
                }
            }
        }
        Button {
            id: but_filter_combo_tipagr
            anchors.left: filter_combo_tipagr.right
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            width: height
            highlighted: true
            Material.accent: Material.LightBlue
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 20
                color: "white"
                text: "X"

            }
            onClicked: {
                filter_combo_tipagr.currentIndex = -1
            }
        }
        }
        Button {
            id: but_poisk
            anchors.left: recf4.right
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            height: parent.height
            width: height - 10
            highlighted: true
            Material.accent: Material.LightBlue
            Image {
                id: im_poisk
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "file:./Images/poisk.png"
            }
            onClicked: {
                stackView.kks = filter_kks.text
                stackView.zd = filter_zd.text
                if(filter_combo_ceh.currentIndex == -1){
                    stackView.id_ceh = ""
                } else {
                    stackView.id_ceh = filter_combo_ceh.id
                }
                if(filter_combo_tipagr.currentIndex == -1){
                    stackView.id_tipmeh = ""
                } else {
                    stackView.id_tipmeh = filter_combo_tipagr.id
                }
                qmlFilterBO()
            }
        }


    }
footer:    ToolBar {
        id: rec_button
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        //height: 30
        //color: "lightgreen"
        ToolButton {
            id: but_creat
            anchors.bottom: parent.bottom
            //anchors.bottomMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            //highlighted: true
            //Material.primary: "LightBlue"
            //Material.accent: Material.LightBlue
            text: "Создать"
            onClicked: {
                stackView.replace(creatBO)
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
            onClicked: {
                //list.currentIndex = model.index
                window.index = list.currentIndex
                stackView.baza_id = model0.getId(list.currentIndex)
                console.log("id= ", stackView.baza_id)
                qmlSignal_baza_id()
                    stackView.replace(addBO)
                    tool_left.visible = false
                    tool_left1.visible = true
            }
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
                database.removeRecord(model0.getId(list.currentIndex))
                model0.updateModel()
            }
        }
    }
    Rectangle {
        id: rec_table
        anchors.top: rec_filter.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        Rectangle {
            id: rec_name_column
            anchors.top: rec_table.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: 40
            Rectangle {
                id: rec_number
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                width: parent.width/20
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_number
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("№")
                }
            }
            Rectangle {
                id: rec_kks
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: rec_number.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                width: parent.width/5
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_kks
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("KKS")
                }
            }
            Rectangle {
                id: rec_ceh
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: rec_kks.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                width: parent.width/20
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_ceh
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("Цех")
                }
            }
            Rectangle {
                id: rec_zd
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: rec_ceh.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                width: parent.width/10
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_zd
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("Здание")
                }
            }
            Rectangle {
                id: rec_pom
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: rec_zd.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                width: parent.width/10
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_pom
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("Помещение")
                }
            }
            Rectangle {
                id: rec_name
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: rec_pom.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                anchors.right: parent.right
                anchors.rightMargin: 5
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_name
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("Наименование")
                }
            }


        } //rec_name_column
        Rectangle {
            id: rec_list
            anchors.top: rec_name_column.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            //color: "red"
            Flickable {
                id: flick
                anchors.fill: parent
                property real h

                ListView {
                    id: list
                    anchors.fill: parent
                    clip: true
                    model: model0
                    delegate: delegate
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    currentIndex: window.index
                    //highlight: highlightBar
                    //highlightFollowsCurrentItem: false
                    ScrollBar.vertical: ScrollBar { id: vbar;
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
                    id: delegate

                    Item {
                        id: item_table
                        width: window.width
                        height: flick.h
                        property int number: index
                        property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"

                        Rectangle {
                            id: rec1
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: parent.width/20
                            height: flick.h//text1.height*2
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table.col
                            //border.color: Qt.lighter(color, 1.1)
                            //color: "lightblue"



                            RowLayout {
                                id: lay1
                                anchors.fill: parent
                                Text {
                                    id: text1
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: number+1
                                }
                            }
                        }
                        Rectangle {
                            id: rec2
                            anchors.top: parent.top
                            anchors.left: rec1.right
                            anchors.leftMargin: 5
                            width: rec_kks.width
                            height: flick.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table.col

                            RowLayout {
                                id: lay2
                                anchors.fill: parent
                                Text {
                                    id: text2
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Bazakks
                                }
                            }
                        }
                        Rectangle {
                            id: rec3
                            anchors.top: parent.top
                            anchors.left: rec2.right
                            anchors.leftMargin: 5
                            width: rec_ceh.width
                            height: flick.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table.col
                            RowLayout {
                                id: lay3
                                anchors.fill: parent
                                Text {
                                    id: text3
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
                        Rectangle {
                            id: rec4
                            anchors.top: parent.top
                            anchors.left: rec3.right
                            anchors.leftMargin: 5
                            width: rec_zd.width
                            height: flick.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table.col
                            RowLayout {
                                id: lay4
                                anchors.fill: parent
                                Text {
                                    id: text4
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Bazazd
                                }
                            }
                        }
                        Rectangle {
                            id: rec5
                            anchors.top: parent.top
                            anchors.left: rec4.right
                            anchors.leftMargin: 5
                            width: rec_pom.width
                            height: flick.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table.col
                            RowLayout {
                                id: lay5
                                anchors.fill: parent
                                Text {
                                    id: text5
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Bazapom
                                }
                            }
                        }
                        Rectangle {
                            id: rec6
                            anchors.top: parent.top
                            anchors.left: rec5.right
                            anchors.leftMargin: 5
                            width: rec_name.width
                            height: flick.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table.col

                                Text {
                                    id: text6
//                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: rec_name.width-10
                                    anchors.left: parent.left
                                    anchors.leftMargin: 5
                                    anchors.right: parent.right
                                    anchors.rightMargin: 5
                                    wrapMode: Text.WordWrap
                                    maximumLineCount: 2
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Bazaopis
                                }

                            Component.onCompleted: {
//                                flick.h = Math.max(text1.height*2,text2.height,text3.height,text4.height,text5.height,text6.height)
//                                console.log("flick.h = ", flick.h)
                                flick.h = text1.height*2
                            }
                        }
                        MouseArea {
                            id: mouse
                            anchors.fill: parent
                            onClicked: list.currentIndex = model.index//model0.index()
                            onDoubleClicked: {
                                list.currentIndex = model.index
                                window.index = list.currentIndex
                                stackView.baza_id = model0.getId(list.currentIndex)
                                console.log("id= ", stackView.baza_id)
                                qmlSignal_baza_id()
                                    stackView.replace(openBO)
                                    tool_left.visible = false
                                    tool_left1.visible = true
                                }
                        }
                    }//item_table
                }//delegate
                Component {
                    id: highlightBar
                    Rectangle {
                        id: hl1
                        z: -1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        //width: window.width-10
                        height: flick.h
                        color: "lightgrey"
                        border.color: "transparent"
                        radius: 10
                        x: list.currentItem.x
                        y: list.currentItem.y
                        //Behavior on y { SpringAnimation { spring: 100; damping: 1 } }

                        //NumberAnimation on x { from: 5; to: 10; duration: 500}
                    }
                }

            }
        }//rec_list
    }
    }

}
