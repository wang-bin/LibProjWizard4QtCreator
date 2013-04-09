TEMPLATE = subdirs
CONFIG += ordered
SUBDIRS = depends lib%ProjectName:l% test

lib%ProjectName:l%.file = src/lib%ProjectName%.pro
test.file = test/tst_%ProjectName%.pro
test.depends += depends lib%ProjectName:l%

OTHER_FILES += README


#cache mkspecs. compare mkspec with cached one. if not equal, remove old cache to run new compile tests
#TODO: Qt5 does not have QMAKE_MKSPECS, use QMAKE_SPEC, QMAKE_XSPEC
mkspecs_build = $$[QMAKE_MKSPECS]
mkspecs_build ~= s,\\\\,/,g #avoid warning for '\'. qmake knows how to deal with '/'
!isEmpty(mkspecs_cached) {
    !isEqual(mkspecs_cached, $$mkspecs_build):CONFIG += recheck
} else {
    CONFIG += recheck
}

##TODO: BUILD_DIR=>BUILD_ROOT
#if not empty, it means the parent project may already set it
isEmpty(out_dir):out_dir = $$OUT_PWD
out_dir ~= s,\\\\,/,g #avoid warning for '\'. qmake knows how to deal with '/'
isEmpty(SOURCE_ROOT):SOURCE_ROOT = $$PWD
SOURCE_ROOT ~= s,\\\\,/,g #avoid warning for '\'. qmake knows how to deal with '/'
isEmpty(BUILD_DIR):BUILD_DIR=$$out_dir
message("BUILD_DIR=$$BUILD_DIR")

greaterThan(QT_MAJOR_VERSION, 4) {
    #recheck:write_file($$BUILD_DIR/.qmake.cache) #FIXME: empty_file result in no qtCompileTest result in cache
    load(configure)
} else {
    _QMAKE_CACHE_QT4_ = $$_QMAKE_CACHE_
    #_QMAKE_CACHE_QT4_ is built in and always not empty
    isEmpty(_QMAKE_CACHE_QT4_)|isEqual(_QMAKE_CACHE_QT4_,) {
        _QMAKE_CACHE_QT4_=$$BUILD_DIR/.qmake.cache
    }
    include(common.pri)
    #recheck:write_file($$BUILD_DIR/.qmake.cache) #FIXME: empty_file result in no qtCompileTest result in cache
    #use the following lines when building as a sub-project, write cache to this project src dir.
    #if build this project alone and do not have sub-project depends on this lib, those lines are not necessary
    ####ASSUME compile tests and .qmake.cache is in project out root dir
    #vars in .qmake.cache will affect all projects in subdirs, even if qmake's working dir is not in .qmake.cache dir
    #write_file($$BUILD_DIR/.qmake.cache) ##TODO: erase the existing lines!!
    include(configure.prf)
#clear config.log iff reconfigure is required
    write_file($$QMAKE_CONFIG_LOG)
    #cache() is available after include configure.prf
    #load(configure.prf) #what's the difference?
    message("cache: $$_QMAKE_CACHE_QT4_")
}
cache(BUILD_DIR, set, BUILD_DIR)
#cache(BUILD_ROOT, set, BUILD_DIR)
cache(SOURCE_ROOT, set, SOURCE_ROOT)
cache(mkspecs_cached, set, mkspecs_build)

#add your compile tests here. this will compile tests in config.tests
#qtCompileTest(avutil)|error("FFmpeg avutil is required, but compiler can not find it")


#TODO: qmake -config
!isEmpty(EssentialDepends)|!isEmpty(OptionalDepends) {
    message("To recheck the dependencies, run qmake with argument 'CONFIG+=recheck'")
}