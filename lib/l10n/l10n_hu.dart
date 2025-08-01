// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class L10nHu extends L10n {
  L10nHu([String locale = 'hu']) : super(locale);

  @override
  String get alwaysUse24HourFormat => '';

  @override
  String get repeatPassword => 'Jelszó ismétlése';

  @override
  String get notAnImage => 'Nem kép fájl.';

  @override
  String get setCustomPermissionLevel => 'Egyedi engedélyszint beállítása';

  @override
  String get setPermissionsLevelDescription =>
      'Kérem, válasszon egy előre meghatározott szerepkört, vagy adjon meg egy egyedi engedély szintet 0 és 100 között.';

  @override
  String get ignoreUser => 'Felhasználó ignorálása';

  @override
  String get normalUser => 'Normál felhasználó';

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
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username aktiválta a végpontok közötti titkosítást';
  }

  @override
  String get addEmail => 'E-mail-cím hozzáadása';

  @override
  String get confirmREChainId =>
      'Kérem, igazolja vissza REChain ID-jét a fiók törléséhez.';

  @override
  String supposedMxid(String mxid) {
    return '$mxid-nek kell lennie';
  }

  @override
  String get addChatDescription => 'Chat leírás hozzáadása...';

  @override
  String get addToSpace => 'Hozzáadás a térhez';

  @override
  String get admin => 'Adminisztrátor';

  @override
  String get alias => 'álnév';

  @override
  String get all => 'Összes';

  @override
  String get allChats => 'Összes csevegés';

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
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'A Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node Network-kiszolgáló a következő bejelentkezéseket támogatja:\n$serverVersions\nDe ez az alkalmazást csak ezeket támogatja:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Gépelési értesítés megjelenítése';

  @override
  String get swipeRightToLeftToReply => 'Húzza balra a válaszoláshoz';

  @override
  String get sendOnEnter => 'Küldés Enterrel';

  @override
  String badServerVersionsException(
      String serverVersions,
      String supportedVersions,
      Object serverVerions,
      Object supoortedVersions,
      Object suportedVersions) {
    return 'A Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node Network-kiszolgáló ezeket a specifikált verziókat támogatja:\n$serverVersions\nAzonban ez az app csak a következőket: $supportedVersions';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats csevegések és $participants résztvevők';
  }

  @override
  String get noMoreChatsFound => 'Nem található több csevegés...';

  @override
  String get noChatsFoundHere =>
      'Itt még nem található csevegés. Kezdjen egy új csevegést valakivel a lenti gomb segítéségvel. ⤵️';

  @override
  String get joinedChats => 'Csatlakozott csevegések';

  @override
  String get unread => 'Olvasatlan';

  @override
  String get space => 'Tér';

  @override
  String get spaces => 'Terek';

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
  String get botMessages => 'Bot üzenetek';

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
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username megváltoztatta a csevegés leírást a következőre: \'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username módosította a csevegés nevét a következőre: \'$chatname\'';
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
  String get changeTheHomeserver =>
      'Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node Network-kiszolgáló váltás';

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
  String get yourChatBackupHasBeenSetUp =>
      'A csevegés biztonsági mentés beállításra került.';

  @override
  String get chatBackup => 'Csevegés biztonsági mentés';

  @override
  String get chatBackupDescription =>
      'A régebbi beszélgetései egy biztonsági kulccsal vannak védve. Bizonyosodjon meg róla, hogy nem veszíti el.';

  @override
  String get chatDetails => 'Csevegés részletei';

  @override
  String get chatHasBeenAddedToThisSpace => 'Csevegés hozzáadva a térhez';

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
  String get confirm => 'Megerősít';

  @override
  String get connect => 'Csatlakozás';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Kapcsolat meghívásra került a csoportba';

  @override
  String get containsDisplayName => 'Tartalmazza a megjelenített nevet';

  @override
  String get containsUserName => 'Tartalmazza a felhasználónevet';

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
  String dateWithoutYear(String month, String day) {
    return '$month. $day.';
  }

  @override
  String dateWithYear(String year, String month, String day) {
    return '$year. $month. $day.';
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
  String get device => 'Eszköz';

  @override
  String get deviceId => 'Eszköz ID';

  @override
  String get devices => 'Eszközök';

  @override
  String get directChats => 'Privát Csevegések';

  @override
  String get allRooms => 'Minden Csoport Csevegés';

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
  String get emotePacks => 'Hangulatjel csomagok a szobához';

  @override
  String get emoteSettings => 'Hangulatjel Beállítások';

  @override
  String get globalChatId => 'Átfogó csevegő ID';

  @override
  String get accessAndVisibility => 'Hozzáférés és láthatóság';

  @override
  String get accessAndVisibilityDescription =>
      'Ki számára engedélyezett a csevegéshez való csatlakozás, és hogyan találhatja azt meg.';

  @override
  String get calls => 'Hívások';

  @override
  String get customEmojisAndStickers => 'Egyedi hangulatjelek és matricák';

  @override
  String get customEmojisAndStickersBody =>
      'Egyedi hangulatjelek és matricák hozzáadása, amelyek bármely csevegésben felhasználhatóak.';

  @override
  String get emoteShortcode => 'Hangulatjel rövidkód';

  @override
  String get emoteWarnNeedToPick =>
      'Ki kell választania egy hangulatjel rövidkódot és egy képet!';

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
  String get homeserver =>
      'Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node Network-kiszolgáló';

  @override
  String get enterYourHomeserver =>
      'Adja meg a Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node Network-kiszolgálóját';

  @override
  String errorObtainingLocation(String error) {
    return 'Hiba a helymeghatározáskor: $error';
  }

  @override
  String get everythingReady => 'Minden kész!';

  @override
  String get extremeOffensive => 'Rendkívül sértő';

  @override
  String get fileName => 'Fájlnév';

  @override
  String get rechainonline => 'REChain';

  @override
  String get fontSize => 'Betűméret';

  @override
  String get forward => 'Továbbítás';

  @override
  String get fromJoining => 'Csatlakozás óta';

  @override
  String get fromTheInvitation => 'Meghívás óta';

  @override
  String get goToTheNewRoom => 'Ugrás az új szobába';

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
  String get hideRedactedEvents => 'Szerkesztett események elrejtése';

  @override
  String get hideRedactedMessages => 'Szerkesztett üzenetek elrejtése';

  @override
  String get hideRedactedMessagesBody =>
      'Ha valaki szerkeszti az üzenetét, ez az üzenet nem jelenik meg a csevegés során.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Érvénytelen vagy ismeretlen üzenetformátum elrejtése';

  @override
  String get howOffensiveIsThisContent => 'Mennyire sértő ez a tartalom?';

  @override
  String get id => 'ID';

  @override
  String get identity => 'Azonosító';

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
  String get inoffensive => 'Nem sértő';

  @override
  String get inviteContact => 'Ismerős meghívása';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return 'Meg kívánja hívni $contact ismerősét a \"$groupName\" csevegő csoportba?';
  }

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
  String get inviteForMe => 'Meghívás számomra';

  @override
  String inviteText(String username, String link) {
    return '$username meghívta a REChain-be.\n1. Keresse fel a online.rechain.network oldalt, és telepítse az alkalmazást \n2. Regisztráljon vagy jelentkezzen be \n3. Nyissa meg a meghívó linket: \n $link';
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
  String get license => 'Licenc';

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
  String get dehydrateTor => 'TOR felhasználók: Munkamenet exportálása';

  @override
  String get dehydrateTorLong =>
      'TOR felhasználóknak ajánlott a munkamenet exportálása az ablak bezárása előtt.';

  @override
  String get hydrateTor => 'TOR felhasználóknak: munkamenet export importálása';

  @override
  String get hydrateTorLong =>
      'Legutóbb TOR segítségével exportálta korábbi munkamenetét? Gyorsan importálja őket vissza, és folytassa a csevegést.';

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
    return 'Bejelentkezés a(z) $homeserver Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node Network-kiszolgálóra';
  }

  @override
  String get logout => 'Kijelentkezés';

  @override
  String get memberChanges => 'Tagi változások';

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
  String get needPantalaimonWarning =>
      'Jelenleg a Pantalaimon szükséges a végpontok közötti titkosítás használatához.';

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
    return '$server1 nem egy Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node Network szerver, akarja használja a $server2 szervert inkább?';
  }

  @override
  String get shareInviteLink => 'Meghívó link megosztása';

  @override
  String get scanQrCode => 'QR kód beolvasása';

  @override
  String get none => 'Nincs';

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
  String get notificationsEnabledForThisAccount =>
      'Értesítések be vannak kapcsolva ebben a fiókban';

  @override
  String numUsersTyping(int count) {
    return '$count felhasználó gépel…';
  }

  @override
  String get obtainingLocation => 'Tartózkodási hely lekérése…';

  @override
  String get offensive => 'Sértő';

  @override
  String get offline => 'Offline';

  @override
  String get ok => 'Ok';

  @override
  String get online => 'Online';

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
  String get openVideoCamera => 'Kamera megnyitása videóhoz';

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
  String get enableMultiAccounts => '(BÉTA) Több fiók bekapcsolása az eszközön';

  @override
  String get openInMaps => 'Megnyitás térképen';

  @override
  String get link => 'Hivatkozás';

  @override
  String get serverRequiresEmail =>
      'Ehhez a szerverhez szükséges az email címének visszaigazolása.';

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
  String get hideMemberChangesInPublicChats =>
      'Tag változások elrejtése a publikus csevegésben';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      'Ne mutassa ha valaki be- vagy kilép a csevegésből az olvashatóság javítása érdekében.';

  @override
  String get overview => 'Áttekintés';

  @override
  String get notifyMeFor => 'Értesítsen ha';

  @override
  String get passwordRecoverySettings => 'Jelszó-helyreállítási beállítások';

  @override
  String get passwordRecovery => 'Jelszó visszaállítás';

  @override
  String get people => 'Emberek';

  @override
  String get pickImage => 'Kép választása';

  @override
  String get pin => 'Rögzítés';

  @override
  String play(String fileName) {
    return '$fileName lejátszása';
  }

  @override
  String get pleaseChoose => 'Kérem, válasszon';

  @override
  String get pleaseChooseAPasscode => 'Kérem, válasszon egy kódot';

  @override
  String get pleaseClickOnLink =>
      'Kérem, kattintson a linkre az emailben, és folytassa a műveletet.';

  @override
  String get pleaseEnter4Digits =>
      'Írjon be 4 számjegyet, vagy hagyja üresen a zár kikapcsolásához.';

  @override
  String get pleaseEnterRecoveryKey => 'Kérem, adja meg a visszaállító kódját:';

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
  String get pushRules => 'Push szabályok';

  @override
  String get reason => 'Indok';

  @override
  String get recording => 'Felvétel';

  @override
  String redactedBy(String username) {
    return '$username által szerkesztve';
  }

  @override
  String get directChat => 'Privát csevegés';

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
  String get register => 'Regisztráció';

  @override
  String get reject => 'Elutasít';

  @override
  String rejectedTheInvitation(String username) {
    return '$username elutasította a meghívást';
  }

  @override
  String get rejoin => 'Újracsatlakozás';

  @override
  String get removeAllOtherDevices => 'Minden más eszköz eltávolítása';

  @override
  String removedBy(String username) {
    return '$username által eltávolítva';
  }

  @override
  String get removeDevice => 'Eszköz eltávolítása';

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
  String get requestPermission => 'Jogosultsági kérelem';

  @override
  String get roomHasBeenUpgraded => 'A szoba frissítésre került';

  @override
  String get roomVersion => 'Szoba verzió';

  @override
  String get saveFile => 'Fájl mentése';

  @override
  String get search => 'Keresés';

  @override
  String get security => 'Biztonság';

  @override
  String get recoveryKey => 'Visszaállító kulcs';

  @override
  String get recoveryKeyLost => 'Elveszett visszaállító kulcs?';

  @override
  String seenByUser(String username) {
    return '$username látta';
  }

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
  String get sendOriginal => 'Eredeti küldése';

  @override
  String get sendSticker => 'Matrica küldése';

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
  String get separateChatTypes => 'Csoportok és privát üzenetek elkülönítése';

  @override
  String get setAsCanonicalAlias => 'Beállítás alapértelmezett álnévként';

  @override
  String get setCustomEmotes => 'Egyedi hangulatjelek beállítása';

  @override
  String get setChatDescription => 'Csevegés leírás beállítása';

  @override
  String get setInvitationLink => 'Meghívó hivatkozás beállítása';

  @override
  String get setPermissionsLevel => 'Engedélyszint beállítása';

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
  String get showPassword => 'Jelszó megjelenítése';

  @override
  String get presenceStyle => 'Állapot:';

  @override
  String get presencesToggle =>
      'Más felhasználók állapot üzeneteinek megjelenítése';

  @override
  String get singlesignon => 'Egyszeri Bejelentkezés';

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
  String get startFirstChat => 'Kezdje meg első csevegését';

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
  String get title => 'REChain';

  @override
  String get toggleFavorite => 'Kedvencek megjelenítése';

  @override
  String get toggleMuted => 'Némítottak megjelenítése';

  @override
  String get toggleUnread => 'Jelölés Olvasottként/Olvasatlanként';

  @override
  String get tooManyRequestsWarning =>
      'Túl sok egyidejű kérelem. Kérem próbálja meg később!';

  @override
  String get transferFromAnotherDevice => 'Átvitel másik eszközről';

  @override
  String get tryToSendAgain => 'Újraküldés megpróbálása';

  @override
  String get unavailable => 'Nem elérhető';

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
  String unreadChats(int unreadCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount olvasatlan csevegés',
      one: '1 olvasatlan csevegés',
    );
    return '$_temp0';
  }

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
  String get username => 'Felhasználónév';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username felhasználó $type eseményt küldött';
  }

  @override
  String get unverified => 'Hitelesítetlen';

  @override
  String get verified => 'Hitelesített';

  @override
  String get verify => 'Hitelesít';

  @override
  String get verifyStart => 'Hitelesítés megkezdése';

  @override
  String get verifySuccess => 'Sikeres hitelesítés!';

  @override
  String get verifyTitle => 'Másik fiók hitelesítése';

  @override
  String get videoCall => 'Videóhívás';

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
  String get wallpaper => 'Háttér:';

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
  String get wipeChatBackup =>
      'Le kívánja törölni a chat mentését, hogy létrehozhasson egy új visszaállítási kulcsot?';

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
  String get youHaveBeenBannedFromThisChat => 'Kitiltották ebből a csevegésből';

  @override
  String get yourPublicKey => 'A publikus kulcsa';

  @override
  String get messageInfo => 'Üzenet információ';

  @override
  String get time => 'Idő';

  @override
  String get messageType => 'Üzenet típus';

  @override
  String get sender => 'Küldő';

  @override
  String get openGallery => 'Galéria megnyitása';

  @override
  String get removeFromSpace => 'Eltávolítás a térről';

  @override
  String get addToSpaceDescription =>
      'Válassza ki melyik térhez kívánja hozzáadni a csevegést.';

  @override
  String get start => 'Kezdés';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'A régi üzenetei feloldásához adja meg a korábban generált visszaállítási jelszavát. A visszaállítási jelszó NEM EGYEZIK MEG a jelszóval.';

  @override
  String get publish => 'Közzététel';

  @override
  String videoWithSize(String size) {
    return 'Videó ($size)';
  }

  @override
  String get openChat => 'Csevegés megnyitása';

  @override
  String get markAsRead => 'Olvasottként megjelölés';

  @override
  String get reportUser => 'Felhasználó jelentése';

  @override
  String get dismiss => 'Elvetés';

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
  String get placeCall => 'Tér hívás';

  @override
  String get voiceCall => 'Hang hívás';

  @override
  String get unsupportedAndroidVersion => 'Nem támogatott Android verzió';

  @override
  String get unsupportedAndroidVersionLong =>
      'Ehhez a funkcióhoz egy újabb Android verzió kell. Kérem ellenőrizze be van e frissítve teljesen készüléke, esetlegesen van e Mobile KatyaOS támogatás hozzá.';

  @override
  String get videoCallsBetaWarning =>
      'Kérem vegye figyelembe, hogy a videó hívások jelenleg béta fázisban vannak. Nem biztos, hogy megfelelően fognak működni, vagy egyáltalán elindulnak egyes platformokon.';

  @override
  String get experimentalVideoCalls => 'Kísérleti videó hívások';

  @override
  String get emailOrUsername => 'Email vagy felhasználónév';

  @override
  String get indexedDbErrorTitle => 'Privát mód problémák';

  @override
  String get indexedDbErrorLong =>
      'Sajnos az üzenet mentés alapból nincs bekapcsolva privát módban.\nKeresse meg a\n - about:config\n - állítsa a dom.indexedDB.privateBrowsing.enabled \"true\"-ra\nMáskülönben nem lehetséges a REChain futtatása.';

  @override
  String switchToAccount(String number) {
    return 'A $number számú fiókra váltás';
  }

  @override
  String get nextAccount => 'Következő fiók';

  @override
  String get previousAccount => 'Előző fiók';

  @override
  String get addWidget => 'Widget hozzáadása';

  @override
  String get widgetVideo => 'Videó';

  @override
  String get widgetEtherpad => 'Szöveges megjegyzés';

  @override
  String get widgetJitsi => 'Jitsi Meet';

  @override
  String get widgetCustom => 'Egyedi';

  @override
  String get widgetName => 'Név';

  @override
  String get widgetUrlError => 'Helytelen hivatkozás.';

  @override
  String get widgetNameError => 'Kérem adjon meg egy megjelenítendő nevet.';

  @override
  String get errorAddingWidget => 'Hiba lépett fel a widget hozzáadásánál.';

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
  String youInvitedToBy(String alias) {
    return '📩 Meghívást kapott linken keresztül a következőhöz:\n$alias';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 $user jóvoltából kapott meghívást';
  }

  @override
  String invitedBy(String user) {
    return '📩 $user jóvoltából meghívva';
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
  String userWouldLikeToChangeTheChat(String user) {
    return '$user szeretne csatlakozni a csevegéshez.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'Nyilvános link nem került még létrehozásra';

  @override
  String get knock => 'Kopogás';

  @override
  String get users => 'Felhasználók';

  @override
  String get unlockOldMessages => 'Régi üzenetek feloldása';

  @override
  String get storeInSecureStorageDescription =>
      'Tárolja a visszaállítási kulcsot az eszköz biztonsági tárjában.';

  @override
  String get saveKeyManuallyDescription =>
      'A kulcs manuális mentése rendszer megosztás vagy vágólap másolás segítségével.';

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
  String get foregroundServiceRunning =>
      'Ez az értesítés akkor jelenik meg ha az előtéri szolgáltatás fut.';

  @override
  String get screenSharingTitle => 'képernyő megosztás';

  @override
  String get screenSharingDetail => 'Megosztja a képernyőjét a REChain-ben';

  @override
  String get callingPermissions => 'Hívási engedélyek';

  @override
  String get callingAccount => 'Hívási fiók';

  @override
  String get callingAccountDetails =>
      'Engedélyezés a REChain számára hogy használja a natív android hívás applikációt.';

  @override
  String get appearOnTop => 'Megjelenés legfelül';

  @override
  String get appearOnTopDetails =>
      'Engedélyezi az app számára, hogy mindig legfelül jelenjen meg (nem szükséges, ha a REChain hívó fiókként lett beállítva)';

  @override
  String get otherCallingPermissions =>
      'Mikrofon, kamera, és más egyéb REChain engedélyek';

  @override
  String get whyIsThisMessageEncrypted => 'Miért olvashatatlan ez az üzenet?';

  @override
  String get noKeyForThisMessage =>
      'Akkor fordulhat elő, ha az üzenet az eszközre való bejelentkezés előtt került küldésre.\n\nAz is elképzelhető, hogy a küldő blokkolta az eszközét, vagy valami probléma lépett fel az internet kapcsolatban.\n\nMás helyen látja az üzenetet? Akkor át tudja másolni ide is! Menjen a Beállítások > Eszközök részbe, és győződjön meg róla, hogy az eszközei megerősítették egymást. Legközelebb amikor ezt a szobát megnyitja, és mind a két kliens az előtérben van, akkor szikronizálódni fognak.\n\nNem akarja elveszíteni a kulcsokat amikor kijelentkezik, vagy eszközt cserél? Győződjön meg róla, hogy bekapcsolta a chat mentést a beállításokban.';

  @override
  String get newGroup => 'Új csoport';

  @override
  String get newSpace => 'Új tér';

  @override
  String get enterSpace => 'Belépés a térre';

  @override
  String get enterRoom => 'Belépés a szobába';

  @override
  String get allSpaces => 'Minden tér';

  @override
  String numChats(String number) {
    return '$number csevegés';
  }

  @override
  String get hideUnimportantStateEvents =>
      'Jelentéktelen esemény státuszok elrejtése';

  @override
  String get hidePresences => 'El kívánja rejteni a státusz listát?';

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
  String get deviceKeys => 'Eszköz kulcsok:';

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
  String get signInWithPassword => 'Bejelentkezés jelszóval';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Próbálja meg később, vagy válasszon másik szervert.';

  @override
  String signInWith(String provider) {
    return 'Bejelentkezés a $provider kiszolgálóval';
  }

  @override
  String get profileNotFound =>
      'A felhasználó nem található a szerveren. Lehetséges, hogy csatlakozási problémák adódtak, vagy nem létezik a felhasználó.';

  @override
  String get setTheme => 'Téma beállítása:';

  @override
  String get setColorTheme => 'Szín séma beállítása:';

  @override
  String get invite => 'Meghívás';

  @override
  String get inviteGroupChat => '📨 Meghívó a csoportba';

  @override
  String get invitePrivateChat => '📨 Meghívó privát csevegéshez';

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
      'A csevegés újra elkészül az új szoba verzióval. Minden résztvevő értesítést kap, hogy át kell állniuk az új csevegésre. További információkért a szoba verziókról látogasson el a https://spec.online.rechain.network/latest/rooms/ címre';

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
  String get startConversation => 'Társalgás kezdése';

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
  String get publicLink => 'Nyilvános hivatkozás';

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
  String get subspace => 'Al-tér';

  @override
  String get decline => 'Elutasítás';

  @override
  String get thisDevice => 'Ez az eszköz:';

  @override
  String get initAppError => 'Hiba lépett fel az app indítása során';

  @override
  String get userRole => 'Felhasználói szerep';

  @override
  String minimumPowerLevel(String level) {
    return '$level a minimum szint.';
  }

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
  String databaseBuildErrorBody(String url, String error) {
    return 'Nem lehetséges az SQlite adatbázis létrehozása. Az app megpróbálja a régi típusú adatbázist használni. Kérem jelentse a hibát a fejlesztőknek a $url hivatkozáson. A hiba szövege a következő: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'A munkamenete elvesződött. Kérem jelentse ezt a fejlesztőknek a $url címen. A hiba szövege a következő: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Megpróbálkozunk visszaállítani a munkamenetét egy korábbi mentésből. Kérem jelezze a hibát a fejlesztőknek a $url címen. A hiba szövege a következő: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'Üzenet továbbítása a $roomName szobába?';
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
  String get transparent => 'Átlátszó';

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
  String get restricted => 'Korlátozott';

  @override
  String get knockRestricted => 'Kopogás korlátozva';

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
  String get sendCanceled => 'Küldés visszavonva';

  @override
  String get loginWithREChainId => 'Bejelentkezés REChain ID-vel';

  @override
  String get discoverHomeservers =>
      'Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node Network-kiszolgálók felfedezése';

  @override
  String get whatIsAHomeserver =>
      'Mi az a Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node Network-kiszolgáló?';

  @override
  String get homeserverDescription =>
      'Az összes adata a Mátrix-kiszolgálón tárolódik, pont mint egy e-mail kiszolgálón. Kiválaszthatja melyik Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node Network-kiszolgálót akarja használni, miközben tud kommunikálni mindenkivel. Tudjon meg többet a https://online.rechain.network címen.';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Nem tűnik kompatibilisnek a Mátrix-kiszolgálónak. Hibás a hivatkozás?';

  @override
  String get calculatingFileSize => 'Fájl méret kalkulálása...';

  @override
  String get prepareSendingAttachment => 'Felkészülés csatolmány küldésére...';

  @override
  String get sendingAttachment => 'Csatolmány küldése...';

  @override
  String get generatingVideoThumbnail => 'Videó miniatűr generálása...';

  @override
  String get compressVideo => 'Videó tömörítése...';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return '$index csatolmány küldése $length-ból...';
  }

  @override
  String serverLimitReached(int seconds) {
    return 'Szerver korlát elérve! $seconds mp türelem...';
  }

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Egyik készüléke nem hitelesített';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Megjegyzés: Minden eszköze amit a csevegés mentéshez kapcsol, automatikusan hitelesítésre kerül.';

  @override
  String get continueText => 'Folytatás';

  @override
  String get welcomeText =>
      'Üdv 👋 Ez a REChain. Bejelentkezhet bármely Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node Network-kiszolgálóhoz amely kompatibilis a https://online.rechain.network címmel. Ezután cseveghet bárkivel. Így képez egy óriási decentralizált üzenetküldő hálózatot!';

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
  String get appIntroduction =>
      'A REChain segítségével cseveghet barátaival, akár más üzenetküldő alkalmazásokon keresztül is. Tudjon meg erről többet a https://online.rechain.network oldalon, vagy nyomjon a \"Folytatás\" gombra.';

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
  String get declineInvitation => 'Decline invitation';
}
