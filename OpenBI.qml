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

Rectangle{
    id: rec_1
    anchors.top: parent.top
    anchors.left: parent.left
    height: tf_kks.height+tf_date.height+tf_time.height+tf_rezhim.height+tf_tipizmer.height+text_norm.height+tf_norm_ed.height+tf_norm_meh.height + 40
    width: page.width/3
    //color: "lightgrey"

        Text {
            id: text_kks
            anchors.verticalCenter: tf_kks.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 20
            color: "#3E65FF"
            text: "KKS:"
        }
        Text {
            id: tf_kks
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: tf_date.right
            font.pixelSize: 20
            font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }

        Text {
            id: text_date
            anchors.verticalCenter: tf_date.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 20
            color: "#3E65FF"
            text: "Дата:"
        }
        Text {
            id: tf_date
            anchors.top: tf_kks.bottom
            anchors.topMargin: 5
            anchors.left: tf_tipizmer.left
            font.pixelSize: 20
            font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
        Text {
            id: text_time
            anchors.verticalCenter: tf_time.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 20
            color: "#3E65FF"
            text: "Время:"
        }
        Text {
            id: tf_time
            anchors.top: tf_date.bottom
            anchors.topMargin: 5
            anchors.left: tf_tipizmer.left
            font.pixelSize: 20
            font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
        Text {
            id: text_rezhim
            anchors.verticalCenter: tf_rezhim.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 20
            color: "#3E65FF"
            text: "Режим:"
        }
        Text {
            id: tf_rezhim
            anchors.top: tf_time.bottom
            anchors.topMargin: 5
            anchors.left: tf_tipizmer.left
            font.pixelSize: 20
            font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
        Text {
            id: text_tipizmer
            anchors.verticalCenter: tf_tipizmer.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 20
            color: "#3E65FF"
            text: "Тип измерения:"
        }
        Text {
            id: tf_tipizmer
            anchors.top: tf_rezhim.bottom
            anchors.topMargin: 5
            anchors.left: text_tipizmer.right
            anchors.leftMargin: 5
            font.pixelSize: 20
            font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
        Text {
            id: text_norm
            anchors.top: tf_tipizmer.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 20
            color: "#3E65FF"
            text: "Нормы вибрации:"
        }
        Text {
            id: text_norm_ed
            anchors.verticalCenter: tf_norm_ed.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 20
            color: "#3E65FF"
            text: "Эл/дв:"
        }
        Text {
            id: tf_norm_ed
            anchors.top: text_norm.bottom
            anchors.topMargin: 5
            anchors.left: tf_tipizmer.left
            font.pixelSize: 20
            font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
        Text {
            id: text_norm_meh
            anchors.verticalCenter: tf_norm_meh.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 20
            color: "#3E65FF"
            text: "Механизм:"
        }
        Text {
            id: tf_norm_meh
            anchors.top: tf_norm_ed.bottom
            anchors.topMargin: 5
            anchors.left: tf_tipizmer.left
            font.pixelSize: 20
            font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
}// end rec_1
Rectangle{
    id: rec_2
    anchors.top: rec_1.bottom
    anchors.left: parent.left
    width: rec_1.width/2
    height: text_laes.height*2
    Text {
        id: text_laes
        text: "ЛАЭС-2:"
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.pixelSize: 20
        color: "#3E65FF"
    }
}// end rec_2
Rectangle{
    id: rec_3
    anchors.top: rec_1.bottom
    anchors.left: rec_2.right
    width: rec_1.width/2
    height: text_ate.height*2
    Text {
        id: text_ate
        text: "АТЭ:"
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.pixelSize: 20
        color: "#3E65FF"
    }
}// end rec_3
Rectangle {
    id: rec_4
    anchors.top: rec_2.bottom
    anchors.left: parent.left
    width: rec_1.width/2
    anchors.bottom: parent.bottom
    Flickable {
        id: flickable_laes
        flickableDirection: Flickable.VerticalFlick
        anchors.fill: parent
        TextArea.flickable: TextArea {
            id: textArea_laes
            Material.accent: Material.LightBlue
            font.italic: true
            font.pixelSize: 20
            color: "#3E65FF"
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
            }
            focus: true
            selectByMouse: true
            persistentSelection: true
        }
        ScrollBar.vertical: ScrollBar {
        width: 10
        }
    }
}// end rec_4
Rectangle {
    id: rec_5
    anchors.top: rec_3.bottom
    anchors.left: rec_4.right
    width: rec_1.width/2
    anchors.bottom: parent.bottom
    Flickable {
        id: flickable_ate
        flickableDirection: Flickable.VerticalFlick
        anchors.fill: parent
        TextArea.flickable: TextArea {
            id: textArea_ate
            font.italic: true
            font.pixelSize: 20
            color: "#3E65FF"
            Material.accent: Material.LightBlue
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
            }
            focus: true
            selectByMouse: true
            persistentSelection: true
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
    property string id_polozhenie
    Rectangle{
        id: rec00
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
    }
    Rectangle{
        id: rec01
        anchors.top: rec00.top
        anchors.left: rec00.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_01
            anchors.centerIn: parent
            font.pixelSize: 20
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
        height: 30
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_02
            anchors.centerIn: parent
            font.pixelSize: 20
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
        height: 30
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_03
            anchors.centerIn: parent
            font.pixelSize: 20
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
        height: 30
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_04
            anchors.centerIn: parent
            font.pixelSize: 20
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
        height: 30
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_05
            anchors.centerIn: parent
            font.pixelSize: 20
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
        height: 30
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_06
            anchors.centerIn: parent
            font.pixelSize: 20
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
        height: 30
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_07
            anchors.centerIn: parent
            font.pixelSize: 20
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
        height: 30
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_08
            anchors.centerIn: parent
            font.pixelSize: 20
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
        height: 30
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_10
            anchors.centerIn: parent
            font.pixelSize: 20
            color: "white"
            text: rec_6.id_polozhenie == "2" ? "R1" : "В"
        }
    }
    Rectangle{
        id: rec20
        anchors.top: rec10.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_20
            anchors.centerIn: parent
            font.pixelSize: 20
            color: "white"
            text: rec_6.id_polozhenie == "2" ? "R2" : "П"
        }
    }
    Rectangle{
        id: rec30
        anchors.top: rec20.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_30
            anchors.centerIn: parent
            font.pixelSize: 20
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
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_11
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec21
        anchors.top: rec20.top
        anchors.left: rec20.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_21
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec31
        anchors.top: rec30.top
        anchors.left: rec30.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        //color: "#03a9f5"
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_31
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec12
        anchors.top: rec10.top
        anchors.left: rec11.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_12
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec22
        anchors.top: rec20.top
        anchors.left: rec21.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_22
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec32
        anchors.top: rec30.top
        anchors.left: rec31.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_32
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec13
        anchors.top: rec10.top
        anchors.left: rec12.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_13
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec23
        anchors.top: rec20.top
        anchors.left: rec22.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_23
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec33
        anchors.top: rec30.top
        anchors.left: rec32.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_33
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec14
        anchors.top: rec10.top
        anchors.left: rec13.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_14
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec24
        anchors.top: rec20.top
        anchors.left: rec23.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_24
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec34
        anchors.top: rec30.top
        anchors.left: rec33.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_34
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec15
        anchors.top: rec10.top
        anchors.left: rec14.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_15
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec25
        anchors.top: rec20.top
        anchors.left: rec24.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_25
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec35
        anchors.top: rec30.top
        anchors.left: rec34.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_35
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec16
        anchors.top: rec10.top
        anchors.left: rec15.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_16
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec26
        anchors.top: rec20.top
        anchors.left: rec25.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_26
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec36
        anchors.top: rec30.top
        anchors.left: rec35.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_36
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec17
        anchors.top: rec10.top
        anchors.left: rec16.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_17
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec27
        anchors.top: rec20.top
        anchors.left: rec26.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_27
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec37
        anchors.top: rec30.top
        anchors.left: rec36.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_37
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec18
        anchors.top: rec10.top
        anchors.left: rec17.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_18
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec28
        anchors.top: rec20.top
        anchors.left: rec27.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_28
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec38
        anchors.top: rec30.top
        anchors.left: rec37.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_38
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec40
        anchors.top: rec30.bottom
        anchors.topMargin: 15
        anchors.left: parent.left
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        color: "#03a9f5"
        Text {
            id: text_40
            anchors.centerIn: parent
            font.pixelSize: 20
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
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_41
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec42
        anchors.top: rec40.top
        anchors.left: rec41.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_42
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec43
        anchors.top: rec40.top
        anchors.left: rec42.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_43
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec44
        anchors.top: rec40.top
        anchors.left: rec43.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_44
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec45
        anchors.top: rec40.top
        anchors.left: rec44.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_45
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec46
        anchors.top: rec40.top
        anchors.left: rec45.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_46
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec47
        anchors.top: rec40.top
        anchors.left: rec46.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_47
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Rectangle{
        id: rec48
        anchors.top: rec40.top
        anchors.left: rec47.right
        anchors.leftMargin: 5
        width: (rec_6.width-50)/9
        height: 30
        radius: 10
        border.width: 1
        border.color: "#03a9f5"
        Text {
            id: tf_48
            anchors.centerIn: parent
            font.pixelSize: 20
            //font.italic: true
            color: "#3E65FF"
            property string tex: "неизвестно"
            property string tex1: tex !== "" ? tex: "-"
            text: tex1
        }
    }
    Text {
        id: text_rashod
        anchors.verticalCenter: tf_rashod.verticalCenter
        anchors.left: rec_6.left
        anchors.leftMargin: 5
        font.pixelSize: 20
        color: "#3E65FF"
        text: "Расход:"
    }
    Text {
        id: tf_rashod
        anchors.top: rec40.bottom
        anchors.topMargin: 5
        anchors.left: text_rashod.right
        anchors.leftMargin: 5
        font.pixelSize: 20
        font.italic: true
        color: "#3E65FF"
        property string tex: "неизвестно"
        property string tex1: tex !== "" ? tex: "-"
        text: tex1
    }
    Text {
        id: text_davl
        anchors.verticalCenter: tf_rashod.verticalCenter
        anchors.right: tf_davl.left
        anchors.rightMargin: 5
        font.pixelSize: 20
        color: "#3E65FF"
        text: "Давление:"
    }
    Text {
        id: tf_davl
        anchors.top: rec40.bottom
        anchors.topMargin: 5
        anchors.right: rec_6.right
        anchors.rightMargin: 5
        font.pixelSize: 20
        font.italic: true
        color: "#3E65FF"
        property string tex: "неизвестно"
        property string tex1: tex !== "" ? tex: "-"
        text: tex1
    }

}// end rec_6
Rectangle {
    id: rec_7
    anchors.top: rec_6.bottom
    anchors.left: rec_1.right
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    Text {
        id: text_prim
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.pixelSize: 20
        color: "#3E65FF"
        text: "Примечания:"
    }
    Flickable {
        id: flickable_prim
        flickableDirection: Flickable.VerticalFlick
        anchors.top: text_prim.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.topMargin: 5
        anchors.leftMargin: 5
        anchors.rightMargin: 5
        TextArea.flickable: TextArea {
            id: textArea_prim
            font.italic: true
            font.pixelSize: 20
            color: "#3E65FF"
            Material.accent: Material.LightBlue
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


            Component.onCompleted: {

                //combo_kks.model = model_kks
                mapper_openBI.addMapping(tf_kks, (0x0100+2), "tex1")
                mapper_openBI.addMapping(tf_date, (0x0100+3), "tex1")
                mapper_openBI.addMapping(tf_time, (0x0100+4), "tex1")
                mapper_openBI.addMapping(tf_rezhim, (0x0100+5), "tex1")
                mapper_openBI.addMapping(tf_tipizmer, (0x0100+6), "tex1")
                mapper_openBI.addMapping(tf_norm_ed, (0x0100+7), "tex1")
                mapper_openBI.addMapping(tf_norm_meh, (0x0100+8), "tex1")
                mapper_openBI.addMapping(textArea_laes, (0x0100+9), "text")
                mapper_openBI.addMapping(textArea_ate, (0x0100+10), "text")
                mapper_openBI.addMapping(tf_11, (0x0100+11), "tex1")
                mapper_openBI.addMapping(tf_21, (0x0100+12), "tex1")
                mapper_openBI.addMapping(tf_31, (0x0100+13), "tex1")
                mapper_openBI.addMapping(tf_12, (0x0100+14), "tex1")
                mapper_openBI.addMapping(tf_22, (0x0100+15), "tex1")
                mapper_openBI.addMapping(tf_32, (0x0100+16), "tex1")
                mapper_openBI.addMapping(tf_13, (0x0100+17), "tex1")
                mapper_openBI.addMapping(tf_23, (0x0100+18), "tex1")
                mapper_openBI.addMapping(tf_33, (0x0100+19), "tex1")
                mapper_openBI.addMapping(tf_14, (0x0100+20), "tex1")
                mapper_openBI.addMapping(tf_24, (0x0100+21), "tex1")
                mapper_openBI.addMapping(tf_34, (0x0100+22), "tex1")
                mapper_openBI.addMapping(tf_15, (0x0100+23), "tex1")
                mapper_openBI.addMapping(tf_25, (0x0100+24), "tex1")
                mapper_openBI.addMapping(tf_35, (0x0100+25), "tex1")
                mapper_openBI.addMapping(tf_16, (0x0100+26), "tex1")
                mapper_openBI.addMapping(tf_26, (0x0100+27), "tex1")
                mapper_openBI.addMapping(tf_36, (0x0100+28), "tex1")
                mapper_openBI.addMapping(tf_17, (0x0100+29), "tex1")
                mapper_openBI.addMapping(tf_27, (0x0100+30), "tex1")
                mapper_openBI.addMapping(tf_37, (0x0100+31), "tex1")
                mapper_openBI.addMapping(tf_18, (0x0100+32), "tex1")
                mapper_openBI.addMapping(tf_28, (0x0100+33), "tex1")
                mapper_openBI.addMapping(tf_38, (0x0100+34), "tex1")
                mapper_openBI.addMapping(tf_41, (0x0100+35), "tex1")
                mapper_openBI.addMapping(tf_42, (0x0100+36), "tex1")
                mapper_openBI.addMapping(tf_43, (0x0100+37), "tex1")
                mapper_openBI.addMapping(tf_44, (0x0100+38), "tex1")
                mapper_openBI.addMapping(tf_45, (0x0100+39), "tex1")
                mapper_openBI.addMapping(tf_46, (0x0100+40), "tex1")
                mapper_openBI.addMapping(tf_47, (0x0100+41), "tex1")
                mapper_openBI.addMapping(tf_48, (0x0100+42), "tex1")
                mapper_openBI.addMapping(tf_rashod, (0x0100+43), "tex1")
                mapper_openBI.addMapping(tf_davl, (0x0100+44), "tex1")
                mapper_openBI.addMapping(textArea_prim, (0x0100+45), "text")
                mapper_openBI.addMapping(rec_6, (0x0100+47), "id_polozhenie")
                //mapper_openBI.addMapping(combo_kks, (0x0100+46), "id")
                tf_norm_ed.text = tf_norm_ed.text.replace(".",",")
                tf_norm_meh.text = tf_norm_meh.text.replace(".",",")
                tf_11.text = tf_11.text.replace(".",",")
                tf_21.text = tf_21.text.replace(".",",")
                tf_31.text = tf_31.text.replace(".",",")
                tf_12.text = tf_12.text.replace(".",",")
                tf_22.text = tf_22.text.replace(".",",")
                tf_32.text = tf_32.text.replace(".",",")
                tf_13.text = tf_13.text.replace(".",",")
                tf_23.text = tf_23.text.replace(".",",")
                tf_33.text = tf_33.text.replace(".",",")
                tf_14.text = tf_14.text.replace(".",",")
                tf_24.text = tf_24.text.replace(".",",")
                tf_34.text = tf_34.text.replace(".",",")
                tf_15.text = tf_15.text.replace(".",",")
                tf_25.text = tf_25.text.replace(".",",")
                tf_35.text = tf_35.text.replace(".",",")
                tf_16.text = tf_16.text.replace(".",",")
                tf_26.text = tf_26.text.replace(".",",")
                tf_36.text = tf_36.text.replace(".",",")
                tf_17.text = tf_17.text.replace(".",",")
                tf_27.text = tf_27.text.replace(".",",")
                tf_37.text = tf_37.text.replace(".",",")
                tf_18.text = tf_18.text.replace(".",",")
                tf_28.text = tf_28.text.replace(".",",")
                tf_38.text = tf_38.text.replace(".",",")
                tf_41.text = tf_41.text.replace(".",",")
                tf_42.text = tf_42.text.replace(".",",")
                tf_43.text = tf_43.text.replace(".",",")
                tf_44.text = tf_44.text.replace(".",",")
                tf_45.text = tf_45.text.replace(".",",")
                tf_46.text = tf_46.text.replace(".",",")
                tf_47.text = tf_47.text.replace(".",",")
                tf_48.text = tf_48.text.replace(".",",")

            }

}

