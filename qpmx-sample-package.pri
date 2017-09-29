INCLUDEPATH += $$PWD

!qpmx_static: include($$PWD/qpmx-sample-package.prc)
else: QT += network widgets

HEADERS += $$PWD/addressbook.h
SOURCES += $$PWD/addressbook.cpp

TRANSLATIONS += $$PWD/addressbook_de.ts
