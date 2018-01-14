#include "stat.h"

Stat::Stat(QObject *parent) : QObject(parent)
{

}
void Stat::getdate()
{
    QObject* filter_izmer = this->parent()->findChild<QObject*>("filter_izmer");
    QSqlQuery querydate1("SELECT min(Дата) FROM BazaIzmereni where Дата is not null");
    while (querydate1.next()) {
        date_begin =  querydate1.value(0).toString();
        //qDebug()<<"date_begin"<<date_begin;
    }
    QSqlQuery querydate2("SELECT max(Дата) FROM BazaIzmereni where Дата is not null");
    while (querydate2.next()) {
        date_end =  querydate2.value(0).toString();
        //qDebug()<<"date_end"<<date_end;
    }
    personal_select = "";
    filter_izmer->setProperty("date_begin", date_begin);
    filter_izmer->setProperty("date_end", date_end);
}
void Stat::getpersonal()
{
    QObject* filter_izmer = this->parent()->findChild<QObject*>("filter_izmer");
    QStringList personal;
    int razmer;
    int i = 0;
    QSqlQuery querypers("SELECT Фамилия FROM LAES ORDER BY Фамилия");
    while (querypers.next()) {
        personal.append(querypers.value(0).toString());
        i++;
    }
    razmer = i;
    filter_izmer->setProperty("personal", personal);
    filter_izmer->setProperty("razmer", razmer);
}

