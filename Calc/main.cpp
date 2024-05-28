#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include"calc_back.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<Calc_back>("Back_end", 1, 0, "Calc_back");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/calc/main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
