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
    int i = 0;
    QSqlQuery querypers("SELECT Фамилия FROM LAES ORDER BY Фамилия");
    while (querypers.next()) {
        personal.append(querypers.value(0).toString());
        i++;
    }
    razmer_personal = i;
    filter_izmer->setProperty("personal", personal);
    filter_izmer->setProperty("razmer", razmer_personal);
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
QString pers;
if(personal_select == ""){
    pers = "";
} else {
    pers = " and BazaIzmereni.'ЛАЭС-2' LIKE '%" + personal_select + "%' ";
}
QObject* chartIzmerPersonal = this->parent()->findChild<QObject*>("chartIzmerPersonal");
QStringList personal2;
int kol_k;
for(kol_k = 0; kol_k<razmer_personal; kol_k++){
QSqlQuery querypersonal_kol("SELECT COUNT(Дата) FROM BazaIzmereni where Дата is not null and Дата >='" + date_begin +
                            "' and Дата <='" + date_end + "' and BazaIzmereni.'ЛАЭС-2' LIKE '%" + personal[kol_k] + "%' ");
while (querypersonal_kol.next()) {
    personal2.append(querypersonal_kol.value(0).toString());
}
}
qDebug()<<"personal"<<personal;
qDebug()<<"personal2"<<personal2;
chartIzmerPersonal->setProperty("array_kolpersonal", personal2);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
QObject* chartIzmerMes = this->parent()->findChild<QObject*>("chartIzmerMes");
//QString date_begin_=(filter_izmer->property("date_begin")).toString();
//QString date_end_=(filter_izmer->property("date_end")).toString();
//qDebug()<<"date_end из QML"<<date_end_;
int razmer1;
//qDebug()<<"date_begin"<<date_begin;
//qDebug()<<"date_end"<<date_end;


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

chartIzmerTime->setProperty("array_koltime", list7);
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
QSqlQuery querycount("select count(Дата) from BazaIzmereni where BazaIzmereni.id_Rezhim = 1 and BazaIzmereni.НормаЭлДв is not null and BazaIzmereni.НормаЭлДв < 12"
                     " and BazaIzmereni.id_TipIzmerenia <> 2 and "
                  "BazaIzmereni.id_TipIzmerenia <> 4 ORDER BY Дата, Время, id");
int count;
while (querycount.next()) {
    count = querycount.value(0).toInt();
}
//QStringList perv_kks;
//QStringList perv_date;
//QStringList perv_value;
//QSqlQuery queryperv("select distinct(BazaIzmereni.id_Baza), Дата, "
//                     "(SELECT MAX(IFNULL(BazaIzmereni.'1В',0), IFNULL(BazaIzmereni.'1П',0), IFNULL(BazaIzmereni.'1О',0), "
//                     "IFNULL(BazaIzmereni.'2В',0), IFNULL(BazaIzmereni.'2П',0), IFNULL(BazaIzmereni.'2О',0)) "
//                     "FROM BazaIzmereni Bz WHERE Bz.id= BazaIzmereni.id) "
//                     "from BazaIzmereni where BazaIzmereni.id_Rezhim = 1 and BazaIzmereni.НормаЭлДв is not null and BazaIzmereni.НормаЭлДв < 12"
//                     " and BazaIzmereni.id_TipIzmerenia <> 2 and "
//                  "BazaIzmereni.id_TipIzmerenia <> 4 ORDER BY Дата, Время, id");
//while (queryperv.next()) {
//    perv_kks.append(queryperv.value(0).toString());
//    perv_date.append(queryperv.value(1).toString());
//    perv_value.append(queryperv.value(2).toString());
//}
//qDebug()<<"perv_kks = "<<perv_kks;
//qDebug()<<"perv_date = "<<perv_date;
//qDebug()<<"perv_value = "<<perv_value;

qDebug()<<"Количество измерений на х/х = "<<count;
QSqlQuery querydatas("select Дата, (SELECT Baza.KKS FROM Baza WHERE Baza.id = BazaIzmereni.id_Baza), "
                     "(SELECT MAX(IFNULL(BazaIzmereni.'1В',0), IFNULL(BazaIzmereni.'1П',0), IFNULL(BazaIzmereni.'1О',0), "
                     "IFNULL(BazaIzmereni.'2В',0), IFNULL(BazaIzmereni.'2П',0), IFNULL(BazaIzmereni.'2О',0)) "
                     "FROM BazaIzmereni Bz WHERE Bz.id= BazaIzmereni.id), IFNULL(НормаЭлДв,0) "
                     "from BazaIzmereni where BazaIzmereni.id_Rezhim = 1 and BazaIzmereni.НормаЭлДв is not null and BazaIzmereni.НормаЭлДв < 12"
                     " and BazaIzmereni.id_TipIzmerenia <> 2 and "
                  "BazaIzmereni.id_TipIzmerenia <> 4 ORDER BY Дата, Время, id");
