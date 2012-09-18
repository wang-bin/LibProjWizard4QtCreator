TEMPLATE = app

@if "%CONSOLE%" == "true"
CONFIG   += console
CONFIG   -= app_bundle
@endif

TARGET = tst_%ProjectName:l%
STATICLINK = %LINKTYPE%
PROJECTROOT = $$PWD/..
isEmpty(BUILD_DIR):BUILD_DIR=$$(BUILD_DIR)
isEmpty(BUILD_DIR):BUILD_DIR=$$[BUILD_DIR]
isEmpty(BUILD_DIR):BUILD_IN_SRC = yes

!isEmpty(BUILD_IN_SRC):BUILD_DIR=$$PROJECTROOT/out
include($${PROJECTROOT}/common.pri)

!isEmpty(BUILD_IN_SRC):BUILD_DIR=$$PROJECTROOT/out
include($$PROJECTROOT/src/lib%ProjectName%.pri)

#win32:LIBS += -lUser32

SOURCES += main.cpp
HEADERS += 

