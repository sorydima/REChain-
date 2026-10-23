// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Basque (`eu`).
class L10nEu extends L10n {
  L10nEu([String locale = 'eu']) : super(locale);

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
  String get repeatPassword => 'Idatzi berriro pasahitza';

  @override
  String get notAnImage => 'Ez da irudi-fitxategia.';

  @override
  String get remove => 'Kendu';

  @override
  String get importNow => 'Inportatu orain';

  @override
  String get importEmojis => 'Inportatu emojiak';

  @override
  String get importFromZipFile => 'Inportatu .zip fitxategi batetik';

  @override
  String get exportEmotePack => 'Esportatu emote-sorta .zip gisa';

  @override
  String get replace => 'Ordezkatu';

  @override
  String get about => 'Honi buruz';

  @override
  String aboutHomeserver(String homeserver) {
    return '$homeserver(e)ri buruz';
  }

  @override
  String get accept => 'Onartu';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username(e)k gonbidapena onartu du';
  }

  @override
  String get account => 'Kontua';

  @override
  String get accountsAndSettings => 'Accounts and settings';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username(e)k ertzetik ertzerako zifratzea gaitu du';
  }

  @override
  String get addEmail => 'Gehitu ePosta';

  @override
  String get confirmREChainId =>
      'Please confirm your REChain ID in order to delete your account.';

  @override
  String supposedMxid(String mxid) {
    return 'Hau $mxid izan behar da';
  }

  @override
  String get addToSpace => 'Gehitu gunera';

  @override
  String get admin => 'Administratzailea';

  @override
  String get alias => 'ezizena';

  @override
  String get all => 'Guztia';

  @override
  String get commandHint_roomupgrade =>
      'Bertsio-berritu gela adierazitako gela-bertsiora';

  @override
  String get commandHint_googly => 'Bidali begi dibertigarri batzuk';

  @override
  String get commandHint_cuddle => 'Bidali besarkada samurra';

  @override
  String get commandHint_hug => 'Bidali besarkada';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName(e)k begi dibertigarri batzuk bidali dizkizu';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName(e)k samurki besarkatu zaitu';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName(e)k besarkatu zaitu';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName(e)k deia erantzun du';
  }

  @override
  String get anyoneCanJoin => 'Edonor batu daiteke';

  @override
  String get appLock => 'Aplikazioa blokeatzea';

  @override
  String get appLockDescription =>
      'Blokeatu aplikazioa pin kode batekin erabiltzen ari ez zarenean';

  @override
  String get archive => 'Fitxategia';

  @override
  String get areGuestsAllowedToJoin =>
      'Batu daitezke bisitan dauden erabiltzaileak?';

  @override
  String get areYouSure => 'Ziur zaude?';

  @override
  String get discardEdits => 'You have unsaved changes. Discard your edits?';

  @override
  String get areYouSureYouWantToLogout =>
      'Ziur zaude saioa amaitu nahi duzula?';

  @override
  String get askSSSSSign =>
      'Beste pertsona egiaztatzeko, sartu zure biltegiratze segururako pasaesaldia edo berreskuratze-gakoa.';

  @override
  String askVerificationRequest(String username) {
    return '$username(r)en egiaztaketa-eskaera onartu?';
  }

  @override
  String get autoplayImages =>
      'Automatikoki abiarazi pegatina eta emote animatuak';

  @override
  String badServerLoginTypesException(
    String serverVersions,
    String supportedVersions,
    Object suportedVersions,
  ) {
    return 'Zerbitzariak ondorengo aukerak onartzen ditu saioa hasteko:\n$serverVersions\nBaina aplikazioak hauek onartzen ditu bakarrik:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Jakinarazi idazten nagoela';

  @override
  String get swipeRightToLeftToReply => 'Herrestatu eskuin-ezker erantzuteko';

  @override
  String get sendOnEnter => 'Bidali enter sakatuz';

  @override
  String get noMoreChatsFound => 'Ez da beste txatik aurkitu...';

  @override
  String get noChatsFoundHere =>
      'Ez da txatik aurkitu. Hasi norbaitekin txateatzen beheko botoia erabiliz. ⤵️';

  @override
  String get unread => 'Irakurtzeke';

  @override
  String get space => 'Gunea';

  @override
  String get banFromChat => 'Txatera batzeko debekua ezarri';

  @override
  String get banned => 'Kanporatuta';

  @override
  String bannedUser(String username, String targetName) {
    return '$username(e)k $targetName(r)i debekua ezarri dio';
  }

  @override
  String get blockDevice => 'Blokeatu gailua';

  @override
  String get blocked => 'Blokeatuta';

  @override
  String get cancel => 'Utzi';

  @override
  String cantOpenUri(String uri) {
    return 'Ezin da $uri URIa ireki';
  }

  @override
  String get changeDeviceName => 'Aldatu gailuaren izena';

  @override
  String changedTheChatAvatar(String username) {
    return '$username(e)k txataren abatarra aldatu du';
  }

  @override
  String changedTheChatDescription(Object username) {
    return '$username(e)k txataren deskribapena aldatu du';
  }

  @override
  String changedTheChatName(Object username) {
    return '$username(e)k txataren izena aldatu du';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username(e)k txataren baimenak aldatu ditu';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username(e)k bere ezizena aldatu du. Aurrerantzean \'$displayname\' izango da';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username(e)k bisitarien sarbide-arauak aldatu ditu';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username(e)k bisitarien arauak aldatu ditu: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username(e)k historiaren ikusgaitasuna aldatu du';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username(e)k historiaren ikusgaitasuna $rules-(e)ra aldatu du';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username(e)k batzeko arauak aldatu ditu';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username(e)k batzeko arauak aldatu ditu: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username(e)k profileko abatarra aldatu du';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username(e)k gelaren ezizena aldatu du';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username(e)k gonbidapen-esteka aldatu du';
  }

  @override
  String get changePassword => 'Aldatu pasahitza';

  @override
  String get changeTheHomeserver => 'Aldatu zerbitzaria';

  @override
  String get changeTheme => 'Aldatu itxura';

  @override
  String get changeTheNameOfTheGroup => 'Taldearen izena aldatu';

  @override
  String get changeYourAvatar => 'Aldatu abatarra';

  @override
  String get channelCorruptedDecryptError => 'Zifratzea hondatu egin da';

  @override
  String get chat => 'Txata';

  @override
  String get chatBackup => 'Txataren babeskopia';

  @override
  String get chatDetails => 'Txataren xehetasunak';

  @override
  String get chats => 'Txatak';

  @override
  String get chooseAStrongPassword => 'Aukeratu pasahitz sendo bat';

  @override
  String get clearArchive => 'Ezabatu artxiboa';

  @override
  String get close => 'Itxi';

  @override
  String get commandHint_markasdm =>
      'Markatu mezu-zuzen gela bezala Matrix x REChain ID jakin honentzat';

  @override
  String get commandHint_markasgroup => 'Markatu talde bezala';

  @override
  String get commandHint_ban => 'Debekatu erabiltzailea gela honetan';

  @override
  String get commandHint_clearcache => 'Ezabatu katxea';

  @override
  String get commandHint_create =>
      'Sortu taldeko-txat huts bat\nErabili --no-encyption zifratzea desgaitzeko';

  @override
  String get commandHint_discardsession => 'Baztertu saioa';

  @override
  String get commandHint_dm =>
      'Hasi banakako txat bat\nErabili --no-encyption zifratzea desgaitzeko';

  @override
  String get commandHint_html => 'Bidali testua HTML formatuan';

  @override
  String get commandHint_invite => 'Gonbidatu erabiltzailea gela honetara';

  @override
  String get commandHint_join => 'Batu adierazitako gelara';

  @override
  String get commandHint_kick => 'Kendu erabiltzaile hori gela honetatik';

  @override
  String get commandHint_leave => 'Utzi gela hau';

  @override
  String get commandHint_me => 'Deskribatu zure burua';

  @override
  String get commandHint_myroomavatar =>
      'Ezarri zure irudia gela honetarako (mxc-uri bidez)';

  @override
  String get commandHint_myroomnick => 'Ezarri zure ezizena gela honetarako';

  @override
  String get commandHint_op =>
      'Zehaztu erabiltzaile honen botere-maila (defektuz: 50)';

  @override
  String get commandHint_plain => 'Bidali formaturik gabeko testua';

  @override
  String get commandHint_react => 'Bidali erantzuna erreakzio gisa';

  @override
  String get commandHint_send => 'Bidali testua';

  @override
  String get commandHint_unban =>
      'Kendu erabiltzaileak gela honetan duen debekua';

  @override
  String get commandInvalid => 'Komandoa ez da baliozkoa';

  @override
  String commandMissing(String command) {
    return '$command ez da komandoa.';
  }

  @override
  String get compareEmojiMatch => 'Konparatu emojiak';

  @override
  String get compareNumbersMatch => 'Konparatu zenbakiak';

  @override
  String get configureChat => 'Txata konfiguratu';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Kontaktua taldera gonbidatu da';

  @override
  String get contentHasBeenReported =>
      'Edukia zerbitzariko administratzaileei jakinarazi zaie';

  @override
  String get copiedToClipboard => 'Arbelera kopiatu da';

  @override
  String get copy => 'Kopiatu';

  @override
  String get copyToClipboard => 'Kopiatu arbelera';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Ezin izan da mezua deszifratu: $error';
  }

  @override
  String get checkList => 'Kontrol-zerrenda';

  @override
  String countParticipants(int count) {
    return '$count partaide';
  }

  @override
  String countInvited(int count) {
    return '$count gonbidatu';
  }

  @override
  String get create => 'Sortu';

  @override
  String createdTheChat(String username) {
    return '💬 $username(e)k txata sortu du';
  }

  @override
  String get createGroup => 'Sortu taldea';

  @override
  String get createNewSpace => 'Gune berria';

  @override
  String get currentlyActive => 'Une honetan aktibo';

  @override
  String get darkTheme => 'Iluna';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String get deactivateAccountWarning =>
      'Honek zure kontua desaktibatuko du. Ezin da desegin! Ziur zaude?';

  @override
  String get defaultPermissionLevel =>
      'Erabiltzaile berrien defektuzko botere-maila';

  @override
  String get delete => 'Ezabatu';

  @override
  String get deleteAccount => 'Ezabatu kontua';

  @override
  String get deleteMessage => 'Mezuak ezabatu';

  @override
  String get devices => 'Gailuak';

  @override
  String get directChats => 'Banakako txatak';

  @override
  String get displaynameHasBeenChanged => 'Ezizena aldatu da';

  @override
  String get downloadFile => 'Deskargatu fitxategia';

  @override
  String get edit => 'Editatu';

  @override
  String get editBlockedServers => 'Editatu blokeatutako zerbitzariak';

  @override
  String get chatPermissions => 'Txataren baimenak';

  @override
  String get editDisplayname => 'Editatu ezizena';

  @override
  String get editRoomAliases => 'Editatu gelaren aliasak';

  @override
  String get editRoomAvatar => 'Gelaren abatarra editatu';

  @override
  String get emoteExists => 'Emotea badago lehendik ere!';

  @override
  String get emoteInvalid => 'Emotearen laburdura ez da baliozkoa!';

  @override
  String get emoteKeyboardNoRecents =>
      'Oraintsu erabilitako emoteak hemen ageriko dira…';

  @override
  String get globalChatId => 'Txat ID orokorra';

  @override
  String get accessAndVisibility => 'Sarbidea eta ikusgaitasuna';

  @override
  String get accessAndVisibilityDescription =>
      'Nork du txat honetara batzeko baimena eta nola aurkitu daiteke txata.';

  @override
  String get customEmojisAndStickers => 'Emoji eta pegatina propioak';

  @override
  String get customEmojisAndStickersBody =>
      'Gehitu edo partekatu edozein txatetan erabil daitezkeen emoji edo pegatina propioak.';

  @override
  String get emoteShortcode => 'Laburdura';

  @override
  String get emptyChat => 'Txata hutsik dago';

  @override
  String get enableEmotesGlobally => 'Gaitu emote-sorta txat guztietarako';

  @override
  String get enableEncryption => 'Gaitu zifratzea';

  @override
  String get enableEncryptionWarning =>
      'Ezingo duzu zifratzea ezgaitu. Ziur zaude?';

  @override
  String get encrypted => 'Zifratuta';

  @override
  String get encryption => 'Zifratzea';

  @override
  String get encryptionNotEnabled => 'Zifratzea ez dago gaituta';

  @override
  String endedTheCall(String senderName) {
    return '$senderName(e)k deia amaitu du';
  }

  @override
  String get enterAnEmailAddress => 'Sartu helbide elektroniko bat';

  @override
  String errorObtainingLocation(String error) {
    return 'Errorea kokapena lortzerakoan: $error';
  }

  @override
  String get fontSize => 'Letraren tamaina';

  @override
  String get forward => 'Birbidali';

  @override
  String get fromJoining => 'Batzeaz geroztik';

  @override
  String get fromTheInvitation => 'Gonbidapenaz geroztik';

  @override
  String get group => 'Taldea';

  @override
  String get chatDescription => 'Txataren deskribapena';

  @override
  String get chatDescriptionHasBeenChanged => 'Txataren deskribapena aldatu da';

  @override
  String get groupIsPublic => 'Taldea publikoa da';

  @override
  String get groups => 'Taldeak';

  @override
  String groupWith(String displayname) {
    return '$displayname duen taldea';
  }

  @override
  String get guestsAreForbidden => 'Ez, bisitariak ez daude baimenduta';

  @override
  String get guestsCanJoin => 'Bai, bisitariak batu daitezke';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username(e)k $targetName(r)en gonbidapena atzera bota du';
  }

  @override
  String get help => 'Laguntza';

  @override
  String get hideRedactedMessages => 'Ezkutatu atzera botatako mezuak';

  @override
  String get hideRedactedMessagesBody =>
      'Norbaitek mezuren bat atzera botaz gero, mezua txatetik kenduko da, abisurik gabe.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Ezkutatu mezuen formatu ezezagun edo baliogabea';

  @override
  String get block => 'Blokeatu';

  @override
  String get blockedUsers => 'Blokeatutako erabiltzaileak';

  @override
  String get blockListDescription =>
      'Gogaitzen zaituzten erabiltzaileak blokeatu ditzakezu. Ez duzu blokeatutakoen zerrendan dituzun erabiltzaileen mezurik edo gelara batzeko gonbidapenik jasoko.';

  @override
  String get blockUsername => 'Ezikusi erabiltzaile-izena';

  @override
  String get iHaveClickedOnLink => 'Estekan sakatu dut';

  @override
  String get incorrectPassphraseOrKey =>
      'Pasaesaldi edo berreskuratze-gakoa ez da zuzena';

  @override
  String get inviteContact => 'Kontaktuak gonbidatu';

  @override
  String inviteContactToGroup(String groupName) {
    return 'Gonbidatu kontaktua $groupName(e)ra';
  }

  @override
  String get noChatDescriptionYet =>
      'Ez da txaterako deskribapenik sortu oraindik.';

  @override
  String get tryAgain => 'Saiatu berriro';

  @override
  String get invalidServerName => 'Zerbitzari-izenak ez du balio';

  @override
  String get invited => 'Gonbidatuta';

  @override
  String get redactMessageDescription =>
      'Mezua elkarrizketa honetako partaide guztientzat botako da atzera. Ezin da desegin.';

  @override
  String get optionalRedactReason =>
      '(Aukerakoa) Mezua atzera botatzearen arrazoia…';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username(e)k $targetName gonbidatu du';
  }

  @override
  String get invitedUsersOnly => 'Gonbidatutako erabiltzaileak solik';

  @override
  String inviteText(String username, String link) {
    return '$username(e)k REChain.ra gonbidatu zaitu.\n1. Bisitatu https://github.com/sorydima/REChain- eta instalatu aplikazioa\n2. Eman izena edo hasi saioa\n3. Ireki gonbidapen-esteka:\n$link';
  }

  @override
  String get isTyping => 'idazten ari da…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username txatera batu da';
  }

  @override
  String get joinRoom => 'Batu gelara';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username(e)k $targetName kanporatu du';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username(e)k $targetName kanporatu eta debekua ezarri dio';
  }

  @override
  String get kickFromChat => 'Txatetik kanporatu';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Azkenekoz aktibo: $localizedTimeShort';
  }

  @override
  String get leave => 'Irten';

  @override
  String get leftTheChat => 'Txatetik irten da';

  @override
  String get lightTheme => 'Argia';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Kargatu $count partaide gehiago';
  }

  @override
  String get dehydrate => 'Esportatu saioa eta ezabatu gailua';

  @override
  String get dehydrateWarning =>
      'Ekintza hau ezin da desegin. Egiaztatu babeskopia toki seguruan gorde duzula.';

  @override
  String get hydrate => 'Lehengoratu babeskopia bat erabiliz';

  @override
  String get loadingPleaseWait => 'Kargatzen… itxaron.';

  @override
  String get loadMore => 'Kargatu gehiago…';

  @override
  String get locationDisabledNotice =>
      'Kokapen zerbitzuak ezgaituta daude. Gaitu zure kokapena partekatu ahal izateko.';

  @override
  String get locationPermissionDeniedNotice =>
      'Kokapen baimena ukatu da. Eman zure kokapena partekatzeko baimena.';

  @override
  String get login => 'Hasi saioa';

  @override
  String logInTo(String homeserver) {
    return 'Hasi saioa $homeserver(e)n';
  }

  @override
  String get logout => 'Amaitu saioa';

  @override
  String get mention => 'Aipatu';

  @override
  String get messages => 'Mezuak';

  @override
  String get messagesStyle => 'Mezuak:';

  @override
  String get moderator => 'Moderatzailea';

  @override
  String get muteChat => 'Mututu txata';

  @override
  String get newChat => 'Txat berria';

  @override
  String get newMessageInrechainonline => '💬 Mezu berria REChain.n';

  @override
  String get newVerificationRequest => 'Egiaztaketa-eskaera berria!';

  @override
  String get next => 'Hurrengoa';

  @override
  String get no => 'Ez';

  @override
  String get noConnectionToTheServer => 'Ez dago konexiorik zerbitzariarekin';

  @override
  String get noEmotesFound => 'Ez da emoterik aurkitu. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Zifratzea aktiba dezakezu soilik gelak publikoa izateari utzi badio.';

  @override
  String get noGoogleServicesWarning =>
      'Ez dirudi Firebase Cloud Messaging zure mugikorrean erabilgarri dagoenik. Jakinarazpenak jasotzeko ntfy instalatzea gomendatzen dugu. ntfy edo beste Unified Push hornitzaileren batekin, push jakinarazpenak jaso ditzazkezu datuentzako segurua den modu batean. ntfy PlayStore edo F-Droid dendetatik deskarga dezakezu.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 ez da REChain zerbitzari bat, $server2 erabili nahi duzu haren ordez?';
  }

  @override
  String get shareInviteLink => 'Partekatu gonbidapen-esteka';

  @override
  String get scanQrCode => 'Eskaneatu QR kodea';

  @override
  String get noPasswordRecoveryDescription =>
      'Oraindik ez duzu pasahitza berreskuratzeko modurik gehitu.';

  @override
  String get noPermission => 'Baimenik gabe';

  @override
  String get noRoomsFound => 'Ez da gelarik aurkitu…';

  @override
  String get notifications => 'Jakinarazpenak';

  @override
  String numUsersTyping(int count) {
    return '$count erabiltzaile idazten ari dira…';
  }

  @override
  String get obtainingLocation => 'Kokapena atzitzen…';

  @override
  String get ok => 'Ados';

  @override
  String get onlineKeyBackupEnabled => 'Gakoen online babeskopia gaituta dago';

  @override
  String get oopsPushError =>
      'Hara! Zoritxarrez, errore bat gertatu da push jakinarazpenak ezartzerakoan.';

  @override
  String get oopsSomethingWentWrong => 'Hara, zerbaitek huts egin du…';

  @override
  String get openAppToReadMessages => 'Ireki aplikazioa mezuak irakurtzeko';

  @override
  String get openCamera => 'Ireki kamera';

  @override
  String get oneClientLoggedOut => 'Zure gailuetako batek saioa amaitu du';

  @override
  String get addAccount => 'Gehitu kontua';

  @override
  String get editBundlesForAccount => 'Editatu kontu honetarako sortak';

  @override
  String get addToBundle => 'Gehitu sortara';

  @override
  String get removeFromBundle => 'Kendu sorta honetatik';

  @override
  String get bundleName => 'Sortaren izena';

  @override
  String get openInMaps => 'Ireki mapen aplikazioan';

  @override
  String get link => 'Esteka';

  @override
  String get or => 'Edo';

  @override
  String get participant => 'Partaide';

  @override
  String get passphraseOrKey => 'pasaesaldia edo berreskuratze-gakoa';

  @override
  String get password => 'Pasahitza';

  @override
  String get passwordForgotten => 'Pasahitza ahaztu dut';

  @override
  String get passwordHasBeenChanged => 'Pasahitza aldatu da';

  @override
  String get passwordRecoverySettings => 'Pasahitza berreskuratzeko ezarpenak';

  @override
  String get passwordRecovery => 'Pasahitzaren berreskurapena';

  @override
  String get pin => 'Finkatu';

  @override
  String get pleaseChooseAPasscode => 'Aukeratu sartzeko kode bat';

  @override
  String get pleaseClickOnLink =>
      'Sakatu ePostako estekan eta ondoren jarraitu.';

  @override
  String get pleaseEnterYourPassword => 'Sartu zure pasahitza';

  @override
  String get pleaseEnterYourPin => 'Sartu zure PINa';

  @override
  String get pleaseEnterYourUsername => 'Sartu zure erabiltzaile-izena';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Jarraitu webguneko argibideak eta sakatu \'Hurrengoa\'.';

  @override
  String get privacy => 'Pribatutasuna';

  @override
  String get publicRooms => 'Gela publikoak';

  @override
  String get reason => 'Arrazoia';

  @override
  String redactedBy(String username) {
    return '$username(e)k atzera bota du';
  }

  @override
  String redactedByBecause(String username, String reason) {
    return '$username(e)k atzera bota du \"$reason\" dela-eta';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username(e)k gertaera bat atzera bota du';
  }

  @override
  String get redactMessage => 'Bota mezua atzera';

  @override
  String get reject => 'Baztertu';

  @override
  String rejectedTheInvitation(String username) {
    return '$username(e)k gonbidapena baztertu du';
  }

  @override
  String get removeAllOtherDevices => 'Kendu gainerako gailu guztiak';

  @override
  String get unbanFromChat => 'Kendu txatean duen debekua';

  @override
  String get removeYourAvatar => 'Kendu zure abatarra';

  @override
  String get replaceRoomWithNewerVersion =>
      'Ordezkatu gela bertsio berriago batekin';

  @override
  String get reply => 'Erantzun';

  @override
  String get reportMessage => 'Salatu mezua';

  @override
  String get roomHasBeenUpgraded => 'Gela bertsio-berritu da';

  @override
  String sendingFilesDoNotExit(int count) {
    return 'Sending $count files... Please do not exit!';
  }

  @override
  String get roomVersion => 'Gelaren bertsioa';

  @override
  String get compressingVideo => 'Compressing video...';

  @override
  String get saveFile => 'Gorde fitxategia';

  @override
  String get search => 'Bilatu';

  @override
  String get security => 'Segurtasuna';

  @override
  String get send => 'Bidali';

  @override
  String get sendAMessage => 'Bidali mezua';

  @override
  String get sendAsText => 'Bidali testu bezala';

  @override
  String get sendAudio => 'Bidali audioa';

  @override
  String get sendFile => 'Bidali fitxategia';

  @override
  String get sendImage => 'Bidali irudia';

  @override
  String sendImages(int count) {
    return 'Bidali $count irudi';
  }

  @override
  String get sendMessages => 'Mezuak bidali';

  @override
  String get sendVideo => 'Bidali bideoa';

  @override
  String sentAFile(String username) {
    return '📁 $username(e)k fitxategia bidali du';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username(e)k audioa bidali du';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username(e)k irudia bidali du';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username(e)k pegatina bidali du';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username(e)k bideoa bidali du';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName(e)k deiaren informazioa bidali du';
  }

  @override
  String get setAsCanonicalAlias => 'Ezarri alias nagusi bezala';

  @override
  String get setChatDescription => 'Ezarri txataren deskribapena';

  @override
  String get setStatus => 'Ezarri egoera';

  @override
  String get settings => 'Ezarpenak';

  @override
  String get share => 'Partekatu';

  @override
  String sharedTheLocation(String username) {
    return '$username(e)k kokapena partekatu du';
  }

  @override
  String get shareLocation => 'Partekatu kokapena';

  @override
  String get skip => 'Saltatu';

  @override
  String get sourceCode => 'Iturburu kodea';

  @override
  String get spaceIsPublic => 'Gunea publikoa da';

  @override
  String get spaceName => 'Gunearen izena';

  @override
  String startedACall(String senderName) {
    return '$senderName(e)k deia hasi du';
  }

  @override
  String get status => 'Egoera';

  @override
  String get statusExampleMessage => 'Zer moduz zaude gaur?';

  @override
  String get submit => 'Bidali';

  @override
  String get synchronizingPleaseWait => 'Sinkronizatzen… itxaron.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Sinkronizatzen… (%$percentage)';
  }

  @override
  String get systemTheme => 'Sistemak darabilena';

  @override
  String get theyDontMatch => 'Ez datoz bat';

  @override
  String get theyMatch => 'Bat datoz';

  @override
  String get tooManyRequestsWarning =>
      'Eskaera gehiegi. Saiatu berriro geroago!';

  @override
  String get tryToSendAgain => 'Saiatu berriro bidaltzen';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username(e)k $targetName(r)i debekua kendu dio';
  }

  @override
  String get unblockDevice => 'Desblokeatu gailua';

  @override
  String get unknownDevice => 'Gailu ezezaguna';

  @override
  String get unknownEncryptionAlgorithm => 'Zifratze-algoritmo ezezaguna';

  @override
  String unknownEvent(String type) {
    return '\'$type\' gertaera ezezaguna';
  }

  @override
  String get unmuteChat => 'Utzi txata mututzeari';

  @override
  String get unpin => 'Utzi finkatzeari';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username eta beste $count idazten ari dira…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username eta $username2 idazten ari dira…';
  }

  @override
  String userIsTyping(String username) {
    return '$username idazten ari da…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username(e)k txata utzi du';
  }

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username(e)k $type gertaera bat bidali du';
  }

  @override
  String get unverified => 'Egiaztatu gabe(a)';

  @override
  String get verified => 'Egiaztatuta';

  @override
  String get verifyStart => 'Abiarazi egiaztaketa';

  @override
  String get verifySuccess => 'Ondo egiaztatu duzu!';

  @override
  String get verifyTitle => 'Beste kontua egiaztatzen';

  @override
  String get visibilityOfTheChatHistory => 'Txat-historiaren ikusgaitasuna';

  @override
  String get visibleForAllParticipants => 'Partaide guztientzat ikusgai';

  @override
  String get visibleForEveryone => 'Edonorentzat ikusgai';

  @override
  String get voiceMessage => 'Ahozko mezua';

  @override
  String get waitingPartnerAcceptRequest => 'Kideak eskaera onartuko zain…';

  @override
  String get waitingPartnerEmoji => 'Kideak emojia onartuko zain…';

  @override
  String get waitingPartnerNumbers => 'Kideak zenbakiak onartuko zain…';

  @override
  String get warning => 'Kontuz!';

  @override
  String get weSentYouAnEmail => 'ePosta bat bidali dizugu';

  @override
  String get whoCanPerformWhichAction => 'Nork zer egin dezakeen';

  @override
  String get whoIsAllowedToJoinThisGroup => 'Nor batu daiteke talde honetara?';

  @override
  String get whyDoYouWantToReportThis => 'Zergatik salatu nahi duzu?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Helbide hauekin pasahitza berreskuratu dezakezu.';

  @override
  String get writeAMessage => 'Idatzi mezua…';

  @override
  String get yes => 'Bai';

  @override
  String get you => 'Zeu';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Ez duzu txat honetan parte hartzen honezkero';

  @override
  String get yourPublicKey => 'Zure gako publikoa';

  @override
  String get messageInfo => 'Mezuaren xehetasunak';

  @override
  String get time => 'Ordua';

  @override
  String get sender => 'Igorlea';

  @override
  String get openGallery => 'Ireki bilduma';

  @override
  String get removeFromSpace => 'Kendu gunetik';

  @override
  String get markAsRead => 'Markatu irakurritzat';

  @override
  String get reportUser => 'Salatu erabiltzailea';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender(e)k $reaction(r)ekin erreakzionatu du';
  }

  @override
  String get pinMessage => 'Finkatu gelan';

  @override
  String get confirmEventUnpin =>
      'Ziur zaude gertaera finaktzeari utzi nahi diozula?';

  @override
  String get emojis => 'Emojiak';

  @override
  String get unsupportedAndroidVersion => 'Android bertsioa ez da bateragarria';

  @override
  String get unsupportedAndroidVersionLong =>
      'Funtzio honek Android bertsio berriago bat behar du. Egiaztatu eguneraketak ote dauden edo begiratu Mobile Katya OS-ek zure gailuarentzat aukerarik eskaintzen duen.';

  @override
  String get youRejectedTheInvitation => 'Gonbidapena baztertu duzu';

  @override
  String get youJoinedTheChat => 'Txatera batu zara';

  @override
  String get youAcceptedTheInvitation => '👍 Gonbidapena onartu duzu';

  @override
  String youBannedUser(String user) {
    return '$user(r)i debekua ezarri diozu';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return '$user(r)i luzatutako gonbidapena baliogabetu duzu';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 $user(e)k gonbidatu zaitu';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 $user gonbidatu duzu';
  }

  @override
  String youKicked(String user) {
    return '👞 $user kanporatu duzu';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 $user kanporatu eta debekua ezarri diozu';
  }

  @override
  String youUnbannedUser(String user) {
    return '$user(r)i debekua kendu diozu';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user(e)k baimena eskatu du';
  }

  @override
  String get usersMustKnock => 'Erabiltzaileek baimena eskatu behar dute';

  @override
  String get noOneCanJoin => 'Ezin da inor batu';

  @override
  String get knock => 'Eskatu baimena';

  @override
  String get users => 'Erabiltzaileak';

  @override
  String get storeInAndroidKeystore => 'Gorde Android KeyStore-n';

  @override
  String get storeInAppleKeyChain => 'Gorde Apple KeyChain-en';

  @override
  String get storeSecurlyOnThisDevice => 'Gorde gailu honetan modu seguruan';

  @override
  String countFiles(int count) {
    return '$count fitxategi';
  }

  @override
  String get user => 'Erabiltzailea';

  @override
  String get custom => 'Neurrira egindakoa';

  @override
  String get whyIsThisMessageEncrypted => 'Zergatik ezin da mezu hau irakurri?';

  @override
  String get noKeyForThisMessage =>
      'Mezua gailu honetan saioa hasi baino lehen bidali bazen gertatu daiteke.\n\nBeste aukera bat igorleak zure gailua blokeatu izana da, edo zerbaitek huts egin izana interneteko konexioan.\n\nMezua beste saio batean irakur dezakezu? Hala bada, mezua transferitu dezakezu! Zoaz Ezrpenetara > Gailuak eta baieztatu zure gailuek bata bestea egiaztatu dutela. Gela irekiko duzun hurrengo aldian eta bi saioak aurreko planoan irekita daudenean, gakoak automatikoki partekatuko dira.\n\nEz duzu gakorik galdu nahi saioa amaitu edo gailuak aldatzen dituzunean? Baieztatu ezarpenetan txaten babeskopiak gaituta dituzula.';

  @override
  String get newSpace => 'Gune berria';

  @override
  String get doNotShowAgain => 'Ez erakutsi berriro';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Txata hutsik dago ($oldDisplayName zen lehen)';
  }

  @override
  String get newSpaceDescription =>
      'Guneek txatak taldekatzea ahalbidetzen dute eta komunitate pribatu edo publikoak osatzea.';

  @override
  String get encryptThisChat => 'Zifratu txata';

  @override
  String get disableEncryptionWarning =>
      'Segurtasun arrazoiak direla-eta, ezin duzu lehendik zifratuta zegoen txat bateko zifratzea ezgaitu.';

  @override
  String get sorryThatsNotPossible => 'Barka… hori ez da posible';

  @override
  String get reopenChat => 'Ireki txata berriro';

  @override
  String get noBackupWarning =>
      'Adi! Txataren babeskopia gaitzen ez baduzu, ezingo dituzu zifratutako txatak atzitu. Oso gomendagarria da txaten babeskopia gaitzea saioa amaitu baino lehen.';

  @override
  String get noOtherDevicesFound => 'Ez da beste gailurik aurkitu';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Ezin da bidali! Zerbitzariak gehienez $max-ko eranskinak onartzen ditu.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Fitxategia $path(e)n gorde da';
  }

  @override
  String get jumpToLastReadMessage => 'Joan irakurritako azken mezura';

  @override
  String get readUpToHere => 'Honaino irakurrita';

  @override
  String get jump => 'Joan';

  @override
  String get openLinkInBrowser => 'Ireki esteka nabigatzailean';

  @override
  String get reportErrorDescription =>
      '😭 O ez! Zerbaitek huts egin du. Nahi izanez gero, eman garatzaileei errorearen berri.';

  @override
  String get report => 'salatu';

  @override
  String get setColorTheme => 'Ezarri kolore-gaia:';

  @override
  String get invite => 'Gonbidatu';

  @override
  String get inviteGroupChat => '📨 Taldeko txatera gonbidapena';

  @override
  String get invalidInput => 'Sartu duzunak ez du balio!';

  @override
  String wrongPinEntered(int seconds) {
    return 'PIN okerra! Saiatu berriro $seconds segundu barru…';
  }

  @override
  String get pleaseEnterANumber => 'Sartu 0 baino zenbaki handiago bat';

  @override
  String get archiveRoomDescription =>
      'Txata artxibategira mugituko da. Beste erabiltzaileek txatetik alde egin duzula ikusi ahal izango dute.';

  @override
  String get roomUpgradeDescription =>
      'Gela bertsio berri gisa birsortuko da txata. Partaide guztiei jakinaraziko zaie txat berrira aldatu behar direla. Gehiago irakur dezakezu gela bertsioei buruz ondorengo estekan: https://github.com/sorydima/REChain-.git';

  @override
  String get removeDevicesDescription =>
      'Gailu honetako saioa amaituko da eta ezingo duzu mezurik jaso aurrerantzean.';

  @override
  String get banUserDescription =>
      'Erabiltzailea txatetik kanporatu eta berriro sartzeko debekua ezarriko zaio; ezingo da berriro sartu debekua kendu arte.';

  @override
  String get unbanUserDescription =>
      'Erabiltzailea txatera berriro sartu ahal izango da berak nahi izanez gero.';

  @override
  String get kickUserDescription =>
      'Erabiltzailea txatetik kanporatu da baina ez zaio debekua ezarri. Txat publikoen kasuan, edozein momentutan batu daiteke berriro.';

  @override
  String get makeAdminDescription =>
      'Behin erabiltzaile hau administratzaile eginda, litekeena da desegin ezin izatea zuk dituzun baimenak izango dituelako.';

  @override
  String get pushNotificationsNotAvailable =>
      'Push jakinarazpenak ez daude erabilgarri';

  @override
  String get learnMore => 'Gehiago irakurri';

  @override
  String get yourGlobalUserIdIs => 'Zure erabiltzaile-ID orokorra: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Zoritxarrez ez da \"$query\" duen erabiltzailerik aurkitu. Egiaztatu zuzen idatzi duzula.';
  }

  @override
  String get knocking => 'Baimena eskatzen';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Txata $server(e)n bilaketa eginez aurkitu daiteke';
  }

  @override
  String get searchChatsRooms => 'Bilatu #txatak, @erabiltzaileak…';

  @override
  String get nothingFound => 'Ez da ezer aurkitu…';

  @override
  String get groupName => 'Taldearen izena';

  @override
  String get createGroupAndInviteUsers =>
      'Sortu talde bat eta gonbidatu partaideak';

  @override
  String get groupCanBeFoundViaSearch =>
      'Bilaketa erabiliz aurkitu daiteke taldea';

  @override
  String get wrongRecoveryKey =>
      'Barka baina ez dirudi berreskuratze-gako zuzena denik.';

  @override
  String get commandHint_sendraw => 'Bidali json gordina';

  @override
  String get databaseMigrationTitle => 'Datu-basea optimizatu da';

  @override
  String get databaseMigrationBody =>
      'Itxaron, litekeena da tarte bat behar izatea.';

  @override
  String get leaveEmptyToClearStatus => 'Utzi hutsik zure egoera garbitzeko.';

  @override
  String get select => 'Hautatu';

  @override
  String get searchForUsers => 'Bilatu @erabiltzaileak…';

  @override
  String get pleaseEnterYourCurrentPassword => 'Sartu oraingo pasahitza';

  @override
  String get newPassword => 'Pasahitz berria';

  @override
  String get pleaseChooseAStrongPassword => 'Aukeratu pasahitz sendo bat';

  @override
  String get passwordsDoNotMatch => 'Pasahitzak ez datoz bat';

  @override
  String get passwordIsWrong => 'Sartu duzun pasahitza okerra da';

  @override
  String get publicChatAddresses => 'Txataren helbide publikoak';

  @override
  String get createNewAddress => 'Sortu helbide berria';

  @override
  String get joinSpace => 'Batu gunera';

  @override
  String get publicSpaces => 'Gune publikoak';

  @override
  String get addChatOrSubSpace => 'Gehitu txata edo azpi-gunea';

  @override
  String get thisDevice => 'Gailu hau:';

  @override
  String get initAppError => 'Errorea aplikazioa abiaraztean';

  @override
  String searchIn(String chat) {
    return 'Bilatu $chat txatean...';
  }

  @override
  String get searchMore => 'Bilatu gehiago...';

  @override
  String get gallery => 'Galeria';

  @override
  String get files => 'Fitxategiak';

  @override
  String sessionLostBody(String url, String error) {
    return 'Zure saioa galdu da. Jakinarazi errorea garatzaileei $url helbidean. Errorearen mezua ondorengoa da: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Aplikazioa babeskopia erabiliz saioa leheneratzen saiatuko da. Jakinarazi errorea garatzaileei $url helbidean. Errorearen mezua ondorengoa da: $error';
  }

  @override
  String get sendReadReceipts => 'Bidali irakurri izanaren agiria';

  @override
  String get sendTypingNotificationsDescription =>
      'Txateko beste partaideek mezu berri bat idazten ari zarela ikus dezakete.';

  @override
  String get sendReadReceiptsDescription =>
      'Txateko beste partaideek mezu bat irakurri duzula ikus dezakete.';

  @override
  String get formattedMessages => 'Formatua duten mezuak';

  @override
  String get formattedMessagesDescription =>
      'Erakutsi mezu aberatsen edukia markdown erabiliz, testu lodia esaterako.';

  @override
  String get verifyOtherUser => '🔐 Egiaztatu beste erabiltzaile bat';

  @override
  String get verifyOtherUserDescription =>
      'Beste erabiltzaile bat egiaztatzen baduzu, ziur egon zaitezke nori idazten ari zaren. 💪\n\nEgiaztapena hasten duzunean, zuk eta beste erabiltzaileak laster-leiho bat ikusiko duzue aplikazioan. Bertan, elkarrekin alderatu behar diren emoji edo zenbaki batzuk erakutsiko dira.\n\nBideo-dei bat hastea edo aurrez-aurre batzea da horretarako modurik onena. 👭';

  @override
  String get verifyOtherDevice => '🔐 Egiaztatu beste gailu bat';

  @override
  String get verifyOtherDeviceDescription =>
      'Beste gailu bat egiaztatzean, gailu horiek gakoak truka ditzakete, eta segurtasun orokorra handitu. 💪 Egiaztapena hasten duzunean, laster-leiho bat agertuko da bi gailuetan. Bertan, elkarrekin alderatu behar diren emoji edo zenbaki batzuk ikusiko dituzu. Hobe da bi gailuak eskura izatea egiaztapena hasi aurretik. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender(e)k gakoaren egiaztapena onartu du';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender(e)k gakoen egiaztapena ezeztatu du';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender(e)k gakoen egiaztapena osatu du';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender gakoak egiaztatzeko prest dago';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender(e)k gakoen egiaztapena galdegin du';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender(e)k gakoen egiaztapena hasi du';
  }

  @override
  String get incomingMessages => 'Jasotako mezuak';

  @override
  String get stickers => 'Pegatinak';

  @override
  String get discover => 'Arakatu';

  @override
  String get commandHint_ignore => 'Muzin egin Matrix x REChain ID honi';

  @override
  String get commandHint_unignore =>
      'Utzi Matrix x REChain ID honi muzin egiteari';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread mezu irakurri gabe';
  }

  @override
  String get noDatabaseEncryption =>
      'Plataforma honetan ezin da datu-basea zifratu';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Une honetan $count erabiltzaile daude blokeatuta.';
  }

  @override
  String goToSpace(Object space) {
    return 'Joan $space gunera';
  }

  @override
  String get markAsUnread => 'Markatu irakurri gabetzat';

  @override
  String userLevel(int level) {
    return '$level - Erabiltzailea';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Moderatzailea';
  }

  @override
  String adminLevel(int level) {
    return '$level - Administratzailea';
  }

  @override
  String get changeGeneralChatSettings => 'Aldatu txataren ezarpen orokorrak';

  @override
  String get inviteOtherUsers => 'Gonbidatu beste erabiltzaileak txat honetara';

  @override
  String get changeTheChatPermissions => 'Aldatu txataren baimenak';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Aldatu txataren historiaren ikusgaitasuna';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Aldatu txataren helbide publiko nagusia';

  @override
  String get sendRoomNotifications => 'Bidali @gela jakinarazpena';

  @override
  String get changeTheDescriptionOfTheGroup => 'Aldatu txataren deskribapena';

  @override
  String get chatPermissionsDescription =>
      'Definitu zer botere-maila behar den txat honetako ekintza jakinetarako. 0, 50 eta 100 botere-mailek erabiltzaileak, moderatzaileak eta administratzaileak ordezkatzen dituzte, baina edozein graduazio posible da.';

  @override
  String updateInstalled(String version) {
    return '🎉 $version bertsioa instalatu da!';
  }

  @override
  String get changelog => 'Aldaketak';

  @override
  String updateAvailable(String version) {
    return 'Update $version available';
  }

  @override
  String get download => 'Download';

  @override
  String get sendCanceled => 'Bidalketa bertan behera utzi da';

  @override
  String get loginWithREChainId => 'Login with REChain-ID';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Ez dirudi zerbitzaria bateragarria denik. Zuzena da URLa?';

  @override
  String get calculatingFileSize => 'Fitxategiaren tamaina kalkulatzen…';

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Zure gailuetako bat ez dago egiaztatuta';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Oharra: gailu guztiak txat-babeskopiarekin konektatzen dituzunean, automatikoki egiaztatzen dira.';

  @override
  String get continueText => 'Jarraitu';

  @override
  String get blur => 'Lausotu:';

  @override
  String get opacity => 'Opakutasuna:';

  @override
  String get setWallpaper => 'Ezarri horma-irudia';

  @override
  String get manageAccount => 'Kudeatu kontua';

  @override
  String get noContactInformationProvided =>
      'Zerbitzariak ez du harremanetarako informaziorik zehaztu';

  @override
  String get contactServerAdmin =>
      'Jarri harremanetan zerbitzariaren administratzailearekin';

  @override
  String get contactServerSecurity => 'Jakinarazi segurtasun arazo bat';

  @override
  String get supportPage => 'Laguntza orria';

  @override
  String get serverInformation => 'Zerbitzariaren informazioa:';

  @override
  String get name => 'Izena';

  @override
  String get version => 'Bertsioa';

  @override
  String get website => 'Webgunea';

  @override
  String get compress => 'Konprimatu';

  @override
  String get boldText => 'Testu lodia';

  @override
  String get italicText => 'Testu etzana';

  @override
  String get strikeThrough => 'Zirrimarra';

  @override
  String get pleaseFillOut => 'Bete ezazu';

  @override
  String get invalidUrl => 'URL baliogabea';

  @override
  String get addLink => 'Gehitu esteka';

  @override
  String get unableToJoinChat =>
      'Ezin da txatera batu. Agian besteak elkarrizketa itxiko zuen honezkero.';

  @override
  String get previous => 'Aurrekoa';

  @override
  String get otherPartyNotLoggedIn =>
      'Besteak ez du saiorik hasita eta, beraz, ezin du mezurik jaso!';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Erabili \'$server\' saioa hasteko';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Honenbestez, aplikazioak eta webguneak zuri buruzko informazioa partekatzea baimentzen duzu.';

  @override
  String get open => 'Ireki';

  @override
  String get waitingForServer => 'Zerbitzariaren zain…';

  @override
  String get newChatRequest => '📩 Txat-eskaera berria';

  @override
  String get contentNotificationSettings =>
      'Edukiaren jakinarazpenen ezarpenak';

  @override
  String get generalNotificationSettings => 'Jakinarazpen orokorren ezarpenak';

  @override
  String get roomNotificationSettings => 'Gelen jakinarazpenen ezarpenak';

  @override
  String get userSpecificNotificationSettings =>
      'Erabiltzaile zehatzen jakinarazpenen ezarpenak';

  @override
  String get otherNotificationSettings => 'Beste jakinarazpenen ezarpenak';

  @override
  String get notificationRuleContainsUserName => 'Erabiltzaile-izena dauka';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Mezuan erabiltzaile-izena aipatzen denean jakinarazten du.';

  @override
  String get notificationRuleMaster => 'Isilarazi jakinarazpen guztiak';

  @override
  String get notificationRuleMasterDescription =>
      'Gainerako arauak gainidatzi eta jakinarazpenak ezgaitzen ditu.';

  @override
  String get notificationRuleSuppressNotices => 'Ezkutatu mezu automatikoak';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'BOTen eta bestelako bezero automatikoen jakinarazpenak ezkutatzen ditu.';

  @override
  String get notificationRuleInviteForMe => 'Gonbidapena niretzat';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Erabiltzailea gela batera gonbidatzen dutenean jakinarazten du.';

  @override
  String get notificationRuleMemberEvent => 'Kideen gertaera';

  @override
  String get notificationRuleMemberEventDescription =>
      'Kideen gertaeren jakinarazpenak ezkutatzen ditu.';

  @override
  String get notificationRuleIsUserMention => 'Erabiltzailea aipatzea';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Erabiltzailea mezu zuzen batean aipatzen dutenean jakinarazten du.';

  @override
  String get notificationRuleContainsDisplayName => 'Pantaila-izena dauka';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Mezu batek erabiltzailearen pantaila-izena duenean jakinarazten du.';

  @override
  String get notificationRuleIsRoomMention => 'Gelaren aipamena';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Gela aipatzen denean erabiltzailea jakinarazten du.';

  @override
  String get notificationRuleRoomnotif => 'Gelaren jakinarazpena';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Mezu batek \'@room\' duenean erabiltzaileari jakinarazten dio.';

  @override
  String get notificationRuleTombstone => 'Hilarria';

  @override
  String get notificationRuleTombstoneDescription =>
      'Gela desaktibatzeko mezuei buruz jakinarazten dio erabiltzaileari.';

  @override
  String get notificationRuleReaction => 'Erreakzioa';

  @override
  String get notificationRuleReactionDescription =>
      'Erreakzioen jakinarazpenak ezkutatzen ditu.';

  @override
  String get notificationRuleRoomServerAcl => 'Gelaren zerbitzariaren ACLa';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Gela-zerbitzarirako sarbide-kontroleko zerrenden (ACL) jakinarazpenak ezkutatzen ditu.';

  @override
  String get notificationRuleSuppressEdits => 'Ezkutatu edizioak';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Editatutako mezuen jakinarazpenak ezkutatzen ditu.';

  @override
  String get notificationRuleCall => 'Deia';

  @override
  String get notificationRuleCallDescription =>
      'Erabiltzaileari deiei buruz jakinarazten dio.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'Zifratutako bien arteko gela';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Erabiltzailea jakinarazten du zifratutako bien arteko geletako mezuei buruz.';

  @override
  String get notificationRuleRoomOneToOne => 'Bien arteko gela';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Erabiltzailea jakinarazten du bien arteko geletako mezuei buruz.';

  @override
  String get notificationRuleMessage => 'Mezua';

  @override
  String get notificationRuleMessageDescription =>
      'Erabiltzailea jakinarazten du mezu orokorrei buruz.';

  @override
  String get notificationRuleEncrypted => 'Zifratuak';

  @override
  String get notificationRuleEncryptedDescription =>
      'Erabiltzailea jakinarazten du zifratutako geletako mezuei buruz.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Erabiltzailea jakinarazten du Jitsi widgetaren gertaerei buruz.';

  @override
  String get notificationRuleServerAcl =>
      'Ezkutatu zerbitzariaren ACL gertaerak';

  @override
  String get notificationRuleServerAclDescription =>
      'Zerbitzariaren ACL gertaerak ezkutatzen ditu.';

  @override
  String unknownPushRule(String rule) {
    return 'Push arau ezezaguna \'$rule\'';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return '🎙️ $duration - $sender(r)en ahots-mezua';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Jakinarazpen ezarpen hau ezabatzen baduzu, ezin da desegin.';

  @override
  String get more => 'Gehiago';

  @override
  String get shareKeysWith => 'Partekatu gakoak…';

  @override
  String get shareKeysWithDescription =>
      'Zein gailu hartu beharko litzateke fidagarritzat zifratutako txaten mezuak irakur ditzaten?';

  @override
  String get allDevices => 'Gailu guztiekin';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Egiaztapen gurutzatuko gailuekin, gaituta badaude';

  @override
  String get crossVerifiedDevices => 'Egiaztapen gurutzatuko gailuekin';

  @override
  String get verifiedDevicesOnly => 'Egiaztatutako gailuekin soilik';

  @override
  String get takeAPhoto => 'Egin argazkia';

  @override
  String get recordAVideo => 'Grabatu bideoa';

  @override
  String get optionalMessage => 'Mezua (aukerakoa)…';

  @override
  String get notSupportedOnThisDevice => 'Ez da gailu honekin bateragarria';

  @override
  String get enterNewChat => 'Sartu txat berrira';

  @override
  String get approve => 'Onetsi';

  @override
  String get youHaveKnocked => 'Sartzeko baimena eskatu duzu';

  @override
  String get pleaseWaitUntilInvited =>
      'Orain itxaron gelako norbaitek gonbidatzen zaituen arte.';

  @override
  String get commandHint_logout => 'Amaitu saioa gailu honetan';

  @override
  String get commandHint_logoutall =>
      'Amaitu saioa aktibo dauden gailu guztietan';

  @override
  String get displayNavigationRail => 'Erakutsi nabigazio-barra mugikorrean';

  @override
  String get customReaction => 'Erreakzio pertsonalizatua';

  @override
  String get moreEvents => 'Gertaera gehiago';

  @override
  String get showMore => 'Show more';

  @override
  String get showLess => 'Show less';

  @override
  String get declineInvitation => 'Uko egin gonbidapenari';

  @override
  String get noMessagesYet => 'Mezurik ez oraingoz';

  @override
  String get longPressToRecordVoiceMessage =>
      'Sakatuta mantendu ahots-mezua grabatzeko.';

  @override
  String get pause => 'Gelditu';

  @override
  String get resume => 'Jarraitu';

  @override
  String get removeFromSpaceDescription =>
      'Txata gunetik kenduko da, baina txaten zerrendan mantenduko da.';

  @override
  String countChats(int chats) {
    return '$chats txat';
  }

  @override
  String spaceMemberOf(String spaces) {
    return '$spaces guneko kidea';
  }

  @override
  String spaceMemberOfCanKnock(String spaces) {
    return '$spaces guneko kideak sartzeko baimena eska dezake';
  }

  @override
  String get startPoll => 'Hasi bozketa';

  @override
  String get endPoll => 'Amaitu bozketa';

  @override
  String get answersVisible => 'Erakutsi emaitzak';

  @override
  String get pollQuestion => 'Bozketako galdera';

  @override
  String get answerOption => 'Erantzun-aukera';

  @override
  String get addAnswerOption => 'Gehitu erantzun-aukera';

  @override
  String get allowMultipleAnswers => 'Baimendu erantzun bat baino gehiago';

  @override
  String get pollHasBeenEnded => 'Bozketa amaitu da';

  @override
  String countVotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bozka',
      one: 'Bozka bat',
    );
    return '$_temp0';
  }

  @override
  String get answersWillBeVisibleWhenPollHasEnded =>
      'Emaitzak bozketak amaitu duenean egongo dira ikusgai';

  @override
  String get replyInThread => 'Erantzun harian';

  @override
  String countReplies(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count erantzun',
      one: 'Erantzun bat',
    );
    return '$_temp0';
  }

  @override
  String get thread => 'Haria';

  @override
  String get backToMainChat => 'Joan txat nagusira';

  @override
  String get saveChanges => 'Gorde aldaketak';

  @override
  String get createSticker => 'Sortu pegatina edo emojia';

  @override
  String get useAsSticker => 'Erabili pegatina gisa';

  @override
  String get useAsEmoji => 'Erabili emoji gisa';

  @override
  String get stickerPackNameAlreadyExists =>
      'Pegatina-sortaren izena badago lehendik ere';

  @override
  String get newStickerPack => 'Pegatina-sorta berria';

  @override
  String get stickerPackName => 'Pegatina-sortaren izena';

  @override
  String get attribution => 'Sortzailea';

  @override
  String get skipChatBackup => 'Ez egin txataren babeskopia';

  @override
  String get skipChatBackupWarning =>
      'Ziur? Txataren babeskopia gaitzen ez baduzu, gailuz aldatuz gero mezuen sarbidea gal zenezake.';

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
  String get loadingMessages => 'Mezuak kargatzen';

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
      'Kontuan izan bideo-deiak beta fasean daudela. Litekeena da behar bezala erabili ezin izatea —erabili ahal badira—.';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get incomingCall => 'Incoming call';

  @override
  String get videoCall => 'Bideo-deia';

  @override
  String get voiceCall => 'Ahozko deia';

  @override
  String get missedCall => 'Missed call';

  @override
  String get callBack => 'Call back';

  @override
  String get hangUp => 'Hang up';

  @override
  String get waitingForParticipant => 'Waiting for participant...';

  @override
  String get decline => 'Baztertu';

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
