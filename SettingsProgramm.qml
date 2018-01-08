import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Dialogs 1.3

Item {
    id: item
    Component.onCompleted: {
        qmlSignalReadPath()
        pathToFile.text = stackView.pathToBaseRead
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
        anchors.left: text_path.right
        anchors.leftMargin: 5
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
    Button {
        id: but_save
        anchors.top: text_path.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        text: "Сохранить"
        onClicked: {
            stackView.pathToBase = pathToFile.text
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
