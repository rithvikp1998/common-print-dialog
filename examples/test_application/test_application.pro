QT       += widgets printsupport

TARGET = printTest
TEMPLATE = app

DEFINES += QT_DEPRECATED_WARNINGS

CONFIG += c++14

SOURCES += main.cpp\
        mainwindow.cpp

HEADERS  += mainwindow.h

FORMS    += mainwindow.ui

LIBS += -lQCPDialog

INCLUDEPATH += /usr/include/common-print-dialog
