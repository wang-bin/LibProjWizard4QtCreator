TEMPLATE = lib
%CONSOLE%QT -= gui
@if "%CONSOLE%" == "true"
CONFIG   += console
CONFIG   -= app_bundle
@endif

CONFIG *= %ProjectName:l%-buildlib

!include(lib%ProjectName%.pri): error(could not find lib%ProjectName%.pri)

#src
unix: SOURCES += 
else:win32: SOURCES += 

SOURCES += %ProjectName:l%.cpp

HEADERS += %ProjectName:l%_global.h %ProjectName:l%.h


