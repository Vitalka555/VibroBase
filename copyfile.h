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
    //bool HQt_CopyFile(QString filename, QString dir);
signals:

public slots:
    bool cppSlot();
    bool cppSlot2();
};

//class MyImageProvider : public QQuickImageProvider
//{
//public:
//    MyImageProvider() :QQuickImageProvider(QQuickImageProvider::Image){}

//    QImage requestImage(const QString &id, QSize *size, const QSize &requestedSize)
//    {
//        QImage image(requestedSize, QImage::Format::Format_RGBA8888);

//        // ここでimageに対し処理を行う

//        return image;
//    }
//};

#endif // COPYFILE_H
