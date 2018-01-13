import QtQuick 2.0
import QtQuick.Controls 2.3
import QtCharts 2.2
import QtQml.Models 2.3

Item {
    id: item
    Page {
        id: page
        anchors.fill: parent
        Rectangle {
            id: rec1
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: parent.height*4/5
            //color: "lightblue"
            ChartView {
                id: chartKolAgr
                objectName: "chartKolAgr"
                property var array_nameagr
                property var array_kolagr
                property int razmer
                visible: true
                anchors.fill: parent
                antialiasing: true
                legend.visible: false
//dropShadowEnabled: true
                title: "Количество агрегатов"
                BarSeries {
                    id: pie_series
                    labelsVisible: true
                    labelsPosition: AbstractBarSeries.LabelsOutsideEnd
                    axisY: ValueAxis {
                        id: yAxis
                                min: 0
                                max: 10
                                labelsVisible: false
                    }
                    axisX: BarCategoryAxis { categories: chartKolAgr.array_nameagr }
                }
                Component.onCompleted: {
                    qmlKolAgr()
                    var kol = []
                    for(var i=0;i<razmer;i++){
                        kol[i] = parseInt(array_kolagr[i], 10)
                    }
                    yAxis.max = Math.max.apply(null, kol)*1.1
                    var bar = pie_series.append("label", kol)
                    bar.labelColor = "black"
                }
            }
            ChartView {
                id: chartIzmerMes
                objectName: "chartIzmerMes"
                property var array_namemes
                property var array_kolmes
                property int razmer
                visible: false
                anchors.fill: parent
                antialiasing: true
                legend.visible: false
//dropShadowEnabled: true
                title: "Количество измерений по месяцам"
                BarSeries {
                    id: pie_seriesMes
                    labelsVisible: true
                    labelsPosition: AbstractBarSeries.LabelsOutsideEnd
                    axisY: ValueAxis {
                        id: yAxisMes
                                min: 0
                                max: 10
                                labelsVisible: false
                    }
                    axisX: BarCategoryAxis { categories: chartIzmerMes.array_namemes
                    labelsAngle: -90}
                }
                Component.onCompleted: {
                    var kol = []
                    for(var i=0;i<razmer;i++){
                        kol[i] = parseInt(array_kolmes[i], 10)
                    }
                    yAxisMes.max = Math.round(Math.max.apply(null, kol)*1.1)
                    var bar = pie_seriesMes.append("label", kol)
                    bar.labelColor = "black"
                }
            }
            ChartView {
                id: chartIzmerDay
                objectName: "chartIzmerDay"
                property var array_nameday
                property var nameday: [7]
                property var array_kolday
                property var kolday: [7]
                property int razmer
                visible: false
                anchors.fill: parent
                antialiasing: true
                legend.visible: false
//dropShadowEnabled: true
                title: "Количество измерений по дням недели"
                BarSeries {
                    id: pie_seriesDay
                    labelsVisible: true
                    labelsPosition: AbstractBarSeries.LabelsOutsideEnd
                    axisY: ValueAxis {
                        id: yAxisDay
                                min: 0
                                max: 10
                                labelsVisible: false
                    }
                    axisX: BarCategoryAxis {id: category
                        categories: chartIzmerDay.nameday
                    //labelsAngle: -90
                    }
                }
                Component.onCompleted: {
                    nameday[0] = array_nameday[1]
                    nameday[1] = array_nameday[2]
                    nameday[2] = array_nameday[3]
                    nameday[3] = array_nameday[4]
                    nameday[4] = array_nameday[5]
                    nameday[5] = array_nameday[6]
                    nameday[6] = array_nameday[0]
                    kolday[0] = array_kolday[1]
                    kolday[1] = array_kolday[2]
                    kolday[2] = array_kolday[3]
                    kolday[3] = array_kolday[4]
                    kolday[4] = array_kolday[5]
                    kolday[5] = array_kolday[6]
                    kolday[6] = array_kolday[0]
                    var kol = []
                    for(var i=0;i<razmer;i++){
                        kol[i] = parseInt(kolday[i], 10)
                    }
                    yAxisDay.max = Math.round(Math.max.apply(null, kol)*1.1)
                    var bar = pie_seriesDay.append("label", kol)
                    category.categories = nameday
                    bar.labelColor = "black"
                }
            }
            ChartView {
                id: chartIzmerTime
                objectName: "chartIzmerTime"
                property var array_koltime
                visible: false
                anchors.fill: parent
                antialiasing: true
                legend.visible: false
//dropShadowEnabled: true
                title: "Количество измерений по часам"
                BarSeries {
                    id: pie_seriesTime
                    labelsVisible: true
                    labelsPosition: AbstractBarSeries.LabelsOutsideEnd
                    axisY: ValueAxis {
                        id: yAxisTime
                                min: 0
                                max: 10
                                labelsVisible: false
                    }
                    axisX: BarCategoryAxis {id: category2
                        categories: ["00-01","01-02","02-03","03-04","04-05","05-06","06-07","07-08","08-09","09-10","10-11","11-12",
                            "12-13","13-14","14-15","15-16","16-17","17-18","18-19","19-20","20-21","21-22","22-23","23-24"]
                    labelsAngle: -90
                    //labelsVisible: false
                    }
                }
                Component.onCompleted: {
                    console.log(array_koltime)
                    var kol = []
                    for(var i=0;i<24;i++){
                        kol[i] = parseInt(array_koltime[i], 10)
                    }
                    yAxisTime.max = Math.round(Math.max.apply(null, kol)*1.1)
                    var bar = pie_seriesTime.append("label", kol)
                    bar.labelColor = "black"
                    console.log(yAxisTime.max)
                }
            }
        }//end rec1
        Rectangle {
            id: rec2
            anchors.top: rec1.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            //color: "tomato"
            //z: -100
            PathView {
                id: path
                    anchors.fill: parent
                    preferredHighlightBegin: 0.5
                    preferredHighlightEnd: 0.5
                    delegate: flipCardDelegate
                    model: objmodel
                    focus: true
                        Keys.onLeftPressed: decrementCurrentIndex()
                        Keys.onRightPressed: incrementCurrentIndex()
                    onMovementEnded: {
                        if(path.indexAt(path.width/2, path.height/2) === 0){
                            chartIzmerTime.visible = false
                            chartIzmerDay.visible = false
                            chartIzmerMes.visible = false
                            chartKolAgr.visible = true
                        }
                        if(path.indexAt(path.width/2, path.height/2) === 1){
                            chartIzmerTime.visible = false
                            chartIzmerDay.visible = false
                            chartKolAgr.visible = false
                            chartIzmerMes.visible = true
                        }
                        if(path.indexAt(path.width/2, path.height/2) === 2){
                            chartIzmerTime.visible = false
                            chartIzmerMes.visible = false
                            chartKolAgr.visible = false
                            chartIzmerDay.visible = true
                        }
                        if(path.indexAt(path.width/2, path.height/2) === 3){
                            chartIzmerMes.visible = false
                            chartKolAgr.visible = false
                            chartIzmerDay.visible = false
                            chartIzmerTime.visible = true
                        }
                    }

                    path: Path {
                        startX: 0//rec2.width/2
                        startY: rec2.height/2//0

                        PathAttribute { name: "itemZ"; value: 0 }
                        PathAttribute { name: "itemAngle"; value: -90.0; }
                        PathAttribute { name: "itemScale"; value: 0.5; }
                        PathLine { x: rec2.width*0.4; y: rec2.height/2; }
                        PathPercent { value: 0.48; }
                        PathLine { x: rec2.width*0.5; y: rec2.height/2; }
                        PathAttribute { name: "itemAngle"; value: 0.0; }
                        PathAttribute { name: "itemScale"; value: 1.0; }
                        PathAttribute { name: "itemZ"; value: 100 }
                        PathLine { x: rec2.width*0.6; y: rec2.height/2; }
                        PathPercent { value: 0.52; }
                        PathLine { x: rec2.width; y: rec2.height/2; }
                        PathAttribute { name: "itemAngle"; value: 90.0; }
                        PathAttribute { name: "itemScale"; value: 0.5; }
                        PathAttribute { name: "itemZ"; value: 0 }
                    }

                    pathItemCount: 10
//                    preferredHighlightBegin: 0.5
//                    preferredHighlightEnd: 0.5
                }
            ObjectModel {
                id: objmodel
                Rectangle {
                    id:rec00
                    width: rec2.height*1.5
                    height: rec2.height*0.9
                    color: "transparent"
                    visible: PathView.onPath
                    scale: PathView.itemScale
                    z: PathView.itemZ
                    property variant rotY: PathView.itemAngle
                    transform: Rotation {
                        axis { x: 1; y: -1; z: 1 }
                        angle: rec00.rotY;
                        origin { x: rec2.height/2; y: rec2.height/2; }
                    }
                    Text {
                        id: text00
                        z:1
                        anchors.bottom: chartKolAgr1.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: parent.height/5
                        color: "#03a9f5"
                        text: "Количество агрегатов"
                    }
                    ChartView {
                        id: chartKolAgr1
                        //objectName: "chartKolAgr1"
//                        anchors.top: text00.bottom
//                        anchors.left: rec00.left
//                        anchors.right: rec00.right
//                        anchors.bottom: rec00.bottom
                        anchors.fill: parent
                        antialiasing: true
                        legend.visible: false
                        margins.bottom: 0
                        margins.left: 0
                        margins.right: 0
                        margins.top: 0
                        anchors.centerIn: parent

        dropShadowEnabled: true
                        BarSeries {
                            id: pie_series1
                            labelsVisible: false
                            labelsPosition: AbstractBarSeries.LabelsOutsideEnd
                            axisY: ValueAxis {
                                id: yAxis1
                                        min: 0
                                        max: 10
                                        labelsVisible: false
                            }
                            axisX: BarCategoryAxis { categories: chartKolAgr.array_nameagr
                            labelsVisible: false}
                        }
                        Component.onCompleted: {
                            qmlKolAgr()
                            var kol = []
                            for(var i=0;i<chartKolAgr.razmer;i++){
                                kol[i] = parseInt(chartKolAgr.array_kolagr[i], 10)
                            }
                            yAxis1.max = Math.max.apply(null, kol)*1.1
                            var bar1 = pie_series1.append("label", kol)
                            //pie_series1.axisX.
                            //bar1.labelColor = "black"
                        }
                    }
                }
                Rectangle {
                    id:rec01
                    width: rec2.height*1.5
                    height: rec2.height*0.9
                    visible: PathView.onPath
                    scale: PathView.itemScale
                    color: "transparent"
                    z: PathView.itemZ
                    property variant rotY: PathView.itemAngle
                    transform: Rotation {
                        axis { x: 1; y: -1; z: 1 }
                        angle: rec01.rotY;
                        origin { x: rec2.height/2; y: rec2.height/2; }
                    }
                    Text {
                        id: text01
                        z:1
                        anchors.bottom: chartIzmerMes1.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: parent.height/5
                        color: "#03a9f5"
                        text: "Измерения по месяцам"
                    }
                    ChartView {
                        id: chartIzmerMes1
                        anchors.fill: parent
                        antialiasing: true
                        legend.visible: false
                        margins.bottom: 0
                        margins.left: 0
                        margins.right: 0
                        margins.top: 0
                        anchors.centerIn: parent
        dropShadowEnabled: true
                        BarSeries {
                            id: pie_seriesMes1
                            labelsVisible: false
                            labelsPosition: AbstractBarSeries.LabelsOutsideEnd
                            axisY: ValueAxis {
                                id: yAxisMes1
                                        min: 0
                                        max: 10
                                        labelsVisible: false
                            }
                            axisX: BarCategoryAxis { categories: chartIzmerMes.array_namemes
                            labelsAngle: -90
                            labelsVisible: false}
                        }
                        Component.onCompleted: {
                            var kol = []
                            for(var i=0;i<chartIzmerMes.razmer;i++){
                                kol[i] = parseInt(chartIzmerMes.array_kolmes[i], 10)
                            }
                            yAxisMes1.max = Math.round(Math.max.apply(null, kol)*1.1)
                            var bar = pie_seriesMes1.append("label", kol)
                            bar.labelColor = "black"
                        }
                    }
                }
                Rectangle {
                    id:rec02
                    width: rec2.height*1.5
                    height: rec2.height*0.9
                    visible: PathView.onPath
                    scale: PathView.itemScale
                    z: PathView.itemZ
                    property variant rotY: PathView.itemAngle
                    transform: Rotation {
                        axis { x: 1; y: -1; z: 1 }
                        angle: rec02.rotY;
                        origin { x: rec2.height/2; y: rec2.height/2; }
                    }
                    Text {
                        id: text02
                        z:1
                        anchors.bottom: chartIzmerDay1.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: parent.height/5
                        color: "#03a9f5"
                        text: "Измерения по дням недели"
                    }
                    ChartView {
                        id: chartIzmerDay1
                        property var nameday: [7]
                        property var kolday: [7]
                        anchors.fill: parent
                        antialiasing: true
                        legend.visible: false
                        margins.bottom: 0
                        margins.left: 0
                        margins.right: 0
                        margins.top: 0
                        anchors.centerIn: parent
        dropShadowEnabled: true
                        BarSeries {
                            id: pie_seriesDay1
                            labelsVisible: false
                            labelsPosition: AbstractBarSeries.LabelsOutsideEnd
                            axisY: ValueAxis {
                                id: yAxisDay1
                                        min: 0
                                        max: 10
                                        labelsVisible: false
                            }
                            axisX: BarCategoryAxis {id: category1
                                categories: chartIzmerDay.nameday
                            //labelsAngle: -90
                                labelsVisible: false
                            }
                        }
                        Component.onCompleted: {
                            nameday[0] = chartIzmerDay.array_nameday[1]
                            nameday[1] = chartIzmerDay.array_nameday[2]
                            nameday[2] = chartIzmerDay.array_nameday[3]
                            nameday[3] = chartIzmerDay.array_nameday[4]
                            nameday[4] = chartIzmerDay.array_nameday[5]
                            nameday[5] = chartIzmerDay.array_nameday[6]
                            nameday[6] = chartIzmerDay.array_nameday[0]
                            kolday[0] = chartIzmerDay.array_kolday[1]
                            kolday[1] = chartIzmerDay.array_kolday[2]
                            kolday[2] = chartIzmerDay.array_kolday[3]
                            kolday[3] = chartIzmerDay.array_kolday[4]
                            kolday[4] = chartIzmerDay.array_kolday[5]
                            kolday[5] = chartIzmerDay.array_kolday[6]
                            kolday[6] = chartIzmerDay.array_kolday[0]
                            var kol = []
                            for(var i=0;i<chartIzmerDay.razmer;i++){
                                kol[i] = parseInt(kolday[i], 10)
                            }
                            yAxisDay1.max = Math.round(Math.max.apply(null, kol)*1.1)
                            var bar = pie_seriesDay1.append("label", kol)
                            category1.categories = nameday
                        }
                    }
                }
                Rectangle {
                    id:rec03
                    width: rec2.height*1.5
                    height: rec2.height*0.9
                    visible: PathView.onPath
                    scale: PathView.itemScale
                    z: PathView.itemZ
                    property variant rotY: PathView.itemAngle
                    transform: Rotation {
                        axis { x: 1; y: -1; z: 1 }
                        angle: rec03.rotY;
                        origin { x: rec2.height/2; y: rec2.height/2; }
                    }
                    Text {
                        id: text03
                        z:1
                        anchors.bottom: chartIzmerTime1.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: parent.height/5
                        color: "#03a9f5"
                        text: "Измерения по часам"
                    }
                    ChartView {
                        id: chartIzmerTime1
                        anchors.fill: parent
                        antialiasing: true
                        legend.visible: false
                        margins.bottom: 0
                        margins.left: 0
                        margins.right: 0
                        margins.top: 0
                        anchors.centerIn: parent
        dropShadowEnabled: true
                        BarSeries {
                            id: pie_seriesTime1
                            labelsVisible: false
                            labelsPosition: AbstractBarSeries.LabelsOutsideEnd
                            axisY: ValueAxis {
                                id: yAxisTime1
                                        min: 0
                                        max: 10
                                        labelsVisible: false
                            }
                            axisX: BarCategoryAxis {id: category3
                                categories: ["00-01","01-02","02-03","03-04","04-05","05-06","06-07","07-08","08-09","09-10","10-11","11-12",
                                    "12-13","13-14","14-15","15-16","16-17","17-18","18-19","19-20","20-21","21-22","22-23","23-24"]
                            //labelsAngle: -90
                                labelsVisible: false
                            }
                        }
                        Component.onCompleted: {
                            var kol = []
                            for(var i=0;i<24;i++){
                                kol[i] = parseInt(chartIzmerTime.array_koltime[i], 10)
                            }
                            yAxisTime1.max = Math.round(Math.max.apply(null, kol)*1.1)
                            var bar = pie_seriesTime1.append("label", kol)
                        }
                    }
                }
                Rectangle {
                    id:rec05
                    width: rec2.height*1.5
                    height: rec2.height*0.9
                    visible: PathView.onPath
                    scale: PathView.itemScale
                    z: PathView.itemZ
                    property variant rotY: PathView.itemAngle
                    transform: Rotation {
                        axis { x: 1; y: -1; z: 1 }
                        angle: rec05.rotY;
                        origin { x: rec2.height/2; y: rec2.height/2; }
                    }
                    Text {
                        id: text05
                        z:1
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: parent.height/5
                        text: "Количество агрегатов"
                    }
                    ChartView {
                        id: chartKolAgr5
                        //objectName: "chartKolAgr1"
                        anchors.fill: parent
                        antialiasing: true
                        legend.visible: false
                        margins.bottom: 0
                        margins.left: 0
                        margins.right: 0
                        margins.top: 0
                        anchors.centerIn: parent

        dropShadowEnabled: true
                        BarSeries {
                            id: pie_series5
                            labelsVisible: false
                            labelsPosition: AbstractBarSeries.LabelsOutsideEnd
                            axisY: ValueAxis {
                                id: yAxis5
                                        min: 0
                                        max: 10
                                        labelsVisible: false
                            }
                            axisX: BarCategoryAxis { categories: chartKolAgr.array_nameagr
                            labelsVisible: false}
                        }
                        Component.onCompleted: {
                            qmlKolAgr()
                            var kol = []
                            for(var i=0;i<chartKolAgr.razmer;i++){
                                kol[i] = parseInt(chartKolAgr.array_kolagr[i], 10)
                            }
                            yAxis5.max = Math.max.apply(null, kol)*1.1
                            var bar5 = pie_series5.append("label", kol)
                            //pie_series1.axisX.
                            //bar1.labelColor = "black"
                        }
                    }
                }
                Rectangle {
                    id:rec06
                    width: rec2.height*1.5
                    height: rec2.height*0.9
                    visible: PathView.onPath
                    scale: PathView.itemScale
                    z: PathView.itemZ
                    property variant rotY: PathView.itemAngle
                    transform: Rotation {
                        axis { x: 1; y: -1; z: 1 }
                        angle: rec06.rotY;
                        origin { x: rec2.height/2; y: rec2.height/2; }
                    }
                    Text {
                        id: text06
                        z:1
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: parent.height/5
                        text: "Количество агрегатов"
                    }
                    ChartView {
                        id: chartKolAgr6
                        //objectName: "chartKolAgr1"
                        anchors.fill: parent
                        antialiasing: true
                        legend.visible: false
                        margins.bottom: 0
                        margins.left: 0
                        margins.right: 0
                        margins.top: 0
                        anchors.centerIn: parent

        dropShadowEnabled: true
                        BarSeries {
                            id: pie_series6
                            labelsVisible: false
                            labelsPosition: AbstractBarSeries.LabelsOutsideEnd
                            axisY: ValueAxis {
                                id: yAxis6
                                        min: 0
                                        max: 10
                                        labelsVisible: false
                            }
                            axisX: BarCategoryAxis { categories: chartKolAgr.array_nameagr
                            labelsVisible: false}
                        }
                        Component.onCompleted: {
                            qmlKolAgr()
                            var kol = []
                            for(var i=0;i<chartKolAgr.razmer;i++){
                                kol[i] = parseInt(chartKolAgr.array_kolagr[i], 10)
                            }
                            yAxis6.max = Math.max.apply(null, kol)*1.1
                            var bar6 = pie_series6.append("label", kol)
                            //pie_series1.axisX.
                            //bar1.labelColor = "black"
                        }
                    }
                }
                Rectangle {
                    id:rec07
                    width: rec2.height*1.5
                    height: rec2.height*0.9
                    visible: PathView.onPath
                    scale: PathView.itemScale
                    z: PathView.itemZ
                    property variant rotY: PathView.itemAngle
                    transform: Rotation {
                        axis { x: 1; y: -1; z: 1 }
                        angle: rec07.rotY;
                        origin { x: rec2.height/2; y: rec2.height/2; }
                    }
                    Text {
                        id: text07
                        z:1
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: parent.height/5
                        text: "Количество агрегатов"
                    }
                    ChartView {
                        id: chartKolAgr7
                        //objectName: "chartKolAgr1"
                        anchors.fill: parent
                        antialiasing: true
                        legend.visible: false
                        margins.bottom: 0
                        margins.left: 0
                        margins.right: 0
                        margins.top: 0
                        anchors.centerIn: parent

        dropShadowEnabled: true
                        BarSeries {
                            id: pie_series7
                            labelsVisible: false
                            labelsPosition: AbstractBarSeries.LabelsOutsideEnd
                            axisY: ValueAxis {
                                id: yAxis7
                                        min: 0
                                        max: 10
                                        labelsVisible: false
                            }
                            axisX: BarCategoryAxis { categories: chartKolAgr.array_nameagr
                            labelsVisible: false}
                        }
                        Component.onCompleted: {
                            qmlKolAgr()
                            var kol = []
                            for(var i=0;i<chartKolAgr.razmer;i++){
                                kol[i] = parseInt(chartKolAgr.array_kolagr[i], 10)
                            }
                            yAxis7.max = Math.max.apply(null, kol)*1.1
                            var bar7 = pie_series7.append("label", kol)
                            //pie_series1.axisX.
                            //bar1.labelColor = "black"
                        }
                    }
                }
                Rectangle {
                    id:rec08
                    width: rec2.height*1.5
                    height: rec2.height*0.9
                    visible: PathView.onPath
                    scale: PathView.itemScale
                    z: PathView.itemZ
                    property variant rotY: PathView.itemAngle
                    transform: Rotation {
                        axis { x: 1; y: -1; z: 1 }
                        angle: rec08.rotY;
                        origin { x: rec2.height/2; y: rec2.height/2; }
                    }
                    Text {
                        id: text08
                        z:1
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: parent.height/5
                        text: "Количество агрегатов"
                    }
                    ChartView {
                        id: chartKolAgr8
                        //objectName: "chartKolAgr1"
                        anchors.fill: parent
                        antialiasing: true
                        legend.visible: false
                        margins.bottom: 0
                        margins.left: 0
                        margins.right: 0
                        margins.top: 0
                        anchors.centerIn: parent

        dropShadowEnabled: true
                        BarSeries {
                            id: pie_series8
                            labelsVisible: false
                            labelsPosition: AbstractBarSeries.LabelsOutsideEnd
                            axisY: ValueAxis {
                                id: yAxis8
                                        min: 0
                                        max: 10
                                        labelsVisible: false
                            }
                            axisX: BarCategoryAxis { categories: chartKolAgr.array_nameagr
                            labelsVisible: false}
                        }
                        Component.onCompleted: {
                            qmlKolAgr()
                            var kol = []
                            for(var i=0;i<chartKolAgr.razmer;i++){
                                kol[i] = parseInt(chartKolAgr.array_kolagr[i], 10)
                            }
                            yAxis8.max = Math.max.apply(null, kol)*1.1
                            var bar8 = pie_series8.append("label", kol)
                            //pie_series1.axisX.
                            //bar1.labelColor = "black"
                        }
                    }
                }
                Rectangle {
                    id:rec09
                    width: rec2.height*1.5
                    height: rec2.height*0.9
                    visible: PathView.onPath
                    scale: PathView.itemScale
                    z: PathView.itemZ
                    property variant rotY: PathView.itemAngle
                    transform: Rotation {
                        axis { x: 1; y: -1; z: 1 }
                        angle: rec09.rotY;
                        origin { x: rec2.height/2; y: rec2.height/2; }
                    }
                    Text {
                        id: text09
                        z:1
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: parent.height/5
                        text: "Количество агрегатов"
                    }
                    ChartView {
                        id: chartKolAgr9
                        //objectName: "chartKolAgr1"
                        anchors.fill: parent
                        antialiasing: true
                        legend.visible: false
                        margins.bottom: 0
                        margins.left: 0
                        margins.right: 0
                        margins.top: 0
                        anchors.centerIn: parent

        dropShadowEnabled: true
                        BarSeries {
                            id: pie_series9
                            labelsVisible: false
                            labelsPosition: AbstractBarSeries.LabelsOutsideEnd
                            axisY: ValueAxis {
                                id: yAxis9
                                        min: 0
                                        max: 10
                                        labelsVisible: false
                            }
                            axisX: BarCategoryAxis { categories: chartKolAgr.array_nameagr
                            labelsVisible: false}
                        }
                        Component.onCompleted: {
                            qmlKolAgr()
                            var kol = []
                            for(var i=0;i<chartKolAgr.razmer;i++){
                                kol[i] = parseInt(chartKolAgr.array_kolagr[i], 10)
                            }
                            yAxis9.max = Math.max.apply(null, kol)*1.1
                            var bar9 = pie_series9.append("label", kol)
                            //pie_series1.axisX.
                            //bar1.labelColor = "black"
                        }
                    }
                }
                Rectangle {
                    id:rec10
                    width: rec2.height*1.5
                    height: rec2.height*0.9
                    visible: PathView.onPath
                    scale: PathView.itemScale
                    z: PathView.itemZ
                    property variant rotY: PathView.itemAngle
                    transform: Rotation {
                        axis { x: 1; y: -1; z: 1 }
                        angle: rec10.rotY;
                        origin { x: rec2.height/2; y: rec2.height/2; }
                    }
                    Text {
                        id: text10
                        z:1
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: parent.height/5
                        text: "Количество агрегатов"
                    }
                    ChartView {
                        id: chartKolAgr10
                        //objectName: "chartKolAgr1"
                        anchors.fill: parent
                        antialiasing: true
                        legend.visible: false
                        margins.bottom: 0
                        margins.left: 0
                        margins.right: 0
                        margins.top: 0
                        anchors.centerIn: parent

        dropShadowEnabled: true
                        BarSeries {
                            id: pie_series10
                            labelsVisible: false
                            labelsPosition: AbstractBarSeries.LabelsOutsideEnd
                            axisY: ValueAxis {
                                id: yAxis10
                                        min: 0
                                        max: 10
                                        labelsVisible: false
                            }
                            axisX: BarCategoryAxis { categories: chartKolAgr.array_nameagr
                            labelsVisible: false}
                        }
                        Component.onCompleted: {
                            qmlKolAgr()
                            var kol = []
                            for(var i=0;i<chartKolAgr.razmer;i++){
                                kol[i] = parseInt(chartKolAgr.array_kolagr[i], 10)
                            }
                            yAxis10.max = Math.max.apply(null, kol)*1.1
                            var bar10 = pie_series10.append("label", kol)
                            //pie_series1.axisX.
                            //bar1.labelColor = "black"
                        }
                    }
                }
            }//end objmodel


            Component {
                    id: flipCardDelegate
                    Rectangle {
                        id: wrapper
                        width: rec2.height*1.5
                        height: rec2.height*0.9
//                        antialiasing: true
//                        border.color: "blue"
//                        //color: "transparent"
////                        gradient: Gradient {
////                            GradientStop { position: 0.0; color: "#2ed5fa" }
////                            GradientStop { position: 1.0; color: "#2467ec" }
////                        }
//                        visible: PathView.onPath
//                        scale: PathView.itemScale
//                        z: PathView.itemZ
//                        property variant rotY: PathView.itemAngle
//                        transform: Rotation {
//                            axis { x: 1; y: -1; z: 1 }
//                            angle: wrapper.rotY;
//                            origin { x: rec2.height/2; y: rec2.height/2; }
//                        }
                    }
                }
        }
    }
}
