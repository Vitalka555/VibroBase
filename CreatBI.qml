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
                        tf_norm_ed.text = tf_norm_ed.text.replace(",",".")
                        tf_norm_meh.text = tf_norm_meh.text.replace(",",".")
                        tf_11.text = tf_11.text.replace(",",".")
                        tf_21.text = tf_21.text.replace(",",".")
                        tf_31.text = tf_31.text.replace(",",".")
                        tf_12.text = tf_12.text.replace(",",".")
                        tf_22.text = tf_22.text.replace(",",".")
                        tf_32.text = tf_32.text.replace(",",".")
                        tf_13.text = tf_13.text.replace(",",".")
                        tf_23.text = tf_23.text.replace(",",".")
                        tf_33.text = tf_33.text.replace(",",".")
                        tf_14.text = tf_14.text.replace(",",".")
                        tf_24.text = tf_24.text.replace(",",".")
                        tf_34.text = tf_34.text.replace(",",".")
                        tf_15.text = tf_15.text.replace(",",".")
                        tf_25.text = tf_25.text.replace(",",".")
                        tf_35.text = tf_35.text.replace(",",".")
                        tf_16.text = tf_16.text.replace(",",".")
                        tf_26.text = tf_26.text.replace(",",".")
                        tf_36.text = tf_36.text.replace(",",".")
                        tf_17.text = tf_17.text.replace(",",".")
                        tf_27.text = tf_27.text.replace(",",".")
                        tf_37.text = tf_37.text.replace(",",".")
                        tf_18.text = tf_18.text.replace(",",".")
                        tf_28.text = tf_28.text.replace(",",".")
                        tf_38.text = tf_38.text.replace(",",".")
                        tf_41.text = tf_41.text.replace(",",".")
                        tf_42.text = tf_42.text.replace(",",".")
                        tf_43.text = tf_43.text.replace(",",".")
                        tf_44.text = tf_44.text.replace(",",".")
                        tf_45.text = tf_45.text.replace(",",".")
                        tf_46.text = tf_46.text.replace(",",".")
                        tf_47.text = tf_47.text.replace(",",".")
                        tf_48.text = tf_48.text.replace(",",".")

                        database.insertIntoBazaIzmereni(combo_kks.id, tf_date.tex, tf_time.text, combo_rezhim.id, combo_tipizmer.id, tf_norm_ed.text,
                                                        tf_norm_meh.text, textArea_laes.text, textArea_ate.text, tf_11.text, tf_21.text, tf_31.text,
                                                        tf_12.text, tf_22.text, tf_32.text, tf_13.text, tf_23.text, tf_33.text, tf_14.text, tf_24.text,
                                                        tf_34.text, tf_15.text, tf_25.text, tf_35.text, tf_16.text, tf_26.text, tf_36.text, tf_17.text,
                                                        tf_27.text, tf_37.text, tf_18.text, tf_28.text, tf_38.text, tf_41.text, tf_42.text, tf_43.text,
                                                        tf_44.text, tf_45.text, tf_46.text, tf_47.text, tf_48.text, tf_rashod.text, tf_davl.text, textArea_prim.text)
