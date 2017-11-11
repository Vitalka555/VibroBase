#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSqlQueryModel>
#include <QQuickStyle>
//#include <QtQuick>
//#include <QtQml>
//#include <QtQuickControls2>
//#include <QtQml/QQmlEngine>
//#include <QtQuick/QQuickView>




#include "database.h"
#include "listmodel.h"
//#include "listmodel0.h"
#include "datamapper.h"
#include "copyfile.h"

int main(int argc, char *argv[])
{
    //QCoreApplication::setAttribute(Qt::AA_UseSoftwareOpenGL);
    //QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setAttribute(Qt::AA_UseOpenGLES);

    QGuiApplication app(argc, argv);
    QQuickStyle::setStyle("Material");

    QQmlApplicationEngine engine;
    DataBase database;
    database.connectToDataBase();
    // Объявляем и инициализируем модель данных
    //ListModel *model0 = new ListModel();
    ListModelCeh *model_ceh = new ListModelCeh();
    ListModelProgram *model_program = new ListModelProgram();
    ListModelFio *model_fio = new ListModelFio();
    ListModelProizved *model_proizved = new ListModelProizved();
    ListModelTippermeh *model_tippermeh = new ListModelTippermeh();
    ListModelTipper *model_tipper = new ListModelTipper();
    ListModelTipmeh *model_tipmeh = new ListModelTipmeh();
    ListModelPolozhenie *model_polozhenie = new ListModelPolozhenie();
    ListModelTipopory *model_tipopory = new ListModelTipopory();
    ListModelProizvmeh *model_proizvmeh = new ListModelProizvmeh();
    ListModelNormhh *model_normhh = new ListModelNormhh();
    ListModelNormnomed *model_normnomed = new ListModelNormnomed();
    ListModelNormnom *model_normnom = new ListModelNormnom();
    ListModelOgrnomed *model_ogrnomed = new ListModelOgrnomed();
    ListModelOgrnom *model_ogrnom = new ListModelOgrnom();
    ListModelOtkaznomed *model_otkaznomed = new ListModelOtkaznomed();
    ListModelOtkaznom *model_otkaznom = new ListModelOtkaznom();
    ListModelNormrded *model_normrded = new ListModelNormrded();
    ListModelNormrd *model_normrd = new ListModelNormrd();
    ListModelOgrrded *model_ogrrded = new ListModelOgrrded();
    ListModelOgrrd *model_ogrrd = new ListModelOgrrd();
    ListModelOtkazrded *model_otkazrded = new ListModelOtkazrded();
    ListModelOtkazrd *model_otkazrd = new ListModelOtkazrd();
    ListModelRezhim *model_rezhim = new ListModelRezhim();
    //ListModel1V *model_1V = new ListModel1V();


    //ListModel0 *model0 = new ListModel0();
    DataMapper *mapper = new DataMapper();
    DataMapper *mapper_maxlevel = new DataMapper();
    //mapper->setModel(model_openBO);
    DataMapper *mapper_izmer = new DataMapper();

    // Обеспечиваем доступ к модели и классу для работы с базой данных из QML
    //engine.rootContext()->setContextProperty("model0", model0);
    engine.rootContext()->setContextProperty("model_ceh", model_ceh);
    engine.rootContext()->setContextProperty("model_program", model_program);
    engine.rootContext()->setContextProperty("model_fio", model_fio);
    engine.rootContext()->setContextProperty("model_proizved", model_proizved);
    engine.rootContext()->setContextProperty("model_tippermeh", model_tippermeh);
    engine.rootContext()->setContextProperty("model_tipper", model_tipper);
    engine.rootContext()->setContextProperty("model_tipmeh", model_tipmeh);
    engine.rootContext()->setContextProperty("model_polozhenie", model_polozhenie);
    engine.rootContext()->setContextProperty("model_tipopory", model_tipopory);
    engine.rootContext()->setContextProperty("model_proizvmeh", model_proizvmeh);
    engine.rootContext()->setContextProperty("model_normhh", model_normhh);
    engine.rootContext()->setContextProperty("model_normnomed", model_normnomed);
    engine.rootContext()->setContextProperty("model_normnom", model_normnom);
    engine.rootContext()->setContextProperty("model_ogrnomed", model_ogrnomed);
    engine.rootContext()->setContextProperty("model_ogrnom", model_ogrnom);
    engine.rootContext()->setContextProperty("model_otkaznomed", model_otkaznomed);
    engine.rootContext()->setContextProperty("model_otkaznom", model_otkaznom);
    engine.rootContext()->setContextProperty("model_normrded", model_normrded);
    engine.rootContext()->setContextProperty("model_normrd", model_normrd);
    engine.rootContext()->setContextProperty("model_ogrrded", model_ogrrded);
    engine.rootContext()->setContextProperty("model_ogrrd", model_ogrrd);
    engine.rootContext()->setContextProperty("model_otkazrded", model_otkazrded);
    engine.rootContext()->setContextProperty("model_otkazrd", model_otkazrd);
    engine.rootContext()->setContextProperty("model_rezhim", model_rezhim);
    //engine.rootContext()->setContextProperty("model_openBO", model_openBO);
    //engine.rootContext()->setContextProperty("model01", model0);
    engine.rootContext()->setContextProperty("mapper", mapper);
    engine.rootContext()->setContextProperty("mapper_maxlevel", mapper_maxlevel);
    engine.rootContext()->setContextProperty("mapper_izmer", mapper_izmer);
    engine.rootContext()->setContextProperty("database", &database);
    //engine.rootContext()->setContextProperty("applicationDirPath", QGuiApplication::applicationDirPath());
    //engine.setOfflineStoragePath("D:\\Projects\\build-V3_0-Desktop_Qt_5_10_0_MinGW_32bit4-Debug\\debug\\sqlite.db");
    //engine.addImageProvider(QLatin1String("imageprovider"), new MyImageProvider);




    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    //engine.addImageProvider(QLatin1String("imageprovider"), new MyImageProvider);

    QObject* root = engine.rootObjects()[0];
ListModelOpenBO *model_openBO = new ListModelOpenBO(root);
ListModel1V *model_1V = new ListModel1V(root);
ListModelMaxLevel *model_maxlevel = new ListModelMaxLevel(root);
ListModelIzmer *model_izmer = new ListModelIzmer(root);
ListModel *model0 = new ListModel(root);

        copyfile *copy= new copyfile(root);

        QObject::connect(root, SIGNAL(qmlSignal()),
                         copy, SLOT(cppSlot()));
        QObject::connect(root, SIGNAL(qmlSignal2()),
                         copy, SLOT(cppSlot2()));
QObject::connect(root, SIGNAL(qmlFilterBO()), model0, SLOT(updateModel()));
        QObject::connect(root, SIGNAL(qmlSignal_baza_id()), model_openBO, SLOT(updateModel()));
        QObject::connect(root, SIGNAL(qmlSignal_baza_id()), model_1V, SLOT(updateModel()));
        QObject::connect(root, SIGNAL(qmlSignal_baza_id()), model_maxlevel, SLOT(updateModel()));
        QObject::connect(root, SIGNAL(qmlSignal_bazaizmer()), model_maxlevel, SLOT(updateModel2()));
        QObject::connect(root, SIGNAL(qmlSignal_baza_id()), model_izmer, SLOT(updateModel()));

        //QObject::connect(root, SIGNAL(qmlSignal_rezhim()), model_1V, SLOT(updateModel()));
        engine.rootContext()->setContextProperty("model0", model0);
        engine.rootContext()->setContextProperty("model_1V", model_1V);
        engine.rootContext()->setContextProperty("model_maxlevel", model_maxlevel);
        engine.rootContext()->setContextProperty("model_izmer", model_izmer);
mapper->setModel(model_openBO);
mapper_izmer->setModel(model_izmer);
//mapper_maxlevel->setModel(model_maxlevel);
//mapper_1V->setModel(model_1V);



//    if (engine.rootObjects().isEmpty())
//        return -1;

    return app.exec();
}
