#include "mainview.h"
#include "ui_mainview.h"
#include <QtNumeric>

MainView::MainView(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainView),
    server(new QTcpServer(this))
{
    ui->setupUi(this);
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

void MainView::StartServer() {
    server->
}

void MainView::StopServer() {

}
