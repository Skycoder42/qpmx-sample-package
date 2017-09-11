TEMPLATE = app

QT += core gui widgets network

CONFIG += c++11 console
CONFIG -= app_bundle

SOURCES += \
	main.cpp

DISTFILES += qpmx.json

QPMX_EXTRA_OPTIONS += --verbose

system(qpmx -d $$shell_quote($$_PRO_FILE_PWD_) init $$QPMX_EXTRA_OPTIONS $$shell_quote($$QMAKE_QMAKE) $$shell_quote($$OUT_PWD)):include($$OUT_PWD/qpmx_generated.pri)
else: error(qpmx initialization failed)

message($$SOURCES)
