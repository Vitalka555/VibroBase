#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSql>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlDatabase>
#include <QFile>
#include <QDate>
#include <QDebug>
#include <QDir>
#include <QSettings>
//#include <QApplication>


/* Директивы имен таблицы, полей таблицы и базы данных */
//#define DATABASE_HOSTNAME   "NameDataBase"
#define DATABASE_NAME       "sqlite.db"

#define ate                   "ATE"
#define ate_fam               "ATE.'Фамилия'"

#define baza                   "Baza"         // Название таблицы
#define baza_kks             "Baza.KKS"
#define baza_zd               "Baza.'Здание'"
#define baza_otm             "Baza.'Отметка'"
#define baza_pom             "Baza.'Помещение'"
#define baza_opis             "Baza.'Описание системы'"
#define baza_shema_filename             "Baza.Shema_filename"
#define baza_foto_filename               "Baza.'Фото_filename'"
#define baza_id_tipprivoda             "Baza.id_TipPrivoda"
#define baza_marka_eldv             "Baza.'Марка эл/дв'"
#define baza_mosch               "Baza.'Мощность'"
#define baza_chastota1             "Baza.'Частота1'"
#define baza_id_tippermeh               "Baza.id_TipPeredatochnogoMehanizma"
#define baza_id_tipperedachi             "Baza.id_TipPeredachi"
#define baza_kolpal               "Baza.'Количество пальцев'"
#define baza_id_tipmeh             "Baza.id_TipMehanizma"
#define baza_markameh             "Baza.'Марка механизма'"
#define baza_chastota3               "Baza.'Частота3'"
#define baza_kollop             "Baza.'Количество лопастей'"
#define baza_id_polozhenie             "Baza.id_Polozhenie"
#define baza_id_tipopory               "Baza.id_TipOpory"
#define baza_davnom             "Baza.'Давление ном'"
#define baza_rasnom               "Baza.'Расход ном'"
#define baza_davrd             "Baza.'Давление р/д'"
#define baza_rasrd             "Baza.'Расход р/д'"
#define baza_id_normhh               "Baza.id_NormHh"
#define baza_id_normnom             "Baza.id_NormNom"
#define baza_id_ogrnom             "Baza.id_OgrNom"
#define baza_id_otkaznom               "Baza.id_OtkazNom"
#define baza_id_normrd             "Baza.id_NormRd"
#define baza_id_ogrrd             "Baza.id_OgrRd"
#define baza_id_otkazrd               "Baza.id_OtkazRd"
#define baza_id_ceh             "Baza.id_Ceh"
#define baza_id_fio               "Baza.id_FIO"
#define baza_docnanormy             "Baza.'Документы на нормы'"
#define baza_paramcentr             "Baza.'Параметры центровки и прилегания'"
#define baza_prim             "Baza.'Примечания к агрегату'"
#define baza_id_proizvmeh               "Baza.id_ProizvodIspMeh"
#define baza_id_proizveldv               "Baza.id_ProizvodElPriv"
#define baza_id_postav               "Baza.id_PostavAgr"
#define baza_id_normnomed               "Baza.id_NormNomED"
#define baza_id_ogrnomed               "Baza.id_OgrNomED"
#define baza_id_otkaznomed               "Baza.id_OtkazNomED"
#define baza_id_normrded               "Baza.id_NormRdED"
#define baza_id_ogrrded              "Baza.id_OgrRdED"
#define baza_id_otkazrded               "Baza.id_OtkazRdED"
#define baza_id_bazaprogram               "Baza.id_BazaProgram"
#define baza_totkazed               "Baza.TotkazED"
#define baza_totkazred               "Baza.TotkazRed"
#define baza_totkazmeh               "Baza.TotkazIspMeh"

