#include <QDebug>
#include "database.h"

DataBase::DataBase(QObject *parent) : QObject(parent)
{

}

DataBase::~DataBase()
{

}
//запись настроек
void DataBase::writeSettings()
{
    QObject* stack = this->parent()->findChild<QObject*>("stackView");
    QString pathToBas=(stack->property("pathToBase")).toString();
    QString pathToPhot=(stack->property("pathToPhoto")).toString();
    QString pathToShem=(stack->property("pathToShema")).toString();
    QSettings settings(path, QSettings::IniFormat);
    settings.beginGroup("PathToFiles");
    settings.setValue("PathToBase", pathToBas);
    settings.setValue("PathToPhoto", pathToPhot);
    settings.setValue("PathToShema", pathToShem);
    settings.endGroup();
    openDataBase();
}
//чтение настроек для подключения
void DataBase::readSettings()
{
    QSettings settings(path, QSettings::IniFormat);
    settings.beginGroup("PathToFiles");
    pathToBase = settings.value("PathToBase", (QDir::currentPath() + QString("/base/sqlite.db"))).toString();
    settings.endGroup();
}
//чтение настроек в интерфейс
void DataBase::readSettings2()
{
    QObject* stack = this->parent()->findChild<QObject*>("stackView");
    QSettings settings(path, QSettings::IniFormat);
    settings.beginGroup("PathToFiles");
    pathToBase = settings.value("PathToBase", (QDir::currentPath() + QString("/base/sqlite.db"))).toString();
    pathToPhoto = settings.value("PathToPhoto", (QDir::currentPath() + QString("/photo/"))).toString();
    pathToShema = settings.value("PathToShema", (QDir::currentPath() + QString("/shema/"))).toString();
    settings.endGroup();
    stack->setProperty("pathToBaseRead", pathToBase);
    stack->setProperty("pathToPhotoRead", pathToPhoto);
    stack->setProperty("pathToShemaRead", pathToShema);
}

