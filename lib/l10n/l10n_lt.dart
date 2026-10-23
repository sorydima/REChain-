// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Lithuanian (`lt`).
class L10nLt extends L10n {
  L10nLt([String locale = 'lt']) : super(locale);

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
  String get repeatPassword => 'Pakartokite slaptažodį';

  @override
  String get notAnImage => 'Not an image file.';

  @override
  String get remove => 'Pašalinti';

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
  String get about => 'Apie';

  @override
  String aboutHomeserver(String homeserver) {
    return 'About $homeserver';
  }

  @override
  String get accept => 'Sutinku';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username priėmė kvietimą';
  }

  @override
  String get account => 'Paskyra';

  @override
  String get accountsAndSettings => 'Accounts and settings';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username aktyvavo visapusį šifravimą';
  }

  @override
  String get addEmail => 'Pridėti el. paštą';

  @override
  String get confirmREChainId =>
      'Please confirm your REChain ID in order to delete your account.';

  @override
  String supposedMxid(String mxid) {
    return 'Tai turėtų būti $mxid';
  }

  @override
  String get addToSpace => 'Pridėti į erdvę';

  @override
  String get admin => 'Administratorius';

  @override
  String get alias => 'slapyvardis';

  @override
  String get all => 'Visi';

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
    return '$senderName atsiliepė į skambutį';
  }

  @override
  String get anyoneCanJoin => 'Bet kas gali prisijungti';

  @override
  String get appLock => 'Programos užraktas';

  @override
  String get appLockDescription =>
      'Lock the app when not using with a pin code';

  @override
  String get archive => 'Archyvas';

  @override
  String get areGuestsAllowedToJoin => 'Ar svečiams leidžiama prisijungti';

  @override
  String get areYouSure => 'Ar esate tikri?';

  @override
  String get discardEdits => 'You have unsaved changes. Discard your edits?';

  @override
  String get areYouSureYouWantToLogout => 'Ar tikrai norite atsijungti?';

  @override
  String get askSSSSSign =>
      'Kad galėtumėte prijungti kitą asmenį, įveskite savo saugyklos slaptafrazę arba atkūrimo raktą.';

  @override
  String askVerificationRequest(String username) {
    return 'Priimti šią patvirtinimo užklausą iš $username?';
  }

  @override
  String get autoplayImages =>
      'Automatiškai leisti animuotus lipdukus ir jaustukus';

  @override
  String badServerLoginTypesException(
    String serverVersions,
    String supportedVersions,
    Object suportedVersions,
  ) {
    return 'Namų serveris palaiko šiuos prisijungimo tipus:\n$serverVersions\nTačiau ši programa palaiko tik:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Send typing notifications';

  @override
  String get swipeRightToLeftToReply => 'Swipe right to left to reply';

  @override
  String get sendOnEnter => 'Išsiųsti paspaudus Enter';

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
  String get banFromChat => 'Užblokuoti iš pokalbio';

  @override
  String get banned => 'Užblokuotas';

  @override
  String bannedUser(String username, String targetName) {
    return '$username užblokavo $targetName';
  }

  @override
  String get blockDevice => 'Blokuoti įrenginį';

  @override
  String get blocked => 'Užblokuotas';

  @override
  String get cancel => 'Atšaukti';

  @override
  String cantOpenUri(String uri) {
    return 'Nepavyksta atidaryti URI $uri';
  }

  @override
  String get changeDeviceName => 'Pakeisti įrenginio vardą';

  @override
  String changedTheChatAvatar(String username) {
    return '$username pakeitė pokalbio avatarą';
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
    return '$username pakeitė pokalbių leidimus';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username pakeitė rodomą vardą į: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username pakeitė svečio prieigos taisykles';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username pakeitė svečio prieigos taisykles į: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username pakeitė istorijos matomumą';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username pakeitė istorijos matomumą į: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username pakeitė prisijungimo taisykles';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username pakeitė prisijungimo taisykles į: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username pakeitė savo avatarą';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username pakeitė kambario pseudonimus';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username pakeitė pakvietimo nuorodą';
  }

  @override
  String get changePassword => 'Keisti slaptažodį';

  @override
  String get changeTheHomeserver => 'Pakeisti namų serverį';

  @override
  String get changeTheme => 'Keisti savo stilių';

  @override
  String get changeTheNameOfTheGroup => 'Keisti grupės pavadinimą';

  @override
  String get changeYourAvatar => 'Keisti savo avatarą';

  @override
  String get channelCorruptedDecryptError => 'Šifravimas buvo sugadintas';

  @override
  String get chat => 'Pokalbis';

  @override
  String get chatBackup => 'Pokalbio atsargine kopija';

  @override
  String get chatDetails => 'Pokalbio detalės';

  @override
  String get chats => 'Pokalbiai';

  @override
  String get chooseAStrongPassword => 'Pasirinkite saugų slaptažodį';

  @override
  String get clearArchive => 'Išvalyti archyvą';

  @override
  String get close => 'Uždaryti';

  @override
  String get commandHint_markasdm =>
      'Pažymėti kaip tiesioginio pokalbio kambarį';

  @override
  String get commandHint_markasgroup => 'Pažymėti kaip grupę';

  @override
  String get commandHint_ban => 'Užblokuoti vartotoją šiame kambaryje';

  @override
  String get commandHint_clearcache => 'Išvalyti laikiną talpyklą';

  @override
  String get commandHint_create =>
      'Sukurti tuščią grupinį pokalbį\nNaudokite --no-encryption kad išjungti šifravimą';

  @override
  String get commandHint_discardsession => 'Atmesti sesiją';

  @override
  String get commandHint_dm =>
      'Pradėti tiesioginį pokalbį\nNaudokite --no-encryption kad išjungti šifravimą';

  @override
  String get commandHint_html => 'Siųsti tekstą HTML formatu';

  @override
  String get commandHint_invite => 'Pakviesti vartotoją į šitą kambarį';

  @override
  String get commandHint_join => 'Prisijungti prie nurodyto kambario';

  @override
  String get commandHint_kick => 'Pašalinti vartotoja iš šito kambario';

  @override
  String get commandHint_leave => 'Palikti pokalbių kambarį';

  @override
  String get commandHint_me => 'Apibūdinkite save';

  @override
  String get commandHint_myroomavatar =>
      'Nustatyti savo nuotrauką šiame kambaryje (su mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Nustatyti savo rodomą vardą šiame kambaryje';

  @override
  String get commandHint_op =>
      'Nustatyti naudotojo galios lygį (numatytasis: 50)';

  @override
  String get commandHint_plain => 'Siųsti neformatuotą tekstą';

  @override
  String get commandHint_react => 'Siųsti atsakymą kaip reakciją';

  @override
  String get commandHint_send => 'Siųsti tekstą';

  @override
  String get commandHint_unban => 'Atblokuoti vartotoją šiame kambaryje';

  @override
  String get commandInvalid => 'Neteisinga komanda';

  @override
  String commandMissing(String command) {
    return '$command nėra komanda.';
  }

  @override
  String get compareEmojiMatch => 'Palyginkite jaustukus';

  @override
  String get compareNumbersMatch => 'Palyginkite skaičius';

  @override
  String get configureChat => 'Konfigūruoti pokalbį';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Kontaktas buvo pakviestas į grupę';

  @override
  String get contentHasBeenReported =>
      'Apie turinį pranešta serverio administratoriams';

  @override
  String get copiedToClipboard => 'Nukopijuota į iškarpinę';

  @override
  String get copy => 'Kopijuoti';

  @override
  String get copyToClipboard => 'Koipjuoti į iškarpinę';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Nepavyko iššifruoti pranešimo: $error';
  }

  @override
  String get checkList => 'Check list';

  @override
  String countParticipants(int count) {
    return '$count dalyviai';
  }

  @override
  String countInvited(int count) {
    return '$count invited';
  }

  @override
  String get create => 'Sukurti';

  @override
  String createdTheChat(String username) {
    return '💬 $username sukūrė pokalbį';
  }

  @override
  String get createGroup => 'Create group';

  @override
  String get createNewSpace => 'Nauja erdvė';

  @override
  String get currentlyActive => 'Šiuo metu aktyvus';

  @override
  String get darkTheme => 'Tamsi';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String get deactivateAccountWarning =>
      'Tai deaktyvuos jūsų vartotojo paskyrą. Tai negali būti atšaukta! Ar jūs tuo tikri?';

  @override
  String get defaultPermissionLevel => 'Numatytasis teisių lygis';

  @override
  String get delete => 'Ištrinti';

  @override
  String get deleteAccount => 'Panaikinti paskyra';

  @override
  String get deleteMessage => 'Ištrinti žinutę';

  @override
  String get devices => 'Įrenginiai';

  @override
  String get directChats => 'Tiesioginiai pokalbiai';

  @override
  String get displaynameHasBeenChanged => 'Rodomas vardas buvo pakeistas';

  @override
  String get downloadFile => 'Atsisiųsti failą';

  @override
  String get edit => 'Redaguoti';

  @override
  String get editBlockedServers => 'Redaguoti blokuotus serverius';

  @override
  String get chatPermissions => 'Chat permissions';

  @override
  String get editDisplayname => 'Redaguoti rodomą vardą';

  @override
  String get editRoomAliases => 'Redaguoti kambario pseudonimus';

  @override
  String get editRoomAvatar => 'Redaguoti kambario avatarą';

  @override
  String get emoteExists => 'Jaustukas jau egzistuoja!';

  @override
  String get emoteInvalid => 'Neteisingas jaustuko trumpasis kodas!';

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
  String get emoteShortcode => 'Jaustuko trumpasis kodas';

  @override
  String get emptyChat => 'Tuščias pokalbis';

  @override
  String get enableEmotesGlobally => 'Įgalinti jaustukų paketą visur';

  @override
  String get enableEncryption => 'Aktyvuoti šifravimą';

  @override
  String get enableEncryptionWarning =>
      'Šifravimo nebegalėsite išjungti. Ar jūs tuo tikri?';

  @override
  String get encrypted => 'Užšifruotas';

  @override
  String get encryption => 'Šifravimas';

  @override
  String get encryptionNotEnabled => 'Šifravimas aktyvuotas';

  @override
  String endedTheCall(String senderName) {
    return '$senderName baigė skambutį';
  }

  @override
  String get enterAnEmailAddress => 'Įveskite el. pašto adresą';

  @override
  String errorObtainingLocation(String error) {
    return 'Klaida nustatant vietą: $error';
  }

  @override
  String get fontSize => 'Šrifto dydis';

  @override
  String get forward => 'Toliau';

  @override
  String get fromJoining => 'Nuo prisijungimo';

  @override
  String get fromTheInvitation => 'Nuo pakvietimo';

  @override
  String get group => 'Grupė';

  @override
  String get chatDescription => 'Chat description';

  @override
  String get chatDescriptionHasBeenChanged => 'Chat description changed';

  @override
  String get groupIsPublic => 'Grupė yra vieša';

  @override
  String get groups => 'Grupės';

  @override
  String groupWith(String displayname) {
    return 'Grupė su $displayname';
  }

  @override
  String get guestsAreForbidden => 'Svečiams draudžiama';

  @override
  String get guestsCanJoin => 'Svečiai gali prisijungti';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username atšaukė $targetName kvietimą';
  }

  @override
  String get help => 'Pagalba';

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
  String get iHaveClickedOnLink => 'Aš paspaudžiau nuorodą';

  @override
  String get incorrectPassphraseOrKey =>
      'Neteisinga slaptafrazė arba atkūrimo raktas';

  @override
  String get inviteContact => 'Pakviesti kontaktą';

  @override
  String inviteContactToGroup(String groupName) {
    return 'Pakviesti kontaktą į $groupName';
  }

  @override
  String get noChatDescriptionYet => 'No chat description created yet.';

  @override
  String get tryAgain => 'Try again';

  @override
  String get invalidServerName => 'Invalid server name';

  @override
  String get invited => 'Pakviestas';

  @override
  String get redactMessageDescription =>
      'The message will be redacted for all participants in this conversation. This cannot be undone.';

  @override
  String get optionalRedactReason =>
      '(Optional) Reason for redacting this message...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username pakvietė $targetName';
  }

  @override
  String get invitedUsersOnly => 'Tik pakviesti vartotojai';

  @override
  String inviteText(String username, String link) {
    return '$username pakvietė jus prisijungti prie REChain. \n1. Įdiekite REChain. https://github.com/sorydima/REChain- \n2. Prisiregistruokite arba prisijunkite \n3. Atidarykite pakvietimo nuorodą: $link';
  }

  @override
  String get isTyping => 'rašo…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username prisijungė prie pokalbio';
  }

  @override
  String get joinRoom => 'Prisijungti prie kambario';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username išmetė $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username išmetė ir užblokavo $targetName';
  }

  @override
  String get kickFromChat => 'Išmesti iš pokalbio';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Paskutinis aktyvumas: $localizedTimeShort';
  }

  @override
  String get leave => 'Palikti';

  @override
  String get leftTheChat => 'Paliko pokalbį';

  @override
  String get lightTheme => 'Šviesi';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Įkelti dar $count dalyvius';
  }

  @override
  String get dehydrate => 'Eksportuoti sesiją ir išvalyti įrenginį';

  @override
  String get dehydrateWarning =>
      'Šio veiksmo negalima atšaukti. Įsitikinkite, kad saugiai saugote atsarginę kopiją.';

  @override
  String get hydrate => 'Atkurti iš atsarginės kopijos failo';

  @override
  String get loadingPleaseWait => 'Kraunama… Prašome palaukti.';

  @override
  String get loadMore => 'Rodyti daugiau…';

  @override
  String get locationDisabledNotice =>
      'Vietos nustatymo paslaugos yra išjungtos. Kad galėtumėte bendrinti savo buvimo vietą, įjunkite jas.';

  @override
  String get locationPermissionDeniedNotice =>
      'Vietos leidimas atmestas. Suteikite leidimą kad galėtumėte bendrinti savo vietą.';

  @override
  String get login => 'Prisijungti';

  @override
  String logInTo(String homeserver) {
    return 'Prisijungti prie $homeserver';
  }

  @override
  String get logout => 'Atsijungti';

  @override
  String get mention => 'Paminėti';

  @override
  String get messages => 'Žinutės';

  @override
  String get messagesStyle => 'Messages:';

  @override
  String get moderator => 'Moderatorius';

  @override
  String get muteChat => 'Nutildyti pokalbį';

  @override
  String get newChat => 'Naujas pokalbis';

  @override
  String get newMessageInrechainonline => '💬 Nauja žinutė REChain.e';

  @override
  String get newVerificationRequest => 'Nauja patvirtinimo užklausa!';

  @override
  String get next => 'Toliau';

  @override
  String get no => 'Ne';

  @override
  String get noConnectionToTheServer => 'Nėra ryšio su serveriu';

  @override
  String get noEmotesFound => 'Nerasta jaustukų. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Šifravimą galite suaktyvinti tik tada, kai kambarys nebebus viešai pasiekiamas.';

  @override
  String get noGoogleServicesWarning =>
      'Atrodo, kad jūsų telefone nėra Google Services. Tai geras sprendimas jūsų privatumui! Norėdami gauti tiesioginius pranešimus REChain. rekomenduojame naudoti https://microg.org/ arba https://unifiedpush.org/.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 nėra REChain serveris, ar vietoj jo naudoti $server2?';
  }

  @override
  String get shareInviteLink => 'Share invite link';

  @override
  String get scanQrCode => 'Nuskanuokite QR kodą';

  @override
  String get noPasswordRecoveryDescription =>
      'Dar nepridėjote slaptažodžio atkūrimo būdo.';

  @override
  String get noPermission => 'Nėra leidimo';

  @override
  String get noRoomsFound => 'Nerasta kambarių…';

  @override
  String get notifications => 'Pranešimai';

  @override
  String numUsersTyping(int count) {
    return '$count vartotojai rašo…';
  }

  @override
  String get obtainingLocation => 'Gaunama vieta…';

  @override
  String get ok => 'OK';

  @override
  String get onlineKeyBackupEnabled =>
      'Internetinė atsarginė raktų kopija įjungta';

  @override
  String get oopsPushError =>
      'Oi! Deja, nustatant tiesioginius pranešimus įvyko klaida.';

  @override
  String get oopsSomethingWentWrong => 'Oi, kažkas nutiko ne taip…';

  @override
  String get openAppToReadMessages =>
      'Atidarykite programėlę, kad perskaityti žinutes';

  @override
  String get openCamera => 'Atidarykite kamerą';

  @override
  String get oneClientLoggedOut => 'Vienas iš jūsų klientų atsijungė';

  @override
  String get addAccount => 'Pridėti paskyrą';

  @override
  String get editBundlesForAccount => 'Redaguoti šios paskyros paketus';

  @override
  String get addToBundle => 'Pridėti prie paketų';

  @override
  String get removeFromBundle => 'Pašalinkite iš šio paketo';

  @override
  String get bundleName => 'Paketo vardas';

  @override
  String get openInMaps => 'Atidaryti žemėlapiuose';

  @override
  String get link => 'Nuoroda';

  @override
  String get or => 'Arba';

  @override
  String get participant => 'Dalyvis';

  @override
  String get passphraseOrKey => 'Slapta frazė arba atkūrimo raktas';

  @override
  String get password => 'Slaptažodis';

  @override
  String get passwordForgotten => 'Slaptažodis užmirštas';

  @override
  String get passwordHasBeenChanged => 'Slaptažodis pakeistas';

  @override
  String get passwordRecoverySettings => 'Password recovery settings';

  @override
  String get passwordRecovery => 'Slaptažodžio atkūrimas';

  @override
  String get pin => 'Prisegti';

  @override
  String get pleaseChooseAPasscode => 'Pasirinkite slaptą kodą';

  @override
  String get pleaseClickOnLink =>
      'Paspauskite nuorodą el. pašte ir tęskite toliau.';

  @override
  String get pleaseEnterYourPassword => 'Įveskite savo slaptažodį';

  @override
  String get pleaseEnterYourPin => 'Įveskite savo PIN kodą';

  @override
  String get pleaseEnterYourUsername => 'Įveskite savo vartotojo vardą';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Vadovaukitės svetainėje pateiktais nurodymais ir bakstelėkite Toliau.';

  @override
  String get privacy => 'Privatumas';

  @override
  String get publicRooms => 'Vieši kambariai';

  @override
  String get reason => 'Priežastis';

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
    return '$username pašalino įvykį';
  }

  @override
  String get redactMessage => 'Pašalinti žinutę';

  @override
  String get reject => 'Atmesti';

  @override
  String rejectedTheInvitation(String username) {
    return '$username atmetė kvietimą';
  }

  @override
  String get removeAllOtherDevices => 'Pašalinti visus kitus įrenginius';

  @override
  String get unbanFromChat => 'Atblokuoti pokalbyje';

  @override
  String get removeYourAvatar => 'Pašalinti savo avatarą';

  @override
  String get replaceRoomWithNewerVersion => 'Pakeisti kambarį naujesne versija';

  @override
  String get reply => 'Atsakyti';

  @override
  String get reportMessage => 'Pranešti apie žinutę';

  @override
  String get roomHasBeenUpgraded => 'Kambarys buvo atnaujintas';

  @override
  String sendingFilesDoNotExit(int count) {
    return 'Sending $count files... Please do not exit!';
  }

  @override
  String get roomVersion => 'Kambario versija';

  @override
  String get compressingVideo => 'Compressing video...';

  @override
  String get saveFile => 'Išsaugoti failą';

  @override
  String get search => 'Ieškoti';

  @override
  String get security => 'Apsauga';

  @override
  String get send => 'Siųsti';

  @override
  String get sendAMessage => 'Siųsti žinutę';

  @override
  String get sendAsText => 'Siųsti kaip tekstą';

  @override
  String get sendAudio => 'Siųsti garso įrašą';

  @override
  String get sendFile => 'Sųsti bylą';

  @override
  String get sendImage => 'Siųsti paveiksliuką';

  @override
  String sendImages(int count) {
    return 'Send $count image';
  }

  @override
  String get sendMessages => 'Siųsti žinutes';

  @override
  String get sendVideo => 'Siųsti video';

  @override
  String sentAFile(String username) {
    return '📁 $username atsiuntė failą';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username atsiuntė garso įrašą';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username atsiuntė nuotrauką';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username atsiuntė lipduką';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username atsiuntė vaizdo įrašą';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName išsiuntė skambučio informaciją';
  }

  @override
  String get setAsCanonicalAlias => 'Nustatyti kaip pagrindinį slapyvardį';

  @override
  String get setChatDescription => 'Set chat description';

  @override
  String get setStatus => 'Nustatyti būseną';

  @override
  String get settings => 'Nustatytmai';

  @override
  String get share => 'Bendrinti';

  @override
  String sharedTheLocation(String username) {
    return '$username bendrino savo vietą';
  }

  @override
  String get shareLocation => 'Bendrinti vietą';

  @override
  String get skip => 'Praleisti';

  @override
  String get sourceCode => 'Programinis kodas';

  @override
  String get spaceIsPublic => 'Erdvė yra vieša';

  @override
  String get spaceName => 'Erdvės pavadinimas';

  @override
  String startedACall(String senderName) {
    return '$senderName pradėjo skambutį';
  }

  @override
  String get status => 'Būsena';

  @override
  String get statusExampleMessage => 'Kaip sekasi šiandien?';

  @override
  String get submit => 'Pateikti';

  @override
  String get synchronizingPleaseWait => 'Sinchronizuojama… Prašome palaukti.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Synchronizing… ($percentage%)';
  }

  @override
  String get systemTheme => 'Sistema';

  @override
  String get theyDontMatch => 'Jie nesutampa';

  @override
  String get theyMatch => 'Jie sutampa';

  @override
  String get tooManyRequestsWarning =>
      'Per daug užklausų. Pabandykite dar kartą vėliau!';

  @override
  String get tryToSendAgain => 'Pabandykite išsiųsti dar kartą';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username atblokavo $targetName';
  }

  @override
  String get unblockDevice => 'Atblokuoti įrenginį';

  @override
  String get unknownDevice => 'Nežinomas įrenginys';

  @override
  String get unknownEncryptionAlgorithm => 'Nežinomas šifravimo algoritmas';

  @override
  String unknownEvent(String type) {
    return 'Nežinomas įvykis \'$type\'';
  }

  @override
  String get unmuteChat => 'Įjungti pokalbio garsą';

  @override
  String get unpin => 'Atsegti';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username ir dar $count kiti rašo…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username ir $username2 rašo…';
  }

  @override
  String userIsTyping(String username) {
    return '$username rašo…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username paliko pokalbį';
  }

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username išsiuntė $type įvykį';
  }

  @override
  String get unverified => 'Nepatvirtinta';

  @override
  String get verified => 'Patvirtinta';

  @override
  String get verifyStart => 'Pradėti patvirtinimą';

  @override
  String get verifySuccess => 'Jūs sėkmingai patvirtinote!';

  @override
  String get verifyTitle => 'Patvirtinama kita paskyra';

  @override
  String get visibilityOfTheChatHistory => 'Pokalbių istorijos matomumas';

  @override
  String get visibleForAllParticipants => 'Matoma visiems dalyviams';

  @override
  String get visibleForEveryone => 'Matoma visiems';

  @override
  String get voiceMessage => 'Balso žinutė';

  @override
  String get waitingPartnerAcceptRequest =>
      'Laukiama, kol dalyvis priims užklausą…';

  @override
  String get waitingPartnerEmoji => 'Laukiama, kol dalyvis priims jaustukus…';

  @override
  String get waitingPartnerNumbers => 'Laukiama, kol dalyvis priims skaičius…';

  @override
  String get warning => 'Įspėjimas!';

  @override
  String get weSentYouAnEmail => 'Išsiuntėme jums el. laišką';

  @override
  String get whoCanPerformWhichAction => 'Kas gali atlikti kokį veiksmą';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'Kam leidžiama prisijungti prie šios grupės';

  @override
  String get whyDoYouWantToReportThis => 'Kodėl norite apie tai pranešti?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Naudodami šiuos adresus galite atkurti savo slaptažodį.';

  @override
  String get writeAMessage => 'Rašyti žinutę…';

  @override
  String get yes => 'Taip';

  @override
  String get you => 'Jūs';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Jūs nebedalyvaujate šiame pokalbyje';

  @override
  String get yourPublicKey => 'Jūsų viešasis raktas';

  @override
  String get messageInfo => 'Žinutės informacija';

  @override
  String get time => 'Laikas';

  @override
  String get sender => 'Siuntėjas';

  @override
  String get openGallery => 'Atverti galeriją';

  @override
  String get removeFromSpace => 'Pašalinti iš erdvės';

  @override
  String get markAsRead => 'Žymėti kaip skaitytą';

  @override
  String get reportUser => 'Pranešti apie vartotoją';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender sureagavo su $reaction';
  }

  @override
  String get pinMessage => 'Prisegti prie kambario';

  @override
  String get confirmEventUnpin =>
      'Ar tikrai norite visam laikui atsegti įvykį?';

  @override
  String get emojis => 'Jaustukai';

  @override
  String get unsupportedAndroidVersion => 'Nepalaikoma Android versija';

  @override
  String get unsupportedAndroidVersionLong =>
      'Šiai funkcijai reikalinga naujesnė Android versija. Patikrinkite, ar nėra naujinimų arba Mobile Katya OS palaikymo.';

  @override
  String get youRejectedTheInvitation => 'Jūs atmetėte kvietimą';

  @override
  String get youJoinedTheChat => 'Jūs prisijungėte prie pokalbio';

  @override
  String get youAcceptedTheInvitation => '👍 Jūs priėmėte kvietimą';

  @override
  String youBannedUser(String user) {
    return 'Jūs užblokavote $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Jūs atšaukėte kvietimą $user';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 Jus pakvietė $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Pakvietėte $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Jūs išmetėte $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Jūs išmetėte ir užblokavote $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Jūs atblokavote $user';
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
  String get users => 'Vartotojai';

  @override
  String get storeInAndroidKeystore => 'Saugoti Android raktų saugykloje';

  @override
  String get storeInAppleKeyChain => 'Saugoti Apple raktų grandinėje';

  @override
  String get storeSecurlyOnThisDevice => 'Saugiai laikyti šiame prietaise';

  @override
  String countFiles(int count) {
    return '$count failai';
  }

  @override
  String get user => 'Vartotojas';

  @override
  String get custom => 'Pasirinktinis';

  @override
  String get whyIsThisMessageEncrypted => 'Kodėl ši žinutė neperskaitoma?';

  @override
  String get noKeyForThisMessage =>
      'Taip gali atsitikti, jei žinutė buvo išsiųsta prieš prisijungiant prie paskyros šiame prietaise.\n\nTaip pat gali būti, kad siuntėjas užblokavo jūsų prietaisą arba kažkas sutriko su interneto ryšiu.\n\nAr galite perskaityti žinutę kitoje sesijoje? Tada galite perkelti žinutę iš jos! Eikite į Nustatymai > Prietaisai ir įsitikinkite, kad jūsų prietaisai patvirtino vienas kitą. Kai kitą kartą atidarysite kambarį ir abi sesijos bus pirmame plane, raktai bus perduoti automatiškai.\n\nNenorite prarasti raktų atsijungdami arba keisdami įrenginius? Įsitikinkite, kad nustatymuose įjungėte pokalbių atsarginę kopiją.';

  @override
  String get newSpace => 'Nauja erdvė';

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
      'Atminkite, kad vaizdo skambučiai šiuo metu yra beta versijos. Jie gali neveikti taip kaip tikėtasi, arba iš viso neveikti visose platformose.';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get incomingCall => 'Incoming call';

  @override
  String get videoCall => 'Vaizdo skambutis';

  @override
  String get voiceCall => 'Balso skambutis';

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
