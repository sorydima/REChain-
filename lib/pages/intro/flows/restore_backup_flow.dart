// SPDX-FileCopyrightText: 2017-Present Dmitry Sorokin
// SPDX-FileCopyrightText: 2017-Present Contributors to the REChain

// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:rechainonline/utils/file_selector.dart';
import 'package:rechainonline/widgets/future_loading_dialog.dart';
import 'package:rechainonline/widgets/matrix.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

Future<void> restoreBackupFlow(BuildContext context) async {
  final matrix = Matrix.of(context);
  final picked = await selectFiles(context);
  final file = picked.firstOrNull;
  if (file == null) return;

  if (!context.mounted) return;
  final result = await showFutureLoadingDialog(
    context: context,
    future: () async {
      final client = await matrix.getLoginClient();
      await client.database.importDump(
        String.fromCharCodes(await file.readAsBytes()),
      );
      await client.init(
        waitForFirstSync: false,
        waitUntilLoadCompletedLoaded: false,
      );
      matrix.initMatrix();
      return client.isLogged();
    },
  );

  if (result.result == true && context.mounted) {
    context.go('/rooms');
  }
}
