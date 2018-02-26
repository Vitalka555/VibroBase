#ifndef MODELPODSH_H
#define MODELPODSH_H

#include <QObject>
#include <QSqlQueryModel>
#include <QSqlQuery>
#include <QDebug>

class ModelPodsh : public QSqlQueryModel
{
    using BaseClass = QSqlQueryModel;

    Q_OBJECT
    Q_PROPERTY(QString filter READ filter WRITE setFilter)
public:
    enum Roles {
        IdRole = Qt::UserRole + 1,
        podsh_obRURole,
        podsh_obENRole,
        podsh_dvnRole,
        podsh_dnarRole,
        podsh_bRole,
        podsh_dtkRole,
        podsh_ztkRole,
        podsh_aRole,
        podsh_massaRole,
        podsh_staticRole,
        podsh_dinamicRole,
        podsh_nameRole
    };

    explicit ModelPodsh(QObject *parent = 0);

    QString filter(){return filter_;}
    void setFilter(QString filter_in){filter_=filter_in;}

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

protected:
    QHash<int, QByteArray> roleNames() const;

signals:

public slots:
    void updateModel();
    int getId(int row);
public:
    QString filter_;
};
#endif // MODELPODSH_H
