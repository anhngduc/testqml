#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<QQmlContext>
#include <QDebug>
#include "contactmodel.h"
#include "dialfilter.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<ContactModel>("Contact",1,0,"ContactModel");
    qmlRegisterType<DialFilter>("DialFilter",1,0,"FilterClass");
    qmlRegisterUncreatableType<DialFilter>("DialFilter",1,0,"FilterClass",
                                           QStringLiteral("DialFilter not create in QML"));

    DialFilter dialFilter;
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty(QStringLiteral("dialFilter"), &dialFilter);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();


}
