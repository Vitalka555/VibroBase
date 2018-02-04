#ifndef COPYFILE_H
#define COPYFILE_H
#include <QFileInfo>
#include <QDir>
#include <QObject>
#include <QVariant>
#include <QQuickImageProvider>


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
};


#endif // COPYFILE_H
