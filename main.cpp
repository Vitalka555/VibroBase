#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSqlQueryModel>
#include <QQuickStyle>
#include <QSettings>
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
#include "stat.h"
#include "modelpodsh.h"
#include "filterproxymodel.h"

static const int LOAD_TIME_MSEC = 3 * 1000;
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
#if defined(Q_OS_WIN)
    //QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    //QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setAttribute(Qt::AA_UseOpenGLES);
QApplication::setStyle("Material");
QQuickStyle::setStyle("Material");
    QApplication app(argc, argv);

    //QQuickStyle::setStyle("Material");

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



    //ListModel0 *model0 = new ListModel0();
    DataMapper *mapper = new DataMapper();
    DataMapper *mapper_maxlevel = new DataMapper();
    //mapper->setModel(model_openBO);
    DataMapper *mapper_izmer = new DataMapper();
    DataMapper *mapper_openBI = new DataMapper();
    DataMapper *mapper_norm_creatBI = new DataMapper();
    DataMapper *mapper_open_podsh = new DataMapper();

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
    engine.rootContext()->setContextProperty("mapper_open_podsh", mapper_open_podsh);
    engine.rootContext()->setContextProperty("database", &database);
    //engine.rootContext()->setContextProperty("applicationDirPath", QGuiApplication::applicationDirPath());
    //engine.setOfflineStoragePath("D:\\Projects\\build-V3_0-Desktop_Qt_5_10_0_MinGW_32bit4-Debug\\debug\\sqlite.db");
    //engine.addImageProvider(QLatin1String("imageprovider"), new MyImageProvider);



qmlRegisterType<ModelPodsh>("Podsh", 1, 0, "ModelPodsh");
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
//применяем настройки окна из ini
    QString path = QDir::currentPath()+"/settings.ini"; //путь хранения ini файла
        QSettings settings(path, QSettings::IniFormat);
        settings.beginGroup("WindowGeometry");
        int wwidth = settings.value("width", 1024).toInt();
        int hheight = settings.value("height", 768).toInt();
        int x = settings.value("x", 30).toInt();
        int y = settings.value("y", 30).toInt();
        settings.endGroup();
    QObject *rootObject = engine.rootObjects().first();
        rootObject->setProperty("width", wwidth);
        rootObject->setProperty("height", hheight);
        rootObject->setProperty("x", x);
        rootObject->setProperty("y", y);

    QObject* root = engine.rootObjects()[0];
ListModelOpenBO *model_openBO = new ListModelOpenBO(root);
ListModel1V *model_1V = new ListModel1V(root);
ListModelMaxLevel *model_maxlevel = new ListModelMaxLevel(root);
ListModelIzmer *model_izmer = new ListModelIzmer(root);
ListModelIzmerOpenBI *model_openBI = new ListModelIzmerOpenBI(root);
ListModelKKS *model_kks = new ListModelKKS(root);
ListModelNormCreatBI *model_norm_creatBI = new ListModelNormCreatBI(root);
ListModelStatIzmerAgr *model_stat = new ListModelStatIzmerAgr(root);
ListModelPodsh *model_podsh = new ListModelPodsh(root);
ListModelPodsh *model_podsh1 = new ListModelPodsh(root);
ListModelPodsh *model_podsh2 = new ListModelPodsh(root);
ListModelPodsh *model_podsh3 = new ListModelPodsh(root);
ListModelPodsh *model_podsh4 = new ListModelPodsh(root);
ListModelPodsh *model_podsh5 = new ListModelPodsh(root);
ListModelPodsh *model_podsh6 = new ListModelPodsh(root);
ListModelPodsh *model_podsh7 = new ListModelPodsh(root);
ListModelPodsh *model_podsh8 = new ListModelPodsh(root);
ListModelRaspPodsh *model_rasp_podsh = new ListModelRaspPodsh(root);
ListModelTipPodsh *model_tip_podsh = new ListModelTipPodsh(root);
ListModelOpenPodsh *model_open_podsh = new ListModelOpenPodsh(root);

