TEMPLATE = app

@if "%CONSOLE%" == "true"
CONFIG   += console
CONFIG   -= app_bundle
@endif

TARGET = tst_%ProjectName:l%
PROJECTROOT = $$PWD/..
STATICLINK = %LINKTYPE%
include($$PROJECTROOT/src/lib%ProjectName%.pri)
include($${PROJECTROOT}/common.pri)  #remove it also works?

#win32:LIBS += -lUser32

SOURCES += main.cpp
HEADERS += 

