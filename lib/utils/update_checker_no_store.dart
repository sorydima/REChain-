import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:http/http.dart';
import 'package:matrix/matrix.dart';
import 'package:path_provider/path_provider.dart';

import 'platform_infos.dart';

/// Helper class checking for the updates on platforms without the store releases
///
/// Currently, this is only on Windows