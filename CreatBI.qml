import QtQuick 2.9
import QtQuick.Controls 2.2
//import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Extras 1.2


Item {
    id: item_creatBI
    property var tempDate: new Date();
    Page {
        id: page
        property var tempDate: new Date();
        anchors.fill: parent
        footer: ToolBar {
            //Rectangle {
                id: rec_button
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                //height: 50
                //color: "lightgreen"
                ToolButton {
                    id: but_save
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    text: "Сохранить"
                    onClicked: {
                        tf_date.tex = tf_date.text.replace(/(\d+)-(\d+)-(\d+)/,'$3-$2-$1') + " 00:00:00.000" //меняем формат даты для записи в базу

                        database.insertIntoBazaIzmereni(combo_kks.id, tf_date.tex, tf_time.text, combo_rezhim.id, combo_tipizmer.id, tf_norm_ed.text,
                                                        tf_norm_meh.text)
//                        console.log(combo_kks.id)
//                        console.log(tf_date.tex)
//                        console.log(tf_time.text)
                        model_izmer.updateModel()
                        stackView.replace(bi)
                        tool_left.visible = true
                        tool_left1.visible = false
                    }
                }
                ToolButton {
                    id: but_cancel
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                    //highlighted: true
                    //Material.accent: Material.LightBlue
                    text: "Отмена"
                    onClicked: {
                    }
                }
            }
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Rectangle{
    id: rec_1
    anchors.top: parent.top
    anchors.left: parent.left
    height: combo_kks.height+tf_date.height+tf_time.height+combo_rezhim.height+combo_tipizmer.height+text_norm.height+tf_norm_ed.height+tf_norm_meh.height + 40
    width: text_tipizmer.width+combo_tipizmer.width+but_kks.width + 20
    //color: "lightgrey"

        Text {
            id: text_kks
            anchors.verticalCenter: combo_kks.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "KKS:"
        }
        ComboBox {
            id: combo_kks
            property string id: ""
            currentIndex: -1
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: combo_tipizmer.right
            width: 200
            editable: true
            inputMethodHints: Qt.ImhNone
            //locale: Qt.locale("de_DE")
            //validator: RegExpValidator { regExp: /[0-9a-zA-Z]+/ }
            //inputMethodComposing: false
            //count: 10
            //down: true
            //popup.visible: true
            //Material.background: Material.LightBlue
            //model: model_kks
            textRole: 'kksname'
            delegate: ItemDelegate {
                //Material.foreground: Material.LightBlue
                width: combo_kks.width
                text: combo_kks.textRole ? (Array.isArray(combo_kks.model) ? modelData[combo_kks.textRole] : model[combo_kks.textRole]) : modelData
                highlighted: combo_kks.highlightedIndex === index

            }

            onCurrentTextChanged: {
                if(currentIndex==-1){
                    combo_kks.id = ""
                    stackView.baza_id_for_norm_creatBI = combo_kks.id
                } else {
                combo_kks.id = model_kks.getId(currentIndex)
                    stackView.baza_id_for_norm_creatBI = combo_kks.id
                    console.log("id в Baza", stackView.baza_id_for_norm_creatBI)
                }
            }

        }
        Button {
            id: but_kks
            anchors.top: combo_kks.top
            anchors.left: combo_kks.right
            anchors.leftMargin: 5
            width: height - 10
            highlighted: true
            Material.accent: Material.LightBlue
            Image {
                id: im_poisk
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "file:./Images/poisk.png"
            }
            //text: "Поиск"
            onClicked: {
                stackView.combo_kks = combo_kks.editText
                qmlKKS_filter()
                combo_kks.model = model_kks
                combo_kks.popup.visible = true
            }
        }
        Text {
            id: text_date
            anchors.verticalCenter: tf_date.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Дата:"
        }
        TextField {
            id: tf_date
            anchors.top: combo_kks.bottom
            anchors.topMargin: 5
            anchors.left: combo_tipizmer.left
            height: combo_kks.height
            width: 90
            //highlighted: true
            //Material.accent: Material.LightBlue
            //placeholderText: "Введите KKS оборудования"
            focus: true
            selectByMouse: true
            persistentSelection: true
            inputMask: "00-00-0000"
            inputMethodHints: Qt.ImhDate
            horizontalAlignment: TextInput.AlignHCenter
            property string tex: Qt.formatDateTime(page.tempDate, "yyyy-MM-dd")
            //property string dateTimeString: "17-09-2013"
            text: Qt.formatDateTime(page.tempDate, "ddMMyyyy")
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_date.x = mouseX
                    contextMenu_date.y = mouseY
                    contextMenu_date.open()
                }
            }
            Menu {
                id: contextMenu_date
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_date.selectedText
                    onTriggered: tf_date.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_date.selectedText
                    onTriggered: tf_date.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_date.canPaste
                    onTriggered: tf_date.paste()
                }
            }
        }
        Button {
            anchors.top: tf_date.top
            anchors.left: tf_date.right
            anchors.leftMargin: 5
            width: height - 10
            highlighted: true
            Material.accent: Material.LightBlue
            Image {
                id: im_mouse_date
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "file:./Images/mouse.png"
            }
            //text: "Поиск"
            onClicked: {
                //console.log(tf_date.text)
                page.visible = false
                calendar0.visible = true
                //page.tempDate = tf_date.text
            }
        }
        Text {
            id: text_time
            anchors.verticalCenter: tf_time.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Время:"
        }
        TextField {
            id: tf_time
            anchors.top: tf_date.bottom
            anchors.topMargin: 5
            anchors.left: combo_tipizmer.left
            height: combo_kks.height
            width: 90
            //highlighted: true
            //Material.accent: Material.LightBlue
            //placeholderText: "Введите KKS оборудования"
            focus: true
            selectByMouse: true
            persistentSelection: true
            inputMask: "00:00"
            inputMethodHints: Qt.ImhTime
            horizontalAlignment: TextInput.AlignHCenter
            //property string dateTimeString: "17-09-2013"
            text: Qt.formatDateTime(new Date(), "hhmm")
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_time.x = mouseX
                    contextMenu_time.y = mouseY
                    contextMenu_time.open()
                }
            }
            Menu {
                id: contextMenu_time
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_time.selectedText
                    onTriggered: tf_time.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_time.selectedText
                    onTriggered: tf_time.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_time.canPaste
                    onTriggered: tf_time.paste()
                }
            }
        }
        Button {
            anchors.top: tf_time.top
            anchors.left: tf_time.right
            anchors.leftMargin: 5
            width: height - 10
            highlighted: true
            Material.accent: Material.LightBlue
            Image {
                id: im_mouse_time
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "file:./Images/mouse.png"
            }
            //text: "Поиск"
            onClicked: {
                //console.log(tf_time.text)
                page.visible = false
                win.visible = true
            }
        }
        Text {
            id: text_rezhim
            anchors.verticalCenter: combo_rezhim.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Режим:"
        }
        ComboBox {
            id: combo_rezhim
            property string id: ""
            currentIndex: -1
            anchors.top: tf_time.bottom
            anchors.topMargin: 5
            anchors.right: combo_tipizmer.right
            width: 200
            model: model_rezhim
            textRole: 'Rezhimname'
            delegate: ItemDelegate {
                //Material.foreground: Material.LightBlue
                width: combo_rezhim.width
                text: combo_rezhim.textRole ? (Array.isArray(combo_rezhim.model) ? modelData[combo_rezhim.textRole] : model[combo_rezhim.textRole]) : modelData
                highlighted: combo_rezhim.highlightedIndex === index

            }

            onCurrentTextChanged: {
                if(currentIndex==-1){
                    combo_rezhim.id = ""
                    tf_norm_ed.clear()
                    tf_norm_meh.clear()
                } else {
                combo_rezhim.id = model_rezhim.getId(currentIndex)
                }
                qmlNormCreatBI()
                if(combo_rezhim.id==1){
                    mapper_norm_creatBI.addMapping(tf_norm_ed, (0x0100+2), "text")
                    mapper_norm_creatBI.addMapping(tf_norm_meh, (0x0100+2), "text")
                }
                if(combo_rezhim.id==2){
                    mapper_norm_creatBI.addMapping(tf_norm_ed, (0x0100+3), "text")
                    mapper_norm_creatBI.addMapping(tf_norm_meh, (0x0100+4), "text")
                }
                if(combo_rezhim.id==3){
                    mapper_norm_creatBI.addMapping(tf_norm_ed, (0x0100+5), "text")
                    mapper_norm_creatBI.addMapping(tf_norm_meh, (0x0100+6), "text")
                }
            }

        }
        Button {
            anchors.top: combo_rezhim.top
            anchors.left: combo_rezhim.right
            anchors.leftMargin: 5
            width: height - 10
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
                combo_rezhim.currentIndex = -1
            }
        }
        Text {
            id: text_tipizmer
            anchors.verticalCenter: combo_tipizmer.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Тип измерения:"
        }
        ComboBox {
            id: combo_tipizmer
            property string id: ""
            currentIndex: -1
            anchors.top: combo_rezhim.bottom
            anchors.topMargin: 5
            anchors.left: text_tipizmer.right
            anchors.leftMargin: 5
            width: 200
            model: model_tipizmer
            textRole: 'TipIzmername'
            delegate: ItemDelegate {
                //Material.foreground: Material.LightBlue
                width: combo_tipizmer.width
                text: combo_tipizmer.textRole ? (Array.isArray(combo_tipizmer.model) ? modelData[combo_tipizmer.textRole] : model[combo_tipizmer.textRole]) : modelData
                highlighted: combo_tipizmer.highlightedIndex === index

            }

            onCurrentTextChanged: {
                if(currentIndex==-1){
                    combo_tipizmer.id = ""
                } else {
                combo_tipizmer.id = model_tipizmer.getId(currentIndex)
                }
            }

        }
        Button {
            anchors.top: combo_tipizmer.top
            anchors.left: combo_tipizmer.right
            anchors.leftMargin: 5
            width: height - 10
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
                combo_tipizmer.currentIndex = -1
            }
        }
        Text {
            id: text_norm
            anchors.top: combo_tipizmer.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Нормы вибрации:"
        }
        Text {
            id: text_norm_ed
            anchors.verticalCenter: tf_norm_ed.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Эл/дв:"
        }
        TextField {
            id: tf_norm_ed
            anchors.top: text_norm.bottom
            anchors.topMargin: 5
            anchors.left: combo_tipizmer.left
            height: combo_kks.height
            width: 40
            //highlighted: true
            //Material.accent: Material.LightBlue
            //placeholderText: "Введите KKS оборудования"
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            //effectiveHorizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_norm_ed.x = mouseX
                    contextMenu_norm_ed.y = mouseY
                    contextMenu_norm_ed.open()
                }
            }
            Menu {
                id: contextMenu_norm_ed
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_norm_ed.selectedText
                    onTriggered: tf_norm_ed.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_norm_ed.selectedText
                    onTriggered: tf_norm_ed.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_norm_ed.canPaste
                    onTriggered: tf_norm_ed.paste()
                }
            }
        }
        Text {
            id: text_norm_meh
            anchors.verticalCenter: tf_norm_meh.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 15
            text: "Механизм:"
        }
        TextField {
            id: tf_norm_meh
            anchors.top: tf_norm_ed.bottom
            anchors.topMargin: 5
            anchors.left: combo_tipizmer.left
            height: combo_kks.height
            width: 40
            //highlighted: true
            //Material.accent: Material.LightBlue
            //placeholderText: "Введите KKS оборудования"
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            //effectiveHorizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_norm_meh.x = mouseX
                    contextMenu_norm_meh.y = mouseY
                    contextMenu_norm_meh.open()
                }
            }
            Menu {
                id: contextMenu_norm_meh
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_norm_meh.selectedText
                    onTriggered: tf_norm_meh.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_norm_meh.selectedText
                    onTriggered: tf_norm_meh.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_norm_meh.canPaste
                    onTriggered: tf_norm_meh.paste()
                }
            }
        }
}// end rec_1
Rectangle{
    id: rec_2
    anchors.top: rec_1.bottom
    anchors.left: parent.left
    width: rec_1.width/2
    height: (page.height - rec_1.height - rec_button.height)/2
    Text {
        id: text_laes
        text: "Выполнили ЛАЭС-2:"
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.pixelSize: 15
    }
    Flickable {
        id: flick
        anchors.top: text_laes.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    ListView {
             id: listlaes
             anchors.fill: parent
             property var array: []
             //focus: true
             //headerPositioning: ListView.OverlayHeader
             clip: true
             model: model_laes
             //spacing: 1
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
             delegate: Row{
                 anchors.topMargin: 0
                 height: 35
                 CheckBox{
                     id: check_fio
                     Material.accent: Material.LightBlue
                     onCheckedChanged: {
                         if(check_fio.checked==true){
                             listlaes.array.push(text_fio.text)
                             textArea_laes.text = listlaes.array.join(', ')
                         } else {
                             listlaes.array.splice(listlaes.array.indexOf(text_fio.text), 1)
                             textArea_laes.text = listlaes.array.join(', ')
                         }
                     }
                 }
                 Text{
                     id: text_fio
                     anchors.verticalCenter: check_fio.verticalCenter
                     text: laes
                 }
             }
         }
    }
}// end rec_2
Rectangle{
    id: rec_3
    anchors.top: rec_1.bottom
    anchors.left: rec_2.right
    width: rec_1.width/2
    height: (page.height - rec_1.height - rec_button.height)/2
    Text {
        id: text_ate
        text: "Выполнили АТЭ:"
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.pixelSize: 15
    }
    Flickable {
        id: flick2
        anchors.top: text_ate.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    ListView {
             id: listate
             anchors.fill: parent
             property var array: []
             //focus: true
             //headerPositioning: ListView.OverlayHeader
             clip: true
             model: model_ate
             //spacing: 1
             ScrollBar.vertical: ScrollBar { id: vbar2;
                                         hoverEnabled: true
                                         active: hovered || pressed
                                         orientation: Qt.Vertical
                                         //size: frame.height / content.height
                                         anchors.top: parent.top
                                         anchors.right: parent.right
                                         anchors.bottom: parent.bottom
                                         width: 10
                             }
             delegate: Row{
                 anchors.topMargin: 0
                 height: 35
                 CheckBox{
                     id: check_fio2
                     Material.accent: Material.LightBlue
                     onCheckedChanged: {
                         if(check_fio2.checked==true){
                             listate.array.push(text_fio2.text)
                             textArea_ate.text = listate.array.join(', ')
                         } else {
                             listate.array.splice(listate.array.indexOf(text_fio2.text), 1)
                             textArea_ate.text = listate.array.join(', ')
                         }
                     }
                 }
                 Text{
                     id: text_fio2
                     anchors.verticalCenter: check_fio2.verticalCenter
                     text: ate
                 }
             }
         }
    }
}// end rec_3
Rectangle {
    id: rec_4
    anchors.top: rec_2.bottom
    //anchors.topMargin: 5
    anchors.left: parent.left
    width: rec_1.width/2
    height: (page.height - rec_1.height - rec_button.height)/2
    Flickable {
        id: flickable_laes
        flickableDirection: Flickable.VerticalFlick
        anchors.fill: parent

        TextArea.flickable: TextArea {
            id: textArea_laes
            //placeholderText: "Перечислите документы"
            //Material.accent: Material.LightBlue
            textFormat: Qt.PlainText//RichText
            wrapMode: TextArea.Wrap
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
                    enabled: textArea_laes.selectedText
                    onTriggered: textArea_laes.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: textArea_laes.selectedText
                    onTriggered: textArea_laes.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: textArea_laes.canPaste
                    onTriggered: textArea_laes.paste()
                }

               // MenuSeparator {}

            }
            focus: true
            selectByMouse: true
            persistentSelection: true
//                // Different styles have different padding and background
//                // decorations, but since this editor is almost taking up the
//                // entire window, we don't need them.
//                leftPadding: 6
//                rightPadding: 6
//                topPadding: 0
//                bottomPadding: 0
//                background: null
        }
        ScrollBar.vertical: ScrollBar {
        width: 10
        }
    }
}// end rec_4
Rectangle {
    id: rec_5
    anchors.top: rec_3.bottom
    //anchors.topMargin: 5
    anchors.left: rec_4.right
    width: rec_1.width/2
    height: (page.height - rec_1.height - rec_button.height)/2
    Flickable {
        id: flickable_ate
        flickableDirection: Flickable.VerticalFlick
        anchors.fill: parent

        TextArea.flickable: TextArea {
            id: textArea_ate
            //placeholderText: "Перечислите документы"
            //Material.accent: Material.LightBlue
            textFormat: Qt.PlainText//RichText
            wrapMode: TextArea.Wrap
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
                    enabled: textArea_ate.selectedText
                    onTriggered: textArea_ate.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: textArea_ate.selectedText
                    onTriggered: textArea_ate.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: textArea_ate.canPaste
                    onTriggered: textArea_ate.paste()
                }

               // MenuSeparator {}

            }
            focus: true
            selectByMouse: true
            persistentSelection: true
//                // Different styles have different padding and background
//                // decorations, but since this editor is almost taking up the
//                // entire window, we don't need them.
//                leftPadding: 6
//                rightPadding: 6
//                topPadding: 0
//                bottomPadding: 0
//                background: null
        }
        ScrollBar.vertical: ScrollBar {
        width: 10
        }
    }
}// end rec_5
Rectangle {
    id: rec_6
    anchors.top: parent.top
    anchors.left: rec_1.right
    anchors.right: parent.right
    height: page.height/2
}// end rec_6
    } // end page
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            Item {
                id: win
                anchors.centerIn: parent
                visible: false
                width: 280
                height: 280
                //title: qsTr("TimePicker")
                property string rec_color: "transparent"
                property string rec2_color: "transparent"
                property string rec_bordercolor: "transparent"
                property string rec2_bordercolor: "transparent"
            //    Button {
            //        id: but0
            //        anchors.centerIn: parent
            //        text: "Введите время"
            //        onClicked: {
            //            hour00_12.choiceActive = true
            //            hour12_24.choiceActive = true
            //            but0.visible = false
            //            row.visible = true
            //        }
            //    }

                RowLayout {
                    id: rowt
                    anchors.centerIn: parent
                    //visible: false
                    Text {
                        id: t1
                        font.pixelSize: 30
                        font.bold: true
                        color: "#3E65FF"
                        text: "00"
                    }
                    Text {
                        //id: t2
                        font.pixelSize: 30
                        font.bold: true
                        color: "#3E65FF"
                        text: ":"
                    }
                    Text {
                        id: t2
                        font.pixelSize: 30
                        font.bold: true
                        color: "#3E65FF"
                        text: "00"
                    }
                }

                PathView {
                    id: hour00_12
                    property bool choiceActive: true
                    interactive: false
                    visible: hour00_12.choiceActive
                    highlightRangeMode:  PathView.NoHighlightRange
                    //currentIndex: -1

                    model: 12
                    highlight: Rectangle {
                        id: rect
                        width: 30 * 1.5
                        height: width
                        radius: width / 2
                        border.color: win.rec_bordercolor
                        color: win.rec_color
                        visible: hour00_12.choiceActive
                    }
                    delegate: Item {
                        id: deleg
                        width: 30
                        height: 30
                        property bool currentItem: PathView.view.currentIndex == index
                        property alias text : text_hour_00_12.text

                        Text {
                            id: text_hour_00_12
                            anchors.centerIn: parent
                            font.pixelSize: 24
                            font.bold: currentItem
                            text: index
                            color: "#3E65FF"
                        }
                        MouseArea {
                            anchors.fill: parent
                            enabled: hour00_12.choiceActive
                            hoverEnabled: true
                            onEntered: {
                                hour00_12.currentIndex = index
                                text_hour_00_12.font.pixelSize = 28
                                win.rec_color = "#03a9f5"
                                win.rec2_color = "transparent"
                                win.rec_bordercolor = "darkgray"
                                win.rec2_bordercolor = "transparent"
                                if(hour00_12.currentIndex>9){
                                t1.text = hour00_12.currentIndex
                                } else {t1.text = "0" + hour00_12.currentIndex}
                            }
                            onExited: {
                                text_hour_00_12.font.pixelSize = 24

                            }
                            onClicked: {
                                hour00_12.choiceActive = false
                                hour12_24.choiceActive = false
                                minute.choiceActive = true
                            }
                        }
                    }
                    path: Path {
                        startX: 140
                        startY: 30
                        PathArc {
                            x: 140; y: 250
                            radiusX: 110; radiusY: 110
                            useLargeArc: false
                        }
                        PathArc {
                            x: 140; y: 30
                            radiusX: 110; radiusY: 110
                            useLargeArc: false
                        }
                    }
                }
                PathView {
                    id: hour12_24
                    property bool choiceActive: true
                    interactive: false
                    visible: hour12_24.choiceActive
                    highlightRangeMode:  PathView.NoHighlightRange
                    model: 12
                    highlight: Rectangle {
                        id: rect2
                        width: 30 * 1.5
                        height: width
                        radius: width / 2
                        border.color: win.rec2_bordercolor
                        color: win.rec2_color
                        visible: hour12_24.choiceActive
                    }
                    delegate: Item {
                        id: deleg2
                        width: 30
                        height: 30
                        property bool currentItem: PathView.view.currentIndex == index
                        Text {
                            id: text_hour_12_24
                            anchors.centerIn: parent
                            font.pixelSize: 12
                            font.bold: currentItem
                            text: index+12
                            color: "#3E65FF"
                        }
                        MouseArea {
                            anchors.fill: parent
                            enabled: hour12_24.choiceActive
                            hoverEnabled: true
                            onEntered: {
                                hour12_24.currentIndex = index
                                text_hour_12_24.font.pixelSize = 28
                                win.rec2_color = "#03a9f5"
                                win.rec_color = "transparent"
                                win.rec2_bordercolor = "darkgray"
                                win.rec_bordercolor = "transparent"
                                t1.text = hour12_24.currentIndex + 12
                            }
                            onExited: {
                                text_hour_12_24.font.pixelSize = 12
                            }
                            onClicked: {
                                hour00_12.choiceActive = false
                                hour12_24.choiceActive = false
                                minute.choiceActive = true
                            }
                        }
                    }
                    path: Path {
                        startX: 140
                        startY: 70
                        PathArc {
                            x: 140; y: 210
                            radiusX: 70; radiusY: 70
                            useLargeArc: false
                        }
                        PathArc {
                            x: 140; y: 70
                            radiusX: 70; radiusY: 70
                            useLargeArc: false
                        }
                    }
                }
                PathView {
                    id: minute
                    property bool choiceActive: false
                    interactive: false
                    visible: minute.choiceActive
                    highlightRangeMode:  PathView.NoHighlightRange
                    model: 12
                    highlight: Rectangle {
                        id: rect3
                        width: 30 * 1.5
                        height: width
                        radius: width / 2
                        border.color: "darkgray"
                        color: "#03a9f5"
                        visible: minute.choiceActive
                    }
                    delegate: Item {
                        id: deleg3
                        width: 30
                        height: 30
                        property bool currentItem: PathView.view.currentIndex == index
                        Text {
                            id: text_minute
                            anchors.centerIn: parent
                            font.pixelSize: 24
                            font.bold: currentItem
                            text: index*5
                            color: "#3E65FF"
                        }
                        MouseArea {
                            anchors.fill: parent
                            enabled: minute.choiceActive
                            hoverEnabled: true
                            onEntered: {
                                minute.currentIndex = index
                                text_minute.font.pixelSize = 28
            //                    win.rec2_color = "lightblue"
            //                    win.rec_color = "transparent"
            //                    win.rec2_bordercolor = "darkgray"
            //                    win.rec_bordercolor = "transparent"
                                if(minute.currentIndex*5<10){
                                t2.text = "0" + minute.currentIndex*5
                                } else {t2.text = minute.currentIndex*5}
                            }
                            onExited: {
                                text_minute.font.pixelSize = 24
                            }
                            onClicked: {
                                tf_time.text = t1.text + t2.text
                                minute.choiceActive = false
                                hour00_12.choiceActive = true
                                hour12_24.choiceActive = true
                                hour00_12.currentIndex = 0
                                hour12_24.currentIndex = 0
                                win.visible = false
                                page.visible = true
                                //hour12_24.visible = false
                            }
                        }
                    }
                    path: Path {
                        startX: 140
                        startY: 30
                        PathArc {
                            x: 140; y: 250
                            radiusX: 110; radiusY: 110
                            useLargeArc: false
                        }
                        PathArc {
                            x: 140; y: 30
                            radiusX: 110; radiusY: 110
                            useLargeArc: false
                        }
                    }
                }

            }
            Calendar {
                id: calendar0
                anchors.centerIn: parent
                visible: false

            }




}
