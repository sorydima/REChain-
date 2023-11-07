import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:matrix/matrix.dart';

import 'package:rechainonline/pages/new_private_chat/new_private_chat_view.dart';
import 'package:rechainonline/pages/new_private_chat/qr_scanner_modal.dart';
import 'package:rechainonline/utils/adaptive_bottom_sheet.dart';
import 'package:rechainonline/utils/rechainonline_share.dart';
import 'package:rechainonline/utils/platform_infos.dart';
import 'package:rechainonline/utils/url_launcher.dart';
import 'package:rechainonline/widgets/matrix.dart';

class NewPrivateChat extends StatefulWidget {
  const NewPrivateChat({super.key});

  @override
  NewPrivateChatController createState() => NewPrivateChatController();
}

class NewPrivateChatController extends State<NewPrivateChat> {
  final TextEditingController controller = TextEditingController();
  final FocusNode textFieldFocus = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool loading = false;

  // remove leading matrix.to from text field in order to simplify pasting
  final List<TextInputFormatter> removeMatrixToFormatters = [
    FilteringTextInputFormatter.deny(NewPrivateChatController.prefix),
    FilteringTextInputFormatter.deny(NewPrivateChatController.prefixNoProtocol),
  ];

  static const Set<String> supportedSigils = {'@', '!', '#'};

  static const String prefix = 'https://matrix.to/#/';
  static const String prefixNoProtocol = 'matrix.to/#/';

  void submitAction([_]) async {
    controller.text = controller.text.trim();
    if (!formKey.currentState!.validate()) return;
    UrlLauncher(context, '$prefix${controller.text}').openMatrixToUrl();
  }

  String? validateForm(String? value) {
    if (value!.isEmpty) {
      return L10n.of(context)!.pleaseEnterAMatrixIdentifier;
    }
    if (!controller.text.isValidMatrixId ||
        !supportedSigils.contains(controller.text.sigil)) {
      return L10n.of(context)!.makeSureTheIdentifierIsValid;
    }
    if (controller.text == Matrix.of(context).client.userID) {
      return L10n.of(context)!.youCannotInviteYourself;
    }
    return null;
  }

  void inviteAction() => rechainonlineShare.shareInviteLink(context);

  void openScannerAction() async {
    if (PlatformInfos.isAndroid) {
      final info = await DeviceInfoPlugin().androidInfo;
      if (info.version.sdkInt < 21) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              L10n.of(context)!.unsupportedAndroidVersionLong,
            ),
          ),
        );
        return;
      }
    }
    await showAdaptiveBottomSheet(
      context: context,
      builder: (_) => QrScannerModal(
        onScan: (link) => UrlLauncher(context, link).openMatrixToUrl(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => NewPrivateChatView(this);
}
