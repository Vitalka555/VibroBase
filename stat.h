#ifndef STAT_H
#define STAT_H

#include <QObject>
#include <QSqlQuery>
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

#endif // STAT_H
