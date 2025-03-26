#include <flutter/flutter_aurora.h>
#include "generated_plugin_registrant.h"

int main(int argc, char *argv[]) {
    aurora::Initialize(argc, argv);
    aurora::RegisterPlugins();
    aurora::Launch();
    return 0;
}