void DataBase::writeSettingsWindow()
{
    QObject* stack = this->parent()->findChild<QObject*>("stackView");
    QString w=(stack->property("wwidth")).toString();
    QString h=(stack->property("hheight")).toString();
    QString x=(stack->property("xx")).toString();
    QString y=(stack->property("yy")).toString();
    QSettings settings(path, QSettings::IniFormat);
    settings.beginGroup("WindowGeometry");
    settings.setValue("width", w);
    settings.setValue("height", h);
    settings.setValue("x", x);
    settings.setValue("y", y);
    settings.endGroup();
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
    //Считываем путь к файлу базы
    //path = QDir::currentPath()+"/settings.ini";
    //qDebug()<<path;
    //QSettings* settings = new QSettings(QDir::currentPath() + QString("/settings.ini"), QSettings::IniFormat);
    readSettings();
    db = QSqlDatabase::addDatabase("QSQLITE");
    //db.setHostName(DATABASE_HOSTNAME);
    //db.setDatabaseName(QDir::currentPath() + QString("/base/sqlite.db"));
    db.setDatabaseName(pathToBase);
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


bool DataBase::editTableBaza(const QVariantList &data)
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
    querys.prepare("update Baza set KKS = :Bazakks, id_Ceh = :Cehid, Здание = :Bazazd, Помещение = :Bazapom, 'Описание системы' = :Bazaopis, "
                   "'Примечания к агрегату' = :Bazaprim, id_BazaProgram = :Bazaprogramid, id_FIO = :Bazafioid, 'Марка эл/дв' = :Bazamarkaeldv, Мощность = :Bazamosch, "
                   "Частота1 = :Bazachastota1, id_ProizvodElPriv = :Bazaproizvedid, id_TipPeredatochnogoMehanizma = :Bazatippermehid, id_TipPeredachi = :Bazatipperid, "
                   "'Количество пальцев' = :Bazakolpal, id_TipMehanizma = :Bazatipmehid, 'Марка механизма' = :Bazamarkameh, Частота3 = :Bazachastota3, 'Количество лопастей' = :Bazakollop, "
                   "id_Polozhenie = :Bazapolozhenieid, id_TipOpory = :Bazatipoporyid, id_ProizvodIspMeh = :Bazaproizvmehid, КБ = :Bazakb, 'Давление ном' = :Bazadavnom, 'Расход ном' = :Bazarasnom, "
                   "'Давление р/д' = :Bazadavrd, 'Расход р/д' = :Bazarasrd, TotkazED = :Bazatotkazed, TotkazRed = :Bazatotkazred, TotkazIspMeh = :Bazatotkazmeh, id_NormHh = :Normhhid, id_NormNomED = :Normnomedid, "
                   "id_NormNom = :Normnomid, id_OgrNomED = :Ogrnomedid, id_OgrNom = :Ogrnomid, id_OtkazNomED = :Otkaznomedid, id_OtkazNom = :Otkaznomid, id_NormRdED = :Normrdedid, id_NormRd = :Normrdid, "
                   "id_OgrRdED = :Ogrrdedid, id_OgrRd = :Ogrrdid, id_OtkazRdED = :Otkazrdedid, id_OtkazRd = :Otkazrdid, Фото_filename = :Bazafoto, Shema_filename = :Bazashema, "
                   "'Документы на нормы' = :Bazadoc, 'Параметры центровки и прилегания' = :Bazapar where Baza.id = :Baza_id");


    querys.bindValue(":Bazakks", data[0].toString());
    querys.bindValue(":Cehid",         data[1].toString());
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
    querys.bindValue(":Baza_id", data[47].toString());
    qDebug()<<data[0].toString();



    // После чего выполняется запросом методом exec()
    if(!querys.exec()){
        qDebug() << "error update Baza ";
        qDebug() << querys.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}


bool DataBase::editTableBaza(const QString &Bazakks, const QString &Cehid, const QString &Bazazd, const QString &Bazapom,
                             const QString &Bazaopis, const QString &Bazaprim, const QString &Bazaprogramid,
                             const QString &Bazafioid, const QString &Bazamarkaeldv, const QString &Bazamosch,
                             const QString &Bazachastota1, const QString &Bazaproizvedid, const QString &Bazatippermechid,
                             const QString &Bazatipperid, const QString &Bazakolpal, const QString &Bazatipmehid,
                             const QString &Bazamarkameh, const QString &Bazachastota3, const QString &Bazakollop,
                             const QString &Bazapolozhenieid, const QString &Bazatipoporyid, const QString &Bazaproizvmehid,
                             const QString &Bazakb, const QString &Bazadavnom, const QString &Bazarasnom,
                             const QString &Bazadavrd, const QString &Bazarasrd, const QString &Bazatotkazed,
                             const QString &Bazatotkazred, const QString &Bazatotkazmeh, const QString &Normhhid,
                             const QString &Normnomedid, const QString &Normnomid, const QString &Ogrnomedid,
                             const QString &Ogrnomid, const QString &Otkaznomedid, const QString &Otkaznomid,
                             const QString &Normrdedid, const QString &Normrdid, const QString &Ogrrdedid,
                             const QString &Ogrrdid, const QString &Otkazrdedid, const QString &Otkazrdid,
                             const QString &Bazafoto, const QString &Bazashema, const QString &Bazadoc,
                             const QString &Bazapar, const QString &Baza_id)
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
    data.append(Baza_id);

    if(editTableBaza(data))
        return true;
    else
        return false;
}

