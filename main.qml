import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
//import QtQuick.LocalStorage 2.0 as SQL
//import "Database.js" as Data

ApplicationWindow {
    id: window
    objectName: "window"
    visible: true
    width: 1024
    height: 768
    title: qsTr("База ЛДРО ОТД ЛАЭС-2")
    Material.theme: Material.Light
    Material.accent: "black"//Material.LightBlue
    Material.primary: Material.LightBlue
    //Material.foreground: Material.LightBlue
    //Material.background: Material.LightBlue
    signal qmlSignal()
    signal qmlSignal2()
    signal qmlSignal_baza_id()
    signal qmlSignal_rezhim()
    signal qmlSignal_bazaizmer()
    signal qmlFilterBO()
    property string baza_id: ""
    property int index: 0
    property int newindex: -1

    header: ToolBar {
        id: toolBar
        RowLayout {
            spacing: 20
            anchors.fill: parent

            ToolButton {
                id: tool_left
                visible: true                
                contentItem: Image {
                    fillMode: Image.Pad
                    horizontalAlignment: Image.AlignHCenter
                    verticalAlignment: Image.AlignVCenter
                    source: "Images/drawer.png"
                }
                onClicked: {
                        drawer.open()
                }
            }
            ToolButton {
                id: tool_left1
                visible: false                
                onClicked: {
                        stackView.replace(bo)
                    stackView.baza_id = ""
                    qmlSignal_baza_id()
                    tool_left.visible = true
                    tool_left1.visible = false
                }
                Text {
                    id: tool_text
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 30                    
                    text: qsTr("<")
                }
            }

            Label {
                id: titleLabel
                text: listView.currentItem ? listView.currentItem.text : "База оборудования"
                font.pixelSize: 20
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true

            }

            ToolButton {
                contentItem: Image {
                    fillMode: Image.Pad
                    horizontalAlignment: Image.AlignHCenter
                    verticalAlignment: Image.AlignVCenter
                    source: "Images/menu.png"
                }
                onClicked: optionsMenu.open()

                Menu {
                    id: optionsMenu
                    x: parent.width - width
                    transformOrigin: Menu.TopRight

                    MenuItem {
                        text: "Настройки"
                    }
                    MenuItem {
                        text: "О программе"
                    }
                }
            }
        }
    }
    Drawer {
        id: drawer
        width: Math.min(window.width, window.height) / 3
        height: window.height
        ListView {
            id: listView
            focus: true
            currentIndex: -1
            anchors.fill: parent
            delegate: ItemDelegate {
                width: parent.width
                text: model.title
                highlighted: ListView.isCurrentItem
                onClicked: {
                    listView.currentIndex = index
                    if (listView.currentIndex==0){
                        stackView.push(bo)
                    }
                    if (listView.currentIndex==1){
//                        stackView.baza_id = ""
//                        qmlSignal_bazaizmer()
                        stackView.push(bi)
                    }
                    if (listView.currentIndex==2){
                        stackView.push(bb)
                    }
                    if (listView.currentIndex==3){
                        stackView.push(stat)
                    }

                    drawer.close()
                }
            }

            model: ListModel {
                ListElement { title: "База оборудования"}
                ListElement { title: "База измерений"}
                ListElement { title: "База балансировок"}
                ListElement { title: "Статистика"}
            }

            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }
    StackView {
        id: stackView
        objectName: "stackView"
        anchors.fill: parent
        //данные фильтра базы оборудования
        property string kks: ""
        property string id_ceh: ""
        property string zd: ""
        property string id_tipmeh: ""

        property string baza_id: ""
        property string rezhim_id
        property double maxlevel
        property int bazaizm_id
        property var maxcolizm
Component.onCompleted: {
    qmlFilterBO()
    stackView.push(bo)
}
        Component {
            id: bo
            BO{
                id: bo_0
            }
        }
        Component {
            id: bi
            BI {
                id: bi_0
            }
        }

        Component {
            id: bb
            BB {
                id: bb_0
            }
        }
        Component {
            id: stat
            Stat {
                id: stat_0
            }
        }
        Component {
            id: creatBO
            CreatBO {
                id: creatBO_0
            }
        }
        Component {
            id: openBO
            OpenBO {
                id: openBO_0
            }
        }
        Component {
            id: creatBI
            CreatBO {
                id: creatBI_0
            }
        }
    }
Component.onCompleted: {
    mapper_maxlevel.addMapping(stackView, (0x0100+2), "maxlevel")
}
}