ListModel *model0 = new ListModel(root);

        copyfile *copy= new copyfile(root);

        QObject::connect(root, SIGNAL(qmlSignal()),
                         copy, SLOT(cppSlot()));
        QObject::connect(root, SIGNAL(qmlSignal2()),
                         copy, SLOT(cppSlot2()));
        QObject::connect(root, SIGNAL(qmlBackup()),
                         copy, SLOT(backupBase()));
        Stat *statist = new Stat(root);
        QObject::connect(root, SIGNAL(qmlKolAgr()), statist, SLOT(kolagr()));
        QObject::connect(root, SIGNAL(qmlKolAgr()), model_stat, SLOT(updateModel()));
        QObject::connect(root, SIGNAL(qmlGetDate()), statist, SLOT(getdate()));
        QObject::connect(root, SIGNAL(qmlGetDate2()), statist, SLOT(getdate2()));
        QObject::connect(root, SIGNAL(qmlGetPersonal()), statist, SLOT(getpersonal()));
        QObject::connect(root, SIGNAL(qmlGetTipMeh()), statist, SLOT(gettipmeh()));
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
DataBase *datab = new DataBase(root);
        QObject::connect(root, SIGNAL(qmlSignalWritePath()), datab, SLOT(writeSettings()));//запись в settings.ini
        QObject::connect(root, SIGNAL(qmlSignalReadPath()), datab, SLOT(readSettings2()));//чтение из settings.ini
        QObject::connect(root, SIGNAL(qmlSignalWriteWindow()), datab, SLOT(writeSettingsWindow()));//запись геометрии окна в ini
        QObject::connect(root, SIGNAL(qmlPodsh()), model_podsh, SLOT(updateModel()));//загрузка в таблицу подшипников
        QObject::connect(root, SIGNAL(qmlFilterBearing1()), model_podsh1, SLOT(updateModel()));//фильтр в таблице подшипников
        QObject::connect(root, SIGNAL(qmlFilterBearing2()), model_podsh2, SLOT(updateModel()));//фильтр в таблице подшипников
        QObject::connect(root, SIGNAL(qmlFilterBearing3()), model_podsh3, SLOT(updateModel()));//фильтр в таблице подшипников
        QObject::connect(root, SIGNAL(qmlFilterBearing4()), model_podsh4, SLOT(updateModel()));//фильтр в таблице подшипников
        QObject::connect(root, SIGNAL(qmlFilterBearing5()), model_podsh5, SLOT(updateModel()));//фильтр в таблице подшипников
        QObject::connect(root, SIGNAL(qmlFilterBearing6()), model_podsh6, SLOT(updateModel()));//фильтр в таблице подшипников
        QObject::connect(root, SIGNAL(qmlFilterBearing7()), model_podsh7, SLOT(updateModel()));//фильтр в таблице подшипников
        QObject::connect(root, SIGNAL(qmlFilterBearing8()), model_podsh8, SLOT(updateModel()));//фильтр в таблице подшипников
        QObject::connect(root, SIGNAL(qmlSignal_bearing_id()), model_open_podsh, SLOT(updateModel()));//вытаскиваем данные конкретного подшипника
        QObject::connect(root, SIGNAL(qmlidkksForInsertBaseOpor()), model0, SLOT(idForBaseOpor()));//узнать id создаваемого агрегата для базы опор
        engine.rootContext()->setContextProperty("model0", model0);
        engine.rootContext()->setContextProperty("model_openBO", model_openBO);
        engine.rootContext()->setContextProperty("model_1V", model_1V);
        engine.rootContext()->setContextProperty("model_maxlevel", model_maxlevel);
        engine.rootContext()->setContextProperty("model_izmer", model_izmer);
        engine.rootContext()->setContextProperty("model_kks", model_kks);
        engine.rootContext()->setContextProperty("model_norm_creatBI", model_norm_creatBI);
        engine.rootContext()->setContextProperty("model_openBI", model_openBI);
        engine.rootContext()->setContextProperty("model_stat", model_stat);
        engine.rootContext()->setContextProperty("model_podsh", model_podsh);
        engine.rootContext()->setContextProperty("model_podsh1", model_podsh1);
        engine.rootContext()->setContextProperty("model_podsh2", model_podsh2);
        engine.rootContext()->setContextProperty("model_podsh3", model_podsh3);
        engine.rootContext()->setContextProperty("model_podsh4", model_podsh4);
        engine.rootContext()->setContextProperty("model_podsh5", model_podsh5);
        engine.rootContext()->setContextProperty("model_podsh6", model_podsh6);
        engine.rootContext()->setContextProperty("model_podsh7", model_podsh7);
        engine.rootContext()->setContextProperty("model_podsh8", model_podsh8);
        engine.rootContext()->setContextProperty("model_rasp_podsh", model_rasp_podsh);
        engine.rootContext()->setContextProperty("model_tip_podsh", model_tip_podsh);
        engine.rootContext()->setContextProperty("model_open_podsh", model_open_podsh);



//qmlRegisterType<model_podsh>("SQLHelper", 1, 0, "ListModelPodsh");

mapper->setModel(model_openBO);
mapper_izmer->setModel(model_izmer);
mapper_openBI->setModel(model_openBI);
mapper_norm_creatBI->setModel(model_norm_creatBI);
mapper_open_podsh->setModel(model_open_podsh);

//mapper_maxlevel->setModel(model_maxlevel);
//mapper_1V->setModel(model_1V);



//    if (engine.rootObjects().isEmpty())
//        return -1;

    return app.exec();
}
