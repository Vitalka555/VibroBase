import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.LocalStorage 2.0
//import QtQuick.Controls.Material 2.2
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
//                    database.removeRecord(model0.getId(list.currentIndex))
//                    model0.updateModel()
                }
            }
        }
    Rectangle {
        id: rec_table
        anchors.top: rec_0.bottom
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
                width: parent.width*3/20
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_kks
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("Дата и время")
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
                width: parent.width*3/20
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_ceh
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("KKS")
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
                width: parent.width/20
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_zd
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                    text: qsTr("Vmax")
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
                width: parent.width*3/20
                radius: 10
                color: "#03a9f5"
                Text {
                    id: text_pom
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
                anchors.left: rec_pom.right
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
                                    text: Bazaizmerdate
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
                                    text: Bazaizmerkks
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
                                    text: Bazaizmervmax
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
                                    text: Bazaizmerrezhim
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
                                    text: Bazaizmerlaes2
                                }

                            Component.onCompleted: {
//                                flick.h = Math.max(text1.height*2,text2.height,text3.height,text4.height,text5.height,text6.height)
//                                console.log("flick.h = ", flick.h)
                                flick.h = text1.height*2
                            }
                        }
                        Rectangle {
                            id: rec7
                            anchors.top: parent.top
                            anchors.left: rec6.right
                            anchors.leftMargin: 5
                            width: rec_name2.width
                            height: flick.h
                            border.color: "#3E65FF"
                            radius: 10
                            opacity: 0.8
                            color: item_table.col

                                Text {
                                    id: text7
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

    } //page

}
