import QtQuick 2.6
import Sailfish.Silica 1.0

CoverBackground {
    objectName: "coverBackground"

    CoverPlaceholder {
        objectName: "coverPlaceholder"
        text: appWindow.appName
        forceFit: true
        icon.source: Qt.resolvedUrl("../images/com.rechain.pwa.svg")
    }
}
