TARGET = com.rechain.pwa

CONFIG += \
    c++17 \
    link_pkgconfig \
    auroraapp_i18n \
    auroraapp

PKGCONFIG += aurorawebview

QMAKE_LFLAGS += -Wl,--no-as-needed
QMAKE_LFLAGS += '-Wl,-rpath,\'/usr/\$$LIB/cef\''

TRANSLATIONS += \
    translations/ru.auroraos.ChromiumBrowser.ts \
    translations/ru.auroraos.ChromiumBrowser-ru.ts

SOURCES += \
    src/WebViewBrowser.cpp

DISTFILES += \
    rpm/com.rechain.pwa.spec \
    translations/*.ts \
    com.rechain.pwa.desktop \
    LICENSE.BSD-3-Clause.md \
    CODE_OF_CONDUCT.md \
    CONTRIBUTING.md \
    AUTHORS.md \
    README.md \
    README.ru.md

AURORAAPP_ICONS = 86x86 108x108 128x128 172x172
