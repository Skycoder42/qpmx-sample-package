INCLUDEPATH += $$PWD

!qpmx_static: include($$PWD/qpmx-sample-package.prc)
else: QT += network

HEADERS += $$PWD/addressbook.h
SOURCES += $$PWD/addressbook.cpp
