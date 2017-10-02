#ifndef ADDRESSBOOK_H
#define ADDRESSBOOK_H

#include <QString>
#include <QHostAddress>
#include <QHash>
#include <QCoreApplication>
class QWidget;

class AddressBook
{
	Q_DECLARE_TR_FUNCTIONS(AddressBook)

public:
	AddressBook();

	bool contains(const QString &name) const;
	QHostAddress address(const QString &name) const;

	void add(const QString &name, const QHostAddress &address);
	void remove(const QString &name);

	static void showAddressDialog(QWidget *parent = nullptr);

private:
	QHash<QString, QHostAddress> _data;
};

#endif //ADDRESSBOOK_H
