#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSqlQueryModel>
#include <QQuickStyle>
//#include <QtQuick>
//#include <QtQml>
//#include <QtQuickControls2>
//#include <QtQml/QQmlEngine>
//#include <QtQuick/QQuickView>

#include <QSplashScreen>
#include <QPainter>
#include <QTime>



#include "database.h"
#include "listmodel.h"
//#include "listmodel0.h"
#include "datamapper.h"
#include "copyfile.h"

static const int LOAD_TIME_MSEC = 5 * 1000;
static const int PROGRESS_X_PX = 210;
static const int PROGRESS_Y_PX = 200;
static const int PROGRESS_WIDTH_PX = 230;
static const int PROGRESS_HEIGHT_PX = 28;



int main(int argc, char *argv[])
{
    //QCoreApplication::setAttribute(Qt::AA_UseSoftwareOpenGL);
    //QLocale::setDefault(QLocale::C);
    //QLocale::setDefault(QLocale::C);
    //setlocale(LC_NUMERIC, "ru_RU.UTF-8");

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    //QCoreApplication::setAttribute(Qt::AA_UseOpenGLES);

    QApplication app(argc, argv);

    QQuickStyle::setStyle("Material");

    QPixmap pix( QDir::currentPath() + "/images/splash.png" );
        QSplashScreen splashScreen( pix );
        splashScreen.show();
        app.processEvents();

        QTime time;
        time.start();
        while( time.elapsed() < LOAD_TIME_MSEC ) {
            const int progress = static_cast< double >( time.elapsed() ) / LOAD_TIME_MSEC * 100.0;
            splashScreen.showMessage(
                QObject::trUtf8( "Загружено: %1%" ).arg( progress ),
                Qt::AlignBottom | Qt::AlignRight
            );

            QPainter painter;
            painter.begin( &pix );

            painter.fillRect(
                PROGRESS_X_PX,
                PROGRESS_Y_PX,
                progress / 100.0 * PROGRESS_WIDTH_PX,
                PROGRESS_HEIGHT_PX, Qt::black
            );

            painter.end();

            splashScreen.setPixmap( pix );
            app.processEvents();
        }

//        QLabel w;
//        w.resize( 200, 200 );
//        w.setText( QObject::trUtf8( "Приложение запущено!" ) );
//        w.setAlignment( Qt::AlignHCenter | Qt::AlignVCenter );
//        w.show();

        splashScreen.finish( &splashScreen );

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
    ListModelTipIzmer *model_tipizmer = new ListModelTipIzmer();
    ListModelLAES *model_laes = new ListModelLAES();
    ListModelATE *model_ate = new ListModelATE();
    //ListModelKKSfull *model_kksfull = new ListModelKKSfull();

    //ListModel1V *model_1V = new ListModel1V();


    //ListModel0 *model0 = new ListModel0();
    DataMapper *mapper = new DataMapper();
    DataMapper *mapper_maxlevel = new DataMapper();
    //mapper->setModel(model_openBO);
    DataMapper *mapper_izmer = new DataMapper();
    DataMapper *mapper_openBI = new DataMapper();
    DataMapper *mapper_norm_creatBI = new DataMapper();

    // Обеспечиваем доступ к модели и классу для работы с базой данных из QML
    //engine.rootContext()->setContextProperty("model0", model0);
    engine.rootContext()->setContextProperty("model_ceh", model_ceh);              //передача данных запроса таблицы имен цехов
    engine.rootContext()->setContextProperty("model_program", model_program);
    engine.rootContext()->setContextProperty("model_fio", model_fio);
    engine.rootContext()->setContextProperty("model_proizved", model_proizved);
    engine.rootContext()->setContextProperty("model_tippermeh", model_tippermeh);
    engine.rootContext()->setContextProperty("model_tipper", model_tipper);
    engine.rootContext()->setContextProperty("model_tipmeh", model_tipmeh);        //передача данных запроса таблицы имен типов исполнительных механизмов
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
    engine.rootContext()->setContextProperty("model_tipizmer", model_tipizmer);
    engine.rootContext()->setContextProperty("model_laes", model_laes);
    engine.rootContext()->setContextProperty("model_ate", model_ate);
    //engine.rootContext()->setContextProperty("model_kksfull", model_kksfull);

    //engine.rootContext()->setContextProperty("model_openBO", model_openBO);
    //engine.rootContext()->setContextProperty("model01", model0);
    engine.rootContext()->setContextProperty("mapper", mapper);
    engine.rootContext()->setContextProperty("mapper_maxlevel", mapper_maxlevel);
    engine.rootContext()->setContextProperty("mapper_izmer", mapper_izmer);
    engine.rootContext()->setContextProperty("mapper_openBI", mapper_openBI);
    engine.rootContext()->setContextProperty("mapper_norm_creatBI", mapper_norm_creatBI);
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
ListModelIzmerOpenBI *model_openBI = new ListModelIzmerOpenBI(root);
ListModelKKS *model_kks = new ListModelKKS(root);
ListModelNormCreatBI *model_norm_creatBI = new ListModelNormCreatBI(root);

ListModel *model0 = new ListModel(root);

        copyfile *copy= new copyfile(root);

        QObject::connect(root, SIGNAL(qmlSignal()),
                         copy, SLOT(cppSlot()));
        QObject::connect(root, SIGNAL(qmlSignal2()),
                         copy, SLOT(cppSlot2()));
QObject::connect(root, SIGNAL(qmlFilterBO()), model0, SLOT(updateModel()));                        //Загрузка в табл. "База оборудования" и фильтр по ней
QObject::connect(root, SIGNAL(qmlFilterBI()), model_izmer, SLOT(updateModel()));
QObject::connect(root, SIGNAL(qmlSignal_baza_id()), model_openBO, SLOT(updateModel()));
        QObject::connect(root, SIGNAL(qmlSignal_baza_id()), model_1V, SLOT(updateModel()));
        QObject::connect(root, SIGNAL(qmlSignal_baza_id()), model_maxlevel, SLOT(updateModel()));
        QObject::connect(root, SIGNAL(qmlSignal_bazaizmer()), model_maxlevel, SLOT(updateModel2()));
        QObject::connect(root, SIGNAL(qmlSignal_baza_id()), model_izmer, SLOT(updateModel()));
        QObject::connect(root, SIGNAL(qmlSignal_bazaizmer_id()), model_openBI, SLOT(updateModel()));
QObject::connect(root, SIGNAL(qmlKKS_filter()), model_kks, SLOT(updateModel()));
QObject::connect(root, SIGNAL(qmlNormCreatBI()), model_norm_creatBI, SLOT(updateModel()));
        //QObject::connect(root, SIGNAL(qmlSignal_rezhim()), model_1V, SLOT(updateModel()));
        engine.rootContext()->setContextProperty("model0", model0);
        engine.rootContext()->setContextProperty("model_openBO", model_openBO);
        engine.rootContext()->setContextProperty("model_1V", model_1V);
        engine.rootContext()->setContextProperty("model_maxlevel", model_maxlevel);
        engine.rootContext()->setContextProperty("model_izmer", model_izmer);
        engine.rootContext()->setContextProperty("model_kks", model_kks);
        engine.rootContext()->setContextProperty("model_norm_creatBI", model_norm_creatBI);
        engine.rootContext()->setContextProperty("model_openBI", model_openBI);
mapper->setModel(model_openBO);
mapper_izmer->setModel(model_izmer);
mapper_openBI->setModel(model_openBI);
mapper_norm_creatBI->setModel(model_norm_creatBI);
//mapper_maxlevel->setModel(model_maxlevel);
//mapper_1V->setModel(model_1V);



//    if (engine.rootObjects().isEmpty())
//        return -1;

    return app.exec();
}
