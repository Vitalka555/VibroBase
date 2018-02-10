import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
import Qt.labs.settings 1.0
//import QtQuick.LocalStorage 2.0 as SQL
//import "Database.js" as Data

ApplicationWindow {
    id: window
    objectName: "window"
    visible: true
    width: 1024
    height: 768


    minimumWidth: 1024
    minimumHeight: 768
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
    signal qmlFilterBI()
    signal qmlSignal_bazaizmer_id()
    signal qmlKKS_filter()
    signal qmlNormCreatBI()
    signal qmlSignalWritePath()//сигнал записи настроек путей в ini
    signal qmlSignalReadPath()//сигнал чтения настроек путей из ini
    signal qmlSignalWriteWindow()
    signal qmlSignalReadWindow()
    signal qmlKolAgr()
    signal qmlGetDate()
    signal qmlGetDate2()
    signal qmlGetPersonal()
    signal qmlGetTipMeh()
    signal qmlBackup()
    signal qmlPodsh()
    property string baza_id: ""
    property int index: 0
    property int index_izmer: 0
    property int newindex: -1    

    onClosing: {
        stackView.wwidth = window.width
        stackView.hheight = window.height
        stackView.xx = window.x
        stackView.yy = window.y
        qmlSignalWriteWindow()
        qmlBackup()
    }


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
                    stackView.bazaizm_id = ""
                    qmlSignal_baza_id()
                    tool_left.visible = true
                    tool_left1.visible = false
                    tool_left2.visible = false
                    tool_left3.visible = false
                }
                Text {
                    id: tool_text
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 30                    
                    text: qsTr("<")
                }
            }
            ToolButton {
                id: tool_left2
                visible: false
                onClicked: {
                        stackView.replace(bi)
                    stackView.bazaizm_id = ""
                    //qmlSignal_baza_id()
                    qmlFilterBI()
                    tool_left.visible = true
                    tool_left1.visible = false
                    tool_left2.visible = false
                    tool_left3.visible = false
                }
                Text {
                    id: tool_text2
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 30
                    text: qsTr("<")
                }
            }
            ToolButton {
                id: tool_left3
                visible: false
                onClicked: {
                        stackView.replace(settingsBase)
                    tool_left.visible = false
                    tool_left1.visible = true
                    tool_left2.visible = false
                    tool_left3.visible = false
                }
                Text {
                    id: tool_text3
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
                        text: "Настройки программы"
                        onClicked: {
                            stackView.replace(settingsProgramm)
                            tool_left.visible = false
                            tool_left1.visible = true
                            tool_left2.visible = false
                            tool_left3.visible = false
                            //titleLabel.text = "Настройки программы"
                        }
                    }
                    MenuItem {
                        text: "Настройки базы"
                        onClicked: {
                            stackView.replace(settingsBase)
                            tool_left.visible = false
                            tool_left1.visible = true
                            tool_left2.visible = false
                            tool_left3.visible = false
                        }
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
//onClosed: {
//    window.deleteLater(drawer)
//}
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
                        stackView.replace(bo)
                    }
                    if (listView.currentIndex==1){
//                        stackView.baza_id = ""
//                        qmlSignal_bazaizmer()
                        stackView.replace(bi)
                    }
                    if (listView.currentIndex==2){
                        stackView.replace(bb)
                    }
                    if (listView.currentIndex==3){
                        //qmlKolAgr()
                        stackView.replace(stat)
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
        property string ceh_index: "-1"
        property string tipmeh_index: "-1"

        property string baza_id: ""
        property string rezhim_id
        property double maxlevel
        property string bazaizm_id: ""
        property var maxcolizm
        //данные фильтра базы измерений
        property string kks_filter_BI: ""
        property string id_tipmeh_filter_BI: ""
        property bool neispravnoe: false
        property string tipmehBI_index: "-1"
        //фильтр в комбобоксе создания измерения
        property string combo_kks: ""
        //для страницы создания измерения
        property string baza_id_for_norm_creatBI: ""
        //настройки
        property string pathToBase
        property string pathToBaseRead
        property string pathToPhoto
        property string pathToPhotoRead
        property string pathToShema
        property string pathToShemaRead
        //для ini
        property string wwidth
        property string hheight
        property string xx
        property string yy
        property bool running
        property string time_interval
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
            CreatBI {
                id: creatBI_0
            }
        }
        Component {
            id: openBI
            OpenBI {
                id: openBI_0
            }
        }
        Component {
            id: addBO
            AddBO {
                id: addBO_0
            }
        }
        Component {
            id: addBI
            AddBI {
                id: addBI_0
            }
        }
        Component {
            id: settingsProgramm
            SettingsProgramm {
                id: settingsProgramm_0
            }
        }
        Component {
            id: settingsBase
            SettingsBase {
                id: settingsBase_0
            }
        }
        Component {
            id: commonSettings
            CommonSettings {
                id: commonSettings_0
            }
        }
        Component {
            id: factorySettings
            FactorySettings {
                id: factorySettings_0
            }
        }
        Component {
            id: personalSettings
            PersonalSettings {
                id: personalSettings_0
            }
        }
        Component {
            id: vibrationSettings
            VibrationSettings {
                id: vibrationSettings_0
            }
        }
        Component {
            id: bearingSettings
            BearingSettings {
                id: bearingSettings_0
            }
        }
    }

Component.onCompleted: {
    mapper_maxlevel.addMapping(stackView, (0x0100+2), "maxlevel")
}

}
