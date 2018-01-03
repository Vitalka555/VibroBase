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

private:
    /* Внутренние методы для работы с базой данных
     * */
    bool openDataBase();        // Открытие базы данных
    //bool restoreDataBase();     // Восстановление базы данных
    void closeDataBase();       // Закрытие базы данных
    //bool createTable();         // Создание базы таблицы в базе данных

public slots:
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

    bool removeRecord(const int id); // Удаление записи из таблицы "База оборудования" по её id
    bool removeRecordBI(const int id); // Удаление записи из таблицы "База измерений" по её id
};

#endif // DATABASE_H