//                        console.log(combo_kks.id)
//                        console.log(tf_date.tex)
//                        console.log(tf_time.text)
                        model_izmer.updateModel()
                        stackView.replace(bi)
                        tool_left.visible = true
                        tool_left1.visible = false
                        tool_left2.visible = false
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
                    tf_norm_ed.text = tf_norm_ed.text.replace(".",",")
                    tf_norm_meh.text = tf_norm_meh.text.replace(".",",")
                }
                if(combo_rezhim.id==2){
                    mapper_norm_creatBI.addMapping(tf_norm_ed, (0x0100+3), "text")
                    mapper_norm_creatBI.addMapping(tf_norm_meh, (0x0100+4), "text")
                    tf_norm_ed.text = tf_norm_ed.text.replace(".",",")
                    tf_norm_meh.text = tf_norm_meh.text.replace(".",",")
                }
                if(combo_rezhim.id==3){
                    mapper_norm_creatBI.addMapping(tf_norm_ed, (0x0100+5), "text")
                    mapper_norm_creatBI.addMapping(tf_norm_meh, (0x0100+6), "text")
                    tf_norm_ed.text = tf_norm_ed.text.replace(".",",")
                    tf_norm_meh.text = tf_norm_meh.text.replace(".",",")
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
    height: rec00.height+rec10.height+rec20.height+rec30.height+rec40.height+tf_rashod.height+45
    Rectangle{
        id: rec00
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
    }
    Rectangle{
        id: rec01
        anchors.top: rec00.top
        anchors.left: rec00.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_01
            anchors.centerIn: parent
            font.pixelSize: 15
            color: "white"
            text: "1"
        }
    }
    Rectangle{
        id: rec02
        anchors.top: rec00.top
        anchors.left: rec01.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_02
            anchors.centerIn: parent
            font.pixelSize: 15
            color: "white"
            text: "2"
        }
    }
    Rectangle{
        id: rec03
        anchors.top: rec00.top
        anchors.left: rec02.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_03
            anchors.centerIn: parent
            font.pixelSize: 15
            color: "white"
            text: "3"
        }
    }
    Rectangle{
        id: rec04
        anchors.top: rec00.top
        anchors.left: rec03.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_04
            anchors.centerIn: parent
            font.pixelSize: 15
            color: "white"
            text: "4"
        }
    }
    Rectangle{
        id: rec05
        anchors.top: rec00.top
        anchors.left: rec04.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_05
            anchors.centerIn: parent
            font.pixelSize: 15
            color: "white"
            text: "5"
        }
    }
    Rectangle{
        id: rec06
        anchors.top: rec00.top
        anchors.left: rec05.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_06
            anchors.centerIn: parent
            font.pixelSize: 15
            color: "white"
            text: "6"
        }
    }
    Rectangle{
        id: rec07
        anchors.top: rec00.top
        anchors.left: rec06.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_07
            anchors.centerIn: parent
            font.pixelSize: 15
            color: "white"
            text: "7"
        }
    }
    Rectangle{
        id: rec08
        anchors.top: rec00.top
        anchors.left: rec07.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_08
            anchors.centerIn: parent
            font.pixelSize: 15
            color: "white"
            text: "8"
        }
    }
    Rectangle{
        id: rec10
        anchors.top: rec00.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_10
            anchors.centerIn: parent
            font.pixelSize: 15
            color: "white"
            text: "В"
        }
    }
    Rectangle{
        id: rec20
        anchors.top: rec10.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_20
            anchors.centerIn: parent
            font.pixelSize: 15
            color: "white"
            text: "П"
        }
    }
    Rectangle{
        id: rec30
        anchors.top: rec20.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_30
            anchors.centerIn: parent
            font.pixelSize: 15
            color: "white"
            text: "О"
        }
    }
    Rectangle{
        id: rec11
        anchors.top: rec10.top
        anchors.left: rec10.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_11
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_11.x = mouseX
                    contextMenu_tf_11.y = mouseY
                    contextMenu_tf_11.open()
                }
            }
            Menu {
                id: contextMenu_tf_11
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_11.selectedText
                    onTriggered: tf_11.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_11.selectedText
                    onTriggered: tf_11.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_11.canPaste
                    onTriggered: tf_11.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec21
        anchors.top: rec20.top
        anchors.left: rec20.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_21
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_21.x = mouseX
                    contextMenu_tf_21.y = mouseY
                    contextMenu_tf_21.open()
                }
            }
            Menu {
                id: contextMenu_tf_21
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_21.selectedText
                    onTriggered: tf_21.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_21.selectedText
                    onTriggered: tf_21.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_21.canPaste
                    onTriggered: tf_21.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec31
        anchors.top: rec30.top
        anchors.left: rec30.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_31
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_31.x = mouseX
                    contextMenu_tf_31.y = mouseY
                    contextMenu_tf_31.open()
                }
            }
            Menu {
                id: contextMenu_tf_31
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_31.selectedText
                    onTriggered: tf_31.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_31.selectedText
                    onTriggered: tf_31.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_31.canPaste
                    onTriggered: tf_31.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec12
        anchors.top: rec10.top
        anchors.left: rec11.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_12
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_12.x = mouseX
                    contextMenu_tf_12.y = mouseY
                    contextMenu_tf_12.open()
                }
            }
            Menu {
                id: contextMenu_tf_12
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_12.selectedText
                    onTriggered: tf_12.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_12.selectedText
                    onTriggered: tf_12.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_12.canPaste
                    onTriggered: tf_12.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec22
        anchors.top: rec20.top
        anchors.left: rec21.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_22
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_22.x = mouseX
                    contextMenu_tf_22.y = mouseY
                    contextMenu_tf_22.open()
                }
            }
            Menu {
                id: contextMenu_tf_22
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_22.selectedText
                    onTriggered: tf_22.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_22.selectedText
                    onTriggered: tf_22.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_22.canPaste
                    onTriggered: tf_22.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec32
        anchors.top: rec30.top
        anchors.left: rec31.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_32
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_32.x = mouseX
                    contextMenu_tf_32.y = mouseY
                    contextMenu_tf_32.open()
                }
            }
            Menu {
                id: contextMenu_tf_32
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_32.selectedText
                    onTriggered: tf_32.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_32.selectedText
                    onTriggered: tf_32.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_32.canPaste
                    onTriggered: tf_32.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec13
        anchors.top: rec10.top
        anchors.left: rec12.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_13
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_13.x = mouseX
                    contextMenu_tf_13.y = mouseY
                    contextMenu_tf_13.open()
                }
            }
            Menu {
                id: contextMenu_tf_13
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_13.selectedText
                    onTriggered: tf_13.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_13.selectedText
                    onTriggered: tf_13.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_13.canPaste
                    onTriggered: tf_13.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec23
        anchors.top: rec20.top
        anchors.left: rec22.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_23
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_23.x = mouseX
                    contextMenu_tf_23.y = mouseY
                    contextMenu_tf_23.open()
                }
            }
            Menu {
                id: contextMenu_tf_23
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_23.selectedText
                    onTriggered: tf_23.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_23.selectedText
                    onTriggered: tf_23.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_23.canPaste
                    onTriggered: tf_23.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec33
        anchors.top: rec30.top
        anchors.left: rec32.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_33
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_33.x = mouseX
                    contextMenu_tf_33.y = mouseY
                    contextMenu_tf_33.open()
                }
            }
            Menu {
                id: contextMenu_tf_33
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_33.selectedText
                    onTriggered: tf_33.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_33.selectedText
                    onTriggered: tf_33.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_33.canPaste
                    onTriggered: tf_33.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec14
        anchors.top: rec10.top
        anchors.left: rec13.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_14
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_14.x = mouseX
                    contextMenu_tf_14.y = mouseY
                    contextMenu_tf_14.open()
                }
            }
            Menu {
                id: contextMenu_tf_14
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_14.selectedText
                    onTriggered: tf_14.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_14.selectedText
                    onTriggered: tf_14.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_14.canPaste
                    onTriggered: tf_14.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec24
        anchors.top: rec20.top
        anchors.left: rec23.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_24
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_24.x = mouseX
                    contextMenu_tf_24.y = mouseY
                    contextMenu_tf_24.open()
                }
            }
            Menu {
                id: contextMenu_tf_24
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_24.selectedText
                    onTriggered: tf_24.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_24.selectedText
                    onTriggered: tf_24.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_24.canPaste
                    onTriggered: tf_24.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec34
        anchors.top: rec30.top
        anchors.left: rec33.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_34
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_34.x = mouseX
                    contextMenu_tf_34.y = mouseY
                    contextMenu_tf_34.open()
                }
            }
            Menu {
                id: contextMenu_tf_34
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_34.selectedText
                    onTriggered: tf_34.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_34.selectedText
                    onTriggered: tf_34.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_34.canPaste
                    onTriggered: tf_34.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec15
        anchors.top: rec10.top
        anchors.left: rec14.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_15
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_15.x = mouseX
                    contextMenu_tf_15.y = mouseY
                    contextMenu_tf_15.open()
                }
            }
            Menu {
                id: contextMenu_tf_15
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_15.selectedText
                    onTriggered: tf_15.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_15.selectedText
                    onTriggered: tf_15.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_15.canPaste
                    onTriggered: tf_15.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec25
        anchors.top: rec20.top
        anchors.left: rec24.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_25
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_25.x = mouseX
                    contextMenu_tf_25.y = mouseY
                    contextMenu_tf_25.open()
                }
            }
            Menu {
                id: contextMenu_tf_25
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_25.selectedText
                    onTriggered: tf_25.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_25.selectedText
                    onTriggered: tf_25.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_25.canPaste
                    onTriggered: tf_25.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec35
        anchors.top: rec30.top
        anchors.left: rec34.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_35
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_35.x = mouseX
                    contextMenu_tf_35.y = mouseY
                    contextMenu_tf_35.open()
                }
            }
            Menu {
                id: contextMenu_tf_35
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_35.selectedText
                    onTriggered: tf_35.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_35.selectedText
                    onTriggered: tf_35.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_35.canPaste
                    onTriggered: tf_35.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec16
        anchors.top: rec10.top
        anchors.left: rec15.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_16
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_16.x = mouseX
                    contextMenu_tf_16.y = mouseY
                    contextMenu_tf_16.open()
                }
            }
            Menu {
                id: contextMenu_tf_16
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_16.selectedText
                    onTriggered: tf_16.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_16.selectedText
                    onTriggered: tf_16.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_16.canPaste
                    onTriggered: tf_16.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec26
        anchors.top: rec20.top
        anchors.left: rec25.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_26
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_26.x = mouseX
                    contextMenu_tf_26.y = mouseY
                    contextMenu_tf_26.open()
                }
            }
            Menu {
                id: contextMenu_tf_26
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_26.selectedText
                    onTriggered: tf_26.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_26.selectedText
                    onTriggered: tf_26.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_26.canPaste
                    onTriggered: tf_26.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec36
        anchors.top: rec30.top
        anchors.left: rec35.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_36
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_36.x = mouseX
                    contextMenu_tf_36.y = mouseY
                    contextMenu_tf_36.open()
                }
            }
            Menu {
                id: contextMenu_tf_36
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_36.selectedText
                    onTriggered: tf_36.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_36.selectedText
                    onTriggered: tf_36.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_36.canPaste
                    onTriggered: tf_36.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec17
        anchors.top: rec10.top
        anchors.left: rec16.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_17
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_17.x = mouseX
                    contextMenu_tf_17.y = mouseY
                    contextMenu_tf_17.open()
                }
            }
            Menu {
                id: contextMenu_tf_17
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_17.selectedText
                    onTriggered: tf_17.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_17.selectedText
                    onTriggered: tf_17.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_17.canPaste
                    onTriggered: tf_17.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec27
        anchors.top: rec20.top
        anchors.left: rec26.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_27
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_27.x = mouseX
                    contextMenu_tf_27.y = mouseY
                    contextMenu_tf_27.open()
                }
            }
            Menu {
                id: contextMenu_tf_27
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_27.selectedText
                    onTriggered: tf_27.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_27.selectedText
                    onTriggered: tf_27.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_27.canPaste
                    onTriggered: tf_27.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec37
        anchors.top: rec30.top
        anchors.left: rec36.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_37
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_37.x = mouseX
                    contextMenu_tf_37.y = mouseY
                    contextMenu_tf_37.open()
                }
            }
            Menu {
                id: contextMenu_tf_37
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_37.selectedText
                    onTriggered: tf_37.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_37.selectedText
                    onTriggered: tf_37.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_37.canPaste
                    onTriggered: tf_37.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec18
        anchors.top: rec10.top
        anchors.left: rec17.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_18
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_18.x = mouseX
                    contextMenu_tf_18.y = mouseY
                    contextMenu_tf_18.open()
                }
            }
            Menu {
                id: contextMenu_tf_18
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_18.selectedText
                    onTriggered: tf_18.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_18.selectedText
                    onTriggered: tf_18.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_18.canPaste
                    onTriggered: tf_18.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec28
        anchors.top: rec20.top
        anchors.left: rec27.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_28
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_28.x = mouseX
                    contextMenu_tf_28.y = mouseY
                    contextMenu_tf_28.open()
                }
            }
            Menu {
                id: contextMenu_tf_28
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_28.selectedText
                    onTriggered: tf_28.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_28.selectedText
                    onTriggered: tf_28.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_28.canPaste
                    onTriggered: tf_28.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec38
        anchors.top: rec30.top
        anchors.left: rec37.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_38
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_38.x = mouseX
                    contextMenu_tf_38.y = mouseY
                    contextMenu_tf_38.open()
                }
            }
            Menu {
                id: contextMenu_tf_38
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_38.selectedText
                    onTriggered: tf_38.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_38.selectedText
                    onTriggered: tf_38.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_38.canPaste
                    onTriggered: tf_38.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec40
        anchors.top: rec30.bottom
        anchors.topMargin: 15
        anchors.left: parent.left
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_40
            anchors.centerIn: parent
            font.pixelSize: 15
            color: "white"
            text: "Т"
        }
    }
    Rectangle{
        id: rec41
        anchors.top: rec40.top
        anchors.left: rec40.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_41
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_41.x = mouseX
                    contextMenu_tf_41.y = mouseY
                    contextMenu_tf_41.open()
                }
            }
            Menu {
                id: contextMenu_tf_41
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_41.selectedText
                    onTriggered: tf_41.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_41.selectedText
                    onTriggered: tf_41.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_41.canPaste
                    onTriggered: tf_41.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec42
        anchors.top: rec40.top
        anchors.left: rec41.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_42
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_42.x = mouseX
                    contextMenu_tf_42.y = mouseY
                    contextMenu_tf_42.open()
                }
            }
            Menu {
                id: contextMenu_tf_42
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_42.selectedText
                    onTriggered: tf_42.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_42.selectedText
                    onTriggered: tf_42.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_42.canPaste
                    onTriggered: tf_42.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec43
        anchors.top: rec40.top
        anchors.left: rec42.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_43
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_43.x = mouseX
                    contextMenu_tf_43.y = mouseY
                    contextMenu_tf_43.open()
                }
            }
            Menu {
                id: contextMenu_tf_43
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_43.selectedText
                    onTriggered: tf_43.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_43.selectedText
                    onTriggered: tf_43.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_43.canPaste
                    onTriggered: tf_43.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec44
        anchors.top: rec40.top
        anchors.left: rec43.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_44
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_44.x = mouseX
                    contextMenu_tf_44.y = mouseY
                    contextMenu_tf_44.open()
                }
            }
            Menu {
                id: contextMenu_tf_44
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_44.selectedText
                    onTriggered: tf_44.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_44.selectedText
                    onTriggered: tf_44.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_44.canPaste
                    onTriggered: tf_44.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec45
        anchors.top: rec40.top
        anchors.left: rec44.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_45
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_45.x = mouseX
                    contextMenu_tf_45.y = mouseY
                    contextMenu_tf_45.open()
                }
            }
            Menu {
                id: contextMenu_tf_45
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_45.selectedText
                    onTriggered: tf_45.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_45.selectedText
                    onTriggered: tf_45.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_45.canPaste
                    onTriggered: tf_45.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec46
        anchors.top: rec40.top
        anchors.left: rec45.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_46
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_46.x = mouseX
                    contextMenu_tf_46.y = mouseY
                    contextMenu_tf_46.open()
                }
            }
            Menu {
                id: contextMenu_tf_46
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_46.selectedText
                    onTriggered: tf_46.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_46.selectedText
                    onTriggered: tf_46.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_46.canPaste
                    onTriggered: tf_46.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec47
        anchors.top: rec40.top
        anchors.left: rec46.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_47
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_47.x = mouseX
                    contextMenu_tf_47.y = mouseY
                    contextMenu_tf_47.open()
                }
            }
            Menu {
                id: contextMenu_tf_47
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_47.selectedText
                    onTriggered: tf_47.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_47.selectedText
                    onTriggered: tf_47.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_47.canPaste
                    onTriggered: tf_47.paste()
                }
            }
        }
    }
    Rectangle{
        id: rec48
        anchors.top: rec40.top
        anchors.left: rec47.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: combo_kks.height
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        TextField {
            id: tf_48
            anchors.centerIn: parent
            width: parent.width/2
            focus: true
            selectByMouse: true
            persistentSelection: true
            horizontalAlignment: TextInput.AlignHCenter
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_tf_48.x = mouseX
                    contextMenu_tf_48.y = mouseY
                    contextMenu_tf_48.open()
                }
            }
            Menu {
                id: contextMenu_tf_48
                MenuItem {
                    text: qsTr("Копировать")
                    enabled: tf_48.selectedText
                    onTriggered: tf_48.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: tf_48.selectedText
                    onTriggered: tf_48.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: tf_48.canPaste
                    onTriggered: tf_48.paste()
                }
            }
        }
    }
    Text {
        id: text_rashod
        anchors.verticalCenter: tf_rashod.verticalCenter
        anchors.left: rec_6.left
        anchors.leftMargin: 5
        font.pixelSize: 15
        text: "Расход:"
    }
    TextField {
        id: tf_rashod
        anchors.top: rec40.bottom
        anchors.topMargin: 5
        anchors.left: text_rashod.right
        height: combo_kks.height
        width: 100
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
                contextMenu_rashod.x = mouseX
                contextMenu_rashod.y = mouseY
                contextMenu_rashod.open()
            }
        }
        Menu {
            id: contextMenu_rashod
            MenuItem {
                text: qsTr("Копировать")
                enabled: tf_rashod.selectedText
                onTriggered: tf_rashod.copy()
            }
            MenuItem {
                text: qsTr("Вырезать")
                enabled: tf_rashod.selectedText
                onTriggered: tf_rashod.cut()
            }
            MenuItem {
                text: qsTr("Вставить")
                enabled: tf_rashod.canPaste
                onTriggered: tf_rashod.paste()
            }
        }
    }
    Text {
        id: text_davl
        anchors.verticalCenter: tf_rashod.verticalCenter
        anchors.right: tf_davl.left
        anchors.rightMargin: 5
        font.pixelSize: 15
        text: "Давление:"
    }
    TextField {
        id: tf_davl
        anchors.top: rec40.bottom
        anchors.topMargin: 5
        anchors.right: rec_6.right
        anchors.rightMargin: 5
        height: combo_kks.height
        width: 100
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
                contextMenu_davl.x = mouseX
                contextMenu_davl.y = mouseY
                contextMenu_davl.open()
            }
        }
        Menu {
            id: contextMenu_davl
            MenuItem {
                text: qsTr("Копировать")
                enabled: tf_davl.selectedText
                onTriggered: tf_davl.copy()
            }
            MenuItem {
                text: qsTr("Вырезать")
                enabled: tf_davl.selectedText
                onTriggered: tf_davl.cut()
            }
            MenuItem {
                text: qsTr("Вставить")
                enabled: tf_davl.canPaste
                onTriggered: tf_davl.paste()
            }
        }
    }

}// end rec_6
Rectangle {
    id: rec_7
    anchors.top: rec_6.bottom
    anchors.left: rec_1.right
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    Flickable {
        id: flickable_prim
        flickableDirection: Flickable.VerticalFlick
        anchors.fill: parent

        TextArea.flickable: TextArea {
            id: textArea_prim
            placeholderText: "Введите примечания"
            //Material.accent: Material.LightBlue
            textFormat: Qt.PlainText//RichText
            wrapMode: TextArea.Wrap
            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    contextMenu_prim.x = mouseX
                    contextMenu_prim.y = mouseY
                    contextMenu_prim.open()
                }
            }
            Menu {
                id: contextMenu_prim

                MenuItem {
                    text: qsTr("Копировать")
                    enabled: textArea_prim.selectedText
                    onTriggered: textArea_prim.copy()
                }
                MenuItem {
                    text: qsTr("Вырезать")
                    enabled: textArea_prim.selectedText
                    onTriggered: textArea_prim.cut()
                }
                MenuItem {
                    text: qsTr("Вставить")
                    enabled: textArea_prim.canPaste
                    onTriggered: textArea_prim.paste()
                }

               // MenuSeparator {}

            }
            focus: true
            selectByMouse: true
            persistentSelection: true
        }
        ScrollBar.vertical: ScrollBar {
        width: 10
        }
    }
}
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
