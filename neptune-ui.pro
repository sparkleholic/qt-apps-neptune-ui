requires(linux:!android|win32-msvc2013:!winrt|win32-msvc2015:!winrt|osx|win32-g++*)

TEMPLATE = subdirs

include(config.pri)

SUBDIRS += plugins
SUBDIRS += doc

copydata.file = copydata.pro
copydata.depends = plugins

# HACK: CI does not have appman in dependency list, which is why
# we are not building the executable to avoid failing integration tests.
qtHaveModule(appman_main-private) {
   message("Module appman_main-private found.")
   SUBDIRS += src
   copydata.depends += src
} else {
   message("Module appman_main-private not found. Custom executable won't be build.")
}

SUBDIRS += copydata

# Install all required files
qml.files = apps imports sysui examples styles am-config.yaml Main.qml
qml.path = $$INSTALL_PREFIX/neptune
INSTALLS += qml

OTHER_FILES += $$files($$PWD/*.qml, true)
OTHER_FILES += $$PWD/plugins.yaml.in
PLUGINS_DIR = $$OUT_PWD/qml
QMAKE_SUBSTITUTES += $$PWD/plugins.yaml.in