QStringList hh_date;
QStringList hh_kks;
QStringList hh_value;
QStringList hh_norm_ed;
QStringList hh_norm_ed_new;
//QStringList hh_date_new;
//QStringList hh_kks_new;
QStringList hh_value_new;
QStringList hh_middle;
QStringList hh_middle_norm_ed;
QStringList hh_perv;
QStringList hh_middle_perv;
while (querydatas.next()) {
    hh_date.append(querydatas.value(0).toString());
    hh_kks.append(querydatas.value(1).toString());
    hh_value.append(querydatas.value(2).toString());
    hh_norm_ed.append(querydatas.value(3).toString());
}
qDebug()<<"Массив дат на х/х = "<<hh_date;
qDebug()<<"Массив kks на х/х = "<<hh_kks;
qDebug()<<"Массив значений на х/х = "<<hh_value;
qDebug()<<"Массив значений норм на х/х = "<<hh_norm_ed;
double sum = 0;
double sum_norm = 0;
double sum_perv = 0;
int ix;
int kx;
int lx;
int distinct;
int distinct_perv;
double sr;
bool povtor;
hh_value_new = hh_value;
hh_middle = hh_value;
hh_norm_ed_new = hh_norm_ed;
hh_middle_norm_ed = hh_norm_ed;
hh_perv = hh_value;
hh_middle_perv = hh_value;
//hh_perv_new = hh_value;
for(ix=0;ix<count;ix++){
    if(ix==0){
        hh_value_new.replace(0,hh_value.value(0));
        hh_middle.replace(0, hh_value_new.value(0));
        hh_norm_ed_new.replace(0,hh_norm_ed.value(0));
        hh_middle_norm_ed.replace(0, hh_norm_ed_new.value(0));
        hh_perv.replace(0,hh_value.value(0));
        hh_middle_perv.replace(0,hh_value.value(0));
        distinct = 1;
        distinct_perv = 1;
        sum_perv = hh_perv[0].toDouble();
    }
    if(ix>0){
        povtor = false;
        distinct = distinct + 1;
        distinct_perv = distinct_perv + 1;
        for(kx=0;kx<ix;kx++){
            if(hh_kks[ix]==hh_kks[kx]){
                hh_value_new.replace(kx,"0");
                hh_norm_ed_new.replace(kx,"0");
                povtor = true;
                //distinct = distinct - 1;
                qDebug()<<"hh_kks[ix]"<<hh_kks[ix];
            }
        }
        if(povtor == true){
            distinct = distinct - 1;
            hh_perv.replace(ix, "0");
        }
        sum_perv = sum_perv + hh_perv[ix].toDouble();
        hh_middle_perv.replace(ix, QString::number(sum_perv/distinct));
        hh_value_new.replace(ix,hh_value.value(ix));
        hh_norm_ed_new.replace(ix,hh_norm_ed.value(ix));
        for(lx=0;lx<(ix+1);lx++){
            sum = sum + hh_value_new[lx].toDouble();
            sum_norm = sum_norm + hh_norm_ed_new[lx].toDouble();
        }
        qDebug()<<"hh_perv.value(ix) = "<<hh_perv[ix];
        qDebug()<<"ix = "<<ix;
        qDebug()<<"sum_perv = "<<sum_perv;
        qDebug()<<"distinct = "<<distinct;
        sr = sum_perv/distinct;
        qDebug()<<"sr = "<<sr;

        hh_middle.replace(ix, QString::number(sum/distinct));
        hh_middle_norm_ed.replace(ix, QString::number(sum_norm/distinct));
        sum = 0;
        sum_norm = 0;
    }
}
qDebug()<<"Массив новых значений на х/х = "<<hh_norm_ed_new;
qDebug()<<"Массив средних значений на х/х = "<<hh_middle_norm_ed;
qDebug()<<"Массив первых значений на х/х = "<<hh_perv;
QObject* chartIzmerHh = this->parent()->findChild<QObject*>("chartIzmerHh");
chartIzmerHh->setProperty("array_dateX", hh_date);
chartIzmerHh->setProperty("array_valueY", hh_middle);
chartIzmerHh->setProperty("array_valueY1", hh_middle_norm_ed);
chartIzmerHh->setProperty("array_valueY2", hh_middle_perv);
chartIzmerHh->setProperty("count", count);
}

void Stat::getdate2()
{
    QObject* filter_izmer = this->parent()->findChild<QObject*>("filter_izmer");
    date_begin =(filter_izmer->property("date_begin")).toString();
    date_end =(filter_izmer->property("date_end")).toString();
    personal_select = (filter_izmer->property("personal_select")).toString();
}

