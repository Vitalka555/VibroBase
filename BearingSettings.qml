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
        Component.onCompleted: {
            qmlPodsh()
        }
        Dialog {
            id: dialog
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: parent.width/2
            height: row1.height + row2.height + 80
            modal: Qt.WindowModal
            closePolicy: Popup.NoAutoClose
            title: "Предупреждение!"
            Row {
                id: row1
                anchors.top: parent.top
                width: parent.width
                height: text_del.height
                Text {
                    id: text_del
                    width: parent.width
                    wrapMode: Text.WordWrap
                    font.pixelSize: 15
                    text: "Удаление подшипника уничтожит все связанные с ним данные. Продолжить?"
                }
            }
            RowLayout {
                id: row2
                anchors.top: row1.bottom
                anchors.topMargin: 10
                width: parent.width
                layoutDirection: Qt.LeftToRight
                spacing: 10
                Button {
                    id: but1
                    anchors.right: but2.left
                    anchors.rightMargin: 10
                    highlighted: true
                    Material.accent: Material.LightBlue
                    text: "Отмена"
                    onClicked: {
                        dialog.close()
                    }
                }
                Button {
                    id: but2
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    highlighted: true
                    Material.accent: Material.LightBlue
                    text: "Подтвердить"
                    onClicked: {
                        database.removeRecordBearing(model_podsh.getId(list.currentIndex))
                        model_podsh.updateModel()
                        dialog.close()
                    }
                }
            }
        }
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
        Component.onCompleted: {
            filter_obRU.text = stackView.obRU
            filter_obEN.text = stackView.obEN
            if(filter_obRU.text!==""){
                rec_filter.y = 50
            }            
            if(filter_obEN.text!==""){
                rec_filter.y = 50
            }
        }
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
            width: 300
            Text {
                id: f_obRU
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 5
                font.pixelSize: 15
                color: "white"
                text: "ОбозначениеRU:"
            }
            TextField {
                id: filter_obRU
                Material.theme: Material.Dark
                Material.accent: "white"
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: f_obRU.right
                anchors.leftMargin: 5
                color: "white"
                width: 170
                focus: true
                selectByMouse: true
                persistentSelection: true
                text: ""
                Keys.onPressed: {
                    if(event.key === Qt.Key_Enter){
                                            but_poisk.clicked()
                                        }
                    if(event.key === Qt.Key_Return){
                                            but_poisk.clicked()
                                        }
                }
                MouseArea {
                    acceptedButtons: Qt.RightButton
                    anchors.fill: parent
                    onClicked: {
                        contextMenu_filter_obRU.x = mouseX
                        contextMenu_filter_obRU.y = mouseY
                        contextMenu_filter_obRU.open()
                    }
                }
                Menu {
                    id: contextMenu_filter_obRU

                    MenuItem {
                        text: qsTr("Копировать")
                        enabled: filter_obRU.selectedText
                        onTriggered: filter_obRU.copy()
                    }
                    MenuItem {
                        text: qsTr("Вырезать")
                        enabled: filter_obRU.selectedText
                        onTriggered: filter_obRU.cut()
                    }
                    MenuItem {
                        text: qsTr("Вставить")
                        enabled: filter_obRU.canPaste
                        onTriggered: filter_obRU.paste()
                    }
                }
            }
        }        
        Rectangle {
            id: recf3
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: recf1.right
            anchors.leftMargin: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            border.color: "#03a9f5"
            color: "#03a9f5"
            radius: 10
            width: 300
        Text {
            id: f_obEN
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            color: "white"
            text: "ОбозначениеEN:"
        }
        TextField {
            id: filter_obEN
            Material.theme: Material.Dark
            Material.accent: "white"
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: f_obEN.right
            anchors.leftMargin: 5
            width: 170
            focus: true
            selectByMouse: true
            persistentSelection: true
            text: ""
            Keys.onPressed: {
                if(event.key === Qt.Key_Enter){
                                        but_poisk.clicked()
                                    }
                if(event.key === Qt.Key_Return){
                                        but_poisk.clicked()
                                    }
            }
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_filter_obEN.x = mouseX
                    contextMenu_filter_obEN.y = mouseY
                    contextMenu_filter_obEN.open()
                }
            }
            Menu {
                id: contextMenu_filter_obEN

                MenuItem {
                    text: qsTr("Копировать")
                    enabled: filter_obEN.selectedText
                    onTriggered: filter_obEN.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: filter_obEN.selectedText
                    onTriggered: filter_obEN.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: filter_obEN.canPaste
                    onTriggered: filter_obEN.paste()
                }
            }
        }
    }        
        Button {
            id: but_poisk
            anchors.left: recf3.right
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
                stackView.obRU = filter_obRU.text
                stackView.obEN = filter_obEN.text
                qmlFilterBearing()
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
                stackView.replace(creatBearing)
                tool_left3.visible = false
                tool_left4.visible = true
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
                window.index_bearing = list.currentIndex
                stackView.bearing_id = model_podsh.getId(list.currentIndex)
                console.log("bearing_id= ", stackView.bearing_id)
                qmlSignal_bearing_id()
                    stackView.replace(addBearing)
                    tool_left3.visible = false
                    tool_left4.visible = true
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
                dialog.open()
//                database.removeRecord(model0.getId(list.currentIndex))
//                model0.updateModel()
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
                id: rec_obRU
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
                    id: text_obRU
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("ОбозначениеRU")
                }
            }
            Rectangle {
                id: rec_obEN
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: rec_obRU.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                width: parent.width*3/20
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_obEN
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("ОбозначениеEN")
                }
            }
            Rectangle {
                id: rec_dvn
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: rec_obEN.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                width: parent.width/20
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_dvn
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("d")
                }
            }
            Rectangle {
                id: rec_dnar
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: rec_dvn.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                width: parent.width/20
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_dnar
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("D")
                }
            }
            Rectangle {
                id: rec_b
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: rec_dnar.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                width: parent.width/20
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_b
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("B")
                }
            }
            Rectangle {
                id: rec_dtk
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: rec_b.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                width: parent.width/20
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_dtk
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("dтк")
                }
            }
            Rectangle {
                id: rec_ztk
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: rec_dtk.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                width: parent.width/20
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_ztk
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("zтк")
                }
            }
            Rectangle {
                id: rec_a
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: rec_ztk.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                width: parent.width/20
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_a
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("α")
                }
            }
            Rectangle {
                id: rec_massa
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: rec_a.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                width: parent.width/20
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_massa
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("Масса")
                }
            }
            Rectangle {
                id: rec_name
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: rec_massa.right
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
                    //property var current
                    anchors.fill: parent
                    clip: true
                    model: model_podsh
                    delegate: delegate
                    focus: true
                    headerPositioning: ListView.OverlayHeader
                    spacing: 2
                    currentIndex: window.index_bearing
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
                            width: rec_obRU.width
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
                                    text: podsh_obRU
                                }
                            }
                        }
                        Rectangle {
                            id: rec3
                            anchors.top: parent.top
                            anchors.left: rec2.right
                            anchors.leftMargin: 5
                            width: rec_obEN.width
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
                                    text: podsh_obEN
                                }
                            }
                        }
                        Rectangle {
                            id: rec4
                            anchors.top: parent.top
                            anchors.left: rec3.right
                            anchors.leftMargin: 5
                            width: rec_dvn.width
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
                                    text: podsh_dvn
                                    Component.onCompleted: text4.text = text4.text.replace(".", ",")
                                }
                            }
                        }
                        Rectangle {
                            id: rec5
                            anchors.top: parent.top
                            anchors.left: rec4.right
                            anchors.leftMargin: 5
                            width: rec_dnar.width
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
                                    text: podsh_dnar
                                    Component.onCompleted: text5.text = text5.text.replace(".", ",")
                                }
                            }
                        }
                        Rectangle {
                            id: rec6
                            anchors.top: parent.top
                            anchors.left: rec5.right
                            anchors.leftMargin: 5
                            width: rec_b.width
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
                                    text: podsh_b
                                    Component.onCompleted: text6.text = text6.text.replace(".", ",")
                                }
                            }
                        }
                        Rectangle {
                            id: rec7
                            anchors.top: parent.top
                            anchors.left: rec6.right
                            anchors.leftMargin: 5
                            width: rec_dtk.width
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
                                    text: podsh_dtk
                                    Component.onCompleted: text7.text = text7.text.replace(".", ",")
                                }
                            }
                        }
                        Rectangle {
                            id: rec8
                            anchors.top: parent.top
                            anchors.left: rec7.right
                            anchors.leftMargin: 5
                            width: rec_ztk.width
                            height: flick.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table.col
                            RowLayout {
                                id: lay8
                                anchors.fill: parent
                                Text {
                                    id: text8
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: podsh_ztk
                                }
                            }
                        }
                        Rectangle {
                            id: rec9
                            anchors.top: parent.top
                            anchors.left: rec8.right
                            anchors.leftMargin: 5
                            width: rec_a.width
                            height: flick.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table.col
                            RowLayout {
                                id: lay9
                                anchors.fill: parent
                                Text {
                                    id: text9
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: podsh_a
                                    Component.onCompleted: text9.text = text9.text.replace(".", ",")
                                }
                            }
                        }
                        Rectangle {
                            id: rec10
                            anchors.top: parent.top
                            anchors.left: rec9.right
                            anchors.leftMargin: 5
                            width: rec_massa.width
                            height: flick.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table.col
                            RowLayout {
                                id: lay10
                                anchors.fill: parent
                                Text {
                                    id: text10
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#2e2efb"//"#3E65FF"
                                    text: podsh_massa
                                    Component.onCompleted: text10.text = text10.text.replace(".", ",")
                                }
                            }
                        }
                        Rectangle {
                            id: rec11
                            anchors.top: parent.top
                            anchors.left: rec10.right
                            anchors.leftMargin: 5
                            width: rec_name.width
                            height: flick.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table.col

                                Text {
                                    id: text11
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
                                    text: podsh_name
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
                            onClicked: {
                                list.currentIndex = model.index//model0.index()
                                window.index_bearing = list.currentIndex
                                stackView.bearing_id = model_podsh.getId(list.currentIndex)
                            }
//                            onDoubleClicked: {
//                                list.currentIndex = model.index
//                                window.index = list.currentIndex
//                                stackView.baza_id = model0.getId(list.currentIndex)
//                                console.log("id= ", stackView.baza_id)
//                                qmlSignal_baza_id()
//                                    stackView.replace(openBO)
//                                    tool_left.visible = false
//                                    tool_left1.visible = true
//                                }
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