bool DataBase::insertIntoBazaIzmereni(const QVariantList &data2)
{
   QSqlQuery quer;
   quer.prepare("INSERT INTO BazaIzmereni (id_Baza, Дата, Время, id_Rezhim, id_TipIzmerenia, НормаЭлДв, Норма, 'ЛАЭС-2', АТЭ, "
                "'1В', '1П', '1О', '2В', '2П', '2О', '3В', '3П', '3О', '4В', '4П', '4О', '5В', '5П', '5О', "
                "'6В', '6П', '6О', '7В', '7П', '7О', '8В', '8П', '8О', T1, T2, T3, T4, T5, T6, T7, T8, "
                "Q, P, Примечания) "
                 "VALUES (:idbaza, :date, :time, :idrezhim, :idtipizmer, :normed, :norm, :flaes, :fate, :v1, :p1, :o1, "
                ":v2, :p2, :o2, :v3, :p3, :o3, :v4, :p4, :o4, :v5, :p5, :o5, :v6, :p6, :o6, :v7, :p7, :o7, :v8, :p8, :o8, "
                ":t1, :t2, :t3, :t4, :t5, :t6, :t7, :t8, :q, :p, :prim)");
   quer.bindValue(":idbaza",       data2[0].toString());
   quer.bindValue(":date",         data2[1].toString()=="" ? QVariant(QVariant::String):data2[1].toString());
   quer.bindValue(":time",         data2[2].toString()=="" ? QVariant(QVariant::String):data2[2].toString());
   quer.bindValue(":idrezhim",     data2[3].toString());
   quer.bindValue(":idtipizmer",   data2[4].toString());
   quer.bindValue(":normed",       data2[5].toString()=="" ? QVariant(QVariant::String):data2[5].toReal());
   quer.bindValue(":norm",         data2[6].toString()=="" ? QVariant(QVariant::String):data2[6].toReal());
   quer.bindValue(":flaes",        data2[7].toString()=="" ? QVariant(QVariant::String):data2[7].toString());
   quer.bindValue(":fate",         data2[8].toString()=="" ? QVariant(QVariant::String):data2[8].toString());
   quer.bindValue(":v1",           data2[9].toString()=="" ? QVariant(QVariant::String):data2[9].toReal());
   quer.bindValue(":p1",           data2[10].toString()=="" ? QVariant(QVariant::String):data2[10].toReal());
   quer.bindValue(":o1",           data2[11].toString()=="" ? QVariant(QVariant::String):data2[11].toReal());
   quer.bindValue(":v2",           data2[12].toString()=="" ? QVariant(QVariant::String):data2[12].toReal());
   quer.bindValue(":p2",           data2[13].toString()=="" ? QVariant(QVariant::String):data2[13].toReal());
   quer.bindValue(":o2",           data2[14].toString()=="" ? QVariant(QVariant::String):data2[14].toReal());
   quer.bindValue(":v3",           data2[15].toString()=="" ? QVariant(QVariant::String):data2[15].toReal());
   quer.bindValue(":p3",           data2[16].toString()=="" ? QVariant(QVariant::String):data2[16].toReal());
   quer.bindValue(":o3",           data2[17].toString()=="" ? QVariant(QVariant::String):data2[17].toReal());
   quer.bindValue(":v4",           data2[18].toString()=="" ? QVariant(QVariant::String):data2[18].toReal());
   quer.bindValue(":p4",           data2[19].toString()=="" ? QVariant(QVariant::String):data2[19].toReal());
   quer.bindValue(":o4",           data2[20].toString()=="" ? QVariant(QVariant::String):data2[20].toReal());
   quer.bindValue(":v5",           data2[21].toString()=="" ? QVariant(QVariant::String):data2[21].toReal());
   quer.bindValue(":p5",           data2[22].toString()=="" ? QVariant(QVariant::String):data2[22].toReal());
   quer.bindValue(":o5",           data2[23].toString()=="" ? QVariant(QVariant::String):data2[23].toReal());
   quer.bindValue(":v6",           data2[24].toString()=="" ? QVariant(QVariant::String):data2[24].toReal());
   quer.bindValue(":p6",           data2[25].toString()=="" ? QVariant(QVariant::String):data2[25].toReal());
   quer.bindValue(":o6",           data2[26].toString()=="" ? QVariant(QVariant::String):data2[26].toReal());
   quer.bindValue(":v7",           data2[27].toString()=="" ? QVariant(QVariant::String):data2[27].toReal());
   quer.bindValue(":p7",           data2[28].toString()=="" ? QVariant(QVariant::String):data2[28].toReal());
   quer.bindValue(":o7",           data2[29].toString()=="" ? QVariant(QVariant::String):data2[29].toReal());
   quer.bindValue(":v8",           data2[30].toString()=="" ? QVariant(QVariant::String):data2[30].toReal());
   quer.bindValue(":p8",           data2[31].toString()=="" ? QVariant(QVariant::String):data2[31].toReal());
   quer.bindValue(":o8",           data2[32].toString()=="" ? QVariant(QVariant::String):data2[32].toReal());
   quer.bindValue(":t1",           data2[33].toString()=="" ? QVariant(QVariant::String):data2[33].toReal());
   quer.bindValue(":t2",           data2[34].toString()=="" ? QVariant(QVariant::String):data2[34].toReal());
   quer.bindValue(":t3",           data2[35].toString()=="" ? QVariant(QVariant::String):data2[35].toReal());
   quer.bindValue(":t4",           data2[36].toString()=="" ? QVariant(QVariant::String):data2[36].toReal());
   quer.bindValue(":t5",           data2[37].toString()=="" ? QVariant(QVariant::String):data2[37].toReal());
   quer.bindValue(":t6",           data2[38].toString()=="" ? QVariant(QVariant::String):data2[38].toReal());
   quer.bindValue(":t7",           data2[39].toString()=="" ? QVariant(QVariant::String):data2[39].toReal());
   quer.bindValue(":t8",           data2[40].toString()=="" ? QVariant(QVariant::String):data2[40].toReal());
   quer.bindValue(":q",            data2[41].toString()=="" ? QVariant(QVariant::String):data2[41].toString());
   quer.bindValue(":p",            data2[42].toString()=="" ? QVariant(QVariant::String):data2[42].toString());
   quer.bindValue(":prim",         data2[43].toString()=="" ? QVariant(QVariant::String):data2[43].toString());

   if(!quer.exec()){
       qDebug() << "error insert into " << bazaizm;
       qDebug() << quer.lastError().text();
       return false;
   } else {
       return true;
   }
   return false;
}

