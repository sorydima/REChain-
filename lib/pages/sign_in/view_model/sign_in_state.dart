// SPDX-FileCopyrightText: 2017-Present Dmitry Sorokin
// SPDX-FileCopyrightText: 2017-Present Contributors to the REChain

// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:rechainonline/pages/sign_in/view_model/model/public_homeserver_data.dart';
import 'package:material_ui/material_ui.dart';

class SignInState {
  PublicHomeserverData? selectedHomeserver;
  AsyncSnapshot<List<PublicHomeserverData>> publicHomeservers =
      const AsyncSnapshot.nothing();
  List<PublicHomeserverData> filteredPublicHomeservers = [];
  AsyncSnapshot<bool> loginLoading = const AsyncSnapshot.nothing();
}
