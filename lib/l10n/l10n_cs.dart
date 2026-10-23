// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class L10nCs extends L10n {
  L10nCs([String locale = 'cs']) : super(locale);

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
  String get repeatPassword => 'Zopakujte heslo';

  @override
  String get notAnImage => 'Není obrázek.';

  @override
  String get remove => 'Odstranit';

  @override
  String get importNow => 'Importovat nyní';

  @override
  String get importEmojis => 'Importovat Emoji';

  @override
  String get importFromZipFile => 'Importovat ze .zip souboru';

  @override
  String get exportEmotePack => 'Exportovat Emoji jako .zip';

  @override
  String get replace => 'Nahradit';

  @override
  String get about => 'O aplikaci';

  @override
  String aboutHomeserver(String homeserver) {
    return 'O $homeserver';
  }

  @override
  String get accept => 'Přijmout';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username přijal/a pozvání';
  }

  @override
  String get account => 'Účet';

  @override
  String get accountsAndSettings => 'Accounts and settings';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username aktivoval/a koncové šifrování';
  }

  @override
  String get addEmail => 'Přidat e-mail';

  @override
  String get confirmREChainId =>
      'Please confirm your REChain ID in order to delete your account.';

  @override
  String supposedMxid(String mxid) {
    return 'Tady by mělo být $mxid';
  }

  @override
  String get addToSpace => 'Přidat do prostoru';

  @override
  String get admin => 'Správce';

  @override
  String get alias => 'alias';

  @override
  String get all => 'Vše';

  @override
  String get commandHint_roomupgrade =>
      'Upgrade this room to the given room version';

  @override
  String get commandHint_googly => 'Poslat kroutící se očička';

  @override
  String get commandHint_cuddle => 'Poslat mazlení';

  @override
  String get commandHint_hug => 'Poslat obejmutí';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName vám posílá kroutící se očička';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName se s vámi mazlí';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName vás objímá';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName odpověděl na hovor';
  }

  @override
  String get anyoneCanJoin => 'Kdokoliv se může připojit';

  @override
  String get appLock => 'Zámek aplikace';

  @override
  String get appLockDescription =>
      'Zamknout aplikaci pomocí PIN kódu když není používána';

  @override
  String get archive => 'Archivovat';

  @override
  String get areGuestsAllowedToJoin => 'Mohou se připojit hosté';

  @override
  String get areYouSure => 'Jste si jistý?';

  @override
  String get discardEdits => 'You have unsaved changes. Discard your edits?';

  @override
  String get areYouSureYouWantToLogout => 'Opravdu se chcete odhlásit?';

  @override
  String get askSSSSSign =>
      'Pro ověření této osoby zadejte prosím přístupovou frázi k „bezpečnému úložišti“ anebo „klíč pro obnovu“.';

  @override
  String askVerificationRequest(String username) {
    return 'Přijmout žádost o ověření od $username?';
  }

  @override
  String get autoplayImages =>
      'Automaticky přehrajte animované nálepky a emoce';

  @override
  String badServerLoginTypesException(
    String serverVersions,
    String supportedVersions,
    Object suportedVersions,
  ) {
    return 'Homeserver podporuje přihlášení typu:\n$serverVersions\nAle tato aplikace podporuje pouze:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Posílat oznámení o psaní';

  @override
  String get swipeRightToLeftToReply => 'Potáhněte z prava do leva pro odpověď';

  @override
  String get sendOnEnter => 'Odeslat při vstupu';

  @override
  String get noMoreChatsFound => 'Žádné další konverzace nalezeny...';

  @override
  String get noChatsFoundHere =>
      'Nejsou zde žádné chaty. Začněte nový chat s někým, použitím níže uvedeného tlačítka. ⤵️';

  @override
  String get unread => 'Nepřečtené';

  @override
  String get space => 'Prostor';

  @override
  String get banFromChat => 'Zakázat chat';

  @override
  String get banned => 'Zakázán';

  @override
  String bannedUser(String username, String targetName) {
    return '$username zakázal $targetName';
  }

  @override
  String get blockDevice => 'Blokovat zařízení';

  @override
  String get blocked => 'Zakázán';

  @override
  String get cancel => 'Zrušit';

  @override
  String cantOpenUri(String uri) {
    return 'Nelze otevřít URI $uri';
  }

  @override
  String get changeDeviceName => 'Změnit název zařízení';

  @override
  String changedTheChatAvatar(String username) {
    return '$username změnil avatar chatu';
  }

  @override
  String changedTheChatDescription(Object username) {
    return '$username změnil/a popis konverzace';
  }

  @override
  String changedTheChatName(Object username) {
    return '$username změnil/a název konverzace';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username změnili nastavení oprávnění v chatu';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username změnili svoji přezdívku na: $displayname';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username změnili přístupová práva pro hosty';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username změnili přístupová práva pro hosty na: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username změnili nastavení viditelnosti historie diskuze';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username změnili nastavení viditelnosti historie diskuze na: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username změnili nastavení pravidel připojení';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username změnili nastavení pravidel připojení na: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username změnili svůj avatar';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username změnili nastavení aliasů místnosti';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username změnili odkaz k pozvání do místnosti';
  }

  @override
  String get changePassword => 'Změnit heslo';

  @override
  String get changeTheHomeserver => 'Změnit domovský server';

  @override
  String get changeTheme => 'Změňte svůj styl';

  @override
  String get changeTheNameOfTheGroup => 'Změnit název skupiny';

  @override
  String get changeYourAvatar => 'Změňte svůj avatar';

  @override
  String get channelCorruptedDecryptError => 'Šifrování bylo poškozeno';

  @override
  String get chat => 'Chat';

  @override
  String get chatBackup => 'Záloha chatu';

  @override
  String get chatDetails => 'Bližší údaje o chatu';

  @override
  String get chats => 'Chaty';

  @override
  String get chooseAStrongPassword => 'Vyberte silné heslo';

  @override
  String get clearArchive => 'Vymazat archiv';

  @override
  String get close => 'Zavřít';

  @override
  String get commandHint_markasdm =>
      'Označit jako místnost přímé konverzace s daným REChain ID';

  @override
  String get commandHint_markasgroup => 'Označit jako skupinu';

  @override
  String get commandHint_ban =>
      'Zakázat danému uživateli přístup do této místnosti';

  @override
  String get commandHint_clearcache => 'Vymazat mezipamět';

  @override
  String get commandHint_create =>
      'Vytvořte prázdný skupinový chat\n K deaktivaci šifrování použijte --no-encryption';

  @override
  String get commandHint_discardsession => 'Zahodit relaci';

  @override
  String get commandHint_dm =>
      'Zahajte přímý chat\nK deaktivaci šifrování použijte --no-encryption';

  @override
  String get commandHint_html => 'Odeslat text ve formátu HTML';

  @override
  String get commandHint_invite => 'Pozvěte daného uživatele do této místnosti';

  @override
  String get commandHint_join => 'Připojte se k dané místnosti';

  @override
  String get commandHint_kick => 'Odeberte daného uživatele z této místnosti';

  @override
  String get commandHint_leave => 'Opusťte tuto místnost';

  @override
  String get commandHint_me => 'Představ se';

  @override
  String get commandHint_myroomavatar =>
      'Nastavte si obrázek pro tuto místnost (autor mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Nastavte si váš zobrazovaný název pro tuto místnost';

  @override
  String get commandHint_op =>
      'Nastavit úroveň práv daného uživatele (výchozí: 50)';

  @override
  String get commandHint_plain => 'Odeslat neformátovaný text';

  @override
  String get commandHint_react => 'Odeslat odpověď jako reakci';

  @override
  String get commandHint_send => 'Poslat zprávu';

  @override
  String get commandHint_unban =>
      'Zrušte zákaz přístupu daného uživatele do této místnosti';

  @override
  String get commandInvalid => 'Příkaz je neplatný';

  @override
  String commandMissing(String command) {
    return '$command není příkaz.';
  }

  @override
  String get compareEmojiMatch =>
      'Porovnejte a přesvědčete se, že následující emotikony se shodují na obou zařízeních:';

  @override
  String get compareNumbersMatch =>
      'Porovnejte a přesvědčete se, že následující čísla se shodují na obou zařízeních:';

  @override
  String get configureChat => 'Nastavení chatu';

  @override
  String get contactHasBeenInvitedToTheGroup => 'Kontakt byl pozván do skupiny';

  @override
  String get contentHasBeenReported => 'Obsah byl nahlášen správcům serveru';

  @override
  String get copiedToClipboard => 'Zkopírováno do schránky';

  @override
  String get copy => 'Kopírovat';

  @override
  String get copyToClipboard => 'Zkopírovat do schránky';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Nebylo možné dešifrovat zprávu: $error';
  }

  @override
  String get checkList => 'Kontrolní seznam';

  @override
  String countParticipants(int count) {
    return '$count účastníků';
  }

  @override
  String countInvited(int count) {
    return '$count pozváno';
  }

  @override
  String get create => 'Vytvořit';

  @override
  String createdTheChat(String username) {
    return '💬 $username založil/a chat';
  }

  @override
  String get createGroup => 'Vytvořit skupinu';

  @override
  String get createNewSpace => 'Nový prostor';

  @override
  String get currentlyActive => 'Aktuálně aktivní';

  @override
  String get darkTheme => 'Tmavé';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String get deactivateAccountWarning =>
      'Tímto krokem se deaktivuje váš uživatelský účet. Akci nelze vrátit zpět! Jste si jistí?';

  @override
  String get defaultPermissionLevel =>
      'Výchozí úroveň oprávnění nových uživatelů';

  @override
  String get delete => 'Smazat';

  @override
  String get deleteAccount => 'Smazat účet';

  @override
  String get deleteMessage => 'Smazat zprávu';

  @override
  String get devices => 'Zařízení';

  @override
  String get directChats => 'Přímé chatování';

  @override
  String get displaynameHasBeenChanged => 'Přezdívka byla změněna';

  @override
  String get downloadFile => 'Stáhnout soubor';

  @override
  String get edit => 'Upravit';

  @override
  String get editBlockedServers => 'Upravit zakázané servery';

  @override
  String get chatPermissions => 'Oprávnění konverzace';

  @override
  String get editDisplayname => 'Změnit přezdívku';

  @override
  String get editRoomAliases => 'Upravit aliasy místností';

  @override
  String get editRoomAvatar => 'Upravit avatara místnosti';

  @override
  String get emoteExists => 'Emotikona již existuje!';

  @override
  String get emoteInvalid => 'Neplatný kód emotikony!';

  @override
  String get emoteKeyboardNoRecents =>
      'Naposledy použité emoce se zobrazí zde...';

  @override
  String get globalChatId => 'Globální ID chatu';

  @override
  String get accessAndVisibility => 'Přístup a viditelnost';

  @override
  String get accessAndVisibilityDescription =>
      'Kdo se může připojit a najít tuto konverzaci.';

  @override
  String get customEmojisAndStickers => 'Vlastní emoji a nálepky';

  @override
  String get customEmojisAndStickersBody =>
      'Přidat nebo sdílet vlastní emoji nebo nálepky, které mohou být použité v konverzaci.';

  @override
  String get emoteShortcode => 'Klávesová zkratka emotikonu';

  @override
  String get emptyChat => 'Prázdný chat';

  @override
  String get enableEmotesGlobally => 'Povolit balíček emotikon všude';

  @override
  String get enableEncryption => 'Povolit šifrování';

  @override
  String get enableEncryptionWarning =>
      'Šifrování již nebude možné vypnout. Jste si tím jisti?';

  @override
  String get encrypted => 'Šifrováno';

  @override
  String get encryption => 'Šifrování';

  @override
  String get encryptionNotEnabled => 'Šifrování není aktivní';

  @override
  String endedTheCall(String senderName) {
    return '$senderName ukončil hovor';
  }

  @override
  String get enterAnEmailAddress => 'Zadejte e-mailovou adresu';

  @override
  String errorObtainingLocation(String error) {
    return 'Chyba při získávání polohy: $error';
  }

  @override
  String get fontSize => 'Velikost písma';

  @override
  String get forward => 'Přeposlat';

  @override
  String get fromJoining => 'Od vstupu';

  @override
  String get fromTheInvitation => 'Od pozvání';

  @override
  String get group => 'Skupina';

  @override
  String get chatDescription => 'Popis konverzace';

  @override
  String get chatDescriptionHasBeenChanged => 'Popis konverzace byl změněn';

  @override
  String get groupIsPublic => 'Skupina je veřejná';

  @override
  String get groups => 'Skupiny';

  @override
  String groupWith(String displayname) {
    return 'Skupina s $displayname';
  }

  @override
  String get guestsAreForbidden => 'Hosté jsou zakázáni';

  @override
  String get guestsCanJoin => 'Hosté se mohou připojit';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username stáhl pozvánku pro $targetName';
  }

  @override
  String get help => 'Pomoc';

  @override
  String get hideRedactedMessages => 'Skrýt upravené zprávy';

  @override
  String get hideRedactedMessagesBody =>
      'Pokud někdo zprávu zrediguje, nebude tato zpráva v chatu již viditelná.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Skrytí nesprávných nebo neznámých formátů zpráv';

  @override
  String get block => 'Blokovat';

  @override
  String get blockedUsers => 'Zablokování uživatelé';

  @override
  String get blockListDescription =>
      'Můžete blokovat uživatele, kteří vás obtěžují. Od uživatelů na vašem osobním seznamu blokovaných uživatelů nebudete moci přijímat žádné zprávy ani pozvánky do místnosti.';

  @override
  String get blockUsername => 'Ignorovat uživatelské jméno';

  @override
  String get iHaveClickedOnLink => 'Klikl jsem na odkaz';

  @override
  String get incorrectPassphraseOrKey =>
      'Nesprávné přístupové heslo anebo klíč pro obnovu';

  @override
  String get inviteContact => 'Pozvat kontakt';

  @override
  String inviteContactToGroup(String groupName) {
    return 'Pozvat kontakt do $groupName';
  }

  @override
  String get noChatDescriptionYet =>
      'Zatím nebyl vytvořen žádný popis konverzace.';

  @override
  String get tryAgain => 'Zkuste to znovu';

  @override
  String get invalidServerName => 'Neplatné jméno serveru';

  @override
  String get invited => 'Pozvaný';

  @override
  String get redactMessageDescription =>
      'Tato zpráva bude smazána pro všechny účastníky konverzace. Tuto akci nelze vzít zpět.';

  @override
  String get optionalRedactReason => '(Nepovinné) Důvod smazání této zprávy…';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username pozval/a $targetName';
  }

  @override
  String get invitedUsersOnly => 'Pouze pozvaní uživatelé';

  @override
  String inviteText(String username, String link) {
    return '$username vás pozvali na REChain.\n1. Navštivte github.com/sorydima/REChain- a nainstalujte si aplikaci.\n2. Zaregistrujte se anebo se přihlašte.\n3. Otevřete pozvánku: \n $link';
  }

  @override
  String get isTyping => 'píše…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username se připojil/a k chatu';
  }

  @override
  String get joinRoom => 'Připojte se k místnosti';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username vyhodil/a $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '$username vyhodili a zakázali $targetName';
  }

  @override
  String get kickFromChat => 'Vyhodit z chatu';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Naposledy aktivní: $localizedTimeShort';
  }

  @override
  String get leave => 'Opustit';

  @override
  String get leftTheChat => 'Opustil chat';

  @override
  String get lightTheme => 'Světlé';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Načíst dalších $count účastníků';
  }

  @override
  String get dehydrate => 'Exportovat sezení a promazat zařízení';

  @override
  String get dehydrateWarning =>
      'Tuto akci nelze vzít zpět. Ujistěte se že záložní soubor máte bezpečně uložen.';

  @override
  String get hydrate => 'Obnovit ze záložního souboru';

  @override
  String get loadingPleaseWait => 'Načítání… Prosíme vyčkejte.';

  @override
  String get loadMore => 'Načíst další…';

  @override
  String get locationDisabledNotice =>
      'Služby určování polohy jsou deaktivovány. Povolte jim, aby mohli sdílet vaši polohu.';

  @override
  String get locationPermissionDeniedNotice =>
      'Oprávnění k poloze odepřeno. Udělte jim prosím možnost sdílet vaši polohu.';

  @override
  String get login => 'Přihlásit se';

  @override
  String logInTo(String homeserver) {
    return 'Přihlášení k $homeserver';
  }

  @override
  String get logout => 'Odhlásit';

  @override
  String get mention => 'Zmínit se';

  @override
  String get messages => 'Zprávy';

  @override
  String get messagesStyle => 'Zprávy:';

  @override
  String get moderator => 'Moderátor';

  @override
  String get muteChat => 'Ztlumit chat';

  @override
  String get newChat => 'Nový chat';

  @override
  String get newMessageInrechainonline => 'Nová zpráva ve REChain.';

  @override
  String get newVerificationRequest => 'Nová žádost o ověření!';

  @override
  String get next => 'Další';

  @override
  String get no => 'Ne';

  @override
  String get noConnectionToTheServer => 'Žádné připojení k serveru';

  @override
  String get noEmotesFound => 'Nebyly nalezeny žádné emotikony. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Můžete aktivovat šifrování jakmile místnost přestane být veřejně dostupná.';

  @override
  String get noGoogleServicesWarning =>
      'Zdá se, že služba Firebase Cloud Messaging není ve vašem zařízení k dispozici. Chcete-li i nadále přijímat push oznámení, doporučujeme nainstalovat ntfy. Pomocí ntfy nebo jiného poskytovatele Unified Push můžete přijímat oznámení push zabezpečeným způsobem přenosu dat. Aplikaci ntfy si můžete stáhnout z obchodu PlayStore nebo z webu F-Droid.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 není REChain server, použít místo toho server $server2?';
  }

  @override
  String get shareInviteLink => 'Sdílet pozvánku';

  @override
  String get scanQrCode => 'Naskenujte QR kód';

  @override
  String get noPasswordRecoveryDescription =>
      'Dosud jste nepřidali způsob, jak obnovit své heslo.';

  @override
  String get noPermission => 'Chybí oprávnění';

  @override
  String get noRoomsFound => 'Nebyly nalezeny žádné místnosti…';

  @override
  String get notifications => 'Oznámení';

  @override
  String numUsersTyping(int count) {
    return '$count uživatelé píší…';
  }

  @override
  String get obtainingLocation => 'Získávání polohy…';

  @override
  String get ok => 'Ok';

  @override
  String get onlineKeyBackupEnabled => 'Online záloha kíčů je zapnuta';

  @override
  String get oopsPushError =>
      'Jejda! Při nastavování oznámení push došlo bohužel k chybě.';

  @override
  String get oopsSomethingWentWrong => 'Jejda, něco se pokazilo…';

  @override
  String get openAppToReadMessages => 'Otevřete aplikaci pro přečtení zpráv';

  @override
  String get openCamera => 'Otevřít fotoaparát';

  @override
  String get oneClientLoggedOut => 'Jeden z vašich klientů byl odhlášen';

  @override
  String get addAccount => 'Přidat účet';

  @override
  String get editBundlesForAccount => 'Upravit balíčky pro tento účet';

  @override
  String get addToBundle => 'Přidat do balíčku';

  @override
  String get removeFromBundle => 'Odstranit z tohoto balíčku';

  @override
  String get bundleName => 'Název balíčku';

  @override
  String get openInMaps => 'Otevřít v mapách';

  @override
  String get link => 'Odkaz';

  @override
  String get or => 'Nebo';

  @override
  String get participant => 'Účastník';

  @override
  String get passphraseOrKey => 'heslo nebo klíč pro obnovení';

  @override
  String get password => 'Heslo';

  @override
  String get passwordForgotten => 'Zapomenuté heslo';

  @override
  String get passwordHasBeenChanged => 'Heslo bylo změněno';

  @override
  String get passwordRecoverySettings => 'Nastavení obnovení hesla';

  @override
  String get passwordRecovery => 'Obnova hesla';

  @override
  String get pin => 'Připnout zprávu';

  @override
  String get pleaseChooseAPasscode => 'Vyberte přístupový kód';

  @override
  String get pleaseClickOnLink => 'Klikněte na odkaz v e-mailu a pokračujte.';

  @override
  String get pleaseEnterYourPassword => 'Zadejte prosím své heslo';

  @override
  String get pleaseEnterYourPin => 'Zadejte svůj PIN';

  @override
  String get pleaseEnterYourUsername => 'Zadejte prosím své uživatelské jméno';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Postupujte podle pokynů na webu a klepněte na další.';

  @override
  String get privacy => 'Soukromí';

  @override
  String get publicRooms => 'Veřejné místnosti';

  @override
  String get reason => 'Důvod';

  @override
  String redactedBy(String username) {
    return 'Smazáno uživatelem $username';
  }

  @override
  String redactedByBecause(String username, String reason) {
    return 'Smazáno uživatelem $username s důvodem: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username opravili událost';
  }

  @override
  String get redactMessage => 'Redigovat zprávu';

  @override
  String get reject => 'Zamítnout';

  @override
  String rejectedTheInvitation(String username) {
    return '$username odmítli pozvání';
  }

  @override
  String get removeAllOtherDevices => 'Odstranit všechna další zařízení';

  @override
  String get unbanFromChat => 'Zrušit zákaz chatu';

  @override
  String get removeYourAvatar => 'Odstraňte svého avatara';

  @override
  String get replaceRoomWithNewerVersion => 'Nahradit místnost novou verzí';

  @override
  String get reply => 'Odpovědět';

  @override
  String get reportMessage => 'Nahlásit zprávu';

  @override
  String get roomHasBeenUpgraded => 'Místnost byla upgradována';

  @override
  String sendingFilesDoNotExit(int count) {
    return 'Sending $count files... Please do not exit!';
  }

  @override
  String get roomVersion => 'Verze místnosti';

  @override
  String get compressingVideo => 'Compressing video...';

  @override
  String get saveFile => 'Uložit soubor';

  @override
  String get search => 'Hledat';

  @override
  String get security => 'Bezpečnostní';

  @override
  String get send => 'Odeslat';

  @override
  String get sendAMessage => 'Odeslat zprávu';

  @override
  String get sendAsText => 'Odeslat jako text';

  @override
  String get sendAudio => 'Odeslat audio';

  @override
  String get sendFile => 'Odeslat soubor';

  @override
  String get sendImage => 'Odeslat obrázek';

  @override
  String sendImages(int count) {
    return 'Send $count image';
  }

  @override
  String get sendMessages => 'Odeslat zprávy';

  @override
  String get sendVideo => 'Odeslat video';

  @override
  String sentAFile(String username) {
    return '$username poslali soubor';
  }

  @override
  String sentAnAudio(String username) {
    return '$username poslali zvukovou nahrávku';
  }

  @override
  String sentAPicture(String username) {
    return '$username poslali obrázek';
  }

  @override
  String sentASticker(String username) {
    return '$username poslali samolepku';
  }

  @override
  String sentAVideo(String username) {
    return '$username poslali video';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName odeslal informace o hovoru';
  }

  @override
  String get setAsCanonicalAlias => 'Nastavit jako hlavní alias';

  @override
  String get setChatDescription => 'Nastavit popis konverzace';

  @override
  String get setStatus => 'Nastavit stav';

  @override
  String get settings => 'Nastavení';

  @override
  String get share => 'Sdílet';

  @override
  String sharedTheLocation(String username) {
    return '$username sdílel jejich polohu';
  }

  @override
  String get shareLocation => 'Sdílet polohu';

  @override
  String get skip => 'Přeskočit';

  @override
  String get sourceCode => 'Zdrojové kódy';

  @override
  String get spaceIsPublic => 'Prostor je veřejný';

  @override
  String get spaceName => 'Název prostoru';

  @override
  String startedACall(String senderName) {
    return '$senderName zahájil hovor';
  }

  @override
  String get status => 'Stav';

  @override
  String get statusExampleMessage => 'Jak se dneska máš?';

  @override
  String get submit => 'Odeslat';

  @override
  String get synchronizingPleaseWait => 'Synchronizace ... Čekejte prosím.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Synchronizing… ($percentage%)';
  }

  @override
  String get systemTheme => 'Téma systému';

  @override
  String get theyDontMatch => 'Neshodují se';

  @override
  String get theyMatch => 'Shodují se';

  @override
  String get tooManyRequestsWarning =>
      'Příliš mnoho požadavků. Prosím zkuste to znovu později!';

  @override
  String get tryToSendAgain => 'Zkuste odeslat znovu';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username zrušili zákaz pro $targetName';
  }

  @override
  String get unblockDevice => 'Odblokovat zařízení';

  @override
  String get unknownDevice => 'Neznámé zařízení';

  @override
  String get unknownEncryptionAlgorithm => 'Neznámý šifrovací algoritmus';

  @override
  String unknownEvent(String type) {
    return 'Neznámá událost „$type“';
  }

  @override
  String get unmuteChat => 'Zrušit ztlumení chatu';

  @override
  String get unpin => 'Odepnout zprávu';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username a $count dalších píší…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username a $username2 píší…';
  }

  @override
  String userIsTyping(String username) {
    return '$username píše…';
  }

  @override
  String userLeftTheChat(String username) {
    return '$username opustili chat';
  }

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username poslali událost $type';
  }

  @override
  String get unverified => 'Neověřeno';

  @override
  String get verified => 'Ověřeno';

  @override
  String get verifyStart => 'Zahájit ověření';

  @override
  String get verifySuccess => 'Ověření proběhlo úspěšně!';

  @override
  String get verifyTitle => 'Ověřuji druhý účet';

  @override
  String get visibilityOfTheChatHistory => 'Viditelnost historie chatu';

  @override
  String get visibleForAllParticipants => 'Viditelné pro všechny účastnící se';

  @override
  String get visibleForEveryone => 'Viditelné pro všechny';

  @override
  String get voiceMessage => 'Hlasová zpráva';

  @override
  String get waitingPartnerAcceptRequest =>
      'Čeká se na potvrzení žádosti partnerem…';

  @override
  String get waitingPartnerEmoji => 'Čeká se na potvrzení emoji partnerem…';

  @override
  String get waitingPartnerNumbers => 'Čekání na partnera až přijme čísla…';

  @override
  String get warning => 'Varování!';

  @override
  String get weSentYouAnEmail => 'Zaslali jsme vám e-mail';

  @override
  String get whoCanPerformWhichAction => 'Kdo může provést jakou akci';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'Kdo se může připojit do této skupiny';

  @override
  String get whyDoYouWantToReportThis => 'Proč to chcete nahlásit?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'S těmito adresami můžete obnovit své heslo.';

  @override
  String get writeAMessage => 'Napište zprávu…';

  @override
  String get yes => 'Ano';

  @override
  String get you => 'Vy';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Tohoto chatu se nadále neúčastníte';

  @override
  String get yourPublicKey => 'Váš veřejný klíč';

  @override
  String get messageInfo => 'Informace o zprávě';

  @override
  String get time => 'Čas';

  @override
  String get sender => 'Odesílatel';

  @override
  String get openGallery => 'Otevřít galerii';

  @override
  String get removeFromSpace => 'Odstranit z tohoto místa';

  @override
  String get markAsRead => 'Označit jako přečtené';

  @override
  String get reportUser => 'Nahlásit uživatele';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender reagoval s $reaction';
  }

  @override
  String get pinMessage => 'Připnout zprávu do místnosti';

  @override
  String get confirmEventUnpin => 'Opravdu chcete událost trvale odepnout?';

  @override
  String get emojis => 'Emojis';

  @override
  String get unsupportedAndroidVersion => 'Nepodporovaná verze Androidu';

  @override
  String get unsupportedAndroidVersionLong =>
      'Tato funkce vyžaduje novější verzi Android. Zkontrolujte prosím aktualizace nebo podporu Mobile Katya OS.';

  @override
  String get youRejectedTheInvitation => 'Odmítli jste pozvání';

  @override
  String get youJoinedTheChat => 'Připojili jste se k chatu';

  @override
  String get youAcceptedTheInvitation => 'Přijal jsi pozvání';

  @override
  String youBannedUser(String user) {
    return 'Zakázali jste uživatele $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Stáhli jste pozvánku pro uživatele $user';
  }

  @override
  String youInvitedBy(String user) {
    return 'Byli jste pozváni uživatelem $user';
  }

  @override
  String youInvitedUser(String user) {
    return 'Pozvali jste uživatele $user';
  }

  @override
  String youKicked(String user) {
    return 'Vykopli jste uživatele $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return 'Vykopli jste a zakázali jste uživatele $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Zrušili jste zákaz uživateli $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user zaklepal';
  }

  @override
  String get usersMustKnock => 'Uživatelé musí zaklepat';

  @override
  String get noOneCanJoin => 'No one can join';

  @override
  String get knock => 'Zaklepat';

  @override
  String get users => 'Uživatelé';

  @override
  String get storeInAndroidKeystore => 'Uložit v Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Uložit v Apple KeyChain';

  @override
  String get storeSecurlyOnThisDevice => 'Uložit bezpečně na tomto zařízení';

  @override
  String countFiles(int count) {
    return '$count souborů';
  }

  @override
  String get user => 'Uživatel';

  @override
  String get custom => 'Vlastní';

  @override
  String get whyIsThisMessageEncrypted => 'Proč nelze přečíst tuto zprávu?';

  @override
  String get noKeyForThisMessage =>
      'This can happen if the message was sent before you have signed in to your account at this device.\n\nIt is also possible that the sender has blocked your device or something went wrong with the internet connection.\n\nAre you able to read the message on another session? Then you can transfer the message from it! Go to Settings > Devices and make sure that your devices have verified each other. When you open the room the next time and both sessions are in the foreground, the keys will be transmitted automatically.\n\nDo you not want to lose the keys when logging out or switching devices? Make sure that you have enabled the chat backup in the settings.';

  @override
  String get newSpace => 'Nový prostor';

  @override
  String get doNotShowAgain => 'Nezobrazovat znovu';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Prázdná konverzace (dříve $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Prostory umožňují organizovat vaše konverzace a vytvářet soukromé nebo veřejné komunity';

  @override
  String get encryptThisChat => 'Zašifrovat tuto konverzaci';

  @override
  String get disableEncryptionWarning =>
      'Z bezpečnostních důvodů nemůžete vypnout šifrování v chatu, kde již bylo dříve zapnuto.';

  @override
  String get sorryThatsNotPossible => 'Omlouváme se… to není možné';

  @override
  String get reopenChat => 'Znovu otevřít konverzaci';

  @override
  String get noBackupWarning =>
      'Warning! Without enabling chat backup, you will lose access to your encrypted messages. It is highly recommended to enable the chat backup first before logging out.';

  @override
  String get noOtherDevicesFound => 'Žádná ostatní zařízení nebyla nalezena';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Server oznamuje že soubor je příliš velký na odeslání.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Soubor uložen do $path';
  }

  @override
  String get jumpToLastReadMessage => 'Skočit na naposledy přečtenou zprávu';

  @override
  String get readUpToHere => 'Read up to here';

  @override
  String get jump => 'Skočit';

  @override
  String get openLinkInBrowser => 'Otevřít odkaz v prohlížeči';

  @override
  String get reportErrorDescription =>
      '😭 Oh no. Something went wrong. If you want, you can report this bug to the developers.';

  @override
  String get report => 'report';

  @override
  String get setColorTheme => 'Nastavit barvy:';

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
      'Upozorňujeme, že videohovory jsou aktuálně ve verzi beta. Nemusí fungovat podle očekávání nebo fungovat vůbec na všech platformách.';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get incomingCall => 'Incoming call';

  @override
  String get videoCall => 'Video hovor';

  @override
  String get voiceCall => 'Hlasový hovor';

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
