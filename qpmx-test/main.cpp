#include <QCoreApplication>
#include <QDebug>
#include <addressbook.h>
#include <dialogmaster.h>

int main(int argc, char *argv[])
{
	QCoreApplication a(argc, argv);

	AddressBook book;
	book.add(QCoreApplication::translate("GLOBAL", "home"), QHostAddress::LocalHost);
	qDebug().noquote() << QCoreApplication::translate("GLOBAL", "home is:") << book.address(QCoreApplication::translate("GLOBAL", "home"));

	return 0;
}
