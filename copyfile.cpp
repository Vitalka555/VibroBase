#include "copyfile.h"
#include <QDebug>

copyfile::copyfile(QObject *parent) : QObject(parent)
{

}

bool copyfile::cppSlot()
{
    QObject* foto = this->parent()->findChild<QObject*>("foto");
    QObject* tf_foto = this->parent()->findChild<QObject*>("tf_foto");
    QString path1=(foto->property("path")).toString();
    QFileInfo fileInfo(path1);
    QString destinationFile = QDir::currentPath() + QString("/foto/") + fileInfo.fileName();
    qDebug() << destinationFile;
    path1.replace("file:///", "");
    qDebug() << "path1 = " << path1;
    bool result = QFile::copy(path1, destinationFile);
    qDebug() << result;
    tf_foto->setProperty("text", fileInfo.fileName());
    return result;
}

bool copyfile::cppSlot2()
{
    QObject* shema = this->parent()->findChild<QObject*>("shema");
    QObject* tf_shema = this->parent()->findChild<QObject*>("tf_shema");
    QString path1=(shema->property("path")).toString();
    QFileInfo fileInfo(path1);
    QString destinationFile = QDir::currentPath() + QString("/Shema/") + fileInfo.fileName();
    qDebug() << destinationFile;
    path1.replace("file:///", "");
    qDebug() << "path1 = " << path1;
    bool result = QFile::copy(path1, destinationFile);
    qDebug() << result;
    tf_shema->setProperty("text", fileInfo.fileName());
    return result;
}

bool copyfile::backupBase()
{
    QDir dir(QDir::currentPath() + QString("/backup"));
    if (!dir.exists()) {
        dir.mkpath(QDir::currentPath() + QString("/backup"));
    }
    QString path = QDir::currentPath()+"/settings.ini";
    QSettings settings(path, QSettings::IniFormat);
    settings.beginGroup("PathToFiles");
    QString pathToBase = settings.value("PathToBase", (QDir::currentPath() + QString("/base/sqlite.db"))).toString();
    settings.endGroup();
    QString pathToBackupBase = QDir::currentPath() + QString("/backup/") + QDateTime::currentDateTime().toString("'data_'dd_MM_yyyy_HH-mm-ss'.db'");
    bool result = QFile::copy(pathToBase, pathToBackupBase);
    return result;
}
