#include "modelpodsh.h"

ModelPodsh::ModelPodsh(QObject *parent) :
    BaseClass(parent)
{
    this->updateModel();
}

QVariant ModelPodsh::data(const QModelIndex & index, int role) const {
    int columnId = role - Qt::UserRole - 1;
    QModelIndex modelIndex = this->index(index.row(), columnId);
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

QHash<int, QByteArray> ModelPodsh::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[podsh_obRURole] = "podsh_obRU";
    roles[podsh_obENRole] = "podsh_obEN";
    roles[podsh_dvnRole] = "podsh_dvn";
    roles[podsh_dnarRole] = "podsh_dnar";
    roles[podsh_bRole] = "podsh_b";
    roles[podsh_dtkRole] = "podsh_dtk";
    roles[podsh_ztkRole] = "podsh_ztk";
    roles[podsh_aRole] = "podsh_a";
    roles[podsh_massaRole] = "podsh_massa";
    roles[podsh_staticRole] = "podsh_static";
    roles[podsh_dinamicRole] = "podsh_dinamic";
    roles[podsh_nameRole] = "podsh_name";
    return roles;
}

void ModelPodsh::updateModel()
{
    QSqlDatabase db = QSqlDatabase::database();
    db.transaction();
    // Обновление производится SQL-запросом к базе данных
    this->setQuery("SELECT BasePodsh.id, BasePodsh.Oboznachenie, BasePodsh.OboznachenieEN, BasePodsh.dvnutr, BasePodsh.Dnaruzh, BasePodsh.B, "
                   "BasePodsh.dtk, BasePodsh.ztk, BasePodsh.Ugol, BasePodsh.Massa, BasePodsh.Static, BasePodsh.Dinamic, BasePodsh.Name "
                   "FROM BasePodsh WHERE BasePodsh.Oboznachenie LIKE '%"+filter_+"%' "
                   "ORDER BY BasePodsh.Oboznachenie");
    while(this->canFetchMore()){
        this->fetchMore();
    }
    db.commit();
    if(!db.commit()){
    db.rollback();
    }
}

int ModelPodsh::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
