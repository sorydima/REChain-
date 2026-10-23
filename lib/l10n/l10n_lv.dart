// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Latvian (`lv`).
class L10nLv extends L10n {
  L10nLv([String locale = 'lv']) : super(locale);

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
  String get repeatPassword => 'Atkārtot paroli';

  @override
  String get notAnImage => 'Nav attēla datne.';

  @override
  String get remove => 'Noņemt';

  @override
  String get importNow => 'Ievietot tagad';

  @override
  String get importEmojis => 'Ievietot emocijzīmes';

  @override
  String get importFromZipFile => 'Ievietot no .zip datnes';

  @override
  String get exportEmotePack => 'Izgūt emociju paku kā .zip';

  @override
  String get replace => 'Aizstāt';

  @override
  String get about => 'Par';

  @override
  String aboutHomeserver(String homeserver) {
    return 'Par $homeserver';
  }

  @override
  String get accept => 'Pieņemt';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username pieņēma uzaicinājumu';
  }

  @override
  String get account => 'Konts';

  @override
  String get accountsAndSettings => 'Accounts and settings';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username iespējoja pilnīgu šifrēšanu';
  }

  @override
  String get addEmail => 'Pievienot e-pasta adresi';

  @override
  String get confirmREChainId =>
      'Please confirm your REChain ID in order to delete your account.';

  @override
  String supposedMxid(String mxid) {
    return 'Tam būtu jābūt $mxid';
  }

  @override
  String get addToSpace => 'Pievienot vietai';

  @override
  String get admin => 'Pārvaldītājs';

  @override
  String get alias => 'aizstājvārds';

  @override
  String get all => 'Viss';

  @override
  String get commandHint_roomupgrade =>
      'Uzlabot šo istabu uz norādīto istabas versiju';

  @override
  String get commandHint_googly => 'Nosūtīt izbolītu acu pāri';

  @override
  String get commandHint_cuddle => 'Nosūtīt samīļojienu';

  @override
  String get commandHint_hug => 'Nosūtīt apskāvienu';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName sūta izbolītas acis';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName samīļo Tevi';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName apskauj Tevi';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName atbildēja uz zvanu';
  }

  @override
  String get anyoneCanJoin => 'Ikviens var pievienoties';

  @override
  String get appLock => 'Lietotnes aizslēgšana';

  @override
  String get appLockDescription =>
      'Aizslēgt lietotni, kad tā netiek izmantota, ar PIN kodu';

  @override
  String get archive => 'Arhīvs';

  @override
  String get areGuestsAllowedToJoin =>
      'Vai vieslietotājiem ir ļauts pievienoties';

  @override
  String get areYouSure => 'Vai tiešām?';

  @override
  String get discardEdits => 'You have unsaved changes. Discard your edits?';

  @override
  String get areYouSureYouWantToLogout => 'Vai tiešām atteikties?';

  @override
  String get askSSSSSign =>
      'Lai varētu parakstīt otru cilvēku, lūgums ievadīt savu drošo krātuves paroles vārdkopu vai atkopes atslēgu.';

  @override
  String askVerificationRequest(String username) {
    return 'Pieņemt apliecināšanas pieprasījumu no $username?';
  }

  @override
  String get autoplayImages =>
      'Automātiski atskaņot animētas uzlīmes un emocijas';

  @override
  String badServerLoginTypesException(
    String serverVersions,
    String supportedVersions,
    Object suportedVersions,
  ) {
    return 'Mājasserveris nodrošina pieteikšanās veidus:\n$serverVersions\nSavukārt, šī lietotne atbalsta tikai:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Nosūtīt rakstīšanas paziņojumus';

  @override
  String get swipeRightToLeftToReply =>
      'Pavilkt no labās puses uz kreiso, lai atbildētu';

  @override
  String get sendOnEnter => 'Nosūtīt ar Enter';

  @override
  String get noMoreChatsFound => 'Vairs netika atrasta neviena tērzēšana...';

  @override
  String get noChatsFoundHere =>
      'Šeit vēl nav tērzēšanu. Jauna saruna ar kādu ir uzsākama ar zemāk esošo pogu. ⤵️';

  @override
  String get unread => 'Nelasītas';

  @override
  String get space => 'Vieta';

  @override
  String get banFromChat => 'Izslēgt no tērzēšanas';

  @override
  String get banned => 'Izslēgts';

  @override
  String bannedUser(String username, String targetName) {
    return '$username izslēdza $targetName';
  }

  @override
  String get blockDevice => 'Liegt ierīci';

  @override
  String get blocked => 'Liegta';

  @override
  String get cancel => 'Atcelt';

  @override
  String cantOpenUri(String uri) {
    return 'Nevar atvērt adresi $uri';
  }

  @override
  String get changeDeviceName => 'Mainīt ierīces nosaukumu';

  @override
  String changedTheChatAvatar(String username) {
    return '$username nomainīja tērzēšanas attēlu';
  }

  @override
  String changedTheChatDescription(Object username) {
    return '$username nomainīja tērzēšanas aprakstu';
  }

  @override
  String changedTheChatName(Object username) {
    return '$username nomainīja tērzēšanas nosaukumu';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username nomainīja tērzēšanas atļaujas';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username nomainīja savu attēlojamo vārdu uz \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username nomainīja viesu piekļuves nosacījumus';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username nomainīja viesu piekļuves nosacījumus uz $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username mainīja vēstures redzamību';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username nomainīja vēstures redzamību uz $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username nomainīja pievienošanās nosacījumus';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username nomainīja pievienošanās nosacījumus uz $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username nomainīja savu attēlu';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username nomainīja istabas aizstājvārdus';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username nomainīja uzaicinājuma saiti';
  }

  @override
  String get changePassword => 'Nomainīt paroli';

  @override
  String get changeTheHomeserver => 'Mainīt mājasserveri';

  @override
  String get changeTheme => 'Mainīt izskatu';

  @override
  String get changeTheNameOfTheGroup => 'Mainīt kopas nosaukumu';

  @override
  String get changeYourAvatar => 'Mainīt savu attēlu';

  @override
  String get channelCorruptedDecryptError => 'Šifrēšana tika bojāta';

  @override
  String get chat => 'Tērzēšana';

  @override
  String get chatBackup => 'Tērzēšanu rezerves kopēšana';

  @override
  String get chatDetails => 'Tērzēšanas izvērsums';

  @override
  String get chats => 'Tērzēšanas';

  @override
  String get chooseAStrongPassword => 'Jāizvēlas droša parole';

  @override
  String get clearArchive => 'Iztīrīt arhīvu';

  @override
  String get close => 'Aizvērt';

  @override
  String get commandHint_markasdm =>
      'Atzīmēt kā tiešo ziņu istabu norādītajam REChain Id';

  @override
  String get commandHint_markasgroup => 'Atzīmēt kā kopu';

  @override
  String get commandHint_ban => 'Izslēgt norādīto lietotāju no šīs istabas';

  @override
  String get commandHint_clearcache => 'Iztīrīt kešatmiņu';

  @override
  String get commandHint_create =>
      'Izveidot tukšu kopas tērzēšanu\nLai atspējotu šifrēšanu, jāizmanto --no-encryption';

  @override
  String get commandHint_discardsession => 'Atmest sesiju';

  @override
  String get commandHint_dm =>
      'Uzsākt tiešu tērzēšanu\nLai atspējotu šifrēšanu, jāizmanto --no-encryption';

  @override
  String get commandHint_html => 'Nosūtīt ar HTML formatētu tekstu';

  @override
  String get commandHint_invite => 'Uzaicināt norādīto lietotāju šajā istabā';

  @override
  String get commandHint_join => 'Pievienoties norādītajai istabai';

  @override
  String get commandHint_kick => 'Noņemt norādīto lietotāju no šīs istabas';

  @override
  String get commandHint_leave => 'Pamest šo istabu';

  @override
  String get commandHint_me => 'Apraksti sevi';

  @override
  String get commandHint_myroomavatar =>
      'Iestatīt savu attēlu šajā istabā (ar mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Iestatīt savu attēlojamo vārdu šajā istabā';

  @override
  String get commandHint_op =>
      'Iestatīt norādītā lietotāja pilnvaru līmeni (noklusējums: 50)';

  @override
  String get commandHint_plain => 'Nosūtīt neformatētu tekstu';

  @override
  String get commandHint_react => 'Nosūtīt atbildi kā reakciju';

  @override
  String get commandHint_send => 'Nosūtīt tekstu';

  @override
  String get commandHint_unban =>
      'Atcelt norādītā lietotāja izslēgšanu no šīs istabas';

  @override
  String get commandInvalid => 'Nederīga komanda';

  @override
  String commandMissing(String command) {
    return '$command nav komanda.';
  }

  @override
  String get compareEmojiMatch => 'Lūgums salīdzināt emocijzīmes';

  @override
  String get compareNumbersMatch => 'Lūgums salīdzināt skaitļus';

  @override
  String get configureChat => 'Konfigurēt tērzēšanu';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Kontaktpersona tika uzaicināta kopā';

  @override
  String get contentHasBeenReported =>
      'Par saturu tika ziņos servera pārvaldītājiem';

  @override
  String get copiedToClipboard => 'Ievietots starpliktuvē';

  @override
  String get copy => 'Ievietot starpliktuvē';

  @override
  String get copyToClipboard => 'Ievietot starpliktuvē';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Nevarēja atšifrēt ziņu: $error';
  }

  @override
  String get checkList => 'Pārbaužu saraksts';

  @override
  String countParticipants(int count) {
    return '$count dalībnieki';
  }

  @override
  String countInvited(int count) {
    return '$count uzaicināti';
  }

  @override
  String get create => 'Izveidot';

  @override
  String createdTheChat(String username) {
    return '💬 $username izveidoja tērzēšanu';
  }

  @override
  String get createGroup => 'Izveidot kopu';

  @override
  String get createNewSpace => 'Jauna vieta';

  @override
  String get currentlyActive => 'Pašreiz darbīgi';

  @override
  String get darkTheme => 'Tumšs';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String get deactivateAccountWarning =>
      'Tas atspējos Tavu lietotāja kontu. To nevar atdarīt. Vai tiešām?';

  @override
  String get defaultPermissionLevel =>
      'Noklusējuma atļauju līmenis jauniem lietotājiem';

  @override
  String get delete => 'Izdzēst';

  @override
  String get deleteAccount => 'Izdzēst kontu';

  @override
  String get deleteMessage => 'Izdzēst ziņu';

  @override
  String get devices => 'Ierīces';

  @override
  String get directChats => 'Tiešās tērzēšanas';

  @override
  String get displaynameHasBeenChanged => 'Attēlojamais vārds tika nomainīts';

  @override
  String get downloadFile => 'Lejupielādēt datni';

  @override
  String get edit => 'Labot';

  @override
  String get editBlockedServers => 'Labot liegtos serverus';

  @override
  String get chatPermissions => 'Tērzēšanas atļaujas';

  @override
  String get editDisplayname => 'Labot attēlojamo vārdu';

  @override
  String get editRoomAliases => 'Labot istabu aizstājvārdus';

  @override
  String get editRoomAvatar => 'Labot istabas attēlu';

  @override
  String get emoteExists => 'Emocija jau pastāv.';

  @override
  String get emoteInvalid => 'Nederīgs emocijas īskods.';

  @override
  String get emoteKeyboardNoRecents =>
      'Nesen izmantotās emocijas parādīsies šeit...';

  @override
  String get globalChatId => 'Vispārējais tērzēšanas Id';

  @override
  String get accessAndVisibility => 'Piekļuve un redzamība';

  @override
  String get accessAndVisibilityDescription =>
      'Kam ir ļauts pievienoties šai tērzēšanai un kā tērzēšana var tikt atklāta.';

  @override
  String get customEmojisAndStickers => 'Pielāgotas emocijzīmes un uzlīmes';

  @override
  String get customEmojisAndStickersBody =>
      'Pievienot vai kopīgot pielāgotas emocijzīmes vai uzlīmes, kas var tikt izmantotas jebkurā tērzēšanā.';

  @override
  String get emoteShortcode => 'Emocijas īskods';

  @override
  String get emptyChat => 'Tukša tērzēšana';

  @override
  String get enableEmotesGlobally => 'Iespējot kā vispārēju emociju paku';

  @override
  String get enableEncryption => 'Iespējot šifrēšanu';

  @override
  String get enableEncryptionWarning =>
      'Vairs nebūs iespējams atspējot šifrēšanu. Vai tiešām to darīt?';

  @override
  String get encrypted => 'Šifrēta';

  @override
  String get encryption => 'Šifrēšana';

  @override
  String get encryptionNotEnabled => 'Šifrēšana nav iespējota';

  @override
  String endedTheCall(String senderName) {
    return '$senderName beidza zvanu';
  }

  @override
  String get enterAnEmailAddress => 'Jāievada e-pasta adrese';

  @override
  String errorObtainingLocation(String error) {
    return 'Kļūda atrašanās vietas iegūšanā: $error';
  }

  @override
  String get fontSize => 'Fonta izmērs';

  @override
  String get forward => 'Pārsūtīt';

  @override
  String get fromJoining => 'No pievienošanās';

  @override
  String get fromTheInvitation => 'No uzaicinājuma';

  @override
  String get group => 'Kopa';

  @override
  String get chatDescription => 'Tērzēšanas apraksts';

  @override
  String get chatDescriptionHasBeenChanged =>
      'Tērzēšanas apraksts ir mainījies';

  @override
  String get groupIsPublic => 'Kopa ir publiska';

  @override
  String get groups => 'Kopas';

  @override
  String groupWith(String displayname) {
    return 'Kopa ar $displayname';
  }

  @override
  String get guestsAreForbidden => 'Viesi nav ļauti';

  @override
  String get guestsCanJoin => 'Viesi var pievienoties';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username atsauca uzaicinājumu $targetName';
  }

  @override
  String get help => 'Palīdzība';

  @override
  String get hideRedactedMessages => 'Paslēpt labošanas ziņas';

  @override
  String get hideRedactedMessagesBody =>
      'Ja kāds labo ziņu, tā vairs nebūs redzama tērzēšanā.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Paslēpt nederīgus vai nezināmus ziņu formātus';

  @override
  String get block => 'Izslēgt';

  @override
  String get blockedUsers => 'Atslēgtie lietotāji';

  @override
  String get blockListDescription =>
      'Ir iespējams atslēgt traucējošus lietotājus. Nebūs iespējams saņem jebkādas ziņas vai uzaicinājumus uz istabām no lietotājiem, kas ir personīgajā izslēgšanas sarakstā.';

  @override
  String get blockUsername => 'Neņemt vērā lietotājvārdu';

  @override
  String get iHaveClickedOnLink => 'Es uzklikšķināju uz saites';

  @override
  String get incorrectPassphraseOrKey =>
      'Nepareiza paroles vārdkopa vai atkopes atslēga';

  @override
  String get inviteContact => 'Uzaicināt kontaktpersonu';

  @override
  String inviteContactToGroup(String groupName) {
    return 'Uzaicināt kontaktpersonu $groupName';
  }

  @override
  String get noChatDescriptionYet => 'Tērzēšanas apraksts vēl nav izveidots.';

  @override
  String get tryAgain => 'Jāmēģina vēlreiz';

  @override
  String get invalidServerName => 'Nederīgs servera nosaukums';

  @override
  String get invited => 'Uzaicināts';

  @override
  String get redactMessageDescription =>
      'Ziņa tiks labota visiem šīs sarunas dalībniekiem. To nevar atdarīt.';

  @override
  String get optionalRedactReason => '(Pēc izvēles) Ziņas labošanas iemesls...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username uzaicināja $targetName';
  }

  @override
  String get invitedUsersOnly => 'Tikai uzaicināti lietotāji';

  @override
  String inviteText(String username, String link) {
    return '$username uzaicināja pievienoties REChain.\n1. Jāapmeklē github.com/sorydima/REChain- un jāuzstāda lietotne \n2. Jāizveido konts vai jāpiesakās \n3. Jāatver uzaicinājuma saite: \n $link';
  }

  @override
  String get isTyping => 'raksta…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username pievienojās tērzēšanai';
  }

  @override
  String get joinRoom => 'Pievienoties istabai';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username izmeta $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username izmeta $targetName un liedza piekļuvi';
  }

  @override
  String get kickFromChat => 'Izmest no tērzēšanas';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Pēdējoreiz tiešsaistē: $localizedTimeShort';
  }

  @override
  String get leave => 'Pamest';

  @override
  String get leftTheChat => 'Pameta tērzēšanu';

  @override
  String get lightTheme => 'Gaišs';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Ielādēt vēl $count dalībniekus';
  }

  @override
  String get dehydrate => 'Izgūt sesiju un iztīrīt ierīci';

  @override
  String get dehydrateWarning =>
      'Šī darbība nav atdarāma. Jānodrošina, ka rezerves kopijas datne tiek droši uzglabāta.';

  @override
  String get hydrate => 'Atjaunot no rezerves kopijas datnes';

  @override
  String get loadingPleaseWait => 'Ielādē... Lūgums uzgaidīt.';

  @override
  String get loadMore => 'Ielādēt vēl…';

  @override
  String get locationDisabledNotice =>
      'Atrašanās vietas pakalpojumi ir atspējoti. Lūgums tos iespējot, lai būtu iespējams kopīgot savu atrašanās vietu.';

  @override
  String get locationPermissionDeniedNotice =>
      'Atrašanās vietas atļauja noliegta. Lūgums nodrošināt to, lai būtu iespējams kopīgot savu atrašanās vietu.';

  @override
  String get login => 'Pieteikties';

  @override
  String logInTo(String homeserver) {
    return 'PIeteikties $homeserver';
  }

  @override
  String get logout => 'Atteikties';

  @override
  String get mention => 'Pieminēt';

  @override
  String get messages => 'Ziņas';

  @override
  String get messagesStyle => 'Ziņas:';

  @override
  String get moderator => 'Moderators';

  @override
  String get muteChat => 'Apklusināt tērzēšanu';

  @override
  String get newChat => 'Jauna tērzēšana';

  @override
  String get newMessageInrechainonline => '💬 Jauna ziņa REChain';

  @override
  String get newVerificationRequest => 'Jauns apliecināšanas pieprasījums.';

  @override
  String get next => 'Nākamais';

  @override
  String get no => 'Nē';

  @override
  String get noConnectionToTheServer => 'Nav savienojuma ar serveri';

  @override
  String get noEmotesFound => 'Netika atrasta neviena emocija. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Šifrēšanu var iespējot tikai tad, kad istaba vairs nav publiski pieejama.';

  @override
  String get noGoogleServicesWarning =>
      'Izskatās, ka Firebase mākoņziņojumapmaiņa nav pieejama šajā ierīcē. Lai joprojām saņemtu pašpiegādes paziņojumus, mēs iesakām uzstādīt ntfy. Ar ntfy vai citu UnifiedPush nodrošinātāju ir iespējams saņemt pašpiegādes paziņojumus drošā veidā. ntfy var lejupielādēt no Play Store vai F-Droid.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 nav REChain serveris, tā vietā izmantot $server2?';
  }

  @override
  String get shareInviteLink => 'Kopīgot uzaicinājuma saiti';

  @override
  String get scanQrCode => 'Nolasīt kvadrātkodu';

  @override
  String get noPasswordRecoveryDescription =>
      'Vēl nav pievienots paroles atjaunošanas veids.';

  @override
  String get noPermission => 'Nav atļaujas';

  @override
  String get noRoomsFound => 'Istabas netika atrastas…';

  @override
  String get notifications => 'Paziņojumi';

  @override
  String numUsersTyping(int count) {
    return '$count lietotāji raksta…';
  }

  @override
  String get obtainingLocation => 'Iegūst atrašanās vietu…';

  @override
  String get ok => 'Labi';

  @override
  String get onlineKeyBackupEnabled =>
      'Tiešsaistes atslēgas rezerves kopēšana ir iespējota';

  @override
  String get oopsPushError =>
      'Ups! Diemžēl atgadījās kļūda pašpiegādes paziņojumu iestatīšanas laikā.';

  @override
  String get oopsSomethingWentWrong => 'Ups! Kaut kas nogāja greizi…';

  @override
  String get openAppToReadMessages => 'Atvērt lietotni, lai lasītu ziņas';

  @override
  String get openCamera => 'Atvērt kameru';

  @override
  String get oneClientLoggedOut => 'Viens no klientiem ir atteicies';

  @override
  String get addAccount => 'Pievienot kontu';

  @override
  String get editBundlesForAccount => 'Labot šī konta komplektus';

  @override
  String get addToBundle => 'Pievienot komplektam';

  @override
  String get removeFromBundle => 'Noņemt no šī komplekta';

  @override
  String get bundleName => 'Komplekta nosaukums';

  @override
  String get openInMaps => 'Atvērt kartēs';

  @override
  String get link => 'Saite';

  @override
  String get or => 'Vai';

  @override
  String get participant => 'Dalībnieks';

  @override
  String get passphraseOrKey => 'paroles vārdkopa vai atkopes atslēga';

  @override
  String get password => 'Parole';

  @override
  String get passwordForgotten => 'Aizmirsta parole';

  @override
  String get passwordHasBeenChanged => 'Parole tikai nomainīta';

  @override
  String get passwordRecoverySettings => 'Paroles atkopes iestatījumi';

  @override
  String get passwordRecovery => 'Paroles atkope';

  @override
  String get pin => 'PIN';

  @override
  String get pleaseChooseAPasscode => 'Lūgums izvēlēties piekļuves kodu';

  @override
  String get pleaseClickOnLink =>
      'Lūgums klikšķināt uz saites e-pastā un tad turpināt.';

  @override
  String get pleaseEnterYourPassword => 'Lūgums ievadīt savu paroli';

  @override
  String get pleaseEnterYourPin => 'Lūgums ievadīt savu PIN';

  @override
  String get pleaseEnterYourUsername => 'Lūgums ievadīt savu lietotājvārdu';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Lūgums sekot norādēm tīmekļvietnē un piesist \"Nākamais\".';

  @override
  String get privacy => 'Privātums';

  @override
  String get publicRooms => 'Publiskas istabas';

  @override
  String get reason => 'Iemesls';

  @override
  String redactedBy(String username) {
    return 'Laboja $username';
  }

  @override
  String redactedByBecause(String username, String reason) {
    return 'Laboja $username, jo: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username laboja notikumu';
  }

  @override
  String get redactMessage => 'Labot ziņu';

  @override
  String get reject => 'Noraidīt';

  @override
  String rejectedTheInvitation(String username) {
    return '$username noraidīja uzaicinājumu';
  }

  @override
  String get removeAllOtherDevices => 'Noņemt visas pārējās ierīces';

  @override
  String get unbanFromChat => 'Atcelt liegumu tērzēšanā';

  @override
  String get removeYourAvatar => 'Noņemt savu attēlu';

  @override
  String get replaceRoomWithNewerVersion =>
      'Aizvietot istabu ar jaunāku versiju';

  @override
  String get reply => 'Atbildēt';

  @override
  String get reportMessage => 'Ziņot par ziņu';

  @override
  String get roomHasBeenUpgraded => 'Istaba tika atjaunināta';

  @override
  String sendingFilesDoNotExit(int count) {
    return 'Sending $count files... Please do not exit!';
  }

  @override
  String get roomVersion => 'Istabas versija';

  @override
  String get compressingVideo => 'Compressing video...';

  @override
  String get saveFile => 'Saglabāt datni';

  @override
  String get search => 'Meklēt';

  @override
  String get security => 'Drošība';

  @override
  String get send => 'Nosūtīt';

  @override
  String get sendAMessage => 'Nosūtīt ziņu';

  @override
  String get sendAsText => 'Nosūtīt kā tekstu';

  @override
  String get sendAudio => 'Nosūtīt skaņu';

  @override
  String get sendFile => 'Nosūtīt datni';

  @override
  String get sendImage => 'Nosūtīt attēlu';

  @override
  String sendImages(int count) {
    return 'Nosūtīt $count attēlu(s)';
  }

  @override
  String get sendMessages => 'Nosūtīt ziņas';

  @override
  String get sendVideo => 'Nosūtīt video';

  @override
  String sentAFile(String username) {
    return '📁 $username nosūtīja datni';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username nosūtīja skaņu';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username nosūtīja attēlu';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username nosūtīja uzlīmi';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username nosūtīja video';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName nosūtīja informāciju par zvanu';
  }

  @override
  String get setAsCanonicalAlias => 'Iestatīt kā galveno aizstājvārdu';

  @override
  String get setChatDescription => 'Iestatīt tērzēšanas aprakstu';

  @override
  String get setStatus => 'Iestatīt stāvokli';

  @override
  String get settings => 'Iestatījumi';

  @override
  String get share => 'Kopīgot';

  @override
  String sharedTheLocation(String username) {
    return '$username kopīgoja savu atrašanās vietu';
  }

  @override
  String get shareLocation => 'Kopīgot atrašanās vietu';

  @override
  String get skip => 'Izlaist';

  @override
  String get sourceCode => 'Pirmkods';

  @override
  String get spaceIsPublic => 'Vieta ir publiska';

  @override
  String get spaceName => 'Vietas nosaukums';

  @override
  String startedACall(String senderName) {
    return '$senderName uzsāka zvanu';
  }

  @override
  String get status => 'Stāvoklis';

  @override
  String get statusExampleMessage => 'Kā Tev šodien klājas?';

  @override
  String get submit => 'Iesniegt';

  @override
  String get synchronizingPleaseWait => 'Sinhronizē... Lūgums uzgaidīt.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Sinhronizē... ($percentage%)';
  }

  @override
  String get systemTheme => 'Sistēmas';

  @override
  String get theyDontMatch => 'Tās nesakrīt';

  @override
  String get theyMatch => 'Tās sakrīt';

  @override
  String get tooManyRequestsWarning =>
      'Pārāk daudz pieprasījumu. Lūdzu, vēlāk mēģini vēlreiz!';

  @override
  String get tryToSendAgain => 'Mēģināt nosūtīt vēlreiz';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username atcēla $targetName piekļuves liegumu';
  }

  @override
  String get unblockDevice => 'Atslēgt ierīci';

  @override
  String get unknownDevice => 'Nezināma ierīce';

  @override
  String get unknownEncryptionAlgorithm => 'Nezināms šifrēšanas algoritms';

  @override
  String unknownEvent(String type) {
    return 'Nezināms notikums \'$type\'';
  }

  @override
  String get unmuteChat => 'Atcelt tērzēšanas apklusināšanu';

  @override
  String get unpin => 'Atspraust';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username un $count citi raksta…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username un $username2 raksta…';
  }

  @override
  String userIsTyping(String username) {
    return '$username raksta…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username pameta tērzēšanu';
  }

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username nosūtīja notikumu $type';
  }

  @override
  String get unverified => 'Neapliecināta';

  @override
  String get verified => 'Apliecināta';

  @override
  String get verifyStart => 'Uzsākt apliecināšanu';

  @override
  String get verifySuccess => 'Apliecināšana bija sekmīga.';

  @override
  String get verifyTitle => 'Apliecina citu kontu';

  @override
  String get visibilityOfTheChatHistory => 'Tērzēšanas vēstures redzamība';

  @override
  String get visibleForAllParticipants => 'Redzama visiem dalībniekiem';

  @override
  String get visibleForEveryone => 'Redzama visiem';

  @override
  String get voiceMessage => 'Balss ziņa';

  @override
  String get waitingPartnerAcceptRequest =>
      'Gaida, līdz biedrs apstiprinās pieprasījumu…';

  @override
  String get waitingPartnerEmoji =>
      'Gaida, līdz biedrs apstiprinās emocijzīmes…';

  @override
  String get waitingPartnerNumbers =>
      'Gaida, līdz biedrs apstiprinās skaitļus…';

  @override
  String get warning => 'Uzmanību!';

  @override
  String get weSentYouAnEmail => 'Mēs nosūtīja e-pasta ziņu';

  @override
  String get whoCanPerformWhichAction => 'Kurš var veikt kādas darbības';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'Kuram ir ļauts pievienoties šai kopai';

  @override
  String get whyDoYouWantToReportThis => 'Kādēļ vēlies ziņot par šo?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Ar šīm adresēm var atjaunot savu paroli.';

  @override
  String get writeAMessage => 'Rakstīt ziņu…';

  @override
  String get yes => 'Jā';

  @override
  String get you => 'Tu';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Tu vairs nepiedalies šajā tērzēšanā';

  @override
  String get yourPublicKey => 'Tava publiskā atslēga';

  @override
  String get messageInfo => 'Informācija par ziņu';

  @override
  String get time => 'Laiks';

  @override
  String get sender => 'Sūtītājs';

  @override
  String get openGallery => 'Atvērt galeriju';

  @override
  String get removeFromSpace => 'Noņemt no vietas';

  @override
  String get markAsRead => 'Atzīmēt kā lasītu';

  @override
  String get reportUser => 'Ziņot par lietotāju';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender atsaucās ar $reaction';
  }

  @override
  String get pinMessage => 'Piespraust istabai';

  @override
  String get confirmEventUnpin =>
      'Vai tiešām neatgriezeniski atspraust šo notikumu?';

  @override
  String get emojis => 'Emocijzīmes';

  @override
  String get unsupportedAndroidVersion => 'Neatbalstīta Android versija';

  @override
  String get unsupportedAndroidVersionLong =>
      'Šai iespējai ir nepieciešama jaunāka Android versija. Lūgums pārbaudīt atjauninājumus vai Mobile Katya OS atbalstu.';

  @override
  String get youRejectedTheInvitation => 'Tu noraidīji uzaicinājumu';

  @override
  String get youJoinedTheChat => 'Tu pievienojies tērzēšanai';

  @override
  String get youAcceptedTheInvitation => '👍 Tu pieņēmi uzaicinājumu';

  @override
  String youBannedUser(String user) {
    return 'Tu $user liedzi piekļuvi';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Tu atsauci $user uzaicinājumu';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 $user Tevi uzaicināja';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Tu uzaicināji $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Tu izraidīji $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Izraidīji $user un liedzi piekļuvi';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Tu atcēli $user piekļuves liegumu';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user pieklauvēja';
  }

  @override
  String get usersMustKnock => 'Lietotājiem jāpieklauvē';

  @override
  String get noOneCanJoin => 'Neviens nevar pievienoties';

  @override
  String get knock => 'Pieklauvēt';

  @override
  String get users => 'Lietotāji';

  @override
  String get storeInAndroidKeystore => 'Glabāt Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Glabāt Apple KeyChain';

  @override
  String get storeSecurlyOnThisDevice => 'Droši uzglabāt šajā ierīcē';

  @override
  String countFiles(int count) {
    return '$count datnes';
  }

  @override
  String get user => 'Lietotājs';

  @override
  String get custom => 'Pielāgots';

  @override
  String get whyIsThisMessageEncrypted => 'Kādēļ šī ziņa ir nelasāma?';

  @override
  String get noKeyForThisMessage =>
      'Tā var notikt, ja ziņa tika nosūtīta, pirms pieteicies savā kontā šajā ierīcē.\n\nIr arī iespējams, ka sūtītājs noliedza Tavu ierīci vai kaut kas nogāja greizi ar interneta savienojumu.\n\nVai ziņas ir lasāmas citā sesijā? Tad Tu vari pārsūtīt ziņu no tās. Jādodas uz Iestatījumi > Ierīces un jāpārliecinās, ka ierīces viena otru ir apliecinājušas. Kad nākamreiz atvērsi istabu un abas sesijas būs priekšplānā, atslēgas tiks automātiski pārsūtītas.\n\nVai nevēlies zaudēt atslēgas, kad atsakies vai maini ierīces? Jāpārliecinās, ka iestatījumos ir iespējota tērzēšanu rezerves kopija.';

  @override
  String get newSpace => 'Jauna vieta';

  @override
  String get doNotShowAgain => 'Vairs nerādīt';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Tukša tērzēšana (bija $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Vietas ļauj apvienot tērzēšanas un būvēt privātas vai publiskas kopienas.';

  @override
  String get encryptThisChat => 'Šifrēt šo tērzēšanu';

  @override
  String get disableEncryptionWarning =>
      'Drošības iemeslu dēļ tērzēšanā nevar atspējot šifrēšanu, ja tā ir pirms tam ir bijusi iespējota.';

  @override
  String get sorryThatsNotPossible => 'Atvaino! Tas nav iespējams';

  @override
  String get reopenChat => 'Atkārtoti atvērt tērzēšanu';

  @override
  String get noBackupWarning =>
      'Uzmanību! Bez tērzēšanu rezerves kopiju veidošanas iespējošanas tiks zaudēta piekļuve savām šifrētajām ziņām. Ir ļoti ieteicams iespējot tērzēšanu rezerves kopiju veidošanu pirms atteikšanās.';

  @override
  String get noOtherDevicesFound => 'Netika atrastas citas ierīces';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Nevar nosūtīt. Serveris nodrošina pielikums līdz $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Datne tika saglabāta $path';
  }

  @override
  String get jumpToLastReadMessage => 'Pārlēkt uz pēdējo izlasīto ziņu';

  @override
  String get readUpToHere => 'Izlasīts līdz šejienei';

  @override
  String get jump => 'Pārlēkt';

  @override
  String get openLinkInBrowser => 'Atvērt saiti pārlūkā';

  @override
  String get reportErrorDescription =>
      '😭 Ak nē! Kaut kas nogāja greizi. Ja ir vēlēšanas, par šo nepilnību var ziņot izstrādātājiem.';

  @override
  String get report => 'Ziņot';

  @override
  String get setColorTheme => 'Iestatīt krāsu izskatu:';

  @override
  String get invite => 'Uzaicināt';

  @override
  String get inviteGroupChat => '📨 Uzaicinājums uz kopas tērzēšanu';

  @override
  String get invalidInput => 'Nederīga ievade.';

  @override
  String wrongPinEntered(int seconds) {
    return 'Ievadīts nepareizs PIN. Lūgums mēģināt vēlreiz pēc $seconds sekundēm...';
  }

  @override
  String get pleaseEnterANumber => 'Lūgums ievadīt skaitli lielāku par 0';

  @override
  String get archiveRoomDescription =>
      'Tērzēšana tiks pārvietota uz arhīvu. Citi lietotāji redzēs, ka pameti tērzēšanu.';

  @override
  String get roomUpgradeDescription =>
      'Tērzēšana tad tiks atkārtoti izveidota ar jauno istabas versiju. Visiem dalībniekiem tiks paziņots, ka viņiem ir jāpārslēdzas uz jauno tērzēšanu. Vairāk par istabu versijām var atrast https://github.com/sorydima/REChain-.git';

  @override
  String get removeDevicesDescription =>
      'Tu tiksi izrakstīts no šīs ierīces un vairs nevarēsi saņemt ziņas.';

  @override
  String get banUserDescription =>
      'Lietotājam tiks liegta piekļuve tērzēšanai, un vairs nevarēs vēlreiz pievienoties tērzēšanai, līdz liegums tiks atcelts.';

  @override
  String get unbanUserDescription =>
      'Lietotājs varēs atkal pievienoties tērzēšanai, ja mēģinās.';

  @override
  String get kickUserDescription =>
      'Lietotājs ir izmests no tērzēšanas, bet piekļuve nav liegta. Publiskās tērzēšanās lietotājs var atkārtoti pievienoties jebkurā laikā.';

  @override
  String get makeAdminDescription =>
      'Tiklīdz šis lietotājs tiks padarīts par pārvaldītāju, to vairs nevarēs atdarīt, jo tad tam būs tādas pašas atļaujas kā Tev.';

  @override
  String get pushNotificationsNotAvailable =>
      'Pašpiegādes paziņojumi nav pieejami';

  @override
  String get learnMore => 'Uzzināt vairāk';

  @override
  String get yourGlobalUserIdIs => 'Vispārējais lietotāja Id ir: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Diemžēl ar \"$query\" netika atrasts neviens lietotājs. Lūgums pārbaudīt, vai ir pieļauta drukas kļūda.';
  }

  @override
  String get knocking => 'Klauvē';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Tērzēšana var tikt atklāta ar meklēšanu $server';
  }

  @override
  String get searchChatsRooms => 'Meklēt #tērzēšanas, @lietotājus...';

  @override
  String get nothingFound => 'Nekas netika atrasts...';

  @override
  String get groupName => 'Kopas nosaukums';

  @override
  String get createGroupAndInviteUsers =>
      'Izveidot kopu un uzaicināt lietotājus';

  @override
  String get groupCanBeFoundViaSearch => 'Kopu var atrast meklēšanā';

  @override
  String get wrongRecoveryKey =>
      'Atvaino... Nešķiet, ka šī būtu pareiza atkopes atslēga.';

  @override
  String get commandHint_sendraw => 'Nosūtīt neapstrādātu JSON';

  @override
  String get databaseMigrationTitle => 'Datubāze ir optimizēta';

  @override
  String get databaseMigrationBody =>
      'Lūgums uzgaidīt. Tas var aizņemt kādu brīdi.';

  @override
  String get leaveEmptyToClearStatus =>
      'Atstāt tukšu, lai notīrītu savu stāvokli.';

  @override
  String get select => 'Atlasīt';

  @override
  String get searchForUsers => 'Meklēt @lietotājus...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Lūgums ievadīt savu pašreizējo paroli';

  @override
  String get newPassword => 'Jauna parole';

  @override
  String get pleaseChooseAStrongPassword => 'Lūgums izvēlēties spēcīgu paroli';

  @override
  String get passwordsDoNotMatch => 'Paroles nesakrīt';

  @override
  String get passwordIsWrong => 'Ievadītā parole ir nepareiza';

  @override
  String get publicChatAddresses => 'Publiskas tērzēšanas adreses';

  @override
  String get createNewAddress => 'Izveidot jaunu adresi';

  @override
  String get joinSpace => 'Pievienoties vietai';

  @override
  String get publicSpaces => 'Publiskas vietas';

  @override
  String get addChatOrSubSpace => 'Pievienot tērzēšanu vai apakšvietu';

  @override
  String get thisDevice => 'Šī ierīce:';

  @override
  String get initAppError => 'Atgadījās kļūda lietotnes sāknēšanas laikā';

  @override
  String searchIn(String chat) {
    return 'Meklēt tērzēšanā \"$chat\"...';
  }

  @override
  String get searchMore => 'Meklēt vairāk...';

  @override
  String get gallery => 'Galerija';

  @override
  String get files => 'Datnes';

  @override
  String sessionLostBody(String url, String error) {
    return 'Sesija ir zaudēta. Lūgums ziņot par šo kļūdu izstrādātājiem $url. Kļūdas ziņojums ir: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Lietotne tagad mēģina atjaunot sesiju no rezerves kopijas. Lūgums ziņot par šo kļūdu izstrādātājiem $url. Kļūdas ziņojums ir: $error';
  }

  @override
  String get sendReadReceipts => 'Nosūtīt lasīšanas atskaites';

  @override
  String get sendTypingNotificationsDescription =>
      'Citi tērzēšanas dalībnieki var redzēt, kad raksti jaunu ziņu.';

  @override
  String get sendReadReceiptsDescription =>
      'Citi tērzēšanas dalībnieki var redzēt, kad izlasīji ziņu.';

  @override
  String get formattedMessages => 'Formatētas ziņas';

  @override
  String get formattedMessagesDescription =>
      'Attēlot bagātinātu ziņu saturu, piemēram, ar Markdown iezīmētu treknrakstu.';

  @override
  String get verifyOtherUser => '🔐 Apliecināt otru lietotāju';

  @override
  String get verifyOtherUserDescription =>
      'Ar cita lietotāja apliecināšanu vari pārliecināties, ka zini, kam Tu tiešām raksti. 💪\n\nKad uzsāc apliecināšanu, Tu un otrs lietotājs lietotnē redzēs uznirstošo logu. Tajā jūs redzēsiet dažādas emocijzīmes vai skaitļus, kas ir jāsalīdzina savā starpā.\n\nLabākais veids, kā to izdarīt, ir satikties vai uzsākt videozvanu. 👭';

  @override
  String get verifyOtherDevice => '🔐 Apliecināt otru ierīci';

  @override
  String get verifyOtherDeviceDescription =>
      'Kad apliecini citu ierīci, šīs ierīces var apmainīt atslēgas, palielinot vispārējo drošību. 💪 Pēc apliecināšanas uzsākšanas abās ierīcēs lietotnē parādīsies uznirstošais logs. Tajā būs redzamas dažādas emocijzīmes vai skaitļi, kas jāsalīdzina abās ierīcēs. Vislabāk, ja abas ierīces ir pieejamas, pirms tiek uzsākta apliecināšana. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender apstiprināja atslēgas apliecināšanu';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender atcēla atslēgas apliecināšanu';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender pabeidza atslēgas apliecināšanu';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender ir gatavs atslēgas apliecināšanai';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender pieprasīja atslēgas apliecināšanu';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender uzsāka atslēgas apliecināšanu';
  }

  @override
  String get incomingMessages => 'Ienākošās ziņas';

  @override
  String get stickers => 'Uzlīmes';

  @override
  String get discover => 'Atklāt';

  @override
  String get commandHint_ignore => 'Neņemt vērā norādīto REChain Id';

  @override
  String get commandHint_unignore =>
      'Atcelt norādītā REChain Id neņemšanu vērā';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread nelasītas tērzēšanas';
  }

  @override
  String get noDatabaseEncryption =>
      'Šajā platformā datubāzes šifrēšana netiek nodrošināta';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Šobrīd ir izslēgti $count lietotāji.';
  }

  @override
  String goToSpace(Object space) {
    return 'Doties uz vietu: $space';
  }

  @override
  String get markAsUnread => 'Atzīmēt kā nelasītu';

  @override
  String userLevel(int level) {
    return '$level - Lietotājs';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Moderators';
  }

  @override
  String adminLevel(int level) {
    return '$level - Pārvaldītājs';
  }

  @override
  String get changeGeneralChatSettings =>
      'Mainīt vispārējos tērzēšanas iestatījumus';

  @override
  String get inviteOtherUsers => 'Uzaicināt šajā tērzēšanā citus lietotājus';

  @override
  String get changeTheChatPermissions => 'Mainīt tērzēšanas atļaujas';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Mainīt tērzēšanas vēstures redzamību';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Mainīt tērzēšanas galveno publisko adresi';

  @override
  String get sendRoomNotifications => 'Sūtīt @istaba paziņojumus';

  @override
  String get changeTheDescriptionOfTheGroup => 'Mainīt tērzēšanas aprakstu';

  @override
  String get chatPermissionsDescription =>
      'Noteikt, kurš spēka līmenis ir nepieciešams noteiktām darbībām šajā tērzēšanā. Spēka līmeņi 0, 50 un 100 parasti atbilst lietotājiem, moderatoriem un pārvaldītājiem, bet ir iespējams jebkāds iedalījums.';

  @override
  String updateInstalled(String version) {
    return '🎉 Atjauninājums $version uzstādīts.';
  }

  @override
  String get changelog => 'Izmaiņu žurnāls';

  @override
  String updateAvailable(String version) {
    return 'Update $version available';
  }

  @override
  String get download => 'Download';

  @override
  String get sendCanceled => 'Sūtīšana atcelta';

  @override
  String get loginWithREChainId => 'Login with REChain-ID';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Neizskatās pēc saderīga mājasservera. Nepareizs URL?';

  @override
  String get calculatingFileSize => 'Aprēķina datnes lielumu...';

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Viena no ierīcēm nav apliecināta';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Piezīme: kad visas ierīces tiek savienotas ar tērzēšanu rezerves kopiju, tās tiek automātiski apliecinātas.';

  @override
  String get continueText => 'Turpināt';

  @override
  String get blur => 'Aizmiglojums:';

  @override
  String get opacity => 'Necaurredzamība:';

  @override
  String get setWallpaper => 'Iestatīt ekrāntapeti';

  @override
  String get manageAccount => 'Pārvaldīt kontu';

  @override
  String get noContactInformationProvided =>
      'Serveris nesniedz nekādu derīgu saziņas informāciju';

  @override
  String get contactServerAdmin => 'Sazināties ar servera pārvaldītāju';

  @override
  String get contactServerSecurity =>
      'Sazināties ar servera drošības uzturētājiem';

  @override
  String get supportPage => 'Atbalsta lapa';

  @override
  String get serverInformation => 'Informācija par serveri:';

  @override
  String get name => 'Nosaukums';

  @override
  String get version => 'Versija';

  @override
  String get website => 'Tīmekļvietne';

  @override
  String get compress => 'Saspiest';

  @override
  String get boldText => 'Teksts treknrakstā';

  @override
  String get italicText => 'Teksts slīprakstā';

  @override
  String get strikeThrough => 'Pārsvītrots';

  @override
  String get pleaseFillOut => 'Lūgums aizpildīt';

  @override
  String get invalidUrl => 'Nederīgs URL';

  @override
  String get addLink => 'Pievienot saiti';

  @override
  String get unableToJoinChat =>
      'Nevarēja pievienoties tērzēšanai. Varbūt otra puse jau ir aizvērusi sarunu.';

  @override
  String get previous => 'Iepriekšējais';

  @override
  String get otherPartyNotLoggedIn =>
      'Otra puse pašlaik nav pieteikusies un tādēļ nevar saņemt ziņas.';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Izmantot \'$server\', lai pieteiktos';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Ar šo tiek ļauts lietotnei un tīmekļvietnei kopīgot informāciju par Tevi.';

  @override
  String get open => 'Atvērt';

  @override
  String get waitingForServer => 'Gaida serveri...';

  @override
  String get newChatRequest => '📩 Jauns tērzēšanas pieprasījums';

  @override
  String get contentNotificationSettings => 'Satura paziņojumu iestatījumi';

  @override
  String get generalNotificationSettings => 'Vispārēji paziņojumu iestatījumi';

  @override
  String get roomNotificationSettings => 'Istabu paziņojumu iestatījumi';

  @override
  String get userSpecificNotificationSettings =>
      'Lietotāja paziņojumu iestatījumi';

  @override
  String get otherNotificationSettings => 'Citi paziņojumu iestatījumi';

  @override
  String get notificationRuleContainsUserName => 'Saturs lietotāja vārdu';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Paziņo lietotājam, kad ziņa satur viņa lietotājvārdu.';

  @override
  String get notificationRuleMaster => 'Apklusināt visus paziņojumus';

  @override
  String get notificationRuleMasterDescription =>
      'Aizvieto visas pārējās kārtulas un atspējo visus paziņojumus.';

  @override
  String get notificationRuleSuppressNotices => 'Apspiest automātiskās ziņas';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Apspiež paziņojumus no automatizētiem klientiem, piemēram, robotprogrammatūras.';

  @override
  String get notificationRuleInviteForMe => 'Uzaicinājums man';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Paziņo lietotājam, kad viņš ir uzaicināts pievienoties istabai.';

  @override
  String get notificationRuleMemberEvent => 'Dalībnieka notikums';

  @override
  String get notificationRuleMemberEventDescription =>
      'Apspiež paziņojums par dalības notikumiem.';

  @override
  String get notificationRuleIsUserMention => 'Lietotāja pieminēšana';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Paziņo lietotājam, kad viņš ziņā ir tieši pieminēts.';

  @override
  String get notificationRuleContainsDisplayName => 'Satur attēlojamo vārdu';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Paziņo lietotājam, kad ziņa satur viņa attēlojamo vārdu.';

  @override
  String get notificationRuleIsRoomMention => 'Istabas pieminēšana';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Paziņo lietotājam, kad tiek pieminēta istaba.';

  @override
  String get notificationRuleRoomnotif => 'Istabas paziņojums';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Paziņo lietotājam, kad ziņa satur \"@istaba\".';

  @override
  String get notificationRuleTombstone => 'Kapakmens';

  @override
  String get notificationRuleTombstoneDescription =>
      'Paziņo lietotājam par istabu aizvēršanas ziņām.';

  @override
  String get notificationRuleReaction => 'Reakcija';

  @override
  String get notificationRuleReactionDescription =>
      'Apspiež paziņojums par reakcijām.';

  @override
  String get notificationRuleRoomServerAcl => 'Istabas servera ACL';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Apspiež paziņojumus par istabas servera piekļuves kontroles sarakstiem (ACL).';

  @override
  String get notificationRuleSuppressEdits => 'Apspiest labojumus';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Apspiež paziņojumus par labotām ziņām.';

  @override
  String get notificationRuleCall => 'Zvans';

  @override
  String get notificationRuleCallDescription =>
      'Paziņo lietotājam par zvaniem.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'Šifrēta viens pret viens istaba';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Paziņo lietotājam par ziņām šifrētās viens pret viens istabās.';

  @override
  String get notificationRuleRoomOneToOne => 'Viens pret viens istaba';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Paziņo lietotājam par ziņām viens pret viens istabās.';

  @override
  String get notificationRuleMessage => 'Ziņa';

  @override
  String get notificationRuleMessageDescription =>
      'Paziņo lietotājam par vispārējām ziņām.';

  @override
  String get notificationRuleEncrypted => 'Šifrēts';

  @override
  String get notificationRuleEncryptedDescription =>
      'Paziņo lietotājam par ziņām šifrētās istabās.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Paziņo lietotājam par Jitsi logrīka notikumiem.';

  @override
  String get notificationRuleServerAcl => 'Apspiest servera ACL notikumus';

  @override
  String get notificationRuleServerAclDescription =>
      'Apspiež notikumus par servera ACL notikumiem.';

  @override
  String unknownPushRule(String rule) {
    return 'Nezināma pašpiegādes kārtula \'$rule\'';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return '🎙️ $duration - Balss ziņa no $sender';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Ja tiek izdzēsts šis paziņojuma iestatījums, to nevar atsaukt.';

  @override
  String get more => 'Vairāk';

  @override
  String get shareKeysWith => 'Kopīgot atslēgas ar...';

  @override
  String get shareKeysWithDescription =>
      'Kurām ierīcēm vajadzētu uzticēties, lai tajās varētu lasīt ziņas šifrētajās tērzēšanās?';

  @override
  String get allDevices => 'Visas ierīces';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Savstarpēji apliecinātas ierīces, ja iespējots';

  @override
  String get crossVerifiedDevices => 'Savstarpēji apliecinātas ierīces';

  @override
  String get verifiedDevicesOnly => 'Tikai apliecinātas ierīces';

  @override
  String get takeAPhoto => 'Uzņemt attēlu';

  @override
  String get recordAVideo => 'Ierakstīt video';

  @override
  String get optionalMessage => '(Pēc izvēles) Ziņojums...';

  @override
  String get notSupportedOnThisDevice => 'Šajā ierīcē nav atbalstīts';

  @override
  String get enterNewChat => 'Ieiet jaunajā tērzēšanā';

  @override
  String get approve => 'Apstiprināt';

  @override
  String get youHaveKnocked => 'Tu pieklauvēji';

  @override
  String get pleaseWaitUntilInvited =>
      'Lūgums tagad uzgaidīt, līdz kāds no istabas uzaicinās Tevi.';

  @override
  String get commandHint_logout => 'Atteikties pašreizējā ierīcē';

  @override
  String get commandHint_logoutall => 'Atteikties visās izmantotajās ierīcēs';

  @override
  String get displayNavigationRail => 'Rādīt pārvietošanās sliedi viedierīcēs';

  @override
  String get customReaction => 'Pielāgota reakcija';

  @override
  String get moreEvents => 'Vairāk notikumu';

  @override
  String get showMore => 'Show more';

  @override
  String get showLess => 'Show less';

  @override
  String get declineInvitation => 'Noraidīt uzaicinājumu';

  @override
  String get noMessagesYet => 'Vēl nav ziņu';

  @override
  String get longPressToRecordVoiceMessage =>
      'Ilga piespiešana, lai ierakstītu balss ziņu.';

  @override
  String get pause => 'Apturēt';

  @override
  String get resume => 'Atsākt';

  @override
  String get removeFromSpaceDescription =>
      'Tērzēšana tiks noņemta no vietas, bet tā joprojām būs redzama tērzēšanu sarakstā.';

  @override
  String countChats(int chats) {
    return '$chats tērzēšanas';
  }

  @override
  String spaceMemberOf(String spaces) {
    return '$spaces dalībnieks';
  }

  @override
  String spaceMemberOfCanKnock(String spaces) {
    return '$spaces dalībnieks var pieklauvēt';
  }

  @override
  String get startPoll => 'Sākt aptauju';

  @override
  String get endPoll => 'Noslēgt aptauju';

  @override
  String get answersVisible => 'Atbildes ir redzamas';

  @override
  String get pollQuestion => 'Aptaujas jautājums';

  @override
  String get answerOption => 'Atbildes iespēja';

  @override
  String get addAnswerOption => 'Pievienot atbildes iespēju';

  @override
  String get allowMultipleAnswers => 'Atļaut vairākas atbildes';

  @override
  String get pollHasBeenEnded => 'Aptauja ir noslēgusies';

  @override
  String countVotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count balsis',
      one: '$count balss',
      zero: '$count balsu',
    );
    return '$_temp0';
  }

  @override
  String get answersWillBeVisibleWhenPollHasEnded =>
      'Atbildes būs redzams, kad aptauja noslēgsies';

  @override
  String get replyInThread => 'Atbildēt pavedienā';

  @override
  String countReplies(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count atbildes',
      one: '$count atbilde',
      zero: '$count atbilžu',
    );
    return '$_temp0';
  }

  @override
  String get thread => 'Pavediens';

  @override
  String get backToMainChat => 'Atgriezties galvenajā tērzēšanā';

  @override
  String get saveChanges => 'Saglabāt izmaiņas';

  @override
  String get createSticker => 'Izveidot uzlīmi vai emocijzīmi';

  @override
  String get useAsSticker => 'Izmantot kā uzlīmi';

  @override
  String get useAsEmoji => 'Izmantot kā emocijzīmi';

  @override
  String get stickerPackNameAlreadyExists =>
      'Uzlīmju pakas nosaukums jau pastāv';

  @override
  String get newStickerPack => 'Jauna uzlīmju paka';

  @override
  String get stickerPackName => 'Uzlīmju pakas nosaukums';

  @override
  String get attribution => 'Piedēvējums';

  @override
  String get skipChatBackup => 'Izlaist tērzēšanu rezerves kopēšanu';

  @override
  String get skipChatBackupWarning =>
      'Vai tiešām? Bez tērzēšanu rezerves kopēšanas var tikt zaudēta piekļuve savām ziņām, kad tiks mainīta ierīce.';

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
  String get loadingMessages => 'Ielādē ziņas';

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
      'Lūgums ņemt vērā, ka video zvani pašreiz ir beta stāvoklī. Tie visās platformās var nedarboties kā paredzēs vai pat nedarboties vispār.';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get incomingCall => 'Incoming call';

  @override
  String get videoCall => 'Videozvans';

  @override
  String get voiceCall => 'Balss zvans';

  @override
  String get missedCall => 'Missed call';

  @override
  String get callBack => 'Call back';

  @override
  String get hangUp => 'Hang up';

  @override
  String get waitingForParticipant => 'Waiting for participant...';

  @override
  String get decline => 'Atteikt';

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
