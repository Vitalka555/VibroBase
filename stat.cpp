#include "stat.h"

Stat::Stat(QObject *parent) : QObject(parent)
{

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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
QObject* chartIzmerMes = this->parent()->findChild<QObject*>("chartIzmerMes");
int razmer1;
QSqlQuery query1("SELECT strftime('%m-%Y', Дата), COUNT(1) FROM BazaIzmereni where Дата is not null GROUP BY strftime('%Y-%m', Дата)");
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
                 "when 3 then 'Ср' when 4 then 'Чт' when 5 then 'Пт' else 'Сб' end as servdayofweek, COUNT(1) "
                 "from BazaIzmereni where Дата is not null GROUP BY strftime('%w', Дата)");
QStringList list5;
QStringList list6;
//QSqlQuery query("SELECT TipMehanizma.Наименование FROM TipMehanizma");
i = 0;
while (query2.next()) {
    list5.append(query2.value(0).toString());
    list6.append(query2.value(1).toString());
    qDebug()<<i;
    qDebug()<<"list5"<<list5[i];
    qDebug()<<"list6"<<list6[i];
    i++;
}
razmer2 = i;
chartIzmerDay->setProperty("array_nameday", list5);
chartIzmerDay->setProperty("array_kolday", list6);
chartIzmerDay->setProperty("razmer", razmer2);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
QObject* chartIzmerTime = this->parent()->findChild<QObject*>("chartIzmerTime");
QStringList list7;
QSqlQuery query3("select count(Время) from BazaIzmereni where Время like '%00:%'");
while (query3.next()) {
    list7.append(query3.value(0).toString());
}
QSqlQuery query4("select count(Время) from BazaIzmereni where Время like '%01:%'");
while (query4.next()) {
    list7.append(query4.value(0).toString());
}
QSqlQuery query5("select count(Время) from BazaIzmereni where Время like '%02:%'");
while (query5.next()) {
    list7.append(query5.value(0).toString());
}
QSqlQuery query6("select count(Время) from BazaIzmereni where Время like '%03:%'");
while (query6.next()) {
    list7.append(query6.value(0).toString());
}
QSqlQuery query7("select count(Время) from BazaIzmereni where Время like '%04:%'");
while (query7.next()) {
    list7.append(query7.value(0).toString());
}
QSqlQuery query8("select count(Время) from BazaIzmereni where Время like '%05:%'");
while (query8.next()) {
    list7.append(query8.value(0).toString());
}
QSqlQuery query9("select count(Время) from BazaIzmereni where Время like '%06:%'");
while (query9.next()) {
    list7.append(query9.value(0).toString());
}
QSqlQuery query10("select count(Время) from BazaIzmereni where Время like '%07:%'");
while (query10.next()) {
    list7.append(query10.value(0).toString());
}
QSqlQuery query11("select count(Время) from BazaIzmereni where Время like '%08:%'");
while (query11.next()) {
    list7.append(query11.value(0).toString());
}
QSqlQuery query12("select count(Время) from BazaIzmereni where Время like '%09:%'");
while (query12.next()) {
    list7.append(query12.value(0).toString());
}
QSqlQuery query13("select count(Время) from BazaIzmereni where Время like '%10:%'");
while (query13.next()) {
    list7.append(query13.value(0).toString());
}
QSqlQuery query14("select count(Время) from BazaIzmereni where Время like '%11:%'");
while (query14.next()) {
    list7.append(query14.value(0).toString());
}
QSqlQuery query15("select count(Время) from BazaIzmereni where Время like '%12:%'");
while (query15.next()) {
    list7.append(query15.value(0).toString());
}
QSqlQuery query16("select count(Время) from BazaIzmereni where Время like '%13:%'");
while (query16.next()) {
    list7.append(query16.value(0).toString());
}
QSqlQuery query17("select count(Время) from BazaIzmereni where Время like '%14:%'");
while (query17.next()) {
    list7.append(query17.value(0).toString());
}
QSqlQuery query18("select count(Время) from BazaIzmereni where Время like '%15:%'");
while (query18.next()) {
    list7.append(query18.value(0).toString());
}
QSqlQuery query19("select count(Время) from BazaIzmereni where Время like '%16:%'");
while (query19.next()) {
    list7.append(query19.value(0).toString());
}
QSqlQuery query20("select count(Время) from BazaIzmereni where Время like '%17:%'");
while (query20.next()) {
    list7.append(query20.value(0).toString());
}
QSqlQuery query21("select count(Время) from BazaIzmereni where Время like '%18:%'");
while (query21.next()) {
    list7.append(query21.value(0).toString());
}
QSqlQuery query22("select count(Время) from BazaIzmereni where Время like '%19:%'");
while (query22.next()) {
    list7.append(query22.value(0).toString());
}
QSqlQuery query23("select count(Время) from BazaIzmereni where Время like '%20:%'");
while (query23.next()) {
    list7.append(query23.value(0).toString());
}
QSqlQuery query24("select count(Время) from BazaIzmereni where Время like '%21:%'");
while (query24.next()) {
    list7.append(query24.value(0).toString());
}
QSqlQuery query25("select count(Время) from BazaIzmereni where Время like '%22:%'");
while (query25.next()) {
    list7.append(query25.value(0).toString());
}
QSqlQuery query26("select count(Время) from BazaIzmereni where Время like '%23:%'");
while (query26.next()) {
    list7.append(query26.value(0).toString());
}
chartIzmerTime->setProperty("array_koltime", list7);
}
