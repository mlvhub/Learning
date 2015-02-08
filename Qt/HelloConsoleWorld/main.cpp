#include <QCoreApplication>
#include <QDebug>

int main(int argc, char *argv[])
{
//    QCoreApplication a(argc, argv);

    int x = 20;
    QString msg = "QString rocks";
    qWarning().nospace() << "Hello Console" << x << msg;

//    return a.exec();
}
