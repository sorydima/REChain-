// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Esperanto (`eo`).
class L10nEo extends L10n {
  L10nEo([String locale = 'eo']) : super(locale);

  @override
  String get editImage => 'Edit image';

  @override
  String get rotateLeft => 'Rotate left';

  @override
  String get rotateRight => 'Rotate right';

  @override
  String get mirror => 'Mirror';

  @override
  String get save => 'Save';

  @override
  String get draw => 'Draw';

  @override
  String get undo => 'Undo';

  @override
  String get clear => 'Clear';

  @override
  String get eraser => 'Eraser';

  @override
  String get crop => 'Crop';

  @override
  String get repeatPassword => 'Repeat password';

  @override
  String get notAnImage => 'Not an image file.';

  @override
  String get remove => 'Forigi';

  @override
  String get importNow => 'Import now';

  @override
  String get importEmojis => 'Import Emojis';

  @override
  String get importFromZipFile => 'Import from .zip file';

  @override
  String get exportEmotePack => 'Export Emote pack as .zip';

  @override
  String get replace => 'Replace';

  @override
  String get about => 'Prio';

  @override
  String aboutHomeserver(String homeserver) {
    return 'About $homeserver';
  }

  @override
  String get accept => 'Akcepti';

  @override
  String acceptedTheInvitation(String username) {
    return '$username akceptis la inviton';
  }

  @override
  String get account => 'Konto';

  @override
  String get accountsAndSettings => 'Accounts and settings';

  @override
  String activatedEndToEndEncryption(String username) {
    return '$username aktivigis tutvojan ĉifradon';
  }

  @override
  String get addEmail => 'Aldoni retpoŝtadreson';

  @override
  String get confirmREChainId =>
      'Please confirm your REChain ID in order to delete your account.';

  @override
  String supposedMxid(String mxid) {
    return 'This should be $mxid';
  }

  @override
  String get addToSpace => 'Aldoni al aro';

  @override
  String get admin => 'Administranto';

  @override
  String get alias => 'kromnomo';

  @override
  String get all => 'Ĉio';

  @override
  String get commandHint_roomupgrade =>
      'Upgrade this room to the given room version';

  @override
  String get commandHint_googly => 'Send some googly eyes';

  @override
  String get commandHint_cuddle => 'Send a cuddle';

