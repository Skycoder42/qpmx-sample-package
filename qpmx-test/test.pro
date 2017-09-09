TEMPLATE = app

QT += core gui widgets

CONFIG += c++11 console
CONFIG -= app_bundle

SOURCES += \
	main.cpp

DISTFILES += qpmx.json

CONFIG += qpmx_verbose
include(/home/sky/Programming/QtProjects/qpmx/qpmx/qpmx.pri)
