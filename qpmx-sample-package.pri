INCLUDEPATH += $$PWD

!qpmx_static: include($$PWD/qpmx-sample-package.prc)
else: QT += network widgets

HEADERS += $$PWD/addressbook.h

SOURCES += $$PWD/addressbook.cpp

QPMX_STARTUP_HOOKS += qpmx_sample_package_startupHook
RESOURCES += $$PWD/qpmx-sample-package.qrc

TRANSLATIONS += $$PWD/addressbook_de.ts

qpmx_static: CONFIG += qpmx_startup_hook