void Stat::kolagr()
{
    QObject* chartKolAgr = this->parent()->findChild<QObject*>("chartKolAgr");
    int razmer;
    QSqlQuery query0("SELECT COUNT(TipMehanizma.id) FROM TipMehanizma");
    while (query0.next()) {
        razmer = query0.value(0).toInt();
    }
    QStringList list1;
    QStringList list2;
    QSqlQuery query("SELECT TipMehanizma.Наименование FROM TipMehanizma");
    int i = 0;
    while (query.next()) {
        list1.append(query.value(0).toString());
        i++;
    }
int k;
for(k = 0; k<i; k++){
    QSqlQuery query("SELECT COUNT(Baza.id) FROM Baza WHERE Baza.id_TipMehanizma = (SELECT TipMehanizma.id "
                    "FROM TipMehanizma WHERE TipMehanizma.Наименование = '" + list1.value(k) + "')");
    while (query.next()) {
        list2.append(query.value(0).toString());
    }
}
chartKolAgr->setProperty("array_nameagr", list1);
chartKolAgr->setProperty("array_kolagr", list2);
chartKolAgr->setProperty("razmer", razmer);
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
QObject* chartIzmerMes = this->parent()->findChild<QObject*>("chartIzmerMes");
//QString date_begin_=(filter_izmer->property("date_begin")).toString();
//QString date_end_=(filter_izmer->property("date_end")).toString();
//qDebug()<<"date_end из QML"<<date_end_;
int razmer1;
//qDebug()<<"date_begin"<<date_begin;
//qDebug()<<"date_end"<<date_end;

QString pers;
if(personal_select == ""){
    pers = "";
} else {
    pers = " and BazaIzmereni.'ЛАЭС-2' LIKE '%" + personal_select + "%' ";
}
QSqlQuery query1("SELECT strftime('%m-%Y', Дата), COUNT(1) FROM BazaIzmereni where Дата is not null and Дата >='" + date_begin +
                "' and Дата <='" + date_end + "' " + pers + " GROUP BY strftime('%Y-%m', Дата)");
QStringList list3;
QStringList list4;
//QSqlQuery query("SELECT TipMehanizma.Наименование FROM TipMehanizma");
i = 0;
while (query1.next()) {
    list3.append(query1.value(0).toString());
    list4.append(query1.value(1).toString());
    i++;
}
razmer1 = i;
chartIzmerMes->setProperty("array_namemes", list3);
chartIzmerMes->setProperty("array_kolmes", list4);
chartIzmerMes->setProperty("razmer", razmer1);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
QObject* chartIzmerDay = this->parent()->findChild<QObject*>("chartIzmerDay");
int razmer2;
QSqlQuery query2("select case cast (strftime('%w', Дата) as integer) when 0 then 'Вс' when 1 then 'Пн' when 2 then 'Вт' "
                 "when 3 then 'Ср' when 4 then 'Чт' when 5 then 'Пт' else 'Сб' end as servdayofweek, (CASE WHEN COUNT(1) > 0 THEN COUNT(1) ELSE 0 END) "
                 "from BazaIzmereni where Дата is not null and Дата >='" + date_begin +
                 "' and Дата <='" + date_end + "' " + pers + " GROUP BY strftime('%w', Дата)");
QStringList list5;
QStringList list6;
//QSqlQuery query("SELECT TipMehanizma.Наименование FROM TipMehanizma");
i = 0;
while (query2.next()) {
    list5.append(query2.value(0).toString());
    list6.append(query2.value(1).toString());
    i++;
}
razmer2 = i;
chartIzmerDay->setProperty("array_nameday", list5);
chartIzmerDay->setProperty("array_kolday", list6);
chartIzmerDay->setProperty("razmer", razmer2);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
QObject* chartIzmerTime = this->parent()->findChild<QObject*>("chartIzmerTime");
QStringList list7;
QSqlQuery query3("select count(Время) from BazaIzmereni where Время like '%00:%' and Дата >='" + date_begin +
                 "' and Дата <='" + date_end + "' " + pers + "");
while (query3.next()) {
    list7.append(query3.value(0).toString());
}
QSqlQuery query4("select count(Время) from BazaIzmereni where Время like '%01:%' and Дата >='" + date_begin +
                 "' and Дата <='" + date_end + "' " + pers + "");
while (query4.next()) {
    list7.append(query4.value(0).toString());
}
QSqlQuery query5("select count(Время) from BazaIzmereni where Время like '%02:%' and Дата >='" + date_begin +
                 "' and Дата <='" + date_end + "' " + pers + "");
while (query5.next()) {
    list7.append(query5.value(0).toString());
}
QSqlQuery query6("select count(Время) from BazaIzmereni where Время like '%03:%' and Дата >='" + date_begin +
                 "' and Дата <='" + date_end + "' " + pers + "");
while (query6.next()) {
    list7.append(query6.value(0).toString());
}
QSqlQuery query7("select count(Время) from BazaIzmereni where Время like '%04:%' and Дата >='" + date_begin +
                 "' and Дата <='" + date_end + "' " + pers + "");
while (query7.next()) {
    list7.append(query7.value(0).toString());
}
QSqlQuery query8("select count(Время) from BazaIzmereni where Время like '%05:%' and Дата >='" + date_begin +
                 "' and Дата <='" + date_end + "' " + pers + "");
while (query8.next()) {
    list7.append(query8.value(0).toString());
}
QSqlQuery query9("select count(Время) from BazaIzmereni where Время like '%06:%' and Дата >='" + date_begin +
                 "' and Дата <='" + date_end + "' " + pers + "");
while (query9.next()) {
    list7.append(query9.value(0).toString());
}
QSqlQuery query10("select count(Время) from BazaIzmereni where Время like '%07:%' and Дата >='" + date_begin +
                  "' and Дата <='" + date_end + "' " + pers + "");
while (query10.next()) {
    list7.append(query10.value(0).toString());
}
QSqlQuery query11("select count(Время) from BazaIzmereni where Время like '%08:%' and Дата >='" + date_begin +
                  "' and Дата <='" + date_end + "' " + pers + "");
while (query11.next()) {
    list7.append(query11.value(0).toString());
}
QSqlQuery query12("select count(Время) from BazaIzmereni where Время like '%09:%' and Дата >='" + date_begin +
                  "' and Дата <='" + date_end + "' " + pers + "");
while (query12.next()) {
    list7.append(query12.value(0).toString());
}
QSqlQuery query13("select count(Время) from BazaIzmereni where Время like '%10:%' and Дата >='" + date_begin +
                  "' and Дата <='" + date_end + "' " + pers + "");
while (query13.next()) {
    list7.append(query13.value(0).toString());
}
QSqlQuery query14("select count(Время) from BazaIzmereni where Время like '%11:%' and Дата >='" + date_begin +
                  "' and Дата <='" + date_end + "' " + pers + "");
while (query14.next()) {
    list7.append(query14.value(0).toString());
}
QSqlQuery query15("select count(Время) from BazaIzmereni where Время like '%12:%' and Дата >='" + date_begin +
                  "' and Дата <='" + date_end + "' " + pers + "");
while (query15.next()) {
    list7.append(query15.value(0).toString());
}
QSqlQuery query16("select count(Время) from BazaIzmereni where Время like '%13:%' and Дата >='" + date_begin +
                  "' and Дата <='" + date_end + "' " + pers + "");
while (query16.next()) {
    list7.append(query16.value(0).toString());
}
QSqlQuery query17("select count(Время) from BazaIzmereni where Время like '%14:%' and Дата >='" + date_begin +
                  "' and Дата <='" + date_end + "' " + pers + "");
while (query17.next()) {
    list7.append(query17.value(0).toString());
}
QSqlQuery query18("select count(Время) from BazaIzmereni where Время like '%15:%' and Дата >='" + date_begin +
                  "' and Дата <='" + date_end + "' " + pers + "");
while (query18.next()) {
    list7.append(query18.value(0).toString());
}
QSqlQuery query19("select count(Время) from BazaIzmereni where Время like '%16:%' and Дата >='" + date_begin +
                  "' and Дата <='" + date_end + "' " + pers + "");
while (query19.next()) {
    list7.append(query19.value(0).toString());
}
QSqlQuery query20("select count(Время) from BazaIzmereni where Время like '%17:%' and Дата >='" + date_begin +
                  "' and Дата <='" + date_end + "' " + pers + "");
while (query20.next()) {
    list7.append(query20.value(0).toString());
}
QSqlQuery query21("select count(Время) from BazaIzmereni where Время like '%18:%' and Дата >='" + date_begin +
                  "' and Дата <='" + date_end + "' " + pers + "");
while (query21.next()) {
    list7.append(query21.value(0).toString());
}
QSqlQuery query22("select count(Время) from BazaIzmereni where Время like '%19:%' and Дата >='" + date_begin +
                  "' and Дата <='" + date_end + "' " + pers + "");
while (query22.next()) {
    list7.append(query22.value(0).toString());
}
QSqlQuery query23("select count(Время) from BazaIzmereni where Время like '%20:%' and Дата >='" + date_begin +
                  "' and Дата <='" + date_end + "' " + pers + "");
while (query23.next()) {
    list7.append(query23.value(0).toString());
}
QSqlQuery query24("select count(Время) from BazaIzmereni where Время like '%21:%' and Дата >='" + date_begin +
                  "' and Дата <='" + date_end + "' " + pers + "");
while (query24.next()) {
    list7.append(query24.value(0).toString());
}
QSqlQuery query25("select count(Время) from BazaIzmereni where Время like '%22:%' and Дата >='" + date_begin +
                  "' and Дата <='" + date_end + "' " + pers + "");
while (query25.next()) {
    list7.append(query25.value(0).toString());
}
QSqlQuery query26("select count(Время) from BazaIzmereni where Время like '%23:%' and Дата >='" + date_begin +
                  "' and Дата <='" + date_end + "' " + pers + "");
while (query26.next()) {
    list7.append(query26.value(0).toString());
}
qDebug()<<"list7"<<list7;
qDebug()<<"personal_select"<<personal_select;
chartIzmerTime->setProperty("array_koltime", list7);
}

void Stat::getdate2()
{
    QObject* filter_izmer = this->parent()->findChild<QObject*>("filter_izmer");
    date_begin =(filter_izmer->property("date_begin")).toString();
    date_end =(filter_izmer->property("date_end")).toString();
    personal_select = (filter_izmer->property("personal_select")).toString();
}

