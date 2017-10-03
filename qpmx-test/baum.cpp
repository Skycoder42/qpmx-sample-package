#include <QCoreApplication>
#include <QDebug>

extern int hook_counter;

static void _qpmx_local_startup_hook() {
	qDebug() << "another another hook";
	++hook_counter;
}
Q_COREAPP_STARTUP_FUNCTION(_qpmx_local_startup_hook)
