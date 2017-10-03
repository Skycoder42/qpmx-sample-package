#include <QCoreApplication>
#include <QDebug>
#include <addressbook.h>
#include <dialogmaster.h>

int hook_counter = 0;
static void _qpmx_local_startup_hook() {
	qDebug() << "another hook";
	++hook_counter;
}
Q_COREAPP_STARTUP_FUNCTION(_qpmx_local_startup_hook)

int main(int argc, char *argv[])
{
	QCoreApplication a(argc, argv);
	Q_ASSERT_X(hook_counter == 2, Q_FUNC_INFO, "not all hooks with same names have been run");

	AddressBook book;
	book.add(QCoreApplication::translate("GLOBAL", "home"), QHostAddress::LocalHost);
	qDebug().noquote() << QCoreApplication::translate("GLOBAL", "home is:") << book.address(QCoreApplication::translate("GLOBAL", "home"));

	return 0;
}
