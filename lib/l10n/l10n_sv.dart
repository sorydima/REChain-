// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class L10nSv extends L10n {
  L10nSv([String locale = 'sv']) : super(locale);

  @override
  String get alwaysUse24HourFormat => 'false';

  @override
  String get repeatPassword => 'Upprepa lösenord';

  @override
  String get notAnImage => 'Inte en bildfil.';

  @override
  String get setCustomPermissionLevel => 'Set custom permission level';

  @override
  String get setPermissionsLevelDescription =>
      'Please choose a predefined role below or enter a custom permission level between 0 and 100.';

  @override
  String get ignoreUser => 'Ignore user';

  @override
  String get normalUser => 'Normal user';

  @override
  String get remove => 'Ta bort';

  @override
  String get importNow => 'Importera nu';

  @override
  String get importEmojis => 'Importera emojier';

  @override
  String get importFromZipFile => 'Importera från .zip-fil';

  @override
  String get exportEmotePack => 'Exportera Emote-pack som .zip';

  @override
  String get replace => 'Ersätt';

  @override
  String get about => 'Om';

  @override
  String aboutHomeserver(String homeserver) {
    return 'About $homeserver';
  }

  @override
  String get accept => 'Acceptera';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username accepterade inbjudan';
  }

  @override
  String get account => 'Konto';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username aktiverade ändpunktskryptering';
  }

  @override
  String get addEmail => 'Lägg till e-post';

  @override
  String get confirmMatrixId =>
      'Bekräfta ditt REChain-ID för att radera ditt konto.';

  @override
  String supposedMxid(String mxid) {
    return 'Detta bör vara $mxid';
  }

  @override
  String get addChatDescription => 'Lägg till en chattbeskrivning…';

  @override
  String get addToSpace => 'Lägg till i utrymme';

  @override
  String get admin => 'Admin';

  @override
  String get alias => 'alias';

  @override
  String get all => 'Alla';

  @override
  String get allChats => 'Alla chattar';

  @override
  String get commandHint_roomupgrade =>
      'Upgrade this room to the given room version';

  @override
  String get commandHint_googly => 'Skicka några googly ögon';

  @override
  String get commandHint_cuddle => 'Skicka en omfamning';

  @override
  String get commandHint_hug => 'Skicka en kram';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName skickar dig googly ögon';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName omfamnar dig';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName kramar dig';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName besvarade samtalet';
  }

  @override
  String get anyoneCanJoin => 'Vem som helst kan gå med';

  @override
  String get appLock => 'App-lås';

  @override
  String get appLockDescription =>
      'Lock the app when not using with a pin code';

  @override
  String get archive => 'Arkiv';

  @override
  String get areGuestsAllowedToJoin => 'Får gästanvändare gå med';

  @override
  String get areYouSure => 'Är du säker?';

  @override
  String get areYouSureYouWantToLogout =>
      'Är du säker på att du vill logga ut?';

  @override
  String get askSSSSSign =>
      'För att kunna signera den andra personen, vänligen ange din lösenfras eller återställningsnyckel för säker lagring.';

  @override
  String askVerificationRequest(String username) {
    return 'Acceptera denna verifikationsförfrågan från $username?';
  }

  @override
  String get autoplayImages =>
      'Automatisk spela upp animerade klistermärken och emoji';

  @override
  String badServerLoginTypesException(
    String serverVersions,
    String supportedVersions,
    Object suportedVersions,
  ) {
    return 'Hemma servern stödjer följande inloggnings typer :\n $serverVersions\nMen denna applikation stödjer enbart:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Skicka skrivnotifikationer';

  @override
  String get swipeRightToLeftToReply => 'Swipe right to left to reply';

  @override
  String get sendOnEnter => 'Skicka med Enter';

  @override
  String badServerVersionsException(
    String serverVersions,
    String supportedVersions,
    Object serverVerions,
    Object supoortedVersions,
    Object suportedVersions,
  ) {
    return 'Hemservern stöjder Spec-versionen:\n$serverVersions\nMen denna app stödjer enbart $supportedVersions';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats chats and $participants participants';
  }

  @override
  String get noMoreChatsFound => 'No more chats found...';

  @override
  String get noChatsFoundHere =>
      'No chats found here yet. Start a new chat with someone by using the button below. ⤵️';

  @override
  String get joinedChats => 'Joined chats';

  @override
  String get unread => 'Unread';

  @override
  String get space => 'Space';

  @override
  String get spaces => 'Spaces';

  @override
  String get banFromChat => 'Bannlys från chatt';

  @override
  String get banned => 'Bannlyst';

  @override
  String bannedUser(String username, String targetName) {
    return '$username bannlös $targetName';
  }

  @override
  String get blockDevice => 'Blockera Enhet';

  @override
  String get blocked => 'Blockerad';

  @override
  String get botMessages => 'Bot meddelanden';

  @override
  String get cancel => 'Avbryt';

  @override
  String cantOpenUri(String uri) {
    return 'Kan inte öppna URL $uri';
  }

  @override
  String get changeDeviceName => 'Ändra enhetsnamn';

  @override
  String changedTheChatAvatar(String username) {
    return '$username ändrade sin chatt-avatar';
  }

  @override
  String changedTheChatDescription(Object username) {
    return '$username changed the chat description';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username ändrade chatt-beskrivningen till: \'$description\'';
  }

  @override
  String changedTheChatName(Object username) {
    return '$username changed the chat name';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username ändrade sitt chatt-namn till: \'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username ändrade chatt-rättigheterna';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username ändrade visningsnamnet till: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username ändrade reglerna för gästaccess';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username ändrade reglerna för gästaccess till: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username ändrade historikens synlighet';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username ändrade historikens synlighet till: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username ändrade anslutningsreglerna';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username ändrade anslutningsreglerna till $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username ändrade sin avatar';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username ändrade rummets alias';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username ändrade inbjudningslänken';
  }

  @override
  String get changePassword => 'Ändra lösenord';

  @override
  String get changeTheHomeserver => 'Ändra hemserver';

  @override
  String get changeTheme => 'Ändra din stil';

  @override
  String get changeTheNameOfTheGroup => 'Ändra namn på gruppen';

  @override
  String get changeYourAvatar => 'Ändra din avatar';

  @override
  String get channelCorruptedDecryptError => 'Krypteringen har blivit korrupt';

  @override
  String get chat => 'Chatt';

  @override
  String get yourChatBackupHasBeenSetUp =>
      'Din chatt-backup har konfigurerats.';

  @override
  String get chatBackup => 'Chatt backup';

  @override
  String get chatBackupDescription =>
      'Din chatt backup är skyddad av en säkerhetsnyckel. Se till att du inte förlorar den.';

  @override
  String get chatDetails => 'Chatt-detaljer';

  @override
  String get chatHasBeenAddedToThisSpace =>
      'Chatt har lagts till i detta utrymme';

  @override
  String get chats => 'Chatter';

  @override
  String get chooseAStrongPassword => 'Välj ett starkt lösenord';

  @override
  String get clearArchive => 'Rensa arkiv';

  @override
  String get close => 'Stäng';

  @override
  String get commandHint_markasdm =>
      'Märk som rum för direktmeddelanden för det givante REChain ID';

  @override
  String get commandHint_markasgroup => 'Märk som grupp';

  @override
  String get commandHint_ban => 'Bannlys användaren från detta rum';

  @override
  String get commandHint_clearcache => 'Rensa cache';

  @override
  String get commandHint_create =>
      'Skapa en tom grupp-chatt\nAnvänd --no-encryption för att inaktivera kryptering';

  @override
  String get commandHint_discardsession => 'Kasta bort sessionen';

  @override
  String get commandHint_dm =>
      'Starta en direkt-chatt\nAnvänd --no-encryption för att inaktivera kryptering';

  @override
  String get commandHint_html => 'Skicka HTML-formatted text';

  @override
  String get commandHint_invite => 'Bjud in användaren till detta rum';

  @override
  String get commandHint_join => 'Gå med i rum';

  @override
  String get commandHint_kick => 'Ta bort användare från detta rum';

  @override
  String get commandHint_leave => 'Lämna detta rum';

  @override
  String get commandHint_me => 'Beskriv dig själv';

  @override
  String get commandHint_myroomavatar =>
      'Sätt din bild för detta rum (by mxc-uri)';

  @override
  String get commandHint_myroomnick => 'Sätt ditt användarnamn för rummet';

  @override
  String get commandHint_op => 'Sätt användarens kraft nivå ( standard: 50)';

  @override
  String get commandHint_plain => 'Skicka oformaterad text';

  @override
  String get commandHint_react => 'Skicka svar som reaktion';

  @override
  String get commandHint_send => 'Skicka text';

  @override
  String get commandHint_unban => 'Tillåt användare i rummet';

  @override
  String get commandInvalid => 'Felaktigt kommando';

  @override
  String commandMissing(String command) {
    return '$command är inte ett kommando.';
  }

  @override
  String get compareEmojiMatch => 'Vänligen jämför uttryckssymbolerna';

  @override
  String get compareNumbersMatch => 'Vänligen jämför siffrorna';

  @override
  String get configureChat => 'Konfigurera chatt';

  @override
  String get confirm => 'Bekräfta';

  @override
  String get connect => 'Anslut';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Kontakten har blivit inbjuden till gruppen';

  @override
  String get containsDisplayName => 'Innehåller visningsnamn';

  @override
  String get containsUserName => 'Innehåller användarnamn';

  @override
  String get contentHasBeenReported =>
      'Innehållet har rapporterats till server-admins';

  @override
  String get copiedToClipboard => 'Kopierat till urklipp';

  @override
  String get copy => 'Kopiera';

  @override
  String get copyToClipboard => 'Kopiera till urklipp';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Kunde ej avkoda meddelande: $error';
  }

  @override
  String get checkList => 'Check list';

  @override
  String countParticipants(int count) {
    return '$count deltagare';
  }

  @override
  String countInvited(int count) {
    return '$count invited';
  }

  @override
  String get create => 'Skapa';

  @override
  String createdTheChat(String username) {
    return '💬 $username skapade chatten';
  }

  @override
  String get createGroup => 'Skapa grupp';

  @override
  String get createNewSpace => 'Nytt utrymme';

  @override
  String get currentlyActive => 'För närvarande aktiv';

  @override
  String get darkTheme => 'Mörkt';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String dateWithoutYear(String month, String day) {
    return '$day-$month';
  }

  @override
  String dateWithYear(String year, String month, String day) {
    return '$year-$month-$day';
  }

  @override
  String get deactivateAccountWarning =>
      'Detta kommer att avaktivera ditt konto. Det här går inte att ångra! Är du säker?';

  @override
  String get defaultPermissionLevel => 'Standard behörighetsnivå';

  @override
  String get delete => 'Radera';

  @override
  String get deleteAccount => 'Ta bort konto';

  @override
  String get deleteMessage => 'Ta bort meddelande';

  @override
  String get device => 'Enhet';

  @override
  String get deviceId => 'Enhets-ID';

  @override
  String get devices => 'Enheter';

  @override
  String get directChats => 'Direkt chatt';

  @override
  String get allRooms => 'Alla gruppchattar';

  @override
  String get displaynameHasBeenChanged => 'Visningsnamn har ändrats';

  @override
  String get downloadFile => 'Ladda ner fil';

  @override
  String get edit => 'Ändra';

  @override
  String get editBlockedServers => 'redigera blockerade servrar';

  @override
  String get chatPermissions => 'Chatt-behörigheter';

  @override
  String get editDisplayname => 'Ändra visningsnamn';

  @override
  String get editRoomAliases => 'Redigera rum alias';

  @override
  String get editRoomAvatar => 'redigera rumsavatar';

  @override
  String get emoteExists => 'Dekalen existerar redan!';

  @override
  String get emoteInvalid => 'Ogiltig dekal-kod!';

  @override
  String get emoteKeyboardNoRecents =>
      'Nyligen använda emotes kommer dyka upp här…';

  @override
  String get emotePacks => 'Dekalpaket för rummet';

  @override
  String get emoteSettings => 'Emote inställningar';

  @override
  String get globalChatId => 'Global chat ID';

  @override
  String get accessAndVisibility => 'Access and visibility';

  @override
  String get accessAndVisibilityDescription =>
      'Who is allowed to join this chat and how the chat can be discovered.';

  @override
  String get calls => 'Calls';

  @override
  String get customEmojisAndStickers => 'Custom emojis and stickers';

  @override
  String get customEmojisAndStickersBody =>
      'Add or share custom emojis or stickers which can be used in any chat.';

  @override
  String get emoteShortcode => 'Dekal kod';

  @override
  String get emoteWarnNeedToPick => 'Du måste välja en dekal-kod och en bild!';

  @override
  String get emptyChat => 'Tom chatt';

  @override
  String get enableEmotesGlobally => 'Aktivera dekal-paket globalt';

  @override
  String get enableEncryption => 'Aktivera kryptering';

  @override
  String get enableEncryptionWarning =>
      'Du kommer inte ha fortsatt möjlighet till att inaktivera krypteringen. Är du säker?';

  @override
  String get encrypted => 'Krypterad';

  @override
  String get encryption => 'Kryptering';

  @override
  String get encryptionNotEnabled => 'Kryptering är ej aktiverad';

  @override
  String endedTheCall(String senderName) {
    return '$senderName avslutade samtalet';
  }

  @override
  String get enterAnEmailAddress => 'Ange en e-postaddress';

  @override
  String get homeserver => 'Hemserver';

  @override
  String get enterYourHomeserver => 'Ange din hemserver';

  @override
  String errorObtainingLocation(String error) {
    return 'Fel vid erhållande av plats: $error';
  }

  @override
  String get everythingReady => 'Allt är klart!';

  @override
  String get extremeOffensive => 'Extremt stötande';

  @override
  String get fileName => 'Filnamn';

  @override
  String get rechainonline => 'REChain';

  @override
  String get fontSize => 'Textstorlek';

  @override
  String get forward => 'Framåt';

  @override
  String get fromJoining => 'Från att gå med';

  @override
  String get fromTheInvitation => 'Från inbjudan';

  @override
  String get goToTheNewRoom => 'Gå till det nya rummet';

  @override
  String get group => 'Grupp';

  @override
  String get chatDescription => 'Chattbeskrivning';

  @override
  String get chatDescriptionHasBeenChanged => 'Chattbeskrivningen ändrades';

  @override
  String get groupIsPublic => 'Gruppen är publik';

  @override
  String get groups => 'Grupper';

  @override
  String groupWith(String displayname) {
    return 'Gruppen med $displayname';
  }

  @override
  String get guestsAreForbidden => 'Gäster är förbjudna';

  @override
  String get guestsCanJoin => 'Gäster kan ansluta';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username har tagit tillbaka inbjudan för $targetName';
  }

  @override
  String get help => 'Hjälp';

  @override
  String get hideRedactedEvents => 'Göm redigerade händelser';

  @override
  String get hideRedactedMessages => 'Hide redacted messages';

  @override
  String get hideRedactedMessagesBody =>
      'If someone redacts a message, this message won\'t be visible in the chat anymore.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Hide invalid or unknown message formats';

  @override
  String get howOffensiveIsThisContent => 'Hur stötande är detta innehåll?';

  @override
  String get id => 'ID';

  @override
  String get identity => 'Identitet';

  @override
  String get block => 'blockera';

  @override
  String get blockedUsers => 'Blockerade användare';

  @override
  String get blockListDescription =>
      'Du kan blockera användare som stör dig. Du kommer inte få några meddelanden eller rum-inbjudningar från användarna på din personliga blocklista.';

  @override
  String get blockUsername => 'Ignorera användarnamn';

  @override
  String get iHaveClickedOnLink => 'Jag har klickat på länken';

  @override
  String get incorrectPassphraseOrKey =>
      'Felaktig lösenordsfras eller åsterställningsnyckel';

  @override
  String get inoffensive => 'Oförargligt';

  @override
  String get inviteContact => 'Bjud in kontakt';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return 'Vill du bjuda in $contact till chatten ”$groupName”?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Bjud in kontakt till $groupName';
  }

  @override
  String get noChatDescriptionYet => 'Ingen chatt-beskrivning än.';

  @override
  String get tryAgain => 'Försök igen';

  @override
  String get invalidServerName => 'Ogiltigt servernamn';

  @override
  String get invited => 'Inbjuden';

  @override
  String get redactMessageDescription =>
      'Meddelandet kommer tas bort för alla medlemmar i denna konversation. Detta kan inte ångras.';

  @override
  String get optionalRedactReason =>
      '(Frivilligt) Anledning till att ta bort det här meddelandet…';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username bjöd in $targetName';
  }

  @override
  String get invitedUsersOnly => 'Endast inbjudna användare';

  @override
  String get inviteForMe => 'Inbjudning till mig';

  @override
  String inviteText(String username, String link) {
    return '$username bjöd in dig till REChain.\n1. Besök github.com/sorydima/REChain- och installera appen\n2. Registrera dig eller logga in\n3. Öppna inbjudningslänk:\n $link';
  }

  @override
  String get isTyping => 'skriver…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username anslöt till chatten';
  }

  @override
  String get joinRoom => 'Anslut till rum';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username sparkade ut $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username sparkade och bannade $targetName';
  }

  @override
  String get kickFromChat => 'Sparka från chatt';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Senast aktiv: $localizedTimeShort';
  }

  @override
  String get leave => 'Lämna';

  @override
  String get leftTheChat => 'Lämnade chatten';

  @override
  String get license => 'Licens';

  @override
  String get lightTheme => 'Ljust';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Ladda $count mer deltagare';
  }

  @override
  String get dehydrate => 'Exportera sessionen och rensa enheten';

  @override
  String get dehydrateWarning =>
      'Denna åtgärd kan inte ångras. Försäkra dig om att backupen är i säkert förvar.';

  @override
  String get dehydrateTor => 'TOR-användare: Exportera session';

  @override
  String get dehydrateTorLong =>
      'TOR-användare rekommenderas att exportera sessionen innan fönstret stängs.';

  @override
  String get hydrateTor =>
      'TOR-användare: Importera session från tidigare export';

  @override
  String get hydrateTorLong =>
      'Exporterade du sessionen när du senast använde TOR? Importera den enkelt och fortsätt chatta.';

  @override
  String get hydrate => 'Återställ från säkerhetskopia';

  @override
  String get loadingPleaseWait => 'Laddar... Var god vänta.';

  @override
  String get loadMore => 'Ladda mer…';

  @override
  String get locationDisabledNotice =>
      'Platstjänster är inaktiverade. Var god aktivera dom för att kunna dela din plats.';

  @override
  String get locationPermissionDeniedNotice =>
      'Plats åtkomst nekad. Var god godkän detta för att kunna dela din plats.';

  @override
  String get login => 'Logga in';

  @override
  String logInTo(String homeserver) {
    return 'Logga in till $homeserver';
  }

  @override
  String get logout => 'Logga ut';

  @override
  String get memberChanges => 'Medlemsändringar';

  @override
  String get mention => 'Nämn';

  @override
  String get messages => 'Meddelanden';

  @override
  String get messagesStyle => 'Meddelanden:';

  @override
  String get moderator => 'Moderator';

  @override
  String get muteChat => 'Tysta chatt';

  @override
  String get needPantalaimonWarning =>
      'Var medveten om att du behöver Pantalaimon för att använda ändpunktskryptering tillsvidare.';

  @override
  String get newChat => 'Ny chatt';

  @override
  String get newMessageInrechainonline => '💬 Nya meddelanden i REChain';

  @override
  String get newVerificationRequest => 'Ny verifikationsbegäran!';

  @override
  String get next => 'Nästa';

  @override
  String get no => 'Nej';

  @override
  String get noConnectionToTheServer => 'Ingen anslutning till servern';

  @override
  String get noEmotesFound => 'Hittade inga dekaler. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Du kan endast aktivera kryptering när rummet inte längre är publikt tillgängligt.';

  @override
  String get noGoogleServicesWarning =>
      'De ser ut som att du inte har google-tjänster på din telefon. Det är ett bra beslut för din integritet! För att få aviseringar i REChain rekommenderar vi att använda https://microg.org/ eller https://unifiedpush.org/ .';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 är inte en REChain server, använd $server2 istället?';
  }

  @override
  String get shareInviteLink => 'Dela inbjudningslänk';

  @override
  String get scanQrCode => 'Skanna QR-kod';

  @override
  String get none => 'Ingen';

  @override
  String get noPasswordRecoveryDescription =>
      'Du har inte lagt till något sätt för att återställa ditt lösenord än.';

  @override
  String get noPermission => 'Ingen behörighet';

  @override
  String get noRoomsFound => 'Hittade inga rum…';

  @override
  String get notifications => 'Aviseringar';

  @override
  String get notificationsEnabledForThisAccount =>
      'Aviseringar är påslaget för detta konto';

  @override
  String numUsersTyping(int count) {
    return '$count användare skriver…';
  }

  @override
  String get obtainingLocation => 'Erhåller plats…';

  @override
  String get offensive => 'Stötande';

  @override
  String get offline => 'Offline';

  @override
  String get ok => 'OK';

  @override
  String get online => 'Online';

  @override
  String get onlineKeyBackupEnabled => 'Online Nyckel-backup är aktiverad';

  @override
  String get oopsPushError => 'Oj! Tyvärr gick inte aviseringar att slå på.';

  @override
  String get oopsSomethingWentWrong => 'Hoppsan, något gick fel…';

  @override
  String get openAppToReadMessages => 'Öppna app för att lästa meddelanden';

  @override
  String get openCamera => 'Öppna kamera';

  @override
  String get openVideoCamera => 'Aktivera kamera för video';

  @override
  String get oneClientLoggedOut => 'En av dina klienter har loggats ut';

  @override
  String get addAccount => 'Lägg till konto';

  @override
  String get editBundlesForAccount => 'Lägg till paket för detta konto';

  @override
  String get addToBundle => 'Utöka paket';

  @override
  String get removeFromBundle => 'Ta bort från paket';

  @override
  String get bundleName => 'Paketnamn';

  @override
  String get enableMultiAccounts =>
      '(BETA) Aktivera multi-konton på denna enhet';

  @override
  String get openInMaps => 'Öppna i karta';

  @override
  String get link => 'Länk';

  @override
  String get serverRequiresEmail =>
      'Servern behöver validera din e-postadress för registrering.';

  @override
  String get or => 'Eller';

  @override
  String get participant => 'Deltagare';

  @override
  String get passphraseOrKey => 'lösenord eller återställningsnyckel';

  @override
  String get password => 'Lösenord';

  @override
  String get passwordForgotten => 'Glömt lösenord';

  @override
  String get passwordHasBeenChanged => 'Lösenordet har ändrats';

  @override
  String get hideMemberChangesInPublicChats =>
      'Hide member changes in public chats';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      'Do not show in the chat timeline if someone joins or leaves a public chat to improve readability.';

  @override
  String get overview => 'Overview';

  @override
  String get notifyMeFor => 'Notify me for';

  @override
  String get passwordRecoverySettings => 'Password recovery settings';

  @override
  String get passwordRecovery => 'Återställ lösenord';

  @override
  String get people => 'Människor';

  @override
  String get pickImage => 'Välj en bild';

  @override
  String get pin => 'Nåla fast';

  @override
  String play(String fileName) {
    return 'Spela $fileName';
  }

  @override
  String get pleaseChoose => 'Var god välj';

  @override
  String get pleaseChooseAPasscode => 'Ange ett lösenord';

  @override
  String get pleaseClickOnLink =>
      'Klicka på länken i e-postmeddelandet för att sedan fortsätta.';

  @override
  String get pleaseEnter4Digits =>
      'Ange 4 siffror eller lämna tom för att inaktivera app-lås.';

  @override
  String get pleaseEnterRecoveryKey => 'Ange din återställningsnyckel:';

  @override
  String get pleaseEnterYourPassword => 'Ange ditt lösenord';

  @override
  String get pleaseEnterYourPin => 'Ange din pin-kod';

  @override
  String get pleaseEnterYourUsername => 'Ange ditt användarnamn';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Följ instruktionerna på hemsidan och tryck på nästa.';

  @override
  String get privacy => 'Integritet';

  @override
  String get publicRooms => 'Publika Rum';

  @override
  String get pushRules => 'Regler';

  @override
  String get reason => 'Anledning';

  @override
  String get recording => 'Spelar in';

  @override
  String redactedBy(String username) {
    return 'Borttaget av $username';
  }

  @override
  String get directChat => 'Direktchatt';

  @override
  String redactedByBecause(String username, String reason) {
    return 'Borttaget av $username på grund av: ”$reason”';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username redigerade en händelse';
  }

  @override
  String get redactMessage => 'Redigera meddelande';

  @override
  String get register => 'Registrera';

  @override
  String get reject => 'Avböj';

  @override
  String rejectedTheInvitation(String username) {
    return '$username avböjde inbjudan';
  }

  @override
  String get rejoin => 'Återanslut';

  @override
  String get removeAllOtherDevices => 'Ta bort alla andra enheter';

  @override
  String removedBy(String username) {
    return 'Bortagen av $username';
  }

  @override
  String get removeDevice => 'Ta bort enhet';

  @override
  String get unbanFromChat => 'Ta bort chatt-blockering';

  @override
  String get removeYourAvatar => 'Ta bort din avatar';

  @override
  String get replaceRoomWithNewerVersion => 'Ersätt rum med nyare version';

  @override
  String get reply => 'Svara';

  @override
  String get reportMessage => 'Rapportera meddelande';

  @override
  String get requestPermission => 'Begär behörighet';

  @override
  String get roomHasBeenUpgraded => 'Rummet har blivit uppgraderat';

  @override
  String get roomVersion => 'Rum version';

  @override
  String get saveFile => 'Spara fil';

  @override
  String get search => 'Sök';

  @override
  String get security => 'Säkerhet';

  @override
  String get recoveryKey => 'Återställningsnyckel';

  @override
  String get recoveryKeyLost => 'Borttappad återställningsnyckel?';

  @override
  String seenByUser(String username) {
    return 'Sedd av $username';
  }

  @override
  String get send => 'Skicka';

  @override
  String get sendAMessage => 'Skicka ett meddelande';

  @override
  String get sendAsText => 'Skicka som text';

  @override
  String get sendAudio => 'Skicka ljud';

  @override
  String get sendFile => 'Skicka fil';

  @override
  String get sendImage => 'Skicka bild';

  @override
  String sendImages(int count) {
    return 'Send $count image';
  }

  @override
  String get sendMessages => 'Skickade meddelanden';

  @override
  String get sendOriginal => 'Skicka orginal';

  @override
  String get sendSticker => 'Skicka klistermärke';

  @override
  String get sendVideo => 'Skicka video';

  @override
  String sentAFile(String username) {
    return '📁 $username skickade en fil';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username skickade ett ljudklipp';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username skickade en bild';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username skickade ett klistermärke';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username skickade en video';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName skickade samtalsinformation';
  }

  @override
  String get separateChatTypes => 'Separata direktchattar och grupper';

  @override
  String get setAsCanonicalAlias => 'Sätt som primärt alias';

  @override
  String get setCustomEmotes => 'Ställ in anpassade dekaler';

  @override
  String get setChatDescription => 'Ändra chattens beskrivning';

  @override
  String get setInvitationLink => 'Ställ in inbjudningslänk';

  @override
  String get setPermissionsLevel => 'Ställ in behörighetsnivå';

  @override
  String get setStatus => 'Ställ in status';

  @override
  String get settings => 'Inställningar';

  @override
  String get share => 'Dela';

  @override
  String sharedTheLocation(String username) {
    return '$username delade sin position';
  }

  @override
  String get shareLocation => 'Dela plats';

  @override
  String get showPassword => 'Visa lösenord';

  @override
  String get presenceStyle => 'Närvaro:';

  @override
  String get presencesToggle => 'Visa statusmeddelanden från andra användare';

  @override
  String get singlesignon => 'Single Sign On';

  @override
  String get skip => 'Hoppa över';

  @override
  String get sourceCode => 'Källkod';

  @override
  String get spaceIsPublic => 'Utrymme är publikt';

  @override
  String get spaceName => 'Utrymmes namn';

  @override
  String startedACall(String senderName) {
    return '$senderName startade ett samtal';
  }

  @override
  String get startFirstChat => 'Starta din första chatt';

  @override
  String get status => 'Status';

  @override
  String get statusExampleMessage => 'Hur mår du i dag?';

  @override
  String get submit => 'Skicka in';

  @override
  String get synchronizingPleaseWait => 'Synkroniserar… Var god vänta.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Synchronizing… ($percentage%)';
  }

  @override
  String get systemTheme => 'System';

  @override
  String get theyDontMatch => 'Dom Matchar Inte';

  @override
  String get theyMatch => 'Dom Matchar';

  @override
  String get title => 'REChain';

  @override
  String get toggleFavorite => 'Växla favorit';

  @override
  String get toggleMuted => 'Växla tystad';

  @override
  String get toggleUnread => 'Markera läst/oläst';

  @override
  String get tooManyRequestsWarning =>
      'För många förfrågningar. Vänligen försök senare!';

  @override
  String get transferFromAnotherDevice => 'Överför till annan enhet';

  @override
  String get tryToSendAgain => 'Försök att skicka igen';

  @override
  String get unavailable => 'Upptagen';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username avbannade $targetName';
  }

  @override
  String get unblockDevice => 'Avblockera enhet';

  @override
  String get unknownDevice => 'Okänd enhet';

  @override
  String get unknownEncryptionAlgorithm => 'Okänd krypteringsalgoritm';

  @override
  String unknownEvent(String type) {
    return 'Okänd händelse \'$type\'';
  }

  @override
  String get unmuteChat => 'Slå på ljudet för chatten';

  @override
  String get unpin => 'Avnåla';

  @override
  String unreadChats(int unreadCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount olästa chattar',
      one: 'en oläst chatt',
    );
    return '$_temp0';
  }

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username och $count andra skriver…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username och $username2 skriver…';
  }

  @override
  String userIsTyping(String username) {
    return '$username skriver…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username lämnade chatten';
  }

  @override
  String get username => 'Användarnamn';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username skickade en $type händelse';
  }

  @override
  String get unverified => 'Ej verifierad';

  @override
  String get verified => 'Verifierad';

  @override
  String get verify => 'Verifiera';

  @override
  String get verifyStart => 'Starta verifiering';

  @override
  String get verifySuccess => 'Du har lyckats verifiera!';

  @override
  String get verifyTitle => 'Verifiera andra konton';

  @override
  String get videoCall => 'Videosamtal';

  @override
  String get visibilityOfTheChatHistory => 'Chatt-historikens synlighet';

  @override
  String get visibleForAllParticipants => 'Synlig för alla deltagare';

  @override
  String get visibleForEveryone => 'Synlig för alla';

  @override
  String get voiceMessage => 'Röstmeddelande';

  @override
  String get waitingPartnerAcceptRequest =>
      'Väntar på att deltagaren accepterar begäran…';

  @override
  String get waitingPartnerEmoji =>
      'Väntar på att deltagaren accepterar emojien…';

  @override
  String get waitingPartnerNumbers =>
      'Väntar på att deltagaren accepterar nummer…';

  @override
  String get wallpaper => 'Bakgrund:';

  @override
  String get warning => 'Varning!';

  @override
  String get weSentYouAnEmail => 'Vi skickade dig ett e-postmeddelande';

  @override
  String get whoCanPerformWhichAction => 'Vem kan utföra vilken åtgärd';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'Vilka som är tilllåtna att ansluta till denna grupp';

  @override
  String get whyDoYouWantToReportThis => 'Varför vill du rapportera detta?';

  @override
  String get wipeChatBackup =>
      'Radera din chatt-backup för att skapa en ny återställningsnyckel?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Med dessa addresser kan du återställa ditt lösenord.';

  @override
  String get writeAMessage => 'Skriv ett meddelande…';

  @override
  String get yes => 'Ja';

  @override
  String get you => 'Du';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Du deltar inte längre i denna chatt';

  @override
  String get youHaveBeenBannedFromThisChat =>
      'Du har blivit bannad från denna chatt';

  @override
  String get yourPublicKey => 'Din publika nyckel';

  @override
  String get messageInfo => 'Meddelandeinformation';

  @override
  String get time => 'Tid';

  @override
  String get messageType => 'Meddelandetyp';

  @override
  String get sender => 'Avsändare';

  @override
  String get openGallery => 'Öppna galleri';

  @override
  String get removeFromSpace => 'Ta bort från utrymme';

  @override
  String get addToSpaceDescription =>
      'Välj ett utrymme som chatten skall läggas till i.';

  @override
  String get start => 'Starta';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'Ange din återställningsnyckel från en tidigare session för att låsa upp äldre meddelanden. Din återställningsnyckel är INTE ditt lösenord.';

  @override
  String get publish => 'Publicera';

  @override
  String videoWithSize(String size) {
    return 'Video ($size)';
  }

  @override
  String get openChat => 'Öppna Chatt';

  @override
  String get markAsRead => 'Markera som läst';

  @override
  String get reportUser => 'Rapportera användare';

  @override
  String get dismiss => 'Avfärda';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender reagerade med $reaction';
  }

  @override
  String get pinMessage => 'Fäst i rum';

  @override
  String get confirmEventUnpin =>
      'Är du säker på att händelsen inte längre skall vara fastnålad?';

  @override
  String get emojis => 'Uttryckssymboler';

  @override
  String get placeCall => 'Ring';

  @override
  String get voiceCall => 'Röstsamtal';

  @override
  String get unsupportedAndroidVersion =>
      'Inget stöd för denna version av Android';

  @override
  String get unsupportedAndroidVersionLong =>
      'Denna funktion kräver en senare version av Android.';

  @override
  String get videoCallsBetaWarning =>
      'Videosamtal är för närvarande under testning. De kanske inte fungerar som det är tänkt eller på alla plattformar.';

  @override
  String get experimentalVideoCalls => 'Experimentella videosamtal';

  @override
  String get emailOrUsername => 'Användarnamn eller e-postadress';

  @override
  String get indexedDbErrorTitle => 'Problem med privat läge';

  @override
  String get indexedDbErrorLong =>
      'Meddelandelagring är tyvärr inte aktiverat i privat läge som standard.\nGå till\n - about:config\n - sätt dom.indexedDB.privateBrowsing.enabled till true\nAnnars går det inte att använda REChain.';

  @override
  String switchToAccount(String number) {
    return 'Byt till konto $number';
  }

  @override
  String get nextAccount => 'Nästa konto';

  @override
  String get previousAccount => 'Föregående konto';

  @override
  String get addWidget => 'Lägg till widget';

  @override
  String get widgetVideo => 'Video';

  @override
  String get widgetEtherpad => 'Anteckning';

  @override
  String get widgetJitsi => 'Jitsi-möte';

  @override
  String get widgetCustom => 'Anpassad';

  @override
  String get widgetName => 'Namn';

  @override
  String get widgetUrlError => 'Detta är inte en giltig URL.';

  @override
  String get widgetNameError => 'Vänligen ange ett visningsnamn.';

  @override
  String get errorAddingWidget =>
      'Ett fel uppstod när widgeten skulle läggas till.';

  @override
  String get youRejectedTheInvitation => 'Du avvisade inbjudan';

  @override
  String get youJoinedTheChat => 'Du gick med i chatten';

  @override
  String get youAcceptedTheInvitation => '👍 Du accepterade inbjudan';

  @override
  String youBannedUser(String user) {
    return 'Du förbjöd $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Du har återkallat inbjudan till $user';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 Du har blivit inbjuden via länk till:\n$alias';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 Du har blivit inbjuden av $user';
  }

  @override
  String invitedBy(String user) {
    return '📩 Invited by $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Du bjöd in $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Du sparkade ut $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Du sparkade ut och förbjöd $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Du återkallade förbudet för $user';
  }

  @override
  String hasKnocked(String user) {
    return '$user har knackat';
  }

  @override
  String get usersMustKnock => 'Users must knock';

  @override
  String get noOneCanJoin => 'No one can join';

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user would like to join the chat.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'No public link has been created yet';

  @override
  String get knock => 'Knock';

  @override
  String get users => 'Användare';

  @override
  String get unlockOldMessages => 'Lås upp äldre meddelanden';

  @override
  String get storeInSecureStorageDescription =>
      'Lagra återställningsnyckeln på säker plats på denna enhet.';

  @override
  String get saveKeyManuallyDescription =>
      'Spara nyckeln manuellt genom att aktivera dela-funktionen eller urklippshanteraren på enheten.';

  @override
  String get storeInAndroidKeystore =>
      'Lagra i Androids nyckellagring (KeyStore)';

  @override
  String get storeInAppleKeyChain => 'Lagra i Apples nyckelkedja (KeyChain)';

  @override
  String get storeSecurlyOnThisDevice => 'Lagra säkert på denna enhet';

  @override
  String countFiles(int count) {
    return '$count filer';
  }

  @override
  String get user => 'Användare';

  @override
  String get custom => 'Anpassad';

  @override
  String get foregroundServiceRunning =>
      'Denna avisering visas när förgrundstjänsten körs.';

  @override
  String get screenSharingTitle => 'skärmdelning';

  @override
  String get screenSharingDetail => 'Du delar din skärm i REChain';

  @override
  String get callingPermissions => 'Samtalsbehörighet';

  @override
  String get callingAccount => 'Samtalskonto';

  @override
  String get callingAccountDetails =>
      'Tillåt REChain att använda Androids ring-app.';

  @override
  String get appearOnTop => 'Visa ovanpå';

  @override
  String get appearOnTopDetails =>
      'Tillåt att appen visas ovanpå (behövs inte om du redan har REChain konfigurerat som ett samtalskonto)';

  @override
  String get otherCallingPermissions =>
      'Mikrofon, kamera och andra behörigheter för REChain';

  @override
  String get whyIsThisMessageEncrypted =>
      'Varför kan inte detta meddelande läsas?';

  @override
  String get noKeyForThisMessage =>
      'Detta kan hända om meddelandet skickades innan du loggade in på ditt konto i den här enheten.\n\nDet kan också vara så att avsändaren har blockerat din enhet eller att något gick fel med internetanslutningen.\n\nKan du läsa meddelandet i en annan session? I sådana fall kan du överföra meddelandet från den sessionen! Gå till Inställningar > Enhet och säkerställ att dina enheter har verifierat varandra. När du öppnar rummet nästa gång och båda sessionerna är i förgrunden, så kommer nycklarna att överföras automatiskt.\n\nVill du inte förlora nycklarna vid utloggning eller när du byter enhet? Säkerställ att du har aktiverat säkerhetskopiering för chatten i inställningarna.';

  @override
  String get newGroup => 'Ny grupp';

  @override
  String get newSpace => 'Nytt utrymme';

  @override
  String get enterSpace => 'Gå till utrymme';

  @override
  String get enterRoom => 'Gå till rummet';

  @override
  String get allSpaces => 'Alla utrymmen';

  @override
  String numChats(String number) {
    return '$number chattar';
  }

  @override
  String get hideUnimportantStateEvents => 'Göm oviktiga tillståndshändelser';

  @override
  String get hidePresences => 'Dölj statuslista?';

  @override
  String get doNotShowAgain => 'Visa inte igen';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Tom chatt (var $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Utrymmen möjliggör konsolidering av chattar och att bygga privata eller offentliga gemenskaper.';

  @override
  String get encryptThisChat => 'Kryptera denna chatt';

  @override
  String get disableEncryptionWarning =>
      'Av säkerhetsskäl kan du inte stänga av kryptering i en chatt där det tidigare aktiverats.';

  @override
  String get sorryThatsNotPossible => 'Det där är inte möjligt';

  @override
  String get deviceKeys => 'Enhetsnycklar:';

  @override
  String get reopenChat => 'Återöppna chatt';

  @override
  String get noBackupWarning =>
      'Varning! Om du inte aktiverar säkerhetskopiering av chattar så tappar du åtkomst till krypterade meddelanden. Det är rekommenderat att du aktiverar säkerhetskopiering innan du loggar ut.';

  @override
  String get noOtherDevicesFound => 'Inga andra enheter hittades';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Servern informerar om att filen är för stor för att skickas.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Filen har sparats i $path';
  }

  @override
  String get jumpToLastReadMessage => 'Hoppa till det senast lästa meddelandet';

  @override
  String get readUpToHere => 'Läs upp till hit';

  @override
  String get jump => 'Hoppa';

  @override
  String get openLinkInBrowser => 'Öppna länk i webbläsare';

  @override
  String get reportErrorDescription =>
      '😭 Åh nej. Något gick fel. Om du vill ian du rapportera denna bugg till utvecklarna.';

  @override
  String get report => 'rapportera';

  @override
  String get signInWithPassword => 'Logga in med lösenord';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Vänligen försök igen eller välj en annan server.';

  @override
  String signInWith(String provider) {
    return 'Logga in med $provider';
  }

  @override
  String get profileNotFound =>
      'Användaren kunde onte hittas på servern. Kanske är det ett anslutningsproblem eller så finns inte användaren.';

  @override
  String get setTheme => 'Välj tema:';

  @override
  String get setColorTheme => 'Välj färgtema:';

  @override
  String get invite => 'Bjud in';

  @override
  String get inviteGroupChat => '📨 Bjud in gruppchatt';

  @override
  String get invitePrivateChat => '📨 Bjud in privat chatt';

  @override
  String get invalidInput => 'Ogiltig input!';

  @override
  String wrongPinEntered(int seconds) {
    return 'Fel pin-kod inslagen! Försök igen om $seconds sekunder…';
  }

  @override
  String get pleaseEnterANumber => 'Vänligen ange ett nummer större än 0';

  @override
  String get archiveRoomDescription =>
      'Den här chatten kommer flyttas till arkivet. Andra användare kommer kunna se att du har lämnat chatten.';

  @override
  String get roomUpgradeDescription =>
      'Chatten kommer då att återskapas med den nya rumversionen. Alla medlemmar kommer bli påminda om att de måste byta till den nya chatten. Du kan läsa mer om rumversioner på https://github.com/sorydima/REChain-.git';

  @override
  String get removeDevicesDescription =>
      'Du kommer att bli utloggad från den här enheten och kommer inte längre kunna få meddelanden.';

  @override
  String get banUserDescription =>
      'Användaren kommer bannlysas från chatten och kommer inte kunna gå med i chatten igen tills bannlysningen avslutas.';

  @override
  String get unbanUserDescription =>
      'Användaren kommer kunna gå med i chatten igen om den försöker.';

  @override
  String get kickUserDescription =>
      'Användaren sparkas ut ur chatten men bannlyses inte. I offentliga chattar kan användaren gå med igen när som helst.';

  @override
  String get makeAdminDescription =>
      'När du gör denna användare till administratör kommer du inte kunna ångra det eftersom de kommer ha samma behörigheter som du.';

  @override
  String get pushNotificationsNotAvailable =>
      'Aviseringar är inte tillgängligt';

  @override
  String get learnMore => 'Lär dig mer';

  @override
  String get yourGlobalUserIdIs => 'Ditt globala användar-ID är: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Tyvärr kunde ingen användare hittas med ”$query”. Vänligen kontrollera om du gjort ett stavfel.';
  }

  @override
  String get knocking => 'Knocking';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Chat can be discovered via the search on $server';
  }

  @override
  String get searchChatsRooms => 'Sök efter #chattar, @användare…';

  @override
  String get nothingFound => 'Inget hittades…';

  @override
  String get groupName => 'Gruppnamn';

  @override
  String get createGroupAndInviteUsers =>
      'Skapa en grupp och bjud in användare';

  @override
  String get groupCanBeFoundViaSearch => 'Gruppen kan hittas genom sökning';

  @override
  String get wrongRecoveryKey =>
      'Tyvärr verkar detta inte vara den korrekta återställningsnyckeln.';

  @override
  String get startConversation => 'Starta konversation';

  @override
  String get commandHint_sendraw => 'Skicka rå json';

  @override
  String get databaseMigrationTitle => 'Databasen är optimerad';

  @override
  String get databaseMigrationBody =>
      'Var vänlig vänta. Detta kan ta en stund.';

  @override
  String get leaveEmptyToClearStatus => 'Lämna tom för att ta bort din status.';

  @override
  String get select => 'Ange val';

  @override
  String get searchForUsers => 'Sök efter @användare…';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Vänligen skriv ditt nuvarande lösenord';

  @override
  String get newPassword => 'Nytt lösenord';

  @override
  String get pleaseChooseAStrongPassword => 'Vänligen välj ett starkt lösenord';

  @override
  String get passwordsDoNotMatch => 'Lösenorden passar inte';

  @override
  String get passwordIsWrong => 'Det angivna lösenordet är fel';

  @override
  String get publicLink => 'Offentlig länk';

  @override
  String get publicChatAddresses => 'Public chat addresses';

  @override
  String get createNewAddress => 'Create new address';

  @override
  String get joinSpace => 'Gå med i utrymme';

  @override
  String get publicSpaces => 'Offentliga utrymmen';

  @override
  String get addChatOrSubSpace => 'Lägg till chatt eller underutrymme';

  @override
  String get subspace => 'Underutrymme';

  @override
  String get decline => 'Neka';

  @override
  String get thisDevice => 'Denna enhet:';

  @override
  String get initAppError => 'Ett problem skedde när appen initierades';

  @override
  String get userRole => 'User role';

  @override
  String minimumPowerLevel(String level) {
    return '$level is the minimum power level.';
  }

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
  String databaseBuildErrorBody(String url, String error) {
    return 'Kan inte bygga SQlite-databasen. Appen försöker använda den gamla databasen för nu. Vänligen rapportera problemet till utvecklarna här: $url. Felmeddelandet är: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'Din session är förlorad. Vänligen rapportera detta fel till utvecklarna här: $url. Felmeddelandet är: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Appen försöker nu få tillbaks din session från backupen. Vänligen rapportera detta problem till utvecklarna här: $url. Felmeddelandet är: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'Vidarebefordra meddelandet till $roomName?';
  }

  @override
  String get sendReadReceipts => 'Skicka läskvitton';

  @override
  String get sendTypingNotificationsDescription =>
      'Andra deltagare i en diskussion kan se när du skriver.';

  @override
  String get sendReadReceiptsDescription =>
      'Andra deltagare i en diskussion kan se när du läst ett meddelande.';

  @override
  String get formattedMessages => 'Formaterade meddelanden';

  @override
  String get formattedMessagesDescription =>
      'Visa formaterat meddelandeinnehåll som fet stil med markdown.';

  @override
  String get verifyOtherUser => '🔐 Verifiera användaren';

  @override
  String get verifyOtherUserDescription =>
      'Om du verifierar en användare så kan du vara säker på vem du verkligen skriver till. 💪\n\nNär du påbörjar en verifiering så ser du och den andra användaren en popup-ruta i appen. I den rutan ser du ett antal tecken som du jämför med vad den andra användaren ser.\n\nDet bästa sättet att göra detta är att träffas fysiskt, eller genom att starta ett videosamtal. 👭';

  @override
  String get verifyOtherDevice => '🔐 Verifiera enhet';

  @override
  String get verifyOtherDeviceDescription =>
      'När du verifierar en enhet så kan era enheter utväxla nycklar, vilket förbättrar säkerheten. 💪 När du påbörjar en verifiering så ser du en popup-ruta på båda enheterna. I den rutan ser du ett antal tecken som du jämför med det som visas på den andra enheten. Det är bäst att ha båda enheterna till hands innan du påbörjar verifieringen. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender accepterade nyckelverifieringen';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender avbröt nyckelverifieringen';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender fullbordade nyckelverifieringen';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender är redo för nyckelverifiering';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender begärde nyckelverifiering';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender påbörjade nyckelverifiering';
  }

  @override
  String get transparent => 'Transparent';

  @override
  String get incomingMessages => 'Inkommande meddelanden';

  @override
  String get stickers => 'Klistermärken';

  @override
  String get discover => 'Upptäck';

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
  String get restricted => 'Restricted';

  @override
  String get knockRestricted => 'Knock restricted';

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
  String get sendCanceled => 'Sending canceled';

  @override
  String get loginWithMatrixId => 'Login with REChain-ID';

  @override
  String get discoverHomeservers => 'Discover homeservers';

  @override
  String get whatIsAHomeserver => 'What is a homeserver?';

  @override
  String get homeserverDescription =>
      'All your data is stored on the homeserver, just like an email provider. You can choose which homeserver you want to use, while you can still communicate with everyone. Learn more at at https://github.com/sorydima/REChain-.git';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Doesn\'t seem to be a compatible homeserver. Wrong URL?';

  @override
  String get calculatingFileSize => 'Calculating file size...';

  @override
  String get prepareSendingAttachment => 'Prepare sending attachment...';

  @override
  String get sendingAttachment => 'Sending attachment...';

  @override
  String get generatingVideoThumbnail => 'Generating video thumbnail...';

  @override
  String get compressVideo => 'Compressing video...';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return 'Sending attachment $index of $length...';
  }

  @override
  String serverLimitReached(int seconds) {
    return 'Server limit reached! Waiting $seconds seconds...';
  }

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'One of your devices is not verified';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Note: When you connect all your devices to the chat backup, they are automatically verified.';

  @override
  String get continueText => 'Continue';

  @override
  String get welcomeText =>
      'Hey Hey 👋 This is REChain. You can sign in to any homeserver, which is compatible with https://github.com/sorydima/REChain-.git. And then chat with anyone. It\'s a huge decentralized messaging network!';

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
  String get appIntroduction =>
      'REChain lets you chat with your friends across different messengers. Learn more at https://github.com/sorydima/REChain-.git or just tap *Continue*.';

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
  String get newSubSpace => 'New sub space';

  @override
  String get moveToDifferentSpace => 'Move to different space';

  @override
  String get moveUp => 'Move up';

  @override
  String get moveDown => 'Move down';

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
  String get donate => 'Donate';

  @override
  String startedAPoll(String username) {
    return '$username started a poll.';
  }

  @override
  String get poll => 'Poll';

  @override
  String get startPoll => 'Start poll';

  @override
  String get endPoll => 'End poll';

  @override
  String get answersVisible => 'Answers visible';

  @override
  String get answersHidden => 'Answers hidden';

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
  String get loadingMessages => 'Loading messages';

  @override
  String get setupChatBackup => 'Set up chat backup';

  @override
  String get noMoreResultsFound => 'No more results found';

  @override
  String chatSearchedUntil(String time) {
    return 'Chat searched until $time';
  }
}
