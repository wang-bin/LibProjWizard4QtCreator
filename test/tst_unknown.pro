TEMPLATE = app

@if "%CONSOLE%" == "true"
CONFIG   += console
CONFIG   -= app_bundle
@endif

TARGET = tst_%ProjectName:l%
include(../src/lib%ProjectName%.pri)

#win32:LIBS += -lUser32

SOURCES += main.cpp
HEADERS += 

