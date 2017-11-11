#include <QDebug>
#include <QDir>
#include "database.h"

DataBase::DataBase(QObject *parent) : QObject(parent)
{

}

DataBase::~DataBase()
{

}

/* Методы для подключения к базе данных
 * */
void DataBase::connectToDataBase()
{
    /* Перед подключением к базе данных производим проверку на её существование.
     * В зависимости от результата производим открытие базы данных или её восстановление
     * */
//    if(!QFile("D:/" DATABASE_NAME).exists()){
//        this->restoreDataBase();
//    } else {
        this->openDataBase();
    //}
}

/* Методы восстановления базы данных
 * */
//bool DataBase::restoreDataBase()
//{
//    // Если база данных открылась ...
//    if(this->openDataBase()){
//        // Производим восстановление базы данных
//        return (this->createTable()) ? true : false;
//    } else {
//        qDebug() << "Не удалось восстановить базу данных";
//        return false;
//    }
//    return false;
//}

/* Метод для открытия базы данных
 * */
bool DataBase::openDataBase()
{
    /* База данных открывается по заданному пути
     * и имени базы данных, если она существует
     * */
//    QString pathToDB = QDir::currentPath()+QString("/Accounts.sqlite");
//        myDB.setDatabaseName(pathToDB);
    db = QSqlDatabase::addDatabase("QSQLITE");
    //db.setHostName(DATABASE_HOSTNAME);
    db.setDatabaseName(QDir::currentPath() + QString("/base/sqlite.db"));
    if(db.open()){
        return true;
    } else {
        return false;
    }
}

/* Методы закрытия базы данных
 * */
void DataBase::closeDataBase()
{
    db.close();
}

/* Метод для создания таблицы в базе данных
 * */
//bool DataBase::createTable()
//{
    /* В данном случае используется формирование сырого SQL-запроса
     * с последующим его выполнением.
     * */