bool DataBase::insertIntoBazaIzmereni(const QString &idbaza, const QString &date, const QString &time, const QString &idrezhim, const QString &idtipizmer,
                                      const QString &normed, const QString &norm, const QString &flaes, const QString &fate, const QString &v1,
                                      const QString &p1, const QString &o1, const QString &v2, const QString &p2, const QString &o2, const QString &v3,
                                      const QString &p3, const QString &o3, const QString &v4, const QString &p4, const QString &o4, const QString &v5,
                                      const QString &p5, const QString &o5, const QString &v6, const QString &p6, const QString &o6, const QString &v7,
                                      const QString &p7, const QString &o7, const QString &v8, const QString &p8, const QString &o8, const QString &t1,
                                      const QString &t2, const QString &t3, const QString &t4, const QString &t5, const QString &t6, const QString &t7,
                                      const QString &t8, const QString &q, const QString &p, const QString &prim){
    QVariantList data2;
    data2.append(idbaza);
    data2.append(date);
    data2.append(time);
    data2.append(idrezhim);
    data2.append(idtipizmer);
    data2.append(normed);
    data2.append(norm);
    data2.append(flaes);
    data2.append(fate);
    data2.append(v1);
    data2.append(p1);
    data2.append(o1);
    data2.append(v2);
    data2.append(p2);
    data2.append(o2);
    data2.append(v3);
    data2.append(p3);
    data2.append(o3);
    data2.append(v4);
    data2.append(p4);
    data2.append(o4);
    data2.append(v5);
    data2.append(p5);
    data2.append(o5);
    data2.append(v6);
    data2.append(p6);
    data2.append(o6);
    data2.append(v7);
    data2.append(p7);
    data2.append(o7);
    data2.append(v8);
    data2.append(p8);
    data2.append(o8);
    data2.append(t1);
    data2.append(t2);
    data2.append(t3);
    data2.append(t4);
    data2.append(t5);
    data2.append(t6);
    data2.append(t7);
    data2.append(t8);
    data2.append(q);
    data2.append(p);
    data2.append(prim);
    if(insertIntoBazaIzmereni(data2))
        return true;
    else
        return false;
}