#define bazaizm                   "BazaIzmereni"
#define bazaizm_id_baza                   "BazaIzmereni.id_Baza"
#define bazaizm_data                   "BazaIzmereni.'Дата'"
#define bazaizm_1v                   "BazaIzmereni.'1В'"
#define bazaizm_1p                   "BazaIzmereni.'1П'"
#define bazaizm_1o                   "BazaIzmereni.'1О'"
#define bazaizm_2v                   "BazaIzmereni.'2В'"
#define bazaizm_2p                   "BazaIzmereni.'2П'"
#define bazaizm_2o                   "BazaIzmereni.'2О'"
#define bazaizm_3v                   "BazaIzmereni.'3В'"
#define bazaizm_3p                   "BazaIzmereni.'3П'"
#define bazaizm_3o                   "BazaIzmereni.'3О'"
#define bazaizm_4v                   "BazaIzmereni.'4В'"
#define bazaizm_4p                   "BazaIzmereni.'4П'"
#define bazaizm_4o                   "BazaIzmereni.'4О'"
#define bazaizm_5v                   "BazaIzmereni.'5В'"
#define bazaizm_5p                   "BazaIzmereni.'5П'"
#define bazaizm_5o                   "BazaIzmereni.'5О'"
#define bazaizm_6v                   "BazaIzmereni.'6В'"
#define bazaizm_6p                   "BazaIzmereni.'6П'"
#define bazaizm_6o                   "BazaIzmereni.'6О'"
#define bazaizm_7v                   "BazaIzmereni.'7В'"
#define bazaizm_7p                   "BazaIzmereni.'7П'"
#define bazaizm_7o                   "BazaIzmereni.'7О'"
#define bazaizm_8v                   "BazaIzmereni.'8В'"
#define bazaizm_8p                   "BazaIzmereni.'8П'"
#define bazaizm_8o                   "BazaIzmereni.'8О'"
#define bazaizm_prim                   "BazaIzmereni.'Примечания'"
#define bazaizm_id_rezhim                   "BazaIzmereni.id_Rezhim"
#define bazaizm_norma                   "BazaIzmereni.'Норма'"
#define bazaizm_normaed                  "BazaIzmereni.'НормаЭлДв'"
#define bazaizm_id_tipizm                   "BazaIzmereni.id_TipIzmerenia"
#define bazaizm_t1                   "BazaIzmereni.'T1'"
#define bazaizm_t2                   "BazaIzmereni.'T2'"
#define bazaizm_t3                   "BazaIzmereni.'T3'"
#define bazaizm_t4                   "BazaIzmereni.'T4'"
#define bazaizm_t5                   "BazaIzmereni.'T5'"
#define bazaizm_t6                   "BazaIzmereni.'T6'"
#define bazaizm_t7                   "BazaIzmereni.'T7'"
#define bazaizm_t8                   "BazaIzmereni.'T8'"
#define bazaizm_q                   "BazaIzmereni.'Q'"
#define bazaizm_p                   "BazaIzmereni.'P'"
#define bazaizm_laes2                  "BazaIzmereni.'ЛАЭС-2'"
#define bazaizm_ate                   "BazaIzmereni.'АТЭ'"
#define bazaizm_vremya                   "BazaIzmereni.'Время'"

#define bazapodsh                   "BazaPodsh"
#define bazapodsh_id_baza                   "BazaPodsh.id_Baza"
#define bazapodsh_oboz                   "BazaPodsh.'Обозначение'"
#define bazapodsh_id_rasp                   "BazaPodsh.id_RaspolozhPodsh"
#define bazapodsh_vnd                   "BazaPodsh.'Внутренний диаметр'"
#define bazapodsh_nd                   "BazaPodsh.'Наружный диаметр'"
#define bazapodsh_dt                   "BazaPodsh.'Диаметр тела'"
#define bazapodsh_kolt                   "BazaPodsh.'Количество тел'"
#define bazapodsh_ugol                   "BazaPodsh.'Угол контакта'"
#define bazapodsh_id_nomeropory                   "BazaPodsh.id_NomerOpory"
#define bazapodsh_id_tippodsh                   "BazaPodsh.id_TipPodshipnika"

#define bazaprogram                   "BazaProgram"
#define bazaprogram_nomer                   "BazaProgram.'№КАТЭ'"

#define ceh                   "Ceh"
#define ceh_name                   "Ceh.'Наименование'"

#define fio                   "FIO"
#define fio_fio                   "FIO.'ФИО'"

#define laes                   "LAES"
#define laes_fam                   "LAES.'Фамилия'"

#define nomeropory                   "NomerOpory"
#define nomeropory_nomer                   "NomerOpory.'Номер'"

