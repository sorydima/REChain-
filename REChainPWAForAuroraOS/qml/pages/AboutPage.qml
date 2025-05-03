import QtQuick 2.6
import Sailfish.Silica 1.0

Page {
    objectName: "aboutPage"

    SilicaFlickable {
        objectName: "flickable"
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column

            objectName: "column"
            anchors {
                left: parent.left
                right: parent.right
            }
            bottomPadding: Theme.horizontalPageMargin

            PageHeader {
                objectName: "pageHeader"
                title: qsTr("About Application")
            }

            Label {
                objectName: "readmeLabel"
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.horizontalPageMargin
                }
                color: palette.highlightColor
                font.pixelSize: Theme.fontSizeSmall
                textFormat: Text.RichText
                wrapMode: Text.WordWrap
                text: qsTr("<p>REChain ®️ 🪐 Платформа поощряет совместную коммуникацию с помощью таких функций, как потоки, позволяющие пользователям организовывать обсуждения и упрощать беседы. Включение опросов улучшает процессы принятия решений, способствуя быстрому и эффективному сбору отзывов. Кроме того, платформа поддерживает удобный интерфейс и товары!🚀</p>")
            }

            SectionHeader {
                objectName: "licenseHeader"
                text: qsTr("The 3-Clause BSD License")
            }

            Label {
                objectName: "licenseLabel"
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.horizontalPageMargin
                }
                color: palette.highlightColor
                font.pixelSize: Theme.fontSizeSmall
                textFormat: Text.RichText
                wrapMode: Text.WordWrap
                text: qsTr("<p><em>Please, send US an E-Mail to support@rechain.network for the build instructions! 👻 Copyright © 2019-2025 Need help? 🤔 Donate US! ⌛️ For tea, coffee! For the future of decentralized and distributed internet. We do cool and, in my opinion, useful things for the safety and security of users' personal data. And on a completely non-commercial basis! 😎 Email us! 👇 A Dmitry Sorokin production. All rights reserved. Powered by REChain ®️. 🪐 Copyright © 2019-2025 REChain, Inc REChain ® is a registered trademark support@rechain.network Please allow anywhere from 1 to 5 business days for E-mail responses! 💌 Our Stats! 👀 At the end of 2023, the number of downloads from the Open-Source Places, Apple AppStore, Google Play Market, and the REChain.Store, namely the Domestic application store from the REChain ®️ brand 🪐, а именно Отечественный магазин приложений от бренда REChain ®️ 🪐 ✨ exceeded 29 million downloads. 😈 👀</em></p>")
            }
        }
    }
}
