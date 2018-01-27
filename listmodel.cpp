#include "listmodel.h"
#include "database.h"

ListModel::ListModel(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModel::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModel::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[baza_kksRole] = "Bazakks";
    roles[ceh_nameRole] = "Cehname";
    roles[baza_zdRole] = "Bazazd";
//    roles[baza_otmRole] = "bazaotm";
    roles[baza_pomRole] = "Bazapom";
    roles[baza_opisRole] = "Bazaopis";
//    roles[baza_shema_filenameRole] = "bazashemafilename";
//    roles[baza_foto_filenameRole] = "bazafotofilename";
//    roles[baza_id_tipprivodaRole] = "bazaidtipprivoda";
//    roles[baza_marka_eldvRole] = "bazamarkaeldv";
//    roles[baza_moschRole] = "bazamosch";
//    roles[baza_chastota1Role] = "bazachastota1";
//    roles[baza_id_tippermehRole] = "bazaidtippermeh";
//    roles[baza_id_tipperedachiRole] = "bazaidtipperedachi";
//    roles[baza_kolpalRole] = "bazakolpal";
//    roles[baza_id_tipmehRole] = "bazaidtipmeh";
//    roles[baza_markamehRole] = "bazamarkameh";
//    roles[baza_chastota3Role] = "bazachastota3";
//    roles[baza_kollopRole] = "bazakollop";
//    roles[baza_id_polozhenieRole] = "bazaidpolozhenie";
//    roles[baza_id_tipoporyRole] = "bazaidtipopory";
//    roles[baza_davnomRole] = "bazadavnom";
//    roles[baza_rasnomRole] = "bazarasnom";
//    roles[baza_davrdRole] = "bazadavrd";
//    roles[baza_rasrdRole] = "bazarasrd";
//    roles[baza_id_normhhRole] = "bazaidnormhh";
//    roles[baza_id_normnomRole] = "bazaidnormnom";
//    roles[baza_id_ogrnomRole] = "bazaidogrnom";
//    roles[baza_id_otkaznomRole] = "bazaidotkaznom";
//    roles[baza_id_normrdRole] = "bazaidnormrd";
//    roles[baza_id_ogrrdRole] = "bazaidogrrd";
//    roles[baza_id_otkazrdRole] = "bazaidotkazrd";
//    roles[baza_id_cehRole] = "bazaidceh";
//    roles[baza_id_fioRole] = "bazaidfio";
//    roles[baza_docnanormyRole] = "bazadocnanormy";
//    roles[baza_paramcentrRole] = "bazaparamcentr";
//    roles[baza_primRole] = "bazaprim";
//    roles[baza_id_proizvmehRole] = "bazaidproizvmeh";
//    roles[baza_id_proizveldvRole] = "bazaidproizveldv";
//    roles[baza_id_postavRole] = "bazaidpostav";
//    roles[baza_id_normnomedRole] = "bazaidnormnomed";
//    roles[baza_id_ogrnomedRole] = "bazaidogrnomed";
//    roles[baza_id_otkaznomedRole] = "bazaidotkaznomed";
//    roles[baza_id_normrdedRole] = "bazaidnormrded";
//    roles[baza_id_ogrrdedRole] = "bazaidogrrded";
//    roles[baza_id_otkazrdedRole] = "bazaidotkazrded";
//    roles[baza_id_bazaprogramRole] = "bazaidbazaprogram";
//    roles[baza_totkazedRole] = "bazatotkazed";
//    roles[baza_totkazredRole] = "bazatotkazred";
//    roles[baza_totkazmehRole] = "bazatotkazmeh";

    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModel::updateModel()
{
    QObject* stack = this->parent()->findChild<QObject*>("stackView");
    QString kks=(stack->property("kks")).toString();
    QString id_ceh=(stack->property("id_ceh")).toString();
    QString zd=(stack->property("zd")).toString();
    QString id_tipmeh=(stack->property("id_tipmeh")).toString();
    QString ceh_filter = " and Baza.id_Ceh = " + id_ceh;
    QString tipmeh_filter = " and Baza.id_TipMehanizma = " + id_tipmeh;
    if(id_ceh == ""){
        ceh_filter = "";
    }
    if(id_tipmeh == ""){
        tipmeh_filter = "";
    }
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery("SELECT Baza.id, " baza_kks ", (SELECT " ceh_name " FROM " ceh " where Ceh.id=Baza.id_Ceh ), "
                   baza_zd ", " baza_pom ", " baza_opis " FROM " baza " WHERE Baza.KKS LIKE '%"+kks+"%' "
                   " AND COALESCE(Baza.Здание,'') LIKE '%"+zd+"%'" + ceh_filter + tipmeh_filter + " ORDER BY " baza_kks);
//    QSqlQuery querymodel;
//    querymodel.exec("SELECT Baza.id, " baza_kks ", (SELECT " ceh_name " FROM " ceh " where Ceh.id=Baza.id_Ceh ), "
//                    baza_zd ", " baza_pom ", " baza_opis " FROM " baza " WHERE Baza.KKS LIKE '%"+kks+"%' "
//                    "AND COALESCE(Baza.Здание,'') LIKE '%"+zd+"%'" + ceh_filter + tipmeh_filter + " ORDER BY " baza_kks);
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModel::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelKKS::ListModelKKS
/// \param parent
///
ListModelKKS::ListModelKKS(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelKKS::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelKKS::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[kks_nameRole] = "kksname";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelKKS::updateModel()
{
    QObject* stack = this->parent()->findChild<QObject*>("stackView");
    QString combo_kks=(stack->property("combo_kks")).toString();
    qDebug()<<"combo kks = "<<combo_kks;
    if(combo_kks == ""){
        QSqlDatabase db = QSqlDatabase::database();
        db.transaction();
        this->setQuery(" SELECT Baza.id, Baza.KKS FROM Baza ORDER BY Baza.KKS ");
        while(this->canFetchMore()){
            this->fetchMore();
        }
        db.commit();
        if(!db.commit()){
        db.rollback();
        }
    } else {
        QSqlDatabase db = QSqlDatabase::database();
        db.transaction();
        this->setQuery(" SELECT Baza.id, Baza.KKS FROM Baza WHERE Baza.KKS LIKE '%"+combo_kks+"%' ORDER BY Baza.KKS ");
        while(this->canFetchMore()){
            this->fetchMore();
        }
        db.commit();
        if(!db.commit()){
        db.rollback();
        }
    }

    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
}

// Получение id из строки в модели представления данных
int ListModelKKS::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelCeh::ListModelCeh
/// \param parent
///
ListModelCeh::ListModelCeh(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelCeh::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelCeh::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[ceh_nameRole] = "Cehname";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelCeh::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT Ceh.id, " ceh_name " FROM " ceh " ORDER BY " ceh_name );
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelCeh::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelProgram::ListModelProgram
/// \param parent
///
ListModelProgram::ListModelProgram(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelProgram::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelProgram::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[bazaprogram_nomerRole] = "Programnomer";
    roles[bazaprogram_nameRole] = "Programname";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelProgram::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT BazaProgram.id, " bazaprogram_nomer ", BazaProgram.'Название_программы' FROM " bazaprogram " ORDER BY " bazaprogram_nomer );
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelProgram::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelFio::ListModelFio
/// \param parent
///
ListModelFio::ListModelFio(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelFio::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelFio::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[fio_fioRole] = "Fiofio";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelFio::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT FIO.id, " fio_fio " FROM " fio " ORDER BY " fio_fio );
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelFio::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelProizved::ListModelProizved
/// \param parent
///
ListModelProizved::ListModelProizved(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelProizved::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelProizved::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[proizved_nameRole] = "Proizvedname";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelProizved::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT ProizvodElPriv.id, " proizved_name " FROM " proizved " ORDER BY " proizved_name );
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelProizved::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelTippermeh::ListModelTippermeh
/// \param parent
///
ListModelTippermeh::ListModelTippermeh(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelTippermeh::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelTippermeh::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[tippermeh_nameRole] = "Tippermehname";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelTippermeh::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT TipPeredatochnogoMehanizma.id, " tippermeh_name " FROM " tippermeh);
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelTippermeh::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelTipper::ListModelTipper
/// \param parent
///
ListModelTipper::ListModelTipper(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelTipper::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelTipper::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[tipper_nameRole] = "Tippername";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelTipper::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT TipPeredachi.id, " tipper_name " FROM " tipper);
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelTipper::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelTipmeh::ListModelTipmeh
/// \param parent
///
ListModelTipmeh::ListModelTipmeh(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelTipmeh::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelTipmeh::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[tipmeh_nameRole] = "Tipmehname";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelTipmeh::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT TipMehanizma.id, " tipmeh_name " FROM " tipmeh " ORDER BY " tipmeh_name );
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelTipmeh::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelPolozhenie::ListModelPolozhenie
/// \param parent
///
ListModelPolozhenie::ListModelPolozhenie(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelPolozhenie::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelPolozhenie::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[polozhenie_nameRole] = "Polozheniename";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelPolozhenie::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT Polozhenie.id, " polozhenie_name " FROM " polozhenie " ORDER BY " polozhenie_name );
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelPolozhenie::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelPolozhenie::ListModelPolozhenie
/// \param parent
///
ListModelTipopory::ListModelTipopory(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelTipopory::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelTipopory::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[tipopory_nameRole] = "Tipoporyname";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelTipopory::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT TipOpory.id, " tipopory_name " FROM " tipopory " ORDER BY " tipopory_name );
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelTipopory::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelTipopory::ListModelTipopory
/// \param parent
///
ListModelProizvmeh::ListModelProizvmeh(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelProizvmeh::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelProizvmeh::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[proizvmeh_nameRole] = "Proizvmehname";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelProizvmeh::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT ProizvodIspMeh.id, " proizvmeh_name " FROM " proizvmeh " ORDER BY " proizvmeh_name );
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelProizvmeh::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelNormhh::ListModelNormhh
/// \param parent
///
ListModelNormhh::ListModelNormhh(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelNormhh::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelNormhh::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[normhh_znRole] = "Normhhzn";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelNormhh::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT NormHh.id, " normhh_zn " FROM " normhh " ORDER BY " normhh_zn );
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelNormhh::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelNormnomed::ListModelNormnomed
/// \param parent
///
ListModelNormnomed::ListModelNormnomed(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelNormnomed::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelNormnomed::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[normnomed_znRole] = "Normnomedzn";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelNormnomed::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT NormNomED.id, " normnomed_zn " FROM " normnomed " ORDER BY " normnomed_zn );
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelNormnomed::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelNormnom::ListModelNormnom
/// \param parent
///
ListModelNormnom::ListModelNormnom(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelNormnom::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelNormnom::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[normnom_znRole] = "Normnomzn";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelNormnom::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT NormNom.id, " normnom_zn " FROM " normnom " ORDER BY " normnom_zn );
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelNormnom::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelOgrnomed::ListModelOgrnomed
/// \param parent
///
ListModelOgrnomed::ListModelOgrnomed(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelOgrnomed::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelOgrnomed::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[ogrnomed_znRole] = "Ogrnomedzn";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelOgrnomed::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT OgrNomED.id, " ogrnomed_zn " FROM " ogrnomed " ORDER BY " ogrnomed_zn );
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelOgrnomed::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelOgrnom::ListModelOgrnom
/// \param parent
///
ListModelOgrnom::ListModelOgrnom(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelOgrnom::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelOgrnom::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[ogrnom_znRole] = "Ogrnomzn";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelOgrnom::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT OgrNom.id, " ogrnom_zn " FROM " ogrnom " ORDER BY " ogrnom_zn );
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelOgrnom::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelOtkaznomed::ListModelOtkaznomed
/// \param parent
///
ListModelOtkaznomed::ListModelOtkaznomed(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelOtkaznomed::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelOtkaznomed::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[otkaznomed_znRole] = "Otkaznomedzn";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelOtkaznomed::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT OtkazNomED.id, " otkaznomed_zn " FROM " otkaznomed " ORDER BY " otkaznomed_zn );
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelOtkaznomed::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelOtkaznom::ListModelOtkaznom
/// \param parent
///
ListModelOtkaznom::ListModelOtkaznom(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelOtkaznom::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelOtkaznom::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[otkaznom_znRole] = "Otkaznomzn";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelOtkaznom::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT OtkazNom.id, " otkaznom_zn " FROM " otkaznom " ORDER BY " otkaznom_zn );
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelOtkaznom::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelNormrded::ListModelNormrded
/// \param parent
///
ListModelNormrded::ListModelNormrded(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelNormrded::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelNormrded::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[normrded_znRole] = "Normrdedzn";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelNormrded::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT NormRdED.id, " normrded_zn " FROM " normrded " ORDER BY " normrded_zn );
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelNormrded::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelNormrd::ListModelNormrd
/// \param parent
///
ListModelNormrd::ListModelNormrd(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelNormrd::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelNormrd::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[normrd_znRole] = "Normrdzn";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelNormrd::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT NormRd.id, " normrd_zn " FROM " normrd " ORDER BY " normrd_zn );
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelNormrd::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelOgrrded::ListModelOgrrded
/// \param parent
///
ListModelOgrrded::ListModelOgrrded(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelOgrrded::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelOgrrded::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[ogrrded_znRole] = "Ogrrdedzn";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelOgrrded::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT OgrRdED.id, " ogrrded_zn " FROM " ogrrded " ORDER BY " ogrrded_zn );
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelOgrrded::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelOgrrd::ListModelOgrrd
/// \param parent
///
ListModelOgrrd::ListModelOgrrd(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelOgrrd::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelOgrrd::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[ogrrd_znRole] = "Ogrrdzn";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelOgrrd::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT OgrRd.id, " ogrrd_zn " FROM " ogrrd " ORDER BY " ogrrd_zn );
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelOgrrd::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelOtkazrded::ListModelOtkazrded
/// \param parent
///
ListModelOtkazrded::ListModelOtkazrded(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelOtkazrded::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelOtkazrded::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[otkazrded_znRole] = "Otkazrdedzn";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelOtkazrded::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT OtkazRdED.id, " otkazrded_zn " FROM " otkazrded " ORDER BY " otkazrded_zn );
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelOtkazrded::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelOtkazrd::ListModelOtkazrd
/// \param parent
///
ListModelOtkazrd::ListModelOtkazrd(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelOtkazrd::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelOtkazrd::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[otkazrd_znRole] = "Otkazrdzn";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelOtkazrd::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT OtkazRd.id, " otkazrd_zn " FROM " otkazrd " ORDER BY " otkazrd_zn );
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelOtkazrd::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelOpenBO::ListModelOpenBO
/// \param parent
///
ListModelOpenBO::ListModelOpenBO(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelOpenBO::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelOpenBO::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[baza_kksRole] = "Bazakks";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelOpenBO::updateModel()
{
    //QString kks_id;
    QObject* stack = this->parent()->findChild<QObject*>("stackView");
    //qDebug() << stack->property("baza_id");
    QString kks_id=(stack->property("baza_id")).toString();
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    //this->setQuery(" SELECT Baza.id, Baza.KKS FROM Baza WHERE Baza.id = "+kks_id+" ");
    this->setQuery(" SELECT Baza.id, Baza.KKS, (SELECT Ceh.Наименование FROM Ceh WHERE Ceh.id = Baza.id_Ceh), Baza.Здание, Baza.Помещение, Baza.'Описание системы',"
                   "Baza.КБ, (SELECT BazaProgram.№КАТЭ FROM BazaProgram WHERE BazaProgram.id = Baza.id_BazaProgram), "
                   "(SELECT FIO.ФИО FROM FIO WHERE FIO.id = Baza.id_FIO), Baza.'Примечания к агрегату', Baza.Фото_filename, Baza.Shema_filename, Baza.'Марка эл/дв',"
                   "Baza.Мощность, Baza.Частота1, (SELECT ProizvodElPriv.Наименование FROM ProizvodElPriv WHERE ProizvodElPriv.id = Baza.id_ProizvodElPriv),"
                   "(SELECT TipPeredatochnogoMehanizma.Наименование FROM TipPeredatochnogoMehanizma WHERE TipPeredatochnogoMehanizma.id = Baza.id_TipPeredatochnogoMehanizma),"
                   "(SELECT TipPeredachi.Наименование FROM TipPeredachi WHERE TipPeredachi.id = Baza.id_TipPeredachi),"
                   "Baza.'Количество пальцев', (SELECT TipMehanizma.Наименование FROM TipMehanizma WHERE TipMehanizma.id = Baza.id_TipMehanizma),"
                   "Baza.'Марка механизма', Baza.Частота3, Baza.'Количество лопастей',"
                   "(SELECT Polozhenie.Наименование FROM Polozhenie WHERE Polozhenie.id = Baza.id_Polozhenie),"
                   "(SELECT TipOpory.Наименование FROM TipOpory WHERE TipOpory.id = Baza.id_TipOpory),"
                   "(SELECT ProizvodIspMeh.Наименование FROM ProizvodIspMeh WHERE ProizvodIspMeh.id = Baza.id_ProizvodIspMeh),"
                   "Baza.'Давление ном', Baza.'Давление р/д', Baza.'Расход ном', Baza.'Расход р/д', "
                   "(SELECT NormHh.Значение FROM NormHh WHERE NormHh.id = Baza.id_NormHh), "
                   "(SELECT NormNomED.Значение FROM NormNomED WHERE NormNomED.id = Baza.id_NormNomED), "
                   "(SELECT NormNom.Значение FROM NormNom WHERE NormNom.id = Baza.id_NormNom), "
                   "(SELECT OgrNomED.Значение FROM OgrNomED WHERE OgrNomED.id = Baza.id_OgrNomED), "
                   "(SELECT OgrNom.Значение FROM OgrNom WHERE OgrNom.id = Baza.id_OgrNom), "
                   "(SELECT OtkazNomED.Значение FROM OtkazNomED WHERE OtkazNomED.id = Baza.id_OtkazNomED), "
                   "(SELECT OtkazNom.Значение FROM OtkazNom WHERE OtkazNom.id = Baza.id_OtkazNom), "
                   "(SELECT NormRdED.Значение FROM NormRdED WHERE NormRdED.id = Baza.id_NormRdED), "
                   "(SELECT NormRd.Значение FROM NormRd WHERE NormRd.id = Baza.id_NormRd), "
                   "(SELECT OgrRdED.Значение FROM OgrRdED WHERE OgrRdED.id = Baza.id_OgrRdED), "
                   "(SELECT OgrRd.Значение FROM OgrRd WHERE OgrRd.id = Baza.id_OgrRd), "
                   "(SELECT OtkazRdED.Значение FROM OtkazRdED WHERE OtkazRdED.id = Baza.id_OtkazRdED), "
                   "(SELECT OtkazRd.Значение FROM OtkazRd WHERE OtkazRd.id = Baza.id_OtkazRd),"
                   "Baza.TotkazED, Baza.TotkazRed, Baza.TotkazIspMeh, Baza.'Документы на нормы', "
                   "Baza.'Параметры центровки и прилегания' FROM Baza WHERE Baza.id = " + kks_id);
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

//void ListModelOpenBO::updateModel2()
//{
//    //QString kks_id;
//    QObject* window = this->parent()->findChild<QObject*>("window");
//    QString kks_id=(window->property("baza_id")).toString();
//    qDebug() << kks_id;
//    // Обновление производится SQL-запросом к базе данных
//    this->setQuery(" SELECT Baza.id, Baza.KKS FROM Baza WHERE Baza.id = "+kks_id+" ");
//}

// Получение id из строки в модели представления данных
int ListModelOpenBO::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModel1V::ListModel1V
/// \param parent
///
ListModel1V::ListModel1V(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModel1V::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModel1V::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[bazaizm_1vRole] = "bazaizm1v";
    roles[bazaizm_dataRole] = "bazaizmdata";
    roles[bazaizm_naprRole] = "bazaizmnapr";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModel1V::updateModel()
{
    QObject* stack = this->parent()->findChild<QObject*>("stackView");
    QString kks_id=(stack->property("baza_id")).toString();
    QString rezhim_id=(stack->property("rezhim_id")).toString();
    QString rezhim_filter = " and BazaIzmereni.id_Rezhim = " + rezhim_id;

    if(rezhim_id == ""){
        rezhim_filter = "";
    }
    qDebug() << rezhim_id;
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    QSqlQuery query1V;
    QString select1V = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'1В' is not null" + rezhim_filter);

    if (!query1V.exec(select1V)){
        qDebug() << "ошибка: " << query1V.lastError().text();
    }
            query1V.next();
    if(query1V.value(0)==0){
        select1V = "";
    } else {
        select1V = " SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'1В', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '1В', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query1P;
    QString select1P = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'1П' is not null" + rezhim_filter);

    if (!query1P.exec(select1P))
        qDebug() << "error: " << query1P.lastError().text();
            query1P.next();
    if(query1P.value(0)==0){
        select1P = "";
    } else {
        select1P = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'1П', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '1П', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query1O;
    QString select1O = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'1О' is not null" + rezhim_filter);

    if (!query1O.exec(select1O))
        qDebug() << "error: " << query1O.lastError().text();
            query1O.next();
    if(query1O.value(0)==0){
        select1O = "";
    } else {
        select1O = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'1О', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '1О', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query2V;
    QString select2V = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'2В' is not null" + rezhim_filter);

    if (!query2V.exec(select2V))
        qDebug() << "error: " << query2V.lastError().text();
            query2V.next();
    if(query2V.value(0)==0){
        select2V = "";
    } else {
        select2V = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'2В', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '2В', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query2P;
    QString select2P = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'2П' is not null" + rezhim_filter);

    if (!query2P.exec(select2P))
        qDebug() << "error: " << query2P.lastError().text();
            query2P.next();
    if(query2P.value(0)==0){
        select2P = "";
    } else {
        select2P = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'2П', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '2П', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query2O;
    QString select2O = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'2О' is not null" + rezhim_filter);

    if (!query2O.exec(select2O))
        qDebug() << "error: " << query2O.lastError().text();
            query2O.next();
    if(query2O.value(0)==0){
        select2O = "";
    } else {
        select2O = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'2О', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '2О', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query3V;
    QString select3V = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'3В' is not null" + rezhim_filter);

    if (!query3V.exec(select3V))
        qDebug() << "error: " << query3V.lastError().text();
            query3V.next();
    if(query3V.value(0)==0){
        select3V = "";
    } else {
        select3V = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'3В', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '3В', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query3P;
    QString select3P = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'3П' is not null" + rezhim_filter);

    if (!query3P.exec(select3P))
        qDebug() << "error: " << query3P.lastError().text();
            query3P.next();
    if(query3P.value(0)==0){
        select3P = "";
    } else {
        select3P = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'3П', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '3П', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query3O;
    QString select3O = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'3О' is not null" + rezhim_filter);

    if (!query3O.exec(select3O))
        qDebug() << "error: " << query3O.lastError().text();
            query3O.next();
    if(query3O.value(0)==0){
        select3O = "";
    } else {
        select3O = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'3О', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '3О', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query4V;
    QString select4V = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'4В' is not null" + rezhim_filter);

    if (!query4V.exec(select4V))
        qDebug() << "error: " << query4V.lastError().text();
            query4V.next();
    if(query4V.value(0)==0){
        select4V = "";
    } else {
        select4V = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'4В', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '4В', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query4P;
    QString select4P = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'4П' is not null" + rezhim_filter);

    if (!query4P.exec(select4P))
        qDebug() << "error: " << query4P.lastError().text();
            query4P.next();
    if(query4P.value(0)==0){
        select4P = "";
    } else {
        select4P = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'4П', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '4П', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query4O;
    QString select4O = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'4О' is not null" + rezhim_filter);

    if (!query4O.exec(select4O))
        qDebug() << "error: " << query4O.lastError().text();
            query4O.next();
    if(query4O.value(0)==0){
        select4O = "";
    } else {
        select4O = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'4О', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '4О', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query5V;
    QString select5V = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'5В' is not null" + rezhim_filter);

    if (!query5V.exec(select5V))
        qDebug() << "error: " << query5V.lastError().text();
            query5V.next();
    if(query5V.value(0)==0){
        select5V = "";
    } else {
        select5V = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'5В', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '5В', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query5P;
    QString select5P = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'5П' is not null" + rezhim_filter);

    if (!query5P.exec(select5P))
        qDebug() << "error: " << query5P.lastError().text();
            query5P.next();
    if(query5P.value(0)==0){
        select5P = "";
    } else {
        select5P = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'5П', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '5П', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query5O;
    QString select5O = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'5О' is not null" + rezhim_filter);

    if (!query5O.exec(select5O))
        qDebug() << "error: " << query5O.lastError().text();
            query5O.next();
    if(query5O.value(0)==0){
        select5O = "";
    } else {
        select5O = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'5О', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '5О', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query6V;
    QString select6V = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'6В' is not null" + rezhim_filter);

    if (!query6V.exec(select6V))
        qDebug() << "error: " << query6V.lastError().text();
            query6V.next();
    if(query6V.value(0)==0){
        select6V = "";
    } else {
        select6V = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'6В', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '6В', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query6P;
    QString select6P = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'6П' is not null" + rezhim_filter);

    if (!query6P.exec(select6P))
        qDebug() << "error: " << query6P.lastError().text();
            query6P.next();
    if(query6P.value(0)==0){
        select6P = "";
    } else {
        select6P = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'6П', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '6П', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query6O;
    QString select6O = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'6О' is not null" + rezhim_filter);

    if (!query6O.exec(select6O))
        qDebug() << "error: " << query6O.lastError().text();
            query6O.next();
    if(query6O.value(0)==0){
        select6O = "";
    } else {
        select6O = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'6О', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '6О', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query7V;
    QString select7V = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'7В' is not null" + rezhim_filter);

    if (!query7V.exec(select7V))
        qDebug() << "error: " << query7V.lastError().text();
            query7V.next();
    if(query7V.value(0)==0){
        select7V = "";
    } else {
        select7V = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'7В', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '7В', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query7P;
    QString select7P = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'7П' is not null" + rezhim_filter);

    if (!query7P.exec(select7P))
        qDebug() << "error: " << query7P.lastError().text();
            query7P.next();
    if(query7P.value(0)==0){
        select7P = "";
    } else {
        select7P = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'7П', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '7П', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query7O;
    QString select7O = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'7О' is not null" + rezhim_filter);

    if (!query7O.exec(select7O))
        qDebug() << "error: " << query7O.lastError().text();
            query7O.next();
    if(query7O.value(0)==0){
        select7O = "";
    } else {
        select7O = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'7О', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '7О', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query8V;
    QString select8V = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'8В' is not null" + rezhim_filter);

    if (!query8V.exec(select8V))
        qDebug() << "error: " << query8V.lastError().text();
            query8V.next();
    if(query8V.value(0)==0){
        select8V = "";
    } else {
        select8V = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'8В', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '8В', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query8P;
    QString select8P = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'8П' is not null" + rezhim_filter);

    if (!query8P.exec(select8P))
        qDebug() << "error: " << query8P.lastError().text();
            query8P.next();
    if(query8P.value(0)==0){
        select8P = "";
    } else {
        select8P = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'8П', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '8П', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
    QSqlQuery query8O;
    QString select8O = QString ("SELECT COUNT(BazaIzmereni.id) FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + " and BazaIzmereni.'8О' is not null" + rezhim_filter);

    if (!query8O.exec(select8O))
        qDebug() << "error: " << query8O.lastError().text();
            query8O.next();
    if(query8O.value(0)==0){
        select8O = "";
    } else {
        select8O = " UNION ALL SELECT BazaIzmereni.id, IFNULL(BazaIzmereni.'8О', 0), strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), '8О', BazaIzmereni.Дата, BazaIzmereni.'Время' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter;
    };
//    QSqlQuery qry;
//    QSqlDatabase db = QSqlDatabase::database();
//    db.transaction();
//    qry.prepare(select1V + select1P + select1O + select2V + select2P + select2O + select3V + select3P + select3O +
//                select4V + select4P + select4O + select5V + select5P + select5O + select6V + select6P +
//                select6O + select7V + select7P + select7O + select8V + select8P + select8O + " order by 5 asc, 6 asc");
//    qry.exec();
    //this->qry();

    //qDebug() << "Number of Rows: " << qry.size();
    //qDebug() << "Number of columns: " << qry.record().count();
    //Обновление производится SQL-запросом к базе данных

    this->setQuery(select1V + select1P + select1O + select2V + select2P + select2O + select3V + select3P + select3O +
                   select4V + select4P + select4O + select5V + select5P + select5O + select6V + select6P +
                   select6O + select7V + select7P + select7O + select8V + select8P + select8O + " order by 5 asc, 6 asc");
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}


// Получение id из строки в модели представления данных
int ListModel1V::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelRezhim::ListModelRezhim
/// \param parent
///
ListModelRezhim::ListModelRezhim(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelRezhim::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelRezhim::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[rezhim_nameRole] = "Rezhimname";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelRezhim::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT Rezhim.id, Rezhim.Наименование FROM Rezhim ORDER BY Rezhim.id");
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelRezhim::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelMaxLevel::ListModelMaxLevel
/// \param parent
///
ListModelMaxLevel::ListModelMaxLevel(QObject *parent) :
    QObject(parent)
{
    this->updateModel();
}



// Метод обновления таблицы в модели представления данных
void ListModelMaxLevel::updateModel()
{
    QObject* stack = this->parent()->findChild<QObject*>("stackView");
    QString kks_id=(stack->property("baza_id")).toString();
    QString rezhim_id=(stack->property("rezhim_id")).toString();
    QString bazaizm_id=(stack->property("bazaizm_id")).toString();
    QString rezhim_filter = " and BazaIzmereni.id_Rezhim = " + rezhim_id;
    if(rezhim_id == ""){
        rezhim_filter = "";
    }
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    QSqlQuery query1v(" SELECT MAX(BazaIzmereni.'1В') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query1p(" SELECT MAX(BazaIzmereni.'1П') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query1o(" SELECT MAX(BazaIzmereni.'1О') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query2v(" SELECT MAX(BazaIzmereni.'2В') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query2p(" SELECT MAX(BazaIzmereni.'2П') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query2o(" SELECT MAX(BazaIzmereni.'2О') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query3v(" SELECT MAX(BazaIzmereni.'3В') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query3p(" SELECT MAX(BazaIzmereni.'3П') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query3o(" SELECT MAX(BazaIzmereni.'3О') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query4v(" SELECT MAX(BazaIzmereni.'4В') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query4p(" SELECT MAX(BazaIzmereni.'4П') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query4o(" SELECT MAX(BazaIzmereni.'4О') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query5v(" SELECT MAX(BazaIzmereni.'5В') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query5p(" SELECT MAX(BazaIzmereni.'5П') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query5o(" SELECT MAX(BazaIzmereni.'5О') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query6v(" SELECT MAX(BazaIzmereni.'6В') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query6p(" SELECT MAX(BazaIzmereni.'6П') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query6o(" SELECT MAX(BazaIzmereni.'6О') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query7v(" SELECT MAX(BazaIzmereni.'7В') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query7p(" SELECT MAX(BazaIzmereni.'7П') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query7o(" SELECT MAX(BazaIzmereni.'7О') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query8v(" SELECT MAX(BazaIzmereni.'8В') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query8p(" SELECT MAX(BazaIzmereni.'8П') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query8o(" SELECT MAX(BazaIzmereni.'8О') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    query1v.next();
    query1p.next();
    query1o.next();
    query2v.next();
    query2p.next();
    query2o.next();
    query3v.next();
    query3p.next();
    query3o.next();
    query4v.next();
    query4p.next();
    query4o.next();
    query5v.next();
    query5p.next();
    query5o.next();
    query6v.next();
    query6p.next();
    query6o.next();
    query7v.next();
    query7p.next();
    query7o.next();
    query8v.next();
    query8p.next();
    query8o.next();
    double max = query1v.value(0).toDouble();
    if(query1p.value(0).toDouble()>max){
        max = query1p.value(0).toDouble();
    }
    if(query1o.value(0).toDouble()>max){
        max = query1o.value(0).toDouble();
    }
    if(query2v.value(0).toDouble()>max){
        max = query2v.value(0).toDouble();
    }
    if(query2p.value(0).toDouble()>max){
        max = query2p.value(0).toDouble();
    }
    if(query2o.value(0).toDouble()>max){
        max = query2o.value(0).toDouble();
    }
    if(query3v.value(0).toDouble()>max){
        max = query3v.value(0).toDouble();
    }
    if(query3p.value(0).toDouble()>max){
        max = query3p.value(0).toDouble();
    }
    if(query3o.value(0).toDouble()>max){
        max = query3o.value(0).toDouble();
    }
    if(query4v.value(0).toDouble()>max){
        max = query4v.value(0).toDouble();
    }
    if(query4p.value(0).toDouble()>max){
        max = query4p.value(0).toDouble();
    }
    if(query4o.value(0).toDouble()>max){
        max = query4o.value(0).toDouble();
    }
    if(query5v.value(0).toDouble()>max){
        max = query5v.value(0).toDouble();
    }
    if(query5p.value(0).toDouble()>max){
        max = query5p.value(0).toDouble();
    }
    if(query5o.value(0).toDouble()>max){
        max = query5o.value(0).toDouble();
    }
    if(query6v.value(0).toDouble()>max){
        max = query6v.value(0).toDouble();
    }
    if(query6p.value(0).toDouble()>max){
        max = query6p.value(0).toDouble();
    }
    if(query6o.value(0).toDouble()>max){
        max = query6o.value(0).toDouble();
    }
    if(query7v.value(0).toDouble()>max){
        max = query7v.value(0).toDouble();
    }
    if(query7p.value(0).toDouble()>max){
        max = query7p.value(0).toDouble();
    }
    if(query7o.value(0).toDouble()>max){
        max = query7o.value(0).toDouble();
    }
    if(query8v.value(0).toDouble()>max){
        max = query8v.value(0).toDouble();
    }
    if(query8p.value(0).toDouble()>max){
        max = query8p.value(0).toDouble();
    }
    if(query8o.value(0).toDouble()>max){
        max = query8o.value(0).toDouble();
    }
    QString maxlevel = QString::number(max);
    db.commit();
    if(!db.commit()){
    db.rollback();
    }

    stack->setProperty("maxlevel", maxlevel);

}
void ListModelMaxLevel::updateModel2()
{
    QObject* stack = this->parent()->findChild<QObject*>("stackView");
    QString kks_id=(stack->property("baza_id")).toString();
    QString rezhim_id=(stack->property("rezhim_id")).toString();
    QString bazaizm_id=(stack->property("bazaizm_id")).toString();
    QString rezhim_filter = " and BazaIzmereni.id_Rezhim = " + rezhim_id;
    if(rezhim_id == ""){
        rezhim_filter = "";
    }
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    QSqlQuery query1v0(" SELECT BazaIzmereni.'1В' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query1p0(" SELECT BazaIzmereni.'1П' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query1o0(" SELECT BazaIzmereni.'1О' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query2v0(" SELECT BazaIzmereni.'2В' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query2p0(" SELECT BazaIzmereni.'2П' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query2o0(" SELECT BazaIzmereni.'2О' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query3v0(" SELECT BazaIzmereni.'3В' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query3p0(" SELECT BazaIzmereni.'3П' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query3o0(" SELECT BazaIzmereni.'3О' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query4v0(" SELECT BazaIzmereni.'4В' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query4p0(" SELECT BazaIzmereni.'4П' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query4o0(" SELECT BazaIzmereni.'4О' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query5v0(" SELECT BazaIzmereni.'5В' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query5p0(" SELECT BazaIzmereni.'5П' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query5o0(" SELECT BazaIzmereni.'5О' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query6v0(" SELECT BazaIzmereni.'6В' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query6p0(" SELECT BazaIzmereni.'6П' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query6o0(" SELECT BazaIzmereni.'6О' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query7v0(" SELECT BazaIzmereni.'7В' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query7p0(" SELECT BazaIzmereni.'7П' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query7o0(" SELECT BazaIzmereni.'7О' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query8v0(" SELECT BazaIzmereni.'8В' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query8p0(" SELECT BazaIzmereni.'8П' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);
    QSqlQuery query8o0(" SELECT BazaIzmereni.'8О' FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter + " AND BazaIzmereni.id = " + bazaizm_id);

    QSqlQuery query1v(" SELECT MAX(BazaIzmereni.'1В') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query1p(" SELECT MAX(BazaIzmereni.'1П') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query1o(" SELECT MAX(BazaIzmereni.'1О') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query2v(" SELECT MAX(BazaIzmereni.'2В') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query2p(" SELECT MAX(BazaIzmereni.'2П') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query2o(" SELECT MAX(BazaIzmereni.'2О') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query3v(" SELECT MAX(BazaIzmereni.'3В') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query3p(" SELECT MAX(BazaIzmereni.'3П') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query3o(" SELECT MAX(BazaIzmereni.'3О') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query4v(" SELECT MAX(BazaIzmereni.'4В') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query4p(" SELECT MAX(BazaIzmereni.'4П') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query4o(" SELECT MAX(BazaIzmereni.'4О') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query5v(" SELECT MAX(BazaIzmereni.'5В') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query5p(" SELECT MAX(BazaIzmereni.'5П') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query5o(" SELECT MAX(BazaIzmereni.'5О') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query6v(" SELECT MAX(BazaIzmereni.'6В') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query6p(" SELECT MAX(BazaIzmereni.'6П') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query6o(" SELECT MAX(BazaIzmereni.'6О') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query7v(" SELECT MAX(BazaIzmereni.'7В') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query7p(" SELECT MAX(BazaIzmereni.'7П') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query7o(" SELECT MAX(BazaIzmereni.'7О') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query8v(" SELECT MAX(BazaIzmereni.'8В') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query8p(" SELECT MAX(BazaIzmereni.'8П') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);
    QSqlQuery query8o(" SELECT MAX(BazaIzmereni.'8О') FROM BazaIzmereni WHERE BazaIzmereni.id_Baza = " + kks_id + rezhim_filter);

    query1v0.next();
    query1p0.next();
    query1o0.next();
    query2v0.next();
    query2p0.next();
    query2o0.next();
    query3v0.next();
    query3p0.next();
    query3o0.next();
    query4v0.next();
    query4p0.next();
    query4o0.next();
    query5v0.next();
    query5p0.next();
    query5o0.next();
    query6v0.next();
    query6p0.next();
    query6o0.next();
    query7v0.next();
    query7p0.next();
    query7o0.next();
    query8v0.next();
    query8p0.next();
    query8o0.next();

    query1v.next();
    query1p.next();
    query1o.next();
    query2v.next();
    query2p.next();
    query2o.next();
    query3v.next();
    query3p.next();
    query3o.next();
    query4v.next();
    query4p.next();
    query4o.next();
    query5v.next();
    query5p.next();
    query5o.next();
    query6v.next();
    query6p.next();
    query6o.next();
    query7v.next();
    query7p.next();
    query7o.next();
    query8v.next();
    query8p.next();
    query8o.next();
    double max0 = query1v0.value(0).toDouble();
    qDebug() << "izm_id = " << bazaizm_id;

    int col_max = 0;
    if(query1p0.value(0).toDouble()>max0){
        max0 = query1p0.value(0).toDouble();
        col_max = 1;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
    }
    if(query1o0.value(0).toDouble()>max0){
        max0 = query1o0.value(0).toDouble();
        col_max = 2;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
        if(query1p.value(0).toString() == ""){col_max -= 1;}
    }
    if(query2v0.value(0).toDouble()>max0){
        max0 = query2v0.value(0).toDouble();
        col_max = 3;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
        if(query1p.value(0).toString() == ""){col_max -= 1;}
        if(query1o.value(0).toString() == ""){col_max -= 1;}
    }
    if(query2p0.value(0).toDouble()>max0){
        max0 = query2p0.value(0).toDouble();
        col_max = 4;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
        if(query1p.value(0).toString() == ""){col_max -= 1;}
        if(query1o.value(0).toString() == ""){col_max -= 1;}
        if(query2v.value(0).toString() == ""){col_max -= 1;}
    }
    if(query2o0.value(0).toDouble()>max0){
        max0 = query2o0.value(0).toDouble();
        col_max = 5;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
        if(query1p.value(0).toString() == ""){col_max -= 1;}
        if(query1o.value(0).toString() == ""){col_max -= 1;}
        if(query2v.value(0).toString() == ""){col_max -= 1;}
        if(query2p.value(0).toString() == ""){col_max -= 1;}
    }
    if(query3v0.value(0).toDouble()>max0){
        max0 = query3v0.value(0).toDouble();
        col_max = 6;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
        if(query1p.value(0).toString() == ""){col_max -= 1;}
        if(query1o.value(0).toString() == ""){col_max -= 1;}
        if(query2v.value(0).toString() == ""){col_max -= 1;}
        if(query2p.value(0).toString() == ""){col_max -= 1;}
        if(query2o.value(0).toString() == ""){col_max -= 1;}
    }
    if(query3p0.value(0).toDouble()>max0){
        max0 = query3p0.value(0).toDouble();
        col_max = 7;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
        if(query1p.value(0).toString() == ""){col_max -= 1;}
        if(query1o.value(0).toString() == ""){col_max -= 1;}
        if(query2v.value(0).toString() == ""){col_max -= 1;}
        if(query2p.value(0).toString() == ""){col_max -= 1;}
        if(query2o.value(0).toString() == ""){col_max -= 1;}
        if(query3v.value(0).toString() == ""){col_max -= 1;}
    }
    if(query3o0.value(0).toDouble()>max0){
        max0 = query3o0.value(0).toDouble();
        col_max = 8;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
        if(query1p.value(0).toString() == ""){col_max -= 1;}
        if(query1o.value(0).toString() == ""){col_max -= 1;}
        if(query2v.value(0).toString() == ""){col_max -= 1;}
        if(query2p.value(0).toString() == ""){col_max -= 1;}
        if(query2o.value(0).toString() == ""){col_max -= 1;}
        if(query3v.value(0).toString() == ""){col_max -= 1;}
        if(query3p.value(0).toString() == ""){col_max -= 1;}
        qDebug() << "query1v = " << query1v.value(0).toString();
        qDebug() << "query1p = " << query1p.value(0).toString();
        qDebug() << "query1o = " << query1o.value(0).toString();
        qDebug() << "query2v = " << query2v.value(0).toString();
        qDebug() << "query2p = " << query2p.value(0).toString();
        qDebug() << "query2o = " << query2o.value(0).toString();
        qDebug() << "query3v = " << query3v.value(0).toString();
        qDebug() << "query3p = " << query3p.value(0).toString();
    }
    if(query4v0.value(0).toDouble()>max0){
        max0 = query4v0.value(0).toDouble();
        col_max = 9;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
        if(query1p.value(0).toString() == ""){col_max -= 1;}
        if(query1o.value(0).toString() == ""){col_max -= 1;}
        if(query2v.value(0).toString() == ""){col_max -= 1;}
        if(query2p.value(0).toString() == ""){col_max -= 1;}
        if(query2o.value(0).toString() == ""){col_max -= 1;}
        if(query3v.value(0).toString() == ""){col_max -= 1;}
        if(query3p.value(0).toString() == ""){col_max -= 1;}
        if(query3o.value(0).toString() == ""){col_max -= 1;}
    }
    if(query4p0.value(0).toDouble()>max0){
        max0 = query4p0.value(0).toDouble();
        col_max = 10;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
        if(query1p.value(0).toString() == ""){col_max -= 1;}
        if(query1o.value(0).toString() == ""){col_max -= 1;}
        if(query2v.value(0).toString() == ""){col_max -= 1;}
        if(query2p.value(0).toString() == ""){col_max -= 1;}
        if(query2o.value(0).toString() == ""){col_max -= 1;}
        if(query3v.value(0).toString() == ""){col_max -= 1;}
        if(query3p.value(0).toString() == ""){col_max -= 1;}
        if(query3o.value(0).toString() == ""){col_max -= 1;}
        if(query4v.value(0).toString() == ""){col_max -= 1;}
    }
    if(query4o0.value(0).toDouble()>max0){
        max0 = query4o0.value(0).toDouble();
        col_max = 11;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
        if(query1p.value(0).toString() == ""){col_max -= 1;}
        if(query1o.value(0).toString() == ""){col_max -= 1;}
        if(query2v.value(0).toString() == ""){col_max -= 1;}
        if(query2p.value(0).toString() == ""){col_max -= 1;}
        if(query2o.value(0).toString() == ""){col_max -= 1;}
        if(query3v.value(0).toString() == ""){col_max -= 1;}
        if(query3p.value(0).toString() == ""){col_max -= 1;}
        if(query3o.value(0).toString() == ""){col_max -= 1;}
        if(query4v.value(0).toString() == ""){col_max -= 1;}
        if(query4p.value(0).toString() == ""){col_max -= 1;}
    }
    if(query5v0.value(0).toDouble()>max0){
        max0 = query5v0.value(0).toDouble();
        col_max = 12;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
        if(query1p.value(0).toString() == ""){col_max -= 1;}
        if(query1o.value(0).toString() == ""){col_max -= 1;}
        if(query2v.value(0).toString() == ""){col_max -= 1;}
        if(query2p.value(0).toString() == ""){col_max -= 1;}
        if(query2o.value(0).toString() == ""){col_max -= 1;}
        if(query3v.value(0).toString() == ""){col_max -= 1;}
        if(query3p.value(0).toString() == ""){col_max -= 1;}
        if(query3o.value(0).toString() == ""){col_max -= 1;}
        if(query4v.value(0).toString() == ""){col_max -= 1;}
        if(query4p.value(0).toString() == ""){col_max -= 1;}
        if(query4o.value(0).toString() == ""){col_max -= 1;}
    }
    if(query5p0.value(0).toDouble()>max0){
        max0 = query5p0.value(0).toDouble();
        col_max = 13;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
        if(query1p.value(0).toString() == ""){col_max -= 1;}
        if(query1o.value(0).toString() == ""){col_max -= 1;}
        if(query2v.value(0).toString() == ""){col_max -= 1;}
        if(query2p.value(0).toString() == ""){col_max -= 1;}
        if(query2o.value(0).toString() == ""){col_max -= 1;}
        if(query3v.value(0).toString() == ""){col_max -= 1;}
        if(query3p.value(0).toString() == ""){col_max -= 1;}
        if(query3o.value(0).toString() == ""){col_max -= 1;}
        if(query4v.value(0).toString() == ""){col_max -= 1;}
        if(query4p.value(0).toString() == ""){col_max -= 1;}
        if(query4o.value(0).toString() == ""){col_max -= 1;}
        if(query5v.value(0).toString() == ""){col_max -= 1;}
    }
    if(query5o0.value(0).toDouble()>max0){
        max0 = query5o0.value(0).toDouble();
        col_max = 14;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
        if(query1p.value(0).toString() == ""){col_max -= 1;}
        if(query1o.value(0).toString() == ""){col_max -= 1;}
        if(query2v.value(0).toString() == ""){col_max -= 1;}
        if(query2p.value(0).toString() == ""){col_max -= 1;}
        if(query2o.value(0).toString() == ""){col_max -= 1;}
        if(query3v.value(0).toString() == ""){col_max -= 1;}
        if(query3p.value(0).toString() == ""){col_max -= 1;}
        if(query3o.value(0).toString() == ""){col_max -= 1;}
        if(query4v.value(0).toString() == ""){col_max -= 1;}
        if(query4p.value(0).toString() == ""){col_max -= 1;}
        if(query4o.value(0).toString() == ""){col_max -= 1;}
        if(query5v.value(0).toString() == ""){col_max -= 1;}
        if(query5p.value(0).toString() == ""){col_max -= 1;}
    }
    if(query6v0.value(0).toDouble()>max0){
        max0 = query6v0.value(0).toDouble();
        col_max = 15;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
        if(query1p.value(0).toString() == ""){col_max -= 1;}
        if(query1o.value(0).toString() == ""){col_max -= 1;}
        if(query2v.value(0).toString() == ""){col_max -= 1;}
        if(query2p.value(0).toString() == ""){col_max -= 1;}
        if(query2o.value(0).toString() == ""){col_max -= 1;}
        if(query3v.value(0).toString() == ""){col_max -= 1;}
        if(query3p.value(0).toString() == ""){col_max -= 1;}
        if(query3o.value(0).toString() == ""){col_max -= 1;}
        if(query4v.value(0).toString() == ""){col_max -= 1;}
        if(query4p.value(0).toString() == ""){col_max -= 1;}
        if(query4o.value(0).toString() == ""){col_max -= 1;}
        if(query5v.value(0).toString() == ""){col_max -= 1;}
        if(query5p.value(0).toString() == ""){col_max -= 1;}
        if(query5o.value(0).toString() == ""){col_max -= 1;}
    }
    if(query6p0.value(0).toDouble()>max0){
        max0 = query6p0.value(0).toDouble();
        col_max = 16;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
        if(query1p.value(0).toString() == ""){col_max -= 1;}
        if(query1o.value(0).toString() == ""){col_max -= 1;}
        if(query2v.value(0).toString() == ""){col_max -= 1;}
        if(query2p.value(0).toString() == ""){col_max -= 1;}
        if(query2o.value(0).toString() == ""){col_max -= 1;}
        if(query3v.value(0).toString() == ""){col_max -= 1;}
        if(query3p.value(0).toString() == ""){col_max -= 1;}
        if(query3o.value(0).toString() == ""){col_max -= 1;}
        if(query4v.value(0).toString() == ""){col_max -= 1;}
        if(query4p.value(0).toString() == ""){col_max -= 1;}
        if(query4o.value(0).toString() == ""){col_max -= 1;}
        if(query5v.value(0).toString() == ""){col_max -= 1;}
        if(query5p.value(0).toString() == ""){col_max -= 1;}
        if(query5o.value(0).toString() == ""){col_max -= 1;}
        if(query6v.value(0).toString() == ""){col_max -= 1;}
    }
    if(query6o0.value(0).toDouble()>max0){
        max0 = query6o0.value(0).toDouble();
        col_max = 17;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
        if(query1p.value(0).toString() == ""){col_max -= 1;}
        if(query1o.value(0).toString() == ""){col_max -= 1;}
        if(query2v.value(0).toString() == ""){col_max -= 1;}
        if(query2p.value(0).toString() == ""){col_max -= 1;}
        if(query2o.value(0).toString() == ""){col_max -= 1;}
        if(query3v.value(0).toString() == ""){col_max -= 1;}
        if(query3p.value(0).toString() == ""){col_max -= 1;}
        if(query3o.value(0).toString() == ""){col_max -= 1;}
        if(query4v.value(0).toString() == ""){col_max -= 1;}
        if(query4p.value(0).toString() == ""){col_max -= 1;}
        if(query4o.value(0).toString() == ""){col_max -= 1;}
        if(query5v.value(0).toString() == ""){col_max -= 1;}
        if(query5p.value(0).toString() == ""){col_max -= 1;}
        if(query5o.value(0).toString() == ""){col_max -= 1;}
        if(query6v.value(0).toString() == ""){col_max -= 1;}
        if(query6p.value(0).toString() == ""){col_max -= 1;}
    }
    if(query7v0.value(0).toDouble()>max0){
        max0 = query7v0.value(0).toDouble();
        col_max = 18;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
        if(query1p.value(0).toString() == ""){col_max -= 1;}
        if(query1o.value(0).toString() == ""){col_max -= 1;}
        if(query2v.value(0).toString() == ""){col_max -= 1;}
        if(query2p.value(0).toString() == ""){col_max -= 1;}
        if(query2o.value(0).toString() == ""){col_max -= 1;}
        if(query3v.value(0).toString() == ""){col_max -= 1;}
        if(query3p.value(0).toString() == ""){col_max -= 1;}
        if(query3o.value(0).toString() == ""){col_max -= 1;}
        if(query4v.value(0).toString() == ""){col_max -= 1;}
        if(query4p.value(0).toString() == ""){col_max -= 1;}
        if(query4o.value(0).toString() == ""){col_max -= 1;}
        if(query5v.value(0).toString() == ""){col_max -= 1;}
        if(query5p.value(0).toString() == ""){col_max -= 1;}
        if(query5o.value(0).toString() == ""){col_max -= 1;}
        if(query6v.value(0).toString() == ""){col_max -= 1;}
        if(query6p.value(0).toString() == ""){col_max -= 1;}
        if(query6o.value(0).toString() == ""){col_max -= 1;}
    }
    if(query7p0.value(0).toDouble()>max0){
        max0 = query7p0.value(0).toDouble();
        col_max = 19;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
        if(query1p.value(0).toString() == ""){col_max -= 1;}
        if(query1o.value(0).toString() == ""){col_max -= 1;}
        if(query2v.value(0).toString() == ""){col_max -= 1;}
        if(query2p.value(0).toString() == ""){col_max -= 1;}
        if(query2o.value(0).toString() == ""){col_max -= 1;}
        if(query3v.value(0).toString() == ""){col_max -= 1;}
        if(query3p.value(0).toString() == ""){col_max -= 1;}
        if(query3o.value(0).toString() == ""){col_max -= 1;}
        if(query4v.value(0).toString() == ""){col_max -= 1;}
        if(query4p.value(0).toString() == ""){col_max -= 1;}
        if(query4o.value(0).toString() == ""){col_max -= 1;}
        if(query5v.value(0).toString() == ""){col_max -= 1;}
        if(query5p.value(0).toString() == ""){col_max -= 1;}
        if(query5o.value(0).toString() == ""){col_max -= 1;}
        if(query6v.value(0).toString() == ""){col_max -= 1;}
        if(query6p.value(0).toString() == ""){col_max -= 1;}
        if(query6o.value(0).toString() == ""){col_max -= 1;}
        if(query7v.value(0).toString() == ""){col_max -= 1;}
    }
    if(query7o0.value(0).toDouble()>max0){
        max0 = query7o0.value(0).toDouble();
        col_max = 20;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
        if(query1p.value(0).toString() == ""){col_max -= 1;}
        if(query1o.value(0).toString() == ""){col_max -= 1;}
        if(query2v.value(0).toString() == ""){col_max -= 1;}
        if(query2p.value(0).toString() == ""){col_max -= 1;}
        if(query2o.value(0).toString() == ""){col_max -= 1;}
        if(query3v.value(0).toString() == ""){col_max -= 1;}
        if(query3p.value(0).toString() == ""){col_max -= 1;}
        if(query3o.value(0).toString() == ""){col_max -= 1;}
        if(query4v.value(0).toString() == ""){col_max -= 1;}
        if(query4p.value(0).toString() == ""){col_max -= 1;}
        if(query4o.value(0).toString() == ""){col_max -= 1;}
        if(query5v.value(0).toString() == ""){col_max -= 1;}
        if(query5p.value(0).toString() == ""){col_max -= 1;}
        if(query5o.value(0).toString() == ""){col_max -= 1;}
        if(query6v.value(0).toString() == ""){col_max -= 1;}
        if(query6p.value(0).toString() == ""){col_max -= 1;}
        if(query6o.value(0).toString() == ""){col_max -= 1;}
        if(query7v.value(0).toString() == ""){col_max -= 1;}
        if(query7p.value(0).toString() == ""){col_max -= 1;}
    }
    if(query8v0.value(0).toDouble()>max0){
        max0 = query8v0.value(0).toDouble();
        col_max = 21;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
        if(query1p.value(0).toString() == ""){col_max -= 1;}
        if(query1o.value(0).toString() == ""){col_max -= 1;}
        if(query2v.value(0).toString() == ""){col_max -= 1;}
        if(query2p.value(0).toString() == ""){col_max -= 1;}
        if(query2o.value(0).toString() == ""){col_max -= 1;}
        if(query3v.value(0).toString() == ""){col_max -= 1;}
        if(query3p.value(0).toString() == ""){col_max -= 1;}
        if(query3o.value(0).toString() == ""){col_max -= 1;}
        if(query4v.value(0).toString() == ""){col_max -= 1;}
        if(query4p.value(0).toString() == ""){col_max -= 1;}
        if(query4o.value(0).toString() == ""){col_max -= 1;}
        if(query5v.value(0).toString() == ""){col_max -= 1;}
        if(query5p.value(0).toString() == ""){col_max -= 1;}
        if(query5o.value(0).toString() == ""){col_max -= 1;}
        if(query6v.value(0).toString() == ""){col_max -= 1;}
        if(query6p.value(0).toString() == ""){col_max -= 1;}
        if(query6o.value(0).toString() == ""){col_max -= 1;}
        if(query7v.value(0).toString() == ""){col_max -= 1;}
        if(query7p.value(0).toString() == ""){col_max -= 1;}
        if(query7o.value(0).toString() == ""){col_max -= 1;}
    }
    if(query8p0.value(0).toDouble()>max0){
        max0 = query8p0.value(0).toDouble();
        col_max = 22;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
        if(query1p.value(0).toString() == ""){col_max -= 1;}
        if(query1o.value(0).toString() == ""){col_max -= 1;}
        if(query2v.value(0).toString() == ""){col_max -= 1;}
        if(query2p.value(0).toString() == ""){col_max -= 1;}
        if(query2o.value(0).toString() == ""){col_max -= 1;}
        if(query3v.value(0).toString() == ""){col_max -= 1;}
        if(query3p.value(0).toString() == ""){col_max -= 1;}
        if(query3o.value(0).toString() == ""){col_max -= 1;}
        if(query4v.value(0).toString() == ""){col_max -= 1;}
        if(query4p.value(0).toString() == ""){col_max -= 1;}
        if(query4o.value(0).toString() == ""){col_max -= 1;}
        if(query5v.value(0).toString() == ""){col_max -= 1;}
        if(query5p.value(0).toString() == ""){col_max -= 1;}
        if(query5o.value(0).toString() == ""){col_max -= 1;}
        if(query6v.value(0).toString() == ""){col_max -= 1;}
        if(query6p.value(0).toString() == ""){col_max -= 1;}
        if(query6o.value(0).toString() == ""){col_max -= 1;}
        if(query7v.value(0).toString() == ""){col_max -= 1;}
        if(query7p.value(0).toString() == ""){col_max -= 1;}
        if(query7o.value(0).toString() == ""){col_max -= 1;}
        if(query8v.value(0).toString() == ""){col_max -= 1;}
    }
    if(query8o0.value(0).toDouble()>max0){
        max0 = query8o0.value(0).toDouble();
        col_max = 23;
        if(query1v.value(0).toString() == ""){col_max -= 1;}
        if(query1p.value(0).toString() == ""){col_max -= 1;}
        if(query1o.value(0).toString() == ""){col_max -= 1;}
        if(query2v.value(0).toString() == ""){col_max -= 1;}
        if(query2p.value(0).toString() == ""){col_max -= 1;}
        if(query2o.value(0).toString() == ""){col_max -= 1;}
        if(query3v.value(0).toString() == ""){col_max -= 1;}
        if(query3p.value(0).toString() == ""){col_max -= 1;}
        if(query3o.value(0).toString() == ""){col_max -= 1;}
        if(query4v.value(0).toString() == ""){col_max -= 1;}
        if(query4p.value(0).toString() == ""){col_max -= 1;}
        if(query4o.value(0).toString() == ""){col_max -= 1;}
        if(query5v.value(0).toString() == ""){col_max -= 1;}
        if(query5p.value(0).toString() == ""){col_max -= 1;}
        if(query5o.value(0).toString() == ""){col_max -= 1;}
        if(query6v.value(0).toString() == ""){col_max -= 1;}
        if(query6p.value(0).toString() == ""){col_max -= 1;}
        if(query6o.value(0).toString() == ""){col_max -= 1;}
        if(query7v.value(0).toString() == ""){col_max -= 1;}
        if(query7p.value(0).toString() == ""){col_max -= 1;}
        if(query7o.value(0).toString() == ""){col_max -= 1;}
        if(query8v.value(0).toString() == ""){col_max -= 1;}
        if(query8p.value(0).toString() == ""){col_max -= 1;}
    }
    qDebug() << "query1o0.value(0).toString() = " << query1o0.value(0).toString();
    qDebug() << "max0 = " << max0;
    qDebug() << "col_max = " << col_max;
    QString max_col_izm = QString::number(col_max);
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
    qDebug() << "max_col_izm = " << max_col_izm;

    stack->setProperty("maxcolizm", max_col_izm);
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelIzmer::ListModelIzmer
/// \param parent
///
ListModelIzmer::ListModelIzmer(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelIzmer::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelIzmer::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[bazaizmer_dateRole] = "Bazaizmerdate";
    roles[bazaizmer_vmaxRole] = "Bazaizmervmax";
    roles[bazaizmer_sostRole] = "Bazaizmersost";
    roles[bazaizmer_1vRole] = "Bazaizmer1v";
    roles[bazaizmer_1pRole] = "Bazaizmer1p";
    roles[bazaizmer_1oRole] = "Bazaizmer1o";
    roles[bazaizmer_2vRole] = "Bazaizmer2v";
    roles[bazaizmer_2pRole] = "Bazaizmer2p";
    roles[bazaizmer_2oRole] = "Bazaizmer2o";
    roles[bazaizmer_3vRole] = "Bazaizmer3v";
    roles[bazaizmer_3pRole] = "Bazaizmer3p";
    roles[bazaizmer_3oRole] = "Bazaizmer3o";
    roles[bazaizmer_4vRole] = "Bazaizmer4v";
    roles[bazaizmer_4pRole] = "Bazaizmer4p";
    roles[bazaizmer_4oRole] = "Bazaizmer4o";
    roles[bazaizmer_5vRole] = "Bazaizmer5v";
    roles[bazaizmer_5pRole] = "Bazaizmer5p";
    roles[bazaizmer_5oRole] = "Bazaizmer5o";
    roles[bazaizmer_6vRole] = "Bazaizmer6v";
    roles[bazaizmer_6pRole] = "Bazaizmer6p";
    roles[bazaizmer_6oRole] = "Bazaizmer6o";
    roles[bazaizmer_7vRole] = "Bazaizmer7v";
    roles[bazaizmer_7pRole] = "Bazaizmer7p";
    roles[bazaizmer_7oRole] = "Bazaizmer7o";
    roles[bazaizmer_8vRole] = "Bazaizmer8v";
    roles[bazaizmer_8pRole] = "Bazaizmer8p";
    roles[bazaizmer_8oRole] = "Bazaizmer8o";
    roles[bazaizmer_t1Role] = "Bazaizmert1";
    roles[bazaizmer_t2Role] = "Bazaizmert2";
    roles[bazaizmer_t3Role] = "Bazaizmert3";
    roles[bazaizmer_t4Role] = "Bazaizmert4";
    roles[bazaizmer_t5Role] = "Bazaizmert5";
    roles[bazaizmer_t6Role] = "Bazaizmert6";
    roles[bazaizmer_t7Role] = "Bazaizmert7";
    roles[bazaizmer_t8Role] = "Bazaizmert8";
    roles[bazaizmer_rezhimRole] = "Bazaizmerrezhim";
    roles[bazaizmer_tipizmerRole] = "Bazaizmertipizmer";
    roles[bazaizmer_normedRole] = "Bazaizmernormed";
    roles[bazaizmer_normRole] = "Bazaizmernorm";
    roles[bazaizmer_qRole] = "Bazaizmerq";
    roles[bazaizmer_pRole] = "Bazaizmerp";
    roles[bazaizmer_laes2Role] = "Bazaizmerlaes2";
    roles[bazaizmer_ateRole] = "Bazaizmerate";
    roles[bazaizmer_primRole] = "Bazaizmerprim";
    roles[bazaizmer_kksRole] = "Bazaizmerkks";

    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelIzmer::updateModel()
{
    QObject* stack = this->parent()->findChild<QObject*>("stackView");
    QString kks_id=(stack->property("baza_id")).toString();
    QString rezhim_id=(stack->property("rezhim_id")).toString();
    QString bazaizm_id=(stack->property("bazaizm_id")).toString();
    QString rezhim_filter = " and BazaIzmereni.id_Rezhim = " + rezhim_id;
    QString kks_filter = " AND BazaIzmereni.id_Baza = " + kks_id;
    QString bazaizm_id_filter = " AND BazaIzmereni.id = " + bazaizm_id;
    //фильтр для базы измерений
    QString kks_text_filter_BI=(stack->property("kks_filter_BI")).toString();
    QString kks_filter_BI = " and BazaIzmereni.id_Baza = (select Baza.id from Baza where Baza.KKS LIKE '%"+kks_text_filter_BI+"%' and Baza.id = BazaIzmereni.id_Baza)" ;
    QString id_tipmeh_filter_BI = (stack->property("id_tipmeh_filter_BI")).toString();
    QString tipmeh_filter_BI = " and BazaIzmereni.id_Baza = (select Baza.id from Baza where  Baza.id_TipMehanizma = "+id_tipmeh_filter_BI+" and Baza.id = BazaIzmereni.id_Baza)";
    QString neispravnoe = (stack->property("neispravnoe")).toString();
//    QString neispravnoe_hh;
//    QString neispravnoe_nom;
//    QString neispravnoe_rd;
//    QString neispravnoe_filter;
//    if(neispravnoe == "false"){
//        neispravnoe_hh = "";
//        neispravnoe_nom = "";
//        neispravnoe_rd = "";
//        neispravnoe_filter = "";
//    }
//    if(neispravnoe == "true"){

//    neispravnoe_hh = " BazaIzmereni.id_Baza = (select Baza.id from Baza where Baza.id = BazaIzmereni.id_Baza "
//                                      "and BazaIzmereni.id_Rezhim = 1 and strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0) = (select max(strftime('%s', Дата))||' '||max(IFNULL(BazaIzmereni.'Время', 0)) from BazaIzmereni where BazaIzmereni.id_Baza = Baza.id and BazaIzmereni.id_Rezhim = 1)"
////                     "and BazaIzmereni.Время = (select max(IFNULL(BazaIzmereni.Время,0)) from BazaIzmereni where BazaIzmereni.id_Baza = Baza.id and BazaIzmereni.id_Rezhim = 1) "
////                     "and (SELECT MAX(IFNULL(BazaIzmereni.'1В',0), IFNULL(BazaIzmereni.'1П',0), IFNULL(BazaIzmereni.'1О',0), "
////                                               "IFNULL(BazaIzmereni.'2В',0), IFNULL(BazaIzmereni.'2П',0), IFNULL(BazaIzmereni.'2О',0), "
////                                               "IFNULL(BazaIzmereni.'3В',0), IFNULL(BazaIzmereni.'3П',0), IFNULL(BazaIzmereni.'3О',0), "
////                                               "IFNULL(BazaIzmereni.'4В',0), IFNULL(BazaIzmereni.'4П',0), IFNULL(BazaIzmereni.'4О',0), "
////                                               "IFNULL(BazaIzmereni.'5В',0), IFNULL(BazaIzmereni.'5П',0), IFNULL(BazaIzmereni.'5О',0), "
////                                               "IFNULL(BazaIzmereni.'6В',0), IFNULL(BazaIzmereni.'6П',0), IFNULL(BazaIzmereni.'6О',0), "
////                                               "IFNULL(BazaIzmereni.'7В',0), IFNULL(BazaIzmereni.'7П',0), IFNULL(BazaIzmereni.'7О',0), "
////                                               "IFNULL(BazaIzmereni.'8В',0), IFNULL(BazaIzmereni.'8П',0), IFNULL(BazaIzmereni.'8О',0)) "
////                                               "FROM BazaIzmereni Bz WHERE Bz.id= BazaIzmereni.id) > BazaIzmereni.Норма and "
////                                               "(SELECT MAX(IFNULL(BazaIzmereni.'1В',0), IFNULL(BazaIzmereni.'1П',0), IFNULL(BazaIzmereni.'1О',0), "
////                                               "IFNULL(BazaIzmereni.'2В',0), IFNULL(BazaIzmereni.'2П',0), IFNULL(BazaIzmereni.'2О',0)) "
////                                               "FROM BazaIzmereni Bz WHERE Bz.id= BazaIzmereni.id) > BazaIzmereni.НормаЭлДв"
//                     ")";
////            "  BazaIzmereni.id_Baza = (select Baza.id from Baza where Baza.id = BazaIzmereni.id_Baza "
////                          "and BazaIzmereni.id_Rezhim = 1 and BazaIzmereni.Дата = (select max(BazaIzmereni.Дата) from BazaIzmereni where BazaIzmereni.id_Baza = Baza.id and BazaIzmereni.id_Rezhim = 1)"
////                          "and (SELECT MAX(IFNULL(BazaIzmereni.'1В',0), IFNULL(BazaIzmereni.'1П',0), IFNULL(BazaIzmereni.'1О',0), "
////                          "IFNULL(BazaIzmereni.'2В',0), IFNULL(BazaIzmereni.'2П',0), IFNULL(BazaIzmereni.'2О',0), "
////                          "IFNULL(BazaIzmereni.'3В',0), IFNULL(BazaIzmereni.'3П',0), IFNULL(BazaIzmereni.'3О',0), "
////                          "IFNULL(BazaIzmereni.'4В',0), IFNULL(BazaIzmereni.'4П',0), IFNULL(BazaIzmereni.'4О',0), "
////                          "IFNULL(BazaIzmereni.'5В',0), IFNULL(BazaIzmereni.'5П',0), IFNULL(BazaIzmereni.'5О',0), "
////                          "IFNULL(BazaIzmereni.'6В',0), IFNULL(BazaIzmereni.'6П',0), IFNULL(BazaIzmereni.'6О',0), "
////                          "IFNULL(BazaIzmereni.'7В',0), IFNULL(BazaIzmereni.'7П',0), IFNULL(BazaIzmereni.'7О',0), "
////                          "IFNULL(BazaIzmereni.'8В',0), IFNULL(BazaIzmereni.'8П',0), IFNULL(BazaIzmereni.'8О',0)) "
////                          "FROM BazaIzmereni Bz WHERE Bz.id= BazaIzmereni.id) > BazaIzmereni.Норма AND "
////                          "(SELECT MAX(IFNULL(BazaIzmereni.'1В',0), IFNULL(BazaIzmereni.'1П',0), IFNULL(BazaIzmereni.'1О',0), "
////                          "IFNULL(BazaIzmereni.'2В',0), IFNULL(BazaIzmereni.'2П',0), IFNULL(BazaIzmereni.'2О',0)) "
////                          "FROM BazaIzmereni Bz WHERE Bz.id= BazaIzmereni.id) > BazaIzmereni.НормаЭлДв) ";
//    neispravnoe_nom = "";
//    /*" or BazaIzmereni.id_Baza = (select Baza.id from Baza where Baza.id = BazaIzmereni.id_Baza "
//                          "and BazaIzmereni.id_Rezhim = 2 and BazaIzmereni.Дата = (select max(BazaIzmereni.Дата) from BazaIzmereni where BazaIzmereni.id_Baza = Baza.id and BazaIzmereni.id_Rezhim = 2)"
//                          "and (SELECT MAX(IFNULL(BazaIzmereni.'1В',0), IFNULL(BazaIzmereni.'1П',0), IFNULL(BazaIzmereni.'1О',0), "
//                          "IFNULL(BazaIzmereni.'2В',0), IFNULL(BazaIzmereni.'2П',0), IFNULL(BazaIzmereni.'2О',0), "
//                          "IFNULL(BazaIzmereni.'3В',0), IFNULL(BazaIzmereni.'3П',0), IFNULL(BazaIzmereni.'3О',0), "
//                          "IFNULL(BazaIzmereni.'4В',0), IFNULL(BazaIzmereni.'4П',0), IFNULL(BazaIzmereni.'4О',0), "
//                          "IFNULL(BazaIzmereni.'5В',0), IFNULL(BazaIzmereni.'5П',0), IFNULL(BazaIzmereni.'5О',0), "
//                          "IFNULL(BazaIzmereni.'6В',0), IFNULL(BazaIzmereni.'6П',0), IFNULL(BazaIzmereni.'6О',0), "
//                          "IFNULL(BazaIzmereni.'7В',0), IFNULL(BazaIzmereni.'7П',0), IFNULL(BazaIzmereni.'7О',0), "
//                          "IFNULL(BazaIzmereni.'8В',0), IFNULL(BazaIzmereni.'8П',0), IFNULL(BazaIzmereni.'8О',0)) "
//                          "FROM BazaIzmereni Bz WHERE Bz.id= BazaIzmereni.id) > BazaIzmereni.Норма AND "
//                          "(SELECT MAX(IFNULL(BazaIzmereni.'1В',0), IFNULL(BazaIzmereni.'1П',0), IFNULL(BazaIzmereni.'1О',0), "
//                          "IFNULL(BazaIzmereni.'2В',0), IFNULL(BazaIzmereni.'2П',0), IFNULL(BazaIzmereni.'2О',0)) "
//                          "FROM BazaIzmereni Bz WHERE Bz.id= BazaIzmereni.id) > BazaIzmereni.НормаЭлДв) ";*/
//    neispravnoe_rd = "";
////            " or BazaIzmereni.id_Baza = (select Baza.id from Baza where Baza.id = BazaIzmereni.id_Baza "
////                          "and BazaIzmereni.id_Rezhim = 3 and BazaIzmereni.Дата = (select max(BazaIzmereni.Дата) from BazaIzmereni where BazaIzmereni.id_Baza = Baza.id and BazaIzmereni.id_Rezhim = 3)"
////                          "and (SELECT MAX(IFNULL(BazaIzmereni.'1В',0), IFNULL(BazaIzmereni.'1П',0), IFNULL(BazaIzmereni.'1О',0), "
////                          "IFNULL(BazaIzmereni.'2В',0), IFNULL(BazaIzmereni.'2П',0), IFNULL(BazaIzmereni.'2О',0), "
////                          "IFNULL(BazaIzmereni.'3В',0), IFNULL(BazaIzmereni.'3П',0), IFNULL(BazaIzmereni.'3О',0), "
////                          "IFNULL(BazaIzmereni.'4В',0), IFNULL(BazaIzmereni.'4П',0), IFNULL(BazaIzmereni.'4О',0), "
////                          "IFNULL(BazaIzmereni.'5В',0), IFNULL(BazaIzmereni.'5П',0), IFNULL(BazaIzmereni.'5О',0), "
////                          "IFNULL(BazaIzmereni.'6В',0), IFNULL(BazaIzmereni.'6П',0), IFNULL(BazaIzmereni.'6О',0), "
////                          "IFNULL(BazaIzmereni.'7В',0), IFNULL(BazaIzmereni.'7П',0), IFNULL(BazaIzmereni.'7О',0), "
////                          "IFNULL(BazaIzmereni.'8В',0), IFNULL(BazaIzmereni.'8П',0), IFNULL(BazaIzmereni.'8О',0)) "
////                          "FROM BazaIzmereni Bz WHERE Bz.id= BazaIzmereni.id) > BazaIzmereni.Норма AND "
////                          "(SELECT MAX(IFNULL(BazaIzmereni.'1В',0), IFNULL(BazaIzmereni.'1П',0), IFNULL(BazaIzmereni.'1О',0), "
////                          "IFNULL(BazaIzmereni.'2В',0), IFNULL(BazaIzmereni.'2П',0), IFNULL(BazaIzmereni.'2О',0)) "
////                          "FROM BazaIzmereni Bz WHERE Bz.id= BazaIzmereni.id) > BazaIzmereni.НормаЭлДв) ";
//    neispravnoe_filter = " and (" + neispravnoe_hh + neispravnoe_nom + neispravnoe_rd + ") ";
//    }
    if(rezhim_id == ""){
        rezhim_filter = "";
    }
    if(kks_id == ""){
        kks_filter = "";
    }
    if(bazaizm_id == ""){
        bazaizm_id_filter = "";
    }
    if(kks_text_filter_BI == ""){
        kks_filter_BI = "";
    }
    if(id_tipmeh_filter_BI == ""){
        tipmeh_filter_BI = "";
    }
    if(neispravnoe == "true"){ //если включена опция "Не испраны", то переопределяем запрос
        QSqlDatabase db = QSqlDatabase::database();
        db.transaction();
        this->setQuery("select * from (select bi_id, date_time, max_value, sost, v1, p1, o1, v2, p2, o2, v3, p3, o3, v4, p4, o4, v5, p5, o5, "
                       "v6, p6, o6, v7, p7, o7, v8, p8, o8, t1, t2, t3, t4, t5, t6, t7, t8, rezhim, tip_izmer, norm_ed, norm, q, p, laes2, ate, "
                       "prim, kks, bi_id_baza, time_, date_, biidrezhim from (select BazaIzmereni.id as bi_id, strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0) as date_time, "
                       "(SELECT MAX(IFNULL(BazaIzmereni.'1В', 0), IFNULL(BazaIzmereni.'1П', 0), IFNULL(BazaIzmereni.'1О', 0), "
                       "IFNULL(BazaIzmereni.'2В', 0), IFNULL(BazaIzmereni.'2П', 0), IFNULL(BazaIzmereni.'2О', 0), "
                       "IFNULL(BazaIzmereni.'3В', 0), IFNULL(BazaIzmereni.'3П', 0), IFNULL(BazaIzmereni.'3О', 0), "
                       "IFNULL(BazaIzmereni.'4В', 0), IFNULL(BazaIzmereni.'4П', 0), IFNULL(BazaIzmereni.'4О', 0), "
                       "IFNULL(BazaIzmereni.'5В', 0), IFNULL(BazaIzmereni.'5П', 0), IFNULL(BazaIzmereni.'5О', 0), "
                       "IFNULL(BazaIzmereni.'6В', 0), IFNULL(BazaIzmereni.'6П', 0), IFNULL(BazaIzmereni.'6О', 0), "
                       "IFNULL(BazaIzmereni.'7В', 0), IFNULL(BazaIzmereni.'7П', 0), IFNULL(BazaIzmereni.'7О', 0), "
                       "IFNULL(BazaIzmereni.'8В', 0), IFNULL(BazaIzmereni.'8П', 0), IFNULL(BazaIzmereni.'8О', 0)) "
                       "FROM BazaIzmereni Bz WHERE Bz.id= BazaIzmereni.id) as max_value, "
                       "(SELECT (CASE WHEN (SELECT MAX(IFNULL(BazaIzmereni.'1В',0), IFNULL(BazaIzmereni.'1П',0), IFNULL(BazaIzmereni.'1О',0), "
                       "IFNULL(BazaIzmereni.'2В',0), IFNULL(BazaIzmereni.'2П',0), IFNULL(BazaIzmereni.'2О',0), "
                       "IFNULL(BazaIzmereni.'3В',0), IFNULL(BazaIzmereni.'3П',0), IFNULL(BazaIzmereni.'3О',0), "
                       "IFNULL(BazaIzmereni.'4В',0), IFNULL(BazaIzmereni.'4П',0), IFNULL(BazaIzmereni.'4О',0), "
                       "IFNULL(BazaIzmereni.'5В',0), IFNULL(BazaIzmereni.'5П',0), IFNULL(BazaIzmereni.'5О',0), "
                       "IFNULL(BazaIzmereni.'6В',0), IFNULL(BazaIzmereni.'6П',0), IFNULL(BazaIzmereni.'6О',0), "
                       "IFNULL(BazaIzmereni.'7В',0), IFNULL(BazaIzmereni.'7П',0), IFNULL(BazaIzmereni.'7О',0), "
                       "IFNULL(BazaIzmereni.'8В',0), IFNULL(BazaIzmereni.'8П',0), IFNULL(BazaIzmereni.'8О',0)) "
                       "FROM BazaIzmereni Bz WHERE Bz.id= BazaIzmereni.id) <= BazaIzmereni.Норма AND "
                       "(SELECT MAX(IFNULL(BazaIzmereni.'1В',0), IFNULL(BazaIzmereni.'1П',0), IFNULL(BazaIzmereni.'1О',0), "
                       "IFNULL(BazaIzmereni.'2В',0), IFNULL(BazaIzmereni.'2П',0), IFNULL(BazaIzmereni.'2О',0)) "
                       "FROM BazaIzmereni Bz WHERE Bz.id= BazaIzmereni.id) <= BazaIzmereni.НормаЭлДв THEN 'Норма' ELSE 'Превышение' end) FROM "
                       "BazaIzmereni Bz WHERE Bz.id= BazaIzmereni.id) as sost, BazaIzmereni.'1В' as v1, BazaIzmereni.'1П' as p1, "
                       "BazaIzmereni.'1О' as o1, BazaIzmereni.'2В' as v2, BazaIzmereni.'2П' as p2, BazaIzmereni.'2О' as o2, "
                       "BazaIzmereni.'3В' as v3, BazaIzmereni.'3П' as p3, BazaIzmereni.'3О' as o3, BazaIzmereni.'4В' as v4, "
                       "BazaIzmereni.'4П' as p4, BazaIzmereni.'4О' as o4, BazaIzmereni.'5В' as v5, BazaIzmereni.'5П' as p5, "
                       "BazaIzmereni.'5О' as o5, BazaIzmereni.'6В' as v6, BazaIzmereni.'6П' as p6, BazaIzmereni.'6О' as o6, "
                       "BazaIzmereni.'7В' as v7, BazaIzmereni.'7П' as p7, BazaIzmereni.'7О' as o7, BazaIzmereni.'8В' as v8, "
                       "BazaIzmereni.'8П' as p8, BazaIzmereni.'8О' as o8, BazaIzmereni.'T1' as t1, BazaIzmereni.'T2' as t2, "
                       "BazaIzmereni.'T3' as t3, BazaIzmereni.'T4' as t4, BazaIzmereni.'T5' as t5, BazaIzmereni.'T6' as t6, "
                       "BazaIzmereni.'T7' as t7, BazaIzmereni.'T8' as t8, "
                       "(SELECT Rezhim.Наименование FROM Rezhim WHERE Rezhim.id = BazaIzmereni.id_Rezhim) as rezhim, "
                       "(SELECT TipIzmerenia.Наименование FROM TipIzmerenia WHERE TipIzmerenia.id = BazaIzmereni.id_TipIzmerenia) as tip_izmer, "
                       "BazaIzmereni.НормаЭлДв as norm_ed, BazaIzmereni.Норма as norm, BazaIzmereni.Q as q, BazaIzmereni.P as p, "
                       "BazaIzmereni.'ЛАЭС-2' as laes2, BazaIzmereni.АТЭ as ate, BazaIzmereni.Примечания as prim, Baza.KKS as kks, "
                       "BazaIzmereni.id_Baza as bi_id_baza, BazaIzmereni.'Время' as time_, BazaIzmereni.Дата as date_, "
                       "BazaIzmereni.id_Rezhim as biidrezhim "
                       "from Baza, BazaIzmereni where Baza.id = BazaIzmereni.id_Baza and BazaIzmereni.id_Rezhim = 1 and "
                       "BazaIzmereni.id_TipIzmerenia <> 2 and BazaIzmereni.id_TipIzmerenia <> 4 " + kks_filter + bazaizm_id_filter + kks_filter_BI + tipmeh_filter_BI +"and "
                       "BazaIzmereni.Дата = (select max(BazaIzmereni.Дата) from BazaIzmereni where BazaIzmereni.id_Baza = Baza.id and "
                       "BazaIzmereni.id_Rezhim = 1 and BazaIzmereni.id_TipIzmerenia <> 2 and BazaIzmereni.id_TipIzmerenia <> 4 " + kks_filter + bazaizm_id_filter + kks_filter_BI + tipmeh_filter_BI +") "
                       "group by Baza.KKS order by Baza.KKS, BazaIzmereni.Дата DESC, BazaIzmereni.Время DESC) as base_hh where "
                       "((SELECT MAX(IFNULL(base_hh.v3,0), IFNULL(base_hh.p3,0), IFNULL(base_hh.o3,0), IFNULL(base_hh.v4,0), "
                       "IFNULL(base_hh.p4,0), IFNULL(base_hh.o4,0), IFNULL(base_hh.v5,0), IFNULL(base_hh.p5,0), IFNULL(base_hh.o5,0), "
                       "IFNULL(base_hh.v6,0), IFNULL(base_hh.p6,0), IFNULL(base_hh.o6,0), IFNULL(base_hh.v7,0), IFNULL(base_hh.p7,0), "
                       "IFNULL(base_hh.o7,0), IFNULL(base_hh.v8,0), IFNULL(base_hh.p8,0), IFNULL(base_hh.o8,0))) > base_hh.norm or "
                       "(SELECT MAX(IFNULL(base_hh.v1,0), IFNULL(base_hh.p1,0), IFNULL(base_hh.o1,0), IFNULL(base_hh.v2,0), IFNULL(base_hh.p2,0), "
                       "IFNULL(base_hh.o2,0))) > base_hh.norm_ed) order by base_hh.date_ DESC, base_hh.time_ DESC) "
                       "UNION "
                       "select * from (select bi_id, date_time, max_value, sost, v1, p1, o1, v2, p2, o2, v3, p3, o3, v4, p4, o4, v5, p5, o5, v6, "
                       "p6, o6, v7, p7, o7, v8, p8, o8, t1, t2, t3, t4, t5, t6, t7, t8, rezhim, tip_izmer, norm_ed, norm, q, p, laes2, ate, prim, "
                       "kks, bi_id_baza, time_, date_, biidrezhim from (select BazaIzmereni.id as bi_id, "
                       "strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0) as date_time, "
                       "(SELECT MAX(IFNULL(BazaIzmereni.'1В', 0), IFNULL(BazaIzmereni.'1П', 0), IFNULL(BazaIzmereni.'1О', 0), "
                       "IFNULL(BazaIzmereni.'2В', 0), IFNULL(BazaIzmereni.'2П', 0), IFNULL(BazaIzmereni.'2О', 0), IFNULL(BazaIzmereni.'3В', 0), "
                       "IFNULL(BazaIzmereni.'3П', 0), IFNULL(BazaIzmereni.'3О', 0), IFNULL(BazaIzmereni.'4В', 0), IFNULL(BazaIzmereni.'4П', 0), "
                       "IFNULL(BazaIzmereni.'4О', 0), IFNULL(BazaIzmereni.'5В', 0), IFNULL(BazaIzmereni.'5П', 0), IFNULL(BazaIzmereni.'5О', 0), "
                       "IFNULL(BazaIzmereni.'6В', 0), IFNULL(BazaIzmereni.'6П', 0), IFNULL(BazaIzmereni.'6О', 0), IFNULL(BazaIzmereni.'7В', 0), "
                       "IFNULL(BazaIzmereni.'7П', 0), IFNULL(BazaIzmereni.'7О', 0), IFNULL(BazaIzmereni.'8В', 0), IFNULL(BazaIzmereni.'8П', 0), "
                       "IFNULL(BazaIzmereni.'8О', 0)) FROM BazaIzmereni Bz WHERE Bz.id= BazaIzmereni.id) as max_value, "
                       "(SELECT (CASE WHEN (SELECT MAX(IFNULL(BazaIzmereni.'1В',0), IFNULL(BazaIzmereni.'1П',0), IFNULL(BazaIzmereni.'1О',0), "
                       "IFNULL(BazaIzmereni.'2В',0), IFNULL(BazaIzmereni.'2П',0), IFNULL(BazaIzmereni.'2О',0), IFNULL(BazaIzmereni.'3В',0), "
                       "IFNULL(BazaIzmereni.'3П',0), IFNULL(BazaIzmereni.'3О',0), IFNULL(BazaIzmereni.'4В',0), IFNULL(BazaIzmereni.'4П',0), "
                       "IFNULL(BazaIzmereni.'4О',0), IFNULL(BazaIzmereni.'5В',0), IFNULL(BazaIzmereni.'5П',0), IFNULL(BazaIzmereni.'5О',0), "
                       "IFNULL(BazaIzmereni.'6В',0), IFNULL(BazaIzmereni.'6П',0), IFNULL(BazaIzmereni.'6О',0), IFNULL(BazaIzmereni.'7В',0), "
                       "IFNULL(BazaIzmereni.'7П',0), IFNULL(BazaIzmereni.'7О',0), IFNULL(BazaIzmereni.'8В',0), IFNULL(BazaIzmereni.'8П',0), "
                       "IFNULL(BazaIzmereni.'8О',0)) FROM BazaIzmereni Bz WHERE Bz.id= BazaIzmereni.id) <= BazaIzmereni.Норма AND "
                       "(SELECT MAX(IFNULL(BazaIzmereni.'1В',0), IFNULL(BazaIzmereni.'1П',0), IFNULL(BazaIzmereni.'1О',0), "
                       "IFNULL(BazaIzmereni.'2В',0), IFNULL(BazaIzmereni.'2П',0), IFNULL(BazaIzmereni.'2О',0)) FROM BazaIzmereni Bz "
                       "WHERE Bz.id= BazaIzmereni.id) <= BazaIzmereni.НормаЭлДв THEN 'Норма' ELSE 'Превышение' end) FROM BazaIzmereni Bz "
                       "WHERE Bz.id= BazaIzmereni.id) as sost, BazaIzmereni.'1В' as v1, BazaIzmereni.'1П' as p1, BazaIzmereni.'1О' as o1, "
                       "BazaIzmereni.'2В' as v2, BazaIzmereni.'2П' as p2, BazaIzmereni.'2О' as o2, BazaIzmereni.'3В' as v3, "
                       "BazaIzmereni.'3П' as p3, BazaIzmereni.'3О' as o3, BazaIzmereni.'4В' as v4, BazaIzmereni.'4П' as p4, "
                       "BazaIzmereni.'4О' as o4, BazaIzmereni.'5В' as v5, BazaIzmereni.'5П' as p5, BazaIzmereni.'5О' as o5, "
                       "BazaIzmereni.'6В' as v6, BazaIzmereni.'6П' as p6, BazaIzmereni.'6О' as o6, BazaIzmereni.'7В' as v7, "
                       "BazaIzmereni.'7П' as p7, BazaIzmereni.'7О' as o7, BazaIzmereni.'8В' as v8, BazaIzmereni.'8П' as p8, "
                       "BazaIzmereni.'8О' as o8, BazaIzmereni.'T1' as t1, BazaIzmereni.'T2' as t2, BazaIzmereni.'T3' as t3, "
                       "BazaIzmereni.'T4' as t4, BazaIzmereni.'T5' as t5, BazaIzmereni.'T6' as t6, BazaIzmereni.'T7' as t7, "
                       "BazaIzmereni.'T8' as t8, (SELECT Rezhim.Наименование FROM Rezhim WHERE Rezhim.id = BazaIzmereni.id_Rezhim) as rezhim, "
                       "(SELECT TipIzmerenia.Наименование FROM TipIzmerenia WHERE TipIzmerenia.id = BazaIzmereni.id_TipIzmerenia) as tip_izmer, "
                       "BazaIzmereni.НормаЭлДв as norm_ed, BazaIzmereni.Норма as norm, BazaIzmereni.Q as q, BazaIzmereni.P as p, "
                       "BazaIzmereni.'ЛАЭС-2' as laes2, BazaIzmereni.АТЭ as ate, BazaIzmereni.Примечания as prim, Baza.KKS as kks, "
                       "BazaIzmereni.id_Baza as bi_id_baza, BazaIzmereni.'Время' as time_, BazaIzmereni.Дата as date_, "
                       "BazaIzmereni.id_Rezhim as biidrezhim from Baza, BazaIzmereni "
                       "where Baza.id = BazaIzmereni.id_Baza and BazaIzmereni.id_Rezhim = 2 and BazaIzmereni.id_TipIzmerenia <> 2 and "
                       "BazaIzmereni.id_TipIzmerenia <> 4 " + kks_filter + bazaizm_id_filter + kks_filter_BI + tipmeh_filter_BI +" and BazaIzmereni.Дата = (select max(BazaIzmereni.Дата) from BazaIzmereni where "
                       "BazaIzmereni.id_Baza = Baza.id and BazaIzmereni.id_Rezhim = 2 and BazaIzmereni.id_TipIzmerenia <> 2 and "
                       "BazaIzmereni.id_TipIzmerenia <> 4 " + kks_filter + bazaizm_id_filter + kks_filter_BI + tipmeh_filter_BI +") group by Baza.KKS order by Baza.KKS, BazaIzmereni.Дата DESC, BazaIzmereni.Время DESC) as base_nom where "
                       "((SELECT MAX(IFNULL(base_nom.v3,0), IFNULL(base_nom.p3,0), IFNULL(base_nom.o3,0), "
                       "IFNULL(base_nom.v4,0), IFNULL(base_nom.p4,0), IFNULL(base_nom.o4,0), IFNULL(base_nom.v5,0), IFNULL(base_nom.p5,0), "
                       "IFNULL(base_nom.o5,0), IFNULL(base_nom.v6,0), IFNULL(base_nom.p6,0), IFNULL(base_nom.o6,0), IFNULL(base_nom.v7,0), "
                       "IFNULL(base_nom.p7,0), IFNULL(base_nom.o7,0), IFNULL(base_nom.v8,0), IFNULL(base_nom.p8,0), "
                       "IFNULL(base_nom.o8,0))) > base_nom.norm or (SELECT MAX(IFNULL(base_nom.v1,0), IFNULL(base_nom.p1,0), "
                       "IFNULL(base_nom.o1,0), IFNULL(base_nom.v2,0), IFNULL(base_nom.p2,0), IFNULL(base_nom.o2,0))) > base_nom.norm_ed) "
                       "order by base_nom.date_ DESC, base_nom.time_ DESC) "
                       "UNION "
                       "select * from (select bi_id, date_time, max_value, sost, v1, p1, o1, v2, p2, o2, v3, p3, o3, v4, p4, o4, v5, p5, o5, v6, "
                       "p6, o6, v7, p7, o7, v8, p8, o8, t1, t2, t3, t4, t5, t6, t7, t8, rezhim, tip_izmer, norm_ed, norm, q, p, laes2, ate, prim, "
                       "kks, bi_id_baza, time_, date_, biidrezhim from (select BazaIzmereni.id as bi_id, "
                       "strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0) as date_time, "
                       "(SELECT MAX(IFNULL(BazaIzmereni.'1В', 0), IFNULL(BazaIzmereni.'1П', 0), IFNULL(BazaIzmereni.'1О', 0), "
                       "IFNULL(BazaIzmereni.'2В', 0), IFNULL(BazaIzmereni.'2П', 0), IFNULL(BazaIzmereni.'2О', 0), IFNULL(BazaIzmereni.'3В', 0), "
                       "IFNULL(BazaIzmereni.'3П', 0), IFNULL(BazaIzmereni.'3О', 0), IFNULL(BazaIzmereni.'4В', 0), IFNULL(BazaIzmereni.'4П', 0), "
                       "IFNULL(BazaIzmereni.'4О', 0), IFNULL(BazaIzmereni.'5В', 0), IFNULL(BazaIzmereni.'5П', 0), IFNULL(BazaIzmereni.'5О', 0), "
                       "IFNULL(BazaIzmereni.'6В', 0), IFNULL(BazaIzmereni.'6П', 0), IFNULL(BazaIzmereni.'6О', 0), IFNULL(BazaIzmereni.'7В', 0), "
                       "IFNULL(BazaIzmereni.'7П', 0), IFNULL(BazaIzmereni.'7О', 0), IFNULL(BazaIzmereni.'8В', 0), IFNULL(BazaIzmereni.'8П', 0), "
                       "IFNULL(BazaIzmereni.'8О', 0)) FROM BazaIzmereni Bz WHERE Bz.id= BazaIzmereni.id) as max_value, "
                       "(SELECT (CASE WHEN (SELECT MAX(IFNULL(BazaIzmereni.'1В',0), IFNULL(BazaIzmereni.'1П',0), IFNULL(BazaIzmereni.'1О',0), "
                       "IFNULL(BazaIzmereni.'2В',0), IFNULL(BazaIzmereni.'2П',0), IFNULL(BazaIzmereni.'2О',0), IFNULL(BazaIzmereni.'3В',0), "
                       "IFNULL(BazaIzmereni.'3П',0), IFNULL(BazaIzmereni.'3О',0), IFNULL(BazaIzmereni.'4В',0), IFNULL(BazaIzmereni.'4П',0), "
                       "IFNULL(BazaIzmereni.'4О',0), IFNULL(BazaIzmereni.'5В',0), IFNULL(BazaIzmereni.'5П',0), IFNULL(BazaIzmereni.'5О',0), "
                       "IFNULL(BazaIzmereni.'6В',0), IFNULL(BazaIzmereni.'6П',0), IFNULL(BazaIzmereni.'6О',0), IFNULL(BazaIzmereni.'7В',0), "
                       "IFNULL(BazaIzmereni.'7П',0), IFNULL(BazaIzmereni.'7О',0), IFNULL(BazaIzmereni.'8В',0), IFNULL(BazaIzmereni.'8П',0), "
                       "IFNULL(BazaIzmereni.'8О',0)) FROM BazaIzmereni Bz WHERE Bz.id= BazaIzmereni.id) <= BazaIzmereni.Норма AND "
                       "(SELECT MAX(IFNULL(BazaIzmereni.'1В',0), IFNULL(BazaIzmereni.'1П',0), IFNULL(BazaIzmereni.'1О',0), "
                       "IFNULL(BazaIzmereni.'2В',0), IFNULL(BazaIzmereni.'2П',0), IFNULL(BazaIzmereni.'2О',0)) FROM BazaIzmereni Bz "
                       "WHERE Bz.id= BazaIzmereni.id) <= BazaIzmereni.НормаЭлДв THEN 'Норма' ELSE 'Превышение' end) FROM BazaIzmereni Bz "
                       "WHERE Bz.id= BazaIzmereni.id) as sost, BazaIzmereni.'1В' as v1, BazaIzmereni.'1П' as p1, BazaIzmereni.'1О' as o1, "
                       "BazaIzmereni.'2В' as v2, BazaIzmereni.'2П' as p2, BazaIzmereni.'2О' as o2, BazaIzmereni.'3В' as v3, "
                       "BazaIzmereni.'3П' as p3, BazaIzmereni.'3О' as o3, BazaIzmereni.'4В' as v4, BazaIzmereni.'4П' as p4, "
                       "BazaIzmereni.'4О' as o4, BazaIzmereni.'5В' as v5, BazaIzmereni.'5П' as p5, BazaIzmereni.'5О' as o5, "
                       "BazaIzmereni.'6В' as v6, BazaIzmereni.'6П' as p6, BazaIzmereni.'6О' as o6, BazaIzmereni.'7В' as v7, "
                       "BazaIzmereni.'7П' as p7, BazaIzmereni.'7О' as o7, BazaIzmereni.'8В' as v8, BazaIzmereni.'8П' as p8, "
                       "BazaIzmereni.'8О' as o8, BazaIzmereni.'T1' as t1, BazaIzmereni.'T2' as t2, BazaIzmereni.'T3' as t3, "
                       "BazaIzmereni.'T4' as t4, BazaIzmereni.'T5' as t5, BazaIzmereni.'T6' as t6, BazaIzmereni.'T7' as t7, "
                       "BazaIzmereni.'T8' as t8, (SELECT Rezhim.Наименование FROM Rezhim WHERE Rezhim.id = BazaIzmereni.id_Rezhim) as rezhim, "
                       "(SELECT TipIzmerenia.Наименование FROM TipIzmerenia WHERE TipIzmerenia.id = BazaIzmereni.id_TipIzmerenia) as tip_izmer, "
                       "BazaIzmereni.НормаЭлДв as norm_ed, BazaIzmereni.Норма as norm, BazaIzmereni.Q as q, BazaIzmereni.P as p, "
                       "BazaIzmereni.'ЛАЭС-2' as laes2, BazaIzmereni.АТЭ as ate, BazaIzmereni.Примечания as prim, Baza.KKS as kks, "
                       "BazaIzmereni.id_Baza as bi_id_baza, BazaIzmereni.'Время' as time_, BazaIzmereni.Дата as date_, "
                       "BazaIzmereni.id_Rezhim as biidrezhim from Baza, BazaIzmereni "
                       "where Baza.id = BazaIzmereni.id_Baza and BazaIzmereni.id_Rezhim = 3 and BazaIzmereni.id_TipIzmerenia <> 2 and "
                       "BazaIzmereni.id_TipIzmerenia <> 4 " + kks_filter + bazaizm_id_filter + kks_filter_BI + tipmeh_filter_BI +" and BazaIzmereni.Дата = (select max(BazaIzmereni.Дата) from BazaIzmereni where "
                       "BazaIzmereni.id_Baza = Baza.id and BazaIzmereni.id_Rezhim = 3 and BazaIzmereni.id_TipIzmerenia <> 2 and "
                       "BazaIzmereni.id_TipIzmerenia <> 4 " + kks_filter + bazaizm_id_filter + kks_filter_BI + tipmeh_filter_BI +") group by Baza.KKS order by Baza.KKS, BazaIzmereni.Дата DESC, BazaIzmereni.Время DESC) as base_rd where "
                       "((SELECT MAX(IFNULL(base_rd.v3,0), IFNULL(base_rd.p3,0), IFNULL(base_rd.o3,0), "
                       "IFNULL(base_rd.v4,0), IFNULL(base_rd.p4,0), IFNULL(base_rd.o4,0), IFNULL(base_rd.v5,0), IFNULL(base_rd.p5,0), "
                       "IFNULL(base_rd.o5,0), IFNULL(base_rd.v6,0), IFNULL(base_rd.p6,0), IFNULL(base_rd.o6,0), IFNULL(base_rd.v7,0), "
                       "IFNULL(base_rd.p7,0), IFNULL(base_rd.o7,0), IFNULL(base_rd.v8,0), IFNULL(base_rd.p8,0), IFNULL(base_rd.o8,0))) > base_rd.norm or "
                       "(SELECT MAX(IFNULL(base_rd.v1,0), IFNULL(base_rd.p1,0), IFNULL(base_rd.o1,0), IFNULL(base_rd.v2,0), IFNULL(base_rd.p2,0), "
                       "IFNULL(base_rd.o2,0))) > base_rd.norm_ed) order by base_rd.date_ DESC, base_rd.time_ DESC) order by 49 DESC, 48 DESC");
        while(this->canFetchMore()){
            this->fetchMore();
        }
        qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
        db.commit();
        if(!db.commit()){
        db.rollback();
        }
    } else {
        QSqlDatabase db = QSqlDatabase::database();
        db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery("SELECT BazaIzmereni.id, strftime('%d-%m-%Y', Дата)||' '||IFNULL(BazaIzmereni.'Время', 0), "
         "(SELECT MAX(IFNULL(BazaIzmereni.'1В', 0), IFNULL(BazaIzmereni.'1П', 0), IFNULL(BazaIzmereni.'1О', 0),"
         " IFNULL(BazaIzmereni.'2В', 0), IFNULL(BazaIzmereni.'2П', 0), IFNULL(BazaIzmereni.'2О', 0),"
         " IFNULL(BazaIzmereni.'3В', 0), IFNULL(BazaIzmereni.'3П', 0), IFNULL(BazaIzmereni.'3О', 0),"
         " IFNULL(BazaIzmereni.'4В', 0), IFNULL(BazaIzmereni.'4П', 0), IFNULL(BazaIzmereni.'4О', 0),"
         " IFNULL(BazaIzmereni.'5В', 0), IFNULL(BazaIzmereni.'5П', 0), IFNULL(BazaIzmereni.'5О', 0),"
         " IFNULL(BazaIzmereni.'6В', 0), IFNULL(BazaIzmereni.'6П', 0), IFNULL(BazaIzmereni.'6О', 0),"
         " IFNULL(BazaIzmereni.'7В', 0), IFNULL(BazaIzmereni.'7П', 0), IFNULL(BazaIzmereni.'7О', 0),"
         " IFNULL(BazaIzmereni.'8В', 0), IFNULL(BazaIzmereni.'8П', 0), IFNULL(BazaIzmereni.'8О', 0))"
         " FROM BazaIzmereni Bz WHERE Bz.id= BazaIzmereni.id), "
         " (SELECT (CASE WHEN (SELECT MAX(IFNULL(BazaIzmereni.'1В',0), IFNULL(BazaIzmereni.'1П',0), IFNULL(BazaIzmereni.'1О',0), "
         "IFNULL(BazaIzmereni.'2В',0), IFNULL(BazaIzmereni.'2П',0), IFNULL(BazaIzmereni.'2О',0), "
         "IFNULL(BazaIzmereni.'3В',0), IFNULL(BazaIzmereni.'3П',0), IFNULL(BazaIzmereni.'3О',0), "
         "IFNULL(BazaIzmereni.'4В',0), IFNULL(BazaIzmereni.'4П',0), IFNULL(BazaIzmereni.'4О',0), "
         "IFNULL(BazaIzmereni.'5В',0), IFNULL(BazaIzmereni.'5П',0), IFNULL(BazaIzmereni.'5О',0), "
         "IFNULL(BazaIzmereni.'6В',0), IFNULL(BazaIzmereni.'6П',0), IFNULL(BazaIzmereni.'6О',0), "
         "IFNULL(BazaIzmereni.'7В',0), IFNULL(BazaIzmereni.'7П',0), IFNULL(BazaIzmereni.'7О',0), "
         "IFNULL(BazaIzmereni.'8В',0), IFNULL(BazaIzmereni.'8П',0), IFNULL(BazaIzmereni.'8О',0)) "
         "FROM BazaIzmereni Bz WHERE Bz.id= BazaIzmereni.id) <= BazaIzmereni.Норма AND "
         "(SELECT MAX(IFNULL(BazaIzmereni.'1В',0), IFNULL(BazaIzmereni.'1П',0), IFNULL(BazaIzmereni.'1О',0), "
         "IFNULL(BazaIzmereni.'2В',0), IFNULL(BazaIzmereni.'2П',0), IFNULL(BazaIzmereni.'2О',0)) "
         "FROM BazaIzmereni Bz WHERE Bz.id= BazaIzmereni.id) <= BazaIzmereni.НормаЭлДв "
         "THEN 'Норма' ELSE 'Превышение' end) FROM "
         "BazaIzmereni Bz WHERE Bz.id= BazaIzmereni.id), BazaIzmereni.'1В', BazaIzmereni.'1П', BazaIzmereni.'1О', "
                   "BazaIzmereni.'2В', BazaIzmereni.'2П', BazaIzmereni.'2О',"
                   "BazaIzmereni.'3В', BazaIzmereni.'3П', BazaIzmereni.'3О',"
                   "BazaIzmereni.'4В', BazaIzmereni.'4П', BazaIzmereni.'4О',"
                   "BazaIzmereni.'5В', BazaIzmereni.'5П', BazaIzmereni.'5О',"
                   "BazaIzmereni.'6В', BazaIzmereni.'6П', BazaIzmereni.'6О',"
                   "BazaIzmereni.'7В', BazaIzmereni.'7П', BazaIzmereni.'7О',"
                   "BazaIzmereni.'8В', BazaIzmereni.'8П', BazaIzmereni.'8О', "
                   "BazaIzmereni.'T1', BazaIzmereni.'T2', BazaIzmereni.'T3', BazaIzmereni.'T4', "
                   "BazaIzmereni.'T5', BazaIzmereni.'T6', BazaIzmereni.'T7', BazaIzmereni.'T8', "
                   "(SELECT Rezhim.Наименование FROM Rezhim WHERE Rezhim.id = BazaIzmereni.id_Rezhim), "
                   "(SELECT TipIzmerenia.Наименование FROM TipIzmerenia WHERE TipIzmerenia.id = BazaIzmereni.id_TipIzmerenia), "
                   "BazaIzmereni.НормаЭлДв, BazaIzmereni.Норма, BazaIzmereni.Q, BazaIzmereni.P, BazaIzmereni.'ЛАЭС-2', "
                   "BazaIzmereni.АТЭ, BazaIzmereni.Примечания, (SELECT Baza.KKS FROM Baza WHERE Baza.id = BazaIzmereni.id_Baza ), BazaIzmereni.id_Baza, "
                   "BazaIzmereni.'Время'"
         " FROM BazaIzmereni WHERE BazaIzmereni.id LIKE '%%' " + kks_filter + rezhim_filter + bazaizm_id_filter + kks_filter_BI + tipmeh_filter_BI +
         " ORDER BY BazaIzmereni.'Дата' DESC, BazaIzmereni.'Время' DESC");
        while(this->canFetchMore()){
            this->fetchMore();
        }
        qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
        db.commit();
        if(!db.commit()){
        db.rollback();
        }
    }
}

// Получение id из строки в модели представления данных
int ListModelIzmer::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelTipIzmer::ListModelTipIzmer
/// \param parent
///
ListModelTipIzmer::ListModelTipIzmer(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelTipIzmer::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelTipIzmer::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[tipizmer_nameRole] = "TipIzmername";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelTipIzmer::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT TipIzmerenia.id, TipIzmerenia.Наименование FROM TipIzmerenia ORDER BY TipIzmerenia.id");
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelTipIzmer::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelNormCreatBI::ListModelNormCreatBI
/// \param parent
///
ListModelNormCreatBI::ListModelNormCreatBI(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelNormCreatBI::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelNormCreatBI::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    //roles[tipizmer_nameRole] = "TipIzmername";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelNormCreatBI::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    QObject* stack = this->parent()->findChild<QObject*>("stackView");
    QString idbaza=(stack->property("baza_id_for_norm_creatBI")).toString();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT Baza.id, (SELECT NormHh.Значение FROM NormHh WHERE NormHh.id = Baza.id_NormHh),"
                   " (SELECT NormNomED.Значение FROM NormNomED WHERE NormNomED.id = Baza.id_NormNomED),"
                   " (SELECT NormNom.Значение FROM NormNom WHERE NormNom.id = Baza.id_NormNom),"
                   " (SELECT NormRdED.Значение FROM NormRdED WHERE NormRdED.id = Baza.id_NormRdED),"
                   " (SELECT NormRd.Значение FROM NormRd WHERE NormRd.id = Baza.id_NormRd) FROM Baza WHERE Baza.id = " + idbaza);
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
    qDebug() << "id базы в c++" << idbaza;
}

// Получение id из строки в модели представления данных
int ListModelNormCreatBI::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelLAES::ListModelLAES
/// \param parent
///
ListModelLAES::ListModelLAES(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelLAES::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelLAES::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[laes_nameRole] = "laes";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelLAES::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT LAES.id, LAES.Фамилия FROM LAES ORDER BY LAES.Фамилия");
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelLAES::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}

ListModelATE::ListModelATE(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelATE::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelATE::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[ate_nameRole] = "ate";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelATE::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery(" SELECT ATE.id, ATE.Фамилия FROM ATE ORDER BY ATE.Фамилия");
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelATE::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief ListModelIzmerOpenBI::ListModelIzmerOpenBI
/// \param parent
///
ListModelIzmerOpenBI::ListModelIzmerOpenBI(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModelIzmerOpenBI::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModelIzmerOpenBI::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModelIzmerOpenBI::updateModel()
{
    QObject* stack = this->parent()->findChild<QObject*>("stackView");
    QString bazaizm_id=(stack->property("bazaizm_id")).toString();
    QString bazaizm_id_filter = " WHERE BazaIzmereni.id = " + bazaizm_id;
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery("SELECT BazaIzmereni.id, (SELECT Baza.KKS FROM Baza WHERE Baza.id = BazaIzmereni.id_Baza ), "
                   "strftime('%d-%m-%Y', Дата), IFNULL(BazaIzmereni.'Время', 0), "
                   "(SELECT Rezhim.Наименование FROM Rezhim WHERE Rezhim.id = BazaIzmereni.id_Rezhim), "
                   "(SELECT TipIzmerenia.Наименование FROM TipIzmerenia WHERE TipIzmerenia.id = BazaIzmereni.id_TipIzmerenia), "
         "BazaIzmereni.НормаЭлДв, BazaIzmereni.Норма, BazaIzmereni.'ЛАЭС-2', "
                   "BazaIzmereni.АТЭ, BazaIzmereni.'1В', BazaIzmereni.'1П', BazaIzmereni.'1О', "
                   "BazaIzmereni.'2В', BazaIzmereni.'2П', BazaIzmereni.'2О',"
                   "BazaIzmereni.'3В', BazaIzmereni.'3П', BazaIzmereni.'3О',"
                   "BazaIzmereni.'4В', BazaIzmereni.'4П', BazaIzmereni.'4О',"
                   "BazaIzmereni.'5В', BazaIzmereni.'5П', BazaIzmereni.'5О',"
                   "BazaIzmereni.'6В', BazaIzmereni.'6П', BazaIzmereni.'6О',"
                   "BazaIzmereni.'7В', BazaIzmereni.'7П', BazaIzmereni.'7О',"
                   "BazaIzmereni.'8В', BazaIzmereni.'8П', BazaIzmereni.'8О', "
                   "BazaIzmereni.'T1', BazaIzmereni.'T2', BazaIzmereni.'T3', BazaIzmereni.'T4', "
                   "BazaIzmereni.'T5', BazaIzmereni.'T6', BazaIzmereni.'T7', BazaIzmereni.'T8', "
                   "BazaIzmereni.Q, BazaIzmereni.P, BazaIzmereni.Примечания, BazaIzmereni.id_Baza "
         " FROM BazaIzmereni " + bazaizm_id_filter);
    while(this->canFetchMore()){
        this->fetchMore();
    }
    qDebug()<<"this->canFetchMore()"<<this->canFetchMore();
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

// Получение id из строки в модели представления данных
int ListModelIzmerOpenBI::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