#define normhh                   "NormHh"
#define normhh_zn                   "NormHh.'Значение'"

#define normnom                   "NormNom"
#define normnom_zn                   "NormNom.'Значение'"

#define normnomed                   "NormNomED"
#define normnomed_zn                   "NormNomED.'Значение'"

#define normrd                   "NormRd"
#define normrd_zn                   "NormRd.'Значение'"

#define normrded                   "NormRdED"
#define normrded_zn                   "NormRdED.'Значение'"

#define ogrnom                   "OgrNom"
#define ogrnom_zn                   "OgrNom.'Значение'"

#define ogrnomed                   "OgrNomED"
#define ogrnomed_zn                   "OgrNomED.'Значение'"

#define ogrrd                   "OgrRd"
#define ogrrd_zn                   "OgrRd.'Значение'"

#define ogrrded                   "OgrRdED"
#define ogrrded_zn                   "OgrRdED.'Значение'"

#define otkaznom                   "OtkazNom"
#define otkaznom_zn                   "OtkazNom.'Значение'"

#define otkaznomed                   "OtkazNomED"
#define otkaznomed_zn                   "OtkazNomED.'Значение'"

#define otkazrd                   "OtkazRd"
#define otkazrd_zn                   "OtkazRd.'Значение'"

#define otkazrded                   "OtkazRdED"
#define otkazrded_zn                   "OtkazRdED.'Значение'"

#define polozhenie                   "Polozhenie"
#define polozhenie_name                   "Polozhenie.'Наименование'"

#define postav                   "PostavAgr"
#define postav_name                   "PostavAgr.'Наименование'"

#define proizved                   "ProizvodElPriv"
#define proizved_name                   "ProizvodElPriv.'Наименование'"

#define proizvmeh                   "ProizvodIspMeh"
#define proizvmeh_name                   "ProizvodIspMeh.'Наименование'"

#define rasppodsh                   "RaspolozhPodsh"
#define rasppodsh_uzel                   "RaspolozhPodsh.'Узел'"

#define rezhim                   "Rezhim"
#define rezhim_name                   "Rezhim.'Наименование'"

#define tipizm                   "TipIzmerenia"
#define tipizm_name                   "TipIzmerenia.'Наименование'"

#define tipmeh                   "TipMehanizma"
#define tipmeh_name                   "TipMehanizma.'Наименование'"

#define tipopory                   "TipOpory"
#define tipopory_name                   "TipOpory.'Наименование'"

#define tipper                   "TipPeredachi"
#define tipper_name                   "TipPeredachi.'Наименование'"

#define tippermeh                   "TipPeredatochnogoMehanizma"
#define tippermeh_name                   "TipPeredatochnogoMehanizma.'Наименование'"

#define tippodsh                   "TipPodshipnika"
#define tippodsh_tip                   "TipPodshipnika.'Тип подшипника'"


// Первая колонка содержит Autoincrement ID

class DataBase : public QObject
{
    Q_OBJECT
public:
    explicit DataBase(QObject *parent = 0);
    ~DataBase();
    /* Методы для непосредственной работы с классом
     * Подключение к базе данных и вставка записей в таблицу
     * */
    void connectToDataBase();

private:
    // Сам объект базы данных, с которым будет производиться работа
    QSqlDatabase    db;