  @override
  String get commandHint_hug => 'Send a hug';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName sends you googly eyes';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName cuddles you';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName hugs you';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName respondis la vokon';
  }

  @override
  String get anyoneCanJoin => 'Ĉiu ajn povas aliĝi';

  @override
  String get appLock => 'Ŝlosado';

  @override
  String get appLockDescription =>
      'Lock the app when not using with a pin code';

  @override
  String get archive => 'Arĥivo';

  @override
  String get areGuestsAllowedToJoin => 'Ĉu gastoj rajtas aliĝi';

  @override
  String get areYouSure => 'Ĉu vi certas?';

  @override
  String get discardEdits => 'You have unsaved changes. Discard your edits?';

  @override
  String get areYouSureYouWantToLogout => 'Ĉu vi certe volas adiaŭi?';

  @override
  String get askSSSSSign =>
      'Por ke vi povu kontroli (subskribi) la alian personon, bonvolu enigi pasfrazon de via sekreta deponejo aŭ vian rehavan ŝlosilon.';

  @override
  String askVerificationRequest(String username) {
    return 'Ĉu akcepti ĉi tiun kontrolpeton de $username?';
  }

  @override
  String get autoplayImages =>
      'Memage ludi movbildajn glumarkojn kaj mienetojn';

  @override
  String badServerLoginTypesException(
    String serverVersions,
    String supportedVersions,
    Object suportedVersions,
  ) {
    return 'La hejmservilo subtenas la jenajn specojn de salutoj:\n$serverVersions\nSed ĉi tiu aplikaĵo subtenas nur:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Send typing notifications';

  @override
  String get swipeRightToLeftToReply => 'Swipe right to left to reply';

  @override
  String get sendOnEnter => 'Sendi per eniga klavo';

  @override
  String get noMoreChatsFound => 'No more chats found...';

  @override
  String get noChatsFoundHere =>
      'No chats found here yet. Start a new chat with someone by using the button below. ⤵️';

  @override
  String get unread => 'Unread';

  @override
  String get space => 'Space';

  @override
  String get banFromChat => 'Forbari de babilo';

  @override
  String get banned => 'Forbarita';

  @override
  String bannedUser(String username, String targetName) {
    return '$username forbaris uzanton $targetName';
  }

  @override
  String get blockDevice => 'Bloki aparaton';

  @override
  String get blocked => 'Blokita';

  @override
  String get cancel => 'Nuligi';

  @override
  String cantOpenUri(String uri) {
    return 'Ne povis malfermi URI $uri';
  }

  @override
  String get changeDeviceName => 'Ŝanĝi nomon de aparato';

  @override
  String changedTheChatAvatar(String username) {
    return '$username ŝanĝis bildon de la babilo';
  }

  @override
  String changedTheChatDescription(Object username) {
    return '$username changed the chat description';
  }

  @override
  String changedTheChatName(Object username) {
    return '$username changed the chat name';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username ŝanĝis permesojn pri la babilo';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username ŝanĝis sian prezentan nomon al: $username';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username ŝanĝis regulojn pri aliro de gastoj';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username ŝanĝis regulojn pri aliro de gastoj al: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username ŝanĝis videblecon de la historio';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username ŝanĝis videblecon de la historio al: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username ŝanĝis regulojn pri aliĝado';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username ŝanĝis regulojn pri aliĝado al: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username ŝanĝis sian profilbildon';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username ŝanĝis la kromnomojn de la ĉambro';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username ŝanĝis la invitan ligilon';
  }

  @override
  String get changePassword => 'Ŝanĝi pasvorton';

  @override
  String get changeTheHomeserver => 'Ŝanĝi hejmservilon';

  @override
  String get changeTheme => 'Ŝanĝu la haŭton';

  @override
  String get changeTheNameOfTheGroup => 'Ŝanĝi nomon de la grupo';

  @override
  String get changeYourAvatar => 'Ŝanĝi vian profilbildon';

  @override
  String get channelCorruptedDecryptError => 'La ĉifrado estas difektita';

  @override
  String get chat => 'Babilo';

  @override
  String get chatBackup => 'Savkopiado de babilo';

  @override
  String get chatDetails => 'Detaloj pri babilo';

  @override
  String get chats => 'Babiloj';

  @override
  String get chooseAStrongPassword => 'Elektu fortan pasvorton';

  @override
  String get clearArchive => 'Vakigi arĥivon';

  @override
  String get close => 'Fermi';

  @override
  String get commandHint_markasdm =>
      'Mark as direct message room for the giving REChain ID';

  @override
  String get commandHint_markasgroup => 'Mark as group';

  @override
  String get commandHint_ban => 'Forbari la donitan uzanton de ĉi tiu ĉambro';

  @override
  String get commandHint_clearcache => 'Clear cache';

  @override
  String get commandHint_create =>
      'Create an empty group chat\nUse --no-encryption to disable encryption';

  @override
  String get commandHint_discardsession => 'Discard session';

  @override
  String get commandHint_dm =>
      'Start a direct chat\nUse --no-encryption to disable encryption';

  @override
  String get commandHint_html => 'Sendi tekston formatan je HTML';

  @override
  String get commandHint_invite => 'Inviti la donitan uzanton al ĉi tiu ĉambro';

  @override
  String get commandHint_join => 'Aliĝi al la donita ĉambro';

  @override
  String get commandHint_kick => 'Forigi la donitan uzanton de ĉi tiu ĉambro';

  @override
  String get commandHint_leave => 'Foriri de ĉi tiu ĉambro';

  @override
  String get commandHint_me => 'Priskribu vian agon';

  @override
  String get commandHint_myroomavatar =>
      'Agordi vian profilbildon por ĉi tiu ĉambro (laŭ mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Agordi vian prezentan nomon en ĉi tiu ĉambro';

  @override
  String get commandHint_op =>
      'Agordi povnivelon de la donita uzanto (implicite: 50)';

  @override
  String get commandHint_plain => 'Sendi senformatan tekston';

  @override
  String get commandHint_react => 'Sendi respondon kiel reagon';

  @override
  String get commandHint_send => 'Sendi tekston';

  @override
  String get commandHint_unban =>
      'Malforbari la donitan uzanton de ĉi tiu ĉambro';

  @override
  String get commandInvalid => 'Nevalida ordono';

  @override
  String commandMissing(String command) {
    return '$command ne estas ordono.';
  }

  @override
  String get compareEmojiMatch =>
      'Komparu kaj certigu, ke la jenaj bildosignoj samas en ambaŭ aparatoj:';

  @override
  String get compareNumbersMatch =>
      'Komparu kaj certigu, ke la jenaj numeroj samas en ambaŭ aparatoj:';

  @override
  String get configureChat => 'Agordi babilon';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Kontakto invitiĝis al la grupo';

  @override
  String get contentHasBeenReported =>
      'La enhavo raportiĝis al la administrantoj de la servilo';

  @override
  String get copiedToClipboard => 'Kopiite al tondujo';

  @override
  String get copy => 'Kopii';

  @override
  String get copyToClipboard => 'Kopii al tondujo';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Ne povis malĉifri mesaĝon: $error';
  }

  @override
  String get checkList => 'Check list';

  @override
  String countParticipants(int count) {
    return '$count partoprenantoj';
  }

  @override
  String countInvited(int count) {
    return '$count invited';
  }

  @override
  String get create => 'Krei';

  @override
  String createdTheChat(String username) {
    return '$username kreis la babilon';
  }

  @override
  String get createGroup => 'Create group';

  @override
  String get createNewSpace => 'Nova aro';

  @override
  String get currentlyActive => 'Nun aktiva';

  @override
  String get darkTheme => 'Malhela';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String get deactivateAccountWarning =>
      'Ĉi tio malaktivigos vian konton de uzanto. Ne eblas tion malfari! Ĉu certe vi certas?';

  @override
  String get defaultPermissionLevel => 'Norma nivelo de permesoj';

  @override
  String get delete => 'Forigi';

  @override
  String get deleteAccount => 'Forigi konton';

  @override
  String get deleteMessage => 'Forigi mesaĝon';

  @override
  String get devices => 'Aparatoj';

  @override
  String get directChats => 'Rektaj babiloj';

  @override
  String get displaynameHasBeenChanged => 'Prezenta nomo ŝanĝiĝis';

  @override
  String get downloadFile => 'Elŝuti dosieron';

  @override
  String get edit => 'Redakti';

  @override
  String get editBlockedServers => 'Redakti blokitajn servilojn';

  @override
  String get chatPermissions => 'Chat permissions';

  @override
  String get editDisplayname => 'Redakti prezentan nomon';

  @override
  String get editRoomAliases => 'Ŝanĝi kromnomojn de ĉambro';

  @override
  String get editRoomAvatar => 'Redakti bildon de ĉambro';

  @override
  String get emoteExists => 'Mieneto jam ekzistas!';

  @override
  String get emoteInvalid => 'Nevalida mallongigo de mieneto!';

  @override
  String get emoteKeyboardNoRecents =>
      'Recently-used emotes will appear here...';

  @override
  String get globalChatId => 'Global chat ID';

  @override
  String get accessAndVisibility => 'Access and visibility';

  @override
  String get accessAndVisibilityDescription =>
      'Who is allowed to join this chat and how the chat can be discovered.';

  @override
  String get customEmojisAndStickers => 'Custom emojis and stickers';

  @override
  String get customEmojisAndStickersBody =>
      'Add or share custom emojis or stickers which can be used in any chat.';

  @override
  String get emoteShortcode => 'Mallongigo de mieneto';

  @override
  String get emptyChat => 'Malplena babilo';

  @override
  String get enableEmotesGlobally => 'Ŝalti mienetaron ĉie';

  @override
  String get enableEncryption => 'Ŝalti ĉifradon';

  @override
  String get enableEncryptionWarning =>
      'Vi ne povos malŝalti la ĉifradon. Ĉu vi certas?';

  @override
  String get encrypted => 'Ĉifrite';

  @override
  String get encryption => 'Ĉifrado';

  @override
  String get encryptionNotEnabled => 'Ĉifrado ne estas ŝaltita';

  @override
  String endedTheCall(String senderName) {
    return '$senderName finis la vokon';
  }

  @override
  String get enterAnEmailAddress => 'Enigu retpoŝtadreson';

  @override
  String errorObtainingLocation(String error) {
    return 'Eraris akirado de loko: $error';
  }

  @override
  String get fontSize => 'Grandeco de tiparo';

  @override
  String get forward => 'Plusendi';

  @override
  String get fromJoining => 'Ekde aliĝo';

  @override
  String get fromTheInvitation => 'Ekde la invito';

  @override
  String get group => 'Grupo';

  @override
  String get chatDescription => 'Chat description';

  @override
  String get chatDescriptionHasBeenChanged => 'Chat description changed';

  @override
  String get groupIsPublic => 'Grupo estas publika';

  @override
  String get groups => 'Grupoj';

  @override
  String groupWith(String displayname) {
    return 'Grupo kun $displayname';
  }

  @override
  String get guestsAreForbidden => 'Gastoj estas malpermesitaj';

  @override
  String get guestsCanJoin => 'Gastoj povas aliĝi';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username nuligis la inviton por $targetName';
  }

  @override
  String get help => 'Helpo';

  @override
  String get hideRedactedMessages => 'Hide redacted messages';

  @override
  String get hideRedactedMessagesBody =>
      'If someone redacts a message, this message won\'t be visible in the chat anymore.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Hide invalid or unknown message formats';

  @override
  String get block => 'Block';

  @override
  String get blockedUsers => 'Blocked users';

  @override
  String get blockListDescription =>
      'You can block users who are disturbing you. You won\'t be able to receive any messages or room invites from the users on your personal block list.';

  @override
  String get blockUsername => 'Ignore username';

  @override
  String get iHaveClickedOnLink => 'Mi klakis la ligilon';

  @override
  String get incorrectPassphraseOrKey => 'Neĝusta pasfrazo aŭ rehava ŝlosilo';

  @override
  String get inviteContact => 'Inviti kontakton';

  @override
  String inviteContactToGroup(String groupName) {
    return 'Inviti kontakton al $groupName';
  }

  @override
  String get noChatDescriptionYet => 'No chat description created yet.';

  @override
  String get tryAgain => 'Try again';

  @override
  String get invalidServerName => 'Invalid server name';

  @override
  String get invited => 'Invitita';

  @override
  String get redactMessageDescription =>
      'The message will be redacted for all participants in this conversation. This cannot be undone.';

  @override
  String get optionalRedactReason =>
      '(Optional) Reason for redacting this message...';

  @override
  String invitedUser(String username, String targetName) {
    return '$username invitis uzanton $targetName';
  }

  @override
  String get invitedUsersOnly => 'Nur invititoj';

  @override
  String inviteText(String username, String link) {
    return '$username invitis vin al REChain. \n1. Instalu la aplikaĵon REChain. https://github.com/sorydima/REChain- \n2. Registriĝu aŭ salutu \n3. Malfermu la invitan ligilon: $link';
  }

  @override
  String get isTyping => 'tajpas…';

  @override
  String joinedTheChat(String username) {
    return '$username aliĝis al la babilo';
  }

  @override
  String get joinRoom => 'Aliĝi al ĉambro';

  @override
  String kicked(String username, String targetName) {
    return '$username forpelis uzanton $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '$username forpelis kaj forbaris uzanton $targetName';
  }

  @override
  String get kickFromChat => 'Forpeli de babilo';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Lastafoje aktiva: $localizedTimeShort';
  }

  @override
  String get leave => 'Foriri';

  @override
  String get leftTheChat => 'Foriris de la ĉambro';

  @override
  String get lightTheme => 'Hela';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Enlegi $count pliajn partoprenantojn';
  }

  @override
  String get dehydrate => 'Export session and wipe device';

  @override
  String get dehydrateWarning =>
      'This action cannot be undone. Ensure you safely store the backup file.';

  @override
  String get hydrate => 'Restore from backup file';

  @override
  String get loadingPleaseWait => 'Enlegante… bonvolu atendi.';

  @override
  String get loadMore => 'Enlegi pli…';

  @override
  String get locationDisabledNotice =>
      'Location services are disabled. Please enable them to be able to share your location.';

  @override
  String get locationPermissionDeniedNotice =>
      'Location permission denied. Please grant them to be able to share your location.';

  @override
  String get login => 'Saluti';

  @override
  String logInTo(String homeserver) {
    return 'Saluti servilon $homeserver';
  }

  @override
  String get logout => 'Adiaŭi';

  @override
  String get mention => 'Mencii';

  @override
  String get messages => 'Mesaĝoj';

  @override
  String get messagesStyle => 'Messages:';

  @override
  String get moderator => 'Reguligisto';

  @override
  String get muteChat => 'Silentigi babilon';

  @override
  String get newChat => 'Nova babilo';

  @override
  String get newMessageInrechainonline => 'Nova mesaĝo en REChain';

  @override
  String get newVerificationRequest => 'Nova kontrolpeto!';

  @override
  String get next => 'Sekva';

  @override
  String get no => 'Ne';

  @override
  String get noConnectionToTheServer => 'Neniu konekto al la servilo';

  @override
  String get noEmotesFound => 'Neniuj mienetoj troviĝis. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Vi nur povas aktivigi ĉifradon kiam la ĉambro ne plu estas publike alirebla.';

  @override
  String get noGoogleServicesWarning =>
      'Ŝajnas, ke via telefono ne havas servojn de Google. Tio estas bona decido por via privateco! Por ricevadi pasivajn sciigojn en REChain. ni rekomendas, ke vi uzu la https://microg.org/ aŭ https://unifiedpush.org/.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 ne estas matriksa servilo, eble provu anstataŭe servilon $server2?';
  }

  @override
  String get shareInviteLink => 'Share invite link';

  @override
  String get scanQrCode => 'Scan QR code';

  @override
  String get noPasswordRecoveryDescription =>
      'Vi ankoraŭ ne aldonis manieron rehavi vian pasvorton.';

  @override
  String get noPermission => 'Neniu permeso';

  @override
  String get noRoomsFound => 'Neniuj ĉambroj troviĝis…';

  @override
  String get notifications => 'Sciigoj';

  @override
  String numUsersTyping(int count) {
    return '$count uzantoj tajpas…';
  }

  @override
  String get obtainingLocation => 'Akirante lokon…';

  @override
  String get ok => 'bone';

  @override
  String get onlineKeyBackupEnabled =>
      'Enreta savkopiado de ŝlosiloj estas ŝaltita';

  @override
  String get oopsPushError =>
      'Oj! Bedaŭrinde eraris la agordado de pasivaj sciigoj.';

  @override
  String get oopsSomethingWentWrong => 'Oj! Io misokazis…';

  @override
  String get openAppToReadMessages => 'Malfermu la aplikaĵon por legi mesaĝojn';

  @override
  String get openCamera => 'Malfermi fotilon';

  @override
  String get oneClientLoggedOut => 'One of your clients has been logged out';

  @override
  String get addAccount => 'Add account';

  @override
  String get editBundlesForAccount => 'Edit bundles for this account';

  @override
  String get addToBundle => 'Add to bundle';

  @override
  String get removeFromBundle => 'Remove from this bundle';

  @override
  String get bundleName => 'Bundle name';

  @override
  String get openInMaps => 'Open in maps';

  @override
  String get link => 'Link';

  @override
  String get or => 'Aŭ';

  @override
  String get participant => 'Partoprenanto';

  @override
  String get passphraseOrKey => 'pasfrazo aŭ rehava ŝlosilo';

  @override
  String get password => 'Pasvorto';

  @override
  String get passwordForgotten => 'Forgesita pasvorto';

  @override
  String get passwordHasBeenChanged => 'Pasvorto ŝanĝiĝis';

  @override
  String get passwordRecoverySettings => 'Password recovery settings';

  @override
  String get passwordRecovery => 'Rehavo de pasvorto';

  @override
  String get pin => 'Fiksi';

  @override
  String get pleaseChooseAPasscode => 'Bonvolu elekti paskodon';

  @override
  String get pleaseClickOnLink =>
      'Bonvolu klaki la ligilon en la retletero kaj pluiĝi.';

  @override
  String get pleaseEnterYourPassword => 'Bonvolu enigi vian pasvorton';

  @override
  String get pleaseEnterYourPin =>
      'Bonvolu enigi vian personan identigan numeron';

  @override
  String get pleaseEnterYourUsername => 'Bonvolu enigi vian uzantonomon';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Bonvolu sekvi la instrukciojn de la retejo kaj tuŝetu al «Sekva».';

  @override
  String get privacy => 'Privateco';

  @override
  String get publicRooms => 'Publikaj ĉambroj';

  @override
  String get reason => 'Kialo';

  @override
  String redactedBy(String username) {
    return 'Redacted by $username';
  }

  @override
  String redactedByBecause(String username, String reason) {
    return 'Redacted by $username because: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username obskurigis eventon';
  }

  @override
  String get redactMessage => 'Obskurigi mesaĝon';

  @override
  String get reject => 'Rifuzi';

  @override
  String rejectedTheInvitation(String username) {
    return '$username rifuzis la inviton';
  }

  @override
  String get removeAllOtherDevices => 'Forigi ĉiujn aliajn aparatojn';

  @override
  String get unbanFromChat => 'Malforbari';

  @override
  String get removeYourAvatar => 'Forigi vian profilbildon';

  @override
  String get replaceRoomWithNewerVersion =>
      'Anstataŭigi ĉambron per nova versio';

  @override
  String get reply => 'Respondi';

  @override
  String get reportMessage => 'Raporti mesaĝon';

  @override
  String get roomHasBeenUpgraded => 'Ĉambro gradaltiĝis';

  @override
  String sendingFilesDoNotExit(int count) {
    return 'Sending $count files... Please do not exit!';
  }

  @override
  String get roomVersion => 'Versio de ĉambro';

  @override
  String get compressingVideo => 'Compressing video...';

  @override
  String get saveFile => 'Konservi dosieron';

  @override
  String get search => 'Serĉi';

  @override
  String get security => 'Sekureco';

  @override
  String get send => 'Sendi';

  @override
  String get sendAMessage => 'Sendi mesaĝon';

  @override
  String get sendAsText => 'Sendi kiel tekston';

  @override
  String get sendAudio => 'Sendi sondosieron';

  @override
  String get sendFile => 'Sendi dosieron';

  @override
  String get sendImage => 'Sendi bildon';

  @override
  String sendImages(int count) {
    return 'Send $count image';
  }

  @override
  String get sendMessages => 'Sendi mesaĝojn';

  @override
  String get sendVideo => 'Sendi filmon';

  @override
  String sentAFile(String username) {
    return '$username sendis dosieron';
  }

  @override
  String sentAnAudio(String username) {
    return '$username sendis sondosieron';
  }

  @override
  String sentAPicture(String username) {
    return '$username sendis bildon';
  }

  @override
  String sentASticker(String username) {
    return '$username sendis glumarkon';
  }

  @override
  String sentAVideo(String username) {
    return '$username sendis filmon';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName sendis informojn pri voko';
  }

  @override
  String get setAsCanonicalAlias => 'Agordi kiel ĉefan kromnomon';

  @override
  String get setChatDescription => 'Set chat description';

  @override
  String get setStatus => 'Agordi staton';

  @override
  String get settings => 'Agordoj';

  @override
  String get share => 'Konigi';

  @override
  String sharedTheLocation(String username) {
    return '$username konigis sian lokon';
  }

  @override
  String get shareLocation => 'Konigi lokon';

  @override
  String get skip => 'Preterpasi';

  @override
  String get sourceCode => 'Fontkodo';

  @override
  String get spaceIsPublic => 'Aro estas publika';

  @override
  String get spaceName => 'Nomo de aro';

  @override
  String startedACall(String senderName) {
    return '$senderName komencis vokon';
  }

  @override
  String get status => 'Stato';

  @override
  String get statusExampleMessage => 'Kiel vi fartas?';

  @override
  String get submit => 'Sendi';

  @override
  String get synchronizingPleaseWait => 'Spegulante… Bonvolu atendi.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Synchronizing… ($percentage%)';
  }

  @override
  String get systemTheme => 'Sistema';

  @override
  String get theyDontMatch => 'Ili ne akordas';

  @override
  String get theyMatch => 'Ili akordas';

  @override
  String get tooManyRequestsWarning =>
      'Tro multaj petoj. Bonvolu reprovi poste!';

  @override
  String get tryToSendAgain => 'Reprovi sendi';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username malforbaris uzanton $targetName';
  }

  @override
  String get unblockDevice => 'Malbloki aparaton';

  @override
  String get unknownDevice => 'Nekonata aparato';

  @override
  String get unknownEncryptionAlgorithm => 'Nekonata ĉifra algoritmo';

  @override
  String unknownEvent(String type) {
    return 'Nekonata evento «$type»';
  }

  @override
  String get unmuteChat => 'Malsilentigi babilon';

  @override
  String get unpin => 'Malfiksi';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username kaj $count aliaj tajpas…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username kaj $username2 tajpas…';
  }

  @override
  String userIsTyping(String username) {
    return '$username tajpas…';
  }

  @override
  String userLeftTheChat(String username) {
    return '$username foriris de la babilo';
  }

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username sendis eventon de speco $type';
  }

  @override
  String get unverified => 'Unverified';

  @override
  String get verified => 'Kontrolita';

  @override
  String get verifyStart => 'Komenci kontrolon';

  @override
  String get verifySuccess => 'Vi sukcese kontrolis!';

  @override
  String get verifyTitle => 'Kontrolante alian konton';

  @override
  String get visibilityOfTheChatHistory => 'Videbleco de historio de la babilo';

  @override
  String get visibleForAllParticipants => 'Videbla al ĉiuj partoprenantoj';

  @override
  String get visibleForEveryone => 'Videbla al ĉiuj';

  @override
  String get voiceMessage => 'Voĉmesaĝo';

  @override
  String get waitingPartnerAcceptRequest =>
      'Atendante konfirmon de peto de la kunulo…';

  @override
  String get waitingPartnerEmoji =>
      'Atendante akcepton de la bildosignoj de la kunulo…';

  @override
  String get waitingPartnerNumbers =>
      'Atendante akcepton de la numeroj, de la kunulo…';

  @override
  String get warning => 'Averto!';

  @override
  String get weSentYouAnEmail => 'Ni sendis retleteron al vi';

  @override
  String get whoCanPerformWhichAction => 'Kiu povas kion';

  @override
  String get whoIsAllowedToJoinThisGroup => 'Kiu rajtas aliĝi al ĉi tiu grupo';

  @override
  String get whyDoYouWantToReportThis => 'Kial vi volas tion ĉi raporti?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Per tiuj ĉi adresoj vi povas rehavi vian pasvorton.';

  @override
  String get writeAMessage => 'Skribi mesaĝon…';

  @override
  String get yes => 'Jes';

  @override
  String get you => 'Vi';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Vi ne plu partoprenas ĉi tiun babilon';

  @override
  String get yourPublicKey => 'Via publika ŝlosilo';

  @override
  String get messageInfo => 'Message info';

  @override
  String get time => 'Time';

  @override
  String get sender => 'Sender';

  @override
  String get openGallery => 'Open gallery';

  @override
  String get removeFromSpace => 'Remove from space';

  @override
  String get markAsRead => 'Mark as read';

  @override
  String get reportUser => 'Report user';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender reacted with $reaction';
  }

  @override
  String get pinMessage => 'Pin to room';

  @override
  String get confirmEventUnpin =>
      'Are you sure to permanently unpin the event?';

  @override
  String get emojis => 'Emojis';

  @override
  String get unsupportedAndroidVersion => 'Unsupported Android version';

  @override
  String get unsupportedAndroidVersionLong =>
      'This feature requires a newer Android version. Please check for updates or Mobile Katya OS support.';

  @override
  String get youRejectedTheInvitation => 'You rejected the invitation';

  @override
  String get youJoinedTheChat => 'You joined the chat';

  @override
  String get youAcceptedTheInvitation => '👍 You accepted the invitation';

  @override
  String youBannedUser(String user) {
    return 'You banned $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'You have withdrawn the invitation for $user';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 You have been invited by $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 You invited $user';
  }

  @override
  String youKicked(String user) {
    return '👞 You kicked $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 You kicked and banned $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'You unbanned $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user has knocked';
  }

  @override
  String get usersMustKnock => 'Users must knock';

  @override
  String get noOneCanJoin => 'No one can join';

  @override
  String get knock => 'Knock';

  @override
  String get users => 'Users';

  @override
  String get storeInAndroidKeystore => 'Store in Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Store in Apple KeyChain';

  @override
  String get storeSecurlyOnThisDevice => 'Store securely on this device';

  @override
  String countFiles(int count) {
    return '$count files';
  }

  @override
  String get user => 'User';

  @override
  String get custom => 'Custom';

  @override
  String get whyIsThisMessageEncrypted => 'Why is this message unreadable?';

  @override
  String get noKeyForThisMessage =>
      'This can happen if the message was sent before you have signed in to your account at this device.\n\nIt is also possible that the sender has blocked your device or something went wrong with the internet connection.\n\nAre you able to read the message on another session? Then you can transfer the message from it! Go to Settings > Devices and make sure that your devices have verified each other. When you open the room the next time and both sessions are in the foreground, the keys will be transmitted automatically.\n\nDo you not want to lose the keys when logging out or switching devices? Make sure that you have enabled the chat backup in the settings.';

  @override
  String get newSpace => 'New space';

  @override
  String get doNotShowAgain => 'Do not show again';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Empty chat (was $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Spaces allows you to consolidate your chats and build private or public communities.';

  @override
  String get encryptThisChat => 'Encrypt this chat';

  @override
  String get disableEncryptionWarning =>
      'For security reasons you can not disable encryption in a chat, where it has been enabled before.';

  @override
  String get sorryThatsNotPossible => 'Sorry... that is not possible';

  @override
  String get reopenChat => 'Reopen chat';

  @override
  String get noBackupWarning =>
      'Warning! Without enabling chat backup, you will lose access to your encrypted messages. It is highly recommended to enable the chat backup first before logging out.';

  @override
  String get noOtherDevicesFound => 'No other devices found';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Unable to send! The server only supports attachments up to $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'File has been saved at $path';
  }

  @override
  String get jumpToLastReadMessage => 'Jump to last read message';

  @override
  String get readUpToHere => 'Read up to here';

  @override
  String get jump => 'Jump';

  @override
  String get openLinkInBrowser => 'Open link in browser';

  @override
  String get reportErrorDescription =>
      '😭 Oh no. Something went wrong. If you want, you can report this bug to the developers.';

  @override
  String get report => 'report';

  @override
  String get setColorTheme => 'Set color theme:';

  @override
  String get invite => 'Invite';

  @override
  String get inviteGroupChat => '📨 Group chat invite';

  @override
  String get invalidInput => 'Invalid input!';

  @override
  String wrongPinEntered(int seconds) {
    return 'Wrong pin entered! Try again in $seconds seconds...';
  }

  @override
  String get pleaseEnterANumber => 'Please enter a number greater than 0';

  @override
  String get archiveRoomDescription =>
      'The chat will be moved to the archive. Other users will be able to see that you have left the chat.';

  @override
  String get roomUpgradeDescription =>
      'The chat will then be recreated with the new room version. All participants will be notified that they need to switch to the new chat. You can find out more about room versions at https://spec.matrix.org/latest/rooms/';

  @override
  String get removeDevicesDescription =>
      'You will be logged out of this device and will no longer be able to receive messages.';

  @override
  String get banUserDescription =>
      'The user will be banned from the chat and will not be able to enter the chat again until they are unbanned.';

  @override
  String get unbanUserDescription =>
      'The user will be able to enter the chat again if they try.';

  @override
  String get kickUserDescription =>
      'The user is kicked out of the chat but not banned. In public chats, the user can rejoin at any time.';

  @override
  String get makeAdminDescription =>
      'Once you make this user admin, you may not be able to undo this as they will then have the same permissions as you.';

  @override
  String get pushNotificationsNotAvailable =>
      'Push notifications not available';

  @override
  String get learnMore => 'Learn more';

  @override
  String get yourGlobalUserIdIs => 'Your global user-ID is: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Unfortunately no user could be found with \"$query\". Please check whether you made a typo.';
  }

  @override
  String get knocking => 'Knocking';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Chat can be discovered via the search on $server';
  }

  @override
  String get searchChatsRooms => 'Search for #chats, @users...';

  @override
  String get nothingFound => 'Nothing found...';

  @override
  String get groupName => 'Group name';

  @override
  String get createGroupAndInviteUsers => 'Create a group and invite users';

  @override
  String get groupCanBeFoundViaSearch => 'Group can be found via search';

  @override
  String get wrongRecoveryKey =>
      'Sorry... this does not seem to be the correct recovery key.';

  @override
  String get commandHint_sendraw => 'Send raw json';

  @override
  String get databaseMigrationTitle => 'Database is optimized';

  @override
  String get databaseMigrationBody => 'Please wait. This may take a moment.';

  @override
  String get leaveEmptyToClearStatus => 'Leave empty to clear your status.';

  @override
  String get select => 'Select';

  @override
  String get searchForUsers => 'Search for @users...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Please enter your current password';

  @override
  String get newPassword => 'New password';

  @override
  String get pleaseChooseAStrongPassword => 'Please choose a strong password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get passwordIsWrong => 'Your entered password is wrong';

  @override
  String get publicChatAddresses => 'Public chat addresses';

  @override
  String get createNewAddress => 'Create new address';

  @override
  String get joinSpace => 'Join space';

  @override
  String get publicSpaces => 'Public spaces';

  @override
  String get addChatOrSubSpace => 'Add chat or sub space';

  @override
  String get thisDevice => 'This device:';

  @override
  String get initAppError => 'An error occured while init the app';

  @override
  String searchIn(String chat) {
    return 'Search in chat \"$chat\"...';
  }

  @override
  String get searchMore => 'Search more...';

  @override
  String get gallery => 'Gallery';

  @override
  String get files => 'Files';

  @override
  String sessionLostBody(String url, String error) {
    return 'Your session is lost. Please report this error to the developers at $url. The error message is: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'The app now tries to restore your session from the backup. Please report this error to the developers at $url. The error message is: $error';
  }

  @override
  String get sendReadReceipts => 'Send read receipts';

  @override
  String get sendTypingNotificationsDescription =>
      'Other participants in a chat can see when you are typing a new message.';

  @override
  String get sendReadReceiptsDescription =>
      'Other participants in a chat can see when you have read a message.';

  @override
  String get formattedMessages => 'Formatted messages';

  @override
  String get formattedMessagesDescription =>
      'Display rich message content like bold text using markdown.';

  @override
  String get verifyOtherUser => '🔐 Verify other user';

  @override
  String get verifyOtherUserDescription =>
      'If you verify another user, you can be sure that you know who you are really writing to. 💪\n\nWhen you start a verification, you and the other user will see a popup in the app. There you will then see a series of emojis or numbers that you have to compare with each other.\n\nThe best way to do this is to meet up or start a video call. 👭';

  @override
  String get verifyOtherDevice => '🔐 Verify other device';

  @override
  String get verifyOtherDeviceDescription =>
      'When you verify another device, those devices can exchange keys, increasing your overall security. 💪 When you start a verification, a popup will appear in the app on both devices. There you will then see a series of emojis or numbers that you have to compare with each other. It\'s best to have both devices handy before you start the verification. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender accepted key verification';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender canceled key verification';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender completed key verification';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender is ready for key verification';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender requested key verification';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender started key verification';
  }

  @override
  String get incomingMessages => 'Incoming messages';

  @override
  String get stickers => 'Stickers';

  @override
  String get discover => 'Discover';

  @override
  String get commandHint_ignore => 'Ignore the given REChain ID';

  @override
  String get commandHint_unignore => 'Unignore the given REChain ID';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread unread chats';
  }

  @override
  String get noDatabaseEncryption =>
      'Database encryption is not supported on this platform';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Right now there are $count users blocked.';
  }

  @override
  String goToSpace(Object space) {
    return 'Go to space: $space';
  }

  @override
  String get markAsUnread => 'Mark as unread';

  @override
  String userLevel(int level) {
    return '$level - User';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Moderator';
  }

  @override
  String adminLevel(int level) {
    return '$level - Admin';
  }

  @override
  String get changeGeneralChatSettings => 'Change general chat settings';

  @override
  String get inviteOtherUsers => 'Invite other users to this chat';

  @override
  String get changeTheChatPermissions => 'Change the chat permissions';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Change the visibility of the chat history';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Change the main public chat address';

  @override
  String get sendRoomNotifications => 'Send a @room notifications';

  @override
  String get changeTheDescriptionOfTheGroup =>
      'Change the description of the chat';

  @override
  String get chatPermissionsDescription =>
      'Define which power level is necessary for certain actions in this chat. The power levels 0, 50 and 100 are usually representing users, moderators and admins, but any gradation is possible.';

  @override
  String updateInstalled(String version) {
    return '🎉 Update $version installed!';
  }

  @override
  String get changelog => 'Changelog';

  @override
  String updateAvailable(String version) {
    return 'Update $version available';
  }

  @override
  String get download => 'Download';

  @override
  String get sendCanceled => 'Sending canceled';

  @override
  String get loginWithREChainId => 'Login with REChain-ID';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Doesn\'t seem to be a compatible homeserver. Wrong URL?';

  @override
  String get calculatingFileSize => 'Calculating file size...';

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'One of your devices is not verified';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Note: When you connect all your devices to the chat backup, they are automatically verified.';

  @override
  String get continueText => 'Continue';

  @override
  String get blur => 'Blur:';

  @override
  String get opacity => 'Opacity:';

  @override
  String get setWallpaper => 'Set wallpaper';

  @override
  String get manageAccount => 'Manage account';

  @override
  String get noContactInformationProvided =>
      'Server does not provide any valid contact information';

  @override
  String get contactServerAdmin => 'Contact server admin';

  @override
  String get contactServerSecurity => 'Contact server security';

  @override
  String get supportPage => 'Support page';

  @override
  String get serverInformation => 'Server information:';

  @override
  String get name => 'Name';

  @override
  String get version => 'Version';

  @override
  String get website => 'Website';

  @override
  String get compress => 'Compress';

  @override
  String get boldText => 'Bold text';

  @override
  String get italicText => 'Italic text';

  @override
  String get strikeThrough => 'Strikethrough';

  @override
  String get pleaseFillOut => 'Please fill out';

  @override
  String get invalidUrl => 'Invalid url';

  @override
  String get addLink => 'Add link';

  @override
  String get unableToJoinChat =>
      'Unable to join chat. Maybe the other party has already closed the conversation.';

  @override
  String get previous => 'Previous';

  @override
  String get otherPartyNotLoggedIn =>
      'The other party is currently not logged in and therefore cannot receive messages!';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Use \'$server\' to log in';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'You hereby allow the app and website to share information about you.';

  @override
  String get open => 'Open';

  @override
  String get waitingForServer => 'Waiting for server...';

  @override
  String get newChatRequest => '📩 New chat request';

  @override
  String get contentNotificationSettings => 'Content notification settings';

  @override
  String get generalNotificationSettings => 'General notification settings';

  @override
  String get roomNotificationSettings => 'Room notification settings';

  @override
  String get userSpecificNotificationSettings =>
      'User specific notification settings';

  @override
  String get otherNotificationSettings => 'Other notification settings';

  @override
  String get notificationRuleContainsUserName => 'Contains User Name';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Notifies the user when a message contains their username.';

  @override
  String get notificationRuleMaster => 'Mute all notifications';

  @override
  String get notificationRuleMasterDescription =>
      'Overrides all other rules and disables all notifications.';

  @override
  String get notificationRuleSuppressNotices => 'Suppress Automated Messages';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Suppresses notifications from automated clients like bots.';

  @override
  String get notificationRuleInviteForMe => 'Invite for Me';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Notifies the user when they are invited to a room.';

  @override
  String get notificationRuleMemberEvent => 'Member Event';

  @override
  String get notificationRuleMemberEventDescription =>
      'Suppresses notifications for membership events.';

  @override
  String get notificationRuleIsUserMention => 'User Mention';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Notifies the user when they are directly mentioned in a message.';

  @override
  String get notificationRuleContainsDisplayName => 'Contains Display Name';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Notifies the user when a message contains their display name.';

  @override
  String get notificationRuleIsRoomMention => 'Room Mention';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Notifies the user when there is a room mention.';

  @override
  String get notificationRuleRoomnotif => 'Room Notification';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Notifies the user when a message contains \'@room\'.';

  @override
  String get notificationRuleTombstone => 'Tombstone';

  @override
  String get notificationRuleTombstoneDescription =>
      'Notifies the user about room deactivation messages.';

  @override
  String get notificationRuleReaction => 'Reaction';

  @override
  String get notificationRuleReactionDescription =>
      'Suppresses notifications for reactions.';

  @override
  String get notificationRuleRoomServerAcl => 'Room Server ACL';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Suppresses notifications for room server access control lists (ACL).';

  @override
  String get notificationRuleSuppressEdits => 'Suppress Edits';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Suppresses notifications for edited messages.';

  @override
  String get notificationRuleCall => 'Call';

  @override
  String get notificationRuleCallDescription =>
      'Notifies the user about calls.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'Encrypted Room One-to-One';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Notifies the user about messages in encrypted one-to-one rooms.';

  @override
  String get notificationRuleRoomOneToOne => 'Room One-to-One';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Notifies the user about messages in one-to-one rooms.';

  @override
  String get notificationRuleMessage => 'Message';

  @override
  String get notificationRuleMessageDescription =>
      'Notifies the user about general messages.';

  @override
  String get notificationRuleEncrypted => 'Encrypted';

  @override
  String get notificationRuleEncryptedDescription =>
      'Notifies the user about messages in encrypted rooms.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Notifies the user about Jitsi widget events.';

  @override
  String get notificationRuleServerAcl => 'Suppress Server ACL Events';

  @override
  String get notificationRuleServerAclDescription =>
      'Suppresses notifications for Server ACL events.';

  @override
  String unknownPushRule(String rule) {
    return 'Unknown push rule \'$rule\'';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return '🎙️ $duration - Voice message from $sender';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'If you delete this notification setting, this can not be undone.';

  @override
  String get more => 'More';

  @override
  String get shareKeysWith => 'Share keys with...';

  @override
  String get shareKeysWithDescription =>
      'Which devices should be trusted so that they can read along your messages in encrypted chats?';

  @override
  String get allDevices => 'All devices';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Cross verified devices if enabled';

  @override
  String get crossVerifiedDevices => 'Cross verified devices';

  @override
  String get verifiedDevicesOnly => 'Verified devices only';

  @override
  String get takeAPhoto => 'Take a photo';

  @override
  String get recordAVideo => 'Record a video';

  @override
  String get optionalMessage => '(Optional) message...';

  @override
  String get notSupportedOnThisDevice => 'Not supported on this device';

  @override
  String get enterNewChat => 'Enter new chat';

  @override
  String get approve => 'Approve';

  @override
  String get youHaveKnocked => 'You have knocked';

  @override
  String get pleaseWaitUntilInvited =>
      'Please wait now, until someone from the room invites you.';

  @override
  String get commandHint_logout => 'Logout your current device';

  @override
  String get commandHint_logoutall => 'Logout all active devices';

  @override
  String get displayNavigationRail => 'Show navigation rail on mobile';

  @override
  String get customReaction => 'Custom reaction';

  @override
  String get moreEvents => 'More events';

  @override
  String get showMore => 'Show more';

  @override
  String get showLess => 'Show less';

  @override
  String get declineInvitation => 'Decline invitation';

  @override
  String get noMessagesYet => 'No messages yet';

  @override
  String get longPressToRecordVoiceMessage =>
      'Long press to record voice message.';

  @override
  String get pause => 'Pause';

  @override
  String get resume => 'Resume';

  @override
  String get removeFromSpaceDescription =>
      'The chat will be removed from the space but still appear in your chat list.';

  @override
  String countChats(int chats) {
    return '$chats chats';
  }

  @override
  String spaceMemberOf(String spaces) {
    return 'Space member of $spaces';
  }

  @override
  String spaceMemberOfCanKnock(String spaces) {
    return 'Space member of $spaces can knock';
  }

  @override
  String get startPoll => 'Start poll';

  @override
  String get endPoll => 'End poll';

  @override
  String get answersVisible => 'Answers visible';

  @override
  String get pollQuestion => 'Poll question';

  @override
  String get answerOption => 'Answer option';

  @override
  String get addAnswerOption => 'Add answer option';

  @override
  String get allowMultipleAnswers => 'Allow multiple answers';

  @override
  String get pollHasBeenEnded => 'Poll has been ended';

  @override
  String countVotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count votes',
      one: 'One vote',
    );
    return '$_temp0';
  }

  @override
  String get answersWillBeVisibleWhenPollHasEnded =>
      'Answers will be visible when poll has ended';

  @override
  String get replyInThread => 'Reply in thread';

  @override
  String countReplies(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count replies',
      one: 'One reply',
    );
    return '$_temp0';
  }

  @override
  String get thread => 'Thread';

  @override
  String get backToMainChat => 'Back to main chat';

  @override
  String get saveChanges => 'Save changes';

  @override
  String get createSticker => 'Create sticker or emoji';

  @override
  String get useAsSticker => 'Use as sticker';

  @override
  String get useAsEmoji => 'Use as emoji';

  @override
  String get stickerPackNameAlreadyExists => 'Sticker pack name already exists';

  @override
  String get newStickerPack => 'New sticker pack';

  @override
  String get stickerPackName => 'Sticker pack name';

  @override
  String get attribution => 'Attribution';

  @override
  String get skipChatBackup => 'Skip chat backup';

  @override
  String get skipChatBackupWarning =>
      'Are you sure? Without enabling the chat backup you may lose access to your messages if you switch your device.';

  @override
  String get noMoreResultsFound => 'No more results found';

  @override
  String chatSearchedUntil(String time) {
    return 'Chat searched until $time';
  }

  @override
  String get federationBaseUrl => 'Federation Base URL';

  @override
  String get clientWellKnownInformation => 'Client-Well-Known Information:';

  @override
  String get baseUrl => 'Base URL';

  @override
  String get identityServer => 'Identity Server:';

  @override
  String versionWithNumber(String version) {
    return 'Version: $version';
  }

  @override
  String get logs => 'Logs';

  @override
  String get advancedConfigs => 'Advanced Configs';

  @override
  String get advancedConfigurations => 'Advanced configurations';

  @override
  String get signIn => 'Sign in';

  @override
  String get createNewAccount => 'Create new account';

  @override
  String get signUpGreeting =>
      'REChain is decentralized! Select a server where you want to create your account and let\'s go!';

  @override
  String get signInGreeting =>
      'You already have an account in REChain? Welcome back! Select your homeserver and sign in.';

  @override
  String get theProcessWasCanceled => 'The process was canceled.';

  @override
  String get join => 'Join';

  @override
  String get searchOrEnterHomeserverAddress =>
      'Search or enter homeserver address';

  @override
  String get matrixId => 'REChain ID';

  @override
  String get setPowerLevel => 'Set power level';

  @override
  String get makeModerator => 'Make moderator';

  @override
  String get makeAdmin => 'Make admin';

  @override
  String get removeModeratorRights => 'Remove moderator rights';

  @override
  String get removeAdminRights => 'Remove admin rights';

  @override
  String get powerLevel => 'Power level';

  @override
  String get setPowerLevelDescription =>
      'Power levels define what a member is allowed to do in this room and usually range between 0 and 100.';

  @override
  String get owner => 'Owner';

  @override
  String get mute => 'Mute';

  @override
  String get createNewChat => 'Create new chat';

  @override
  String get reset => 'Reset';

  @override
  String get supportrechainonline => 'Support REChain';

  @override
  String get support => 'Support';

  @override
  String get setLowPriority => 'Set low priority';

  @override
  String get unsetLowPriority => 'Unset low priority';

  @override
  String get playSoundOnNotification => 'Play sound on notification';

  @override
  String get addTag => 'Add tag';

  @override
  String get removeTag => 'Remove tag';

  @override
  String get tagName => 'Tag name';

  @override
  String get createNewTag => 'Create new tag';

  @override
  String get hideRoomsInSpaces => 'Hide rooms that are in a space';

  @override
  String get possibleByYou =>
      'This release was only possible thanks to your support. REChain remains free, open-source, and entirely community-driven.';

  @override
  String get showThumbnailsInTimeline => 'Show thumbnails of images and videos';

  @override
  String get appSubtitle => 'Secure [REChain] Communication';

  @override
  String get appDescription =>
      'Communicate encrypted over the decentralized [REChain] network in an easy and accessible way for everyone.';

  @override
  String get interactiveVerification => 'Interactive verification';

  @override
  String get interactiveVerificationDescription =>
      'If you are next to each other or communicate via a secure channel then you can verify all devices at once by comparing a security number or emojis.';

  @override
  String countUnverifiedDevices(int count) {
    return '$count unverified devices in the chat.';
  }

  @override
  String get encryptedMessage => 'Encrypted message';

  @override
  String get unencryptedMessage => 'Unencrypted message';

  @override
  String get messageCanOnlyBeReadByUser =>
      'Your message is end to end encrypted and can only be read by this user:';

  @override
  String get messageCanOnlyBeReadByUsers =>
      'Your message is end to end encrypted and can only be read by these users:';

  @override
  String publicKey(String key) {
    return 'Public key: $key';
  }

  @override
  String get deviceIdentityKey => 'Device identity key';

  @override
  String get restoreBootstrapEmptyDevicesDescription =>
      'Please enter your passphrase or recovery key to verify this device and get access to your encrypted message backup.';

  @override
  String get restoreBootstrapDevicesDescription =>
      'Please pick one of your other devices, to verify this session:';

  @override
  String get resetAccount => 'Reset account';

  @override
  String get restoreCryptoIdentity => 'Restore Crypto Identity';

  @override
  String get resetCryptoIdentity => 'Reset Crypto Identity';

  @override
  String get setUpCryptoIdentity => 'Set Up Crypto Identity';

  @override
  String get waitingForKeys =>
      'Waiting for keys... Please keep the other device active.';

  @override
  String get noKeysTransmitted => 'No keys transmitted. Please try again.';

  @override
  String get unlock => 'Unlock';

  @override
  String get openFile => 'Open file';

  @override
  String get resetAccountWarning =>
      'When you reset your account you will lose the access to your old messages forever. All your current devices need to be verified again. Please only perform this action when you have no other devices left to verify your session and you have lost your recovery key and passphrase!';

  @override
  String get newPassphraseDescription =>
      'REChain uses end to end encryption. To not lose your messages, please choose a strong passphrase to secure your crypto identity and your encrypted message backup.';

  @override
  String get newPassphrase => 'New passphrase';

  @override
  String get repeatPassphrase => 'Repeat passphrase';

  @override
  String get passphrasesMatch => 'Passphrases match';

  @override
  String get passphraseLengthRequirement => 'At least 12 characters long.';

  @override
  String get passphraseUpperAndLowerCaseRequirement =>
      'Contains uppercase and lowercase characters.';

  @override
  String get passphraseSpecialCharactersRequirement =>
      'Contains special characters.';

  @override
  String get passphraseNumberRequirement => 'Contains one numbers.';

  @override
  String get storeRecoveryKeyDescription =>
      'Please note down your recovery key to be able to restore your encrypted messages and your crypto identity on.';

  @override
  String get saveAsFile => 'Save as file';

  @override
  String get youAreReadyToStart => 'You are ready to start!';

  @override
  String get noUserKeyFound => 'No user key found';

  @override
  String knownSince(String date) {
    return 'Known since: $date';
  }

  @override
  String get unsignedDevice => 'Unsigned device';

  @override
  String get signedDevice => 'Signed device';

  @override
  String get noCurve25519KeyFound => 'No curve25519 key found';

  @override
  String get messageNotDecryptable => 'Message not decryptable';

  @override
  String get today => 'Today';

  @override
  String get sending => 'Sending';

  @override
  String get generatingThumbnail => 'Generating thumbnail';

  @override
  String get encrypting => 'Encrypting';

  @override
  String get uploading => 'Uploading';

  @override
  String get edited => '(edited)';

  @override
  String get couldNotBeSent => 'Could not be sent';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get resetRecoveryKey => 'Reset recovery key';

  @override
  String get pleaseEnter6Digits =>
      'Please enter 6 digits to enable the app lock.';

  @override
  String get disableAppLock => 'Disable app lock';

  @override
  String get disableAppLockAreYouSure =>
      'Are you sure you want to disable the app lock?';

  @override
  String get enableBiometrics => 'Enable biometric authentication';

  @override
  String get disableBiometrics => 'Disable biometric authentication';

  @override
  String get biometricsDescription =>
      'With biometric authentication you can unlock the app with your face or your fingerprint. The capabilities depend on your device.';

  @override
  String get useAppLock => 'Use app lock';

  @override
  String get unlockWithBiometrics => 'Unlock with biometric authentication';

  @override
  String get resetPin => 'Reset pin';

  @override
  String forwardCountMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count messages',
      one: 'one message',
    );
    return 'Forward $_temp0?';
  }

  @override
  String get loadingMessages => 'Loading messages...';

  @override
  String get buildDoesNotSupportFirebase =>
      'This build does not support firebase cloud messaging.';

  @override
  String get unableToRegisterDeviceForFirebase =>
      'Unable to register device for firebase cloud messaging.';

  @override
  String get unifiedPushDistributors => 'Unified Push distributors:';

  @override
  String get doubleTapToReact => 'Double-tap to react';

  @override
  String get doubleTapToReactDescription =>
      'Double-tap a message to react instead of selecting text';

  @override
  String get doubleTapReaction => 'Double-tap reaction';

  @override
  String get shareCrashReports => 'Share crash reports';

  @override
  String get shareCrashReportsDescription =>
      'Automatically share crash reports with the developers?';

  @override
  String countActiveCallMembers(int count) {
    return '$count active call members';
  }

  @override
  String get enterCall => 'Enter call';

  @override
  String get videoCallsBetaWarning =>
      'Video calls are a beta feature. There might be bugs or unexpected behavior. We would be happy to hear about your feedback.';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get incomingCall => 'Incoming call';

  @override
  String get videoCall => 'Vidvoko';

  @override
  String get voiceCall => 'Voice call';

  @override
  String get missedCall => 'Missed call';

  @override
  String get callBack => 'Call back';

  @override
  String get hangUp => 'Hang up';

  @override
  String get waitingForParticipant => 'Waiting for participant...';

  @override
  String get decline => 'Decline';

  @override
  String get startCall => 'Start call';

  @override
  String get selectCamera => 'Select camera';

  @override
  String get selectMicrophone => 'Select microphone';

  @override
  String get selectSpeaker => 'Select speaker';

  @override
  String get toggleMicrophone => 'Toggle microphone';

  @override
  String get toggleCamera => 'Toggle camera';

  @override
  String get startScreensharing => 'Start screensharing';

  @override
  String get stopScreensharing => 'Stop screensharing';

  @override
  String get raiseHand => 'Raise hand';

  @override
  String get stopRaiseHand => 'Stop raise hand';

  @override
  String get preferSpeaker => 'Prefer speaker';

  @override
  String unexpectedErrorOccurded(String msg) {
    return 'Unfortunately, an unexpected error has occurred: $msg';
  }

  @override
  String incomingCallFrom(String user) {
    return 'Incoming call from $user';
  }

  @override
  String serverRespondedWithError(String error) {
    return 'The server has replied with an error message: $error';
  }

  @override
  String get sharedLocation => 'Shared location';

  @override
  String get pasteImage => 'Paste image';

  @override
  String get noImageInClipboard => 'No image in clipboard';

  @override
  String get doYouAlsoWantToBlock => 'Do you also want to block this user?';

  @override
  String get declineAndBlock => 'Decline and block';

  @override
  String senderHasInvitedYouToTheChat(String sender, String nameOrAlias) {
    return '$sender has invited you to the chat \'$nameOrAlias\'.';
  }

  @override
  String senderHasInvitedYouToTheSpace(String sender, String nameOrAlias) {
    return '$sender has invited you to the space \'$nameOrAlias\'.';
  }
}
