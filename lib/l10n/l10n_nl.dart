// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class L10nNl extends L10n {
  L10nNl([String locale = 'nl']) : super(locale);

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
  String get repeatPassword => 'Wachtwoord herhalen';

  @override
  String get notAnImage => 'Geen afbeeldingsbestand.';

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
  String get accountsAndSettings => 'Accounts and settings';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username heeft eind-tot-eindversleuteling geactiveerd';
  }

  @override
  String get addEmail => 'Email toevoegen';

  @override
  String get confirmREChainId =>
      'Please confirm your REChain ID in order to delete your account.';

  @override
  String supposedMxid(String mxid) {
    return 'Dit moet $mxid zijn';
  }

  @override
  String get addToSpace => 'Aan space toevoegen';

  @override
  String get admin => 'Beheerder';

  @override
  String get alias => 'alias';

  @override
  String get all => 'Alle';

  @override
  String get commandHint_roomupgrade =>
      'Upgradeer deze chat naar de aangegeven kamerversie';

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
  String get discardEdits => 'You have unsaved changes. Discard your edits?';

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
  String badServerLoginTypesException(
    String serverVersions,
    String supportedVersions,
    Object suportedVersions,
  ) {
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
  String get noMoreChatsFound => 'Geen chats gevonden...';

  @override
  String get noChatsFoundHere =>
      'Hier zijn nog geen chats. Begin een nieuwe chat met iemand door op de onderstaande knop te klikken. ⤵️';

  @override
  String get unread => 'Ongelezen';

  @override
  String get space => 'Space';

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
  String changedTheChatDescription(Object username) {
    return '$username heeft de chatomschrijving gewijzigd';
  }

  @override
  String changedTheChatName(Object username) {
    return '$username heeft de chatnaam gewijzigd';
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
    return '$username heeft de chat aliassen gewijzigd';
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
  String get chatBackup => 'Chatback-up';

  @override
  String get chatDetails => 'Chatdetails';

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
      'Markeer als privé-chat voor de REChain-ID';

  @override
  String get commandHint_markasgroup => 'Markeer als groep';

  @override
  String get commandHint_ban => 'Persoon uit deze chat verbannen';

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
  String get commandHint_invite => 'Persoon in deze chat uitnodigen';

  @override
  String get commandHint_join => 'Toetreden tot de vermelde chat';

  @override
  String get commandHint_kick => 'Persoon uit deze chat verwijderen';

  @override
  String get commandHint_leave => 'Deze chat verlaten';

  @override
  String get commandHint_me => 'Beschrijf jezelf';

  @override
  String get commandHint_myroomavatar =>
      'Jouw avatar voor deze chat instellen (met mxc-uri)';

  @override
  String get commandHint_myroomnick => 'Jouw naam voor deze chat instellen';

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
  String get commandHint_unban => 'Persoon weer in deze chat toestaan';

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
  String get contactHasBeenInvitedToTheGroup =>
      'Contact is voor de groep uitgenodigd';

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
  String get devices => 'Apparaten';

  @override
  String get directChats => 'Directe chats';

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
  String get editRoomAliases => 'Chat aliassen wijzigen';

  @override
  String get editRoomAvatar => 'Chat avatar wijzigen';

  @override
  String get emoteExists => 'Emoticon bestaat al!';

  @override
  String get emoteInvalid => 'Ongeldige emoticon korte code!';

  @override
  String get emoteKeyboardNoRecents =>
      'Recent gebruikte emoticons zullen hier verschijnen...';

  @override
  String get globalChatId => 'Globale chat ID';

  @override
  String get accessAndVisibility => 'Toegang en zichtbaarheid';

  @override
  String get accessAndVisibilityDescription =>
      'Wie mag toetreden tot deze chat en hoe de chat ontdekt kan worden.';

  @override
  String get customEmojisAndStickers => 'Aangepaste emoji\'s en stickers';

  @override
  String get customEmojisAndStickersBody =>
      'Voeg toe of deel aangepaste emoji\'s en stickers die in elke chat gebruikt kunnen worden.';

  @override
  String get emoteShortcode => 'Emoticon korte code';

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
  String get enterAnEmailAddress => 'Voer een emailadres in';

  @override
  String errorObtainingLocation(String error) {
    return 'Locatie ophalen fout: $error';
  }

  @override
  String get fontSize => 'Lettergrootte';

  @override
  String get forward => 'Stuur door';

  @override
  String get fromJoining => 'Vanaf toetreden';

  @override
  String get fromTheInvitation => 'Vanaf uitnodiging';

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
  String get hideRedactedMessages => 'Verwijderde berichten verbergen';

  @override
  String get hideRedactedMessagesBody =>
      'Als iemand een bericht verwijdert, is dit bericht niet meer zichtbaar in de chat.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Ongeldige of onbekende berichtformaten verbergen';

  @override
  String get block => 'Blokkeren';

  @override
  String get blockedUsers => 'Geblokkeerde personen';

  @override
  String get blockListDescription =>
      'Je kunt personen blokkeren die je lastig vallen. Je kan dan geen berichten meer ontvangen of chat uitnodigingen krijgen van de personen op je blokkeerlijst.';

  @override
  String get blockUsername => 'Negeer inlognaam';

  @override
  String get iHaveClickedOnLink => 'Ik heb op de link geklikt';

  @override
  String get incorrectPassphraseOrKey =>
      'Onjuiste wachtwoordzin of herstelsleutel';

  @override
  String get inviteContact => 'Contact uitnodigen';

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
  String inviteText(String username, String link) {
    return '$username heeft je uitgenodigd voor REChain.\n1. Bezoek https://github.com/sorydima/REChain- en installeer de app\n2. Registreer of log in\n3. Open deze uitnodigingslink:\n$link';
  }

  @override
  String get isTyping => 'is aan het typen…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username is toegetreden tot de chat';
  }

  @override
  String get joinRoom => 'Toetreden tot de chat';

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
      'Je kunt de versleuteling pas activeren zodra de chat niet meer openbaar toegankelijk is.';

  @override
  String get noGoogleServicesWarning =>
      'Firebase Cloud Messaging lijkt niet beschikbaar op je apparaat. Om pushmeldingen te krijgen, adviseren we om ntfy te installeren. Met ntfy of een andere Unified Push-provider kun je pushmeldingen ontvangen op een veilige manier. Je kunt ntfy downloaden in de PlayStore of F-Droid.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 is geen REChain-server, wil je $server2 gebruiken?';
  }

  @override
  String get shareInviteLink => 'Uitnodigingslink delen';

  @override
  String get scanQrCode => 'QR-code scannen';

  @override
  String get noPasswordRecoveryDescription =>
      'Je hebt nog geen manier toegevoegd om je wachtwoord te herstellen.';

  @override
  String get noPermission => 'Geen toestemming';

  @override
  String get noRoomsFound => 'Geen chats gevonden …';

  @override
  String get notifications => 'Meldingen';

  @override
  String numUsersTyping(int count) {
    return '$count personen typen…';
  }

  @override
  String get obtainingLocation => 'Locatie ophalen…';

  @override
  String get ok => 'OK';

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
  String get openInMaps => 'In kaarten openen';

  @override
  String get link => 'Link';

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
  String get passwordRecoverySettings => 'Wachtwoordherstel-instellingen';

  @override
  String get passwordRecovery => 'Wachtwoordherstel';

  @override
  String get pin => 'Pin';

  @override
  String get pleaseChooseAPasscode => 'Kies een toegangscode';

  @override
  String get pleaseClickOnLink =>
      'Klik op de link in de email en ga dan verder.';

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
  String get publicRooms => 'Openbare chats';

  @override
  String get reason => 'Reden';

  @override
  String redactedBy(String username) {
    return 'Aangepast door $username';
  }

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
  String get reject => 'Afwijzen';

  @override
  String rejectedTheInvitation(String username) {
    return '$username heeft de uitnodiging afgewezen';
  }

  @override
  String get removeAllOtherDevices => 'Verwijder alle andere apparaten';

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
  String get roomHasBeenUpgraded => 'Chat is geüpgrade';

  @override
  String sendingFilesDoNotExit(int count) {
    return 'Sending $count files... Please do not exit!';
  }

  @override
  String get roomVersion => 'Kamerversie';

  @override
  String get compressingVideo => 'Compressing video...';

  @override
  String get saveFile => 'Bestand opslaan';

  @override
  String get search => 'Zoeken';

  @override
  String get security => 'Beveiliging';

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
  String get setAsCanonicalAlias => 'Als hoofdalias instellen';

  @override
  String get setChatDescription => 'Chatomschrijving instellen';

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
  String get tooManyRequestsWarning =>
      'Te veel verzoeken. Probeer het later nog eens!';

  @override
  String get tryToSendAgain => 'Probeer nogmaals te verzenden';

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
  String get unpin => 'Pin losmaken';

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
  String userSentUnknownEvent(String username, String type) {
    return '$username heeft een $type -gebeurtenis gestuurd';
  }

  @override
  String get unverified => 'Niet geverifieerd';

  @override
  String get verified => 'Geverifieerd';

  @override
  String get verifyStart => 'Verificatie starten';

  @override
  String get verifySuccess => 'Je bent succesvol geverifieerd!';

  @override
  String get verifyTitle => 'Ander account verifiëren';

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
  String get yourPublicKey => 'Je publieke sleutel';

  @override
  String get messageInfo => 'Berichtinfo';

  @override
  String get time => 'Tijd';

  @override
  String get sender => 'Afzender';

  @override
  String get openGallery => 'Galerij openen';

  @override
  String get removeFromSpace => 'Uit de space verwijderen';

  @override
  String get markAsRead => 'Markeer als gelezen';

  @override
  String get reportUser => 'Persoon rapporteren';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender reageerde met $reaction';
  }

  @override
  String get pinMessage => 'Maak vast aan chat';

  @override
  String get confirmEventUnpin =>
      'Weet je zeker dat je de gebeurtenis definitief wilt losmaken?';

  @override
  String get emojis => 'Emoji\'s';

  @override
  String get unsupportedAndroidVersion => 'Niet-ondersteunde Android-versie';

  @override
  String get unsupportedAndroidVersionLong =>
      'Voor deze functie is een nieuwe Android-versie verplicht. Controleer je updates of Mobile Katya OS-ondersteuning.';

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
  String youInvitedBy(String user) {
    return '📩 Je bent uitgenodigd door $user';
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
  String get knock => 'Klop';

  @override
  String get users => 'Personen';

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
  String get whyIsThisMessageEncrypted => 'Waarom is dit bericht onleesbaar?';

  @override
  String get noKeyForThisMessage =>
      'Dit kan gebeuren als het bericht is verzonden voordat je bij je account op dit apparaat hebt aangemeld.\n\nHet is ook mogelijk dat de afzender je apparaat heeft geblokkeerd of dat er iets mis is gegaan met de internetverbinding.\n\nKan je het bericht wel lezen in een andere sessie? Dan kan je het bericht daarvandaan overzetten! Ga naar Instellingen > Apparaten en zorg ervoor dat je apparaten elkaar hebben geverifieerd. Wanneer je de chat de volgende keer opent en beide sessies op de voorgrond staan, zullen de sleutels automatisch worden verzonden.\n\nWil je de sleutels niet verliezen als je uitlogt of van apparaat wisselt? Zorg er dan voor dat je de chatback-up hebt aangezet in de instellingen.';

  @override
  String get newSpace => 'Space aanmaken';

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
  String get setColorTheme => 'Kleurthema instellen:';

  @override
  String get invite => 'Uitnodigen';

  @override
  String get inviteGroupChat => '📨 Groeps-chat uitnodiging';

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
      'De chat zal dan opnieuw gemaakt worden met de nieuwe kamerversie. Alle deelnemers worden geïnformeerd dat ze moeten overstappen naar de nieuwe chat. Je kan meer lezen over kamerversies op https://github.com/sorydima/REChain-.git';

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
  String get yourGlobalUserIdIs => 'Je REChain-ID is: ';

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
  String get searchChatsRooms => 'Zoek #chats, @personen...';

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
  String get searchForUsers => 'Zoek @personen...';

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
  String get thisDevice => 'Dit apparaat:';

  @override
  String get initAppError =>
      'Er is een fout opgetreden bij het laden van de app';

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
  String sessionLostBody(String url, String error) {
    return 'Je sessie is verlopen. Meldt alsjeblieft deze fout aan de ontwikkelaars via deze link $url. De foutmelding is: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'De app probeert nu je sessie te herstellen van een back-up. Meldt alsjeblieft deze fout aan de ontwikkelaars via deze link $url. De foutmelding is: $error';
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
  String get incomingMessages => 'Inkomende berichten';

  @override
  String get stickers => 'Stickers';

  @override
  String get discover => 'Ontdek';

  @override
  String get commandHint_ignore => 'Negeer de gegeven REChain-ID';

  @override
  String get commandHint_unignore => 'Herstel de negeerde REChain-ID';

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
  String updateAvailable(String version) {
    return 'Update $version available';
  }

  @override
  String get download => 'Download';

  @override
  String get sendCanceled => 'Versturen geannuleerd';

  @override
  String get loginWithREChainId => 'Login with REChain-ID';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Dit lijkt geen ondersteunde server. Verkeerde URL?';

  @override
  String get calculatingFileSize => 'Bestandsgrootte berekenen...';

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Een van jouw apparaten is niet geverifieerd';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Opmerking: Als al je apparaten zijn verbonden met de chat back-up worden ze automatisch geverifieerd.';

  @override
  String get continueText => 'Doorgaan';

  @override
  String get blur => 'Vervaag:';

  @override
  String get opacity => 'Doorzichtigheid:';

  @override
  String get setWallpaper => 'Achtergrond instellen';

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
      'Stuur een melding als je inlognaam vermeld wordt in een bericht.';

  @override
  String get notificationRuleMaster => 'Alle meldingen dempen';

  @override
  String get notificationRuleMasterDescription =>
      'Overschrijf alle andere regels en schakel alle meldingen uit.';

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
      'Stuur een melding wanneer je wordt uitgenodigd voor een chat.';

  @override
  String get notificationRuleMemberEvent => 'Chat-gebeurtenis';

  @override
  String get notificationRuleMemberEventDescription =>
      'Meldingen voor chat-gebeurtenissen uitschakelen.';

  @override
  String get notificationRuleIsUserMention => 'Persoonvermelding';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Stuur een melding als je direct genoemd wordt in een bericht.';

  @override
  String get notificationRuleContainsDisplayName => 'Bevat de naam';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Stuur een melding als je genoemd wordt in een bericht.';

  @override
  String get notificationRuleIsRoomMention => 'Kamervermelding';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Stuur een melding als er een kamervermelding is.';

  @override
  String get notificationRuleRoomnotif => 'Kamermelding';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Stuur je een melding als een bericht \'@room\' bevat.';

  @override
  String get notificationRuleTombstone => 'Sluitingsbericht';

  @override
  String get notificationRuleTombstoneDescription =>
      'Stuur een melding naar je over chat-sluitingsberichten.';

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
      'Stuur een melding naar je over oproepen.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'Versleutelde een-op-een chat';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Stuur een melding naar je over berichten in versleutelde een-op-een chats.';

  @override
  String get notificationRuleRoomOneToOne => 'Een-op-een chat';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Stuur een melding naar je over berichten in een-op-een chats.';

  @override
  String get notificationRuleMessage => 'Bericht';

  @override
  String get notificationRuleMessageDescription =>
      'Stuur een melding naar je over algemene berichten.';

  @override
  String get notificationRuleEncrypted => 'Versleuteld';

  @override
  String get notificationRuleEncryptedDescription =>
      'Stuur een melding naar je over berichten in versleutelde chats.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Stuur een melding naar je over Jitsi widget-gebeurtenissen.';

  @override
  String get notificationRuleServerAcl =>
      'Server ACL-gebeurtenissen uitschakelen';

  @override
  String get notificationRuleServerAclDescription =>
      'Meldingen over server ACL-gebeurtenissen uitschakelen.';

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
  String get takeAPhoto => 'Foto maken';

  @override
  String get recordAVideo => 'Video opnemen';

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
      'Wacht even alsjeblieft tot iemand van de chat je uitnodigt.';

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
  String get showMore => 'Show more';

  @override
  String get showLess => 'Show less';

  @override
  String get declineInvitation => 'Uitnodiging afwijzen';

  @override
  String get noMessagesYet => 'Nog geen berichten';

  @override
  String get longPressToRecordVoiceMessage =>
      'Lang drukken om een spraakbericht op te nemen.';

  @override
  String get pause => 'Pauzeer';

  @override
  String get resume => 'Hervat';

  @override
  String get removeFromSpaceDescription =>
      'De chat zal worden verwijderd uit de space, maar blijft in je chats.';

  @override
  String countChats(int chats) {
    return '$chats chats';
  }

  @override
  String spaceMemberOf(String spaces) {
    return '$spaces personen in space';
  }

  @override
  String spaceMemberOfCanKnock(String spaces) {
    return '$spaces personen in space kunnen kloppen';
  }

  @override
  String get startPoll => 'Peiling starten';

  @override
  String get endPoll => 'Peiling beëindigen';

  @override
  String get answersVisible => 'Zichtbaar invullen';

  @override
  String get pollQuestion => 'Peiling vraag';

  @override
  String get answerOption => 'Antwoord optie';

  @override
  String get addAnswerOption => 'Antwoord optie toevoegen';

  @override
  String get allowMultipleAnswers => 'Meerdere antwoorden toestaan';

  @override
  String get pollHasBeenEnded => 'Peiling is geëindigd';

  @override
  String countVotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stemmen',
      one: 'Één stem',
    );
    return '$_temp0';
  }

  @override
  String get answersWillBeVisibleWhenPollHasEnded =>
      'Antwoorden zullen zichtbaar zijn wanneer de peiling is geëindigd';

  @override
  String get replyInThread => 'Antwoord in draad';

  @override
  String countReplies(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count antwoorden',
      one: 'Één antwoord',
    );
    return '$_temp0';
  }

  @override
  String get thread => 'Draad';

  @override
  String get backToMainChat => 'Terug naar hoofdchat';

  @override
  String get saveChanges => 'Wijzigingen opslaan';

  @override
  String get createSticker => 'Sticker of emoji maken';

  @override
  String get useAsSticker => 'Gebruik als sticker';

  @override
  String get useAsEmoji => 'Gebruik als emoji';

  @override
  String get stickerPackNameAlreadyExists => 'Stickerpakketnaam bestaat al';

  @override
  String get newStickerPack => 'Nieuw stickerpakket';

  @override
  String get stickerPackName => 'Stickerpakketnaam';

  @override
  String get attribution => 'Toeschrijving';

  @override
  String get skipChatBackup => 'Chatback-up overslaan';

  @override
  String get skipChatBackupWarning =>
      'Weet je het zeker? Zonder chat back-up verlies je toegang tot je berichten als je van apparaat wisselt.';

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
  String get loadingMessages => 'Berichten laden';

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
      'Houd er rekening mee dat videogesprekken momenteel in bèta zijn. Ze werken misschien niet zoals je verwacht of werken niet op alle platformen.';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get incomingCall => 'Incoming call';

  @override
  String get videoCall => 'Videogesprek';

  @override
  String get voiceCall => 'Spraakoproep';

  @override
  String get missedCall => 'Missed call';

  @override
  String get callBack => 'Call back';

  @override
  String get hangUp => 'Hang up';

  @override
  String get waitingForParticipant => 'Waiting for participant...';

  @override
  String get decline => 'Weiger';

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
