#include "mainview.h"
#include "ui_mainview.h"
#include "QTcpServer"
#include "QTcpSocket"
#include "QMessageBox"

static int PORT_NUMBER = 2300;
static int WAIT_FOR_DATA_MS = 200;

MainView::MainView(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainView),
    server(new QTcpServer(this)),
    socket(nullptr)
{
    ui->setupUi(this);
    ui->btnStopServer->setEnabled(false);
    connect(server, &QTcpServer::newConnection, this, &MainView::ExchangeData);
}

MainView::~MainView()
{
    delete ui;
}

void MainView::on_btnStartServer_clicked()
{
    StartServer();
    ui->btnStartServer->setEnabled(false);
    ui->btnStopServer->setEnabled(true);
}

void MainView::on_btnStopServer_clicked()
{
    StopServer();
    ui->btnStartServer->setEnabled(true);
    ui->btnStopServer->setEnabled(false);
}

bool MainView::StartServer() {
    bool result = server->listen(QHostAddress::Any, PORT_NUMBER);
    if (!result) {
        QMessageBox::critical(this, tr("ECHO Server"), tr("Unable to start the server: %1").arg(server->errorString()));
    }
    return result;
}

void MainView::StopServer() {
    server->close();
    if (socket != nullptr && socket->isOpen()) {
        socket->close();
    }
}

void MainView::ExchangeData() {
    socket = server->nextPendingConnection();
    if (socket->isOpen()) {
        connect(socket, &QTcpSocket::readyRead, this, &MainView::EchoReadData);
    }
}

void MainView::EchoReadData() {
    socket->write("<echoserver>\n");
    QString result;
    while (!socket->atEnd()) {
        result.append(socket->readAll());
        socket->waitForReadyRead(WAIT_FOR_DATA_MS);
    }
    socket->write(qPrintable(result));
    socket->write("\n</echoserver>");
}
