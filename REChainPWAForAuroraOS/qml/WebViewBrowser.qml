import QtQuick 2.6
import Sailfish.Silica 1.0
import "pages"

ApplicationWindow {
    id: appWindow

    readonly property string appName: qsTr("REChain PWA")

    objectName: "appWindow"
    allowedOrientations: defaultAllowedOrientations
    cover: Qt.resolvedUrl("cover/DefaultCoverPage.qml")
    initialPage: Component {
        MainPage {
        }
    }
}
