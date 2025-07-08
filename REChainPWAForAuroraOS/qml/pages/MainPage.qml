import QtQuick 2.6
import Sailfish.Silica 1.0
import ru.auroraos.WebView 1.0

Page {
    objectName: "mainPage"

    WebView {
        id: webView

        property string currentUrl: "https://chainapp.codemagic.app"

        objectName: "webView"
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: pageFooter.top
        }
        url: currentUrl

        TouchInput {
           enabled: true
        }

        KeyboardInput {
            enabled: true
        }
    }

    Item {
        id: pageFooter

        objectName: "pageFooter"
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        height: Math.max(aboutButton.height, urlField.height) + Theme.paddingMedium * 2

        IconButton {
            id: aboutButton

            objectName: "aboutButton"
            anchors {
                left: parent.left
                leftMargin: Theme.paddingMedium
                verticalCenter: parent.verticalCenter
            }
            icon {
                source: "image://theme/icon-m-about"
                sourceSize {
                    width: Theme.iconSizeMedium
                    height: Theme.iconSizeMedium
                }
            }

            onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
        }
    }
}
