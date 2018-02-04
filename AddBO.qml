import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import QtQuick.Dialogs 1.2

Item {
    id: item
//    TextField {
//        id: tf_kks
//        anchors.top: parent.top
//        anchors.left: parent.left
//        text: ""
//    }
//    Button {
//        id: but_save
//        anchors.top: tf_kks.bottom
//        anchors.topMargin: 5
//        anchors.left: parent.left
//        height: 100
//        width: 100
//        text: "Save"
//        onClicked: {
//            database.editTableBaza(stackView.baza_id, tf_kks.text)
//            model0.updateModel()
//        }
//    }
    Page {
        id: creat
        anchors.fill: parent
        SwipeView {
            id: swipeView
            //anchors.fill: parent
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: tabBar.top
            currentIndex: tabBar.currentIndex
            Item {
                id: item1
                //property real image_h: image_shema.height
                Rectangle {
                    id: rec_column_1
                    anchors.top: parent.top
                    anchors.topMargin: 2
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom//rec_button.top
                    width: window.width/3
                    border.color: "lightblue"
                    //color: "yellow"


            Text {
                id: text_kks
                anchors.verticalCenter: tf_kks.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 5
                font.pixelSize: 15
                text: "KKS:"
            }
            TextField {
                id: tf_kks
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.left: text_pom.right
                anchors.leftMargin: 5
                //highlighted: true
                //Material.accent: Material.LightBlue
                placeholderText: "Введите KKS оборудования"
                focus: true
                selectByMouse: true
                persistentSelection: true
                MouseArea {
                    acceptedButtons: Qt.RightButton
                    anchors.fill: parent
                    onClicked: {
                        contextMenu_kks.x = mouseX
                        contextMenu_kks.y = mouseY
                        contextMenu_kks.open()
                    }
                }
                Menu {
                    id: contextMenu_kks

                    MenuItem {
                        text: qsTr("Копировать")
                        enabled: tf_kks.selectedText
                        onTriggered: tf_kks.copy()
                    }
                    MenuItem {
                        text: qsTr("Вырезать")
                        enabled: tf_kks.selectedText
                        onTriggered: tf_kks.cut()
                    }
                    MenuItem {
                        text: qsTr("Вставить")
                        enabled: tf_kks.canPaste
                        onTriggered: tf_kks.paste()
                    }

                   // MenuSeparator {}

                }
            }
            Text {
                id: text_ceh
                anchors.verticalCenter: combo_ceh.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 5
                font.pixelSize: 15
                text: "Цех:"
            }
            ComboBox {
                id: combo_ceh
                property string id: ""
                property string currentIndex0: "0"
                currentIndex: find(currentIndex0, Qt.MatchExactly)
                anchors.top: tf_kks.bottom
                anchors.topMargin: 5
                anchors.left: tf_kks.left
                //Material.background: Material.LightBlue
                model: model_ceh
                textRole: 'Cehname'
                delegate: ItemDelegate {
                    //Material.foreground: Material.LightBlue
                    width: combo_ceh.width
                    text: combo_ceh.textRole ? (Array.isArray(combo_ceh.model) ? modelData[combo_ceh.textRole] : model[combo_ceh.textRole]) : modelData
                    highlighted: combo_ceh.highlightedIndex === index

                }

                onCurrentTextChanged: {
                    if(currentIndex==-1){
                        combo_ceh.id = ""
                    } else {
                    combo_ceh.id = model_ceh.getId(currentIndex)
                    }
                }
            }
            Button {
                anchors.left: combo_ceh.right
                anchors.leftMargin: 5
                anchors.top: combo_ceh.top
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
                    combo_ceh.currentIndex = -1
                }
            }

            Text {
                id: text_zd
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.verticalCenter: tf_zd.verticalCenter
                font.pixelSize: 15
                text: "Здание:"
            }
            TextField {
                id: tf_zd
                anchors.top: combo_ceh.bottom
                anchors.topMargin: 5
                anchors.left: tf_kks.left
                anchors.right: parent.right
                anchors.rightMargin: 5
                //Material.accent: Material.LightBlue
                placeholderText: "Введите обозначение"
                focus: true
                selectByMouse: true
                persistentSelection: true
                MouseArea {
                    acceptedButtons: Qt.RightButton
                    anchors.fill: parent
                    onClicked: {
                        contextMenu_zd.x = mouseX
                        contextMenu_zd.y = mouseY
                        contextMenu_zd.open()
                    }
                }
                Menu {
                    id: contextMenu_zd

                    MenuItem {
                        text: qsTr("Копировать")
                        enabled: tf_zd.selectedText
                        onTriggered: tf_zd.copy()
                    }
                    MenuItem {
                        text: qsTr("Вырезать")
                        enabled: tf_zd.selectedText
                        onTriggered: tf_zd.cut()
                    }
                    MenuItem {
                        text: qsTr("Вставить")
                        enabled: tf_zd.canPaste
                        onTriggered: tf_zd.paste()
                    }

                   // MenuSeparator {}

                }
            }
            Text {
                id: text_pom
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.verticalCenter: tf_pom.verticalCenter
                font.pixelSize: 15
                text: "Помещение:"
            }
            TextField {
                id: tf_pom
                anchors.top: tf_zd.bottom
                anchors.topMargin: 5
                anchors.left: tf_kks.left
                anchors.right: parent.right
                anchors.rightMargin: 5
                //Material.accent: Material.LightBlue
                placeholderText: "Введите обозначение"
                focus: true
                selectByMouse: true
                persistentSelection: true
                MouseArea {
                    acceptedButtons: Qt.RightButton
                    anchors.fill: parent
                    onClicked: {
                        contextMenu_pom.x = mouseX
                        contextMenu_pom.y = mouseY
                        contextMenu_pom.open()
                    }
                }
                Menu {
                    id: contextMenu_pom

                    MenuItem {
                        text: qsTr("Копировать")
                        enabled: tf_pom.selectedText
                        onTriggered: tf_pom.copy()
                    }
                    MenuItem {
                        text: qsTr("Вырезать")
                        enabled: tf_pom.selectedText
                        onTriggered: tf_pom.cut()
                    }
                    MenuItem {
                        text: qsTr("Вставить")
                        enabled: tf_pom.canPaste
                        onTriggered: tf_pom.paste()
                    }

                   // MenuSeparator {}

                }
            }
            Text {
                id: text_opis
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.top: tf_pom.bottom
                anchors.topMargin: 5
                font.pixelSize: 15
                text: "Наименование оборудования:"
            }
            Rectangle {
                id: tf_opis
                anchors.top: text_opis.bottom
                anchors.topMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.right: parent.right
                anchors.rightMargin: 5
                height: parent.height/8
                Flickable {
                    id: flickable
                    flickableDirection: Flickable.VerticalFlick
                    anchors.fill: parent

                    TextArea.flickable: TextArea {
                        id: textArea
                        placeholderText: "Введите наименование"
                        //Material.accent: Material.LightBlue
                        textFormat: Qt.PlainText//RichText
                        wrapMode: TextArea.Wrap
                        MouseArea {
                            acceptedButtons: Qt.RightButton
                            anchors.fill: parent
                            onClicked: {
                                contextMenu.x = mouseX
                                contextMenu.y = mouseY
                                contextMenu.open()
                            }
                        }
                        Menu {
                            id: contextMenu

                            MenuItem {
                                text: qsTr("Копировать")
                                enabled: textArea.selectedText
                                onTriggered: textArea.copy()
                            }
                            MenuItem {
                                text: qsTr("Вырезать")
                                enabled: textArea.selectedText
                                onTriggered: textArea.cut()
                            }
                            MenuItem {
                                text: qsTr("Вставить")
                                enabled: textArea.canPaste
                                onTriggered: textArea.paste()
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
            }
            Text {
                id: text_prim
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.top: tf_opis.bottom
                anchors.topMargin: 5
                font.pixelSize: 15
                text: "Примечания:"
            }
            Rectangle {
                id: tf_prim
                anchors.top: text_prim.bottom
                anchors.topMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.right: parent.right
                anchors.rightMargin: 5
                height: parent.height/8
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
            }
            Text {
                id: text_program
                anchors.top: tf_prim.bottom
                anchors.topMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 5
                font.pixelSize: 15
                text: "Программа ПНР:"
            }
            ComboBox {
                id: combo_program
                property string id: ""
                property string currentIndex0: "0"
                currentIndex: find(currentIndex0, Qt.MatchExactly)
                anchors.top: text_program.bottom
                anchors.topMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 5
                width: parent.width*3/4
                //Material.accent: Material.LightBlue
                model: model_program
                textRole: 'Programnomer'
                onCurrentTextChanged: {
                    if(currentIndex==-1){
                        combo_program.id = ""
                    } else {
                    combo_program.id = model_program.getId(currentIndex)
                    }
                }
            }
            Button {
                anchors.left: combo_program.right
                anchors.leftMargin: 5
                anchors.top: combo_program.top
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
                    combo_program.currentIndex = -1
                }
            }
            Text {
                id: text_fio
                anchors.top: combo_program.bottom
                anchors.topMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 5
                font.pixelSize: 15
                text: "Заполнил форму:"
            }
            ComboBox {
                id: combo_fio
                property string id: ""
                property string currentIndex0: "0"
                currentIndex: find(currentIndex0, Qt.MatchExactly)
                anchors.top: text_fio.bottom
                anchors.topMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 5
                width: parent.width*3/4
                //Material.accent: Material.LightBlue
                model: model_fio
                textRole: 'Fiofio'
                onCurrentTextChanged: {
                    if(currentIndex==-1){
                        combo_fio.id = ""
                    } else {
                    combo_fio.id = model_fio.getId(currentIndex)
                    }
                }
            }
            Button {
                anchors.left: combo_fio.right
                anchors.leftMargin: 5
                anchors.top: combo_fio.top
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
                    combo_fio.currentIndex = -1
                }
            }

                } //rec_column_1

                Rectangle {
                    id: rec_column_2
                    anchors.top: parent.top
                    anchors.topMargin: 2
                    anchors.left: rec_column_1.right
                    anchors.bottom: parent.bottom//rec_button.top
                    width: window.width/3
                    border.color: "lightblue"
                    //color: "lightpink"
                    Text {
                        id: text_marka_eldv
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        font.pixelSize: 15
                        text: "Марка электродвигателя:"
                    }
                    TextField {
                        id: tf_marka_eldv
                        anchors.top: text_marka_eldv.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        //Material.accent: Material.LightBlue
                        placeholderText: "Введите обозначение"
                        focus: true
                        selectByMouse: true
                        persistentSelection: true
                        MouseArea {
                            acceptedButtons: Qt.RightButton
                            anchors.fill: parent
                            onClicked: {
                                contextMenu_marka_eldv.x = mouseX
                                contextMenu_marka_eldv.y = mouseY
                                contextMenu_marka_eldv.open()
                            }
                        }
                        Menu {
                            id: contextMenu_marka_eldv

                            MenuItem {
                                text: qsTr("Копировать")
                                enabled: tf_marka_eldv.selectedText
                                onTriggered: tf_marka_eldv.copy()
                            }
                            MenuItem {
                                text: qsTr("Вырезать")
                                enabled: tf_marka_eldv.selectedText
                                onTriggered: tf_marka_eldv.cut()
                            }
                            MenuItem {
                                text: qsTr("Вставить")
                                enabled: tf_marka_eldv.canPaste
                                onTriggered: tf_marka_eldv.paste()
                            }

                           // MenuSeparator {}

                        }
                    }
                    Text {
                        id: text_mosch
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.verticalCenter: tf_mosch.verticalCenter
                        font.pixelSize: 15
                        text: "Мощность, кВт:"
                    }
                    TextField {
                        id: tf_mosch
                        anchors.top: tf_marka_eldv.bottom
                        anchors.topMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        //Material.accent: Material.LightBlue
                        placeholderText: "Введите мощность"
                        focus: true
                        selectByMouse: true
                        persistentSelection: true
                        MouseArea {
                            acceptedButtons: Qt.RightButton
                            anchors.fill: parent
                            onClicked: {
                                contextMenu_mosch.x = mouseX
                                contextMenu_mosch.y = mouseY
                                contextMenu_mosch.open()
                            }
                        }
                        Menu {
                            id: contextMenu_mosch

                            MenuItem {
                                text: qsTr("Копировать")
                                enabled: tf_mosch.selectedText
                                onTriggered: tf_mosch.copy()
                            }
                            MenuItem {
                                text: qsTr("Вырезать")
                                enabled: tf_mosch.selectedText
                                onTriggered: tf_mosch.cut()
                            }
                            MenuItem {
                                text: qsTr("Вставить")
                                enabled: tf_mosch.canPaste
                                onTriggered: tf_mosch.paste()
                            }

                           // MenuSeparator {}

                        }
                    }
                    Text {
                        id: text_chastota
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.verticalCenter: tf_chastota.verticalCenter
                        font.pixelSize: 15
                        text: "Частота вращения, об/мин:"
                    }
                    TextField {
                        id: tf_chastota
                        anchors.top: tf_mosch.bottom
                        anchors.topMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        width: tf_mosch.width
                        //Material.accent: Material.LightBlue
                        placeholderText: "Введите частоту"
                        focus: true
                        selectByMouse: true
                        persistentSelection: true
                        MouseArea {
                            acceptedButtons: Qt.RightButton
                            anchors.fill: parent
                            onClicked: {
                                contextMenu_chastota.x = mouseX
                                contextMenu_chastota.y = mouseY
                                contextMenu_chastota.open()
                            }
                        }
                        Menu {
                            id: contextMenu_chastota

                            MenuItem {
                                text: qsTr("Копировать")
                                enabled: tf_chastota.selectedText
                                onTriggered: tf_chastota.copy()
                            }
                            MenuItem {
                                text: qsTr("Вырезать")
                                enabled: tf_chastota.selectedText
                                onTriggered: tf_chastota.cut()
                            }
                            MenuItem {
                                text: qsTr("Вставить")
                                enabled: tf_chastota.canPaste
                                onTriggered: tf_chastota.paste()
                            }

                           // MenuSeparator {}

                        }
                    }
                    Text {
                        id: text_proizv_eldv
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.top: tf_chastota.bottom
                        anchors.topMargin: 5
                        font.pixelSize: 15
                        text: "Производитель электродвигателя:"
                    }
                    ComboBox {
                        id: combo_proizv_eldv
                        property string id: ""
                        property string currentIndex0: "0"
                        currentIndex: find(currentIndex0, Qt.MatchExactly)
                        anchors.top: text_proizv_eldv.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: but_proizv_eldv.left
                        anchors.rightMargin: 5
                        width: parent.width/2
                        //Material.accent: Material.LightBlue
                        model: model_proizved
                        textRole: 'Proizvedname'
                        onCurrentTextChanged: {
                            if(currentIndex==-1){
                                combo_proizv_eldv.id = ""
                            } else {
                            combo_proizv_eldv.id = model_proizved.getId(currentIndex)
                            }
                        }
                    }
                    Button {
                        id: but_proizv_eldv
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        anchors.top: combo_proizv_eldv.top
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
                            combo_proizv_eldv.currentIndex = -1
                        }
                    }
                    Text {
                        id: text_tip_permeh
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.top: combo_proizv_eldv.bottom
                        anchors.topMargin: 5
                        font.pixelSize: 15
                        text: "Передаточный механизма:"
                    }
                    ComboBox {
                        id: combo_tip_permeh
                        property string id: ""
                        property string currentIndex0: "0"
                        currentIndex: find(currentIndex0, Qt.MatchExactly)
                        anchors.top: text_tip_permeh.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        width: parent.width/2
                        //Material.accent: Material.LightBlue
                        model: model_tippermeh
                        textRole: 'Tippermehname'
                        onCurrentTextChanged: {
                            if(currentIndex==-1){
                                combo_tip_permeh.id = ""
                            } else {
                            combo_tip_permeh.id = model_tippermeh.getId(currentIndex)
                            }
                        }
                    }
                    Button {
                        anchors.left: combo_tip_permeh.right
                        anchors.leftMargin: 5
                        anchors.top: combo_tip_permeh.top
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
                            combo_tip_permeh.currentIndex = -1
                        }
                    }
                    Text {
                        id: text_tip_per
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.top: combo_tip_permeh.bottom
                        anchors.topMargin: 5
                        font.pixelSize: 15
                        text: "Тип передачи:"
                    }
                    ComboBox {
                        id: combo_tip_per
                        property string id: ""
                        property string currentIndex0: "0"
                        currentIndex: find(currentIndex0, Qt.MatchExactly)
                        anchors.top: text_tip_per.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        width: parent.width/2
                        //Material.accent: Material.LightBlue
                        model: model_tipper
                        textRole: 'Tippername'
                        onCurrentTextChanged: {
                            if(currentIndex==-1){
                                combo_tip_per.id = ""
                            } else {
                            combo_tip_per.id = model_tipper.getId(currentIndex)
                            }
                        }
                    }
                    Button {
                        anchors.left: combo_tip_per.right
                        anchors.leftMargin: 5
                        anchors.top: combo_tip_per.top
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
                            combo_tip_per.currentIndex = -1
                        }
                    }
                    Text {
                        id: text_kolpal
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.verticalCenter: tf_kolpal.verticalCenter
                        font.pixelSize: 15
                        text: "Количество пальцев муфты:"
                    }
                    TextField {
                        id: tf_kolpal
                        anchors.top: combo_tip_per .bottom
                        anchors.topMargin: 5
                        anchors.left: tf_mosch.left
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        //Material.accent: Material.LightBlue
                        placeholderText: "Введите кол-во"
                        focus: true
                        selectByMouse: true
                        persistentSelection: true
                        MouseArea {
                            acceptedButtons: Qt.RightButton
                            anchors.fill: parent
                            onClicked: {
                                contextMenu_kolpal.x = mouseX
                                contextMenu_kolpal.y = mouseY
                                contextMenu_kolpal.open()
                            }
                        }
                        Menu {
                            id: contextMenu_kolpal

                            MenuItem {
                                text: qsTr("Копировать")
                                enabled: tf_kolpal.selectedText
                                onTriggered: tf_kolpal.copy()
                            }
                            MenuItem {
                                text: qsTr("Вырезать")
                                enabled: tf_kolpal.selectedText
                                onTriggered: tf_kolpal.cut()
                            }
                            MenuItem {
                                text: qsTr("Вставить")
                                enabled: tf_kolpal.canPaste
                                onTriggered: tf_kolpal.paste()
                            }

                           // MenuSeparator {}

                        }
                    }
                    TextField {
                        id: tf_foto
                        objectName: "tf_foto"
                        anchors.top: tf_kolpal.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        placeholderText: "Выберите фото агрегата"
                        readOnly: true
                        width: parent.width - but_foto.width - 15
                        property string tex: ""
                    }
                    Button {
                        id: but_foto
                        anchors.left: tf_foto.right
                        anchors.leftMargin: 5
                        anchors.top: tf_foto.top
                        width: height
                        highlighted: true
                        Material.accent: Material.LightBlue
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "..."
                        }
                        FileDialog {
                                id: fileDialogLoad_foto
                                objectName: "foto"
                                property string path: ""
                                folder: "."
                                title: "Choose a file to open"
                                selectMultiple: false
                                nameFilters: [ "Image files (*.png *.jpg)", "All files (*)" ]
                                onAccepted: { console.log("Accepted: " + fileUrl)
                                    fileDialogLoad_foto.path = fileUrl
                                qmlSignal()
                                    tf_foto.tex = "\\foto\\" + tf_foto.text
                                }
                            }
                        onClicked: {
                            fileDialogLoad_foto.open()
                        }
                    }
                    TextField {
                        id: tf_shema
                        objectName: "tf_shema"
                        anchors.top: tf_foto.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        placeholderText: "Выберите схему агрегата"
                        readOnly: true
                        width: parent.width - but_shema.width - 15
                        property string tex: ""
                    }
                    Button {
                        id: but_shema
                        anchors.left: tf_shema.right
                        anchors.leftMargin: 5
                        anchors.top: tf_shema.top
                        width: height
                        highlighted: true
                        Material.accent: Material.LightBlue
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "..."
                        }
                        FileDialog {
                                id: fileDialogLoad_shema
                                objectName: "shema"
                                property string path: ""
                                folder: "."
                                title: "Choose a file to open"
                                selectMultiple: false
                                nameFilters: [ "Image files (*.png *.jpg)", "All files (*)" ]
                                onAccepted: { console.log("Accepted: " + fileUrl)
                                    fileDialogLoad_shema.path = fileUrl
                                qmlSignal2()
                                    tf_shema.tex = "\\Shema\\" + tf_shema.text
                                }
                            }
                        onClicked: {
                            fileDialogLoad_shema.open()
                        }
                    }

                } //rec_column_2
                Rectangle {
                    id: rec_column_3
                    anchors.top: parent.top
                    anchors.topMargin: 2
                    anchors.left: rec_column_2.right
                    anchors.bottom: parent.bottom//rec_button.top
                    width: window.width/3
                    border.color: "lightblue"
                    Text {
                        id: text_tip_meh
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        font.pixelSize: 15
                        text: "Исполнительный механизм:"
                    }
                    ComboBox {
                        id: combo_tip_meh
                        property string id: ""
                        property string currentIndex0: "0"
                        currentIndex: find(currentIndex0, Qt.MatchExactly)
                        anchors.top: text_tip_meh.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        width: parent.width/2
                        //Material.accent: Material.LightBlue
                        model: model_tipmeh
                        textRole: 'Tipmehname'
                        onCurrentTextChanged: {
                            if(currentIndex==-1){
                                combo_tip_meh.id = ""
                            } else {
                            combo_tip_meh.id = model_tipmeh.getId(currentIndex)
                            }
                        }
                    }
                    Button {
                        anchors.left: combo_tip_meh.right
                        anchors.leftMargin: 5
                        anchors.top: combo_tip_meh.top
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
                            combo_tip_meh.currentIndex = -1
                        }
                    }
                    Text {
                        id: text_marka_meh
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.top: combo_tip_meh.bottom
                        anchors.topMargin: 5
                        font.pixelSize: 15
                        text: "Марка исполнительного механизма:"
                    }
                    TextField {
                        id: tf_marka_meh
                        anchors.top: text_marka_meh.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        //Material.accent: Material.LightBlue
                        placeholderText: "Введите марку исполнительного механизма"
                        focus: true
                        selectByMouse: true
                        persistentSelection: true
                        MouseArea {
                            acceptedButtons: Qt.RightButton
                            anchors.fill: parent
                            onClicked: {
                                contextMenu_marka_meh.x = mouseX
                                contextMenu_marka_meh.y = mouseY
                                contextMenu_marka_meh.open()
                            }
                        }
                        Menu {
                            id: contextMenu_marka_meh

                            MenuItem {
                                text: qsTr("Копировать")
                                enabled: tf_marka_meh.selectedText
                                onTriggered: tf_marka_meh.copy()
                            }
                            MenuItem {
                                text: qsTr("Вырезать")
                                enabled: tf_marka_meh.selectedText
                                onTriggered: tf_marka_meh.cut()
                            }
                            MenuItem {
                                text: qsTr("Вставить")
                                enabled: tf_marka_meh.canPaste
                                onTriggered: tf_marka_meh.paste()
                            }

                           // MenuSeparator {}

                        }
                    }
                    Text {
                        id: text_chastota3
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.verticalCenter: tf_chastota3.verticalCenter
                        font.pixelSize: 15
                        text: "Частота вращения, об/мин:"
                    }
                    TextField {
                        id: tf_chastota3
                        anchors.top: tf_marka_meh.bottom
                        anchors.topMargin: 5
                        width: tf_mosch.width
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        //Material.accent: Material.LightBlue
                        placeholderText: "Введите частоту"
                        focus: true
                        selectByMouse: true
                        persistentSelection: true
                        MouseArea {
                            acceptedButtons: Qt.RightButton
                            anchors.fill: parent
                            onClicked: {
                                contextMenu_chastota3.x = mouseX
                                contextMenu_chastota3.y = mouseY
                                contextMenu_chastota3.open()
                            }
                        }
                        Menu {
                            id: contextMenu_chastota3

                            MenuItem {
                                text: qsTr("Копировать")
                                enabled: tf_chastota3.selectedText
                                onTriggered: tf_chastota3.copy()
                            }
                            MenuItem {
                                text: qsTr("Вырезать")
                                enabled: tf_chastota3.selectedText
                                onTriggered: tf_chastota3.cut()
                            }
                            MenuItem {
                                text: qsTr("Вставить")
                                enabled: tf_chastota3.canPaste
                                onTriggered: tf_chastota3.paste()
                            }

                           // MenuSeparator {}

                        }
                    }
                    Text {
                        id: text_kollop
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.verticalCenter: tf_kollop.verticalCenter
                        font.pixelSize: 15
                        text: "Количество лопастей:"
                    }
                    TextField {
                        id: tf_kollop
                        anchors.top: tf_chastota3.bottom
                        anchors.topMargin: 5
                        width: tf_mosch.width
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        //Material.accent: Material.LightBlue
                        placeholderText: "Введите кол-во"
                        focus: true
                        selectByMouse: true
                        persistentSelection: true
                        MouseArea {
                            acceptedButtons: Qt.RightButton
                            anchors.fill: parent
                            onClicked: {
                                contextMenu_kollop.x = mouseX
                                contextMenu_kollop.y = mouseY
                                contextMenu_kollop.open()
                            }
                        }
                        Menu {
                            id: contextMenu_kollop

                            MenuItem {
                                text: qsTr("Копировать")
                                enabled: tf_kollop.selectedText
                                onTriggered: tf_kollop.copy()
                            }
                            MenuItem {
                                text: qsTr("Вырезать")
                                enabled: tf_kollop.selectedText
                                onTriggered: tf_kollop.cut()
                            }
                            MenuItem {
                                text: qsTr("Вставить")
                                enabled: tf_kollop.canPaste
                                onTriggered: tf_kollop.paste()
                            }

                           // MenuSeparator {}

                        }
                    }
                    Text {
                        id: text_isp
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.top: tf_kollop.bottom
                        anchors.topMargin: 5
                        font.pixelSize: 15
                        text: "Геометрическое исполнение агрегата:"
                    }
                    ComboBox {
                        id: combo_isp
                        property string id: ""
                        property string currentIndex0: "0"
                        currentIndex: find(currentIndex0, Qt.MatchExactly)
                        anchors.top: text_isp.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        width: parent.width/2
                        //Material.accent: Material.LightBlue
                        model: model_polozhenie
                        textRole: 'Polozheniename'
                        onCurrentTextChanged: {
                            if(currentIndex==-1){
                                combo_isp.id = ""
                            } else {
                            combo_isp.id = model_polozhenie.getId(currentIndex)
                            }
                        }
                    }
                    Button {
                        anchors.left: combo_isp.right
                        anchors.leftMargin: 5
                        anchors.top: combo_isp.top
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
                            combo_isp.currentIndex = -1
                        }
                    }
                    Text {
                        id: text_tip_op
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.top: combo_isp.bottom
                        anchors.topMargin: 5
                        font.pixelSize: 15
                        text: "Тип опоры агрегата:"
                    }
                    ComboBox {
                        id: combo_tip_op
                        property string id: ""
                        property string currentIndex0: "0"
                        currentIndex: find(currentIndex0, Qt.MatchExactly)
                        anchors.top: text_tip_op.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        width: parent.width/2
                        //Material.accent: Material.LightBlue
                        model: model_tipopory
                        textRole: 'Tipoporyname'
                        onCurrentTextChanged: {
                            if(currentIndex==-1){
                                combo_tip_op.id = ""
                            } else {
                            combo_tip_op.id = model_tipopory.getId(currentIndex)
                            }
                        }
                    }
                    Button {
                        anchors.left: combo_tip_op.right
                        anchors.leftMargin: 5
                        anchors.top: combo_tip_op.top
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
                            combo_tip_op.currentIndex = -1
                        }
                    }
                    Text {
                        id: text_proizv_meh
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.top: combo_tip_op.bottom
                        anchors.topMargin: 5
                        font.pixelSize: 15
                        text: "Производитель исполнительного механизма:"
                    }
                    ComboBox {
                        id: combo_proizv_meh
                        property string id: ""
                        property string currentIndex0: "0"
                        currentIndex: find(currentIndex0, Qt.MatchExactly)
                        anchors.top: text_proizv_meh.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: but_proizv_meh.left
                        anchors.rightMargin: 5
                        //width: parent.width/2
                        //Material.accent: Material.LightBlue
                        model: model_proizvmeh
                        textRole: 'Proizvmehname'
                        onCurrentTextChanged: {
                            if(currentIndex==-1){
                                combo_proizv_meh.id = ""
                            } else {
                            combo_proizv_meh.id = model_proizvmeh.getId(currentIndex)
                            }
                        }
                    }
                    Button {
                        id: but_proizv_meh
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        anchors.top: combo_proizv_meh.top
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
                            combo_proizv_meh.currentIndex = -1
                        }
                    }
                    Text {
                        id: text_kb
        //                anchors.top: combo_fio.bottom
        //                anchors.topMargin: 5
                        anchors.verticalCenter: tf_kb.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        font.pixelSize: 15
                        text: "Класс безопасности:"
                    }
                    TextField {
                        id: tf_kb
                        anchors.top: combo_proizv_meh.bottom
                        anchors.topMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
        //                anchors.left: text_pom.right
        //                anchors.leftMargin: 5
                        //highlighted: true
                        //Material.accent: Material.LightBlue
                        placeholderText: "Введите класс"
                        focus: true
                        selectByMouse: true
                        persistentSelection: true
                        MouseArea {
                            acceptedButtons: Qt.RightButton
                            anchors.fill: parent
                            onClicked: {
                                contextMenu_kb.x = mouseX
                                contextMenu_kb.y = mouseY
                                contextMenu_kb.open()
                            }
                        }
                        Menu {
                            id: contextMenu_kb

                            MenuItem {
                                text: qsTr("Копировать")
                                enabled: tf_kb.selectedText
                                onTriggered: tf_kb.copy()
                            }
                            MenuItem {
                                text: qsTr("Вырезать")
                                enabled: tf_kb.selectedText
                                onTriggered: tf_kb.cut()
                            }
                            MenuItem {
                                text: qsTr("Вставить")
                                enabled: tf_kb.canPaste
                                onTriggered: tf_kb.paste()
                            }

                           // MenuSeparator {}

                        }
                    }

                } //rec_column_3

            } //item1
            Item {
                id: item2
                Rectangle {
                    id: rec_column_4
                    anchors.top: parent.top
                    anchors.topMargin: 2
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom//rec_button.top
                    width: window.width/3
                    border.color: "lightblue"
                    Text {
                        id: text_nom_rezhim
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        font.pixelSize: 15
                        text: "Номинальный режим:"
                    }
                    Text {
                        id: text_napor_nom_rezhim
                        anchors.verticalCenter: tf_napor_nom_rezh.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        font.pixelSize: 15
                        text: "Напор, м(МПа):"
                    }
                    TextField {
                        id: tf_napor_nom_rezh
                        anchors.top: text_nom_rezhim.bottom
                        anchors.topMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        width: parent.width/2
                        placeholderText: "Введите напор"
                        focus: true
                        selectByMouse: true
                        persistentSelection: true
                        MouseArea {
                            acceptedButtons: Qt.RightButton
                            anchors.fill: parent
                            onClicked: {
                                contextMenu_napor_nom_rezhim.x = mouseX
                                contextMenu_napor_nom_rezhim.y = mouseY
                                contextMenu_napor_nom_rezhim.open()
                            }
                        }
                        Menu {
                            id: contextMenu_napor_nom_rezhim

                            MenuItem {
                                text: qsTr("Копировать")
                                enabled: tf_napor_nom_rezh.selectedText
                                onTriggered: tf_napor_nom_rezh.copy()
                            }
                            MenuItem {
                                text: qsTr("Вырезать")
                                enabled: tf_napor_nom_rezh.selectedText
                                onTriggered: tf_napor_nom_rezh.cut()
                            }
                            MenuItem {
                                text: qsTr("Вставить")
                                enabled: tf_napor_nom_rezh.canPaste
                                onTriggered: tf_napor_nom_rezh.paste()
                            }
                    }
                }
                    Text {
                        id: text_rashod_nom_rezhim
                        anchors.verticalCenter: tf_rashod_nom_rezh.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        font.pixelSize: 15
                        text: "Расход, м³/ч:"
                    }
                    TextField {
                        id: tf_rashod_nom_rezh
                        anchors.top: tf_napor_nom_rezh.bottom
                        anchors.topMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        width: parent.width/2
                        placeholderText: "Введите расход"
                        focus: true
                        selectByMouse: true
                        persistentSelection: true
                        MouseArea {
                            acceptedButtons: Qt.RightButton
                            anchors.fill: parent
                            onClicked: {
                                contextMenu_rashod_nom_rezhim.x = mouseX
                                contextMenu_rashod_nom_rezhim.y = mouseY
                                contextMenu_rashod_nom_rezhim.open()
                            }
                        }
                        Menu {
                            id: contextMenu_rashod_nom_rezhim

                            MenuItem {
                                text: qsTr("Копировать")
                                enabled: tf_rashod_nom_rezh.selectedText
                                onTriggered: tf_rashod_nom_rezh.copy()
                            }
                            MenuItem {
                                text: qsTr("Вырезать")
                                enabled: tf_rashod_nom_rezh.selectedText
                                onTriggered: tf_rashod_nom_rezh.cut()
                            }
                            MenuItem {
                                text: qsTr("Вставить")
                                enabled: tf_rashod_nom_rezh.canPaste
                                onTriggered: tf_rashod_nom_rezh.paste()
                            }
                    }
                }
                    Text {
                        id: text_rab_diap
                        anchors.top: tf_rashod_nom_rezh.bottom
                        anchors.topMargin: 50
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        font.pixelSize: 15
                        text: "Рабочий диапазон:"
                    }
                    Text {
                        id: text_napor_rab_diap
                        anchors.verticalCenter: tf_napor_rab_diap.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        font.pixelSize: 15
                        text: "Напор, м(МПа):"
                    }
                    TextField {
                        id: tf_napor_rab_diap
                        anchors.top: text_rab_diap.bottom
                        anchors.topMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        width: parent.width/2
                        placeholderText: "Введите напор"
                        focus: true
                        selectByMouse: true
                        persistentSelection: true
                        MouseArea {
                            acceptedButtons: Qt.RightButton
                            anchors.fill: parent
                            onClicked: {
                                contextMenu_napor_rab_diap.x = mouseX
                                contextMenu_napor_rab_diap.y = mouseY
                                contextMenu_napor_rab_diap.open()
                            }
                        }
                        Menu {
                            id: contextMenu_napor_rab_diap

                            MenuItem {
                                text: qsTr("Копировать")
                                enabled: tf_napor_rab_diap.selectedText
                                onTriggered: tf_napor_rab_diap.copy()
                            }
                            MenuItem {
                                text: qsTr("Вырезать")
                                enabled: tf_napor_rab_diap.selectedText
                                onTriggered: tf_napor_rab_diap.cut()
                            }
                            MenuItem {
                                text: qsTr("Вставить")
                                enabled: tf_napor_rab_diap.canPaste
                                onTriggered: tf_napor_rab_diap.paste()
                            }
                    }
                }
                    Text {
                        id: text_rashod_rab_diap
                        anchors.verticalCenter: tf_rashod_rab_diap.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        font.pixelSize: 15
                        text: "Расход, м³/ч:"
                    }
                    TextField {
                        id: tf_rashod_rab_diap
                        anchors.top: tf_napor_rab_diap.bottom
                        anchors.topMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        width: parent.width/2
                        placeholderText: "Введите расход"
                        focus: true
                        selectByMouse: true
                        persistentSelection: true
                        MouseArea {
                            acceptedButtons: Qt.RightButton
                            anchors.fill: parent
                            onClicked: {
                                contextMenu_rashod_rab_diap.x = mouseX
                                contextMenu_rashod_rab_diap.y = mouseY
                                contextMenu_rashod_rab_diap.open()
                            }
                        }
                        Menu {
                            id: contextMenu_rashod_rab_diap

                            MenuItem {
                                text: qsTr("Копировать")
                                enabled: tf_rashod_rab_diap.selectedText
                                onTriggered: tf_rashod_rab_diap.copy()
                            }
                            MenuItem {
                                text: qsTr("Вырезать")
                                enabled: tf_rashod_rab_diap.selectedText
                                onTriggered: tf_rashod_rab_diap.cut()
                            }
                            MenuItem {
                                text: qsTr("Вставить")
                                enabled: tf_rashod_rab_diap.canPaste
                                onTriggered: tf_rashod_rab_diap.paste()
                            }
                    }
                }
                    Text {
                        id: text_temp_otkaz
                        anchors.top: tf_rashod_rab_diap.bottom
                        anchors.topMargin: 50
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        font.pixelSize: 15
                        text: "Температура отказа:"
                    }
                    Text {
                        id: text_temp_eldv
                        anchors.verticalCenter: tf_temp_eldv.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        font.pixelSize: 15
                        text: "Электродвигатель:"
                    }
                    TextField {
                        id: tf_temp_eldv
                        anchors.top: text_temp_otkaz.bottom
                        anchors.topMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        width: parent.width/2
                        placeholderText: "Введите температуру"
                        focus: true
                        selectByMouse: true
                        persistentSelection: true
                        MouseArea {
                            acceptedButtons: Qt.RightButton
                            anchors.fill: parent
                            onClicked: {
                                contextMenu_temp_eldv.x = mouseX
                                contextMenu_temp_eldv.y = mouseY
                                contextMenu_temp_eldv.open()
                            }
                        }
                        Menu {
                            id: contextMenu_temp_eldv

                            MenuItem {
                                text: qsTr("Копировать")
                                enabled: tf_temp_eldv.selectedText
                                onTriggered: tf_temp_eldv.copy()
                            }
                            MenuItem {
                                text: qsTr("Вырезать")
                                enabled: tf_temp_eldv.selectedText
                                onTriggered: tf_temp_eldv.cut()
                            }
                            MenuItem {
                                text: qsTr("Вставить")
                                enabled: tf_temp_eldv.canPaste
                                onTriggered: tf_temp_eldv.paste()
                            }
                    }
                }
                    Text {
                        id: text_temp_red
                        anchors.verticalCenter: tf_temp_red.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        font.pixelSize: 15
                        text: "Редуктор:"
                    }
                    TextField {
                        id: tf_temp_red
                        anchors.top: tf_temp_eldv.bottom
                        anchors.topMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        width: parent.width/2
                        placeholderText: "Введите температуру"
                        focus: true
                        selectByMouse: true
                        persistentSelection: true
                        MouseArea {
                            acceptedButtons: Qt.RightButton
                            anchors.fill: parent
                            onClicked: {
                                contextMenu_temp_red.x = mouseX
                                contextMenu_temp_red.y = mouseY
                                contextMenu_temp_red.open()
                            }
                        }
                        Menu {
                            id: contextMenu_temp_red

                            MenuItem {
                                text: qsTr("Копировать")
                                enabled: tf_temp_red.selectedText
                                onTriggered: tf_temp_red.copy()
                            }
                            MenuItem {
                                text: qsTr("Вырезать")
                                enabled: tf_temp_red.selectedText
                                onTriggered: tf_temp_red.cut()
                            }
                            MenuItem {
                                text: qsTr("Вставить")
                                enabled: tf_temp_red.canPaste
                                onTriggered: tf_temp_red.paste()
                            }
                    }
                }
                    Text {
                        id: text_temp_meh
                        anchors.verticalCenter: tf_temp_meh.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        font.pixelSize: 15
                        text: "Механизм:"
                    }
                    TextField {
                        id: tf_temp_meh
                        anchors.top: tf_temp_red.bottom
                        anchors.topMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        width: parent.width/2
                        placeholderText: "Введите температуру"
                        focus: true
                        selectByMouse: true
                        persistentSelection: true
                        MouseArea {
                            acceptedButtons: Qt.RightButton
                            anchors.fill: parent
                            onClicked: {
                                contextMenu_temp_meh.x = mouseX
                                contextMenu_temp_meh.y = mouseY
                                contextMenu_temp_meh.open()
                            }
                        }
                        Menu {
                            id: contextMenu_temp_meh

                            MenuItem {
                                text: qsTr("Копировать")
                                enabled: tf_temp_meh.selectedText
                                onTriggered: tf_temp_meh.copy()
                            }
                            MenuItem {
                                text: qsTr("Вырезать")
                                enabled: tf_temp_meh.selectedText
                                onTriggered: tf_temp_meh.cut()
                            }
                            MenuItem {
                                text: qsTr("Вставить")
                                enabled: tf_temp_meh.canPaste
                                onTriggered: tf_temp_meh.paste()
                            }
                    }
                }
            } //rec_column_4
                Rectangle {
                    id: rec_column_5
                    anchors.top: parent.top
                    anchors.topMargin: 2
                    anchors.left: rec_column_4.right
                    anchors.bottom: parent.bottom//rec_button.top
                    width: window.width/3
                    border.color: "lightblue"
                    //color: "lightpink"
                    Rectangle {
                        id: rec_1_1
                        anchors.top: parent.top
                        anchors.left: parent.left
                        width: rec_column_5.width/3
                        height: text_norm_vibr.height
                        //border.color: "transparent"
                        color: "transparent"
                    Text {
                        id: text_norm_vibr
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        font.pixelSize: 15
                        text: "Нормы вибрации:"
                    }
                    }
                    Rectangle {
                        id: rec_2_1
                        anchors.top: rec_1_1.top
                        anchors.left: rec_1_1.right
                        width: rec_column_5.width/3
                        height: rec_1_1.height
                        color: "transparent"
                        Text {
                            anchors.top: parent.top
                            anchors.topMargin: 5
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 15
                            text: "Электродвигатель"
                        }
                    }
                    Rectangle {
                        id: rec_3_1
                        anchors.top: rec_1_1.top
                        anchors.left: rec_2_1.right
                        width: rec_column_5.width/3
                        height: rec_1_1.height
                        color: "transparent"
                        Text {
                            anchors.top: parent.top
                            anchors.topMargin: 5
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 15
                            text: "Агрегат"
                        }
                    }
                    Rectangle {
                        id: rec_1_2
                        anchors.top: rec_1_1.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        width: rec_column_5.width/3
                        height: rec_2_2.height
                        color: "transparent"
                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 15
                            text: "Холостой ход"
                        }
                    }
                    Rectangle {
                        id: rec_2_2
                        anchors.top: rec_1_1.bottom
                        anchors.topMargin: 5
                        anchors.left: rec_1_2.right
                        width: rec_column_5.width/3
                        height: combo_norm_hh.height
                        color: "transparent"
                            ComboBox {
                                id: combo_norm_hh
                                property string id: ""
                                property string currentIndex0: "0"
                                currentIndex: find(currentIndex0, Qt.MatchExactly)
                                anchors.top: parent.top
                                //anchors.topMargin: 5
                                anchors.left: parent.left
                                anchors.leftMargin: 5
                                width: parent.width - but_norm_hh.width - 15
                                model: model_normhh
                                textRole: 'Normhhzn'
                                onCurrentTextChanged: {
                                    if(currentIndex==-1){
                                        combo_norm_hh.id = ""
                                    } else {
                                    combo_norm_hh.id = model_normhh.getId(currentIndex)
                                    }
                                }
                            }
                        Button {
                            id: but_norm_hh
                            anchors.left: combo_norm_hh.right
                            anchors.leftMargin: 5
                            anchors.top: combo_norm_hh.top
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
                                combo_norm_hh.currentIndex = -1
                            }
                        }
                    }
                    Text {
                        id: text_nom_rezhim_norma
                        anchors.top: rec_1_2.bottom
                        anchors.topMargin: 50
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        font.pixelSize: 15
                        text: "Номинальный режим:"
                    }
                    Rectangle {
                        id: rec_1_3
                        anchors.top: text_nom_rezhim_norma.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        width: rec_column_5.width/3
                        height: rec_2_2.height
                        color: "transparent"
                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 15
                            text: "Норма"
                        }
                    }
                    Rectangle {
                        id: rec_2_3
                        anchors.top: text_nom_rezhim_norma.bottom
                        anchors.topMargin: 5
                        anchors.left: rec_1_3.right
                        width: rec_column_5.width/3
                        height: combo_norm_nomed.height
                        color: "transparent"
                            ComboBox {
                                id: combo_norm_nomed
                                property string id: ""
                                property string currentIndex0: "0"
                                currentIndex: find(currentIndex0, Qt.MatchExactly)
                                anchors.top: parent.top
                                anchors.left: parent.left
                                anchors.leftMargin: 5
                                width: parent.width - but_norm_nomed.width - 15
                                model: model_normnomed
                                textRole: 'Normnomedzn'
                                onCurrentTextChanged: {
                                    if(currentIndex==-1){
                                        combo_norm_nomed.id = ""
                                    } else {
                                    combo_norm_nomed.id = model_normnomed.getId(currentIndex)
                                    }
                                }
                            }
                        Button {
                            id: but_norm_nomed
                            anchors.left: combo_norm_nomed.right
                            anchors.leftMargin: 5
                            anchors.top: combo_norm_nomed.top
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
                                combo_norm_nomed.currentIndex = -1
                            }
                        }
                    }
                    Rectangle {
                        id: rec_3_3
                        anchors.top: text_nom_rezhim_norma.bottom
                        anchors.topMargin: 5
                        anchors.left: rec_2_3.right
                        width: rec_column_5.width/3
                        height: combo_norm_nom.height
                        color: "transparent"
                            ComboBox {
                                id: combo_norm_nom
                                property string id: ""
                                property string currentIndex0: "0"
                                currentIndex: find(currentIndex0, Qt.MatchExactly)
                                anchors.top: parent.top
                                anchors.left: parent.left
                                anchors.leftMargin: 5
                                width: parent.width - but_norm_nom.width - 15
                                model: model_normnom
                                textRole: 'Normnomzn'
                                onCurrentTextChanged: {
                                    if(currentIndex==-1){
                                        combo_norm_nom.id = ""
                                    } else {
                                    combo_norm_nom.id = model_normnom.getId(currentIndex)
                                    }
                                }
                            }
                        Button {
                            id: but_norm_nom
                            anchors.left: combo_norm_nom.right
                            anchors.leftMargin: 5
                            anchors.top: combo_norm_nom.top
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
                                combo_norm_nom.currentIndex = -1
                            }
                        }
                    }
                    Rectangle {
                        id: rec_1_4
                        anchors.top: rec_1_3.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        width: rec_column_5.width/3
                        height: rec_2_2.height
                        color: "transparent"
                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 15
                            text: "Ограничение"
                        }
                    }
                    Rectangle {
                        id: rec_2_4
                        anchors.top: rec_1_3.bottom
                        anchors.topMargin: 5
                        anchors.left: rec_1_4.right
                        width: rec_column_5.width/3
                        height: combo_ogr_nomed.height
                        color: "transparent"
                            ComboBox {
                                id: combo_ogr_nomed
                                property string id: ""
                                property string currentIndex0: "0"
                                currentIndex: find(currentIndex0, Qt.MatchExactly)
                                anchors.top: parent.top
                                anchors.left: parent.left
                                anchors.leftMargin: 5
                                width: parent.width - but_ogr_nomed.width - 15
                                model: model_ogrnomed
                                textRole: 'Ogrnomedzn'
                                onCurrentTextChanged: {
                                    if(currentIndex==-1){
                                        combo_ogr_nomed.id = ""
                                    } else {
                                    combo_ogr_nomed.id = model_ogrnomed.getId(currentIndex)
                                    }
                                }
                            }
                        Button {
                            id: but_ogr_nomed
                            anchors.left: combo_ogr_nomed.right
                            anchors.leftMargin: 5
                            anchors.top: combo_ogr_nomed.top
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
                                combo_ogr_nomed.currentIndex = -1
                            }
                        }
                    }
                    Rectangle {
                        id: rec_3_4
                        anchors.top: rec_1_3.bottom
                        anchors.topMargin: 5
                        anchors.left: rec_2_4.right
                        width: rec_column_5.width/3
                        height: combo_ogr_nom.height
                        color: "transparent"
                            ComboBox {
                                id: combo_ogr_nom
                                property string id: ""
                                property string currentIndex0: "0"
                                currentIndex: find(currentIndex0, Qt.MatchExactly)
                                anchors.top: parent.top
                                anchors.left: parent.left
                                anchors.leftMargin: 5
                                width: parent.width - but_ogr_nom.width - 15
                                model: model_ogrnom
                                textRole: 'Ogrnomzn'
                                onCurrentTextChanged: {
                                    if(currentIndex==-1){
                                        combo_ogr_nom.id = ""
                                    } else {
                                    combo_ogr_nom.id = model_ogrnom.getId(currentIndex)
                                    }
                                }
                            }
                        Button {
                            id: but_ogr_nom
                            anchors.left: combo_ogr_nom.right
                            anchors.leftMargin: 5
                            anchors.top: combo_ogr_nom.top
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
                                combo_ogr_nom.currentIndex = -1
                            }
                        }
                    }
                    Rectangle {
                        id: rec_1_5
                        anchors.top: rec_1_4.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        width: rec_column_5.width/3
                        height: rec_2_2.height
                        color: "transparent"
                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 15
                            text: "Отказ"
                        }
                    }
                    Rectangle {
                        id: rec_2_5
                        anchors.top: rec_1_4.bottom
                        anchors.topMargin: 5
                        anchors.left: rec_1_5.right
                        width: rec_column_5.width/3
                        height: combo_otkaz_nomed.height
                        color: "transparent"
                            ComboBox {
                                id: combo_otkaz_nomed
                                property string id: ""
                                property string currentIndex0: "0"
                                currentIndex: find(currentIndex0, Qt.MatchExactly)
                                anchors.top: parent.top
                                anchors.left: parent.left
                                anchors.leftMargin: 5
                                width: parent.width - but_otkaz_nomed.width - 15
                                model: model_otkaznomed
                                textRole: 'Otkaznomedzn'
                                onCurrentTextChanged: {
                                    if(currentIndex==-1){
                                        combo_otkaz_nomed.id = ""
                                    } else {
                                    combo_otkaz_nomed.id = model_otkaznomed.getId(currentIndex)
                                    }
                                }
                            }
                        Button {
                            id: but_otkaz_nomed
                            anchors.left: combo_otkaz_nomed.right
                            anchors.leftMargin: 5
                            anchors.top: combo_otkaz_nomed.top
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
                                combo_otkaz_nomed.currentIndex = -1
                            }
                        }
                    }
                    Rectangle {
                        id: rec_3_5
                        anchors.top: rec_1_4.bottom
                        anchors.topMargin: 5
                        anchors.left: rec_2_5.right
                        width: rec_column_5.width/3
                        height: combo_otkaz_nom.height
                        color: "transparent"
                            ComboBox {
                                id: combo_otkaz_nom
                                property string id: ""
                                property string currentIndex0: "0"
                                currentIndex: find(currentIndex0, Qt.MatchExactly)
                                anchors.top: parent.top
                                anchors.left: parent.left
                                anchors.leftMargin: 5
                                width: parent.width - but_otkaz_nom.width - 15
                                model: model_otkaznom
                                textRole: 'Otkaznomzn'
                                onCurrentTextChanged: {
                                    if(currentIndex==-1){
                                        combo_otkaz_nom.id = ""
                                    } else {
                                    combo_otkaz_nom.id = model_otkaznom.getId(currentIndex)
                                    }
                                }
                            }
                        Button {
                            id: but_otkaz_nom
                            anchors.left: combo_otkaz_nom.right
                            anchors.leftMargin: 5
                            anchors.top: combo_otkaz_nom.top
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
                                combo_otkaz_nom.currentIndex = -1
                            }
                        }
                    }
                    Text {
                        id: text_rabdiap_norma
                        anchors.top: rec_1_5.bottom
                        anchors.topMargin: 50
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        font.pixelSize: 15
                        text: "Рабочий диапазон:"
                    }
                    Rectangle {
                        id: rec_1_6
                        anchors.top: text_rabdiap_norma.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        width: rec_column_5.width/3
                        height: rec_2_2.height
                        color: "transparent"
                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 15
                            text: "Норма"
                        }
                    }
                    Rectangle {
                        id: rec_2_6
                        anchors.top: text_rabdiap_norma.bottom
                        anchors.topMargin: 5
                        anchors.left: rec_1_3.right
                        width: rec_column_5.width/3
                        height: combo_norm_rded.height
                        color: "transparent"
                            ComboBox {
                                id: combo_norm_rded
                                property string id: ""
                                property string currentIndex0: "0"
                                currentIndex: find(currentIndex0, Qt.MatchExactly)
                                anchors.top: parent.top
                                anchors.left: parent.left
                                anchors.leftMargin: 5
                                width: parent.width - but_norm_rded.width - 15
                                model: model_normrded
                                textRole: 'Normrdedzn'
                                onCurrentTextChanged: {
                                    if(currentIndex==-1){
                                        combo_norm_rded.id = ""
                                    } else {
                                    combo_norm_rded.id = model_normrded.getId(currentIndex)
                                    }
                                }
                            }
                        Button {
                            id: but_norm_rded
                            anchors.left: combo_norm_rded.right
                            anchors.leftMargin: 5
                            anchors.top: combo_norm_rded.top
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
                                combo_norm_rded.currentIndex = -1
                            }
                        }
                    }
                    Rectangle {
                        id: rec_3_6
                        anchors.top: text_rabdiap_norma.bottom
                        anchors.topMargin: 5
                        anchors.left: rec_2_3.right
                        width: rec_column_5.width/3
                        height: combo_norm_rd.height
                        color: "transparent"
                            ComboBox {
                                id: combo_norm_rd
                                property string id: ""
                                property string currentIndex0: "0"
                                currentIndex: find(currentIndex0, Qt.MatchExactly)
                                anchors.top: parent.top
                                anchors.left: parent.left
                                anchors.leftMargin: 5
                                width: parent.width - but_norm_rd.width - 15
                                model: model_normrd
                                textRole: 'Normrdzn'
                                onCurrentTextChanged: {
                                    if(currentIndex==-1){
                                        combo_norm_rd.id = ""
                                    } else {
                                    combo_norm_rd.id = model_normrd.getId(currentIndex)
                                    }
                                }
                            }
                        Button {
                            id: but_norm_rd
                            anchors.left: combo_norm_rd.right
                            anchors.leftMargin: 5
                            anchors.top: combo_norm_rd.top
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
                                combo_norm_rd.currentIndex = -1
                            }
                        }
                    }
                    Rectangle {
                        id: rec_1_7
                        anchors.top: rec_1_6.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        width: rec_column_5.width/3
                        height: rec_2_2.height
                        color: "transparent"
                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 15
                            text: "Ограничение"
                        }
                    }
                    Rectangle {
                        id: rec_2_7
                        anchors.top: rec_1_6.bottom
                        anchors.topMargin: 5
                        anchors.left: rec_1_7.right
                        width: rec_column_5.width/3
                        height: combo_ogr_rded.height
                        color: "transparent"
                            ComboBox {
                                id: combo_ogr_rded
                                property string id: ""
                                property string currentIndex0: "0"
                                currentIndex: find(currentIndex0, Qt.MatchExactly)
                                anchors.top: parent.top
                                anchors.left: parent.left
                                anchors.leftMargin: 5
                                width: parent.width - but_ogr_rded.width - 15
                                model: model_ogrrded
                                textRole: 'Ogrrdedzn'
                                onCurrentTextChanged: {
                                    if(currentIndex==-1){
                                        combo_ogr_rded.id = ""
                                    } else {
                                    combo_ogr_rded.id = model_ogrrded.getId(currentIndex)
                                    }
                                }
                            }
                        Button {
                            id: but_ogr_rded
                            anchors.left: combo_ogr_rded.right
                            anchors.leftMargin: 5
                            anchors.top: combo_ogr_rded.top
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
                                combo_ogr_rded.currentIndex = -1
                            }
                        }
                    }
                    Rectangle {
                        id: rec_3_7
                        anchors.top: rec_1_6.bottom
                        anchors.topMargin: 5
                        anchors.left: rec_2_7.right
                        width: rec_column_5.width/3
                        height: combo_ogr_rd.height
                        color: "transparent"
                            ComboBox {
                                id: combo_ogr_rd
                                property string id: ""
                                property string currentIndex0: "0"
                                currentIndex: find(currentIndex0, Qt.MatchExactly)
                                anchors.top: parent.top
                                anchors.left: parent.left
                                anchors.leftMargin: 5
                                width: parent.width - but_ogr_rd.width - 15
                                model: model_ogrrd
                                textRole: 'Ogrrdzn'
                                onCurrentTextChanged: {
                                    if(currentIndex==-1){
                                        combo_ogr_rd.id = ""
                                    } else {
                                    combo_ogr_rd.id = model_ogrrd.getId(currentIndex)
                                    }
                                }
                            }
                        Button {
                            id: but_ogr_rd
                            anchors.left: combo_ogr_rd.right
                            anchors.leftMargin: 5
                            anchors.top: combo_ogr_rd.top
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
                                combo_ogr_rd.currentIndex = -1
                            }
                        }
                    }
                    Rectangle {
                        id: rec_1_8
                        anchors.top: rec_1_7.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        width: rec_column_5.width/3
                        height: rec_2_2.height
                        color: "transparent"
                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 15
                            text: "Отказ"
                        }
                    }
                    Rectangle {
                        id: rec_2_8
                        anchors.top: rec_1_7.bottom
                        anchors.topMargin: 5
                        anchors.left: rec_1_8.right
                        width: rec_column_5.width/3
                        height: combo_otkaz_rded.height
                        color: "transparent"
                            ComboBox {
                                id: combo_otkaz_rded
                                property string id: ""
                                property string currentIndex0: "0"
                                currentIndex: find(currentIndex0, Qt.MatchExactly)
                                anchors.top: parent.top
                                anchors.left: parent.left
                                anchors.leftMargin: 5
                                width: parent.width - but_otkaz_rded.width - 15
                                model: model_otkazrded
                                textRole: 'Otkazrdedzn'
                                onCurrentTextChanged: {
                                    if(currentIndex==-1){
                                        combo_otkaz_rded.id = ""
                                    } else {
                                    combo_otkaz_rded.id = model_otkazrded.getId(currentIndex)
                                    }
                                }
                            }
                        Button {
                            id: but_otkaz_rded
                            anchors.left: combo_otkaz_rded.right
                            anchors.leftMargin: 5
                            anchors.top: combo_otkaz_rded.top
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
                                combo_otkaz_rded.currentIndex = -1
                            }
                        }
                    }
                    Rectangle {
                        id: rec_3_8
                        anchors.top: rec_1_7.bottom
                        anchors.topMargin: 5
                        anchors.left: rec_2_8.right
                        width: rec_column_5.width/3
                        height: combo_otkaz_rd.height
                        color: "transparent"
                            ComboBox {
                                id: combo_otkaz_rd
                                property string id: ""
                                property string currentIndex0: "0"
                                currentIndex: find(currentIndex0, Qt.MatchExactly)
                                anchors.top: parent.top
                                anchors.left: parent.left
                                anchors.leftMargin: 5
                                width: parent.width - but_otkaz_rd.width - 15
                                model: model_otkazrd
                                textRole: 'Otkazrdzn'
                                onCurrentTextChanged: {
                                    if(currentIndex==-1){
                                        combo_otkaz_rd.id = ""
                                    } else {
                                    combo_otkaz_rd.id = model_otkazrd.getId(currentIndex)
                                    }
                                }
                            }
                        Button {
                            id: but_otkaz_rd
                            anchors.left: combo_otkaz_rd.right
                            anchors.leftMargin: 5
                            anchors.top: combo_otkaz_rd.top
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
                                combo_otkaz_rd.currentIndex = -1
                            }
                        }
                    }
                } //rec_column_5
                Rectangle {
                    id: rec_column_6
                    anchors.top: parent.top
                    anchors.topMargin: 2
                    anchors.left: rec_column_5.right
                    anchors.bottom: parent.bottom//rec_button.top
                    width: window.width/3
                    border.color: "lightblue"
                    //color: "lightpink"
                    Text {
                        id: text_doc
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        font.pixelSize: 15
                        wrapMode: Text.WordWrap
                        text: "Документы, определяющие нормы вибрации:"
                    }
                    Rectangle {
                        id: tf_doc
                        anchors.top: text_doc.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: parent.height/4
                        Flickable {
                            id: flickable_doc
                            flickableDirection: Flickable.VerticalFlick
                            anchors.fill: parent

                            TextArea.flickable: TextArea {
                                id: textArea_doc
                                placeholderText: "Перечислите документы"
                                //Material.accent: Material.LightBlue
                                textFormat: Qt.PlainText//RichText
                                wrapMode: TextArea.Wrap
                                MouseArea {
                                    acceptedButtons: Qt.RightButton
                                    anchors.fill: parent
                                    onClicked: {
                                        contextMenu_doc.x = mouseX
                                        contextMenu_doc.y = mouseY
                                        contextMenu_doc.open()
                                    }
                                }
                                Menu {
                                    id: contextMenu_doc

                                    MenuItem {
                                        text: qsTr("Копировать")
                                        enabled: textArea_doc.selectedText
                                        onTriggered: textArea_doc.copy()
                                    }
                                    MenuItem {
                                        text: qsTr("Вырезать")
                                        enabled: textArea_doc.selectedText
                                        onTriggered: textArea_doc.cut()
                                    }
                                    MenuItem {
                                        text: qsTr("Вставить")
                                        enabled: textArea_doc.canPaste
                                        onTriggered: textArea_doc.paste()
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
                    }
                    Text {
                        id: text_par
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.top: tf_doc.bottom
                        anchors.topMargin: 5
                        font.pixelSize: 15
                        wrapMode: Text.WordWrap
                        text: "Параметры центровки и прилегания:"
                    }
                    Rectangle {
                        id: tf_par
                        anchors.top: text_par.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: parent.height/4
                        Flickable {
                            id: flickable_par
                            flickableDirection: Flickable.VerticalFlick
                            anchors.fill: parent

                            TextArea.flickable: TextArea {
                                id: textArea_par
                                placeholderText: "Перечислите параметры"
                                //Material.accent: Material.LightBlue
                                textFormat: Qt.PlainText//RichText
                                wrapMode: TextArea.Wrap
                                MouseArea {
                                    acceptedButtons: Qt.RightButton
                                    anchors.fill: parent
                                    onClicked: {
                                        contextMenu_par.x = mouseX
                                        contextMenu_par.y = mouseY
                                        contextMenu_par.open()
                                    }
                                }
                                Menu {
                                    id: contextMenu_par

                                    MenuItem {
                                        text: qsTr("Копировать")
                                        enabled: textArea_par.selectedText
                                        onTriggered: textArea_par.copy()
                                    }
                                    MenuItem {
                                        text: qsTr("Вырезать")
                                        enabled: textArea_par.selectedText
                                        onTriggered: textArea_par.cut()
                                    }
                                    MenuItem {
                                        text: qsTr("Вставить")
                                        enabled: textArea_par.canPaste
                                        onTriggered: textArea_par.paste()
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
                    }
                } //rec_column_6
            } //item2
            Item {
                id: item3
            }

//            CreatBO2 {
//                id: creatBO2
//            }
//            CreatBO3 {
//                id: сreatBO3
//            }
        }
        TabBar {
        id: tabBar
        height: 40
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        currentIndex: swipeView.currentIndex
        Material.accent: Material.LightBlue
        onCurrentIndexChanged: {
            if(tabBar.currentIndex==0){
                but1.color = "white"
                but2.color = "lightblue"
                //but3.color = "lightblue"
            }
            if(tabBar.currentIndex==1){
                but1.color = "lightblue"
                but2.color = "white"
                //but3.color = "lightblue"
            }
//            if(tabBar.currentIndex==2){
//                but1.color = "lightblue"
//                but2.color = "lightblue"
//                but3.color = "white"
//            }
        }

        TabButton {
            text: qsTr("Общие данные")
            font.pixelSize: 15
            //font.family: "Arial"
            font.bold: true
            background: Rectangle {
                id: but1
                border.color: "white"
                color: "white"
            }
//            onClicked: {
//                but1.color = "white"
//                but2.color = "lightblue"
//                but3.color = "lightblue"
//            }
        }
        TabButton {
            text: qsTr("Критерии")
            font.pixelSize: 15
            //font.family: "Arial"
            font.bold: true
            background: Rectangle {
                id: but2
                border.color: "white"
                color: "lightblue"
            }
//            onClicked: {
//                but1.color = "lightblue"
//                but2.color = "white"
//                but3.color = "lightblue"
//            }
        }
//        TabButton {
//            text: qsTr("Подшипники")
//            font.pixelSize: 15
//            //font.family: "Arial"
//            font.bold: true
//            background: Rectangle {
//                id: but3
//                border.color: "white"
//                color: "lightblue"
//            }
////            onClicked: {
////                but1.color = "lightblue"
////                but2.color = "lightblue"
////                but3.color = "white"
////            }
//        }
    }




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
                tf_mosch.text = tf_mosch.text.replace(",", ".")
                database.editTableBaza(tf_kks.text, combo_ceh.id, tf_zd.text, tf_pom.text, textArea.text,
                                         textArea_prim.text, combo_program.id, combo_fio.id, tf_marka_eldv.text,
                                         tf_mosch.text, tf_chastota.text, combo_proizv_eldv.id, combo_tip_permeh.id,
                                         combo_tip_per.id, tf_kolpal.text, combo_tip_meh.id, tf_marka_meh.text,
                                         tf_chastota3.text, tf_kollop.text, combo_isp.id, combo_tip_op.id,
                                         combo_proizv_meh.id, tf_kb.text, tf_napor_nom_rezh.text, tf_rashod_nom_rezh.text,
                                         tf_napor_rab_diap.text, tf_rashod_rab_diap.text, tf_temp_eldv.text,
                                         tf_temp_red.text, tf_temp_meh.text, combo_norm_hh.id, combo_norm_nomed.id,
                                         combo_norm_nom.id, combo_ogr_nomed.id, combo_ogr_nom.id, combo_otkaz_nomed.id,
                                         combo_otkaz_nom.id, combo_norm_rded.id, combo_norm_rd.id, combo_ogr_rded.id,
                                         combo_ogr_rd.id, combo_otkaz_rded.id, combo_otkaz_rd.id, tf_foto.tex,
                                         tf_shema.tex, textArea_doc.text, textArea_par.text, stackView.baza_id)                
                model0.updateModel()
                stackView.replace(bo)
                tool_left.visible = true
                tool_left1.visible = false
                stackView.baza_id = ""
                qmlSignal_baza_id()
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
                stackView.replace(bo)
                tool_left.visible = true
                tool_left1.visible = false
            }
        }
    }

    }
    Component.onCompleted: {        
        qmlSignal_baza_id()
        mapper.addMapping(tf_kks, (0x0100+2), "text")
        mapper.addMapping(combo_ceh, (0x0100+3), "currentIndex0")
        mapper.addMapping(tf_zd, (0x0100+4), "text")
        mapper.addMapping(tf_pom, (0x0100+5), "text")
        mapper.addMapping(textArea, (0x0100+6), "text")
        mapper.addMapping(textArea_prim, (0x0100+10), "text")
        mapper.addMapping(combo_program, (0x0100+8), "currentIndex0")
        mapper.addMapping(combo_fio, (0x0100+9), "currentIndex0")
        mapper.addMapping(tf_marka_eldv, (0x0100+13), "text")
        mapper.addMapping(tf_mosch, (0x0100+14), "text")
        mapper.addMapping(tf_chastota, (0x0100+15), "text")
        mapper.addMapping(combo_proizv_eldv, (0x0100+16), "currentIndex0")
        mapper.addMapping(combo_tip_permeh, (0x0100+17), "currentIndex0")
        mapper.addMapping(combo_tip_per, (0x0100+18), "currentIndex0")
        mapper.addMapping(tf_kolpal, (0x0100+19), "text")
        mapper.addMapping(tf_foto, (0x0100+11), "text")
        mapper.addMapping(tf_foto, (0x0100+11), "tex")
        mapper.addMapping(tf_shema, (0x0100+12), "text")
        mapper.addMapping(tf_shema, (0x0100+12), "tex")
        mapper.addMapping(combo_tip_meh, (0x0100+20 ), "currentIndex0")
        mapper.addMapping(tf_marka_meh, (0x0100+21), "text")
        mapper.addMapping(tf_chastota3, (0x0100+22), "text")
        mapper.addMapping(tf_kollop, (0x0100+23), "text")
        mapper.addMapping(combo_isp, (0x0100+24), "currentIndex0")
        mapper.addMapping(combo_tip_op, (0x0100+25), "currentIndex0")
        mapper.addMapping(combo_proizv_meh, (0x0100+26), "currentIndex0")
        mapper.addMapping(tf_kb, (0x0100+7), "text")
        mapper.addMapping(tf_napor_nom_rezh, (0x0100+27), "text")
        mapper.addMapping(tf_rashod_nom_rezh, (0x0100+29), "text")
        mapper.addMapping(tf_napor_rab_diap, (0x0100+28), "text")
        mapper.addMapping(tf_rashod_rab_diap, (0x0100+30), "text")
        mapper.addMapping(tf_temp_eldv, (0x0100+44), "text")
        mapper.addMapping(tf_temp_red, (0x0100+45), "text")
        mapper.addMapping(tf_temp_meh, (0x0100+46), "text")
        mapper.addMapping(combo_norm_hh, (0x0100+31), "currentIndex0")
        mapper.addMapping(combo_norm_nomed, (0x0100+32), "currentIndex0")
        mapper.addMapping(combo_norm_nom, (0x0100+33), "currentIndex0")
        mapper.addMapping(combo_ogr_nomed, (0x0100+34), "currentIndex0")
        mapper.addMapping(combo_ogr_nom, (0x0100+35), "currentIndex0")
        mapper.addMapping(combo_otkaz_nomed, (0x0100+36), "currentIndex0")
        mapper.addMapping(combo_otkaz_nom, (0x0100+37), "currentIndex0")
        mapper.addMapping(combo_norm_rded, (0x0100+38), "currentIndex0")
        mapper.addMapping(combo_norm_rd, (0x0100+39), "currentIndex0")
        mapper.addMapping(combo_ogr_rded, (0x0100+40), "currentIndex0")
        mapper.addMapping(combo_ogr_rd, (0x0100+41), "currentIndex0")
        mapper.addMapping(combo_otkaz_rded, (0x0100+42), "currentIndex0")
        mapper.addMapping(combo_otkaz_rd, (0x0100+43), "currentIndex0")
        mapper.addMapping(textArea_doc, (0x0100+47), "text")
        mapper.addMapping(textArea_par, (0x0100+48), "text")
        tf_mosch.text = tf_mosch.text.replace(".", ",")
    }

}
