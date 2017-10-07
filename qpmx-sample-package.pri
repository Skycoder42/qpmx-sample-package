INCLUDEPATH += $$PWD

!qpmx_static: include($$PWD/qpmx-sample-package.prc)
else: QT += network widgets

HEADERS += $$PWD/addressbook.h

SOURCES += $$PWD/addressbook.cpp

RESOURCES += $$PWD/qpmx-sample-package.qrc

TRANSLATIONS += $$PWD/addressbook_de.ts
