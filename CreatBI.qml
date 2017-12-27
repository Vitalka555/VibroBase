import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Extras 1.2

Item {
    Page {
        anchors.fill: parent
//        Rectangle {
//            id: root
//                width: 600
//                height: 400
//                visible: true

//                Tumbler {
//                    id: tumbler
//                    anchors.centerIn: parent

//                    TextMetrics {
//                        id: characterMetrics
//                        font.bold: true
//                        text: "M"
//                    }

//                    readonly property real delegateTextMargins: characterMetrics.width * 1.5
//                    readonly property var days: [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

//                    TumblerColumn {
//                        id: tumblerDayColumn

//                        function updateModel() {
//                            var previousIndex = tumblerDayColumn.currentIndex;
//                            var newDays = tumbler.days[monthColumn.currentIndex];

//                            if (!model) {
//                                var array = [];
//                                for (var i = 0; i < newDays; ++i) {
//                                    array.push(i + 1);
//                                }
//                                model = array;
//                            } else {
//                                // If we've already got days in the model, just add or remove
//                                // the minimum amount necessary to make spinning the month column fast.
//                                var difference = model.length - newDays;
//                                if (model.length > newDays) {
//                                    model.splice(model.length - 1, difference);
//                                } else {
//                                    var lastDay = model[model.length - 1];
//                                    for (i = lastDay; i < lastDay + difference; ++i) {
//                                        model.push(i + 1);
//                                    }
//                                }
//                            }

//                            tumbler.setCurrentIndexAt(0, Math.min(newDays - 1, previousIndex));
//                        }
//                    }
//                    TumblerColumn {
//                        id: monthColumn
//                        width: characterMetrics.width * 3 + tumbler.delegateTextMargins
//                        model: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
//                        onCurrentIndexChanged: tumblerDayColumn.updateModel()
//                    }
//                    TumblerColumn {
//                        id: yearColumn
//                        width: characterMetrics.width * 4 + tumbler.delegateTextMargins
//                        model: ListModel {
//                            Component.onCompleted: {
//                                for (var i = 2000; i < 2100; ++i) {
//                                    append({value: i.toString()});
//                                }
//                            }
//                        }
//                    }

//                    style: TumblerStyle {
//                        id: tumblerStyle

//                        delegate: Item {
//                            implicitHeight: (tumbler.height - padding.top - padding.bottom) / tumblerStyle.visibleItemCount

//                            Text {
//                                id: label
//                                text: styleData.value
//                                color: styleData.current ? "red" : "#666666"
//                                opacity: 0.4 + Math.max(0, 1 - Math.abs(styleData.displacement)) * 0.6
//                                anchors.centerIn: parent
//                            }
//                        }
//                    }
//                }
//        }
//        Item {
//            id: win
//            anchors.top: parent.top
//            anchors.left: root.right
//            visible: true
//            width: 280
//            height: 280
//            //title: qsTr("TimePicker")
//            property string rec_color: "transparent"
//            property string rec2_color: "transparent"
//            property string rec_bordercolor: "transparent"
//            property string rec2_bordercolor: "transparent"
//        //    Button {
//        //        id: but0
//        //        anchors.centerIn: parent
//        //        text: "Введите время"
//        //        onClicked: {
//        //            hour00_12.choiceActive = true
//        //            hour12_24.choiceActive = true
//        //            but0.visible = false
//        //            row.visible = true
//        //        }
//        //    }

//            RowLayout {
//                id: rowt
//                anchors.centerIn: parent
//                //visible: false
//                Text {
//                    id: t1
//                    font.pixelSize: 30
//                    font.bold: true
//                    color: "blue"
//                    text: "00"
//                }
//                Text {
//                    //id: t2
//                    font.pixelSize: 30
//                    font.bold: true
//                    color: "blue"
//                    text: ":"
//                }
//                Text {
//                    id: t2
//                    font.pixelSize: 30
//                    font.bold: true
//                    color: "blue"
//                    text: "00"
//                }
//            }

//            PathView {
//                id: hour00_12
//                property bool choiceActive: true
//                interactive: false
//                visible: hour00_12.choiceActive
//                highlightRangeMode:  PathView.NoHighlightRange
//                //currentIndex: -1

//                model: 12
//                highlight: Rectangle {
//                    id: rect
//                    width: 30 * 1.5
//                    height: width
//                    radius: width / 2
//                    border.color: win.rec_bordercolor
//                    color: win.rec_color
//                    visible: hour00_12.choiceActive
//                }
//                delegate: Item {
//                    id: deleg
//                    width: 30
//                    height: 30
//                    property bool currentItem: PathView.view.currentIndex == index
//                    property alias text : text_hour_00_12.text

//                    Text {
//                        id: text_hour_00_12
//                        anchors.centerIn: parent
//                        font.pixelSize: 24
//                        font.bold: currentItem
//                        text: index
//                        color: "blue"
//                    }
//                    MouseArea {
//                        anchors.fill: parent
//                        enabled: hour00_12.choiceActive
//                        hoverEnabled: true
//                        onEntered: {
//                            hour00_12.currentIndex = index
//                            text_hour_00_12.font.pixelSize = 28
//                            win.rec_color = "#03a9f5"
//                            win.rec2_color = "transparent"
//                            win.rec_bordercolor = "darkgray"
//                            win.rec2_bordercolor = "transparent"
//                            if(hour00_12.currentIndex>9){
//                            t1.text = hour00_12.currentIndex
//                            } else {t1.text = "0" + hour00_12.currentIndex}
//                        }
//                        onExited: {
//                            text_hour_00_12.font.pixelSize = 24

//                        }
//                        onClicked: {
//                            hour00_12.choiceActive = false
//                            hour12_24.choiceActive = false
//                            minute.choiceActive = true
//                        }
//                    }
//                }
//                path: Path {
//                    startX: 140
//                    startY: 30
//                    PathArc {
//                        x: 140; y: 250
//                        radiusX: 110; radiusY: 110
//                        useLargeArc: false
//                    }
//                    PathArc {
//                        x: 140; y: 30
//                        radiusX: 110; radiusY: 110
//                        useLargeArc: false
//                    }
//                }
//            }
//            PathView {
//                id: hour12_24
//                property bool choiceActive: true
//                interactive: false
//                visible: hour12_24.choiceActive
//                highlightRangeMode:  PathView.NoHighlightRange
//                model: 12
//                highlight: Rectangle {
//                    id: rect2
//                    width: 30 * 1.5
//                    height: width
//                    radius: width / 2
//                    border.color: win.rec2_bordercolor
//                    color: win.rec2_color
//                    visible: hour12_24.choiceActive
//                }
//                delegate: Item {
//                    id: deleg2
//                    width: 30
//                    height: 30
//                    property bool currentItem: PathView.view.currentIndex == index
//                    Text {
//                        id: text_hour_12_24
//                        anchors.centerIn: parent
//                        font.pixelSize: 12
//                        font.bold: currentItem
//                        text: index+12
//                        color: "blue"
//                    }
//                    MouseArea {
//                        anchors.fill: parent
//                        enabled: hour12_24.choiceActive
//                        hoverEnabled: true
//                        onEntered: {
//                            hour12_24.currentIndex = index
//                            text_hour_12_24.font.pixelSize = 28
//                            win.rec2_color = "#03a9f5"
//                            win.rec_color = "transparent"
//                            win.rec2_bordercolor = "darkgray"
//                            win.rec_bordercolor = "transparent"
//                            t1.text = hour12_24.currentIndex + 12
//                        }
//                        onExited: {
//                            text_hour_12_24.font.pixelSize = 12
//                        }
//                        onClicked: {
//                            hour00_12.choiceActive = false
//                            hour12_24.choiceActive = false
//                            minute.choiceActive = true
//                        }
//                    }
//                }
//                path: Path {
//                    startX: 140
//                    startY: 70
//                    PathArc {
//                        x: 140; y: 210
//                        radiusX: 70; radiusY: 70
//                        useLargeArc: false
//                    }
//                    PathArc {
//                        x: 140; y: 70
//                        radiusX: 70; radiusY: 70
//                        useLargeArc: false
//                    }
//                }
//            }
//            PathView {
//                id: minute
//                property bool choiceActive: false
//                interactive: false
//                visible: minute.choiceActive
//                highlightRangeMode:  PathView.NoHighlightRange
//                model: 12
//                highlight: Rectangle {
//                    id: rect3
//                    width: 30 * 1.5
//                    height: width
//                    radius: width / 2
//                    border.color: "darkgray"
//                    color: "#03a9f5"
//                    visible: minute.choiceActive
//                }
//                delegate: Item {
//                    id: deleg3
//                    width: 30
//                    height: 30
//                    property bool currentItem: PathView.view.currentIndex == index
//                    Text {
//                        id: text_minute
//                        anchors.centerIn: parent
//                        font.pixelSize: 24
//                        font.bold: currentItem
//                        text: index*5
//                        color: "blue"
//                    }
//                    MouseArea {
//                        anchors.fill: parent
//                        enabled: minute.choiceActive
//                        hoverEnabled: true
//                        onEntered: {
//                            minute.currentIndex = index
//                            text_minute.font.pixelSize = 28
//        //                    win.rec2_color = "lightblue"
//        //                    win.rec_color = "transparent"
//        //                    win.rec2_bordercolor = "darkgray"
//        //                    win.rec_bordercolor = "transparent"
//                            if(minute.currentIndex*5<10){
//                            t2.text = "0" + minute.currentIndex*5
//                            } else {t2.text = minute.currentIndex*5}
//                        }
//                        onExited: {
//                            text_minute.font.pixelSize = 24
//                        }
//                        onClicked: {
//                            minute.choiceActive = false
//                            //hour12_24.visible = false
//                        }
//                    }
//                }
//                path: Path {
//                    startX: 140
//                    startY: 30
//                    PathArc {
//                        x: 140; y: 250
//                        radiusX: 110; radiusY: 110
//                        useLargeArc: false
//                    }
//                    PathArc {
//                        x: 140; y: 30
//                        radiusX: 110; radiusY: 110
//                        useLargeArc: false
//                    }
//                }
//            }
//        }

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
            anchors.left: text_kks.right
            anchors.leftMargin: 5
            width: 200
            editable: true
            inputMethodHints: Qt.ImhNone
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
                    combo_ceh.id = ""
                } else {
                combo_kks.id = model_kks.getId(currentIndex)
                }
            }

        }
        Button {
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
    } // end page
//    Calendar {
//        anchors.bottom: parent.bottom
//        anchors.left: parent.left
//    }

}
