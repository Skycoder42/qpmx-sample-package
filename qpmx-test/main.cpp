#include <QCoreApplication>
#include <QDebug>
#include <addressbook.h>
#include <dialogmaster.h>

int main(int argc, char *argv[])
{
	QCoreApplication a(argc, argv);

	AddressBook book;
	book.add("home", QHostAddress::LocalHost);
	qDebug() << "home is:" << book.address("home");

	return 0;
}
