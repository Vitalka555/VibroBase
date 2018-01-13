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
signals:

public slots:
    void kolagr();
};

#endif // STAT_H
