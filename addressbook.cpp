#include "addressbook.h"

#ifdef QPMX_TEST_AVAILABLE
#warning You are compiling the package as source!
#endif

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
