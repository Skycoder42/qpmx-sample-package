TEMPLATE = app

QT += core gui widgets network

CONFIG += c++11 console
CONFIG -= app_bundle

SOURCES += \
	main.cpp

TRANSLATIONS += test_de.ts \
	$$PWD/test_en.ts

DISTFILES += qpmx.json \
	qpmx.json.src \
	qpmx.json.user.cm \
	$$TRANSLATIONS

target.path = $$[QT_INSTALL_BINS]
qpmx_ts_target.path = $$[QT_INSTALL_TRANSLATIONS]
INSTALLS += target qpmx_ts_target

QPMX_EXTRA_OPTIONS += --verbose --stderr
QPMX_TRANSLATE_EXTRA_OPTIONS += --verbose
QPMX_HOOK_EXTRA_OPTIONS += --verbose

system(qpmx -d $$shell_quote($$_PRO_FILE_PWD_) --qmake-run init $$QPMX_EXTRA_OPTIONS $$shell_quote($$QMAKE_QMAKE) $$shell_quote($$OUT_PWD)): include($$OUT_PWD/qpmx_generated.pri)
else: error(qpmx initialization failed)

#debug to disable qpm-translate artifacts
QMAKE_EXTRA_TARGETS -= qpmlupdate qpmlrelease qpmlcombine

message(SOURCES = $$SOURCES)
message(TRANSLATIONS = $$TRANSLATIONS)