//    QSqlQuery query;
//    if(!query.exec( "CREATE TABLE " baza " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " baza_kks " TEXT)"
////    if(!query.exec( "CREATE TABLE " ate " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " ate_fam " TEXT);"
////                    "CREATE TABLE " baza " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " baza_kks " TEXT, " baza_zd " TEXT, " baza_otm " TEXT, " baza_pom " TEXT, " baza_opis " TEXT, " baza_shema_filename " TEXT, " baza_foto_filename " TEXT, " baza_id_tipprivoda " INTEGER, " baza_marka_eldv " TEXT, " baza_mosch " REAL, " baza_chastota1 " INTEGER, " baza_id_tippermeh " INTEGER, " baza_id_tipperedachi " INTEGER, " baza_kolpal " INTEGER, " baza_id_tipmeh " INTEGER, " baza_markameh " TEXT, " baza_chastota3 " INTEGER, " baza_kollop " INTEGER, " baza_id_polozhenie " INTEGER, " baza_id_tipopory " INTEGER, " baza_davnom " TEXT, " baza_rasnom " TEXT, " baza_davrd " TEXT, " baza_rasrd " TEXT, " baza_id_normhh " INTEGER, " baza_id_normnom " INTEGER, " baza_id_ogrnom " INTEGER, " baza_id_otkaznom " INTEGER, " baza_id_normrd " INTEGER, " baza_id_ogrrd " INTEGER, " baza_id_otkazrd " INTEGER, " baza_id_ceh " INTEGER, " baza_id_fio " INTEGER, " baza_docnanormy " TEXT, " baza_paramcentr " TEXT, " baza_prim " TEXT, " baza_id_proizvmeh " INTEGER, " baza_id_proizveldv " INTEGER, " baza_id_postav " INTEGER, " baza_id_normnomed " INTEGER, " baza_id_ogrnomed " INTEGER, " baza_id_otkaznomed " INTEGER, " baza_id_normrded " INTEGER, " baza_id_ogrrded " INTEGER, " baza_id_otkazrded " INTEGER, " baza_id_bazaprogram " INTEGER, " baza_totkazed " TEXT, " baza_totkazred " TEXT, " baza_totkazmeh " TEXT);"
////                    "CREATE TABLE " bazaizm " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " bazaizm_data " TEXT, " bazaizm_id_baza " INTEGER, " bazaizm_1v " REAL, " bazaizm_1p " REAL, " bazaizm_1o " REAL, " bazaizm_2v " REAL, " bazaizm_2p " REAL, " bazaizm_2o " REAL, " bazaizm_3v " REAL, " bazaizm_3p " REAL, " bazaizm_3o " REAL, " bazaizm_4v " REAL, " bazaizm_4p " REAL, " bazaizm_4o " REAL, " bazaizm_5v " REAL, " bazaizm_5p " REAL, " bazaizm_5o " REAL, " bazaizm_6v " REAL, " bazaizm_6p " REAL, " bazaizm_6o " REAL, " bazaizm_7v " REAL, " bazaizm_7p " REAL, " bazaizm_7o " REAL, " bazaizm_8v " REAL, " bazaizm_8p " REAL, " bazaizm_8o " REAL, " bazaizm_prim " TEXT, " bazaizm_id_rezhim " INTEGER, " bazaizm_norma " REAL, " bazaizm_normaed " REAL, " bazaizm_id_tipizm " INTEGER, " bazaizm_t1 " REAL, " bazaizm_t2 " REAL, " bazaizm_t3 " REAL, " bazaizm_t4 " REAL, " bazaizm_t5 " REAL, " bazaizm_t6 " REAL, " bazaizm_t7 " REAL, " bazaizm_t8 " REAL, " bazaizm_q " TEXT, " bazaizm_p " TEXT, " bazaizm_laes2 " TEXT, " bazaizm_ate " TEXT, " bazaizm_vremya " TEXT);"
////                    "CREATE TABLE " bazapodsh " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " bazapodsh_id_baza " INTEGER, " bazapodsh_oboz " TEXT, " bazapodsh_id_rasp " INTEGER, " bazapodsh_vnd " REAL, " bazapodsh_nd " REAL, " bazapodsh_dt " REAL, " bazapodsh_kolt " INTEGER, " bazapodsh_ugol " REAL, " bazapodsh_id_nomeropory " INTEGER, " bazapodsh_id_tippodsh " INTEGER);"
////                    "CREATE TABLE " bazaprogram " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " bazaprogram_nomer " TEXT);"
////                    "CREATE TABLE " ceh " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " ceh_name " TEXT);"
////                    "CREATE TABLE " fio " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " fio_fio " TEXT);"
////                    "CREATE TABLE " laes " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " laes_fam " TEXT);"
////                    "CREATE TABLE " nomeropory " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " nomeropory_nomer " INTEGER);"
////                    "CREATE TABLE " normhh " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " normhh_zn " REAL);"
////                    "CREATE TABLE " normnom " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " normnom_zn " REAL);"
////                    "CREATE TABLE " normnomed " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " normnomed_zn " REAL);"
////                    "CREATE TABLE " normrd " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " normrd_zn " REAL);"
////                    "CREATE TABLE " normrded " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " normrded_zn " REAL);"
////                    "CREATE TABLE " ogrnom " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " ogrnom_zn " REAL);"
////                    "CREATE TABLE " ogrnomed " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " ogrnomed_zn " REAL);"
////                    "CREATE TABLE " ogrrd " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " ogrrd_zn " REAL);"
////                    "CREATE TABLE " ogrrded " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " ogrrded_zn " REAL);"
////                    "CREATE TABLE " otkaznom " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " otkaznom_zn " REAL);"
////                    "CREATE TABLE " otkaznomed " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " otkaznomed_zn " REAL);"
////                    "CREATE TABLE " otkazrd " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " otkazrd_zn " REAL);"
////                    "CREATE TABLE " otkazrded " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " otkazrded_zn " REAL);"
////                    "CREATE TABLE " polozhenie " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " polozhenie_name " TEXT);"
////                    "CREATE TABLE " postav " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " postav_name " TEXT);"
////                    "CREATE TABLE " proizved " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " proizved_name " TEXT);"
////                    "CREATE TABLE " proizvmeh " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " proizvmeh_name " TEXT);"
////                    "CREATE TABLE " rasppodsh " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " rasppodsh_uzel " TEXT);"
////                    "CREATE TABLE " rezhim " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " rezhim_name " TEXT);"
////                    "CREATE TABLE " tipizm " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " tipizm_name " TEXT);"
////                    "CREATE TABLE " tipmeh " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " tipmeh_name " TEXT);"
////                    "CREATE TABLE " tipmopory " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " tipopory_name " TEXT);"
////                    "CREATE TABLE " tipper " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " tipper_name " TEXT);"
////                    "CREATE TABLE " tippermeh " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " tippermeh_name " TEXT);"
////                    "CREATE TABLE " tippodsh " (id INTEGER PRIMARY KEY ASC AUTOINCREMENT, " tippodsh_tip " TEXT)"
////
//    )){
//        qDebug() << "DataBase: error of create ";
//        qDebug() << query.lastError().text();
//        return false;
//    } else {
//        return true;
//    }
//    return false;
//}

