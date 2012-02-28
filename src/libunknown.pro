TEMPLATE = lib

QT += %CORE%%GUI%%OPENGL%%NETWORK%%XML%%XMLPATTERNS%%DBUS%%SCRIPT%%SCRIPTTOOLS%%SQL%%SVG%%WEBKIT%%PHONON%%MULTIMEDIA%%TEST%
@if "%GUI%" == ""
QT       -= gui
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


