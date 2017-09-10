#ifndef ADDRESSBOOK_H
#define ADDRESSBOOK_H

#include <QString>
#include <QHostAddress>
#include <QHash>
class QWidget;

class AddressBook
{
public:
	bool contains(const QString &name) const;
	QHostAddress address(const QString &name) const;
	
	void add(const QString &name, const QHostAddress &address);
	void remove(const QString &name);
	
	static void showAddressDialog(QWidget *parent = nullptr);
	
private:
	QHash<QString, QHostAddress> _data;
};

#endif //ADDRESSBOOK_H
