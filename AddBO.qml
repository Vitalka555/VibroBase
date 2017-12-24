import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import QtQuick.Dialogs 1.2

Item {
    TextField {
        id: tf_kks
        anchors.top: parent.top
        anchors.left: parent.left
        text: ""
    }
    Button {
        id: but_save
        anchors.top: tf_kks.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        height: 100
        width: 100
        text: "Save"
        onClicked: {
            database.editTableBaza(stackView.baza_id, tf_kks.text)
            model0.updateModel()
            //model_openBO.resetInternalData()
            //model_openBO.setData(tf_kks.text, Bazakks)
            //mapper.addMapping()
            //mapper.updateData()
            //mapper.addMapping((0x0100+2), tf_kks, "text")
        }
    }

    Component.onCompleted: {
        qmlSignal_baza_id()
        mapper.addMapping(tf_kks, (0x0100+2), "text")
    }

}
