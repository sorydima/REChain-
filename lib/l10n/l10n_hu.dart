// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class L10nHu extends L10n {
  L10nHu([String locale = 'hu']) : super(locale);

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
  String get repeatPassword => 'Jelszó ismétlése';

  @override
  String get notAnImage => 'Nem kép fájl.';

  @override
  String get remove => 'Eltávolítás';

  @override
  String get importNow => 'Importálás most';

  @override
  String get importEmojis => 'Emojik importálása';

  @override
  String get importFromZipFile => 'Importálás zip fájlból';

  @override
  String get exportEmotePack => 'Emojicsomag exportálása zip-be';

  @override
  String get replace => 'Kicserél';

  @override
  String get about => 'Névjegy';

  @override
  String aboutHomeserver(String homeserver) {
    return 'Névjegy $homeserver';
  }

  @override
  String get accept => 'Elfogad';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username elfogadta a meghívást';
  }

  @override
  String get account => 'Fiók';

  @override
  String get accountsAndSettings => 'Accounts and settings';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username aktiválta a végpontok közötti titkosítást';
  }

  @override
  String get addEmail => 'E-mail-cím hozzáadása';

  @override
  String get confirmREChainId =>
      'Please confirm your REChain ID in order to delete your account.';

  @override
  String supposedMxid(String mxid) {
    return '$mxid-nek kell lennie';
  }

  @override
  String get addToSpace => 'Hozzáadás a térhez';

  @override
  String get admin => 'Adminisztrátor';

  @override
  String get alias => 'álnév';

  @override
  String get all => 'Összes';

  @override
  String get commandHint_roomupgrade =>
      'Szoba frissítése a megadott szoba verzióra';

  @override
  String get commandHint_googly => 'Gülüszemek küldése';

  @override
  String get commandHint_cuddle => 'Összebújás küldése';

  @override
  String get commandHint_hug => 'Ölelés küldése';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName gülüszemeket küld';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName hozzád bújik';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName megölel';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName válaszolt a hívásra';
  }

  @override
  String get anyoneCanJoin => 'Bárki csatlakozhat';

  @override
  String get appLock => 'Alkalmazás zár';

  @override
  String get appLockDescription =>
      'Applikáció zárolása PIN kóddal használaton kívül';

  @override
  String get archive => 'Archívum';

  @override
  String get areGuestsAllowedToJoin => 'Csatlakozhatnak-e vendégek';

  @override
  String get areYouSure => 'Biztos benne?';

  @override
  String get discardEdits => 'You have unsaved changes. Discard your edits?';

  @override
  String get areYouSureYouWantToLogout => 'Biztosan kijelentkezik?';

  @override
  String get askSSSSSign =>
      'A másik fél igazolásához meg kell adnia a biztonságos tároló jelmondatát vagy a visszaállítási kulcsotát.';

  @override
  String askVerificationRequest(String username) {
    return 'Elfogadja $username hitelesítési kérelmét?';
  }

  @override
  String get autoplayImages =>
      'Animált matricák és hangulatjelek automatikus lejátszása';

  @override
  String badServerLoginTypesException(
    String serverVersions,
    String supportedVersions,
    Object suportedVersions,
  ) {
    return 'A REChain-kiszolgáló a következő bejelentkezéseket támogatja:\n$serverVersions\nDe ez az alkalmazást csak ezeket támogatja:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Gépelési értesítés megjelenítése';

  @override
  String get swipeRightToLeftToReply => 'Húzza balra a válaszoláshoz';

  @override
  String get sendOnEnter => 'Küldés Enterrel';

  @override
  String get noMoreChatsFound => 'Nem található több csevegés...';

  @override
  String get noChatsFoundHere =>
      'Itt még nem található csevegés. Kezdjen egy új csevegést valakivel a lenti gomb segítéségvel. ⤵️';

  @override
  String get unread => 'Olvasatlan';

  @override
  String get space => 'Tér';

  @override
  String get banFromChat => 'Kitiltás a csevegésből';

  @override
  String get banned => 'Kitiltva';

  @override
  String bannedUser(String username, String targetName) {
    return '$username kitiltva $targetName által';
  }

  @override
  String get blockDevice => 'Eszköz blokkolása';

  @override
  String get blocked => 'Blokkolva';

  @override
  String get cancel => 'Mégse';

  @override
  String cantOpenUri(String uri) {
    return 'Nem sikerült a következő URI megnyitása: $uri';
  }

  @override
  String get changeDeviceName => 'Eszköznév módosítása';

  @override
  String changedTheChatAvatar(String username) {
    return '$username módosította a csevegési profilképét';
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
    return '$username módosította a csevegési engedélyeket';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username módosította a megjelenített nevét erre: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username módosította a vendégek hozzáférési szabályokat';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username módosította a vendégek hozzáférési szabályait a következőre: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username módosította az előzmények láthatóságát';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username módosította az előzmények láthatóságát a következőre: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username módosított a csatlakozási szabályokat';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username módosította a csatlakozási szabályokat a következőre: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username módosította a profilképét';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username módosította a szoba álneveit';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username módosította a meghívó hivatkozást';
  }

  @override
  String get changePassword => 'Jelszó módosítása';

  @override
  String get changeTheHomeserver => 'REChain-kiszolgáló váltás';

  @override
  String get changeTheme => 'Stílusának módosítása';

  @override
  String get changeTheNameOfTheGroup => 'Csoport nevének módosítása';

  @override
  String get changeYourAvatar => 'Profilkép módosítása';

  @override
  String get channelCorruptedDecryptError => 'A titkosítás megsérült';

  @override
  String get chat => 'Csevegés';

  @override
  String get chatBackup => 'Csevegés biztonsági mentés';

  @override
  String get chatDetails => 'Csevegés részletei';

  @override
  String get chats => 'Csevegések';

  @override
  String get chooseAStrongPassword => 'Válasszon egy erős jelszót';

  @override
  String get clearArchive => 'Archívum ürítése';

  @override
  String get close => 'Bezár';

  @override
  String get commandHint_markasdm =>
      'Szoba megjelölése mint közvetlen csevegő szoba az adott REChain ID-nél';

  @override
  String get commandHint_markasgroup => 'Jelölés csoportnak';

  @override
  String get commandHint_ban => 'Adott felhasználó kitiltása a szobából';

  @override
  String get commandHint_clearcache => 'Gyorsítótár törlése';

  @override
  String get commandHint_create =>
      'Egy üres csevegő csoport létrehozása\nA --no-encryption paraméterrel feloldhatja a titkosítást';

  @override
  String get commandHint_discardsession => 'Munkamenet elvetése';

  @override
  String get commandHint_dm =>
      'Közvetlen csevegés indítása\nA --no-encryption paraméterrel kikapcsolhatja a titkosítást';

  @override
  String get commandHint_html => 'HTML formázott szöveg küldése';

  @override
  String get commandHint_invite => 'Adott felhasználó meghívása ebbe a szobába';

  @override
  String get commandHint_join => 'Csatlakozás a megadott szobához';

  @override
  String get commandHint_kick => 'A megadott felhasználó kirúgása a szobából';

  @override
  String get commandHint_leave => 'Szoba elhagyása';

  @override
  String get commandHint_me => 'Írja le magát';

  @override
  String get commandHint_myroomavatar =>
      'Profilképe hozzárendelése a szobához (mxc URI használatával)';

  @override
  String get commandHint_myroomnick =>
      'Megjelenített nevének hozzárendelése a szobához';

  @override
  String get commandHint_op =>
      'Az adott felhasználó hozzáférési szintjének megadása (alapértelmezett: 50)';

  @override
  String get commandHint_plain => 'Formázatlan szöveg küldése';

  @override
  String get commandHint_react => 'Válasz küldése reakcióként';

  @override
  String get commandHint_send => 'Szöveg küldése';

  @override
  String get commandHint_unban =>
      'Adott felhasználó kitiltásának feloldása a szobához';

  @override
  String get commandInvalid => 'Érvénytelen parancs';

  @override
  String commandMissing(String command) {
    return '$command nem egy parancs.';
  }

  @override
  String get compareEmojiMatch => 'Kérem, hasonlítsa össze a hangulatjeleket';

  @override
  String get compareNumbersMatch => 'Kérem, hasonlítsa össze a számokat';

  @override
  String get configureChat => 'Csevegés konfigurálása';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Kapcsolat meghívásra került a csoportba';

  @override
  String get contentHasBeenReported =>
      'A tartalom jelentésre került a szerver adminisztrátorok számára';

  @override
  String get copiedToClipboard => 'Vágólapra másolva';

  @override
  String get copy => 'Másolás';

  @override
  String get copyToClipboard => 'Vágólapra másolás';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Nem sikerült visszafejteni az üzenetet: $error';
  }

  @override
  String get checkList => 'Tennivalók listája';

  @override
  String countParticipants(int count) {
    return '$count résztvevő';
  }

  @override
  String countInvited(int count) {
    return '$count meghívott';
  }

  @override
  String get create => 'Létrehoz';

  @override
  String createdTheChat(String username) {
    return '💬 $username csevegést hozott létre';
  }

  @override
  String get createGroup => 'Csoport létrehozása';

  @override
  String get createNewSpace => 'Új tér';

  @override
  String get currentlyActive => 'Jelenleg aktív';

  @override
  String get darkTheme => 'Sötét';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String get deactivateAccountWarning =>
      'Ez deaktiválja a felhasználói fiókját. Ez nem vonható vissza! Biztos benne?';

  @override
  String get defaultPermissionLevel =>
      'Alapértelmezett hozzáférési szint új felhasználóknál';

  @override
  String get delete => 'Törlés';

  @override
  String get deleteAccount => 'Fiók törlése';

  @override
  String get deleteMessage => 'Üzenet törlése';

  @override
  String get devices => 'Eszközök';

  @override
  String get directChats => 'Privát Csevegések';

  @override
  String get displaynameHasBeenChanged => 'A megjelenítési név megváltozott';

  @override
  String get downloadFile => 'Fájl letöltése';

  @override
  String get edit => 'Szerkeszt';

  @override
  String get editBlockedServers => 'Blokkolt szerverek szerkesztése';

  @override
  String get chatPermissions => 'Csevegés engedélyek';

  @override
  String get editDisplayname => 'Megjelenítési név szerkesztése';

  @override
  String get editRoomAliases => 'Szoba álnevek szerkesztése';

  @override
  String get editRoomAvatar => 'Szoba-profilkép szerkesztése';

  @override
  String get emoteExists => 'A hangulatjel már létezik!';

  @override
  String get emoteInvalid => 'Érvénytelen hangulatjel rövidkód!';

  @override
  String get emoteKeyboardNoRecents =>
      'A nemrég használt hangulatjelek fognak itt megjelenni...';

  @override
  String get globalChatId => 'Átfogó csevegő ID';

  @override
  String get accessAndVisibility => 'Hozzáférés és láthatóság';

  @override
  String get accessAndVisibilityDescription =>
      'Ki számára engedélyezett a csevegéshez való csatlakozás, és hogyan találhatja azt meg.';

  @override
  String get customEmojisAndStickers => 'Egyedi hangulatjelek és matricák';

  @override
  String get customEmojisAndStickersBody =>
      'Egyedi hangulatjelek és matricák hozzáadása, amelyek bármely csevegésben felhasználhatóak.';

  @override
  String get emoteShortcode => 'Hangulatjel rövidkód';

  @override
  String get emptyChat => 'Üres csevegés';

  @override
  String get enableEmotesGlobally =>
      'Hangulatjel csomag engedélyezése globálisan';

  @override
  String get enableEncryption => 'Titkosítás engedélyezése';

  @override
  String get enableEncryptionWarning =>
      'Többé nem fogja tudni kikapcsolni a titkosítást. Biztos benne?';

  @override
  String get encrypted => 'Titkosított';

  @override
  String get encryption => 'Titkosítás';

  @override
  String get encryptionNotEnabled => 'Titkosítás nem engedélyezve';

  @override
  String endedTheCall(String senderName) {
    return '$senderName befejezte a hívást';
  }

  @override
  String get enterAnEmailAddress => 'Adjon meg egy email címet';

  @override
  String errorObtainingLocation(String error) {
    return 'Hiba a helymeghatározáskor: $error';
  }

  @override
  String get fontSize => 'Betűméret';

  @override
  String get forward => 'Továbbítás';

  @override
  String get fromJoining => 'Csatlakozás óta';

  @override
  String get fromTheInvitation => 'Meghívás óta';

  @override
  String get group => 'Csoport';

  @override
  String get chatDescription => 'Csevegés leírás';

  @override
  String get chatDescriptionHasBeenChanged => 'A csevegés leírás megváltozott';

  @override
  String get groupIsPublic => 'A csoport nyilvános';

  @override
  String get groups => 'Csoportok';

  @override
  String groupWith(String displayname) {
    return 'Csoport $displayname-al';
  }

  @override
  String get guestsAreForbidden => 'A vendégek nem engedélyezettek';

  @override
  String get guestsCanJoin => 'Csatlakozhatnak vendégek';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username visszavonta $targetName meghívását';
  }

  @override
  String get help => 'Súgó';

  @override
  String get hideRedactedMessages => 'Szerkesztett üzenetek elrejtése';

  @override
  String get hideRedactedMessagesBody =>
      'Ha valaki szerkeszti az üzenetét, ez az üzenet nem jelenik meg a csevegés során.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Érvénytelen vagy ismeretlen üzenetformátum elrejtése';

  @override
  String get block => 'Blokkolás';

  @override
  String get blockedUsers => 'Blokkolt felhasználók';

  @override
  String get blockListDescription =>
      'Az Önt zavaró felhasználókat blokkolhatja. A blokkolt listán található felhasználóktól nem tud fogadni üzenetet vagy szoba meghívást.';

  @override
  String get blockUsername => 'Felhasználónév ignorálása';

  @override
  String get iHaveClickedOnLink => 'Rákattintottam a linkre';

  @override
  String get incorrectPassphraseOrKey =>
      'Hibás jelmondat vagy visszaállítási kulcs';

  @override
  String get inviteContact => 'Ismerős meghívása';

  @override
  String inviteContactToGroup(String groupName) {
    return 'Ismerős meghívása a(z) $groupName csoportba';
  }

  @override
  String get noChatDescriptionYet => 'Még nincs csevegő szoba leírás.';

  @override
  String get tryAgain => 'Próbálja újra';

  @override
  String get invalidServerName => 'Hibás szerver név';

  @override
  String get invited => 'Meghívott';

  @override
  String get redactMessageDescription =>
      'A társalgásban összes résztvevője számára módosításra kerül az üzenet. Ez nem visszavonható.';

  @override
  String get optionalRedactReason => '(Választható) A szerkesztés oka...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username meghívta $targetName felhasználót';
  }

  @override
  String get invitedUsersOnly => 'Csak meghívott felhasználók';

  @override
  String inviteText(String username, String link) {
    return '$username meghívta a REChain.be.\n1. Keresse fel a github.com/sorydima/REChain- oldalt, és telepítse az alkalmazást \n2. Regisztráljon vagy jelentkezzen be \n3. Nyissa meg a meghívó linket: \n $link';
  }

  @override
  String get isTyping => 'épp gépel…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username csatlakozott a csevegéshez';
  }

  @override
  String get joinRoom => 'Csatlakozás a szobához';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username kirúgta $targetName-t';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username kirúgta és kitiltotta $targetName-t';
  }

  @override
  String get kickFromChat => 'Kirúgás a csevegésből';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Utoljára aktív: $localizedTimeShort';
  }

  @override
  String get leave => 'Elhagy';

  @override
  String get leftTheChat => 'Elhagyta a csevegést';

  @override
  String get lightTheme => 'Világos';

  @override
  String loadCountMoreParticipants(int count) {
    return 'További $count résztvevő betöltése';
  }

  @override
  String get dehydrate => 'Munkamenet exportálása és az eszköz törlése';

  @override
  String get dehydrateWarning =>
      'Ez nem visszavonható. Bizonyosodjon meg róla, hogy biztonságos helyre menti a fájlt.';

  @override
  String get hydrate => 'Visszaállítás mentett fájlból';

  @override
  String get loadingPleaseWait => 'Betöltés… Kérem, várjon.';

  @override
  String get loadMore => 'Továbbiak betöltése…';

  @override
  String get locationDisabledNotice =>
      'A helymeghatározás ki van kapcsolva. Kérem, kapcsolja be, hogy meg tudja osztani helyzetét.';

  @override
  String get locationPermissionDeniedNotice =>
      'A helymeghatározás visszautasításra került. Kérem engedélyezze, hogy meg tudja osztani helyzetét.';

  @override
  String get login => 'Bejelentkezés';

  @override
  String logInTo(String homeserver) {
    return 'Bejelentkezés a(z) $homeserver REChain-kiszolgálóra';
  }

  @override
  String get logout => 'Kijelentkezés';

  @override
  String get mention => 'Megemlítés';

  @override
  String get messages => 'Üzenetek';

  @override
  String get messagesStyle => 'Üzenetek:';

  @override
  String get moderator => 'Moderátor';

  @override
  String get muteChat => 'Csevegés némítása';

  @override
  String get newChat => 'Új csevegés';

  @override
  String get newMessageInrechainonline => '💬 Új REChain üzenet';

  @override
  String get newVerificationRequest => 'Új hitelesítési kérelem!';

  @override
  String get next => 'Következő';

  @override
  String get no => 'Nem';

  @override
  String get noConnectionToTheServer => 'Nem elérhető a szerver';

  @override
  String get noEmotesFound => 'Nem találhatóak hangulatjelek. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Csak akkor kapcsolható be a titkosítás, ha a szoba nem nyilvánosan hozzáférhető.';

  @override
  String get noGoogleServicesWarning =>
      'Úgy tűnik a Firebase Cloud Messaging nem elérhető a készülékén. Ha mégis push értesítéseket kíván kapni, javasoljuk a ntfy telepítését. A ntfy vagy más egyéb Egyesített Push szolgáltató esetében úgy kaphat értesítést, hogy adatai biztonságban maradnak. Letöltheti a ntfy-t a PlayStore-ból, vagy F-Droid-ról is.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 nem egy REChain szerver, akarja használja a $server2 szervert inkább?';
  }

  @override
  String get shareInviteLink => 'Meghívó link megosztása';

  @override
  String get scanQrCode => 'QR kód beolvasása';

  @override
  String get noPasswordRecoveryDescription =>
      'Még nem adott meg semmilyen módszert a jelszava visszaállítására.';

  @override
  String get noPermission => 'Nincs engedély';

  @override
  String get noRoomsFound => 'Nem találhatóak szobák…';

  @override
  String get notifications => 'Értesítések';

  @override
  String numUsersTyping(int count) {
    return '$count felhasználó gépel…';
  }

  @override
  String get obtainingLocation => 'Tartózkodási hely lekérése…';

  @override
  String get ok => 'Ok';

  @override
  String get onlineKeyBackupEnabled => 'Online kulcsmentés engedélyezve';

  @override
  String get oopsPushError =>
      'Hoppá! Sajnos hiba lépett fel a push értesítések beállításakor.';

  @override
  String get oopsSomethingWentWrong => 'Hoppá, valami hiba lépett fel…';

  @override
  String get openAppToReadMessages =>
      'Alkalmazás megnyitása az üzenetek elolvasásához';

  @override
  String get openCamera => 'Kamera megnyitása';

  @override
  String get oneClientLoggedOut => 'Az egyik kliense kijelentkezett';

  @override
  String get addAccount => 'Fiók hozzáadása';

  @override
  String get editBundlesForAccount =>
      'Fiókcsoportok szerkesztése ehhez a fiókhoz';

  @override
  String get addToBundle => 'Hozzáadás fiókcsoporthoz';

  @override
  String get removeFromBundle => 'Eltávolítás a fiókcsoportból';

  @override
  String get bundleName => 'Fiókcsoport neve';

  @override
  String get openInMaps => 'Megnyitás térképen';

  @override
  String get link => 'Hivatkozás';

  @override
  String get or => 'Vagy';

  @override
  String get participant => 'Résztvevő';

  @override
  String get passphraseOrKey => 'jelmondat vagy visszaállítási kulcs';

  @override
  String get password => 'Jelszó';

  @override
  String get passwordForgotten => 'Elfelejtett jelszó';

  @override
  String get passwordHasBeenChanged => 'A jelszó módosításra került';

  @override
  String get passwordRecoverySettings => 'Jelszó-helyreállítási beállítások';

  @override
  String get passwordRecovery => 'Jelszó visszaállítás';

  @override
  String get pin => 'Rögzítés';

  @override
  String get pleaseChooseAPasscode => 'Kérem, válasszon egy kódot';

  @override
  String get pleaseClickOnLink =>
      'Kérem, kattintson a linkre az emailben, és folytassa a műveletet.';

  @override
  String get pleaseEnterYourPassword => 'Kérem, adja meg jelszavát';

  @override
  String get pleaseEnterYourPin => 'Kérem, írja be PIN kódját';

  @override
  String get pleaseEnterYourUsername => 'Kérem, adja meg a felhasználónevét';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Kérem, kövesse az instrukciókat az oldalon, és nyomjon a tovább gombra.';

  @override
  String get privacy => 'Adatvédelem';

  @override
  String get publicRooms => 'Nyilvános szobák';

  @override
  String get reason => 'Indok';

  @override
  String redactedBy(String username) {
    return '$username által szerkesztve';
  }

  @override
  String redactedByBecause(String username, String reason) {
    return '$username által szerkesztve, mivel: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username szerkesztett egy eseményt';
  }

  @override
  String get redactMessage => 'Üzenet szerkesztése';

  @override
  String get reject => 'Elutasít';

  @override
  String rejectedTheInvitation(String username) {
    return '$username elutasította a meghívást';
  }

  @override
  String get removeAllOtherDevices => 'Minden más eszköz eltávolítása';

  @override
  String get unbanFromChat => 'Csevegés kitiltás feloldása';

  @override
  String get removeYourAvatar => 'Profilképének törlése';

  @override
  String get replaceRoomWithNewerVersion =>
      'Szoba cserélése egy újabb verzióra';

  @override
  String get reply => 'Válasz';

  @override
  String get reportMessage => 'Üzenet jelentése';

  @override
  String get roomHasBeenUpgraded => 'A szoba frissítésre került';

  @override
  String sendingFilesDoNotExit(int count) {
    return 'Sending $count files... Please do not exit!';
  }

  @override
  String get roomVersion => 'Szoba verzió';

  @override
  String get compressingVideo => 'Compressing video...';

  @override
  String get saveFile => 'Fájl mentése';

  @override
  String get search => 'Keresés';

  @override
  String get security => 'Biztonság';

  @override
  String get send => 'Küldés';

  @override
  String get sendAMessage => 'Üzenet küldése';

  @override
  String get sendAsText => 'Küldés szövegként';

  @override
  String get sendAudio => 'Hangüzenet küldése';

  @override
  String get sendFile => 'Fájl küldése';

  @override
  String get sendImage => 'Kép küldése';

  @override
  String sendImages(int count) {
    return '$count kép küldése';
  }

  @override
  String get sendMessages => 'Üzenetek küldése';

  @override
  String get sendVideo => 'Videó küldése';

  @override
  String sentAFile(String username) {
    return '📁 $username küldött egy fájlt';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username hangüzenetet küldött';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username képet küldött';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username matricát küldött';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username videót küldött';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName hívásinformációt küldött';
  }

  @override
  String get setAsCanonicalAlias => 'Beállítás alapértelmezett álnévként';

  @override
  String get setChatDescription => 'Csevegés leírás beállítása';

  @override
  String get setStatus => 'Állapot beállítása';

  @override
  String get settings => 'Beállítások';

  @override
  String get share => 'Megosztás';

  @override
  String sharedTheLocation(String username) {
    return '$username megosztotta a pozícióját';
  }

  @override
  String get shareLocation => 'Pozíció megosztása';

  @override
  String get skip => 'Kihagy';

  @override
  String get sourceCode => 'Forráskód';

  @override
  String get spaceIsPublic => 'A tér publikus';

  @override
  String get spaceName => 'Tér név';

  @override
  String startedACall(String senderName) {
    return '$senderName hívást indított';
  }

  @override
  String get status => 'Állapot';

  @override
  String get statusExampleMessage => 'Hogy érzi magát a mai napon?';

  @override
  String get submit => 'Beküldés';

  @override
  String get synchronizingPleaseWait => 'Szinkronizálás... Kérem, várjon.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Szinkronizálás… ($percentage%)';
  }

  @override
  String get systemTheme => 'Rendszer';

  @override
  String get theyDontMatch => 'Nem egyezőek';

  @override
  String get theyMatch => 'Egyezőek';

  @override
  String get tooManyRequestsWarning =>
      'Túl sok egyidejű kérelem. Kérem próbálja meg később!';

  @override
  String get tryToSendAgain => 'Újraküldés megpróbálása';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username feloldotta $targetName kitiltását';
  }

  @override
  String get unblockDevice => 'Eszköz blokkolás feloldása';

  @override
  String get unknownDevice => 'Ismeretlen eszköz';

  @override
  String get unknownEncryptionAlgorithm => 'Ismeretlen titkosítási algoritmus';

  @override
  String unknownEvent(String type) {
    return 'Ismeretlen esemény: \'$type\'';
  }

  @override
  String get unmuteChat => 'Csevegés némítás feloldása';

  @override
  String get unpin => 'Rögzítés megszüntetése';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username és $count másik résztvevő gépel…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username és $username2 gépel…';
  }

  @override
  String userIsTyping(String username) {
    return '$username gépel…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username elhagyta a csevegést';
  }

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username felhasználó $type eseményt küldött';
  }

  @override
  String get unverified => 'Hitelesítetlen';

  @override
  String get verified => 'Hitelesített';

  @override
  String get verifyStart => 'Hitelesítés megkezdése';

  @override
  String get verifySuccess => 'Sikeres hitelesítés!';

  @override
  String get verifyTitle => 'Másik fiók hitelesítése';

  @override
  String get visibilityOfTheChatHistory => 'Csevegési előzmény láthatósága';

  @override
  String get visibleForAllParticipants => 'Minden résztvevő számára látható';

  @override
  String get visibleForEveryone => 'Bárki számára látható';

  @override
  String get voiceMessage => 'Hangüzenet';

  @override
  String get waitingPartnerAcceptRequest =>
      'Várakozás a partnerre, hogy elfogadja a kérést…';

  @override
  String get waitingPartnerEmoji =>
      'Várakozás a partnerre, hogy elfogadja a hangulatjelet…';

  @override
  String get waitingPartnerNumbers =>
      'Várakozás a partnerre, hogy elfogadja a számokat…';

  @override
  String get warning => 'Figyelem!';

  @override
  String get weSentYouAnEmail => 'Küldtünk Önnek egy emailt';

  @override
  String get whoCanPerformWhichAction => 'Ki milyen műveletet végezhet';

  @override
  String get whoIsAllowedToJoinThisGroup => 'Ki csatlakozhat a csoporthoz';

  @override
  String get whyDoYouWantToReportThis => 'Miért kívánja ezt bejelenteni?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Ezekkel a címekkel vissza tudja állítani a jelszavát.';

  @override
  String get writeAMessage => 'Írjon egy üzenetet…';

  @override
  String get yes => 'Igen';

  @override
  String get you => 'Ön';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Immáron nem vesz részt ebben a csevegésben';

  @override
  String get yourPublicKey => 'A publikus kulcsa';

  @override
  String get messageInfo => 'Üzenet információ';

  @override
  String get time => 'Idő';

  @override
  String get sender => 'Küldő';

  @override
  String get openGallery => 'Galéria megnyitása';

  @override
  String get removeFromSpace => 'Eltávolítás a térről';

  @override
  String get markAsRead => 'Olvasottként megjelölés';

  @override
  String get reportUser => 'Felhasználó jelentése';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender a következőképp reagált: $reaction';
  }

  @override
  String get pinMessage => 'Kitűzés a szobában';

  @override
  String get confirmEventUnpin =>
      'Biztosan végleg le akarja venni a kitűzött eseményt?';

  @override
  String get emojis => 'Hangulatjelek';

  @override
  String get unsupportedAndroidVersion => 'Nem támogatott Android verzió';

  @override
  String get unsupportedAndroidVersionLong =>
      'Ehhez a funkcióhoz egy újabb Android verzió kell. Kérem ellenőrizze be van e frissítve teljesen készüléke, esetlegesen van e Mobile Katya OS támogatás hozzá.';

  @override
  String get youRejectedTheInvitation => 'Visszautasította a meghívást';

  @override
  String get youJoinedTheChat => 'Becsatlakozott a csevegésbe';

  @override
  String get youAcceptedTheInvitation => '👍 Elfogadta a meghívást';

  @override
  String youBannedUser(String user) {
    return 'Letitotta $user felhasználót';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Visszavonta $user meghívását';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 $user jóvoltából kapott meghívást';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Meghívta $user-t';
  }

  @override
  String youKicked(String user) {
    return '👞 Kirúgta $user-t';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Kirúgta és kitiltotta $user-t';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Levette a letiltást $user-ről';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user bekopogott';
  }

  @override
  String get usersMustKnock => 'A felhasználóknak be kell kopogniuk';

  @override
  String get noOneCanJoin => 'Senki sem csatlakozhat';

  @override
  String get knock => 'Kopogás';

  @override
  String get users => 'Felhasználók';

  @override
  String get storeInAndroidKeystore => 'Tárolás az Android KeyStore-ba';

  @override
  String get storeInAppleKeyChain => 'Tárolás az Apple KeyChain-be';

  @override
  String get storeSecurlyOnThisDevice => 'Biztonságos tárolás az eszközön';

  @override
  String countFiles(int count) {
    return '$count fájl';
  }

  @override
  String get user => 'Felhasználó';

  @override
  String get custom => 'Egyedi';

  @override
  String get whyIsThisMessageEncrypted => 'Miért olvashatatlan ez az üzenet?';

  @override
  String get noKeyForThisMessage =>
      'Akkor fordulhat elő, ha az üzenet az eszközre való bejelentkezés előtt került küldésre.\n\nAz is elképzelhető, hogy a küldő blokkolta az eszközét, vagy valami probléma lépett fel az internet kapcsolatban.\n\nMás helyen látja az üzenetet? Akkor át tudja másolni ide is! Menjen a Beállítások > Eszközök részbe, és győződjön meg róla, hogy az eszközei megerősítették egymást. Legközelebb amikor ezt a szobát megnyitja, és mind a két kliens az előtérben van, akkor szikronizálódni fognak.\n\nNem akarja elveszíteni a kulcsokat amikor kijelentkezik, vagy eszközt cserél? Győződjön meg róla, hogy bekapcsolta a chat mentést a beállításokban.';

  @override
  String get newSpace => 'Új tér';

  @override
  String get doNotShowAgain => 'Ne mutassa újra';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Üres csevegés (korábban $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'A terek lehetővé teszik a csevegések konszolidációját, ezáltal létrehozva publikus vagy privát közösségeket.';

  @override
  String get encryptThisChat => 'A csevegés titkosítása';

  @override
  String get disableEncryptionWarning =>
      'Biztonsági okokból nem kapcsolható ki egy korábban bekapcsolt csevegés titkosítás.';

  @override
  String get sorryThatsNotPossible => 'Ez sajnos nem lehetséges';

  @override
  String get reopenChat => 'Csevegés újranyitása';

  @override
  String get noBackupWarning =>
      'Figyelem! Ha nem kapcsolja be a csevegés mentést, elveszíti a hozzáférést a tikosított üzeneteihez. Erősen ajánlott a csevegés mentés bekapcsolása kijelentkezés előtt.';

  @override
  String get noOtherDevicesFound => 'Nem található más eszköz';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Nem küldhető el! A szerver csak $max határig enged csatolmányokat.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'A fájl mentésre került a következő elérési úton $path';
  }

  @override
  String get jumpToLastReadMessage => 'Az utoljára olvasott üzenethez ugrás';

  @override
  String get readUpToHere => 'Olvasás idáig';

  @override
  String get jump => 'Ugrás';

  @override
  String get openLinkInBrowser => 'Hivatkozás megnyitása böngészőben';

  @override
  String get reportErrorDescription =>
      '😭 Sajnos, valami félresiklott. Ha kívánja, jelezheti a bugot a fejlesztőknek.';

  @override
  String get report => 'jelentés';

  @override
  String get setColorTheme => 'Szín séma beállítása:';

  @override
  String get invite => 'Meghívás';

  @override
  String get inviteGroupChat => '📨 Meghívó a csoportba';

  @override
  String get invalidInput => 'Hibás bevitel!';

  @override
  String wrongPinEntered(int seconds) {
    return 'Hibás pinkódot adott meg! Próbálja újra $seconds mp múlva...';
  }

  @override
  String get pleaseEnterANumber => 'Adjon meg egy 0-nál nagyobb számot';

  @override
  String get archiveRoomDescription =>
      'A csevegés bekerül az archívumba. Más felhasználók látni fogják, hogy elhagyta a csevegést.';

  @override
  String get roomUpgradeDescription =>
      'A csevegés újra elkészül az új szoba verzióval. Minden résztvevő értesítést kap, hogy át kell állniuk az új csevegésre. További információkért a szoba verziókról látogasson el a https://github.com/sorydima/REChain-.git címre';

  @override
  String get removeDevicesDescription =>
      'Ki fog jelentkezni a készülékről, és többé nem fog tudni fogadni üzeneteket.';

  @override
  String get banUserDescription =>
      'A felhasználó kitiltásra kerül a csevegésből, és nem fog tudni visszajönni egészen a kitiltás feloldásáig.';

  @override
  String get unbanUserDescription =>
      'A felhasználó vissza tud jönni a csevegésbe ha akar.';

  @override
  String get kickUserDescription =>
      'A felhasználó kirúgásra került a csevegésből, de nincs kitiltva. Publikus csevegés esetén a felhasználó bármikor visszatérhet.';

  @override
  String get makeAdminDescription =>
      'Miután a felhasználót aminisztrátorrá lépteti elő, nem fogja tudni visszavonni döntését, mivel azonos jogosultsági szinttel fognak rendelkezni.';

  @override
  String get pushNotificationsNotAvailable => 'Push értesítések nem elérhetőek';

  @override
  String get learnMore => 'Tudjon meg többet';

  @override
  String get yourGlobalUserIdIs => 'A globális felhasználó-ID-je: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return '\"$query\"-vel nem található felhasználó. Ellenőrizze nincs e elírás.';
  }

  @override
  String get knocking => 'Bekopogás';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Csevegés felfedezhető a $server szerveren történő kereséssel';
  }

  @override
  String get searchChatsRooms => 'Keressen #csevegéseket, @felhasználókat...';

  @override
  String get nothingFound => 'Nincs találat...';

  @override
  String get groupName => 'Csoport név';

  @override
  String get createGroupAndInviteUsers =>
      'Hozzon létre egy csoportot és hívjon meg felhasználókat';

  @override
  String get groupCanBeFoundViaSearch =>
      'A csoportokat kereséssel találhatja meg';

  @override
  String get wrongRecoveryKey =>
      'Sajnos, úgy tűnik hibásan adta meg a visszaállítási kulcsot.';

  @override
  String get commandHint_sendraw => 'Tiszta json küldése';

  @override
  String get databaseMigrationTitle => 'Adatbázis optimalizálva';

  @override
  String get databaseMigrationBody =>
      'Kérem várjon. Ez igénybe vehet valamennyi időt.';

  @override
  String get leaveEmptyToClearStatus => 'Hagyja üresen a státusz kitörléséhez.';

  @override
  String get select => 'Kiválaszt';

  @override
  String get searchForUsers => 'Keressen @felhasználókat...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Kérem adja meg jelenlegi jelszavát';

  @override
  String get newPassword => 'Új jelszó';

  @override
  String get pleaseChooseAStrongPassword => 'Kérem válasszon egy erős jelszót';

  @override
  String get passwordsDoNotMatch => 'A jelszavak nem egyeznek';

  @override
  String get passwordIsWrong => 'Hibás a beírt jelszava';

  @override
  String get publicChatAddresses => 'Nyilvános csevegés címek';

  @override
  String get createNewAddress => 'Új cím létrehozása';

  @override
  String get joinSpace => 'Csatlakozás a térre';

  @override
  String get publicSpaces => 'Nyilvános terek';

  @override
  String get addChatOrSubSpace => 'Csevegés vagy al-tér hozzáadása';

  @override
  String get thisDevice => 'Ez az eszköz:';

  @override
  String get initAppError => 'Hiba lépett fel az app indítása során';

  @override
  String searchIn(String chat) {
    return 'Keresés a \"$chat\" csevegésben...';
  }

  @override
  String get searchMore => 'További keresés...';

  @override
  String get gallery => 'Galéria';

  @override
  String get files => 'Fájlok';

  @override
  String sessionLostBody(String url, String error) {
    return 'A munkamenete elvesződött. Kérem jelentse ezt a fejlesztőknek a $url címen. A hiba szövege a következő: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Megpróbálkozunk visszaállítani a munkamenetét egy korábbi mentésből. Kérem jelezze a hibát a fejlesztőknek a $url címen. A hiba szövege a következő: $error';
  }

  @override
  String get sendReadReceipts => 'Olvasási igazolás küldése';

  @override
  String get sendTypingNotificationsDescription =>
      'A csevegés többi tagja látja amikor gépel.';

  @override
  String get sendReadReceiptsDescription =>
      'A csevegés többi tagja láthatja, ha olvasta az üzeneteiket.';

  @override
  String get formattedMessages => 'Formázott üzenetek';

  @override
  String get formattedMessagesDescription =>
      'Formázott szöveg - mint például félkövér - megjelenítése \"markdown\"-al.';

  @override
  String get verifyOtherUser => '🔐 Más felhasználó igazolása';

  @override
  String get verifyOtherUserDescription =>
      'Ha megerősít egy másik felhasználót, akkor teljesen biztos lehet abban kivel cseveg. 💪\n\nA megerősítési folyamat kezdetekor megjelenik egy felugró ablak mindkettőjüknél. Ekkor egy hangulatjel vagy szám sor összehasonlítási folyamat veszi kezdetét.\n\nA legpraktikusabb módja ennek, hogy találkozzanak, vagy videó hívás során beszéljék meg. 👭';

  @override
  String get verifyOtherDevice => '🔐 Más eszköz hitelesítése';

  @override
  String get verifyOtherDeviceDescription =>
      'Amikor egy másik eszközt hitelesít, az eszközök kulcsokat cserélnek egymás között, ezáltal növelve az összbiztonságot. 💪 Amikor megkezdődik a folyamat, mind a két eszközön megjelenik egy felugró üzenet. Hangulatjelek és számok sorozata fog megjelenni, amit össze tud hasonlítani a két eszközön. Érdemes tehát mind a két eszközt a közelben tartani. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender elfogadta a kulcs megerősítést';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender visszautasította a kulcs megerősítést';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender befejezte a kulcs megerősítést';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender készen áll a kulcs megerősítésre';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender kulcs megerősítést kér';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender elkezdte a kulcs megerősítést';
  }

  @override
  String get incomingMessages => 'Bejövő üzenetek';

  @override
  String get stickers => 'Matricák';

  @override
  String get discover => 'Felfedezés';

  @override
  String get commandHint_ignore => 'Adott REChain ID figyelmen kívül hagyása';

  @override
  String get commandHint_unignore => 'Adott REChain ID figyelembe vétele';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread olvasatlan csevegések';
  }

  @override
  String get noDatabaseEncryption =>
      'Adatbázis titkosítás nem támogatott ezen a platformon';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Jelenleg $count felhasználó van letiltva.';
  }

  @override
  String goToSpace(Object space) {
    return 'Ugrás a $space térre';
  }

  @override
  String get markAsUnread => 'Olvasatlannak jelölés';

  @override
  String userLevel(int level) {
    return '$level - Felhasználó';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Moderátor';
  }

  @override
  String adminLevel(int level) {
    return '$level - Adminisztrátor';
  }

  @override
  String get changeGeneralChatSettings =>
      'Általános csevegés beállítások módosítása';

  @override
  String get inviteOtherUsers => 'Más felhasználók meghívása a csevegésbe';

  @override
  String get changeTheChatPermissions => 'Csevegés engedélyek változtatása';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Csevegési előzmények láthatóságának változtatása';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Csevegés fő, nyilvános címének változtatása';

  @override
  String get sendRoomNotifications => '@szoba értesítés küldése';

  @override
  String get changeTheDescriptionOfTheGroup =>
      'Csevegés leírásának változtatása';

  @override
  String get chatPermissionsDescription =>
      'Adja meg milyen erősségi szint kell egyes csevegési művelethez. A 0, 50 és 100-as szintek általában felhasználókat, moderátorokat és adminisztrátorokat jelölnek de bármilyen szintezés lehetséges.';

  @override
  String updateInstalled(String version) {
    return '🎉 $version verziójú frissítés telepítve!';
  }

  @override
  String get changelog => 'Változásnapló';

  @override
  String updateAvailable(String version) {
    return 'Update $version available';
  }

  @override
  String get download => 'Download';

  @override
  String get sendCanceled => 'Küldés visszavonva';

  @override
  String get loginWithREChainId => 'Login with REChain-ID';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Nem tűnik kompatibilisnek a Mátrix-kiszolgálónak. Hibás a hivatkozás?';

  @override
  String get calculatingFileSize => 'Fájl méret kalkulálása...';

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Egyik készüléke nem hitelesített';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Megjegyzés: Minden eszköze amit a csevegés mentéshez kapcsol, automatikusan hitelesítésre kerül.';

  @override
  String get continueText => 'Folytatás';

  @override
  String get blur => 'Homályosít:';

  @override
  String get opacity => 'Átlátszóság:';

  @override
  String get setWallpaper => 'Háttér beállítás';

  @override
  String get manageAccount => 'Fiók kezelése';

  @override
  String get noContactInformationProvided =>
      'A szervertől nem érkezett vissza kapcsolati információ';

  @override
  String get contactServerAdmin => 'Kapcsolatfelvétel a szerver adminnal';

  @override
  String get contactServerSecurity =>
      'Kapcsolatfelvétel a szerver biztonsággal';

  @override
  String get supportPage => 'Támogatási oldal';

  @override
  String get serverInformation => 'Szerver információ:';

  @override
  String get name => 'Név';

  @override
  String get version => 'Verzió';

  @override
  String get website => 'Weboldal';

  @override
  String get compress => 'Tömörítés';

  @override
  String get boldText => 'Félkövér szöveg';

  @override
  String get italicText => 'Dőlt szöveg';

  @override
  String get strikeThrough => 'Áthúzott';

  @override
  String get pleaseFillOut => 'Kérem töltse ki';

  @override
  String get invalidUrl => 'Helytelen hivatkozás';

  @override
  String get addLink => 'Hivatkozás hozzáadása';

  @override
  String get unableToJoinChat =>
      'Nem csatlakozhat a csevegéshez. Elképzelhető, hogy a másik fél már kilépett.';

  @override
  String get previous => 'Előző';

  @override
  String get otherPartyNotLoggedIn =>
      'A másik fél jelenleg nincs bejelentkezve, emiatt nem fogadhat üzeneteket!';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Használja a \'$server\' szervert a bejelentkezéshez';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Ezennel engedélyezi az applikáció és weboldal számára, hogy információkat gyűjtsön Önről.';

  @override
  String get open => 'Megnyitás';

  @override
  String get waitingForServer => 'Várakozás a szerverre...';

  @override
  String get newChatRequest => '📩 Új csevegés kérelem';

  @override
  String get contentNotificationSettings => 'Tartalom értesítési beállítások';

  @override
  String get generalNotificationSettings => 'Átalános értesítési beállítások';

  @override
  String get roomNotificationSettings => 'Szoba értesítési beállítások';

  @override
  String get userSpecificNotificationSettings =>
      'Felhasználó specifikus értesítés beállítások';

  @override
  String get otherNotificationSettings => 'Egyéb értesítés beállítások';

  @override
  String get notificationRuleContainsUserName => 'Felhasználó nevet tartalmaz';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Értesíti a felhasználót, ha az üzenet tartalmazza a nevét.';

  @override
  String get notificationRuleMaster => 'Minden értesítés némítása';

  @override
  String get notificationRuleMasterDescription =>
      'Felülír minden más szabályt, és kikapcsolja az összes értesítést.';

  @override
  String get notificationRuleSuppressNotices =>
      'Minden automata üzenetet némít';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Némít minden automata klienstől érkező értesítést mint például botok.';

  @override
  String get notificationRuleInviteForMe => 'Meghívás Számomra';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Értesíti a felhasználót szoba meghívás esetén.';

  @override
  String get notificationRuleMemberEvent => 'Tagi Esemény';

  @override
  String get notificationRuleMemberEventDescription =>
      'Némítja a tagi események értesítéseit.';

  @override
  String get notificationRuleIsUserMention => 'Felhasználó Említése';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Értesíti a felhasználót, ha közvetlenül említésre kerül az üzenetben.';

  @override
  String get notificationRuleContainsDisplayName =>
      'Megjelenített Nevet Tartalmaz';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Értesíti a felhasználót, ha közvetlenül említésre kerül a megjelenített neve az üzenetben.';

  @override
  String get notificationRuleIsRoomMention => 'Szoba Említés';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Értesíti a felhasználót szoba említéskor.';

  @override
  String get notificationRuleRoomnotif => 'Szoba Értesítés';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Értesíti a felhasználót ha az üzenet tartalmazza a \'@szoba\' említést.';

  @override
  String get notificationRuleTombstone => 'Sírkő';

  @override
  String get notificationRuleTombstoneDescription =>
      'Értesíti a felhasználót a szoba deaktiválás üzenetekről.';

  @override
  String get notificationRuleReaction => 'Reakció';

  @override
  String get notificationRuleReactionDescription =>
      'Némítja a reakciók értesítéseit.';

  @override
  String get notificationRuleRoomServerAcl => 'Szoba Szerver ACL';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Némítja a szoba szerver hozzáférési kezelő lista (ACL) értesítéseket.';

  @override
  String get notificationRuleSuppressEdits => 'Szerkesztések némítása';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Némítja a szerkesztett üzenetek értesítéseit.';

  @override
  String get notificationRuleCall => 'Hívás';

  @override
  String get notificationRuleCallDescription =>
      'Értesíti a felhasználót a hívásokról.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'Titkosított Négyszemközti Szoba';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Értesíti a felhasználót a titkosított négyszemközti szobákban levő üzenetekről.';

  @override
  String get notificationRuleRoomOneToOne => 'Négyszemközti Szoba';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Értesíti a felhasználót a négyszemközti szobában levő üzenetekről.';

  @override
  String get notificationRuleMessage => 'Üzenet';

  @override
  String get notificationRuleMessageDescription =>
      'Értesíti a felhasználót az általános üzenetekről.';

  @override
  String get notificationRuleEncrypted => 'Titkosított';

  @override
  String get notificationRuleEncryptedDescription =>
      'Értesíti a felhasználót a titkosított szobákban levő üzenetekről.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Értesíti a felhasználót a Jitsi widget eseményekről.';

  @override
  String get notificationRuleServerAcl => 'Némítja a Szerver ACL Eseményeket';

  @override
  String get notificationRuleServerAclDescription =>
      'Némítja a Szerver ACL események értesítéseit.';

  @override
  String unknownPushRule(String rule) {
    return '\'$rule\' egy ismeretlen push szabály';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return '🎙️ $duration - $sender';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Ha törli ezt az értesítési beállítást, később nem vonható vissza.';

  @override
  String get more => 'Több';

  @override
  String get shareKeysWith => 'Kulcsok megosztása...';

  @override
  String get shareKeysWithDescription =>
      'Mely eszközök tekinthetőek megbízhatónak, hogy olvashassák a titkosított csevegéseket is?';

  @override
  String get allDevices => 'Minden eszköz';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Kereszt-hitelesített eszközök ha be van kapcsolva';

  @override
  String get crossVerifiedDevices => 'Kereszt-hitelesített eszközök';

  @override
  String get verifiedDevicesOnly => 'Csak hitelesített eszközök';

  @override
  String get takeAPhoto => 'Készítsen egy fotót';

  @override
  String get recordAVideo => 'Vegyen fel egy videót';

  @override
  String get optionalMessage => '(Választható) üzenet...';

  @override
  String get notSupportedOnThisDevice => 'Nem támogatott ezen az eszközön';

  @override
  String get enterNewChat => 'Belépés új csevegésbe';

  @override
  String get approve => 'Jóváhagy';

  @override
  String get youHaveKnocked => 'Kopogott';

  @override
  String get pleaseWaitUntilInvited =>
      'Kérem várjon, amíg valaki a szobából behívja Önt.';

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
      'Kérem vegye figyelembe, hogy a videó hívások jelenleg béta fázisban vannak. Nem biztos, hogy megfelelően fognak működni, vagy egyáltalán elindulnak egyes platformokon.';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get incomingCall => 'Incoming call';

  @override
  String get videoCall => 'Videóhívás';

  @override
  String get voiceCall => 'Hang hívás';

  @override
  String get missedCall => 'Missed call';

  @override
  String get callBack => 'Call back';

  @override
  String get hangUp => 'Hang up';

  @override
  String get waitingForParticipant => 'Waiting for participant...';

  @override
  String get decline => 'Elutasítás';

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