bool DataBase::editTableBazaIzmereni(const QVariantList &data)
{
    qDebug() << "data[44].toString()"<< data[44].toString();
   QSqlQuery quer;
   quer.prepare("update BazaIzmereni set id_Baza = :idbaza, Дата = :date, Время = :time, id_Rezhim = :idrezhim, id_TipIzmerenia = :idtipizmer, "
                "НормаЭлДв = :normed, Норма = :norm, 'ЛАЭС-2' = :flaes, АТЭ = :fate, "
                "'1В' = :v1, '1П' = :p1, '1О' = :o1, '2В' = :v2, '2П' = :p2, '2О' = :o2, '3В' = :v3, '3П' = :p3, '3О' = :o3, "
                "'4В' = :v4, '4П' = :p4, '4О' = :o4, '5В' = :v5, '5П' = :p5, '5О' = :o5, "
                "'6В' = :v6, '6П' = :p6, '6О' = :o6, '7В' = :v7, '7П' = :p7, '7О' = :o7, '8В' = :v8, '8П' = :p8, '8О' = :o8, "
                "T1 = :t1, T2 = :t2, T3 = :t3, T4 = :t4, T5 = :t5, T6 = :t6, T7 = :t7, T8 = :t8, "
                "Q = :q, P = :p, Примечания = :prim where BazaIzmereni.id = :bazaIzmereni_id");
   quer.bindValue(":idbaza",       data[0].toString());
   quer.bindValue(":date",         data[1].toString()=="" ? QVariant(QVariant::String):data[1].toString());
   quer.bindValue(":time",         data[2].toString()=="" ? QVariant(QVariant::String):data[2].toString());
   quer.bindValue(":idrezhim",     data[3].toString());
   quer.bindValue(":idtipizmer",   data[4].toString());
   quer.bindValue(":normed",       data[5].toString()=="" ? QVariant(QVariant::String):data[5].toReal());
   quer.bindValue(":norm",         data[6].toString()=="" ? QVariant(QVariant::String):data[6].toReal());
   quer.bindValue(":flaes",        data[7].toString()=="" ? QVariant(QVariant::String):data[7].toString());
   quer.bindValue(":fate",         data[8].toString()=="" ? QVariant(QVariant::String):data[8].toString());
   quer.bindValue(":v1",           data[9].toString()=="" ? QVariant(QVariant::String):data[9].toReal());
   quer.bindValue(":p1",           data[10].toString()=="" ? QVariant(QVariant::String):data[10].toReal());
   quer.bindValue(":o1",           data[11].toString()=="" ? QVariant(QVariant::String):data[11].toReal());
   quer.bindValue(":v2",           data[12].toString()=="" ? QVariant(QVariant::String):data[12].toReal());
   quer.bindValue(":p2",           data[13].toString()=="" ? QVariant(QVariant::String):data[13].toReal());
   quer.bindValue(":o2",           data[14].toString()=="" ? QVariant(QVariant::String):data[14].toReal());
   quer.bindValue(":v3",           data[15].toString()=="" ? QVariant(QVariant::String):data[15].toReal());
   quer.bindValue(":p3",           data[16].toString()=="" ? QVariant(QVariant::String):data[16].toReal());
   quer.bindValue(":o3",           data[17].toString()=="" ? QVariant(QVariant::String):data[17].toReal());
   quer.bindValue(":v4",           data[18].toString()=="" ? QVariant(QVariant::String):data[18].toReal());
   quer.bindValue(":p4",           data[19].toString()=="" ? QVariant(QVariant::String):data[19].toReal());
   quer.bindValue(":o4",           data[20].toString()=="" ? QVariant(QVariant::String):data[20].toReal());
   quer.bindValue(":v5",           data[21].toString()=="" ? QVariant(QVariant::String):data[21].toReal());
   quer.bindValue(":p5",           data[22].toString()=="" ? QVariant(QVariant::String):data[22].toReal());
   quer.bindValue(":o5",           data[23].toString()=="" ? QVariant(QVariant::String):data[23].toReal());
   quer.bindValue(":v6",           data[24].toString()=="" ? QVariant(QVariant::String):data[24].toReal());
   quer.bindValue(":p6",           data[25].toString()=="" ? QVariant(QVariant::String):data[25].toReal());
   quer.bindValue(":o6",           data[26].toString()=="" ? QVariant(QVariant::String):data[26].toReal());
   quer.bindValue(":v7",           data[27].toString()=="" ? QVariant(QVariant::String):data[27].toReal());
   quer.bindValue(":p7",           data[28].toString()=="" ? QVariant(QVariant::String):data[28].toReal());
   quer.bindValue(":o7",           data[29].toString()=="" ? QVariant(QVariant::String):data[29].toReal());
   quer.bindValue(":v8",           data[30].toString()=="" ? QVariant(QVariant::String):data[30].toReal());
   quer.bindValue(":p8",           data[31].toString()=="" ? QVariant(QVariant::String):data[31].toReal());
   quer.bindValue(":o8",           data[32].toString()=="" ? QVariant(QVariant::String):data[32].toReal());
   quer.bindValue(":t1",           data[33].toString()=="" ? QVariant(QVariant::String):data[33].toReal());
   quer.bindValue(":t2",           data[34].toString()=="" ? QVariant(QVariant::String):data[34].toReal());
   quer.bindValue(":t3",           data[35].toString()=="" ? QVariant(QVariant::String):data[35].toReal());
   quer.bindValue(":t4",           data[36].toString()=="" ? QVariant(QVariant::String):data[36].toReal());
   quer.bindValue(":t5",           data[37].toString()=="" ? QVariant(QVariant::String):data[37].toReal());
   quer.bindValue(":t6",           data[38].toString()=="" ? QVariant(QVariant::String):data[38].toReal());
   quer.bindValue(":t7",           data[39].toString()=="" ? QVariant(QVariant::String):data[39].toReal());
   quer.bindValue(":t8",           data[40].toString()=="" ? QVariant(QVariant::String):data[40].toReal());
   quer.bindValue(":q",            data[41].toString()=="" ? QVariant(QVariant::String):data[41].toString());
   quer.bindValue(":p",            data[42].toString()=="" ? QVariant(QVariant::String):data[42].toString());
   quer.bindValue(":prim",         data[43].toString()=="" ? QVariant(QVariant::String):data[43].toString());
   quer.bindValue(":bazaIzmereni_id", data[44].toString());



   if(!quer.exec()){
       qDebug() << "error insert into " << bazaizm;
       qDebug() << quer.lastError().text();
       return false;
   } else {
       return true;
   }
   return false;
}

