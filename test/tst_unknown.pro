TEMPLATE = app

@if "%CONSOLE%" == "true"
CONFIG   += console
CONFIG   -= app_bundle
@endif

TARGET = tst_%ProjectName:l%
STATICLINK = %LINKTYPE%
PROJECTROOT = $$PWD/..
include($$PROJECTROOT/src/lib%ProjectName%.pri)
preparePaths($$OUT_PWD/../out)

#win32:LIBS += -lUser32

SOURCES += main.cpp
HEADERS += 

