import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Dialogs 1.3

Item {
    id: item
    Component.onCompleted: {
        qmlSignalReadPath()
        pathToFile.text = stackView.pathToBaseRead
        pathToPhoto.text = stackView.pathToPhotoRead
        pathToShema.text = stackView.pathToShemaRead
        sw1.checked = stackView.running
        spin.value = stackView.time_interval
    }
    Page {
    anchors.fill: parent
    Text {
        id: text_path
        anchors.verticalCenter: pathToFile.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.pixelSize: 15
        text: "Путь к файлу базы:"
    }
    TextField{
        id: pathToFile
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.left: pathToShema.left
        anchors.right: but_path.left
        anchors.rightMargin: 5
    }
    Button {
        id: but_path
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.top: pathToFile.top
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
                id: loadPath
                objectName: "loadPath"
                property string path: ""
                folder: "."
                title: "Выберите файл"
                selectMultiple: false
                nameFilters: [ "Database files (*.db)", "All files (*)" ]
                onAccepted: { console.log("Accepted: " + fileUrl)
                    loadPath.path = fileUrl
                    pathToFile.text = loadPath.path.replace("file:///","")
                }
            }
        onClicked: {
            loadPath.open()
        }
    }
    Text {
        id: text_path1
        anchors.verticalCenter: pathToPhoto.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.pixelSize: 15
        text: "Путь к папке с фото:"
    }
    TextField{
        id: pathToPhoto
        anchors.top: pathToFile.bottom
        anchors.topMargin: 5
        anchors.left: pathToShema.left
        anchors.right: but_path1.left
        anchors.rightMargin: 5
    }
    Button {
        id: but_path1
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.top: pathToPhoto.top
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
                id: loadPath1
                objectName: "loadPath1"
                property string path: ""
                folder: "."
                title: "Выберите папку"
                selectMultiple: false
                selectFolder: true
                //nameFilters: [ "Database files (*.db)", "All files (*)" ]
                onAccepted: { console.log("Accepted: " + fileUrl)
                    loadPath1.path = fileUrl
                    pathToPhoto.text = loadPath1.path.replace("file:///","")
                }
            }
        onClicked: {
            loadPath1.open()
        }
    }
    Text {
        id: text_path2
        anchors.verticalCenter: pathToShema.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.pixelSize: 15
        text: "Путь к папке со схемами:"
    }
    TextField{
        id: pathToShema
        anchors.top: pathToPhoto.bottom
        anchors.topMargin: 5
        anchors.left: text_path2.right
        anchors.leftMargin: 5
        anchors.right: but_path2.left
        anchors.rightMargin: 5
    }
    Button {
        id: but_path2
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.top: pathToShema.top
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
                id: loadPath2
                objectName: "loadPath2"
                property string path: ""
                folder: "."
                title: "Выберите папку"
                selectMultiple: false
                selectFolder: true
                //nameFilters: [ "Database files (*.db)", "All files (*)" ]
                onAccepted: { console.log("Accepted: " + fileUrl)
                    loadPath2.path = fileUrl
                    pathToShema.text = loadPath2.path.replace("file:///","")
                }
            }
        onClicked: {
            loadPath2.open()
        }
    }
    Text {
        id: text_interval
        anchors.top: pathToShema.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.pixelSize: 15
        text: "Автообновление таблиц:"
    }
    Switch{
        id: sw1
        anchors.verticalCenter: text_interval.verticalCenter
        anchors.left: text_interval.right
        anchors.leftMargin: 5
        checked: false
        Material.accent: Material.LightBlue
    }
    Text {
        id: text_interval2
        visible: sw1.checked
        anchors.verticalCenter: text_interval.verticalCenter
        anchors.left: sw1.right
        anchors.leftMargin: 5
        font.pixelSize: 15
        text: "Интервал в секундах (от 5 до 3600):"
    }
    SpinBox {
        id: spin
        anchors.verticalCenter: text_interval.verticalCenter
        anchors.left: text_interval2.right
        anchors.leftMargin: 5
        visible: sw1.checked
        from: 5
        to: 3600
        value: 60
        editable: true
    }

    Button {
        id: but_save
        anchors.top: text_interval.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        width: text_save.width+10
        highlighted: true
        Material.accent: Material.LightBlue
        Text {
            id: text_save
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 20
            color: "white"
            text: "Сохранить"
        }
        onClicked: {
            stackView.pathToBase = pathToFile.text
            stackView.pathToPhoto = pathToPhoto.text
            stackView.pathToShema = pathToShema.text
            stackView.running = sw1.checked
            stackView.time_interval = spin.value
            qmlSignalWritePath()
            model0.updateModel()
            model_1V.updateModel()
            model_ate.updateModel()
            model_ceh.updateModel()
            model_fio.updateModel()
            model_izmer.updateModel()
            model_kks.updateModel()
            model_laes.updateModel()
            model_maxlevel.updateModel()
            model_norm_creatBI.updateModel()
            model_normhh.updateModel()
            model_normnom.updateModel()
            model_normnomed.updateModel()
            model_normrd.updateModel()
            model_normrded.updateModel()
            model_ogrnom.updateModel()
            model_ogrnomed.updateModel()
            model_ogrrd.updateModel()
            model_ogrrded.updateModel()
            model_openBI.updateModel()
            model_openBO.updateModel()
            model_otkaznom.updateModel()
            model_otkaznomed.updateModel()
            model_otkazrd.updateModel()
            model_otkazrded.updateModel()
            model_polozhenie.updateModel()
            model_program.updateModel()
            model_proizved.updateModel()
            model_proizvmeh.updateModel()
            model_rezhim.updateModel()
            model_tipizmer.updateModel()
            model_tipmeh.updateModel()
            model_tipopory.updateModel()
            model_tipper.updateModel()
            model_tippermeh.updateModel()
        }
    }
    }

}
