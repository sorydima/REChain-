// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class L10nNl extends L10n {
  L10nNl([String locale = 'nl']) : super(locale);

  @override
  String get alwaysUse24HourFormat => 'true';

  @override
  String get repeatPassword => 'Wachtwoord herhalen';

  @override
  String get notAnImage => 'Geen afbeeldingsbestand.';

  @override
  String get setCustomPermissionLevel => 'Aangepast rechten-niveau instellen';

  @override
  String get setPermissionsLevelDescription =>
      'Kies hieronder een standaard rol of voer een aangepast rechten-niveau in tussen 0 en 100.';

  @override
  String get ignoreUser => 'Persoon negeren';

  @override
  String get normalUser => 'Normaal persoon';

  @override
  String get remove => 'Verwijder';

  @override
  String get importNow => 'Nu importeren';

  @override
  String get importEmojis => 'Emoji\'s importeren';

  @override
  String get importFromZipFile => 'Uit zip-bestand importeren';

  @override
  String get exportEmotePack => 'Emote-pakket als zip exporteren';

  @override
  String get replace => 'Vervang';

  @override
  String get about => 'Over ons';

  @override
  String aboutHomeserver(String homeserver) {
    return 'Over $homeserver';
  }

  @override
  String get accept => 'Accepteren';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username heeft de uitnodiging geaccepteerd';
  }

  @override
  String get account => 'Account';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username heeft eind-tot-eindversleuteling geactiveerd';
  }

  @override
  String get addEmail => 'Email toevoegen';

  @override
  String get confirmREChainId =>
      'Bevestig jouw REChain ID om je account te verwijderen.';

  @override
  String supposedMxid(String mxid) {
    return 'Dit moet $mxid zijn';
  }

  @override
  String get addChatDescription => 'Voeg een chatomschrijving toe...';

  @override
  String get addToSpace => 'Aan space toevoegen';

  @override
  String get admin => 'Beheerder';

  @override
  String get alias => 'alias';

  @override
  String get all => 'Alle';

  @override
  String get allChats => 'Alle chats';

  @override
  String get commandHint_roomupgrade =>
      'Upgradeer deze kamer naar de aangegeven kamerversie';

  @override
  String get commandHint_googly => 'Wiebel-ogen versturen';

  @override
  String get commandHint_cuddle => 'Een knuffel versturen';

  @override
  String get commandHint_hug => 'Een knuffel versturen';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName stuurt je wiebelogen';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName knuffelt je';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName omhelst je';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName heeft de oproep beantwoord';
  }

  @override
  String get anyoneCanJoin => 'Iedereen kan toetreden';

  @override
  String get appLock => 'App-vergrendeling';

  @override
  String get appLockDescription =>
      'Vergendel de app wanneer het niet gebruikt wordt met een pincode';

  @override
  String get archive => 'Archief';

  @override
  String get areGuestsAllowedToJoin => 'Mogen gasten deelnemen';

  @override
  String get areYouSure => 'Weet je het zeker?';

  @override
  String get areYouSureYouWantToLogout =>
      'Weet je zeker dat je wilt uitloggen?';

  @override
  String get askSSSSSign =>
      'Voer je beveiligde opslag wachtwoordzin of herstelsleutel in om de andere persoon te kunnen ondertekenen.';

  @override
  String askVerificationRequest(String username) {
    return 'Accepteer je dit verificatieverzoek van $username?';
  }

  @override
  String get autoplayImages =>
      'Automatisch geanimeerde stickers en emoticons afspelen';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'De homeserver ondersteunt de login types:\n$serverVersions\nMaar deze app ondersteunt alleen:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Typemeldingen verzenden';

  @override
  String get swipeRightToLeftToReply =>
      'Veeg van rechts naar links om te reageren';

  @override
  String get sendOnEnter => 'Verstuur met enter';

  @override
  String badServerVersionsException(
      String serverVersions,
      String supportedVersions,
      Object serverVerions,
      Object supoortedVersions,
      Object suportedVersions) {
    return 'De homeserver ondersteunt de Spec-versies:\n$serverVersions\nMaar deze app ondersteunt alleen $supportedVersions';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats chats en $participants deelnemers';
  }

  @override
  String get noMoreChatsFound => 'Geen chats gevonden...';

  @override
  String get noChatsFoundHere =>
      'Hier zijn nog geen chats. Begin een nieuwe chat met iemand door op de onderstaande knop te klikken. ⤵️';

  @override
  String get joinedChats => 'Chats waaraan je deelneemt';

  @override
  String get unread => 'Ongelezen';

  @override
  String get space => 'Space';

  @override
  String get spaces => 'Spaces';

  @override
  String get banFromChat => 'Van chat verbannen';

  @override
  String get banned => 'Verbannen';

  @override
  String bannedUser(String username, String targetName) {
    return '$username verbant $targetName';
  }

  @override
  String get blockDevice => 'Apparaat blokkeren';

  @override
  String get blocked => 'Geblokkeerd';

  @override
  String get botMessages => 'Bot-berichten';

  @override
  String get cancel => 'Annuleren';

  @override
  String cantOpenUri(String uri) {
    return 'Kan de URI $uri niet openen';
  }

  @override
  String get changeDeviceName => 'Apparaatnaam wijzigen';

  @override
  String changedTheChatAvatar(String username) {
    return '$username heeft de chatavatar gewijzigd';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username heeft de chatomschrijving gewijzigd in: \'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username heeft de chatnaam gewijzigd in: \'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username heeft de chatrechten gewijzigd';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username\'s naam is nu \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username heeft de toegangsregels voor gasten gewijzigd';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username heeft de gastenregels gewijzigd in: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username heeft de zichtbaarheid van de geschiedenis gewijzigd';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username heeft de zichtbaarheid van de geschiedenis gewijzigd in: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username heeft de toetredingsregels gewijzigd';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username heeft de toetredingsregels gewijzigd in: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username\'s avatar is gewijzigd';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username heeft de kameraliassen gewijzigd';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username heeft de uitnodigingslink gewijzigd';
  }

  @override
  String get changePassword => 'Wachtwoord wijzigen';

  @override
  String get changeTheHomeserver => 'Homeserver wijzigen';

  @override
  String get changeTheme => 'Je stijl veranderen';

  @override
  String get changeTheNameOfTheGroup => 'Groepsnaam wijzigen';

  @override
  String get changeYourAvatar => 'Jouw avatar veranderen';

  @override
  String get channelCorruptedDecryptError => 'De versleuteling is beschadigd';

  @override
  String get chat => 'Chat';

  @override
  String get yourChatBackupHasBeenSetUp => 'Jouw chatback-up is ingesteld.';

  @override
  String get chatBackup => 'Chatback-up';

  @override
  String get chatBackupDescription =>
      'Je oude berichten zijn beveiligd met een herstelsleutel. Zorg ervoor dat je deze niet verliest.';

  @override
  String get chatDetails => 'Chatdetails';

  @override
  String get chatHasBeenAddedToThisSpace => 'Chat is toegevoegd aan deze space';

  @override
  String get chats => 'Chats';

  @override
  String get chooseAStrongPassword => 'Kies een sterk wachtwoord';

  @override
  String get clearArchive => 'Archief wissen';

  @override
  String get close => 'Sluiten';

  @override
  String get commandHint_markasdm =>
      'Markeer als privéberichtenkamer voor REChain ID';

  @override
  String get commandHint_markasgroup => 'Markeer als groep';

  @override
  String get commandHint_ban => 'Persoon uit deze kamer verbannen';

  @override
  String get commandHint_clearcache => 'Cache wissen';

  @override
  String get commandHint_create =>
      'Maak een lege groepschat\nGebruik --no-encryption om de versleuteling uit te schakelen';

  @override
  String get commandHint_discardsession => 'Sessie weggooien';

  @override
  String get commandHint_dm =>
      'Start een directe chat\nGebruik --no-encryption om de versleuteling uit te schakelen';

  @override
  String get commandHint_html => 'Tekst met HTML-opmaak versturen';

  @override
  String get commandHint_invite => 'Persoon in deze kamer uitnodigen';

  @override
  String get commandHint_join => 'Toetreden tot de vermelde kamer';

  @override
  String get commandHint_kick => 'Persoon uit deze kamer verwijderen';

  @override
  String get commandHint_leave => 'Deze kamer verlaten';

  @override
  String get commandHint_me => 'Beschrijf jezelf';

  @override
  String get commandHint_myroomavatar =>
      'Jouw avatar voor deze kamer instellen (met mxc-uri)';

  @override
  String get commandHint_myroomnick => 'Jouw naam voor deze kamer instellen';

  @override
  String get commandHint_op =>
      'Machtsniveau van de persoon instellen (standaard: 50)';

  @override
  String get commandHint_plain => 'Niet-opgemaakte tekst versturen';

  @override
  String get commandHint_react => 'Antwoord als reactie versturen';

  @override
  String get commandHint_send => 'Tekst versturen';

  @override
  String get commandHint_unban => 'Persoon weer in deze kamer toestaan';

  @override
  String get commandInvalid => 'Opdracht ongeldig';

  @override
  String commandMissing(String command) {
    return '$command is geen opdracht.';
  }

  @override
  String get compareEmojiMatch => 'Vergelijk de emoji\'s';

  @override
  String get compareNumbersMatch => 'Vergelijk de cijfers';

  @override
  String get configureChat => 'Chat configureren';

  @override
  String get confirm => 'Bevestigen';

  @override
  String get connect => 'Verbinden';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Contact is voor de groep uitgenodigd';

  @override
  String get containsDisplayName => 'Bevat naam';

  @override
  String get containsUserName => 'Bevat inlognaam';

  @override
  String get contentHasBeenReported =>
      'De inhoud is gerapporteerd aan de serverbeheerders';

  @override
  String get copiedToClipboard => 'Gekopieerd naar klembord';

  @override
  String get copy => 'Bericht kopiëren';

  @override
  String get copyToClipboard => 'Kopieer naar klembord';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Kan het bericht niet ontsleutelen: $error';
  }

  @override
  String get checkList => 'Checklist';

  @override
  String countParticipants(int count) {
    return '$count personen';
  }

  @override
  String countInvited(int count) {
    return '$count uitgenodigd';
  }

  @override
  String get create => 'Aanmaken';

  @override
  String createdTheChat(String username) {
    return '💬 $username heeft de chat gemaakt';
  }

  @override
  String get createGroup => 'Groep aanmaken';

  @override
  String get createNewSpace => 'Maak nieuwe space aan';

  @override
  String get currentlyActive => 'Momenteel actief';

  @override
  String get darkTheme => 'Donker';

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
    return '$day-$month-$year';
  }

  @override
  String get deactivateAccountWarning =>
      'Hierdoor wordt je account gedeactiveerd. Dit kan niet ongedaan gemaakt worden! Weet je het zeker?';

  @override
  String get defaultPermissionLevel =>
      'Standaard rechten-niveau voor nieuwe personen';

  @override
  String get delete => 'Verwijderen';

  @override
  String get deleteAccount => 'Account verwijderen';

  @override
  String get deleteMessage => 'Bericht verwijderen';

  @override
  String get device => 'Apparaat';

  @override
  String get deviceId => 'Apparaat-ID';

  @override
  String get devices => 'Apparaten';

  @override
  String get directChats => 'Directe chats';

  @override
  String get allRooms => 'Alle groepschats';

  @override
  String get displaynameHasBeenChanged => 'De naam is gewijzigd';

  @override
  String get downloadFile => 'Bestand downloaden';

  @override
  String get edit => 'Wijzig';

  @override
  String get editBlockedServers => 'Geblokkeerde servers wijzigen';

  @override
  String get chatPermissions => 'Chat rechten';

  @override
  String get editDisplayname => 'Naam wijzigen';

  @override
  String get editRoomAliases => 'Kameraliassen wijzigen';

  @override
  String get editRoomAvatar => 'Kameravatar wijzigen';

  @override
  String get emoteExists => 'Emoticon bestaat al!';

  @override
  String get emoteInvalid => 'Ongeldige emoticon korte code!';

  @override
  String get emoteKeyboardNoRecents =>
      'Recent gebruikte emoticons zullen hier verschijnen...';

  @override
  String get emotePacks => 'Emoticonpakketten voor de kamer';

  @override
  String get emoteSettings => 'Emoticon-instellingen';

  @override
  String get globalChatId => 'Globale chat ID';

  @override
  String get accessAndVisibility => 'Toegang en zichtbaarheid';

  @override
  String get accessAndVisibilityDescription =>
      'Wie mag toetreden tot deze chat en hoe de chat ontdekt kan worden.';

  @override
  String get calls => 'Gesprekken';

  @override
  String get customEmojisAndStickers => 'Aangepaste emoticons en stickers';

  @override
  String get customEmojisAndStickersBody =>
      'Voeg toe of deel aangepaste emoji\'s of stickers die gebruikt kunnen worden in elke chat.';

  @override
  String get emoteShortcode => 'Emoticon korte code';

  @override
  String get emoteWarnNeedToPick =>
      'Je moet een emoticon korte code en afbeelding kiezen!';

  @override
  String get emptyChat => 'Lege chat';

  @override
  String get enableEmotesGlobally => 'Emoticonpakket overal inschakelen';

  @override
  String get enableEncryption => 'Versleuteling inschakelen';

  @override
  String get enableEncryptionWarning =>
      'Je kunt de versleuteling hierna niet meer uitschakelen. Weet je het zeker?';

  @override
  String get encrypted => 'Versleuteld';

  @override
  String get encryption => 'Versleuteling';

  @override
  String get encryptionNotEnabled => 'Versleuteling is niet ingeschakeld';

  @override
  String endedTheCall(String senderName) {
    return '$senderName heeft het gesprek beëindigd';
  }

  @override
  String get enterAnEmailAddress => 'Voer een email in';

  @override
  String get homeserver => 'Server';

  @override
  String get enterYourHomeserver => 'Vul je homeserver in';

  @override
  String errorObtainingLocation(String error) {
    return 'Locatie ophalen fout: $error';
  }

  @override
  String get everythingReady => 'Alles klaar!';

  @override
  String get extremeOffensive => 'Extreem beledigend';

  @override
  String get fileName => 'Bestandsnaam';

  @override
  String get rechainonline => 'REChain';

  @override
  String get fontSize => 'Lettergrootte';

  @override
  String get forward => 'Stuur door';

  @override
  String get fromJoining => 'Vanaf toetreden';

  @override
  String get fromTheInvitation => 'Vanaf uitnodiging';

  @override
  String get goToTheNewRoom => 'Ga naar de nieuwe kamer';

  @override
  String get group => 'Groep';

  @override
  String get chatDescription => 'Chatomschrijving';

  @override
  String get chatDescriptionHasBeenChanged => 'Chatomschrijving gewijzigd';

  @override
  String get groupIsPublic => 'Groep is openbaar';

  @override
  String get groups => 'Groepen';

  @override
  String groupWith(String displayname) {
    return 'Groep met $displayname';
  }

  @override
  String get guestsAreForbidden => 'Gasten zijn verboden';

  @override
  String get guestsCanJoin => 'Gasten kunnen deelnemen';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username heeft de uitnodiging voor $targetName ingetrokken';
  }

  @override
  String get help => 'Help';

  @override
  String get hideRedactedEvents => 'Bewerkte gebeurtenissen verbergen';

  @override
  String get hideRedactedMessages => 'Verberg verwijderde berichten';

  @override
  String get hideRedactedMessagesBody =>
      'Als iemand een bericht verwijdert, is dit bericht niet meer zichtbaar in de chat.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Verberg ongeldige of onbekende berichtformaten';

  @override
  String get howOffensiveIsThisContent => 'Hoe beledigend is deze inhoud?';

  @override
  String get id => 'ID';

  @override
  String get identity => 'Identiteit';

  @override
  String get block => 'Blokkeren';

  @override
  String get blockedUsers => 'Geblokkeerde personen';

  @override
  String get blockListDescription =>
      'Je kunt personen blokkeren die je lastig vallen. Je kan dan geen berichten meer ontvangen of kameruitnodigingen krijgen van de personen op je blokkeerlijst.';

  @override
  String get blockUsername => 'Negeer inlognaam';

  @override
  String get iHaveClickedOnLink => 'Ik heb op de link geklikt';

  @override
  String get incorrectPassphraseOrKey =>
      'Onjuiste wachtwoordzin of herstelsleutel';

  @override
  String get inoffensive => 'Niet beledigend';

  @override
  String get inviteContact => 'Contact uitnodigen';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return 'Wil je $contact uitnodigingen voor de chat \"$groupName\"?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Contact voor $groupName uitnodigen';
  }

  @override
  String get noChatDescriptionYet => 'Nog geen chatomschrijving gemaakt.';

  @override
  String get tryAgain => 'Opnieuw proberen';

  @override
  String get invalidServerName => 'Foute servernaam';

  @override
  String get invited => 'Uitgenodigd';

  @override
  String get redactMessageDescription =>
      'Het bericht zal worden aangepast voor alle deelnemers in dit gesprek. Dit kan niet ongedaan gemaakt worden.';

  @override
  String get optionalRedactReason =>
      '(Optioneel) Reden voor aanpassing van dit bericht...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username heeft $targetName uitgenodigd';
  }

  @override
  String get invitedUsersOnly => 'Alleen uitgenodigde personen';

  @override
  String get inviteForMe => 'Persoonlijke uitnodiging';

  @override
  String inviteText(String username, String link) {
    return '$username heeft je uitgenodigd voor REChain.\n1. Bezoek https://online.rechain.network en installeer de app\n2. Registreer of log in\n3. Open deze uitnodigingslink:\n$link';
  }

  @override
  String get isTyping => 'is aan het typen…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username is toegetreden tot de chat';
  }

  @override
  String get joinRoom => 'Toetreden tot de kamer';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username heeft $targetName verwijderd';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username heeft $targetName verwijderd en verbannen';
  }

  @override
  String get kickFromChat => 'Uit chat verwijderen';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Laatst actief: $localizedTimeShort';
  }

  @override
  String get leave => 'Chat verlaten';

  @override
  String get leftTheChat => 'Verliet de chat';

  @override
  String get license => 'Licentie';

  @override
  String get lightTheme => 'Licht';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Laad nog $count personen';
  }

  @override
  String get dehydrate => 'Sessie exporteren en apparaat wissen';

  @override
  String get dehydrateWarning =>
      'Deze actie kan niet ongedaan worden gemaakt. Zorg ervoor dat je het back-upbestand veilig opslaat.';

  @override
  String get dehydrateTor => 'TOR-sessies: Exporteer sessie';

  @override
  String get dehydrateTorLong =>
      'Voor TOR-sessies is het aanbevolen de sessie te exporteren alvorens het venster te sluiten.';

  @override
  String get hydrateTor => 'TOR-sessie: Importeren sessie export';

  @override
  String get hydrateTorLong =>
      'Heb je de vorige keer jouw sessie geëxporteerd met TOR? Importeer het dan snel en ga verder met chatten.';

  @override
  String get hydrate => 'Herstellen vanuit back-upbestand';

  @override
  String get loadingPleaseWait => 'Bezig met laden… Even geduld.';

  @override
  String get loadMore => 'Meer laden…';

  @override
  String get locationDisabledNotice =>
      'Locatievoorzieningen is uitgeschakeld. Zet dit eerst aan om je locatie te delen.';

  @override
  String get locationPermissionDeniedNotice =>
      'Locatie toegang is geweigerd. Geef toegang om de locatie delen-functie te gebruiken.';

  @override
  String get login => 'Inloggen';

  @override
  String logInTo(String homeserver) {
    return 'Inloggen bij $homeserver';
  }

  @override
  String get logout => 'Uitloggen';

  @override
  String get memberChanges => 'Persoon wijzigingen';

  @override
  String get mention => 'Vermeld';

  @override
  String get messages => 'Berichten';

  @override
  String get messagesStyle => 'Berichten:';

  @override
  String get moderator => 'Moderator';

  @override
  String get muteChat => 'Chat dempen';

  @override
  String get needPantalaimonWarning =>
      'Houd er rekening mee dat je voorlopig Pantalaimon nodig hebt om eind-tot-eindversleuteling te gebruiken.';

  @override
  String get newChat => 'Nieuwe chat';

  @override
  String get newMessageInrechainonline => '💬 Nieuw bericht in REChain';

  @override
  String get newVerificationRequest => 'Nieuw verificatieverzoek!';

  @override
  String get next => 'Volgende';

  @override
  String get no => 'Nee';

  @override
  String get noConnectionToTheServer => 'Geen verbinding met de server';

  @override
  String get noEmotesFound => 'Geen emoticons gevonden. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Je kunt de versleuteling pas activeren zodra de kamer niet meer openbaar toegankelijk is.';

  @override
  String get noGoogleServicesWarning =>
      'Firebase Cloud Messaging lijkt niet beschikbaar op je apparaat. Om pushmeldingen te krijgen, adviseren we om ntfy te installeren. Met ntfy of een andere Unified Push-provider kun je pushmeldingen ontvangen op een veilige manier. Je kunt ntfy downloaden in de PlayStore of F-Droid.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 is geen Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node Network-server, wil je $server2 gebruiken?';
  }

  @override
  String get shareInviteLink => 'Uitnodigingslink delen';

  @override
  String get scanQrCode => 'QR-code scannen';

  @override
  String get none => 'Geen';

  @override
  String get noPasswordRecoveryDescription =>
      'Je hebt nog geen manier toegevoegd om je wachtwoord te herstellen.';

  @override
  String get noPermission => 'Geen toestemming';

  @override
  String get noRoomsFound => 'Geen kamers gevonden …';

  @override
  String get notifications => 'Meldingen';

  @override
  String get notificationsEnabledForThisAccount =>
      'Meldingen ingeschakeld voor dit account';

  @override
  String numUsersTyping(int count) {
    return '$count personen typen…';
  }

  @override
  String get obtainingLocation => 'Locatie ophalen…';

  @override
  String get offensive => 'Beledigend';

  @override
  String get offline => 'Offline';

  @override
  String get ok => 'OK';

  @override
  String get online => 'Online';

  @override
  String get onlineKeyBackupEnabled => 'Online sleutelback-up is ingeschakeld';

  @override
  String get oopsPushError =>
      'Oeps! Helaas is er een fout opgetreden bij het instellen van de pushmeldingen.';

  @override
  String get oopsSomethingWentWrong => 'Oeps, er ging iets mis…';

  @override
  String get openAppToReadMessages => 'Open app om de berichten te lezen';

  @override
  String get openCamera => 'Camera openen';

  @override
  String get openVideoCamera => 'Videocamera openen';

  @override
  String get oneClientLoggedOut => 'Één van jouw apparaten is uitgelogd';

  @override
  String get addAccount => 'Account toevoegen';

  @override
  String get editBundlesForAccount => 'Bundels voor dit account wijzigen';

  @override
  String get addToBundle => 'Aan bundel toevoegen';

  @override
  String get removeFromBundle => 'Van bundel verwijderen';

  @override
  String get bundleName => 'Bundelnaam';

  @override
  String get enableMultiAccounts =>
      '(BETA) Multi-accounts inschakelen op dit apparaat';

  @override
  String get openInMaps => 'In kaarten openen';

  @override
  String get link => 'Link';

  @override
  String get serverRequiresEmail =>
      'Deze server wil je email laten bevestigen bij de registratie.';

  @override
  String get or => 'Of';

  @override
  String get participant => 'Personen';

  @override
  String get passphraseOrKey => 'wachtwoordzin of herstelsleutel';

  @override
  String get password => 'Wachtwoord';

  @override
  String get passwordForgotten => 'Wachtwoord vergeten';

  @override
  String get passwordHasBeenChanged => 'Wachtwoord gewijzigd';

  @override
  String get hideMemberChangesInPublicChats =>
      'Verberg persoon veranderingen in openbare chats';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      'Verberg in de tijdlijn van de chat als iemand zich aanmeldt bij een openbare chat of deze verlaat om de leesbaarheid te verbeteren.';

  @override
  String get overview => 'Overzicht';

  @override
  String get notifyMeFor => 'Waarschuw mij voor';

  @override
  String get passwordRecoverySettings => 'Wachtwoordherstel-instellingen';

  @override
  String get passwordRecovery => 'Wachtwoordherstel';

  @override
  String get people => 'Personen';

  @override
  String get pickImage => 'Kies een afbeelding';

  @override
  String get pin => 'Pin';

  @override
  String play(String fileName) {
    return 'Speel $fileName';
  }

  @override
  String get pleaseChoose => 'Maak een keuze';

  @override
  String get pleaseChooseAPasscode => 'Kies een toegangscode';

  @override
  String get pleaseClickOnLink =>
      'Klik op de link in de email en ga dan verder.';

  @override
  String get pleaseEnter4Digits =>
      'Voer 4 cijfers in of laat leeg om app-vergrendeling uit te schakelen.';

  @override
  String get pleaseEnterRecoveryKey => 'Voer jouw herstelsleutel in:';

  @override
  String get pleaseEnterYourPassword => 'Voer jouw wachtwoord in';

  @override
  String get pleaseEnterYourPin => 'Voer je pincode in';

  @override
  String get pleaseEnterYourUsername => 'Voer je inlognaam in';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Volg de instructies op de website en tik op volgende.';

  @override
  String get privacy => 'Privacy';

  @override
  String get publicRooms => 'Openbare kamers';

  @override
  String get pushRules => 'Meldingsinstellingen';

  @override
  String get reason => 'Reden';

  @override
  String get recording => 'Opnemen';

  @override
  String redactedBy(String username) {
    return 'Aangepast door $username';
  }

  @override
  String get directChat => 'Directe chat';

  @override
  String redactedByBecause(String username, String reason) {
    return 'Aangepast door $username, reden: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username heeft een event verwijderd';
  }

  @override
  String get redactMessage => 'Aangepast bericht';

  @override
  String get register => 'Registeren';

  @override
  String get reject => 'Afwijzen';

  @override
  String rejectedTheInvitation(String username) {
    return '$username heeft de uitnodiging afgewezen';
  }

  @override
  String get rejoin => 'Opnieuw deelnemen';

  @override
  String get removeAllOtherDevices => 'Verwijder alle andere apparaten';

  @override
  String removedBy(String username) {
    return 'Verwijderd door $username';
  }

  @override
  String get removeDevice => 'Verwijder apparaat';

  @override
  String get unbanFromChat => 'Verbanning opheffen';

  @override
  String get removeYourAvatar => 'Jouw avatar verwijderen';

  @override
  String get replaceRoomWithNewerVersion => 'Kamerversie upgraden';

  @override
  String get reply => 'Antwoord';

  @override
  String get reportMessage => 'Bericht rapporteren';

  @override
  String get requestPermission => 'Vraag toestemming';

  @override
  String get roomHasBeenUpgraded => 'Kamer is geüpgrade';

  @override
  String get roomVersion => 'Kamerversie';

  @override
  String get saveFile => 'Bestand opslaan';

  @override
  String get search => 'Zoeken';

  @override
  String get security => 'Beveiliging';

  @override
  String get recoveryKey => 'Herstelsleutel';

  @override
  String get recoveryKeyLost => 'Herstelsleutel verloren?';

  @override
  String seenByUser(String username) {
    return 'Gezien door $username';
  }

  @override
  String get send => 'Verstuur';

  @override
  String get sendAMessage => 'Stuur een bericht';

  @override
  String get sendAsText => 'Als tekst versturen';

  @override
  String get sendAudio => 'Audio versturen';

  @override
  String get sendFile => 'Bestand versturen';

  @override
  String get sendImage => 'Afbeelding versturen';

  @override
  String sendImages(int count) {
    return 'Stuur $count afbeelding(en)';
  }

  @override
  String get sendMessages => 'Berichten versturen';

  @override
  String get sendOriginal => 'Origineel versturen';

  @override
  String get sendSticker => 'Sticker versturen';

  @override
  String get sendVideo => 'Video versturen';

  @override
  String sentAFile(String username) {
    return '📁 $username heeft een bestand verzonden';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username heeft een audio verzonden';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username heeft een afbeelding verzonden';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username heeft een sticker verzonden';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username heeft een video verzonden';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName heeft oproepgegevens verzonden';
  }

  @override
  String get separateChatTypes => 'Directe chats en groepen los weergeven';

  @override
  String get setAsCanonicalAlias => 'Als hoofdalias instellen';

  @override
  String get setCustomEmotes => 'Aangepaste emoticons instellen';

  @override
  String get setChatDescription => 'Chatomschrijving instellen';

  @override
  String get setInvitationLink => 'Uitnodigingslink instellen';

  @override
  String get setPermissionsLevel => 'Rechten-niveau instellen';

  @override
  String get setStatus => 'Status instellen';

  @override
  String get settings => 'Instellingen';

  @override
  String get share => 'Delen';

  @override
  String sharedTheLocation(String username) {
    return '$username heeft deze locatie gedeeld';
  }

  @override
  String get shareLocation => 'Locatie delen';

  @override
  String get showPassword => 'Wachtwoord weergeven';

  @override
  String get presenceStyle => 'Aanwezigheid:';

  @override
  String get presencesToggle => 'Toon statusberichten van andere personen';

  @override
  String get singlesignon => 'Eenmalig Inloggen';

  @override
  String get skip => 'Overslaan';

  @override
  String get sourceCode => 'Broncode';

  @override
  String get spaceIsPublic => 'Space is openbaar';

  @override
  String get spaceName => 'Spacenaam';

  @override
  String startedACall(String senderName) {
    return '$senderName heeft een gesprek gestart';
  }

  @override
  String get startFirstChat => 'Begin je eerste chat';

  @override
  String get status => 'Status';

  @override
  String get statusExampleMessage => 'Hoe gaat het met jouw vandaag?';

  @override
  String get submit => 'Indienen';

  @override
  String get synchronizingPleaseWait => 'Synchroniseren... Even geduld.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Synchroniseren… ($percentage%)';
  }

  @override
  String get systemTheme => 'Systeem';

  @override
  String get theyDontMatch => 'Ze komen niet overeen';

  @override
  String get theyMatch => 'Ze komen overeen';

  @override
  String get title => 'REChain';

  @override
  String get toggleFavorite => 'Favoriet in- of uitschakelen';

  @override
  String get toggleMuted => 'Dempen in- of uitschakelen';

  @override
  String get toggleUnread => 'Markeer gelezen/ongelezen';

  @override
  String get tooManyRequestsWarning =>
      'Te veel verzoeken. Probeer het later nog eens!';

  @override
  String get transferFromAnotherDevice => 'Overzetten vanaf een ander apparaat';

  @override
  String get tryToSendAgain => 'Probeer nogmaals te verzenden';

  @override
  String get unavailable => 'Niet beschikbaar';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username heeft verbanning $targetName ongedaan gemaakt';
  }

  @override
  String get unblockDevice => 'Deblokkeer apparaat';

  @override
  String get unknownDevice => 'Onbekend apparaat';

  @override
  String get unknownEncryptionAlgorithm => 'Onbekend versleutelingsalgoritme';

  @override
  String unknownEvent(String type) {
    return 'Onbekend evenement \'$type\'';
  }

  @override
  String get unmuteChat => 'Dempen uitschakelen';

  @override
  String get unpin => 'Losmaken';

  @override
  String unreadChats(int unreadCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount ongelezen chats',
      one: '1 ongelezen chat',
    );
    return '$_temp0';
  }

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username en $count anderen zijn aan het typen …';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username en $username2 zijn aan het typen …';
  }

  @override
  String userIsTyping(String username) {
    return '$username is aan het typen …';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username is vertrokken uit de chat';
  }

  @override
  String get username => 'Inlognaam';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username heeft een $type -gebeurtenis gestuurd';
  }

  @override
  String get unverified => 'Niet geverifieerd';

  @override
  String get verified => 'Geverifieerd';

  @override
  String get verify => 'Verifieer';

  @override
  String get verifyStart => 'Verificatie starten';

  @override
  String get verifySuccess => 'Je bent succesvol geverifieerd!';

  @override
  String get verifyTitle => 'Ander account verifiëren';

  @override
  String get videoCall => 'Videogesprek';

  @override
  String get visibilityOfTheChatHistory => 'Chatgeschiedenis zichtbaarheid';

  @override
  String get visibleForAllParticipants => 'Zichtbaar voor alle personen';

  @override
  String get visibleForEveryone => 'Zichtbaar voor iedereen';

  @override
  String get voiceMessage => 'Spraakbericht versturen';

  @override
  String get waitingPartnerAcceptRequest =>
      'Wachten tot partner het verzoek accepteert …';

  @override
  String get waitingPartnerEmoji =>
      'Wachten tot je partner de emoji accepteert…';

  @override
  String get waitingPartnerNumbers =>
      'Wachten tot partner de nummers accepteert …';

  @override
  String get wallpaper => 'Achtergrond:';

  @override
  String get warning => 'Waarschuwing!';

  @override
  String get weSentYouAnEmail => 'We hebben je een email gestuurd';

  @override
  String get whoCanPerformWhichAction => 'Wie kan welke actie uitvoeren';

  @override
  String get whoIsAllowedToJoinThisGroup => 'Wie mag deelnemen aan deze groep';

  @override
  String get whyDoYouWantToReportThis => 'Waarom wil je dit rapporteren?';

  @override
  String get wipeChatBackup =>
      'Wil je de chatback-up wissen om een nieuwe herstelsleutel te kunnen maken?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Met deze adressen kun je je wachtwoord herstellen.';

  @override
  String get writeAMessage => 'Schrijf een bericht…';

  @override
  String get yes => 'Ja';

  @override
  String get you => 'Jij';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Je neemt niet langer deel aan deze chat';

  @override
  String get youHaveBeenBannedFromThisChat => 'Je bent verbannen uit deze chat';

  @override
  String get yourPublicKey => 'Je publieke sleutel';

  @override
  String get messageInfo => 'Berichtinfo';

  @override
  String get time => 'Tijd';

  @override
  String get messageType => 'Berichttype';

  @override
  String get sender => 'Afzender';

  @override
  String get openGallery => 'Galerij openen';

  @override
  String get removeFromSpace => 'Uit de space verwijderen';

  @override
  String get addToSpaceDescription =>
      'Selecteer een space om deze chat aan toe te voegen.';

  @override
  String get start => 'Start';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'Om je oude berichten te ontgrendelen voer je jouw herstelsleutel in die gemaakt is in je vorige sessie. Je sleutel is niet je wachtwoord.';

  @override
  String get publish => 'Publiceren';

  @override
  String videoWithSize(String size) {
    return 'Video ($size)';
  }

  @override
  String get openChat => 'Chat openen';

  @override
  String get markAsRead => 'Markeer als gelezen';

  @override
  String get reportUser => 'Persoon rapporteren';

  @override
  String get dismiss => 'Sluiten';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender reageerde met $reaction';
  }

  @override
  String get pinMessage => 'Maak vast aan kamer';

  @override
  String get confirmEventUnpin =>
      'Weet je zeker dat je de gebeurtenis definitief wilt losmaken?';

  @override
  String get emojis => 'Emoji\'s';

  @override
  String get placeCall => 'Bellen';

  @override
  String get voiceCall => 'Spraakoproep';

  @override
  String get unsupportedAndroidVersion => 'Niet-ondersteunde Android-versie';

  @override
  String get unsupportedAndroidVersionLong =>
      'Voor deze functie is een nieuwe Android-versie verplicht. Controleer je updates of Mobile Katya OS-ondersteuning.';

  @override
  String get videoCallsBetaWarning =>
      'Houd er rekening mee dat videogesprekken momenteel in bèta zijn. Ze werken misschien niet zoals je verwacht of werken niet op alle platformen.';

  @override
  String get experimentalVideoCalls => 'Videogesprekken (experimenteel)';

  @override
  String get emailOrUsername => 'Email of inlognaam';

  @override
  String get indexedDbErrorTitle => 'Problemen met privémodus';

  @override
  String get indexedDbErrorLong =>
      'Het opslaan van berichten is helaas niet standaard ingeschakeld in de privémodus.\nBezoek alsjeblieft\n - about:config\n - stel dom.indexedDB.privateBrowsing.enabled in op true\nAnders is het niet mogelijk om REChain op te starten.';

  @override
  String switchToAccount(String number) {
    return 'Naar account $number overschakelen';
  }

  @override
  String get nextAccount => 'Volgende account';

  @override
  String get previousAccount => 'Vorige account';

  @override
  String get addWidget => 'Widget toevoegen';

  @override
  String get widgetVideo => 'Video';

  @override
  String get widgetEtherpad => 'Tekstnotitie';

  @override
  String get widgetJitsi => 'Jitsi Meet';

  @override
  String get widgetCustom => 'Aangepast';

  @override
  String get widgetName => 'Naam';

  @override
  String get widgetUrlError => 'Dit is geen geldige link.';

  @override
  String get widgetNameError => 'Geef een naam op.';

  @override
  String get errorAddingWidget => 'Fout bij het toevoegen van de widget.';

  @override
  String get youRejectedTheInvitation => 'Je hebt de uitnodiging afgewezen';

  @override
  String get youJoinedTheChat => 'Je bent toegetreden tot de chat';

  @override
  String get youAcceptedTheInvitation =>
      '👍 Je hebt de uitnodiging geaccepteerd';

  @override
  String youBannedUser(String user) {
    return 'Je hebt $user verbannen';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Je hebt de uitnodiging voor $user ingetrokken';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 Je bent uitgenodigd via een link voor:\n$alias';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 Je bent uitgenodigd door $user';
  }

  @override
  String invitedBy(String user) {
    return '📩 Uitgenodigd door: $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Je hebt $user uitgenodigd';
  }

  @override
  String youKicked(String user) {
    return '👞 Je hebt $user weggestuurd';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Je hebt weggestuurd en verbannen $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Je hebt de ban op $user opgeheven';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user heeft geklopt';
  }

  @override
  String get usersMustKnock => 'Personen moeten kloppen';

  @override
  String get noOneCanJoin => 'Niemand kan deelnemen';

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user wil graag deelnemen aan de chat.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'Openbare link is nog niet gecreëerd';

  @override
  String get knock => 'Klop';

  @override
  String get users => 'Personen';

  @override
  String get unlockOldMessages => 'Oude berichten ontgrendelen';

  @override
  String get storeInSecureStorageDescription =>
      'Sla de herstelsleutel op in de beveiligde opslag van dit apparaat.';

  @override
  String get saveKeyManuallyDescription =>
      'Sla deze sleutel handmatig op via delen of het klembord.';

  @override
  String get storeInAndroidKeystore => 'In Android KeyStore opslaan';

  @override
  String get storeInAppleKeyChain => 'In Apple KeyChain opslaan';

  @override
  String get storeSecurlyOnThisDevice => 'Veilig opslaan op dit apparaat';

  @override
  String countFiles(int count) {
    return '$count bestanden';
  }

  @override
  String get user => 'Persoon';

  @override
  String get custom => 'Aangepast';

  @override
  String get foregroundServiceRunning =>
      'Deze melding verschijnt wanneer de voorgronddienst draait.';

  @override
  String get screenSharingTitle => 'scherm delen';

  @override
  String get screenSharingDetail => 'Je deelt je scherm in FuffyChat';

  @override
  String get callingPermissions => 'Telefoon-rechten';

  @override
  String get callingAccount => 'Telefoon-account';

  @override
  String get callingAccountDetails =>
      'Hiermee kan REChain de Android telefoon-app gebruiken.';

  @override
  String get appearOnTop => 'Bovenaan verschijnen';

  @override
  String get appearOnTopDetails =>
      'Laat de app bovenaan verschijnen (niet nodig als je REChain al hebt ingesteld als een bel-account)';

  @override
  String get otherCallingPermissions =>
      'Microfoon, camera en andere REChain-rechten';

  @override
  String get whyIsThisMessageEncrypted => 'Waarom is dit bericht onleesbaar?';

  @override
  String get noKeyForThisMessage =>
      'Dit kan gebeuren als het bericht is verzonden voordat je bij je account op dit apparaat hebt aangemeld.\n\nHet is ook mogelijk dat de afzender je apparaat heeft geblokkeerd of dat er iets mis is gegaan met de internetverbinding.\n\nKan je het bericht wel lezen op een andere sessie? Dan kan je het bericht daarvandaan overzetten! Ga naar Instellingen > Apparaten en zorg ervoor dat je apparaten elkaar hebben geverifieerd. Wanneer je de kamer de volgende keer opent en beide sessies op de voorgrond staan, zullen de sleutels automatisch worden verzonden.\n\nWil je de sleutels niet verliezen als je uitlogt of van apparaat wisselt? Zorg er dan voor dat je de chatback-up hebt aangezet in de instellingen.';

  @override
  String get newGroup => 'Nieuwe groep';

  @override
  String get newSpace => 'Space aanmaken';

  @override
  String get enterSpace => 'Space betreden';

  @override
  String get enterRoom => 'Kamer betreden';

  @override
  String get allSpaces => 'Alle spaces';

  @override
  String numChats(String number) {
    return '$number chats';
  }

  @override
  String get hideUnimportantStateEvents =>
      'Onbelangrijke statusgebeurtenissen verbergen';

  @override
  String get hidePresences => 'Verberg statuslijst?';

  @override
  String get doNotShowAgain => 'Niet meer tonen';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Lege chat (was $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Met spaces kun je je chats samenvoegen en privé- of openbare community\'s bouwen.';

  @override
  String get encryptThisChat => 'Versleutel deze chat';

  @override
  String get disableEncryptionWarning =>
      'Om veiligheidsredenen kun je versleuteling niet uitschakelen in een chat, waar deze eerder is ingeschakeld.';

  @override
  String get sorryThatsNotPossible => 'Sorry, dat is niet mogelijk';

  @override
  String get deviceKeys => 'Apparaatsleutels:';

  @override
  String get reopenChat => 'Chat heropenen';

  @override
  String get noBackupWarning =>
      'Waarschuwing! Zonder de chatback-up in te schakelen, verlies je de toegang tot je versleutelde berichten. Het is sterk aanbevolen om eerst de chatback-up in te schakelen voordat je uitlogt.';

  @override
  String get noOtherDevicesFound => 'Geen andere apparaten gevonden';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Kan niet verzenden! De server ondersteunt alleen bijlages tot $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Het bestand is opgeslagen op $path';
  }

  @override
  String get jumpToLastReadMessage => 'Spring naar het laatst gelezen bericht';

  @override
  String get readUpToHere => 'Lees tot hier';

  @override
  String get jump => 'Spring';

  @override
  String get openLinkInBrowser => 'Link in browser openen';

  @override
  String get reportErrorDescription =>
      '😭 Oh nee. Er is iets misgegaan. Probeer het later nog eens. Als je wilt, kun je de bug rapporteren aan de ontwikkelaars.';

  @override
  String get report => 'Rapporteer';

  @override
  String get signInWithPassword => 'Aanmelden met wachtwoord';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Probeer het later nog eens of kies een andere server.';

  @override
  String signInWith(String provider) {
    return 'Aanmelden met $provider';
  }

  @override
  String get profileNotFound =>
      'De persoon kan niet gevonden worden op de server. Misschien is er een verbindingsprobleem of de persoon bestaat niet.';

  @override
  String get setTheme => 'Thema instellen:';

  @override
  String get setColorTheme => 'Kleurthema instellen:';

  @override
  String get invite => 'Uitnodigen';

  @override
  String get inviteGroupChat => '📨 Groeps-chat uitnodiging';

  @override
  String get invitePrivateChat => '📨 Privé-chat uitnodiging';

  @override
  String get invalidInput => 'Ongeldige invoer!';

  @override
  String wrongPinEntered(int seconds) {
    return 'Verkeerde pin ingevoerd! Probeer het nog eens over $seconds seconden...';
  }

  @override
  String get pleaseEnterANumber => 'Vul een getal in groter dan 0';

  @override
  String get archiveRoomDescription =>
      'De chat zal naar het archief worden verplaatst. Andere personen zullen in staat zijn te zien dat je de chat hebt verlaten.';

  @override
  String get roomUpgradeDescription =>
      'De chat zal dan opnieuw gemaakt worden met de nieuwe kamerversie. Alle deelnemers worden geïnformeerd dat ze moeten overstappen naar de nieuwe chat. Je kan meer lezen over kamerversies op https://spec.online.rechain.network/latest/rooms/';

  @override
  String get removeDevicesDescription =>
      'Je wordt op dit apparaat uitgelogd en zal niet langer in staat zijn om berichten te ontvangen.';

  @override
  String get banUserDescription =>
      'De persoon zal worden verbannen van de chat en kan niet meer toetreden totdat de verbanning is opgeheven.';

  @override
  String get unbanUserDescription =>
      'De persoon zal weer in staat zijn om de chat te betreden als ze het proberen.';

  @override
  String get kickUserDescription =>
      'De persoon is verwijderd uit de chat, maar is niet verbannen. In openbare chats kan de persoon op elk moment opnieuw deelnemen.';

  @override
  String get makeAdminDescription =>
      'Wanneer je deze persoon beheerder maakt kun je dit niet ongedaan maken als jullie dezelfde rechten hebben.';

  @override
  String get pushNotificationsNotAvailable =>
      'Pushmeldingen zijn niet beschikbaar';

  @override
  String get learnMore => 'Lees meer';

  @override
  String get yourGlobalUserIdIs => 'Je REChain ID is: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Helaas kan er geen persoon gevonden worden met \"$query\". Controleer of je een typfout hebt gemaakt.';
  }

  @override
  String get knocking => 'Kloppen';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Chat kan worden gevonden via een zoekopdracht op $server';
  }

  @override
  String get searchChatsRooms => 'Zoek naar #chats, @personen...';

  @override
  String get nothingFound => 'Niets gevonden...';

  @override
  String get groupName => 'Groepsnaam';

  @override
  String get createGroupAndInviteUsers => 'Maak groep en nodig personen uit';

  @override
  String get groupCanBeFoundViaSearch => 'Groep kan gevonden worden via zoeken';

  @override
  String get wrongRecoveryKey =>
      'Helaas... dit lijkt niet de correcte herstelsleutel.';

  @override
  String get startConversation => 'Start gesprek';

  @override
  String get commandHint_sendraw => 'Stuur kale json';

  @override
  String get databaseMigrationTitle => 'Database is geoptimaliseerd';

  @override
  String get databaseMigrationBody => 'Een ogenblik. Dit kan even duren.';

  @override
  String get leaveEmptyToClearStatus => 'Laat leeg om je status te resetten.';

  @override
  String get select => 'Selecteer';

  @override
  String get searchForUsers => 'Zoek naar @personen...';

  @override
  String get pleaseEnterYourCurrentPassword => 'Vul je huidige wachtwoord in';

  @override
  String get newPassword => 'Nieuw wachtwoord';

  @override
  String get pleaseChooseAStrongPassword => 'Kies a.j.b. een sterk wachtwoord';

  @override
  String get passwordsDoNotMatch => 'Wachtwoorden komen niet overeen';

  @override
  String get passwordIsWrong => 'Je ingevoerde wachtwoord is fout';

  @override
  String get publicLink => 'Openbare link';

  @override
  String get publicChatAddresses => 'Openbare chat adressen';

  @override
  String get createNewAddress => 'Creëer nieuw adres';

  @override
  String get joinSpace => 'Toetreden tot de space';

  @override
  String get publicSpaces => 'Openbare spaces';

  @override
  String get addChatOrSubSpace => 'Voeg chat of subspace toe';

  @override
  String get subspace => 'Subspace';

  @override
  String get decline => 'Weiger';

  @override
  String get thisDevice => 'Dit apparaat:';

  @override
  String get initAppError =>
      'Er is een fout opgetreden bij het laden van de app';

  @override
  String get userRole => 'Rol';

  @override
  String minimumPowerLevel(String level) {
    return '$level is het minimale rechten-niveau.';
  }

  @override
  String searchIn(String chat) {
    return 'Zoek in chat \"$chat\"...';
  }

  @override
  String get searchMore => 'Zoek meer...';

  @override
  String get gallery => 'Galerij';

  @override
  String get files => 'Bestanden';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return 'Het aanmaken van de SQlite database is mislukt. De app probeert nu een traditionele database te gebruiken. Meldt alsjeblieft deze fout aan de ontwikkelaars via deze $url. De foutmelding is: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'Je sessie is verlopen. Meldt alsjeblieft deze fout aan de ontwikkelaars via deze link $url. De foutmelding is: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'De app probeert nu je sessie te herstellen van een back-up. Meldt alsjeblieft deze fout aan de ontwikkelaars via deze link $url. De foutmelding is: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'Bericht doorsturen naar $roomName?';
  }

  @override
  String get sendReadReceipts => 'Leesbevestigingen versturen';

  @override
  String get sendTypingNotificationsDescription =>
      'Andere deelnemers in de chat kunnen zien wanneer je een bericht aan het typen bent.';

  @override
  String get sendReadReceiptsDescription =>
      'Andere deelnemers van de chat kunnen zien of je een bericht hebt gelezen.';

  @override
  String get formattedMessages => 'Opgemaakte berichten';

  @override
  String get formattedMessagesDescription =>
      'Geef rijke berichtinhoud weer zoals vetgedrukte tekst met markdown.';

  @override
  String get verifyOtherUser => '🔐 Persoon verifiëren';

  @override
  String get verifyOtherUserDescription =>
      'Als je een persoon verifieert ben je er zeker van dat je echt met haar contact hebt. 💪\n\nWanneer je een verificatie start ziet de persoon een popup in de app. Hier staat een serie van emoji\'s of getallen die je met elkaar moet vergelijken.\n\nDe beste manier om dit te doen is in persoon of met een videogesprek. 👭';

  @override
  String get verifyOtherDevice => '🔐 Ander apparaat verifiëren';

  @override
  String get verifyOtherDeviceDescription =>
      'Een geverifieerd ander apparaat zorgt ervoor dat de apparaten sleutels uitwisselen, wat je beveiliging versterkt. 💪 Als je de verificatie start verschijnt er een popup op beide apparaten. Hier staat een reeks emoji\'s of getallen die je met elkaar moet vergelijken. Het is handig om beide apparaten bij de hand te hebben voordat je de verificatie start. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender accepteerde de sleutelverificatie';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender annuleerde de sleutelverificatie';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender ronde de sleutelverificatie af';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender is klaar voor de sleutelverificatie';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender vraagt een sleutelverificatie';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender start een sleutelverificatie';
  }

  @override
  String get transparent => 'Transparant';

  @override
  String get incomingMessages => 'Inkomende berichten';

  @override
  String get stickers => 'Stickers';

  @override
  String get discover => 'Ontdek';

  @override
  String get commandHint_ignore => 'Negeer de gegeven REChain ID';

  @override
  String get commandHint_unignore => 'Herstel de negeerde REChain ID';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread ongelezen chats';
  }

  @override
  String get noDatabaseEncryption =>
      'Database versleuteling is niet ondersteund op dit platform';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Momenteel zijn er $count personen geblokkeerd.';
  }

  @override
  String get restricted => 'Beperkt';

  @override
  String get knockRestricted => 'Kloppen is beperkt';

  @override
  String goToSpace(Object space) {
    return 'Ga naar space: $space';
  }

  @override
  String get markAsUnread => 'Als ongelezen markeren';

  @override
  String userLevel(int level) {
    return '$level - Persoon';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Moderator';
  }

  @override
  String adminLevel(int level) {
    return '$level - Beheerder';
  }

  @override
  String get changeGeneralChatSettings => 'Algemene chat instellingen wijzigen';

  @override
  String get inviteOtherUsers => 'Personen voor deze chat uitnodigen';

  @override
  String get changeTheChatPermissions => 'Chat-rechten wijzigen';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Zichtbaarheid van de chat-geschiedenis wijzigen';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Standaard openbaar chat-adres wijzigen';

  @override
  String get sendRoomNotifications => '@room-meldingen versturen';

  @override
  String get changeTheDescriptionOfTheGroup => 'Chatomschrijving wijzigen';

  @override
  String get chatPermissionsDescription =>
      'Stel het gewenste rechten-niveau in voor bepaalde acties in deze chat. Het rechten-niveau 0, 50 en 100 zijn gebruikelijk voor deelnemer, moderator en beheerder, maar elke verdeling is mogelijk.';

  @override
  String updateInstalled(String version) {
    return '🎉 Update $version geïnstalleerd!';
  }

  @override
  String get changelog => 'Wijzigingengeschiedenis';

  @override
  String get sendCanceled => 'Versturen geannuleerd';

  @override
  String get loginWithREChainId => 'Inloggen met REChain ID';

  @override
  String get discoverHomeservers => 'Ontdek servers';

  @override
  String get whatIsAHomeserver => 'Wat is een server?';

  @override
  String get homeserverDescription =>
      'Al je data is opgeslagen op de server, net als bij een email-leverancier. Je kan kiezen welke server je gebruikt en toch communiceren met iedereen. Lees meer op https://online.rechain.network.';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Dit lijkt geen ondersteunde server. Verkeerde URL?';

  @override
  String get calculatingFileSize => 'Bestandsgrootte berekenen...';

  @override
  String get prepareSendingAttachment => 'Bijlage versturen voorbereiden...';

  @override
  String get sendingAttachment => 'Bijlage versturen...';

  @override
  String get generatingVideoThumbnail => 'Video-voorbeeld genereren...';

  @override
  String get compressVideo => 'Video comprimeren...';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return 'Bijlage versturen $index van $length...';
  }

  @override
  String serverLimitReached(int seconds) {
    return 'Server limiet bereikt! Wacht $seconds seconden...';
  }

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Een van jouw apparaten is niet geverifieerd';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Opmerking: Als al je apparaten zijn verbonden met de chat back-up worden ze automatisch geverifieerd.';

  @override
  String get continueText => 'Doorgaan';

  @override
  String get welcomeText =>
      'Hallo hallo 👋 Dit is REChain. Je kan inloggen op elke server die werkt met https://online.rechain.network. En dan chat je met iedereen. Het is een groot decentraal chat-netwerk!';

  @override
  String get blur => 'Vervaag:';

  @override
  String get opacity => 'Doorzichtigheid:';

  @override
  String get setWallpaper => 'Wallpaper instellen';

  @override
  String get manageAccount => 'Account beheren';

  @override
  String get noContactInformationProvided =>
      'Server geeft geen geldige contactinformatie';

  @override
  String get contactServerAdmin => 'Contact opnemen met serverbeheerder';

  @override
  String get contactServerSecurity => 'Contact opnemen met serverbeveiliger';

  @override
  String get supportPage => 'Supportpagina';

  @override
  String get serverInformation => 'Server-informatie:';

  @override
  String get name => 'Naam';

  @override
  String get version => 'Versie';

  @override
  String get website => 'Website';

  @override
  String get compress => 'Comprimeren';

  @override
  String get boldText => 'Vet gedrukte tekst';

  @override
  String get italicText => 'Cursieve tekst';

  @override
  String get strikeThrough => 'Doorhalen';

  @override
  String get pleaseFillOut => 'Vul alsjeblieft in';

  @override
  String get invalidUrl => 'Ongeldige url';

  @override
  String get addLink => 'Koppeling toevoegen';

  @override
  String get unableToJoinChat =>
      'Kan niet toetreden tot de chat. Misschien heeft de andere partij het gesprek al afgesloten.';

  @override
  String get previous => 'Vorige';

  @override
  String get otherPartyNotLoggedIn =>
      'De andere partij is momenteel niet ingelogd en kan daarom geen berichten ontvangen!';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Inloggen met \'$server\'';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Hierbij sta je toe dat de app en website informatie over je delen.';

  @override
  String get open => 'Open';

  @override
  String get waitingForServer => 'Wachten op server...';

  @override
  String get appIntroduction =>
      'REChain laat je chatten met je vrienden tussen verschillende chat-netwerken. Lees meer op https://online.rechain.network of tik *Continue*.';

  @override
  String get newChatRequest => '📩 Nieuw chat verzoek';

  @override
  String get contentNotificationSettings => 'Contentmelding instellingen';

  @override
  String get generalNotificationSettings => 'Algemene melding instellingen';

  @override
  String get roomNotificationSettings => 'Kamermelding instellingen';

  @override
  String get userSpecificNotificationSettings =>
      'Persoon specifieke melding instellingen';

  @override
  String get otherNotificationSettings => 'Andere melding instellingen';

  @override
  String get notificationRuleContainsUserName => 'Bevat naam van persoon';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Stuurt een melding als een bericht de persoon vermeld.';

  @override
  String get notificationRuleMaster => 'Alle meldingen dempen';

  @override
  String get notificationRuleMasterDescription =>
      'Overschrijf alle andere regels en meldingen uitschakelen.';

  @override
  String get notificationRuleSuppressNotices =>
      'Automatische berichten uitschakelen';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Meldingen van automatische accounts zoals bots uitschakelen.';

  @override
  String get notificationRuleInviteForMe => 'Uitnodiging voor mij';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Stuur een melding wanneer een persoon wordt uitgenodigd voor een kamer.';

  @override
  String get notificationRuleMemberEvent => 'Kamer-gebeurtenis';

  @override
  String get notificationRuleMemberEventDescription =>
      'Meldingen voor kamer-gebeurtenissen uitschakelen.';

  @override
  String get notificationRuleIsUserMention => 'Persoonvermelding';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Stuur een melding als de persoon direct genoemd wordt in een bericht.';

  @override
  String get notificationRuleContainsDisplayName => 'Bevat de naam';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Stuur een melding als de persoon genoemd wordt in het bericht.';

  @override
  String get notificationRuleIsRoomMention => 'Kamervermelding';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Stuur een melding naar de persoon als er in een kamervermelding is.';

  @override
  String get notificationRuleRoomnotif => 'Kamermelding';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Stuur een melding naar de persoon wanneer een bericht \'@room\' bevat.';

  @override
  String get notificationRuleTombstone => 'Sleutingsbericht';

  @override
  String get notificationRuleTombstoneDescription =>
      'Stuur een melding naar de persoon over kamersluitingsberichten.';

  @override
  String get notificationRuleReaction => 'Reactie';

  @override
  String get notificationRuleReactionDescription =>
      'Meldingen voor reacties uitschakelen.';

  @override
  String get notificationRuleRoomServerAcl => 'Kamer Server ACL';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Meldingen voor kamer server toegangscontrolelijst (ACL) uitschakelen.';

  @override
  String get notificationRuleSuppressEdits => 'Bewerkingen uitschakelen';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Meldingen voor bewerkte berichten uitschakelen.';

  @override
  String get notificationRuleCall => 'Oproep';

  @override
  String get notificationRuleCallDescription =>
      'Stuur een melding naar de persoon over oproepen.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'Versleutelde een-op-een kamer';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Stuur een melding naar de persoon over berichten in versleutelde een-op-een kamers.';

  @override
  String get notificationRuleRoomOneToOne => 'Een-op-een kamer';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Stuur een melding naar de persoon over berichten in een-op-een kamers.';

  @override
  String get notificationRuleMessage => 'Bericht';

  @override
  String get notificationRuleMessageDescription =>
      'Stuur een melding naar de persoon over algemene berichten.';

  @override
  String get notificationRuleEncrypted => 'Versleuteld';

  @override
  String get notificationRuleEncryptedDescription =>
      'Stuur een melding naar de persoon over berichten in versleutelde kamers.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Stuur een melding naar de persoon over Jitsi widget gebeurtenissen.';

  @override
  String get notificationRuleServerAcl =>
      'Server ACL gebeurtenissen uitschakelen';

  @override
  String get notificationRuleServerAclDescription =>
      'Meldingen over server ACL gebeurtenissen uitschakelen.';

  @override
  String unknownPushRule(String rule) {
    return 'Onbekende notificatieregel \'$rule\'';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return '🎙️ $duration - Spraakbericht van $sender';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Als je deze melding-instelling verwijderd, kan dit niet ongedaan gemaakt worden.';

  @override
  String get more => 'Meer';

  @override
  String get shareKeysWith => 'Deel sleutels met...';

  @override
  String get shareKeysWithDescription =>
      'Welke apparaten moeten vertrouwd worden zodat ze je berichten kunnen lezen in versleutelde chats?';

  @override
  String get allDevices => 'Alle apparaten';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Kruislings geverifieerde apparaten als ingeschakeld';

  @override
  String get crossVerifiedDevices => 'Kruislings geverifieerde apparaten';

  @override
  String get verifiedDevicesOnly => 'Alleen geverifieerde apparaten';

  @override
  String get takeAPhoto => 'Neem een foto';

  @override
  String get recordAVideo => 'Neem een video';

  @override
  String get optionalMessage => '(Optioneel) bericht...';

  @override
  String get notSupportedOnThisDevice => 'Niet ondersteund op dit apparaat';

  @override
  String get enterNewChat => 'Nieuwe chat openen';

  @override
  String get approve => 'Goedkeuren';

  @override
  String get youHaveKnocked => 'Je hebt geklopt';

  @override
  String get pleaseWaitUntilInvited =>
      'Wacht even alsjeblieft tot iemand van de kamer je uitnodigt.';

  @override
  String get commandHint_logout => 'Uw huidige apparaat uitloggen';

  @override
  String get commandHint_logoutall => 'Alle actieve apparaten uitloggen';

  @override
  String get displayNavigationRail => 'Navigatiebalk op mobiel tonen';

  @override
  String get customReaction => 'Aangepaste reactie';

  @override
  String get moreEvents => 'Meer gebeurtenissen';

  @override
  String get declineInvitation => 'Uitnodiging afwijzen';
}
