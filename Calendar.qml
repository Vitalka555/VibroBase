import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2

import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2

Item {
    visible: true
    width: 640
    height: 480
    //title: qsTr("Hello World")

    /* Создадим переменную для хранения даты, чтобы не заморачиваться
     * с конвертацией типов
     * */
    //property var tempDate: new Date();

//    Button {
//        id: button
//        // Устанавливаем текущую дату при запуске приложения на кнопку
//        text: Qt.formatDate(tempDate, "dd.MM.yyyy");
//        anchors.centerIn: parent // Центруем кнопку в окне

//        // По клику на кнопку запускаем диалоговое окно черз кастомную функцию
//        onClicked: dialogCalendar.show(tempDate)

//    }

    Item {
        id: dialogCalendar
        // Задаём размеры диалогового окна
        width: 375
        height: 450
        anchors.centerIn: parent

        // Создаем контент диалогового окна
        Rectangle {
            id: dialogRect
            color: "white"
            anchors.fill: parent

            // Первым идёт кастомный календарь
            Calendar {
                id: calendar
                // Размещаем его в верхней части диалога и растягиваем по ширине
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: row.top
//                Component.onCompleted: {
//                    dialogCalendar.show(page.tempDate)
//                }

                // Стилизуем Календарь
                style: CalendarStyle {

                    // Стилизуем navigationBar
                    navigationBar: Rectangle {
                        /* Он будет состоять из прямоугольника,
                         * в котором будет располагаться две кнопки и label
                         * */
                        height: 48
                        color: "white"

                        /* Горизонтальный разделитель,
                         * который отделяет navigationBar от поля с  числами
                         * */
                        Rectangle {
                            color: "#d7d7d7"
                            height: 1
                            width: parent.width
                            anchors.bottom: parent.bottom
                        }

                        // Кнопка промотки месяцев назад
                        Button {
                            id: previousMonth
                            width: parent.height - 8
                            height: width
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 8

                            /* По клику по кнопке вызываем функцию
                             * календаря, которая отматывает месяц назад
                             * */
                            onClicked: control.showPreviousMonth()

                            // Стилизуем кнопку
                            style: ButtonStyle {
                                background: Rectangle {
                                    // Окрашиваем фон кнопки
                                    color: "white"
                                    /* И помещаем изображение, у которго будет
                                     * два источника файлов в зависимости от того
                                     * нажата кнопка или нет
                                     */
                                    Image {
                                        source: control.pressed ? "file:./Images/left_arrow_disable.png" : "file:./Images/left_arrow.png"
                                        width: parent.height - 8
                                        height: width
                                    }
                                }
                            }
                        }

                        // Помещаем стилизованный label
                        Label {
                            id: dateText
                            /* Забираем данные из title календаря,
                             * который в данном случае не будет виден
                             * и будет заменён данным label
                             */
                            text: styleData.title
                            color:  "#03a9f5"
                            elide: Text.ElideRight
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 16
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: previousMonth.right
                            anchors.leftMargin: 2
                            anchors.right: nextMonth.left
                            anchors.rightMargin: 2
                        }

                        // Кнопка промотки месяцев вперёд
                        Button {
                            id: nextMonth
                            width: parent.height - 8
                            height: width
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.right

                            /* По клику по кнопке вызываем функцию
                             * календаря, которая отматывает месяц назад
                             * */
                            onClicked: control.showNextMonth()

                             // Стилизуем кнопку
                            style: ButtonStyle {
                                // Окрашиваем фон кнопки
                                background: Rectangle {
                                    color: "white"
                                    /* И помещаем изображение, у которго будет
                                     * два источника файлов в зависимости от того
                                     * нажата кнопка или нет
                                     */
                                    Image {
                                        source: control.pressed ? "file:./Images/right_arrow_disable.png" : "file:./Images/right_arrow.png"
                                        width: parent.height - 8
                                        height: width
                                    }
                                }
                            }
                        }
                    }


                    // Стилизуем отображением квадратиков с числами месяца
                    dayDelegate: Rectangle {
                        anchors.fill: parent
                        anchors.margins: styleData.selected ? -1 : 0
                        // Определяем цвет в зависимости от того, выбрана дата или нет
                        color: styleData.date !== undefined && styleData.selected ? selectedDateColor : "transparent"

                        // Задаём предопределённые переменные с цветами, доступные только для чтения
                        readonly property color sameMonthDateTextColor: "#3E65FF"
                        readonly property color selectedDateColor: "#03a9f5"
                        readonly property color selectedDateTextColor: "white"
                        readonly property color differentMonthDateTextColor: "#bbb"
                        readonly property color invalidDateColor: "#dddddd"

                        // Помещаем Label для отображения числа
                        Label {
                            id: dayDelegateText
                            text: styleData.date.getDate() // Устанавливаем число в текущий квадрат
                            anchors.centerIn: parent
                            horizontalAlignment: Text.AlignRight
                            font.pixelSize: 16

                            // Установка цвета
                            color: {
                                var theColor = invalidDateColor; // Устанавливаем невалидный цвет текста
                                if (styleData.valid) {
                                    /* Определяем цвет текста в зависимости от того
                                     * относится ли дата к выбранному месяцу или нет
                                     * */
                                    theColor = styleData.visibleMonth ? sameMonthDateTextColor : differentMonthDateTextColor;
                                    if (styleData.selected)
                                        // Перекрашиваем цвет текста, если выбрана данная дата в календаре
                                        theColor = selectedDateTextColor;
                                }
                                theColor;
                            }
                        }
                    }
                }
            }

            // Делаем панель с кнопками
            Row {
                id: row
                height: 48
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom

                // Кнопка для закрытия диалога
                Button {
                    id: dialogButtonCalCancel
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    width: parent.width / 2 - 1

                    style: ButtonStyle {
                        background: Rectangle {
                            color: control.pressed ? "#d7d7d7" : "#f7f7f7"
                            border.width: 0
                        }

                        label: Text {
                            text: qsTr("Отмена")
                            font.pixelSize: 14
                            color: "#34aadc"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
                    // По нажатию на кнопку - просто закрываем диалог
                    onClicked: {
                        calendar0.visible = false
                        page.visible = true
                    }
                }

                // Вертикальный разделитель между кнопками
                Rectangle {
                    id: dividerVertical
                    width: 2
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    color: "#d7d7d7"
                }

                // Кнопка подтверждения выбранной даты
                Button {
                    id: dialogButtonCalOk
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    width: parent.width / 2 - 1

                    style: ButtonStyle {
                        background: Rectangle {
                            color: control.pressed ? "#d7d7d7" : "#f7f7f7"
                            border.width: 0
                        }

                        label: Text {
                            text: qsTr("Ok")
                            font.pixelSize: 14
                            color: "#34aadc"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }

                    /* По клику по кнопке сохраняем выбранную дату во временную переменную
                     * и помещаем эту дату на кнопку в главном окне,
                     * после чего закрываем диалог
                     */
                    onClicked: {
                        page.tempDate = calendar.selectedDate
                        tf_date.text = Qt.formatDate(page.tempDate, "ddMMyyyy");
                        //tf_date.tex = Qt.formatDate(page.tempDate, "yyyy-MM-dd");
                        //button.text = Qt.formatDate(tempDate, "dd.MM.yyyy");
                        //dialogCalendar.close();
                        calendar0.visible = false
                        page.visible = true
                        //console.log(tf_date.tex)
                    }
                }
            }
        }

        /* Данная функция необходима для того, чтобы
         * установить дату с кнопки в календарь,
         * иначе календарь откроется с текущей датой
         */
        function show(x){
            calendar.selectedDate = x
            //dialogCalendar.open()
        }
    }
}