    QString path = QDir::currentPath()+"/settings.ini"; //путь хранения ini файла
    QString pathToBase; //путь хранения файла базы
    QString pathToPhoto;//путь хранения фотографий
    QString pathToShema;//путь хранения схем

private:
    /* Внутренние методы для работы с базой данных
     * */
    bool openDataBase();        // Открытие базы данных
    //bool restoreDataBase();     // Восстановление базы данных
    void closeDataBase();       // Закрытие базы данных
    //bool createTable();         // Создание базы таблицы в базе данных

public slots:
    void writeSettings();
    void readSettings();//чтение для открытия базы
    void readSettings2();//чтение для интерфейса qml
    void writeSettingsWindow();
    bool insertIntoTable0(const QVariantList &data);
    bool insertIntoTable0(const QString &bazakks);
    bool insertIntoTable(const QVariantList &data);      // Добавление записей в таблицу
    bool insertIntoTable(const QString &Bazakks, const QString &Cehid, const QString &Bazazd, const QString &Bazapom,
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
                         const QString &Bazapar);
    bool editTableBaza(const QVariantList &data);
    bool editTableBaza(const QString &Bazakks, const QString &Cehid, const QString &Bazazd, const QString &Bazapom,
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
                       const QString &Bazapar, const QString &Baza_id);
    bool insertIntoBazaIzmereni(const QVariantList &data2);
    bool insertIntoBazaIzmereni(const QString &idbaza, const QString &date, const QString &time, const QString &idrezhim, const QString &idtipizmer,
                                const QString &normed, const QString &norm, const QString &flaes, const QString &fate, const QString &v1,
                                const QString &p1, const QString &o1, const QString &v2, const QString &p2, const QString &o2, const QString &v3,
                                const QString &p3, const QString &o3, const QString &v4, const QString &p4, const QString &o4, const QString &v5,
                                const QString &p5, const QString &o5, const QString &v6, const QString &p6, const QString &o6, const QString &v7,
                                const QString &p7, const QString &o7, const QString &v8, const QString &p8, const QString &o8, const QString &t1,
                                const QString &t2, const QString &t3, const QString &t4, const QString &t5, const QString &t6, const QString &t7,
                                const QString &t8, const QString &q, const QString &p, const QString &prim);
    bool editTableBazaIzmereni(const QVariantList &data);
    bool editTableBazaIzmereni(const QString &idbaza, const QString &date, const QString &time, const QString &idrezhim, const QString &idtipizmer,
                                const QString &normed, const QString &norm, const QString &flaes, const QString &fate, const QString &v1,
                                const QString &p1, const QString &o1, const QString &v2, const QString &p2, const QString &o2, const QString &v3,
                                const QString &p3, const QString &o3, const QString &v4, const QString &p4, const QString &o4, const QString &v5,
                                const QString &p5, const QString &o5, const QString &v6, const QString &p6, const QString &o6, const QString &v7,
                                const QString &p7, const QString &o7, const QString &v8, const QString &p8, const QString &o8, const QString &t1,
                                const QString &t2, const QString &t3, const QString &t4, const QString &t5, const QString &t6, const QString &t7,
                                const QString &t8, const QString &q, const QString &p, const QString &prim, const QString &bazaIzmereni_id);
    bool insertIntoCeh(const QVariantList &data);
    bool insertIntoCeh(const QString &cehname);
    bool insertIntoTipMehanizma(const QVariantList &data);
    bool insertIntoTipMehanizma(const QString &tipmehname);
    bool insertIntoTipPeredatochnogoMehanizma(const QVariantList &data);
    bool insertIntoTipPeredatochnogoMehanizma(const QString &tippermehname);
    bool insertIntoTipPeredachi(const QVariantList &data);
    bool insertIntoTipPeredachi(const QString &tippername);
    bool insertIntoBazaProgram(const QVariantList &data);
    bool insertIntoBazaProgram(const QString &programmnumber, const QString &programmname);
    bool insertIntoProizvodElPriv(const QVariantList &data);
    bool insertIntoProizvodElPriv(const QString &proizvedname);
    bool insertIntoProizvodIspMeh(const QVariantList &data);
    bool insertIntoProizvodIspMeh(const QString &proizvname);
    bool insertIntoLAES(const QVariantList &data);
    bool insertIntoLAES(const QString &laesfam);
    bool insertIntoATE(const QVariantList &data);
    bool insertIntoATE(const QString &atefam);
    bool insertIntoFIO(const QVariantList &data);
    bool insertIntoFIO(const QString &fiofio);
    bool insertIntoNormHh(const QVariantList &data);
    bool insertIntoNormHh(const QString &norm_hh);
    bool insertIntoNormNomED(const QVariantList &data);
    bool insertIntoNormNomED(const QString &norm_nomed);
    bool insertIntoNormNom(const QVariantList &data);
    bool insertIntoNormNom(const QString &norm_nom);
    bool insertIntoNormRdED(const QVariantList &data);
    bool insertIntoNormRdED(const QString &norm_rded);
    bool insertIntoNormRd(const QVariantList &data);
    bool insertIntoNormRd(const QString &norm_rd);
    bool insertIntoOgrNomED(const QVariantList &data);
    bool insertIntoOgrNomED(const QString &ogr_nomed);
    bool insertIntoOgrNom(const QVariantList &data);
    bool insertIntoOgrNom(const QString &ogr_nom);
    bool insertIntoOgrRdED(const QVariantList &data);
    bool insertIntoOgrRdED(const QString &ogr_rded);
    bool insertIntoOgrRd(const QVariantList &data);
    bool insertIntoOgrRd(const QString &ogr_rd);
    bool insertIntoOtkazNomED(const QVariantList &data);
    bool insertIntoOtkazNomED(const QString &otkaz_nomed);
    bool insertIntoOtkazNom(const QVariantList &data);
    bool insertIntoOtkazNom(const QString &otkaz_nom);
    bool insertIntoOtkazRdED(const QVariantList &data);
    bool insertIntoOtkazRdED(const QString &otkaz_rded);
    bool insertIntoOtkazRd(const QVariantList &data);
    bool insertIntoOtkazRd(const QString &otkaz_rd);
    bool insertIntoBearing(const QVariantList &data);
    bool insertIntoBearing(const QString &name, const QString &obRU, const QString &obEN, const QString &d,
                           const QString &D, const QString &B, const QString &dtk, const QString &z, const QString &u,
                           const QString &m, const QString &stat, const QString &dinam);
    bool editBearing(const QVariantList &data);
    bool editBearing(const QString &name, const QString &obRU, const QString &obEN, const QString &d,
                     const QString &D, const QString &B, const QString &dtk, const QString &z, const QString &u,
                     const QString &m, const QString &stat, const QString &dinam, const QString &id);
    bool removeRecordBearing(const int id);
    bool insertIntoBaseOpor(const QVariantList &data);
    bool insertIntoBaseOpor(const QString &idbaza, const QString &nomeropor, const QString &kolpodsh, const QString &idtippodsh,
                           const QString &idbasepodsh, const QString &idrasppodsh);
    bool editBaseOpor(const QVariantList &data);
    bool editBaseOpor(const QString &idbaza, const QString &nomeropor, const QString &kolpodsh, const QString &idtippodsh,
                           const QString &idbasepodsh, const QString &idrasppodsh, const QString &id);
    bool removeRecordBaseOpor(const int id);

