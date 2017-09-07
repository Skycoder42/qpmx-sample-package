#include <addressbook.h>

int main(int argc, char *argv[])
{
	AddressBook book;

	book.add("home", QHostAddress::LocalHost);

	return 0;
}
