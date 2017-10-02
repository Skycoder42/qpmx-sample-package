#include "addressbook.h"
#include <dialogmaster.h>

#ifndef Q_OS_WIN
#ifdef QPMX_TEST_AVAILABLE
#warning You are compiling the package as source!
#endif
#endif

#ifndef QPMX_STARTUP_HOOK
#error qpmx startup not implemented
#define QPMX_STARTUP_HOOK(x)
#endif

static bool startupCheck = false;

static void startupHook()
{
	startupCheck = true;
}
QPMX_STARTUP_HOOK(startupHook)

AddressBook::AddressBook()
{
	Q_ASSERT_X(startupCheck, Q_FUNC_INFO, "startup function not called!");
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