/* Метод для вставки записи в базу данных
 * */
bool DataBase::insertIntoTable0(const QVariantList &data)
{
   QSqlQuery query;
   query.prepare("INSERT INTO " baza " (KKS) "
                 "VALUES (:baza_kks)");
   query.bindValue(":baza_kks",       data[0].toString());
   if(!query.exec()){
       qDebug() << "error insert into " << baza;
       qDebug() << query.lastError().text();
       return false;
   } else {
       return true;
   }
   return false;
}

bool DataBase::insertIntoTable0(const QString &bazakks){
    QVariantList data;
    data.append(bazakks);
    if(insertIntoTable0(data))
        return true;
    else
        return false;
}

bool DataBase::insertIntoTable(const QVariantList &data)
{
    /* Запрос SQL формируется из QVariantList,
     * в который передаются данные для вставки в таблицу.
     * */
    QSqlQuery querys;
    /* В начале SQL запрос формируется с ключами,
     * которые потом связываются методом bindValue
     * для подстановки данных из QVariantList
     * */
    //!!!!!!!!!!!!!!!!!!!Поле для вставки без указания таблицы, иначе несоответствие параметров!!!!!!!!!!!!!!!!!!!!
    querys.prepare("INSERT INTO Baza (KKS, id_Ceh, Здание, Помещение, 'Описание системы', "
                   "'Примечания к агрегату', id_BazaProgram, id_FIO, 'Марка эл/дв', Мощность, "
                   "Частота1, id_ProizvodElPriv, id_TipPeredatochnogoMehanizma, id_TipPeredachi, "
                   "'Количество пальцев', id_TipMehanizma, 'Марка механизма', Частота3, 'Количество лопастей', "
                   "id_Polozhenie, id_TipOpory, id_ProizvodIspMeh, КБ, 'Давление ном', 'Расход ном', "
                   "'Давление р/д', 'Расход р/д', TotkazED, TotkazRed, TotkazIspMeh, id_NormHh, id_NormNomED, "
                   "id_NormNom, id_OgrNomED, id_OgrNom, id_OtkazNomED, id_OtkazNom, id_NormRdED, id_NormRd, "
                   "id_OgrRdED, id_OgrRd, id_OtkazRdED, id_OtkazRd, Фото_filename, Shema_filename, "
                   "'Документы на нормы', 'Параметры центровки и прилегания') "
                   "VALUES (:Bazakks, :Cehid, :Bazazd, :Bazapom, :Bazaopis, :Bazaprim, :Bazaprogramid, "
                   ":Bazafioid, :Bazamarkaeldv, :Bazamosch, :Bazachastota1, :Bazaproizvedid, :Bazatippermehid, "
                   ":Bazatipperid, :Bazakolpal, :Bazatipmehid, :Bazamarkameh, :Bazachastota3, :Bazakollop, "
                   ":Bazapolozhenieid, :Bazatipoporyid, :Bazaproizvmehid, :Bazakb, :Bazadavnom, :Bazarasnom, "
                   ":Bazadavrd, :Bazarasrd, :Bazatotkazed, :Bazatotkazred, :Bazatotkazmeh, :Normhhid, :Normnomedid, "
                   ":Normnomid, :Ogrnomedid, :Ogrnomid, :Otkaznomedid, :Otkaznomid, :Normrdedid, :Normrdid, "
                   ":Ogrrdedid, :Ogrrdid, :Otkazrdedid, :Otkazrdid, :Bazafoto, :Bazashema, :Bazadoc, :Bazapar)");

    querys.bindValue(":Bazakks",       data[0].toString());
    querys.bindValue(":Cehid",         data[1].toString());
//    if(data[2].toString()==""){
//        querys.bindValue(":Bazazd", QVariant(QVariant::String));
//    } else {
//        querys.bindValue(":Bazazd",        data[2].toString());
//    }
    querys.bindValue(":Bazazd",        data[2].toString()=="" ? QVariant(QVariant::String):data[2].toString());
    querys.bindValue(":Bazapom",       data[3].toString()=="" ? QVariant(QVariant::String):data[3].toString());
    querys.bindValue(":Bazaopis",      data[4].toString()=="" ? QVariant(QVariant::String):data[4].toString());
    querys.bindValue(":Bazaprim",      data[5].toString()=="" ? QVariant(QVariant::String):data[5].toString());
    querys.bindValue(":Bazaprogramid", data[6].toString());
    querys.bindValue(":Bazafioid",     data[7].toString());
    querys.bindValue(":Bazamarkaeldv", data[8].toString()=="" ? QVariant(QVariant::String):data[8].toString());
    querys.bindValue(":Bazamosch",     data[9].toString()=="" ? QVariant(QVariant::String):data[9].toString());
    querys.bindValue(":Bazachastota1", data[10].toString()=="" ? QVariant(QVariant::String):data[10].toString());
    querys.bindValue(":Bazaproizvedid",data[11].toString());
    querys.bindValue(":Bazatippermehid",data[12].toString());
    querys.bindValue(":Bazatipperid",  data[13].toString());
    querys.bindValue(":Bazakolpal",    data[14].toString()=="" ? QVariant(QVariant::String):data[14].toString());
    querys.bindValue(":Bazatipmehid",  data[15].toString());
    querys.bindValue(":Bazamarkameh",  data[16].toString()=="" ? QVariant(QVariant::String):data[16].toString());
    querys.bindValue(":Bazachastota3", data[17].toString()=="" ? QVariant(QVariant::String):data[17].toString());
    querys.bindValue(":Bazakollop",    data[18].toString()=="" ? QVariant(QVariant::String):data[18].toString());
    querys.bindValue(":Bazapolozhenieid",data[19].toString());
    querys.bindValue(":Bazatipoporyid",data[20].toString());
    querys.bindValue(":Bazaproizvmehid",data[21].toString());
    querys.bindValue(":Bazakb",        data[22].toString()=="" ? QVariant(QVariant::String):data[22].toString());
    querys.bindValue(":Bazadavnom",    data[23].toString()=="" ? QVariant(QVariant::String):data[23].toString());
    querys.bindValue(":Bazarasnom",    data[24].toString()=="" ? QVariant(QVariant::String):data[24].toString());
    querys.bindValue(":Bazadavrd",     data[25].toString()=="" ? QVariant(QVariant::String):data[25].toString());
    querys.bindValue(":Bazarasrd",     data[26].toString()=="" ? QVariant(QVariant::String):data[26].toString());
    querys.bindValue(":Bazatotkazed",  data[27].toString()=="" ? QVariant(QVariant::String):data[27].toString());
    querys.bindValue(":Bazatotkazred", data[28].toString()=="" ? QVariant(QVariant::String):data[28].toString());
    querys.bindValue(":Bazatotkazmeh", data[29].toString()=="" ? QVariant(QVariant::String):data[29].toString());
    querys.bindValue(":Normhhid",      data[30].toString());
    querys.bindValue(":Normnomedid",   data[31].toString());
    querys.bindValue(":Normnomid",     data[32].toString());
    querys.bindValue(":Ogrnomedid",    data[33].toString());
    querys.bindValue(":Ogrnomid",      data[34].toString());
    querys.bindValue(":Otkaznomedid",  data[35].toString());
    querys.bindValue(":Otkaznomid",    data[36].toString());
    querys.bindValue(":Normrdedid",    data[37].toString());
    querys.bindValue(":Normrdid",      data[38].toString());
    querys.bindValue(":Ogrrdedid",     data[39].toString());
    querys.bindValue(":Ogrrdid",       data[40].toString());
    querys.bindValue(":Otkazrdedid",   data[41].toString());
    querys.bindValue(":Otkazrdid",     data[42].toString());
    querys.bindValue(":Bazafoto",      data[43].toString()=="" ? QVariant(QVariant::String):data[43].toString());
    querys.bindValue(":Bazashema",     data[44].toString()=="" ? QVariant(QVariant::String):data[44].toString());
    querys.bindValue(":Bazadoc",       data[45].toString()=="" ? QVariant(QVariant::String):data[45].toString());
    querys.bindValue(":Bazapar",       data[46].toString()=="" ? QVariant(QVariant::String):data[46].toString());
    qDebug()<<data[0].toString();



    // После чего выполняется запросом методом exec()
    if(!querys.exec()){
        qDebug() << "error insert into ";
        qDebug() << querys.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}


bool DataBase::insertIntoTable(const QString &Bazakks, const QString &Cehid, const QString &Bazazd,
                               const QString &Bazapom, const QString &Bazaopis, const QString &Bazaprim,
                               const QString &Bazaprogramid, const QString &Bazafioid, const QString &Bazamarkaeldv,
                               const QString &Bazamosch, const QString &Bazachastota1, const QString &Bazaproizvedid,
                               const QString &Bazatippermechid, const QString &Bazatipperid, const QString &Bazakolpal,
                               const QString &Bazatipmehid, const QString &Bazamarkameh, const QString &Bazachastota3,
                               const QString &Bazakollop, const QString &Bazapolozhenieid, const QString &Bazatipoporyid,
                               const QString &Bazaproizvmehid, const QString &Bazakb, const QString &Bazadavnom,
                               const QString &Bazarasnom, const QString &Bazadavrd, const QString &Bazarasrd,
                               const QString &Bazatotkazed, const QString &Bazatotkazred, const QString &Bazatotkazmeh,
                               const QString &Normhhid, const QString &Normnomedid, const QString &Normnomid,
                               const QString &Ogrnomedid, const QString &Ogrnomid, const QString &Otkaznomedid,
                               const QString &Otkaznomid, const QString &Normrdedid, const QString &Normrdid,
                               const QString &Ogrrdedid, const QString &Ogrrdid, const QString &Otkazrdedid,
                               const QString &Otkazrdid, const QString &Bazafoto, const QString &Bazashema,
                               const QString &Bazadoc, const QString &Bazapar)
{
    QVariantList data;

    data.append(Bazakks);
    data.append(Cehid);
    data.append(Bazazd);
    data.append(Bazapom);
    data.append(Bazaopis);
    data.append(Bazaprim);
    data.append(Bazaprogramid);
    data.append(Bazafioid);
    data.append(Bazamarkaeldv);
    data.append(Bazamosch);
    data.append(Bazachastota1);
    data.append(Bazaproizvedid);
    data.append(Bazatippermechid);
    data.append(Bazatipperid);
    data.append(Bazakolpal);
    data.append(Bazatipmehid);
    data.append(Bazamarkameh);
    data.append(Bazachastota3);
    data.append(Bazakollop);
    data.append(Bazapolozhenieid);
    data.append(Bazatipoporyid);
    data.append(Bazaproizvmehid);
    data.append(Bazakb);
    data.append(Bazadavnom);
    data.append(Bazarasnom);
    data.append(Bazadavrd);
    data.append(Bazarasrd);
    data.append(Bazatotkazed);
    data.append(Bazatotkazred);
    data.append(Bazatotkazmeh);
    data.append(Normhhid);
    data.append(Normnomedid);
    data.append(Normnomid);
    data.append(Ogrnomedid);
    data.append(Ogrnomid);
    data.append(Otkaznomedid);
    data.append(Otkaznomid);
    data.append(Normrdedid);
    data.append(Normrdid);
    data.append(Ogrrdedid);
    data.append(Ogrrdid);
    data.append(Otkazrdedid);
    data.append(Otkazrdid);
    data.append(Bazafoto);
    data.append(Bazashema);
    data.append(Bazadoc);
    data.append(Bazapar);


    if(insertIntoTable(data))
        return true;
    else
        return false;
}

/* Метод для удаления записи из таблицы
 * */
bool DataBase::removeRecord(const int id)
{
    // Удаление строки из базы данных будет производитсья с помощью SQL-запроса
    QSqlQuery query;

    // Удаление производим по id записи, который передается в качестве аргумента функции
    query.prepare("DELETE FROM " baza " WHERE id= :ID ;");
    query.bindValue(":ID", id);

    // Выполняем удаление
    if(!query.exec()){
        qDebug() << "error delete row " << baza;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}
