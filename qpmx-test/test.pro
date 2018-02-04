test_as_static {
	TEMPLATE = lib
	CONFIG += static
} else:test_as_shared {
	TEMPLATE = lib
} else {
	TEMPLATE = app
}

QT += core gui widgets network

CONFIG += c++11 console
CONFIG -= app_bundle

SOURCES += \
	main.cpp \
	baum.cpp

TRANSLATIONS += test_de.ts \
	$$PWD/test_en.ts

EXTRA_TRANSLATIONS += extra_de.ts

DISTFILES += qpmx.json \
	qpmx.json.src \
	qpmx.json.user.cm \
	$$TRANSLATIONS \
	$$EXTRA_TRANSLATIONS

target.path = $$[QT_INSTALL_BINS]
qpmx_ts_target.path = $$[QT_INSTALL_TRANSLATIONS]
INSTALLS += target qpmx_ts_target

QPMX_EXTRA_OPTIONS += --verbose --stderr --dev-cache "/tmp"
QPMX_TRANSLATE_EXTRA_OPTIONS += --verbose
QPMX_HOOK_EXTRA_OPTIONS += --verbose

qtPrepareTool(LRELEASE, lrelease)
LRELEASE += -nounfinished

system($$QMAKE_DEL_FILE $$shell_quote($$OUT_PWD)/qpmx_generated.pri))
!ReleaseBuild:!DebugBuild:!system(qpmx -d $$shell_quote($$_PRO_FILE_PWD_) --qmake-run init $$QPMX_EXTRA_OPTIONS $$shell_quote($$QMAKE_QMAKE) $$shell_quote($$OUT_PWD)): error(qpmx initialization failed)
else: include($$OUT_PWD/qpmx_generated.pri)

message(SOURCES = $$SOURCES)
message(TRANSLATIONS = $$TRANSLATIONS $$EXTRA_TRANSLATIONS)
message(CONFIG = $$CONFIG)