bool DataBase::editTableBazaIzmereni(const QString &idbaza, const QString &date, const QString &time, const QString &idrezhim, const QString &idtipizmer,
                                      const QString &normed, const QString &norm, const QString &flaes, const QString &fate, const QString &v1,
                                      const QString &p1, const QString &o1, const QString &v2, const QString &p2, const QString &o2, const QString &v3,
                                      const QString &p3, const QString &o3, const QString &v4, const QString &p4, const QString &o4, const QString &v5,
                                      const QString &p5, const QString &o5, const QString &v6, const QString &p6, const QString &o6, const QString &v7,
                                      const QString &p7, const QString &o7, const QString &v8, const QString &p8, const QString &o8, const QString &t1,
                                      const QString &t2, const QString &t3, const QString &t4, const QString &t5, const QString &t6, const QString &t7,
                                      const QString &t8, const QString &q, const QString &p, const QString &prim, const QString &bazaIzmereni_id){
    QVariantList data;
    data.append(idbaza);
    data.append(date);
    data.append(time);
    data.append(idrezhim);
    data.append(idtipizmer);
    data.append(normed);
    data.append(norm);
    data.append(flaes);
    data.append(fate);
    data.append(v1);
    data.append(p1);
    data.append(o1);
    data.append(v2);
    data.append(p2);
    data.append(o2);
    data.append(v3);
    data.append(p3);
    data.append(o3);
    data.append(v4);
    data.append(p4);
    data.append(o4);
    data.append(v5);
    data.append(p5);
    data.append(o5);
    data.append(v6);
    data.append(p6);
    data.append(o6);
    data.append(v7);
    data.append(p7);
    data.append(o7);
    data.append(v8);
    data.append(p8);
    data.append(o8);
    data.append(t1);
    data.append(t2);
    data.append(t3);
    data.append(t4);
    data.append(t5);
    data.append(t6);
    data.append(t7);
    data.append(t8);
    data.append(q);
    data.append(p);
    data.append(prim);
    data.append(bazaIzmereni_id);
    if(editTableBazaIzmereni(data))
        return true;
    else
        return false;
}

bool DataBase::insertIntoCeh(const QVariantList &data)
{
   QSqlQuery quer;
   quer.prepare("INSERT INTO Ceh (Наименование) "
                 "VALUES (:cehname)");
   quer.bindValue(":cehname",     data[0].toString()=="" ? QVariant(QVariant::String):data[0].toString());
qDebug()<<"data[0]"<<data[0];
qDebug()<<"data[0].toString()"<<data[0].toString();

   if(!quer.exec()){
       qDebug() << "error insert into " << ceh;
       qDebug() << quer.lastError().text();
       return false;
   } else {
       return true;
   }
   return false;
}

bool DataBase::insertIntoCeh(const QString &cehname){
    QVariantList data;
    data.append(cehname);
    if(insertIntoCeh(data))
        return true;
    else
        return false;
}

bool DataBase::insertIntoTipMehanizma(const QVariantList &data)
{
   QSqlQuery quer;
   quer.prepare("INSERT INTO TipMehanizma (Наименование) "
                 "VALUES (:tipmehname)");
   quer.bindValue(":tipmehname",     data[0].toString()=="" ? QVariant(QVariant::String):data[0].toString());
   if(!quer.exec()){
       qDebug() << "error insert into " << tipmeh;
       qDebug() << quer.lastError().text();
       return false;
   } else {
       return true;
   }
   return false;
}

