#include <QtGui/QGuiApplication>
#include <QtQuick/QQuickView>
#include <auroraapp/auroraapp.h>
#include <webenginecontext.h>


int main(int argc, char *argv[])
{

    Aurora::WebView::WebEngineContext::StartProcess(argc, argv);
    QGuiApplication::instance()->setAttribute(Qt::AA_ShareOpenGLContexts);

    auto application = Aurora::Application::application(argc, argv);
    application->setOrganizationName("com.rechain");
    application->setApplicationName("pwa");

    auto view = Aurora::Application::createView();

    Aurora::WebView::WebEngineContext::InitBrowser();

    view->setSource(Aurora::Application::pathTo(QStringLiteral("qml/WebViewBrowser.qml")));
    view->show();


    return application->exec();
}
