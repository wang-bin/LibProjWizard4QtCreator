TEMPLATE = subdirs
CONFIG += ordered
SUBDIRS = depends lib%ProjectName:l% test

lib%ProjectName:l%.file = src/lib%ProjectName%.pro
test.file = test/tst_%ProjectName%.pro
test.depends += lib%ProjectName:l%

OTHER_FILES += README

