import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import QtDataVisualization 1.2
import QtCharts 2.0
import QtQml.Models 2.2


Item {
    id: item
    Page {
        id: open
        anchors.fill: parent
        Component.onCompleted: {
            stackView.rezhim_id = ""
            qmlSignal_baza_id()
        }

        SwipeView {
            id: swipeView1
            //anchors.fill: parent
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: tabBar1.top
            currentIndex: tabBar1.currentIndex
            Item {
                id: item1
                Rectangle {
                    id: rec_1
                    anchors.fill: parent
    Text {
        id: text_kks
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.pixelSize: 30
        font.bold: true
        color: "#3E65FF"
        property string tex: "неизвестно"
        property string tex1: tex !== "" ? tex: "-"
        text: tex1
    }
    Text {
        id: t_ceh
        anchors.top: text_kks.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.pixelSize: 20
        color: "#3E65FF"
        text: "Цех: "
    }
    Text {
        id: text_ceh
        anchors.top: text_kks.bottom
        anchors.topMargin: 20
        anchors.left: t_pom.right
        anchors.leftMargin: 5
        font.pixelSize: 20
        font.italic: true
        color: "#3E65FF"
        property string tex: "неизвестно"
        property string tex1: tex !== "" ? tex: "-"
        text: tex1
    }
    Text {
        id: t_zd
        anchors.top: t_ceh.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.pixelSize: 20
        color: "#3E65FF"
        text: "Здание: "
    }
    Text {
        id: text_zd
        anchors.top: t_ceh.bottom
        anchors.topMargin: 5
        anchors.left: t_pom.right
        anchors.leftMargin: 5
        font.pixelSize: 20
        font.italic: true
        color: "#3E65FF"
        property string tex: "неизвестно"
        property string tex1: tex !== "" ? tex: "-"
        text: tex1
    }
    Text {
        id: t_pom
        anchors.top: t_zd.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.pixelSize: 20
        color: "#3E65FF"
        text: "Помещение: "
    }
    Text {
        id: text_pom
        anchors.top: t_zd.bottom
        anchors.topMargin: 5
        anchors.left: t_pom.right
        anchors.leftMargin: 5
        font.pixelSize: 20
        font.italic: true
        color: "#3E65FF"
        property string tex: "неизвестно"
        property string tex1: tex !== "" ? tex: "-"
        text: tex1
    }
    Text {
        id: t_opis
        anchors.top: t_pom.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.pixelSize: 20
        color: "#3E65FF"
        text: "Наименование: "
    }
    Text {
        id: text_opis
        anchors.top: t_opis.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        width: parent.width/2
        font.pixelSize: 20
        font.italic: true
        wrapMode: Text.WordWrap
        color: "#3E65FF"
        property string tex: "неизвестно"
        property string tex1: tex !== "" ? tex: "-"
        text: tex1
    }
    Text {
        id: t_kb
        anchors.top: text_opis.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.pixelSize: 20
        color: "#3E65FF"
        text: "Класс безопасности: "
    }
    Text {
        id: text_kb
        anchors.top: text_opis.bottom
        anchors.topMargin: 20
        anchors.left: t_kb.right
        anchors.leftMargin: 5
        width: parent.width/2
        font.pixelSize: 20
        font.italic: true
        wrapMode: Text.WordWrap
        color: "#3E65FF"
        property string tex: "неизвестно"
        property string tex1: tex !== "" ? tex: "-"
        text: tex1
    }
    Text {
        id: t_program
        anchors.top: t_kb.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.pixelSize: 20
        color: "#3E65FF"
        text: "Программа ПНР: "
    }
    Text {
        id: text_program
        anchors.top: t_kb.bottom
        anchors.topMargin: 5
        anchors.left: t_program.right
        anchors.leftMargin: 5
        width: parent.width/2
        font.pixelSize: 20
        font.italic: true
        wrapMode: Text.WordWrap
        color: "#3E65FF"
        property string tex: "неизвестно"
        property string tex1: tex !== "" ? tex: "-"
        text: tex1
    }
    Text {
        id: t_fio
        anchors.top: t_program.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.pixelSize: 20
        color: "#3E65FF"
        text: "Заполнил: "
    }
    Text {
        id: text_fio
        anchors.top: t_program.bottom
        anchors.topMargin: 5
        anchors.left: t_fio.right
        anchors.leftMargin: 5
        width: parent.width/2
        font.pixelSize: 20
        font.italic: true
        wrapMode: Text.WordWrap
        color: "#3E65FF"
        property string tex: "неизвестно"
        property string tex1: tex !== "" ? tex: "-"
        text: tex1
    }
    Text {
        id: t_prim
        anchors.top: t_fio.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.pixelSize: 20
        color: "#3E65FF"
        text: "Примечания: "
    }
    Rectangle {
        id: rec_prim
        anchors.top: t_prim.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        width: parent.width/2
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        Flickable {
            id: flickable
            flickableDirection: Flickable.VerticalFlick
            anchors.fill: parent
            TextArea.flickable: TextArea {
                id: textArea_prim
                textFormat: Qt.PlainText//RichText
                wrapMode: TextArea.Wrap
                focus: false
                readOnly: true
                font.pixelSize: 20
                color: "#3E65FF"
                //selectByMouse: true
                //persistentSelection: true
            }
            ScrollBar.vertical: ScrollBar {
            width: 10
            }
        }
    }
    Rectangle {
        id: rec_foto
        anchors.right: parent.right
        anchors.top: parent.top
        width: parent.width/2
        height: parent.height/2
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: rec_butf.visible = true
            onExited: rec_butf.visible = false
        }

        Image {
            id: rec_butf
            visible: false
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: height
            height: 32
            z: 1
            fillMode: Image.PreserveAspectFit
            source: "file:./Images/icon_64+.png"
        MouseArea {
            id: ma_f
            anchors.fill: parent
        //hoverEnabled: true
//        onEntered: {
//            rec_butf.height = 64
//        }
//        onExited: {
//            rec_butf.height = 32
//        }

        onClicked: {
            if(ma_foto.scale === false){
                rec_foto.anchors.right = rec_1.right
                rec_foto.anchors.top = rec_1.top
                rec_foto.width = rec_1.width
                rec_foto.height = rec_1.height
                ma_foto.scale = true
                rec_butf.source = "file:./Images/icon_64-.png"
            } else
            if(ma_foto.scale === true){
                rec_foto.anchors.right = rec_1.right
                rec_foto.anchors.top = rec_1.top
                rec_foto.width = rec_1.width/2
                rec_foto.height = rec_1.height/2
                ma_foto.scale = false
                rec_butf.source = "file:./Images/icon_64+.png"}
            }
        }
}

    Image {
     id: im_foto
     anchors.right: parent.right
     anchors.top: parent.top
     width: parent.width
     height: parent.height
     fillMode: Image.PreserveAspectFit
     property string tex: ""
     property string tex1: "file:." + im_foto.tex.replace(/\\/g, "/")
     property string tex2: tex1 !== "file:." ? tex1: "file:./Images/nophoto.jpg"
     source: tex2
    }

     MouseArea {
         id: ma_foto
         property bool scale: false
         anchors.fill: parent
         onDoubleClicked: {
             if(ma_foto.scale === false){
                 rec_foto.anchors.right = rec_1.right
                 rec_foto.anchors.top = rec_1.top
                 rec_foto.width = rec_1.width
                 rec_foto.height = rec_1.height
                 ma_foto.scale = true
             } else
             if(ma_foto.scale === true){
                 rec_foto.anchors.right = rec_1.right
                 rec_foto.anchors.top = rec_1.top
                 rec_foto.width = rec_1.width/2
                 rec_foto.height = rec_1.height/2
                 ma_foto.scale = false
             }
         }
     }
    }
    Rectangle {
        id: rec_shema
        anchors.right: parent.right
        anchors.top: rec_foto.bottom
        width: parent.width/2
        height: parent.height/2
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: rec_buts.visible = true
            onExited: rec_buts.visible = false
        }
        Image {
            id: rec_buts
            visible: false
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: height
            height: 32
            z: 1
            fillMode: Image.PreserveAspectFit
            source: "file:./Images/icon_64+.png"
        MouseArea {
            anchors.fill: parent
        //hoverEnabled: true
//        onEntered: {
//            rec_buts.height = 64
//        }
//        onExited: {
//            rec_buts.height = 32
//        }

        onClicked: {
            if(ma_shema.scale === false){
                rec_shema.anchors.right = rec_1.right
                rec_shema.anchors.top = rec_1.top
                rec_shema.width = rec_1.width
                rec_shema.height = rec_1.height
                ma_shema.scale = true
                rec_buts.source = "file:./Images/icon_64-.png"
            } else
                if(ma_shema.scale === true){
                    rec_shema.anchors.right = rec_1.right
                    rec_shema.anchors.top = rec_foto.bottom
                    rec_shema.width = rec_1.width/2
                    rec_shema.height = rec_1.height/2
                    ma_shema.scale = false
                rec_buts.source = "file:./Images/icon_64+.png"}
            }
        }
}

    Image {
     id: im_shema
     anchors.right: parent.right
     anchors.top: parent.top
     width: parent.width
     height: parent.height
     fillMode: Image.PreserveAspectFit
     property string tex: ""
     property string tex1: "file:." + im_shema.tex.replace(/\\/g, "/")
     property string tex2: tex1 !== "file:." ? tex1: "file:./Images/nophoto.jpg"
     source: tex2
    }

     MouseArea {
         id: ma_shema
         property bool scale: false
         anchors.fill: parent
         onDoubleClicked: {
             if(ma_shema.scale === false){
                 rec_shema.anchors.right = rec_1.right
                 rec_shema.anchors.top = rec_1.top
                 rec_shema.width = rec_1.width
                 rec_shema.height = rec_1.height
                 ma_shema.scale = true
             } else
             if(ma_shema.scale === true){
                 rec_shema.anchors.right = rec_1.right
                 rec_shema.anchors.top = rec_foto.bottom
                 rec_shema.width = rec_1.width/2
                 rec_shema.height = rec_1.height/2
                 ma_shema.scale = false
             }
         }
     }
    }
                }
            } //item1
            Item {
                id: item2
                Rectangle {
                    id: rec_2
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    width: parent.width/2
    Text {
        id: text_kks2
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.pixelSize: 30
        font.bold: true
        color: "#3E65FF"
        property string tex: "неизвестно"
        property string tex1: tex !== "" ? tex: "-"
        text: tex1
    }
    Rectangle {
     id: rec_ed
     anchors.top: text_kks2.bottom
     anchors.topMargin: 5
     anchors.left: parent.left
     anchors.leftMargin: 5
     anchors.right: parent.right
     anchors.rightMargin: 5
     border.width: 1
     border.color: "#3E65FF"
     radius: 10
     height: text_marka_ed.height + text_mosch.height + text_chastota_ed.height + text_proizv_ed.height + 25
     Text {
         id: t_marka_ed
         anchors.top: parent.top
         anchors.topMargin: 5
         anchors.left: parent.left
         anchors.leftMargin: 5
         font.pixelSize: 20
         color: "#3E65FF"
         text: "Марка электродвигателя: "
     }
     Text {
         id: text_marka_ed
         anchors.top: parent.top
         anchors.topMargin: 5
         anchors.left: t_marka_ed.right
         anchors.leftMargin: 5
         anchors.right: parent.right
         anchors.rightMargin: 5
         font.pixelSize: 20
         font.italic: true
         wrapMode: Text.WordWrap
         color: "#3E65FF"
         property string tex: "неизвестно"
         property string tex1: tex !== "" ? tex: "-"
         text: tex1
     }
     Text {
         id: t_mosch
         anchors.top: text_marka_ed.bottom
         anchors.topMargin: 5
         anchors.left: parent.left
         anchors.leftMargin: 5
         font.pixelSize: 20
         color: "#3E65FF"
         text: "Мощность, кВт: "
     }
     Text {
         id: text_mosch
         anchors.top: text_marka_ed.bottom
         anchors.topMargin: 5
         anchors.left: t_mosch.right
         anchors.leftMargin: 5
         anchors.right: parent.right
         anchors.rightMargin: 5
         font.pixelSize: 20
         font.italic: true
         wrapMode: Text.WordWrap
         color: "#3E65FF"
         property string tex: "неизвестно"
         property string tex1: tex !== "" ? tex: "-"
         text: tex1
     }
     Text {
         id: t_chastota_ed
         anchors.top: text_mosch.bottom
         anchors.topMargin: 5
         anchors.left: parent.left
         anchors.leftMargin: 5
         font.pixelSize: 20
         color: "#3E65FF"
         text: "Частота вращения, об/мин: "
     }
     Text {
         id: text_chastota_ed
         anchors.top: text_mosch.bottom
         anchors.topMargin: 5
         anchors.left: t_chastota_ed.right
         anchors.leftMargin: 5
         anchors.right: parent.right
         anchors.rightMargin: 5
         font.pixelSize: 20
         font.italic: true
         wrapMode: Text.WordWrap
         color: "#3E65FF"
         property string tex: "неизвестно"
         property string tex1: tex !== "" ? tex: "-"
         text: tex1
     }
     Text {
         id: t_proizv_ed
         anchors.top: text_chastota_ed.bottom
         anchors.topMargin: 5
         anchors.left: parent.left
         anchors.leftMargin: 5
         font.pixelSize: 20
         color: "#3E65FF"
         text: "Производитель: "
     }
     Text {
         id: text_proizv_ed
         anchors.top: text_chastota_ed.bottom
         anchors.topMargin: 5
         anchors.left: t_proizv_ed.right
         anchors.leftMargin: 5
         anchors.right: parent.right
         anchors.rightMargin: 5
         font.pixelSize: 20
         font.italic: true
         wrapMode: Text.WordWrap
         color: "#3E65FF"
         property string tex: "неизвестно"
         property string tex1: tex !== "" ? tex: "-"
         text: tex1
     }
    }
    Rectangle {
     id: rec_per
     anchors.top: rec_ed.bottom
     anchors.topMargin: 5
     anchors.left: parent.left
     anchors.leftMargin: 5
     anchors.right: parent.right
     anchors.rightMargin: 5
     border.width: 1
     border.color: "#3E65FF"
     radius: 10
     height: text_tip_permeh.height + text_tip_per.height + text_kolpal.height + 20
     Text {
         id: t_tip_permeh
         anchors.top: parent.top
         anchors.topMargin: 5
         anchors.left: parent.left
         anchors.leftMargin: 5
         font.pixelSize: 20
         color: "#3E65FF"
         text: "Тип передаточного механизма: "
     }
     Text {
         id: text_tip_permeh
         anchors.top: parent.top
         anchors.topMargin: 5
         anchors.left: t_tip_permeh.right
         anchors.leftMargin: 5
         anchors.right: parent.right
         anchors.rightMargin: 5
         font.pixelSize: 20
         font.italic: true
         wrapMode: Text.WordWrap
         color: "#3E65FF"
         property string tex: "неизвестно"
         property string tex1: tex !== "" ? tex: "-"
         text: tex1
     }
     Text {
         id: t_tip_per
         anchors.top: text_tip_permeh.bottom
         anchors.topMargin: 5
         anchors.left: parent.left
         anchors.leftMargin: 5
         font.pixelSize: 20
         color: "#3E65FF"
         text: "Тип передачи: "
     }
     Text {
         id: text_tip_per
         anchors.top: text_tip_permeh.bottom
         anchors.topMargin: 5
         anchors.left: t_tip_per.right
         anchors.leftMargin: 5
         anchors.right: parent.right
         anchors.rightMargin: 5
         font.pixelSize: 20
         font.italic: true
         wrapMode: Text.WordWrap
         color: "#3E65FF"
         property string tex: "неизвестно"
         property string tex1: tex !== "" ? tex: "-"
         text: tex1
     }
     Text {
         id: t_kolpal
         anchors.top: text_tip_per.bottom
         anchors.topMargin: 5
         anchors.left: parent.left
         anchors.leftMargin: 5
         font.pixelSize: 20
         color: "#3E65FF"
         text: "Количество пальцев муфты: "
     }
     Text {
         id: text_kolpal
         anchors.top: text_tip_per.bottom
         anchors.topMargin: 5
         anchors.left: t_kolpal.right
         anchors.leftMargin: 5
         anchors.right: parent.right
         anchors.rightMargin: 5
         font.pixelSize: 20
         font.italic: true
         wrapMode: Text.WordWrap
         color: "#3E65FF"
         property string tex: "неизвестно"
         property string tex1: tex !== "" ? tex: "-"
         text: tex1
     }
    }
    Rectangle {
     id: rec_meh
     anchors.top: rec_per.bottom
     anchors.topMargin: 5
     anchors.left: parent.left
     anchors.leftMargin: 5
     anchors.right: parent.right
     anchors.rightMargin: 5
     border.width: 1
     border.color: "#3E65FF"
     radius: 10
     height: text_tip_meh.height + text_marka_meh.height + text_chastota_meh.height + text_kollop.height +
             text_isp.height + text_tip_opory.height + text_proizv_meh.height + 40
     Text {
         id: t_tip_meh
         anchors.top: parent.top
         anchors.topMargin: 5
         anchors.left: parent.left
         anchors.leftMargin: 5
         font.pixelSize: 20
         color: "#3E65FF"
         text: "Тип исполнительного механизма: "
     }
     Text {
         id: text_tip_meh
         anchors.top: parent.top
         anchors.topMargin: 5
         anchors.left: t_tip_meh.right
         anchors.leftMargin: 5
         anchors.right: parent.right
         anchors.rightMargin: 5
         font.pixelSize: 20
         font.italic: true
         wrapMode: Text.WordWrap
         color: "#3E65FF"
         property string tex: "неизвестно"
         property string tex1: tex !== "" ? tex: "-"
         text: tex1
     }
     Text {
         id: t_marka_meh
         anchors.top: text_tip_meh.bottom
         anchors.topMargin: 5
         anchors.left: parent.left
         anchors.leftMargin: 5
         font.pixelSize: 20
         color: "#3E65FF"
         text: "Марка: "
     }
     Text {
         id: text_marka_meh
         anchors.top: text_tip_meh.bottom
         anchors.topMargin: 5
         anchors.left: t_marka_meh.right
         anchors.leftMargin: 5
         anchors.right: parent.right
         anchors.rightMargin: 5
         font.pixelSize: 20
         font.italic: true
         wrapMode: Text.WordWrap
         color: "#3E65FF"
         property string tex: "неизвестно"
         property string tex1: tex !== "" ? tex: "-"
         text: tex1
     }
     Text {
         id: t_chastota_meh
         anchors.top: text_marka_meh.bottom
         anchors.topMargin: 5
         anchors.left: parent.left
         anchors.leftMargin: 5
         font.pixelSize: 20
         color: "#3E65FF"
         text: "Частота вращения, об/мин: "
     }
     Text {
         id: text_chastota_meh
         anchors.top: text_marka_meh.bottom
         anchors.topMargin: 5
         anchors.left: t_chastota_meh.right
         anchors.leftMargin: 5
         anchors.right: parent.right
         anchors.rightMargin: 5
         font.pixelSize: 20
         font.italic: true
         wrapMode: Text.WordWrap
         color: "#3E65FF"
         property string tex: "неизвестно"
         property string tex1: tex !== "" ? tex: "-"
         text: tex1
     }
     Text {
         id: t_kollop
         anchors.top: text_chastota_meh.bottom
         anchors.topMargin: 5
         anchors.left: parent.left
         anchors.leftMargin: 5
         font.pixelSize: 20
         color: "#3E65FF"
         text: "Количество лопастей: "
     }
     Text {
         id: text_kollop
         anchors.top: text_chastota_meh.bottom
         anchors.topMargin: 5
         anchors.left: t_kollop.right
         anchors.leftMargin: 5
         anchors.right: parent.right
         anchors.rightMargin: 5
         font.pixelSize: 20
         font.italic: true
         wrapMode: Text.WordWrap
         color: "#3E65FF"
         property string tex: "неизвестно"
         property string tex1: tex !== "" ? tex: "-"
         text: tex1
     }
     Text {
         id: t_isp
         anchors.top: text_kollop.bottom
         anchors.topMargin: 5
         anchors.left: parent.left
         anchors.leftMargin: 5
         font.pixelSize: 20
         color: "#3E65FF"
         text: "Исполнение: "
     }
     Text {
         id: text_isp
         anchors.top: text_kollop.bottom
         anchors.topMargin: 5
         anchors.left: t_isp.right
         anchors.leftMargin: 5
         anchors.right: parent.right
         anchors.rightMargin: 5
         font.pixelSize: 20
         font.italic: true
         wrapMode: Text.WordWrap
         color: "#3E65FF"
         property string tex: "неизвестно"
         property string tex1: tex !== "" ? tex: "-"
         text: tex1
     }
     Text {
         id: t_tip_opory
         anchors.top: text_isp.bottom
         anchors.topMargin: 5
         anchors.left: parent.left
         anchors.leftMargin: 5
         font.pixelSize: 20
         color: "#3E65FF"
         text: "Тип опоры: "
     }
     Text {
         id: text_tip_opory
         anchors.top: text_isp.bottom
         anchors.topMargin: 5
         anchors.left: t_tip_opory.right
         anchors.leftMargin: 5
         anchors.right: parent.right
         anchors.rightMargin: 5
         font.pixelSize: 20
         font.italic: true
         wrapMode: Text.WordWrap
         color: "#3E65FF"
         property string tex: "неизвестно"
         property string tex1: tex !== "" ? tex: "-"
         text: tex1
     }
     Text {
         id: t_proizv_meh
         anchors.top: text_tip_opory.bottom
         anchors.topMargin: 5
         anchors.left: parent.left
         anchors.leftMargin: 5
         font.pixelSize: 20
         color: "#3E65FF"
         text: "Производитель: "
     }
     Text {
         id: text_proizv_meh
         anchors.top: text_tip_opory.bottom
         anchors.topMargin: 5
         anchors.left: t_proizv_meh.right
         anchors.leftMargin: 5
         anchors.right: parent.right
         anchors.rightMargin: 5
         font.pixelSize: 20
         font.italic: true
         wrapMode: Text.WordWrap
         color: "#3E65FF"
         property string tex: "неизвестно"
         property string tex1: tex !== "" ? tex: "-"
         text: tex1
     }
    }
                } //rec_2
                Rectangle {
                    id: rec_3
                    anchors.top: parent.top
                    anchors.left: rec_2.right
                    anchors.bottom: parent.bottom
                    width: parent.width/2
                    Rectangle {
                        id: rect11
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_rezhim.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#3E65FF"
                        radius: 10
                        Text {
                            id: text_rezhim
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "Режим работы"
                        }
                    }
                    Rectangle {
                        id: rect21
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.left: rect11.right
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_nominal.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#3E65FF"
                        radius: 10
                        Text {
                            id: text_nominal
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "Номинальный"
                        }
                    }
                    Rectangle {
                        id: rect31
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.left: rect21.right
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_rabdiap.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#3E65FF"
                        radius: 10
                        Text {
                            id: text_rabdiap
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "Раб. диапазон"
                        }
                    }
                    Rectangle {
                        id: rect12
                        anchors.top: rect11.bottom
                        anchors.topMargin: 2
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_napor.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_napor
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "Напор, м(МПа)"
                        }
                    }
                    Rectangle {
                        id: rect22
                        anchors.top: rect11.bottom
                        anchors.topMargin: 2
                        anchors.left: rect12.right
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_napor.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_napor_nom
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            property string tex: "неизвестно"
                            property string tex1: tex !== "" ? tex: "-"
                            text: tex1
                        }
                    }
                    Rectangle {
                        id: rect32
                        anchors.top: rect11.bottom
                        anchors.topMargin: 2
                        anchors.left: rect22.right
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_napor.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_napor_rd
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            property string tex: "неизвестно"
                            property string tex1: tex !== "" ? tex: "-"
                            text: tex1
                        }
                    }
                    Rectangle {
                        id: rect13
                        anchors.top: rect12.bottom
                        anchors.topMargin: 2
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_rashod.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_rashod
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "Расход, м³/ч"
                        }
                    }
                    Rectangle {
                        id: rect23
                        anchors.top: rect12.bottom
                        anchors.topMargin: 2
                        anchors.left: rect13.right
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_rashod.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_rashod_nom
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            property string tex: "неизвестно"
                            property string tex1: tex !== "" ? tex: "-"
                            text: tex1
                        }
                    }
                    Rectangle {
                        id: rect33
                        anchors.top: rect12.bottom
                        anchors.topMargin: 2
                        anchors.left: rect23.right
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_rashod.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_rashod_rd
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            property string tex: "неизвестно"
                            property string tex1: tex !== "" ? tex: "-"
                            text: tex1
                        }
                    }
                    Rectangle {
                        id: recv11
                        anchors.top: rect13.bottom
                        anchors.topMargin: 30
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#3E65FF"
                        radius: 10
                        Text {
                            id: text_norm_vibr
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "Нормы вибрации"
                        }
                    }
                    Rectangle {
                        id: recv21
                        anchors.top: rect13.bottom
                        anchors.topMargin: 30
                        anchors.left: recv11.right
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#3E65FF"
                        radius: 10
                        Text {
                            id: text_ed
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "Эл/дв"
                        }
                    }
                    Rectangle {
                        id: recv31
                        anchors.top: rect13.bottom
                        anchors.topMargin: 30
                        anchors.left: recv21.right
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#3E65FF"
                        radius: 10
                        Text {
                            id: text_agr
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "Агрегат"
                        }
                    }
                    Rectangle {
                        id: recv12
                        anchors.top: recv11.bottom
                        anchors.topMargin: 2
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#3E65FF"
                        radius: 10
                        Text {
                            id: text_hh
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "Холостой ход"
                        }
                    }
                    Rectangle {
                        id: recv13
                        anchors.top: recv12.bottom
                        anchors.topMargin: 2
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_norm1
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "Норма"
                        }
                    }
                    Rectangle {
                        id: recv23
                        anchors.top: recv12.bottom
                        anchors.topMargin: 2
                        anchors.left: recv13.right
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_norm_hh
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            property string tex: "неизвестно"
                            property string tex1: tex !== "" ? tex: "-"
                            text: tex1
                        }
                    }
                    Rectangle {
                        id: recv14
                        anchors.top: recv13.bottom
                        anchors.topMargin: 2
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#3E65FF"
                        radius: 10
                        Text {
                            id: text_nom_rezhim
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "Номинальный режим"
                        }
                    }
                    Rectangle {
                        id: recv15
                        anchors.top: recv14.bottom
                        anchors.topMargin: 2
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_norm2
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "Норма"
                        }
                    }
                    Rectangle {
                        id: recv25
                        anchors.top: recv14.bottom
                        anchors.topMargin: 2
                        anchors.left: recv15.right
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_normed_nom
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            property string tex: "неизвестно"
                            property string tex1: tex !== "" ? tex: "-"
                            text: tex1
                        }
                    }
                    Rectangle {
                        id: recv35
                        anchors.top: recv14.bottom
                        anchors.topMargin: 2
                        anchors.left: recv25.right
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_normagr_nom
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            property string tex: "неизвестно"
                            property string tex1: tex !== "" ? tex: "-"
                            text: tex1
                        }
                    }
                    Rectangle {
                        id: recv16
                        anchors.top: recv15.bottom
                        anchors.topMargin: 2
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_ogr1
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "Ограничение"
                        }
                    }
                    Rectangle {
                        id: recv26
                        anchors.top: recv15.bottom
                        anchors.topMargin: 2
                        anchors.left: recv16.right
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_ogred_nom
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            property string tex: "неизвестно"
                            property string tex1: tex !== "" ? tex: "-"
                            text: tex1
                        }
                    }
                    Rectangle {
                        id: recv36
                        anchors.top: recv15.bottom
                        anchors.topMargin: 2
                        anchors.left: recv26.right
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_ogragr_nom
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            property string tex: "неизвестно"
                            property string tex1: tex !== "" ? tex: "-"
                            text: tex1
                        }
                    }
                    Rectangle {
                        id: recv17
                        anchors.top: recv16.bottom
                        anchors.topMargin: 2
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_otkaz1
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "Отказ"
                        }
                    }
                    Rectangle {
                        id: recv27
                        anchors.top: recv16.bottom
                        anchors.topMargin: 2
                        anchors.left: recv17.right
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_otkazed_nom
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            property string tex: "неизвестно"
                            property string tex1: tex !== "" ? tex: "-"
                            text: tex1
                        }
                    }
                    Rectangle {
                        id: recv37
                        anchors.top: recv16.bottom
                        anchors.topMargin: 2
                        anchors.left: recv27.right
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_otkazagr_nom
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            property string tex: "неизвестно"
                            property string tex1: tex !== "" ? tex: "-"
                            text: tex1
                        }
                    }
                    Rectangle {
                        id: recv18
                        anchors.top: recv17.bottom
                        anchors.topMargin: 2
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#3E65FF"
                        radius: 10
                        Text {
                            id: text_rd_rezhim
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "Рабочий диапазон"
                        }
                    }
                    Rectangle {
                        id: recv19
                        anchors.top: recv18.bottom
                        anchors.topMargin: 2
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_norm3
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "Норма"
                        }
                    }
                    Rectangle {
                        id: recv29
                        anchors.top: recv18.bottom
                        anchors.topMargin: 2
                        anchors.left: recv19.right
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_normed_rd
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            property string tex: "неизвестно"
                            property string tex1: tex !== "" ? tex: "-"
                            text: tex1
                        }
                    }
                    Rectangle {
                        id: recv39
                        anchors.top: recv18.bottom
                        anchors.topMargin: 2
                        anchors.left: recv29.right
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_normagr_rd
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            property string tex: "неизвестно"
                            property string tex1: tex !== "" ? tex: "-"
                            text: tex1
                        }
                    }
                    Rectangle {
                        id: recv110
                        anchors.top: recv19.bottom
                        anchors.topMargin: 2
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_ogr2
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "Ограничение"
                        }
                    }
                    Rectangle {
                        id: recv210
                        anchors.top: recv19.bottom
                        anchors.topMargin: 2
                        anchors.left: recv110.right
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_ogred_rd
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            property string tex: "неизвестно"
                            property string tex1: tex !== "" ? tex: "-"
                            text: tex1
                        }
                    }
                    Rectangle {
                        id: recv310
                        anchors.top: recv19.bottom
                        anchors.topMargin: 2
                        anchors.left: recv210.right
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_ogragr_rd
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            property string tex: "неизвестно"
                            property string tex1: tex !== "" ? tex: "-"
                            text: tex1
                        }
                    }
                    Rectangle {
                        id: recv111
                        anchors.top: recv110.bottom
                        anchors.topMargin: 2
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_otkaz2
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "Отказ"
                        }
                    }
                    Rectangle {
                        id: recv211
                        anchors.top: recv110.bottom
                        anchors.topMargin: 2
                        anchors.left: recv111.right
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_otkazed_rd
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            property string tex: "неизвестно"
                            property string tex1: tex !== "" ? tex: "-"
                            text: tex1
                        }
                    }
                    Rectangle {
                        id: recv311
                        anchors.top: recv110.bottom
                        anchors.topMargin: 2
                        anchors.left: recv211.right
                        anchors.leftMargin: 5
                        width: parent.width/3 - 20/3
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_otkazagr_rd
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            property string tex: "неизвестно"
                            property string tex1: tex !== "" ? tex: "-"
                            text: tex1
                        }
                    }
                    Rectangle {
                        id: recv112
                        anchors.top: recv111.bottom
                        anchors.topMargin: 30
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#3E65FF"
                        radius: 10
                        Text {
                            id: text_temp_otkaz
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "Температура отказа"
                        }
                    }
                    Rectangle {
                        id: recv113
                        anchors.top: recv112.bottom
                        anchors.topMargin: 2
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        width: parent.width/2 - 15/2
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_temp_ed
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "Электродвигатель"
                        }
                    }
                    Rectangle {
                        id: recv213
                        anchors.top: recv112.bottom
                        anchors.topMargin: 2
                        anchors.left: recv113.right
                        anchors.leftMargin: 5
                        width: parent.width/2 - 15/2
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_tempotkaz_ed
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            property string tex: "неизвестно"
                            property string tex1: tex !== "" ? tex: "-"
                            text: tex1
                        }
                    }
                    Rectangle {
                        id: recv114
                        anchors.top: recv113.bottom
                        anchors.topMargin: 2
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        width: parent.width/2 - 15/2
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_temp_red
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "Редуктор"
                        }
                    }
                    Rectangle {
                        id: recv214
                        anchors.top: recv113.bottom
                        anchors.topMargin: 2
                        anchors.left: recv114.right
                        anchors.leftMargin: 5
                        width: parent.width/2 - 15/2
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_tempotkaz_red
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            property string tex: "неизвестно"
                            property string tex1: tex !== "" ? tex: "-"
                            text: tex1
                        }
                    }
                    Rectangle {
                        id: recv115
                        anchors.top: recv114.bottom
                        anchors.topMargin: 2
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        width: parent.width/2 - 15/2
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_temp_meh
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            text: "Механизм"
                        }
                    }
                    Rectangle {
                        id: recv215
                        anchors.top: recv114.bottom
                        anchors.topMargin: 2
                        anchors.left: recv115.right
                        anchors.leftMargin: 5
                        width: parent.width/2 - 15/2
                        height: text_norm_vibr.height + 5
                        border.width: 1
                        border.color: "#3E65FF"
                        color: "#7995f1"
                        radius: 10
                        Text {
                            id: text_tempotkaz_meh
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                            color: "white"
                            property string tex: "неизвестно"
                            property string tex1: tex !== "" ? tex: "-"
                            text: tex1
                        }
                    }



                } //rec_3
            } //item2
            Item {
                id: item3
            } //item3
            Item {
                id: item4
                Component.onCompleted: {
                    newindex = list1.currentIndex
                    item4.editEntry(newindex)
                }

                Rectangle {
                    id: rec_4
                    anchors.top: parent.top
                    anchors.left: parent.left
                    height: parent.height/3
                    width: parent.width/2
                    //color: "lightblue"
                    Text {
                        id: text_izmer_kks
                        anchors.verticalCenter: combo_rezhim.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        font.pixelSize: 30
                        font.bold: true
                        color: "#3E65FF"
                        property string tex: "неизвестно"
                        property string tex1: tex !== "" ? tex: "-"
                        text: tex1
                    }
                    Rectangle {
                        id: rec_vybor
                        anchors.verticalCenter: text_izmer_kks.verticalCenter
                        x: parent.width - t_vybor.width - 15
                        width: t_vybor.width + 10
                        height: combo_rezhim.height - 5
                        border.color: "#3E65FF"
                        radius: 10
                        //color: "red"
                        Text {
                            id: t_vybor
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            //width: parent.width
                            wrapMode: Text.WordWrap
                            font.pixelSize: 15
                            color: "#3E65FF"
                            text: "<< Режим?"
                        }
                        MouseArea {
                            id: ma_vybor
                            anchors.fill: parent
                            hoverEnabled: true
                            property int xxx
                            NumberAnimation {
                                id: anim_vybor1
                                target: rec_vybor
                                property: "x"
                                to: rec_vybor.x - combo_rezhim.width - 5
                                duration: 1000
                                //Component.onCompleted: t_vybor.text = "Любой? >>"
                                //easing.type: Easing.InOutQuad
                                onStopped: {
                                    t_vybor.text = "Любой? >>"
                                    stackView.rezhim_id = combo_rezhim.id
                                    qmlSignal_baza_id()
                                    list1.currentIndex = -1
                                    station1.selectedBar = Qt.point(stackView.maxcolizm, list1.count -1 - list1.currentIndex)
                                }
                            }
                            NumberAnimation {
                                id: anim_vybor2
                                target: combo_rezhim
                                property: "x"
                                from: rec_4.width
                                to: rec_4.width - combo_rezhim.width - 5
                                duration: 1000
                                onStarted: {
                                    combo_rezhim.x = rec_4.width
                                    combo_rezhim.visible = true
                                }
                                //Component.onCompleted: t_vybor.text = "Любой? >>"
                                //easing.type: Easing.InOutQuad
                                //onStopped: t_vybor.text = "Любой? >>"
                            }
                            NumberAnimation {
                                id: anim_vybor4
                                target: rec_vybor
                                property: "x"
                                to: rec_vybor.x + combo_rezhim.width + 5
                                duration: 1000
                                //Component.onCompleted: t_vybor.text = "Любой? >>"
                                //easing.type: Easing.InOutQuad
                                onStopped: {
                                    t_vybor.text = "<< Режим?"
                                    stackView.rezhim_id = ""
                                    qmlSignal_baza_id()
                                    list1.currentIndex = -1
                                    station1.selectedBar = Qt.point(stackView.maxcolizm, list1.count -1 - list1.currentIndex)
                                }
                            }
                            NumberAnimation {
                                id: anim_vybor3
                                target: combo_rezhim
                                property: "x"
                                from: rec_4.width - combo_rezhim.width - 5
                                to: rec_4.width
                                duration: 1000
                                onStopped: {
                                    //combo_rezhim.x = rec_4.width
                                    combo_rezhim.visible = false
                                }
                            }
                            onEntered: {
                                rec_vybor.color = "#03a9f5"
                                t_vybor.color = "white"
                            }
                            onExited: {
                                rec_vybor.color = "transparent"
                                t_vybor.color = "#3E65FF"
                            }
                            onClicked: {
                                if(t_vybor.text == "<< Режим?"){
                                anim_vybor1.start()
                                anim_vybor2.start()
                                }
                                if(t_vybor.text == "Любой? >>"){
                                anim_vybor3.start()
                                anim_vybor4.start()
                                }
                            }
                        }
                    }

                    ComboBox {
                        id: combo_rezhim
                        visible: false
                        objectName: "combo_rezhim"
                        property string id: ""
                        currentIndex: 1
                        anchors.top: parent.top
                        anchors.topMargin: 5
//                        anchors.right: parent.right
//                        anchors.rightMargin: 5
                        width: parent.width/3
                        //Material.background: Material.LightBlue
                        model: model_rezhim
                        textRole: 'Rezhimname'
                        z: 10
                        delegate: ItemDelegate {
                            //Material.foreground: Material.LightBlue
                            width: combo_rezhim.width
                            text: combo_rezhim.textRole ? (Array.isArray(combo_rezhim.model) ? modelData[combo_rezhim.textRole] : model[combo_rezhim.textRole]) : modelData
                            highlighted: combo_rezhim.highlightedIndex === index
                        }

                        onCurrentTextChanged: {
                            if(currentIndex==-1){
                                combo_rezhim.id = ""
                            } else {
                            combo_rezhim.id = model_rezhim.getId(currentIndex)
                            }
                            stackView.rezhim_id = combo_rezhim.id
                            qmlSignal_baza_id()
                            console.log("maxlevel in stack = ", stackView.maxlevel)
                            if(combo_rezhim.currentIndex == 0){                                
                                list1.currentIndex = -1
                                station1.selectedBar = Qt.point(stackView.maxcolizm, list1.count -1 - list1.currentIndex)
                            if((stackView.maxlevel/text_norm_hh.text)<1){
                                middleGradient.color = "green"
                                finishGradient.color = "green"
                            }
                            if((stackView.maxlevel/text_norm_hh.text)>1){
                                middleGradient.position = text_norm_hh.text/stackView.maxlevel
                                finishGradient.position = 1
                                middleGradient.color = "yellow"
                                finishGradient.color = "red"
                            }
                            // при выборе холостого хода убираем из интерфейса норму на агрегат
                            t_normagr.visible = false
                            text_normagr.visible = false
                            tabl.anchors.top = t_normed.bottom
                            //rec_prim_izmer.visible = false
                            console.log("middle = ", middleGradient.position)
                            }
                            if(combo_rezhim.currentIndex == 1){                                
                                list1.currentIndex = -1
                                station1.selectedBar = Qt.point(stackView.maxcolizm, list1.count -1 - list1.currentIndex)
                            if((stackView.maxlevel/text_normagr_nom.text)<1){
                                middleGradient.color = "green"
                                finishGradient.color = "green"
                            }
                            if((stackView.maxlevel/text_normagr_nom.text)>1){
                                middleGradient.position = text_normagr_nom.text/stackView.maxlevel
                                finishGradient.position = 1
                                middleGradient.color = "yellow"
                                finishGradient.color = "red"
                            }
                            t_normagr.visible = true
                            text_normagr.visible = true
                            tabl.anchors.top = t_normagr.bottom
                            //rec_prim_izmer.visible = false
                            console.log("middle = ", middleGradient.position)
                            }
                            if(combo_rezhim.currentIndex == 2){                                
                                list1.currentIndex = -1
                                station1.selectedBar = Qt.point(stackView.maxcolizm, list1.count -1 - list1.currentIndex)
                            if((stackView.maxlevel/text_normagr_rd.text)<1){
                                middleGradient.color = "green"
                                finishGradient.color = "green"
                            }
                            if((stackView.maxlevel/text_normagr_rd.text)>1){
                                middleGradient.position = text_normagr_rd.text/stackView.maxlevel
                                finishGradient.position = 1
                                middleGradient.color = "yellow"
                                finishGradient.color = "red"
                            }

                            t_normagr.visible = true
                            text_normagr.visible = true
                            tabl.anchors.top = t_normagr.bottom
                            //rec_prim_izmer.visible = false
                            console.log("middle = ", middleGradient.position)
                            }

                        }
                        Component.onCompleted: {

                        }
                    }
                    Rectangle {
                        id: rec_number
                        anchors.top: combo_rezhim.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        height: text_number.height + 5
                        width: parent.width/10
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
                        id: rec_datetime
                        anchors.top: combo_rezhim.bottom
                        anchors.topMargin: 5
                        anchors.left: rec_number.right
                        anchors.leftMargin: 5
                        height: text_number.height + 5
                        width: parent.width*5/10
                        radius: 10
                        color: "#03a9f5"
                        Text {
                            id: text_datetime
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 15
                            text: qsTr("Дата и время")
                        }
                    }
                    Rectangle {
                        id: rec_vmax
                        anchors.top: combo_rezhim.bottom
                        anchors.topMargin: 5
                        anchors.left: rec_datetime.right
                        anchors.leftMargin: 5
                        height: text_number.height + 5
                        width: parent.width/10
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
                        id: rec_sost
                        anchors.top: combo_rezhim.bottom
                        anchors.topMargin: 5
                        anchors.left: rec_vmax.right
                        anchors.leftMargin: 5
                        height: text_number.height + 5
                        width: parent.width*3/10-25
                        radius: 10
                        color: "#03a9f5"
                        Text {
                            id: text_sost
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 15
                            text: qsTr("Состояние")
                        }
                    }
                    Flickable {
                        id: flick
                        anchors.top: rec_number.bottom
                        anchors.topMargin: 2
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        property real h

                        ListView {
                            id: list1
                            anchors.fill: parent
                            clip: true
                            model: model_izmer
                            delegate: delegate1
                            focus: true
                            headerPositioning: ListView.OverlayHeader
                            spacing: 2
                            currentIndex: -1//window.index
                            highlight: highlightBar
                            property double h
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
                            id: delegate1

                            Item {
                                id: item_table1
                                width: rec_4.width
                                height: text1.height + 5
                                property int number: index


                                //property var col: ListView.isCurrentItem ? "#03a9f5" : "lightblue"
                                //property var h: ListView.isCurrentItem ? item_table1.height*2 : item_table1.height

                                Rectangle {
                                    id: rec1
                                    anchors.top: parent.top
                                    anchors.left: parent.left
                                    anchors.leftMargin: 5
                                    width: parent.width/10
                                    height: item_table1.height
                                    border.color: "#3E65FF"
                                    radius: 10
                                    opacity: 0.8
                                    //color: item_table1.col

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
                                            text: item_table1.number+1
                                            Component.onCompleted: list1.h = text1.height+5
                                        }
                                    }
                                }
                                Rectangle {
                                    id: rec2
                                    anchors.top: parent.top
                                    anchors.left: rec1.right
                                    anchors.leftMargin: 5
                                    width: rec_datetime.width
                                    height: item_table1.height
                                    border.color: "#3E65FF"
                                    radius: 10
                                    opacity: 0.8
                                    //color: item_table1.col

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
                                    width: rec_vmax.width
                                    height: item_table1.height
                                    border.color: "#3E65FF"
                                    radius: 10
                                    opacity: 0.8
                                    //color: item_table1.col
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
                                            text: Bazaizmervmax
                                        }
                                    }
                                }
                                Rectangle {
                                    id: rec4
                                    anchors.top: parent.top
                                    anchors.left: rec3.right
                                    anchors.leftMargin: 5
                                    width: rec_sost.width
                                    height: item_table1.height
                                    border.color: "#3E65FF"
                                    radius: 10
                                    opacity: 0.8
                                    //color: item_table1.col
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
                                            text: Bazaizmersost
                                        }
                                    }
                                }
                                MouseArea {
                                    id: mouse
                                    anchors.fill: parent
                                    onClicked: {
                                        rec_prim_izmer.visible = true
                                        list1.currentIndex = model.index// model.index//model0.index()
                                        newindex = list1.currentIndex
                                        mapper_izmer.updateData(newindex)
                                        console.log(list1.currentIndex)
                                        stackView.bazaizm_id = model_izmer.getId(list1.currentIndex)
                                        qmlSignal_bazaizmer()
                                        console.log("stackView.bazaizm_id ", stackView.bazaizm_id)
                                        console.log("stackView.maxcolizm ",stackView.maxcolizm)
                                        station1.selectedBar = Qt.point(stackView.maxcolizm, list1.count -1 - list1.currentIndex)
                                        barGraph.selectionMode = AbstractGraph3D.SelectionItemAndColumn | AbstractGraph3D.SelectionSlice
                                        if(text_rezh.text == "Холостой ход"){
                                            text_normagr.visible = false
                                            t_normagr.visible = false
                                            tabl.anchors.top = t_normed.bottom
                                        } else {
                                            text_normagr.visible = true
                                            t_normagr.visible = true
                                            tabl.anchors.top = t_normagr.bottom
                                        }
                                    }
                                }
                                Component.onCompleted: {
                                    if(text4.text=="Норма"){
                                        rec1.color = "lightgreen"
                                        rec2.color = "lightgreen"
                                        rec3.color = "lightgreen"
                                        rec4.color = "lightgreen"
                                    }
                                    if(text4.text=="Превышение"){
                                        rec1.color = "lightcoral"
                                        rec2.color = "lightcoral"
                                        rec3.color = "lightcoral"
                                        rec4.color = "lightcoral"
                                    }
                                }
                                }

                            }//item_table
                        }//delegate
                        Component {
                            id: highlightBar

                            Rectangle {
                                id: hl1
                                z: -1
//                                anchors.top: parent.top
                                anchors.left: parent.left
                                anchors.leftMargin: 5
                                anchors.right: parent.right
                                anchors.rightMargin: 5
                                //width: list1.width-25
                                height: list1.h
                                border.color: "#3E65FF"
                                radius: 10
                                opacity: 0.8
                                color: "grey"
                                //x: list1.currentItem.x
                                y: list1.currentItem.y
                                //Behavior on y { SpringAnimation { spring: 100; damping: 1 } }

                                //NumberAnimation on x { from: 5; to: 10; duration: 500}
                            }

                        }
                } //rec_4
                Rectangle {
                    id: rec_5
                    anchors.top: parent.top
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    width: parent.width/2
                    z: 1
                    MouseArea {
                        id: mouse
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            rec_but.visible = true
                            swipeView1.interactive = false
                        }
                        onExited: {
                            rec_but.visible = false
                            swipeView1.interactive = true
                        }
                    }

                        Image {
                            id: rec_but
                            visible: false
                            anchors.top: parent.top
                            anchors.topMargin: 5
                            anchors.right: parent.right
                            anchors.rightMargin: 5
                            width: height
                            height: 32
                            z: 1
                            fillMode: Image.PreserveAspectFit
                            source: "file:./Images/icon_64+.png"
                        MouseArea {
                            anchors.fill: parent
                        //hoverEnabled: true
//                        onEntered: {
//                            rec_but.height = 64
//                        }
//                        onExited: {
//                            rec_but.height = 32
//                        }

                        onClicked: {
                            if(rec_5.width == window.width/2){
                            rec_5.width = window.width
                                rec_but.source = "file:./Images/icon_64-.png"
                                //barGraph.update()
                            } else {rec_5.width = window.width/2
                            rec_but.source = "file:./Images/icon_64+.png"}
                            }
                        }
                }



                    ColorGradient {
                        id: surfaceGradient
                        ColorGradientStop { id: startGradient; position: 0.0; color: "green" }
                        ColorGradientStop { id: middleGradient; position: 0.75; color: "yellow" }
                        ColorGradientStop { id: finishGradient; position: 1.0; color: "red" }
                        Component.onCompleted: {

                        }
                    }

                    Bars3D {
                        id: barGraph
                        Material.theme: Material.Light
                        anchors.fill: parent
//                        selectionMode: AbstractGraph3D.SelectionItemAndRow
//                        scene.activeCamera.cameraPreset: Camera3D.CameraPresetIsometricLeftHigh
                        barThickness: 2
                        antialiasing: true
                        reflection: true
                        //shadowQuality: AbstractGraph3D.ShadowQualitySoftHigh
                        theme: Theme3D {
                            //type: Theme3D.ThemeQt
                            font.family: "STCaiyun"
                            font.pointSize: 25
                            colorStyle: Theme3D.ColorStyleRangeGradient
                            baseGradients: [surfaceGradient]
                            windowColor: "white"
                            labelBackgroundEnabled: false
                            backgroundEnabled: true
                            backgroundColor: "transparent"
                            gridEnabled: true
                            gridLineColor: "black"
                            labelTextColor: "blue"
                            multiHighlightColor: "red"
                            singleHighlightColor: "white"
                            //labelBorderEnabled: false
                            //labelBackgroundEnabled: false
                            //singleHighlightColor: "grey"

                        }
                        selectionMode: AbstractGraph3D.SelectionItemAndRow | AbstractGraph3D.SelectionSlice
                        scene.activeCamera.cameraPreset: Camera3D.CameraPresetIsometricLeftHigh
                        Bar3DSeries {
                            id: station1
                            name: "Station 1"

                            //itemLabelFormat: "@colLabel: %.0f единиц"
                            ItemModelBarDataProxy {
                                id: proxy
                                itemModel: model_1V
                                //multiMatchBehavior: ItemModelBarDataProxy.MultiMatchBehavior
                                //useModelCategories: true
                                rowRole: "bazaizmnapr"
                                columnRole: "bazaizmdata"
                                valueRole: "bazaizm1v"
                            }
                            onSelectedBarChanged: {
                                rec_prim_izmer.visible = true
                                list1.currentIndex = list1.count -1 - parseInt([position.y])
                                newindex = list1.currentIndex
                                item4.editEntry(newindex)
                                barGraph.selectionMode = AbstractGraph3D.SelectionItemAndRow | AbstractGraph3D.SelectionSlice
                                console.log(list1.currentIndex)
                            }
                        }
                        Component.onCompleted: {
                            if (barGraph.seriesList[0].meshSmooth === true) {
                                barGraph.seriesList[0].meshSmooth = false
                            } else {
                                barGraph.seriesList[0].meshSmooth = true
                            }
                            if(combo_rezhim.currentIndex == 0){
                            if((stackView.maxlevel/text_norm_hh.text)<1){
                                middleGradient.color = "green"
                                finishGradient.color = "green"
                            }
                            if((stackView.maxlevel/text_norm_hh.text)>1){
                                middleGradient.position = text_norm_hh.text/stackView.maxlevel
                                finishGradient.position = 1
                                middleGradient.color = "yellow"
                                finishGradient.color = "red"
                            }
                            console.log("middle = ", middleGradient.position)
                            }
                            if(combo_rezhim.currentIndex == 1){
                            if((stackView.maxlevel/text_normagr_nom.text)<1){
                                middleGradient.color = "green"
                                finishGradient.color = "green"
                            }
                            if((stackView.maxlevel/text_normagr_nom.text)>1){
                                middleGradient.position = text_normagr_nom.text/stackView.maxlevel
                                finishGradient.position = 1
                                middleGradient.color = "yellow"
                                finishGradient.color = "red"
                            }
                            console.log("middle = ", middleGradient.position)
                            }
                            if(combo_rezhim.currentIndex == 2){
                            if((stackView.maxlevel/text_normagr_rd.text)<1){
                                middleGradient.color = "green"
                                finishGradient.color = "green"
                            }
                            if((stackView.maxlevel/text_normagr_rd.text)>1){
                                middleGradient.position = text_normagr_rd.text/stackView.maxlevel
                                finishGradient.position = 1
                                middleGradient.color = "yellow"
                                finishGradient.color = "red"
                            }
                            console.log("middle = ", middleGradient.position)
                            }
                        }

                }

                } //rec_5
                Rectangle {
                    id: rec_6
                    anchors.top: rec_4.bottom
                    anchors.left: parent.left
                    width: parent.width/2
                    anchors.bottom: parent.bottom
                    //color: "red"
                    Text {
                        id: t_dateandtime
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        wrapMode: Text.WordWrap
                        font.pixelSize: 15
                        color: "#3E65FF"//"#3E65FF"
                        text: "Дата/время: "
                    }
                    Text {
                        id: text_dateandtime
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.left: t_dateandtime.right
                        anchors.leftMargin: 5
                        wrapMode: Text.WordWrap
                        font.pixelSize: 15
                        color: "#3E65FF"
                    }
                    Text {
                        id: t_rezh
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.right: text_rezh.left
                        anchors.rightMargin: 5
                        wrapMode: Text.WordWrap
                        font.pixelSize: 15
                        color: "#3E65FF"//"#3E65FF"
                        text: "Режим: "
                    }
                    Text {
                        id: text_rezh
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        wrapMode: Text.WordWrap
                        font.pixelSize: 15
                        color: "#3E65FF"
                    }
                    Text {
                        id: t_tipizmer
                        anchors.top: t_dateandtime.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        wrapMode: Text.WordWrap
                        font.pixelSize: 15
                        color: "#3E65FF"//"#3E65FF"
                        text: "Тип измерения: "
                    }
                    Text {
                        id: text_tipizmer
                        anchors.top: t_dateandtime.bottom
                        anchors.topMargin: 5
                        anchors.left: t_tipizmer.right
                        anchors.leftMargin: 5
                        wrapMode: Text.WordWrap
                        font.pixelSize: 15
                        color: "#3E65FF"
                    }
                    Text {
                        id: t_normed
                        anchors.top: t_tipizmer.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        wrapMode: Text.WordWrap
                        font.pixelSize: 15
                        color: "#3E65FF"//"#3E65FF"
                        text: "Норма вибрации на эл/дв: "
                    }
                    Text {
                        id: text_normed
                        anchors.top: t_tipizmer.bottom
                        anchors.topMargin: 5
                        anchors.left: t_normed.right
                        anchors.leftMargin: 5
                        wrapMode: Text.WordWrap
                        font.pixelSize: 15
                        color: "#3E65FF"
                    }
                    Text {
                        id: t_normagr
                        anchors.top: t_normed.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        wrapMode: Text.WordWrap
                        font.pixelSize: 15
                        color: "#3E65FF"//"#3E65FF"
                        text: "Норма вибрации на агрегат: "
                    }
                    Text {
                        id: text_normagr
                        anchors.top: t_normed.bottom
                        anchors.topMargin: 5
                        anchors.left: t_normagr.right
                        anchors.leftMargin: 5
                        wrapMode: Text.WordWrap
                        font.pixelSize: 15
                        color: "#3E65FF"
                    }
                    Rectangle {
                        id: tabl
                        anchors.top: t_normagr.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.right: parent.right
                        height: reck1s1.height+reck2s1.height+reck3s1.height+reck4s1.height+reck5s1.height+11
                        //anchors.bottom: parent.bottom
                        //color: "blue"
                        Rectangle {
                            id: reck1s1
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: (tabl.width-21)/9
                            height: k1s1.height + 5
                            border.color: "#3E65FF"
                            radius: 10
                            visible: false
                            RowLayout{
                                id: layk1s1
                                anchors.fill: parent
                                Text {
                                    id: k1s1
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    text: "№"
                                }
                            }
                        }
                        Rectangle {
                            id: reck1s2
                            anchors.top: parent.top
                            anchors.left: reck1s1.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k1s1.height + 5
                            //border.color: "#3E65FF"
                            color: "#03a9f5"
                            radius: 10
                            RowLayout{
                                id: layk1s2
                                anchors.fill: parent
                                Text {
                                    id: k1s2
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "white"//"#3E65FF"
                                    text: "1"
                                }
                            }
                        }
                        Rectangle {
                            id: reck1s3
                            anchors.top: parent.top
                            anchors.left: reck1s2.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k1s1.height + 5
                            //border.color: "#3E65FF"
                            color: "#03a9f5"
                            radius: 10
                            RowLayout{
                                id: layk1s3
                                anchors.fill: parent
                                Text {
                                    id: k1s3
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "white"//"#3E65FF"
                                    text: "2"
                                }
                            }
                        }
                        Rectangle {
                            id: reck1s4
                            anchors.top: parent.top
                            anchors.left: reck1s3.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k1s1.height + 5
                            //border.color: "#3E65FF"
                            color: "#03a9f5"
                            radius: 10
                            RowLayout{
                                id: layk1s4
                                anchors.fill: parent
                                Text {
                                    id: k1s4
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "white"//"#3E65FF"
                                    text: "3"
                                }
                            }
                        }
                        Rectangle {
                            id: reck1s5
                            anchors.top: parent.top
                            anchors.left: reck1s4.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k1s1.height + 5
                            //border.color: "#3E65FF"
                            color: "#03a9f5"
                            radius: 10
                            RowLayout{
                                id: layk1s5
                                anchors.fill: parent
                                Text {
                                    id: k1s5
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "white"//"#3E65FF"
                                    text: "4"
                                }
                            }
                        }
                        Rectangle {
                            id: reck1s6
                            anchors.top: parent.top
                            anchors.left: reck1s5.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k1s1.height + 5
                            //border.color: "#3E65FF"
                            color: "#03a9f5"
                            radius: 10
                            RowLayout{
                                id: layk1s6
                                anchors.fill: parent
                                Text {
                                    id: k1s6
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "white"//"#3E65FF"
                                    text: "5"
                                }
                            }
                        }
                        Rectangle {
                            id: reck1s7
                            anchors.top: parent.top
                            anchors.left: reck1s6.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k1s1.height + 5
                            //border.color: "#3E65FF"
                            color: "#03a9f5"
                            radius: 10
                            RowLayout{
                                id: layk1s7
                                anchors.fill: parent
                                Text {
                                    id: k1s7
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "white"//"#3E65FF"
                                    text: "6"
                                }
                            }
                        }
                        Rectangle {
                            id: reck1s8
                            anchors.top: parent.top
                            anchors.left: reck1s7.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k1s1.height + 5
                            //border.color: "#3E65FF"
                            color: "#03a9f5"
                            radius: 10
                            RowLayout{
                                id: layk1s8
                                anchors.fill: parent
                                Text {
                                    id: k1s8
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "white"//"#3E65FF"
                                    text: "7"
                                }
                            }
                        }
                        Rectangle {
                            id: reck1s9
                            anchors.top: parent.top
                            anchors.left: reck1s8.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k1s1.height + 5
                            //border.color: "#3E65FF"
                            color: "#03a9f5"
                            radius: 10
                            RowLayout{
                                id: layk1s9
                                anchors.fill: parent
                                Text {
                                    id: k1s9
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "white"//"#3E65FF"
                                    text: "8"
                                }
                            }
                        }
                        Rectangle {
                            id: reck2s1
                            anchors.top: reck1s1.bottom
                            anchors.topMargin: 2
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: (tabl.width-21)/9
                            height: k2s1.height + 5
                            //border.color: "#3E65FF"
                            color: "#03a9f5"
                            radius: 10
                            RowLayout{
                                id: layk2s1
                                anchors.fill: parent
                                Text {
                                    id: k2s1
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "white"//"#3E65FF"
                                    text: "В"
                                }
                            }
                        }
                        Rectangle {
                            id: reck2s2
                            anchors.top: reck1s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck2s1.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k2s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk2s2
                                anchors.fill: parent
                                Text {
                                    id: k2s2
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck2s3
                            anchors.top: reck1s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck2s2.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k2s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk2s3
                                anchors.fill: parent
                                Text {
                                    id: k2s3
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck2s4
                            anchors.top: reck1s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck2s3.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k2s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk2s4
                                anchors.fill: parent
                                Text {
                                    id: k2s4
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck2s5
                            anchors.top: reck1s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck2s4.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k2s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk2s5
                                anchors.fill: parent
                                Text {
                                    id: k2s5
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck2s6
                            anchors.top: reck1s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck2s5.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k2s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk2s6
                                anchors.fill: parent
                                Text {
                                    id: k2s6
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck2s7
                            anchors.top: reck1s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck2s6.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k2s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk2s7
                                anchors.fill: parent
                                Text {
                                    id: k2s7
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck2s8
                            anchors.top: reck1s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck2s7.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k2s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk2s8
                                anchors.fill: parent
                                Text {
                                    id: k2s8
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck2s9
                            anchors.top: reck1s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck2s8.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k2s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk2s9
                                anchors.fill: parent
                                Text {
                                    id: k2s9
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck3s1
                            anchors.top: reck2s1.bottom
                            anchors.topMargin: 2
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: (tabl.width-21)/9
                            height: k3s1.height + 5
                            //border.color: "#3E65FF"
                            color: "#03a9f5"
                            radius: 10
                            RowLayout{
                                id: layk3s1
                                anchors.fill: parent
                                Text {
                                    id: k3s1
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "white"//"#3E65FF"
                                    text: "П"
                                }
                            }
                        }
                        Rectangle {
                            id: reck3s2
                            anchors.top: reck2s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck3s1.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k3s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk3s2
                                anchors.fill: parent
                                Text {
                                    id: k3s2
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck3s3
                            anchors.top: reck2s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck3s2.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k3s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk3s3
                                anchors.fill: parent
                                Text {
                                    id: k3s3
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck3s4
                            anchors.top: reck2s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck3s3.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k3s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk3s4
                                anchors.fill: parent
                                Text {
                                    id: k3s4
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck3s5
                            anchors.top: reck2s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck3s4.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k3s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk3s5
                                anchors.fill: parent
                                Text {
                                    id: k3s5
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck3s6
                            anchors.top: reck2s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck3s5.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k3s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk3s6
                                anchors.fill: parent
                                Text {
                                    id: k3s6
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck3s7
                            anchors.top: reck2s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck3s6.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k3s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk3s7
                                anchors.fill: parent
                                Text {
                                    id: k3s7
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck3s8
                            anchors.top: reck2s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck3s7.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k3s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk3s8
                                anchors.fill: parent
                                Text {
                                    id: k3s8
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck3s9
                            anchors.top: reck2s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck3s8.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k3s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk3s9
                                anchors.fill: parent
                                Text {
                                    id: k3s9
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck4s1
                            anchors.top: reck3s1.bottom
                            anchors.topMargin: 2
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: (tabl.width-21)/9
                            height: k4s1.height + 5
                            //border.color: "#3E65FF"
                            color: "#03a9f5"
                            radius: 10
                            RowLayout{
                                id: layk4s1
                                anchors.fill: parent
                                Text {
                                    id: k4s1
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "white"//"#3E65FF"
                                    text: "О"
                                }
                            }
                        }
                        Rectangle {
                            id: reck4s2
                            anchors.top: reck3s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck4s1.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k4s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk4s2
                                anchors.fill: parent
                                Text {
                                    id: k4s2
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck4s3
                            anchors.top: reck3s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck4s2.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k4s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk4s3
                                anchors.fill: parent
                                Text {
                                    id: k4s3
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck4s4
                            anchors.top: reck3s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck4s3.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k4s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk4s4
                                anchors.fill: parent
                                Text {
                                    id: k4s4
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck4s5
                            anchors.top: reck3s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck4s4.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k4s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk4s5
                                anchors.fill: parent
                                Text {
                                    id: k4s5
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck4s6
                            anchors.top: reck3s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck4s5.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k4s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk4s6
                                anchors.fill: parent
                                Text {
                                    id: k4s6
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck4s7
                            anchors.top: reck3s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck4s6.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k4s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk4s7
                                anchors.fill: parent
                                Text {
                                    id: k4s7
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck4s8
                            anchors.top: reck3s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck4s7.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k4s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk4s8
                                anchors.fill: parent
                                Text {
                                    id: k4s8
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck4s9
                            anchors.top: reck3s1.bottom
                            anchors.topMargin: 2
                            anchors.left: reck4s8.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k4s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk4s9
                                anchors.fill: parent
                                Text {
                                    id: k4s9
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck5s1
                            anchors.top: reck4s1.bottom
                            anchors.topMargin: 5
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            width: (tabl.width-21)/9
                            height: k5s1.height + 5
                            //border.color: "#3E65FF"
                            color: "#03a9f5"
                            radius: 10
                            RowLayout{
                                id: layk5s1
                                anchors.fill: parent
                                Text {
                                    id: k5s1
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "white"//"#3E65FF"
                                    text: "Т"
                                }
                            }
                        }
                        Rectangle {
                            id: reck5s2
                            anchors.top: reck4s1.bottom
                            anchors.topMargin: 5
                            anchors.left: reck5s1.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k5s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk5s2
                                anchors.fill: parent
                                Text {
                                    id: k5s2
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck5s3
                            anchors.top: reck4s1.bottom
                            anchors.topMargin: 5
                            anchors.left: reck5s2.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k5s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk5s3
                                anchors.fill: parent
                                Text {
                                    id: k5s3
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck5s4
                            anchors.top: reck4s1.bottom
                            anchors.topMargin: 5
                            anchors.left: reck5s3.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k5s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk5s4
                                anchors.fill: parent
                                Text {
                                    id: k5s4
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck5s5
                            anchors.top: reck4s1.bottom
                            anchors.topMargin: 5
                            anchors.left: reck5s4.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k5s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk5s5
                                anchors.fill: parent
                                Text {
                                    id: k5s5
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck5s6
                            anchors.top: reck4s1.bottom
                            anchors.topMargin: 5
                            anchors.left: reck5s5.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k5s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk5s6
                                anchors.fill: parent
                                Text {
                                    id: k5s6
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck5s7
                            anchors.top: reck4s1.bottom
                            anchors.topMargin: 5
                            anchors.left: reck5s6.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k5s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk5s7
                                anchors.fill: parent
                                Text {
                                    id: k5s7
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck5s8
                            anchors.top: reck4s1.bottom
                            anchors.topMargin: 5
                            anchors.left: reck5s7.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k5s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk5s8
                                anchors.fill: parent
                                Text {
                                    id: k5s8
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }
                        Rectangle {
                            id: reck5s9
                            anchors.top: reck4s1.bottom
                            anchors.topMargin: 5
                            anchors.left: reck5s8.right
                            anchors.leftMargin: 2
                            width: (tabl.width-21)/9
                            height: k5s1.height + 5
                            border.color: "#3E65FF"
                            //color: "#3E65FF"
                            radius: 10
                            RowLayout{
                                id: layk5s9
                                anchors.fill: parent
                                Text {
                                    id: k5s9
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 15
                                    color: "#3E65FF"//"#3E65FF"
                                    property string tex: ""
                                    property string tex1: tex !== "" ? tex: "-"
                                    text: tex1
                                }
                            }
                        }

                    } //table
                    Text {
                        id: t_rash
                        anchors.top: tabl.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        wrapMode: Text.WordWrap
                        font.pixelSize: 15
                        color: "#3E65FF"//"#3E65FF"
                        text: "Расход: "
                    }
                    Text {
                        id: text_rash
                        anchors.top: tabl.bottom
                        anchors.topMargin: 5
                        anchors.left: t_rash.right
                        anchors.leftMargin: 5
                        wrapMode: Text.WordWrap
                        font.pixelSize: 15
                        color: "#3E65FF"
                    }
                    Text {
                        id: t_nap
                        anchors.top: tabl.bottom
                        anchors.topMargin: 5
                        anchors.right: text_nap.left
                        anchors.rightMargin: 5
                        wrapMode: Text.WordWrap
                        font.pixelSize: 15
                        color: "#3E65FF"//"#3E65FF"
                        text: "Давление: "
                    }
                    Text {
                        id: text_nap
                        anchors.top: tabl.bottom
                        anchors.topMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        wrapMode: Text.WordWrap
                        font.pixelSize: 15
                        color: "#3E65FF"
                    }
                    Text {
                        id: t_laes2
                        anchors.top: t_rash.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        wrapMode: Text.WordWrap
                        font.pixelSize: 15
                        color: "#3E65FF"//"#3E65FF"
                        text: "ЛАЭС-2: "
                    }
                    Text {
                        id: text_laes2
                        anchors.top: t_rash.bottom
                        anchors.topMargin: 5
                        anchors.left: t_laes2.right
                        anchors.leftMargin: 5
                        wrapMode: Text.WordWrap
                        font.pixelSize: 15
                        color: "#3E65FF"
                    }
                    Text {
                        id: t_ate
                        anchors.top: t_laes2.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        wrapMode: Text.WordWrap
                        font.pixelSize: 15
                        color: "#3E65FF"//"#3E65FF"
                        text: "АТЭ: "
                    }
                    Text {
                        id: text_ate
                        anchors.top: t_laes2.bottom
                        anchors.topMargin: 5
                        anchors.left: t_ate.right
                        anchors.leftMargin: 5
                        wrapMode: Text.WordWrap
                        font.pixelSize: 15
                        color: "#3E65FF"
                    }
                    Text {
                        id: t_prim_izmer
                        anchors.top: t_ate.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        wrapMode: Text.WordWrap
                        font.pixelSize: 15
                        color: "#3E65FF"//"#3E65FF"
                        text: "Примечания: "
                    }
                    Rectangle {
                        id: rec_prim_izmer
                        anchors.top: t_prim_izmer.bottom
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        width: parent.width
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 5

                        Flickable {
                            id: flickable1
                            flickableDirection: Flickable.VerticalFlick
                            anchors.fill: parent
                            TextArea.flickable: TextArea {
                                id: textArea_prim_izmer
                                textFormat: Qt.PlainText//RichText
                                wrapMode: TextArea.Wrap
                                focus: false
                                readOnly: true
                                font.pixelSize: 15
                                color: "#3E65FF"
                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: {
                                        tabl.anchors.top = rec_6.top
                                        t_prim_izmer.anchors.top = tabl.bottom
                                        text_dateandtime.visible = false
                                        t_dateandtime.visible = false
                                        text_rezh.visible = false
                                        t_rezh.visible = false
                                        text_tipizmer.visible = false
                                        t_tipizmer.visible = false
                                        text_normed.visible = false
                                        t_normed.visible = false
                                        text_normagr.visible = false
                                        t_normagr.visible = false
                                        text_rash.visible = false
                                        t_rash.visible = false
                                        text_nap.visible = false
                                        t_nap.visible = false
                                        text_laes2.visible = false
                                        t_laes2.visible = false
                                        text_ate.visible = false
                                        t_ate.visible = false
                                    }
                                    onExited: {
                                        tabl.anchors.top = t_normagr.bottom
                                        t_prim_izmer.anchors.top = t_ate.bottom
                                        text_dateandtime.visible = true
                                        t_dateandtime.visible = true
                                        text_rezh.visible = true
                                        t_rezh.visible = true
                                        text_tipizmer.visible = true
                                        t_tipizmer.visible = true
                                        text_normed.visible = true
                                        t_normed.visible = true
                                        if(text_rezh.text == "Холостой ход"){
                                            text_normagr.visible = false
                                            t_normagr.visible = false
                                            tabl.anchors.top = t_normed.bottom
                                        } else {
                                            text_normagr.visible = true
                                            t_normagr.visible = true
                                            tabl.anchors.top = t_normagr.bottom
                                        }

                                        text_rash.visible = true
                                        t_rash.visible = true
                                        text_nap.visible = true
                                        t_nap.visible = true
                                        text_laes2.visible = true
                                        t_laes2.visible = true
                                        text_ate.visible = true
                                        t_ate.visible = true
                                    }
                                }
                                //selectByMouse: true
                                //persistentSelection: true
                            }
                            ScrollBar.vertical: ScrollBar {
                            width: 10
                            }
                        }
                    }
                }
                function editEntry() {
                        mapper_izmer.updateData(newindex)
                    mapper_izmer.addMapping(k2s2, (0x0100+5), "tex")
                    mapper_izmer.addMapping(k3s2, (0x0100+6), "tex")
                    mapper_izmer.addMapping(k4s2, (0x0100+7), "tex")
                    mapper_izmer.addMapping(k2s3, (0x0100+8), "tex")
                    mapper_izmer.addMapping(k3s3, (0x0100+9), "tex")
                    mapper_izmer.addMapping(k4s3, (0x0100+10), "tex")
                    mapper_izmer.addMapping(k2s4, (0x0100+11), "tex")
                    mapper_izmer.addMapping(k3s4, (0x0100+12), "tex")
                    mapper_izmer.addMapping(k4s4, (0x0100+13), "tex")
                    mapper_izmer.addMapping(k2s5, (0x0100+14), "tex")
                    mapper_izmer.addMapping(k3s5, (0x0100+15), "tex")
                    mapper_izmer.addMapping(k4s5, (0x0100+16), "tex")
                    mapper_izmer.addMapping(k2s6, (0x0100+17), "tex")
                    mapper_izmer.addMapping(k3s6, (0x0100+18), "tex")
                    mapper_izmer.addMapping(k4s6, (0x0100+19), "tex")
                    mapper_izmer.addMapping(k2s7, (0x0100+20), "tex")
                    mapper_izmer.addMapping(k3s7, (0x0100+21), "tex")
                    mapper_izmer.addMapping(k4s7, (0x0100+22), "tex")
                    mapper_izmer.addMapping(k2s8, (0x0100+23), "tex")
                    mapper_izmer.addMapping(k3s8, (0x0100+24), "tex")
                    mapper_izmer.addMapping(k4s8, (0x0100+25), "tex")
                    mapper_izmer.addMapping(k2s9, (0x0100+26), "tex")
                    mapper_izmer.addMapping(k3s9, (0x0100+27), "tex")
                    mapper_izmer.addMapping(k4s9, (0x0100+28), "tex")
                    mapper_izmer.addMapping(k5s2, (0x0100+29), "tex")
                    mapper_izmer.addMapping(k5s3, (0x0100+30), "tex")
                    mapper_izmer.addMapping(k5s4, (0x0100+31), "tex")
                    mapper_izmer.addMapping(k5s5, (0x0100+32), "tex")
                    mapper_izmer.addMapping(k5s6, (0x0100+33), "tex")
                    mapper_izmer.addMapping(k5s7, (0x0100+34), "tex")
                    mapper_izmer.addMapping(k5s8, (0x0100+35), "tex")
                    mapper_izmer.addMapping(k5s9, (0x0100+36), "tex")
                    mapper_izmer.addMapping(text_dateandtime, (0x0100+2), "text")
                    mapper_izmer.addMapping(text_rezh, (0x0100+37), "text")
                    mapper_izmer.addMapping(text_tipizmer, (0x0100+38), "text")
                    mapper_izmer.addMapping(text_normed, (0x0100+39), "text")
                    mapper_izmer.addMapping(text_normagr, (0x0100+40), "text")
                    mapper_izmer.addMapping(text_rash, (0x0100+41), "text")
                    mapper_izmer.addMapping(text_nap, (0x0100+42), "text")
                    mapper_izmer.addMapping(text_laes2, (0x0100+43), "text")
                    mapper_izmer.addMapping(text_ate, (0x0100+44), "text")
                    mapper_izmer.addMapping(textArea_prim_izmer, (0x0100+45), "text")
                    // если нет данных виброизмерений
                    if(k2s2.tex=="" && k2s3.tex=="" && k2s4.tex=="" && k2s5.tex=="" && k2s6.tex=="" && k2s7.tex=="" &&
                            k2s8.tex=="" && k2s9.tex=="" && k3s2.tex=="" && k3s3.tex=="" && k3s4.tex=="" && k3s5.tex=="" && k3s6.tex=="" && k3s7.tex=="" &&
                            k3s8.tex=="" && k3s9.tex=="" && k4s2.tex=="" && k4s3.tex=="" && k4s4.tex=="" && k4s5.tex=="" && k4s6.tex=="" && k4s7.tex=="" &&
                            k4s8.tex=="" && k4s9.tex==""){
                        reck1s1.visible = false
                        reck1s1.width = 0
                        reck1s2.visible = false
                        reck1s2.width = 0
                        reck1s3.visible = false
                        reck1s3.width = 0
                        reck1s4.visible = false
                        reck1s4.width = 0
                        reck1s5.visible = false
                        reck1s5.width = 0
                        reck1s6.visible = false
                        reck1s6.width = 0
                        reck1s7.visible = false
                        reck1s7.width = 0
                        reck1s8.visible = false
                        reck1s8.width = 0
                        reck1s9.visible = false
                        reck1s9.width = 0
                        reck2s1.visible = false
                        reck2s1.width = 0
                        reck2s2.visible = false
                        reck2s2.width = 0
                        reck2s3.visible = false
                        reck2s3.width = 0
                        reck2s4.visible = false
                        reck2s4.width = 0
                        reck2s5.visible = false
                        reck2s5.width = 0
                        reck2s6.visible = false
                        reck2s6.width = 0
                        reck2s7.visible = false
                        reck2s7.width = 0
                        reck2s8.visible = false
                        reck2s8.width = 0
                        reck2s9.visible = false
                        reck2s9.width = 0
                        reck3s1.visible = false
                        reck3s1.width = 0
                        reck3s2.visible = false
                        reck3s2.width = 0
                        reck3s3.visible = false
                        reck3s3.width = 0
                        reck3s4.visible = false
                        reck3s4.width = 0
                        reck3s5.visible = false
                        reck3s5.width = 0
                        reck3s6.visible = false
                        reck3s6.width = 0
                        reck3s7.visible = false
                        reck3s7.width = 0
                        reck3s8.visible = false
                        reck3s8.width = 0
                        reck3s9.visible = false
                        reck3s9.width = 0
                        reck4s1.visible = false
                        reck4s1.width = 0
                        reck4s2.visible = false
                        reck4s2.width = 0
                        reck4s3.visible = false
                        reck4s3.width = 0
                        reck4s4.visible = false
                        reck4s4.width = 0
                        reck4s5.visible = false
                        reck4s5.width = 0
                        reck4s6.visible = false
                        reck4s6.width = 0
                        reck4s7.visible = false
                        reck4s7.width = 0
                        reck4s8.visible = false
                        reck4s8.width = 0
                        reck4s9.visible = false
                        reck4s9.width = 0
                        reck5s1.visible = false
                        reck5s1.width = 0
                        reck5s2.visible = false
                        reck5s2.width = 0
                        reck5s3.visible = false
                        reck5s3.width = 0
                        reck5s4.visible = false
                        reck5s4.width = 0
                        reck5s5.visible = false
                        reck5s5.width = 0
                        reck5s6.visible = false
                        reck5s6.width = 0
                        reck5s7.visible = false
                        reck5s7.width = 0
                        reck5s8.visible = false
                        reck5s8.width = 0
                        reck5s9.visible = false
                        reck5s9.width = 0
                        text_dateandtime.visible = false
                        t_dateandtime.visible = false
                        text_rezh.visible = false
                        t_rezh.visible = false
                        text_tipizmer.visible = false
                        t_tipizmer.visible = false
                        text_normed.visible = false
                        t_normed.visible = false
                        text_normagr.visible = false
                        t_normagr.visible = false
                        text_rash.visible = false
                        t_rash.visible = false
                        text_nap.visible = false
                        t_nap.visible = false
                        text_laes2.visible = false
                        t_laes2.visible = false
                        text_ate.visible = false
                        t_ate.visible = false
                        textArea_prim_izmer.visible = false
                        t_prim_izmer.visible = false
                        rec_4.height = parent.height
                    } else {
                        reck1s1.width = (tabl.width-16)/9
                        reck1s2.visible = true
                        reck1s2.width = (tabl.width-16)/9
                        reck1s3.visible = true
                        reck1s3.width = (tabl.width-16)/9
                        reck1s4.visible = true
                        reck1s4.width = (tabl.width-16)/9
                        reck1s5.visible = true
                        reck1s5.width = (tabl.width-16)/9
                        reck1s6.visible = true
                        reck1s6.width = (tabl.width-16)/9
                        reck1s7.visible = true
                        reck1s7.width = (tabl.width-16)/9
                        reck1s8.visible = true
                        reck1s8.width = (tabl.width-16)/9
                        reck1s9.visible = true
                        reck1s9.width = (tabl.width-16)/9
                        reck2s1.visible = true
                        reck2s1.width = (tabl.width-16)/9
                        reck2s2.visible = true
                        reck2s2.width = (tabl.width-16)/9
                        reck2s3.visible = true
                        reck2s3.width = (tabl.width-16)/9
                        reck2s4.visible = true
                        reck2s4.width = (tabl.width-16)/9
                        reck2s5.visible = true
                        reck2s5.width = (tabl.width-16)/9
                        reck2s6.visible = true
                        reck2s6.width = (tabl.width-16)/9
                        reck2s7.visible = true
                        reck2s7.width = (tabl.width-16)/9
                        reck2s8.visible = true
                        reck2s8.width = (tabl.width-16)/9
                        reck2s9.visible = true
                        reck2s9.width = (tabl.width-16)/9
                        reck3s1.visible = true
                        reck3s1.width = (tabl.width-16)/9
                        reck3s2.visible = true
                        reck3s2.width = (tabl.width-16)/9
                        reck3s3.visible = true
                        reck3s3.width = (tabl.width-16)/9
                        reck3s4.visible = true
                        reck3s4.width = (tabl.width-16)/9
                        reck3s5.visible = true
                        reck3s5.width = (tabl.width-16)/9
                        reck3s6.visible = true
                        reck3s6.width = (tabl.width-16)/9
                        reck3s7.visible = true
                        reck3s7.width = (tabl.width-16)/9
                        reck3s8.visible = true
                        reck3s8.width = (tabl.width-16)/9
                        reck3s9.visible = true
                        reck3s9.width = (tabl.width-16)/9
                        reck4s1.visible = true
                        reck4s1.width = (tabl.width-16)/9
                        reck4s2.visible = true
                        reck4s2.width = (tabl.width-16)/9
                        reck4s3.visible = true
                        reck4s3.width = (tabl.width-16)/9
                        reck4s4.visible = true
                        reck4s4.width = (tabl.width-16)/9
                        reck4s5.visible = true
                        reck4s5.width = (tabl.width-16)/9
                        reck4s6.visible = true
                        reck4s6.width = (tabl.width-16)/9
                        reck4s7.visible = true
                        reck4s7.width = (tabl.width-16)/9
                        reck4s8.visible = true
                        reck4s8.width = (tabl.width-16)/9
                        reck4s9.visible = true
                        reck4s9.width = (tabl.width-16)/9
                        reck5s1.visible = true
                        reck5s1.width = (tabl.width-16)/9
                        reck5s2.visible = true
                        reck5s2.width = (tabl.width-16)/9
                        reck5s3.visible = true
                        reck5s3.width = (tabl.width-16)/9
                        reck5s4.visible = true
                        reck5s4.width = (tabl.width-16)/9
                        reck5s5.visible = true
                        reck5s5.width = (tabl.width-16)/9
                        reck5s6.visible = true
                        reck5s6.width = (tabl.width-16)/9
                        reck5s7.visible = true
                        reck5s7.width = (tabl.width-16)/9
                        reck5s8.visible = true
                        reck5s8.width = (tabl.width-16)/9
                        reck5s9.visible = true
                        reck5s9.width = (tabl.width-16)/9
                        text_dateandtime.visible = true
                        t_dateandtime.visible = true
                        text_rezh.visible = true
                        t_rezh.visible = true
                        text_tipizmer.visible = true
                        t_tipizmer.visible = true
                        text_normed.visible = true
                        t_normed.visible = true
                        text_normagr.visible = true
                        t_normagr.visible = true
                        text_rash.visible = true
                        t_rash.visible = true
                        text_nap.visible = true
                        t_nap.visible = true
                        text_laes2.visible = true
                        t_laes2.visible = true
                        text_ate.visible = true
                        t_ate.visible = true
                        textArea_prim_izmer.visible = true
                        t_prim_izmer.visible = true
                        rec_4.height = parent.height/3
                        if(text_rezh.text == "Холостой ход"){
                            text_normagr.visible = false
                            t_normagr.visible = false
                            tabl.anchors.top = t_normed.bottom
                        }
                    }
// если измерения по 2-ум опорам (холостой ход или двухопорный агрегат)
                    if(k2s4.tex=="" && k2s5.tex=="" && k2s6.tex=="" && k2s7.tex=="" && k2s8.tex=="" && k2s9.tex=="" && k3s4.tex=="" && k3s5.tex=="" && k3s6.tex=="" && k3s7.tex=="" &&
                            k3s8.tex=="" && k3s9.tex=="" && k4s4.tex=="" && k4s5.tex=="" && k4s6.tex=="" && k4s7.tex=="" &&
                            k4s8.tex=="" && k4s9.tex==""){
                        reck1s4.visible = false
                        reck1s4.width = 0
                        reck1s5.visible = false
                        reck1s5.width = 0
                        reck1s6.visible = false
                        reck1s6.width = 0
                        reck1s7.visible = false
                        reck1s7.width = 0
                        reck1s8.visible = false
                        reck1s8.width = 0
                        reck1s9.visible = false
                        reck1s9.width = 0
                        reck2s4.visible = false
                        reck2s4.width = 0
                        reck2s5.visible = false
                        reck2s5.width = 0
                        reck2s6.visible = false
                        reck2s6.width = 0
                        reck2s7.visible = false
                        reck2s7.width = 0
                        reck2s8.visible = false
                        reck2s8.width = 0
                        reck2s9.visible = false
                        reck2s9.width = 0
                        reck3s4.visible = false
                        reck3s4.width = 0
                        reck3s5.visible = false
                        reck3s5.width = 0
                        reck3s6.visible = false
                        reck3s6.width = 0
                        reck3s7.visible = false
                        reck3s7.width = 0
                        reck3s8.visible = false
                        reck3s8.width = 0
                        reck3s9.visible = false
                        reck3s9.width = 0
                        reck4s4.visible = false
                        reck4s4.width = 0
                        reck4s5.visible = false
                        reck4s5.width = 0
                        reck4s6.visible = false
                        reck4s6.width = 0
                        reck4s7.visible = false
                        reck4s7.width = 0
                        reck4s8.visible = false
                        reck4s8.width = 0
                        reck4s9.visible = false
                        reck4s9.width = 0
                        reck5s4.visible = false
                        reck5s4.width = 0
                        reck5s5.visible = false
                        reck5s5.width = 0
                        reck5s6.visible = false
                        reck5s6.width = 0
                        reck5s7.visible = false
                        reck5s7.width = 0
                        reck5s8.visible = false
                        reck5s8.width = 0
                        reck5s9.visible = false
                        reck5s9.width = 0
                    }
// если измерения по 4 опорам
                    if(k2s6.tex=="" && k2s7.tex=="" && k2s8.tex=="" && k2s9.tex=="" && k3s6.tex=="" && k3s7.tex=="" &&
                            k3s8.tex=="" && k3s9.tex=="" && k4s6.tex=="" && k4s7.tex=="" &&
                            k4s8.tex=="" && k4s9.tex==""){
                        reck1s6.visible = false
                        reck1s6.width = 0
                        reck1s7.visible = false
                        reck1s7.width = 0
                        reck1s8.visible = false
                        reck1s8.width = 0
                        reck1s9.visible = false
                        reck1s9.width = 0
                        reck2s6.visible = false
                        reck2s6.width = 0
                        reck2s7.visible = false
                        reck2s7.width = 0
                        reck2s8.visible = false
                        reck2s8.width = 0
                        reck2s9.visible = false
                        reck2s9.width = 0
                        reck3s6.visible = false
                        reck3s6.width = 0
                        reck3s7.visible = false
                        reck3s7.width = 0
                        reck3s8.visible = false
                        reck3s8.width = 0
                        reck3s9.visible = false
                        reck3s9.width = 0
                        reck4s6.visible = false
                        reck4s6.width = 0
                        reck4s7.visible = false
                        reck4s7.width = 0
                        reck4s8.visible = false
                        reck4s8.width = 0
                        reck4s9.visible = false
                        reck4s9.width = 0
                        reck5s6.visible = false
                        reck5s6.width = 0
                        reck5s7.visible = false
                        reck5s7.width = 0
                        reck5s8.visible = false
                        reck5s8.width = 0
                        reck5s9.visible = false
                        reck5s9.width = 0
                    }


                }
            } //item4
//            Item {
//                id: item5
//            } //item5
        } //swipeView
        TabBar {
        id: tabBar1
        height: 40
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        currentIndex: swipeView1.currentIndex
        Material.accent: Material.LightBlue
        onCurrentIndexChanged: {
            if(tabBar1.currentIndex==0){
                but1.color = "white"
                but2.color = "lightblue"
                but3.color = "lightblue"
                but4.color = "lightblue"                
            }
            if(tabBar1.currentIndex==1){
                but1.color = "lightblue"
                but2.color = "white"
                but3.color = "lightblue"
                but4.color = "lightblue"                
            }
            if(tabBar1.currentIndex==2){
                but1.color = "lightblue"
                but2.color = "lightblue"
                but3.color = "white"
                but4.color = "lightblue"                
            }
            if(tabBar1.currentIndex==3){
                but1.color = "lightblue"
                but2.color = "lightblue"
                but3.color = "lightblue"
                but4.color = "white"                
            }

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
        }
        TabButton {
            text: qsTr("Тенические данные")
            font.pixelSize: 15
            //font.family: "Arial"
            font.bold: true
            background: Rectangle {
                id: but2
                border.color: "white"
                color: "lightblue"
            }
    }
                TabButton {
                    text: qsTr("Подшипники")
                    font.pixelSize: 15
                    //font.family: "Arial"
                    font.bold: true
                    background: Rectangle {
                        id: but3
                        border.color: "white"
                        color: "lightblue"
                    }
                }
                TabButton {
                    text: qsTr("Измерения")
                    font.pixelSize: 15
                    //font.family: "Arial"
                    font.bold: true
                    background: Rectangle {
                        id: but4
                        border.color: "white"
                        color: "lightblue"
                    }
                }

    }
    }
    Component.onCompleted: {
        mapper.addMapping(text_kks, (0x0100+2), "tex")
        mapper.addMapping(text_ceh, (0x0100+3), "tex")
        mapper.addMapping(text_zd, (0x0100+4), "tex")
        mapper.addMapping(text_pom, (0x0100+5), "tex")
        mapper.addMapping(text_opis, (0x0100+6), "tex")
        mapper.addMapping(text_kb, (0x0100+7), "tex")
        mapper.addMapping(text_program, (0x0100+8), "tex")
        mapper.addMapping(text_fio, (0x0100+9), "tex")
        mapper.addMapping(textArea_prim, (0x0100+10), "text")
        mapper.addMapping(im_foto, (0x0100+11), "tex")
        mapper.addMapping(im_shema, (0x0100+12), "tex")
        mapper.addMapping(text_kks2, (0x0100+2), "tex")
        mapper.addMapping(text_marka_ed, (0x0100+13), "tex")
        mapper.addMapping(text_mosch, (0x0100+14), "tex")
        mapper.addMapping(text_chastota_ed, (0x0100+15), "tex")
        mapper.addMapping(text_proizv_ed, (0x0100+16), "tex")
        mapper.addMapping(text_tip_permeh, (0x0100+17), "tex")
        mapper.addMapping(text_tip_per, (0x0100+18), "tex")
        mapper.addMapping(text_kolpal, (0x0100+19), "tex")
        mapper.addMapping(text_tip_meh, (0x0100+20), "tex")
        mapper.addMapping(text_marka_meh, (0x0100+21), "tex")
        mapper.addMapping(text_chastota_meh, (0x0100+22), "tex")
        mapper.addMapping(text_kollop, (0x0100+23), "tex")
        mapper.addMapping(text_isp, (0x0100+24), "tex")
        mapper.addMapping(text_tip_opory, (0x0100+25), "tex")
        mapper.addMapping(text_proizv_meh, (0x0100+26), "tex")
        mapper.addMapping(text_napor_nom, (0x0100+27), "tex")
        mapper.addMapping(text_napor_rd, (0x0100+28), "tex")
        mapper.addMapping(text_rashod_nom, (0x0100+29), "tex")
        mapper.addMapping(text_rashod_rd, (0x0100+30), "tex")
        mapper.addMapping(text_norm_hh, (0x0100+31), "tex")
        mapper.addMapping(text_normed_nom, (0x0100+32), "tex")
        mapper.addMapping(text_normagr_nom, (0x0100+33), "tex")
        mapper.addMapping(text_ogred_nom, (0x0100+34), "tex")
        mapper.addMapping(text_ogragr_nom, (0x0100+35), "tex")
        mapper.addMapping(text_otkazed_nom, (0x0100+36), "tex")
        mapper.addMapping(text_otkazagr_nom, (0x0100+37), "tex")
        mapper.addMapping(text_normed_rd, (0x0100+38), "tex")
        mapper.addMapping(text_normagr_rd, (0x0100+39), "tex")
        mapper.addMapping(text_ogred_rd, (0x0100+40), "tex")
        mapper.addMapping(text_ogragr_rd, (0x0100+41), "tex")
        mapper.addMapping(text_otkazed_rd, (0x0100+42), "tex")
        mapper.addMapping(text_otkazagr_rd, (0x0100+43), "tex")
        mapper.addMapping(text_tempotkaz_ed, (0x0100+44), "tex")
        mapper.addMapping(text_tempotkaz_red, (0x0100+45), "tex")
        mapper.addMapping(text_tempotkaz_meh, (0x0100+46), "tex")
        mapper.addMapping(text_izmer_kks, (0x0100+2), "tex")
        //mapper_izmer.addMapping(k2s2, (0x0100+5), "tex")
    }

}
