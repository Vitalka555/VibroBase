import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.LocalStorage 2.0
import QtQuick.Controls.Material 2.2
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
                    id: ma_rec_01
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
            width: 140//220
            CheckBox {
                id: check_problem
                Material.accent: Material.LightBlue
                Material.theme: Material.Dark
                //Material.foreground: Material.LightBlue
                //Material.background: Material.LightBlue
                checked: false
                //text: "Не исправны"
                onCheckableChanged: {

                }
            }
            Text {
                id: text_problem
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: check_problem.right
                //anchors.leftMargin: 5
                font.pixelSize: 15
                color: "white"
                text: "Не исправны"
            }
        }
        Button {
            id: but_clean
            anchors.left: recf3.right
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            height: parent.height
            width: height - 10
            highlighted: true
            Material.accent: Material.LightBlue
            Image {
                id: im_clean
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "file:./Images/clean.png"
            }
            onClicked: {
                filter_kks.clear()
                filter_combo_tipagr.currentIndex = -1
                check_problem.checked = false
            }
        }
        Button {
            id: but_poisk
            anchors.left: but_clean.right
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
                stackView.kks_filter_BI = filter_kks.text
                if(filter_combo_tipagr.currentIndex == -1){
                    stackView.id_tipmeh_filter_BI = ""
                } else {
                    stackView.id_tipmeh_filter_BI = filter_combo_tipagr.id
                }
                if(!check_problem.checked){
                    stackView.neispravnoe = "false"
                }
                if(check_problem.checked){
                    stackView.neispravnoe = "true"
                }
                qmlFilterBI()
            }
        }


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
                    tool_left1.visible = false
                    tool_left2.visible = true
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
                    database.removeRecordBI(model_izmer.getId(list.currentIndex))
                    model_izmer.updateModel()
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
                id: rec_date
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: rec_number.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                width: parent.width*3/20
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_date
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("Дата и время")
                }
            }
            Rectangle {
                id: rec_kks
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: rec_date.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                width: parent.width*3/20
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
                id: rec_vmax
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
                    id: text_vmax
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("Vmax")
                }
            }
            Rectangle {
                id: rec_ved
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: rec_vmax.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                width: parent.width/20
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_ved
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("Vэ/д")
                }
            }
            Rectangle {
                id: rec_vagr
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: rec_ved.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                width: parent.width/20
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_vagr
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("Vагр")
                }
            }
            Rectangle {
                id: rec_rezhim
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: rec_vagr.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                width: parent.width*3/20
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_rezhim
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("Режим")
                }
            }
            Rectangle {
                id: rec_name
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: rec_rezhim.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                width: parent.width*3/20
//                anchors.right: parent.right
//                anchors.rightMargin: 5
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_name
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("ЛАЭС-2")
                }
            }
            Rectangle {
                id: rec_name2
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: rec_name.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                anchors.right: parent.right
                anchors.rightMargin: 5
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_name2
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("АТЭ")
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
                    model: model_izmer
                    delegate: delegate
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    currentIndex: window.index_izmer
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
                            width: rec_date.width
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
                                    text: Bazaizmerdate
                                }
                            }
                        }
                        Rectangle {
                            id: rec3
                            anchors.top: parent.top
                            anchors.left: rec2.right
                            anchors.leftMargin: 5
                            width: rec_kks.width
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
                                    text: Bazaizmerkks
                                }
                            }
                            MouseArea {
                                acceptedButtons: Qt.RightButton
                                anchors.fill: parent
                                onClicked: {
                                    contextMenu_kks_filter.x = mouseX
                                    contextMenu_kks_filter.y = mouseY
                                    contextMenu_kks_filter.open()
                                }
                            }
                            Menu {
                                id: contextMenu_kks_filter

                                MenuItem {
                                    text: qsTr("Фильтровать")
                                    onTriggered: {
                                        if(rec_filter.y == 0){
                                            anim_01.start()
                                        }
                                        filter_kks.text = text3.text
                                        but_poisk.clicked()
                                    }
                                }
                               }
                        }
                        Rectangle {
                            id: rec4
                            anchors.top: parent.top
                            anchors.left: rec3.right
                            anchors.leftMargin: 5
                            width: rec_vmax.width
                            height: flick.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            //color: item_table.col
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
                                    text: Bazaizmervmax
                                }
                            }
                        }
                        Rectangle {
                            id: rec5
                            anchors.top: parent.top
                            anchors.left: rec4.right
                            anchors.leftMargin: 5
                            width: rec_ved.width
                            height: flick.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            property string sost: Bazaizmersost
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
                                    text: Bazaizmernormed
                                }
                            }
                            Component.onCompleted: {
                                if(rec5.sost=="Норма"){
//                                    rec1.color = "lightgreen"
//                                    rec2.color = "lightgreen"
//                                    rec3.color = "lightgreen"
                                    rec4.color = "lightgreen"
//                                    rec5.color = "lightgreen"
//                                    rec6.color = "lightgreen"
//                                    rec7.color = "lightgreen"
//                                    rec8.color = "lightgreen"
//                                    rec9.color = "lightgreen"
                                }
                                if(rec5.sost=="Превышение"){
//                                    rec1.color = "lightcoral"
//                                    rec2.color = "lightcoral"
//                                    rec3.color = "lightcoral"
                                    rec4.color = "lightcoral"
//                                    rec5.color = "lightcoral"
//                                    rec6.color = "lightcoral"
//                                    rec7.color = "lightcoral"
//                                    rec8.color = "lightcoral"
//                                    rec9.color = "lightcoral"
                                }
                            }
                        }
                        Rectangle {
                            id: rec6
                            anchors.top: parent.top
                            anchors.left: rec5.right
                            anchors.leftMargin: 5
                            width: rec_vagr.width
                            height: flick.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table.col
                            RowLayout {
                                id: lay6
                                anchors.fill: parent
                                Text {
                                    id: text6
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Bazaizmernorm
                                }
                            }
                        }
                        Rectangle {
                            id: rec7
                            anchors.top: parent.top
                            anchors.left: rec6.right
                            anchors.leftMargin: 5
                            width: rec_rezhim.width
                            height: flick.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table.col
                            RowLayout {
                                id: lay7
                                anchors.fill: parent
                                Text {
                                    id: text7
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Bazaizmerrezhim
                                }
                            }
                        }
                        Rectangle {
                            id: rec8
                            anchors.top: parent.top
                            anchors.left: rec7.right
                            anchors.leftMargin: 5
                            width: rec_name.width
                            height: flick.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table.col

                                Text {
                                    id: text8
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
                                    text: Bazaizmerlaes2
                                }

                            Component.onCompleted: {
//                                flick.h = Math.max(text1.height*2,text2.height,text3.height,text4.height,text5.height,text6.height)
//                                console.log("flick.h = ", flick.h)
                                flick.h = text1.height*2
                            }
                        }
                        Rectangle {
                            id: rec9
                            anchors.top: parent.top
                            anchors.left: rec8.right
                            anchors.leftMargin: 5
                            width: rec_name2.width
                            height: flick.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table.col

                                Text {
                                    id: text9
//                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: rec_name2.width-10
                                    anchors.left: parent.left
                                    anchors.leftMargin: 5
                                    anchors.right: parent.right
                                    anchors.rightMargin: 5
                                    wrapMode: Text.WordWrap
                                    maximumLineCount: 2
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: Bazaizmerate
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
                                window.index_izmer = list.currentIndex
                                stackView.bazaizm_id = model_izmer.getId(list.currentIndex)
                                console.log("id= ", stackView.bazaizm_id)
                                qmlSignal_bazaizmer_id()
                                    stackView.replace(openBI)
                                    tool_left.visible = false
                                    tool_left1.visible = false
                                tool_left2.visible = true
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
                        color: "#03a9f5"
                        border.color: "transparent"
                        radius: 10
                        //x: list.currentItem.x
                        y: list.currentItem.y
                        //Behavior on y { SpringAnimation { spring: 100; damping: 1 } }

                        //NumberAnimation on x { from: 5; to: 10; duration: 500}
                    }
                }

            }
        }//rec_list
    }

    } //page

}