bool DataBase::insertIntoTipMehanizma(const QString &tipmehname){
    QVariantList data;
    data.append(tipmehname);
    if(insertIntoTipMehanizma(data))
        return true;
    else
        return false;
}

bool DataBase::insertIntoTipPeredatochnogoMehanizma(const QVariantList &data)
{
   QSqlQuery quer;
   quer.prepare("INSERT INTO TipPeredatochnogoMehanizma (Наименование) "
                 "VALUES (:tippermehname)");
   quer.bindValue(":tippermehname",     data[0].toString()=="" ? QVariant(QVariant::String):data[0].toString());
   if(!quer.exec()){
       qDebug() << "error insert into " << tippermeh;
       qDebug() << quer.lastError().text();
       return false;
   } else {
       return true;
   }
   return false;
}

bool DataBase::insertIntoTipPeredatochnogoMehanizma(const QString &tippermehname){
    QVariantList data;
    data.append(tippermehname);
    if(insertIntoTipPeredatochnogoMehanizma(data))
        return true;
    else
        return false;
}

bool DataBase::insertIntoTipPeredachi(const QVariantList &data)
{
   QSqlQuery quer;
   quer.prepare("INSERT INTO TipPeredachi (Наименование) "
                 "VALUES (:tippername)");
   quer.bindValue(":tippername",     data[0].toString()=="" ? QVariant(QVariant::String):data[0].toString());
   if(!quer.exec()){
       qDebug() << "error insert into " << tipper;
       qDebug() << quer.lastError().text();
       return false;
   } else {
       return true;
   }
   return false;
}

bool DataBase::insertIntoTipPeredachi(const QString &tippername){
    QVariantList data;
    data.append(tippername);
    if(insertIntoTipPeredachi(data))
        return true;
    else
        return false;
}

bool DataBase::insertIntoBazaProgram(const QVariantList &data)
{
   QSqlQuery quer;
   quer.prepare("INSERT INTO BazaProgram (№КАТЭ, Название_программы) "
                 "VALUES (:programmnumber, :programmname)");
   quer.bindValue(":programmnumber",     data[0].toString()=="" ? QVariant(QVariant::String):data[0].toString());
   quer.bindValue(":programmname",     data[1].toString()=="" ? QVariant(QVariant::String):data[1].toString());
   if(!quer.exec()){
       qDebug() << "error insert into " << bazaprogram;
       qDebug() << quer.lastError().text();
       return false;
   } else {
       return true;
   }
   return false;
}

bool DataBase::insertIntoBazaProgram(const QString &programmnumber, const QString &programmname){
    QVariantList data;
    data.append(programmnumber);
    data.append(programmname);
    if(insertIntoBazaProgram(data))
        return true;
    else
        return false;
}

bool DataBase::insertIntoProizvodElPriv(const QVariantList &data)
{
   QSqlQuery quer;
   quer.prepare("INSERT INTO ProizvodElPriv (Наименование) "
                 "VALUES (:proizvedname)");
   quer.bindValue(":proizvedname",     data[0].toString()=="" ? QVariant(QVariant::String):data[0].toString());
   if(!quer.exec()){
       qDebug() << "error insert into " << proizved;
       qDebug() << quer.lastError().text();
       return false;
   } else {
       return true;
   }
   return false;
}

bool DataBase::insertIntoProizvodElPriv(const QString &proizvedname){
    QVariantList data;
    data.append(proizvedname);
    if(insertIntoProizvodElPriv(data))
        return true;
    else
        return false;
}

bool DataBase::insertIntoProizvodIspMeh(const QVariantList &data)
{
   QSqlQuery quer;
   quer.prepare("INSERT INTO ProizvodIspMeh (Наименование) "
                 "VALUES (:proizvname)");
   quer.bindValue(":proizvname",     data[0].toString()=="" ? QVariant(QVariant::String):data[0].toString());
   if(!quer.exec()){
       qDebug() << "error insert into " << proizvmeh;
       qDebug() << quer.lastError().text();
       return false;
   } else {
       return true;
   }
   return false;
}

bool DataBase::insertIntoProizvodIspMeh(const QString &proizvname){
    QVariantList data;
    data.append(proizvname);
    if(insertIntoProizvodIspMeh(data))
        return true;
    else
        return false;
}

/* Метод для удаления записи из таблицы "База оборудования"
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

/* Метод для удаления записи из таблицы "База измерений"
 * */
