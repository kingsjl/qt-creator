IDE_BUILD_TREE = $$OUT_PWD/../../../
include(qworkbench.pri)

win32 {
	DLLDESTDIR = $$IDE_APP_PATH
}

DESTDIR = $$IDE_LIBRARY_PATH

macx {
        QMAKE_LFLAGS_SONAME = -Wl,-install_name,@executable_path/../PlugIns/
} else:linux-* {
    #do the rpath by hand since it's not possible to use ORIGIN in QMAKE_RPATHDIR
    QMAKE_RPATHDIR += \$\$ORIGIN
    IDE_PLUGIN_RPATH = $$join(QMAKE_RPATHDIR, ":")
    QMAKE_LFLAGS += -Wl,-z,origin \'-Wl,-rpath,$${IDE_PLUGIN_RPATH}\'
    QMAKE_RPATHDIR =
}

TARGET = $$qtLibraryTarget($$TARGET)

contains(QT_CONFIG, reduce_exports):CONFIG += hide_symbols

linux-* {
	target.path = $$LOCATION/lib/qtcreator
	INSTALLS += target
}