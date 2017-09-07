TEMPLATE = app

QT += core
QT -= gui

CONFIG += c++11 console
CONFIG -= app_bundle

SOURCES += \
	main.cpp

CONFIG += qpmx_verbose
include(/home/sky/Programming/QtProjects/qpmx/qpmx/qpmx.pri)
