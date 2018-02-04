#ifndef COPYFILE_H
#define COPYFILE_H
#include <QFileInfo>
#include <QDir>
#include <QObject>
#include <QVariant>
#include <QQuickImageProvider>
#include <QSettings>
#include <QDateTime>


class copyfile : public QObject
{
    Q_OBJECT
    public:
    explicit copyfile(QObject *parent = 0);
    //~copyfile();
    //bool HQt_CopyFile(QString filename, QString dir);
signals:

public slots:
    bool cppSlot();
    bool cppSlot2();
    bool backupBase();
};


#endif // COPYFILE_H