bool DataBase::removeRecordBI(const int id)
{
    // Удаление строки из базы данных будет производитсья с помощью SQL-запроса
    QSqlQuery query;

    // Удаление производим по id записи, который передается в качестве аргумента функции
    query.prepare("DELETE FROM " bazaizm " WHERE id= :ID ;");
    query.bindValue(":ID", id);

    // Выполняем удаление
    if(!query.exec()){
        qDebug() << "error delete row " << bazaizm;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

/* Метод для удаления записи из таблицы "Цех"
 * */
bool DataBase::removeRecordCeh(const int id)
{
    // Удаление строки из базы данных будет производитсья с помощью SQL-запроса
    QSqlQuery query;

    // Удаление производим по id записи, который передается в качестве аргумента функции
    query.prepare("DELETE FROM " ceh " WHERE id= :ID ;");
    query.bindValue(":ID", id);

    // Выполняем удаление
    if(!query.exec()){
        qDebug() << "error delete row " << ceh;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

/* Метод для удаления записи из таблицы "Тип механизма"
 * */
bool DataBase::removeRecordTipMehanizma(const int id)
{
    // Удаление строки из базы данных будет производитсья с помощью SQL-запроса
    QSqlQuery query;

    // Удаление производим по id записи, который передается в качестве аргумента функции
    query.prepare("DELETE FROM " tipmeh " WHERE id= :ID ;");
    query.bindValue(":ID", id);

    // Выполняем удаление
    if(!query.exec()){
        qDebug() << "error delete row " << tipmeh;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

/* Метод для удаления записи из таблицы "Тип передаточного механизма"
 * */
bool DataBase::removeRecordTipPeredatochnogoMehanizma(const int id)
{
    // Удаление строки из базы данных будет производитсья с помощью SQL-запроса
    QSqlQuery query;

    // Удаление производим по id записи, который передается в качестве аргумента функции
    query.prepare("DELETE FROM " tippermeh " WHERE id= :ID ;");
    query.bindValue(":ID", id);

    // Выполняем удаление
    if(!query.exec()){
        qDebug() << "error delete row " << tippermeh;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

/* Метод для удаления записи из таблицы "Тип передачи"
 * */
bool DataBase::removeRecordTipPeredachi(const int id)
{
    // Удаление строки из базы данных будет производитсья с помощью SQL-запроса
    QSqlQuery query;

    // Удаление производим по id записи, который передается в качестве аргумента функции
    query.prepare("DELETE FROM " tipper " WHERE id= :ID ;");
    query.bindValue(":ID", id);

    // Выполняем удаление
    if(!query.exec()){
        qDebug() << "error delete row " << tipper;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

/* Метод для удаления записи из таблицы "База программ ПНР"
 * */
bool DataBase::removeRecordBazaProgram(const int id)
{
    // Удаление строки из базы данных будет производитсья с помощью SQL-запроса
    QSqlQuery query;

    // Удаление производим по id записи, который передается в качестве аргумента функции
    query.prepare("DELETE FROM " bazaprogram " WHERE id= :ID ;");
    query.bindValue(":ID", id);

    // Выполняем удаление
    if(!query.exec()){
        qDebug() << "error delete row " << bazaprogram;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

/* Метод для удаления записи из таблицы "Производители электродвигателей"
 * */
bool DataBase::removeRecordProizvodElPriv(const int id)
{
    // Удаление строки из базы данных будет производитсья с помощью SQL-запроса
    QSqlQuery query;

    // Удаление производим по id записи, который передается в качестве аргумента функции
    query.prepare("DELETE FROM " proizved " WHERE id= :ID ;");
    query.bindValue(":ID", id);

    // Выполняем удаление
    if(!query.exec()){
        qDebug() << "error delete row " << proizved;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

/* Метод для удаления записи из таблицы "Производители исполнительных механизмов"
 * */
bool DataBase::removeRecordProizvodIspMeh(const int id)
{
    // Удаление строки из базы данных будет производитсья с помощью SQL-запроса
    QSqlQuery query;

    // Удаление производим по id записи, который передается в качестве аргумента функции
    query.prepare("DELETE FROM " proizvmeh " WHERE id= :ID ;");
    query.bindValue(":ID", id);

    // Выполняем удаление
    if(!query.exec()){
        qDebug() << "error delete row " << proizvmeh;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}
