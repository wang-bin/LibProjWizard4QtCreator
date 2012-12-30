TEMPLATE = lib

QT += %CORE%%GUI%%OPENGL%%NETWORK%%XML%%XMLPATTERNS%%DBUS%%SCRIPT%%SCRIPTTOOLS%%SQL%%SVG%%WEBKIT%%PHONON%%MULTIMEDIA%%TEST%
@if "%GUI%" == ""
QT       -= gui
CONFIG   += console
CONFIG   -= app_bundle
@else
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets
@endif

CONFIG *= %ProjectName:l%-buildlib
#var with '_' can not pass to pri?
STATICLINK = %LINKTYPE%
PROJECTROOT = $$PWD/..
!include(lib%ProjectName%.pri): error(could not find lib%ProjectName%.pri)
preparePaths($$OUT_PWD/../out)

#src
unix: SOURCES += 
else:win32: SOURCES += 

SOURCES += %ProjectName:l%.cpp

HEADERS += %ProjectName:l%_global.h %ProjectName:l%.h


