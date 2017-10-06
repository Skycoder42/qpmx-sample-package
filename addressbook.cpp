#include "addressbook.h"
#include <dialogmaster.h>
#include <QDebug>
#include <QFile>

#ifndef Q_OS_WIN
#ifdef QPMX_TEST_AVAILABLE
#warning You are compiling the package as source!
#endif
#endif

static bool startupCheck = false;

void _qpmx_local_startup_hook() //named the same on purpose
{
	qDebug() << "running startup hook";
	if(QFile::exists(QStringLiteral(":/testfile.txt")))
		startupCheck = true;
	else
		qCritical() << "Unable to find resource file!";
}
Q_COREAPP_STARTUP_FUNCTION(_qpmx_local_startup_hook)

AddressBook::AddressBook()
{
	if(!startupCheck)
		qFatal("startup hook was not run");
	else
		qDebug() << "startup status:" << startupCheck;
}

bool AddressBook::contains(const QString &name) const
{
	return _data.contains(name);
}

QHostAddress AddressBook::address(const QString &name) const
{
	return _data.value(name);
}

void AddressBook::add(const QString &name, const QHostAddress &address)
{
	_data.insert(name, address);
}

void AddressBook::remove(const QString &name)
{
	_data.remove(name);
}

void AddressBook::showAddressDialog(QWidget *parent)
{
	DialogMaster::information(parent, tr("<unimplemented>"), tr("Addresses"));
}