    bool removeRecord(const int id); // Удаление записи из таблицы "База оборудования" по её id
    bool removeRecordBI(const int id); // Удаление записи из таблицы "База измерений" по её id
    bool removeRecordCeh(const int id); // Удаление записи из таблицы "Цех" по её id
    bool removeRecordTipMehanizma(const int id); // Удаление записи из таблицы "Тип механизма" по её id
    bool removeRecordTipPeredatochnogoMehanizma(const int id); // Удаление записи из таблицы "Тип передаточного механизма" по её id
    bool removeRecordTipPeredachi(const int id); // Удаление записи из таблицы "Тип передачи" по её id
    bool removeRecordBazaProgram(const int id); // Удаление записи из таблицы "База программ ПНР" по её id
    bool removeRecordProizvodElPriv(const int id); // Удаление записи из таблицы "Производители электродвигателей" по её id
    bool removeRecordProizvodIspMeh(const int id); // Удаление записи из таблицы "Производители исполнительных механизмов" по её id
    bool removeRecordLAES(const int id); // Удаление записи из таблицы "Персонал ЛАЭС" по её id
    bool removeRecordATE(const int id); // Удаление записи из таблицы "Персонал АТЭ" по её id
    bool removeRecordFIO(const int id); // Удаление записи из таблицы "Заполняющие" по её id
    bool removeRecordNormHh(const int id);
    bool removeRecordNormNomED(const int id);
    bool removeRecordNormNom(const int id);
    bool removeRecordNormRdED(const int id);
    bool removeRecordNormRd(const int id);
    bool removeRecordOgrNomED(const int id);
    bool removeRecordOgrNom(const int id);
    bool removeRecordOgrRdED(const int id);
    bool removeRecordOgrRd(const int id);
    bool removeRecordOtkazNomED(const int id);
    bool removeRecordOtkazNom(const int id);
    bool removeRecordOtkazRdED(const int id);
    bool removeRecordOtkazRd(const int id);
};

#endif // DATABASE_H
