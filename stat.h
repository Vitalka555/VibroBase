#ifndef STAT_H
#define STAT_H

#include <QObject>
#include <QSqlQuery>
#include <QSqlQueryModel>
#include <QVariant>
//#include <QVector>
#include <QDebug>

class Stat : public QObject
{
    Q_OBJECT
    public:
    explicit Stat(QObject *parent = 0);
    //~Stat();

    QString date_begin;
    QString date_end;
    QString personal_select = "";
    int razmer_personal;
    QStringList personal;
    QString tipmeh_select = "";
    int razmer_tipmeh;
    QStringList tipmehanizmov;
signals:

public slots:
    void kolagr();
    void getdate();
    void getdate2();
    void getpersonal();
    void gettipmeh();
};

class ListModelStatIzmerAgr : public QSqlQueryModel
{
    Q_OBJECT
public:
    /* Перечисляем все роли, которые будут использоваться в TableView
     * Как видите, они должны лежать в памяти выше параметра Qt::UserRole
     * Связано с тем, что информация ниже этого адреса не для кастомизаций
     * */
    enum Roles {
        IdRole = Qt::UserRole + 1,      // id
        kksRole,
        totalRole,
        hhRole,
        nomRole,
        rdRole,
        pnrRole,
        pnrdopRole,
        eksplRole,
        ekspldopRole
    };

    // объявляем конструктор класса
    explicit ListModelStatIzmerAgr(QObject *parent = 0);

    // Переопределяем метод, который будет возвращать данные
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

protected:
    /* хешированная таблица ролей для колонок.
     * Метод используется в дебрях базового класса QAbstractItemModel,
     * от которого наследован класс QSqlQueryModel
     * */
    QHash<int, QByteArray> roleNames() const;

signals:

public slots:
    void updateModel();
    int getId(int row);
};

#endif // STAT_H
