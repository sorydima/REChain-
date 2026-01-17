export { hapTasks } from '@ohos/hvigor-ohos';
export { default as PluginConfig } from './hvigor/hvigor-config';

import { hapTasks, OhosHapContext, OhosPluginId } from '@ohos/hvigor-ohos';
import { getNode } from '@ohos/hvigor';

// REChain HarmonyOS Build Configuration
// Upgraded to support HarmonyOS 4.1.10+1160
export default {
  system: hapTasks,
  plugins: [OhosPluginId.OHOS_HAP_PLUGIN, OhosPluginId.OHOS_APP_PLUGIN],
  modelVersion: '5.0.1',
  dependencies: {}
};
