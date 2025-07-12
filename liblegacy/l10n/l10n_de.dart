// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class L10nDe extends L10n {
  L10nDe([String locale = 'de']) : super(locale);

  @override
  String get alwaysUse24HourFormat => 'true';

  @override
  String get repeatPassword => 'Passwort wiederholen';

  @override
  String get notAnImage => 'Keine Bilddatei.';

  @override
  String get setCustomPermissionLevel =>
      'Benutzerdefinierte Berechtigungsstufe festlegen';

  @override
  String get setPermissionsLevelDescription =>
      'Bitte wählen Sie unten eine vordefinierte Rolle aus oder geben Sie eine benutzerdefinierte Berechtigungsstufe zwischen 0 und 100 ein.';

  @override
  String get ignoreUser => 'Nutzer ignorieren';

  @override
  String get normalUser => 'Normaler Benutzer';

  @override
  String get remove => 'Entfernen';

  @override
  String get importNow => 'Jetzt importieren';

  @override
  String get importEmojis => 'Emojis importieren';

  @override
  String get importFromZipFile => 'Aus ZIP-Datei importieren';

  @override
  String get exportEmotePack => 'Emote-Paket als ZIP-Datei exportieren';

  @override
  String get replace => 'Ersetzen';

  @override
  String get about => 'Über';

  @override
  String aboutHomeserver(String homeserver) {
    return 'Über $homeserver';
  }

  @override
  String get accept => 'Annehmen';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username hat die Einladung angenommen';
  }

  @override
  String get account => 'Konto';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username hat Ende-zu-Ende Verschlüsselung aktiviert';
  }

  @override
  String get addEmail => 'E-Mail hinzufügen';

  @override
  String get confirmMatrixId =>
      'Bitte bestätigen deine REChain-ID, um dein Konto zu löschen.';

  @override
  String supposedMxid(String mxid) {
    return 'das sollte sein $mxid';
  }

  @override
  String get addChatDescription => 'Chatbeschreibung hinzufügen ...';

  @override
  String get addToSpace => 'Zum Space hinzufügen';

  @override
  String get admin => 'Admin';

  @override
  String get alias => 'Alias';

  @override
  String get all => 'Alle';

  @override
  String get allChats => 'Alle Chats';

  @override
  String get commandHint_roomupgrade =>
      'Aktualisieren Sie diesen Raum auf die angegebene Raumversion';

  @override
  String get commandHint_googly => 'Glupschaugen senden';

  @override
  String get commandHint_cuddle => 'Umarmung senden';

  @override
  String get commandHint_hug => 'Umarmung senden';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName hat dir Googly Eyes gesendet';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName knuddelt dich';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName umarmt dich';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName hat den Anruf angenommen';
  }

  @override
  String get anyoneCanJoin => 'Jeder darf beitreten';

  @override
  String get appLock => 'Anwendungssperre';

  @override
  String get appLockDescription =>
      'App mit einer PIN sperren, wenn sie nicht verwendet wird';

  @override
  String get archive => 'Archiv';

  @override
  String get areGuestsAllowedToJoin => 'Dürfen Gäste beitreten';

  @override
  String get areYouSure => 'Bist du sicher?';

  @override
  String get areYouSureYouWantToLogout => 'Willst du dich wirklich abmelden?';

  @override
  String get askSSSSSign =>
      'Bitte gib, um die andere Person signieren zu können, dein Sicherheitsschlüssel oder Wiederherstellungsschlüssel ein.';

  @override
  String askVerificationRequest(String username) {
    return 'Diese Bestätigungsanfrage von $username annehmen?';
  }

  @override
  String get autoplayImages =>
      'Animierte Sticker und Emotes automatisch abspielen';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'Der Homeserver unterstützt diese Anmelde-Typen:\n$serverVersions\nAber diese App unterstützt nur:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Tippbenachrichtigungen senden';

  @override
  String get swipeRightToLeftToReply =>
      'Wische von rechts nach links zum Antworten';

  @override
  String get sendOnEnter => 'Senden mit Enter';

  @override
  String badServerVersionsException(
      String serverVersions,
      String supportedVersions,
      Object serverVerions,
      Object supoortedVersions,
      Object suportedVersions) {
    return 'Der Homeserver unterstützt die Spec-Versionen:\n$serverVersions\nAber diese App unterstützt nur:\n$supportedVersions';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats Chats und $participants Teilnehmer';
  }

  @override
  String get noMoreChatsFound => 'Keine weiteren Chats gefunden ...';

  @override
  String get noChatsFoundHere =>
      'Hier wurden noch keine Chats gefunden. Starte einen neuen Chat mit jemandem, indem du die Schaltfläche unten verwenden. ⤵️';

  @override
  String get joinedChats => 'Beigetretene Chats';

  @override
  String get unread => 'Ungelesen';

  @override
  String get space => 'Space';

  @override
  String get spaces => 'Spaces';

  @override
  String get banFromChat => 'Aus dem Chat verbannen';

  @override
  String get banned => 'Verbannt';

  @override
  String bannedUser(String username, String targetName) {
    return '$username hat $targetName verbannt';
  }

  @override
  String get blockDevice => 'Blockiere Gerät';

  @override
  String get blocked => 'Blockiert';

  @override
  String get botMessages => 'Bot-Nachrichten';

  @override
  String get cancel => 'Abbrechen';

  @override
  String cantOpenUri(String uri) {
    return 'Die URI $uri kann nicht geöffnet werden';
  }

  @override
  String get changeDeviceName => 'Gerätenamen ändern';

  @override
  String changedTheChatAvatar(String username) {
    return '$username hat den Chat-Avatar geändert';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username hat die Chatbeschreibung geändert in: \'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username hat den Chatnamen geändert in: \'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username hat die Chat-Berechtigungen geändert';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username hat den Spitznamen geändert in: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username hat die Zugangsregeln für Gäste geändert';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username hat die Zugangsregeln für Gäste geändert zu: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username hat die Sichtbarkeit des Chat-Verlaufs geändert';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username hat die Sichtbarkeit des Chat-Verlaufs geändert zu: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username hat die Zugangsregeln geändert';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username hat die Zugangsregeln geändert zu: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username hat das Profilbild geändert';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username hat die Raum-Aliasse geändert';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username hat den Einladungslink geändert';
  }

  @override
  String get changePassword => 'Passwort ändern';

  @override
  String get changeTheHomeserver => 'Anderen Homeserver verwenden';

  @override
  String get changeTheme => 'Ändere Deinen Style';

  @override
  String get changeTheNameOfTheGroup => 'Gruppenname ändern';

  @override
  String get changeYourAvatar => 'Deinen Avatar ändern';

  @override
  String get channelCorruptedDecryptError =>
      'Die Verschlüsselung wurde korrumpiert';

  @override
  String get chat => 'Chat';

  @override
  String get yourChatBackupHasBeenSetUp =>
      'Dein Chat-Backup wurde eingerichtet.';

  @override
  String get chatBackup => 'Chat-Backup';

  @override
  String get chatBackupDescription =>
      'Deine alten Nachrichten sind mit einem Wiederherstellungsschlüssel gesichert. Bitte stellen sicher, dass du ihn nicht verlierst.';

  @override
  String get chatDetails => 'Chatdetails';

  @override
  String get chatHasBeenAddedToThisSpace => 'Chat wurde zum Space hinzugefügt';

  @override
  String get chats => 'Chats';

  @override
  String get chooseAStrongPassword => 'Wähle ein sicheres Passwort';

  @override
  String get clearArchive => 'Archiv leeren';

  @override
  String get close => 'Schließen';

  @override
  String get commandHint_markasdm =>
      'Als Direktnachrichtenraum für die angegebene REChain-ID markieren';

  @override
  String get commandHint_markasgroup => 'Als Gruppe markieren';

  @override
  String get commandHint_ban => 'Banne ausgewählten Benutzer aus diesen Raum';

  @override
  String get commandHint_clearcache => 'Zwischenspeicher löschen';

  @override
  String get commandHint_create =>
      'Erstelle ein leeren Gruppenchat\nBenutze --no-encryption, um die Verschlüsselung auszuschalten';

  @override
  String get commandHint_discardsession => 'Sitzung verwerfen';

  @override
  String get commandHint_dm =>
      'Starte einen direkten Chat\nBenutze --no-encryption, um die Verschlüsselung auszuschalten';

  @override
  String get commandHint_html => 'Sende HTML-formatierten Text';

  @override
  String get commandHint_invite => 'Lade den Benutzer in diesen Raum ein';

  @override
  String get commandHint_join => 'Betritt den ausgewählten Raum';

  @override
  String get commandHint_kick =>
      'Entferne den übergebenen Benutzer aus diesem Raum';

  @override
  String get commandHint_leave => 'Diesen Raum verlassen';

  @override
  String get commandHint_me => 'Beschreibe dich selbst';

  @override
  String get commandHint_myroomavatar =>
      'Setze dein Profilbild nur für diesen Raum (MXC-Uri)';

  @override
  String get commandHint_myroomnick =>
      'Setze deinen Anzeigenamen nur für diesen Raum';

  @override
  String get commandHint_op =>
      'Setze den übergeben Powerlevel des Benutzers (Standard: 50)';

  @override
  String get commandHint_plain => 'Sende unformatierten Text';

  @override
  String get commandHint_react => 'Sende die Antwort als Reaction';

  @override
  String get commandHint_send => 'Text senden';

  @override
  String get commandHint_unban =>
      'Hebe die Verbannung dieses Benutzers in diesem Raum auf';

  @override
  String get commandInvalid => 'Befehl ungültig';

  @override
  String commandMissing(String command) {
    return '$command ist kein Befehl.';
  }

  @override
  String get compareEmojiMatch => 'Bitte vergleiche die Emojis';

  @override
  String get compareNumbersMatch => 'Bitte vergleiche die Zahlen';

  @override
  String get configureChat => 'Chat konfigurieren';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get connect => 'Verbinden';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Kontakt wurde in die Gruppe eingeladen';

  @override
  String get containsDisplayName => 'Enthält Anzeigenamen';

  @override
  String get containsUserName => 'Enthält Benutzernamen';

  @override
  String get contentHasBeenReported =>
      'Der Inhalt wurde den Serveradministratoren gemeldet';

  @override
  String get copiedToClipboard => 'Wurde in die Zwischenablage kopiert';

  @override
  String get copy => 'Kopieren';

  @override
  String get copyToClipboard => 'In Zwischenablage kopieren';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Nachricht konnte nicht entschlüsselt werden: $error';
  }

  @override
  String get checkList => 'Checkliste';

  @override
  String countParticipants(int count) {
    return '$count Mitglieder';
  }

  @override
  String countInvited(int count) {
    return '$count invited';
  }

  @override
  String get create => 'Erstellen';

  @override
  String createdTheChat(String username) {
    return '💬 $username hat den Chat erstellt';
  }

  @override
  String get createGroup => 'Gruppe erstellen';

  @override
  String get createNewSpace => 'Neuer Space';

  @override
  String get currentlyActive => 'Jetzt gerade online';

  @override
  String get darkTheme => 'Dunkel';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String dateWithoutYear(String month, String day) {
    return '$day.$month';
  }

  @override
  String dateWithYear(String year, String month, String day) {
    return '$day.$month.$year';
  }

  @override
  String get deactivateAccountWarning =>
      'Dies deaktiviert dein Konto. Es kann nicht rückgängig gemacht werden! Bist du sicher?';

  @override
  String get defaultPermissionLevel =>
      'Standardberechtigungsstufe für neue Benutzer';

  @override
  String get delete => 'Löschen';

  @override
  String get deleteAccount => 'Konto löschen';

  @override
  String get deleteMessage => 'Nachricht löschen';

  @override
  String get device => 'Gerät';

  @override
  String get deviceId => 'Geräte-ID';

  @override
  String get devices => 'Geräte';

  @override
  String get directChats => 'Direkte Chats';

  @override
  String get allRooms => 'Alle Gruppenchats';

  @override
  String get displaynameHasBeenChanged => 'Anzeigename wurde geändert';

  @override
  String get downloadFile => 'Datei herunterladen';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get editBlockedServers => 'Blockierte Server einstellen';

  @override
  String get chatPermissions => 'Chatberechtigungen';

  @override
  String get editDisplayname => 'Anzeigename ändern';

  @override
  String get editRoomAliases => 'Raum-Aliase bearbeiten';

  @override
  String get editRoomAvatar => 'Raumavatar bearbeiten';

  @override
  String get emoteExists => 'Emoticon existiert bereits!';

  @override
  String get emoteInvalid => 'Ungültiges Emoticon-Kürzel!';

  @override
  String get emoteKeyboardNoRecents =>
      'Kürzlich verwendete Emotes werden hier angezeigt ...';

  @override
  String get emotePacks => 'Emoticon-Bündel für Raum';

  @override
  String get emoteSettings => 'Emoticon-Einstellungen';

  @override
  String get globalChatId => 'Globale Chat-ID';

  @override
  String get accessAndVisibility => 'Zugang und Sichtbarkeit';

  @override
  String get accessAndVisibilityDescription =>
      'Wer darf dem Chat beitreten und wie kann der Chat gefunden werden.';

  @override
  String get calls => 'Anrufe';

  @override
  String get customEmojisAndStickers => 'Eigene Emojis und Sticker';

  @override
  String get customEmojisAndStickersBody =>
      'Eigene Emojis oder Sticker zur Nutzung im Chat hinzufügen oder teilen.';

  @override
  String get emoteShortcode => 'Emoticon-Kürzel';

  @override
  String get emoteWarnNeedToPick => 'Wähle ein Emoticon-Kürzel und ein Bild!';

  @override
  String get emptyChat => 'Leerer Chat';

  @override
  String get enableEmotesGlobally => 'Aktiviere Emoticon-Bündel global';

  @override
  String get enableEncryption => 'Verschlüsselung anschalten';

  @override
  String get enableEncryptionWarning =>
      'Du wirst die Verschlüsselung nicht mehr ausstellen können. Bist Du sicher?';

  @override
  String get encrypted => 'Verschlüsselt';

  @override
  String get encryption => 'Verschlüsselung';

  @override
  String get encryptionNotEnabled => 'Verschlüsselung ist nicht aktiviert';

  @override
  String endedTheCall(String senderName) {
    return '$senderName hat den Anruf beendet';
  }

  @override
  String get enterAnEmailAddress => 'Gib eine E-Mail-Adresse ein';

  @override
  String get homeserver => 'Homeserver';

  @override
  String get enterYourHomeserver => 'Gib Deinen Homeserver ein';

  @override
  String errorObtainingLocation(String error) {
    return 'Fehler beim Suchen des Standortes: $error';
  }

  @override
  String get everythingReady => 'Alles fertig!';

  @override
  String get extremeOffensive => 'Extrem beleidigend';

  @override
  String get fileName => 'Dateiname';

  @override
  String get rechainonline => 'rechainonline';

  @override
  String get fontSize => 'Schriftgröße';

  @override
  String get forward => 'Weiterleiten';

  @override
  String get fromJoining => 'Ab dem Beitritt';

  @override
  String get fromTheInvitation => 'Ab der Einladung';

  @override
  String get goToTheNewRoom => 'Zum neuen Raum wechseln';

  @override
  String get group => 'Gruppe';

  @override
  String get chatDescription => 'Chatbeschreibung';

  @override
  String get chatDescriptionHasBeenChanged => 'Chatbeschreibung geändert';

  @override
  String get groupIsPublic => 'Öffentliche Gruppe';

  @override
  String get groups => 'Gruppen';

  @override
  String groupWith(String displayname) {
    return 'Gruppe mit $displayname';
  }

  @override
  String get guestsAreForbidden => 'Gäste sind verboten';

  @override
  String get guestsCanJoin => 'Gäste dürfen beitreten';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username hat die Einladung für $targetName zurückgezogen';
  }

  @override
  String get help => 'Hilfe';

  @override
  String get hideRedactedEvents => 'Gelöschte Nachrichten ausblenden';

  @override
  String get hideRedactedMessages => 'Geschwärzte Nachrichten verstecken';

  @override
  String get hideRedactedMessagesBody =>
      'Wenn jemand eine Nachricht schwärzt/löscht, dann wird diese Nachricht im Chat nicht mehr sichtbar sein.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Ungültige und unbekannte Nachrichten-Formate ausblenden';

  @override
  String get howOffensiveIsThisContent => 'Wie beleidigend ist dieser Inhalt?';

  @override
  String get id => 'ID';

  @override
  String get identity => 'Identität';

  @override
  String get block => 'Blockieren';

  @override
  String get blockedUsers => 'Blockierte Benutzer';

  @override
  String get blockListDescription =>
      'Du kannst Benutzer blockieren, die dich stören. Von Benutzern auf deiner persönlichen Blocklierliste kannst du keine Nachrichten oder Raumeinladungen mehr erhalten.';

  @override
  String get blockUsername => 'Blockiere Benutzername';

  @override
  String get iHaveClickedOnLink => 'Ich habe den Link angeklickt';

  @override
  String get incorrectPassphraseOrKey =>
      'Falsches Passwort oder Wiederherstellungsschlüssel';

  @override
  String get inoffensive => 'Harmlos';

  @override
  String get inviteContact => 'Kontakt einladen';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return 'Willst du $contact zum Chat $groupName einladen?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Kontakt in die Gruppe $groupName einladen';
  }

  @override
  String get noChatDescriptionYet => 'Noch keine Chatbeschreibung vorhanden.';

  @override
  String get tryAgain => 'Neuer Versuch';

  @override
  String get invalidServerName => 'Ungültiger Servername';

  @override
  String get invited => 'Eingeladen';

  @override
  String get redactMessageDescription =>
      'Die Nachricht wird für alle Teilnehmer dieses Gesprächs gelöscht. Dies kann nicht rückgängig gemacht werden.';

  @override
  String get optionalRedactReason =>
      '(Optional) Grund für die Löschung dieser Nachricht...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username hat $targetName eingeladen';
  }

  @override
  String get invitedUsersOnly => 'Nur eingeladene Mitglieder';

  @override
  String get inviteForMe => 'Einladung für mich';

  @override
  String inviteText(String username, String link) {
    return '$username hat Dich zu REChain eingeladen. \n1. Gehe auf online.rechain.network und installiere die App \n2. Melde Dich in der App an \n3. Öffne den Einladungslink: \n $link';
  }

  @override
  String get isTyping => 'schreibt …';

  @override
  String joinedTheChat(String username) {
    return '👋 $username ist dem Chat beigetreten';
  }

  @override
  String get joinRoom => 'Raum beitreten';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username hat $targetName hinausgeworfen';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username hat $targetName hinausgeworfen und verbannt';
  }

  @override
  String get kickFromChat => 'Aus dem Chat hinauswerfen';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Zuletzt aktiv: $localizedTimeShort';
  }

  @override
  String get leave => 'Verlassen';

  @override
  String get leftTheChat => 'Hat den Chat verlassen';

  @override
  String get license => 'Lizenz';

  @override
  String get lightTheme => 'Hell';

  @override
  String loadCountMoreParticipants(int count) {
    return '$count weitere Mitglieder laden';
  }

  @override
  String get dehydrate => 'Sitzung exportieren und Gerät löschen';

  @override
  String get dehydrateWarning =>
      'Diese Aktion kann nicht rückgängig gemacht werden. Stelle sicher, dass du die Sicherungsdatei sicher aufbewahrst.';

  @override
  String get dehydrateTor => 'TOR-Benutzer: Sitzung exportieren';

  @override
  String get dehydrateTorLong =>
      'Für TOR-Benutzer wird empfohlen, die Sitzung zu exportieren, bevor das Fenster geschlossen wird.';

  @override
  String get hydrateTor => 'TOR-Benutzer: Session-Export importieren';

  @override
  String get hydrateTorLong =>
      'Hast du deine Sitzung das letzte Mal auf TOR exportiert? Importiere sie schnell und chatte weiter.';

  @override
  String get hydrate => 'Aus Sicherungsdatei wiederherstellen';

  @override
  String get loadingPleaseWait => 'Lade … Bitte warten.';

  @override
  String get loadMore => 'Mehr laden …';

  @override
  String get locationDisabledNotice =>
      'Standort ist deaktiviert. Bitte aktivieren, um den Standort teilen zu können.';

  @override
  String get locationPermissionDeniedNotice =>
      'Standort-Berechtigung wurde abgelehnt. Bitte akzeptieren, um den Standort teilen zu können.';

  @override
  String get login => 'Anmelden';

  @override
  String logInTo(String homeserver) {
    return 'Bei $homeserver anmelden';
  }

  @override
  String get logout => 'Abmelden';

  @override
  String get memberChanges => 'Änderungen der Mitglieder';

  @override
  String get mention => 'Erwähnen';

  @override
  String get messages => 'Nachrichten';

  @override
  String get messagesStyle => 'Nachrichten:';

  @override
  String get moderator => 'Moderator';

  @override
  String get muteChat => 'Stummschalten';

  @override
  String get needPantalaimonWarning =>
      'Bitte beachte, dass du Pantalaimon brauchst, um Ende-zu-Ende-Verschlüsselung benutzen zu können.';

  @override
  String get newChat => 'Neuer Chat';

  @override
  String get newMessageInrechainonline => '💬 Neue Nachricht in rechainonline';

  @override
  String get newVerificationRequest => 'Neue Verifikationsanfrage!';

  @override
  String get next => 'Weiter';

  @override
  String get no => 'Nein';

  @override
  String get noConnectionToTheServer => 'Keine Verbindung zum Server';

  @override
  String get noEmotesFound => 'Keine Emoticons gefunden. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Du kannst die Verschlüsselung erst aktivieren, sobald dieser Raum nicht mehr öffentlich zugänglich ist.';

  @override
  String get noGoogleServicesWarning =>
      'Firebase Cloud Messaging scheint auf deinem Gerät nicht verfügbar zu sein. Um trotzdem Push-Benachrichtigungen zu erhalten, empfehlen wir die Installation von ntfy. Mit ntfy oder einem anderen Unified-Push-Anbieter kannst du Push-Benachrichtigungen datensicher empfangen. Du kannst ntfy im PlayStore oder bei F-Droid herunterladen.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 ist kein REChain-Server, stattdessen $server2 benutzen?';
  }

  @override
  String get shareInviteLink => 'Einladungslink teilen';

  @override
  String get scanQrCode => 'QR-Code scannen';

  @override
  String get none => 'Keiner';

  @override
  String get noPasswordRecoveryDescription =>
      'Du hast bisher keine Möglichkeit hinzugefügt, um dein Passwort zurückzusetzen.';

  @override
  String get noPermission => 'Keine Berechtigung';

  @override
  String get noRoomsFound => 'Keine Räume gefunden …';

  @override
  String get notifications => 'Benachrichtigungen';

  @override
  String get notificationsEnabledForThisAccount =>
      'Benachrichtigungen für dieses Konto aktiviert';

  @override
  String numUsersTyping(int count) {
    return '$count Mitglieder schreiben …';
  }

  @override
  String get obtainingLocation => 'Standort wird ermittelt …';

  @override
  String get offensive => 'Beleidigend';

  @override
  String get offline => 'Offline';

  @override
  String get ok => 'Ok';

  @override
  String get online => 'Online';

  @override
  String get onlineKeyBackupEnabled =>
      'Online-Schlüsselsicherung ist aktiviert';

  @override
  String get oopsPushError =>
      'Hoppla! Leider ist beim Einrichten der Push-Benachrichtigungen ein Fehler aufgetreten.';

  @override
  String get oopsSomethingWentWrong => 'Hoppla, da ist etwas schiefgelaufen…';

  @override
  String get openAppToReadMessages => 'App öffnen, um Nachrichten zu lesen';

  @override
  String get openCamera => 'Kamera öffnen';

  @override
  String get openVideoCamera => 'Video aufnehmen';

  @override
  String get oneClientLoggedOut => 'Einer deiner Clients wurde abgemeldet';

  @override
  String get addAccount => 'Konto hinzufügen';

  @override
  String get editBundlesForAccount => 'Bundles für dieses Konto bearbeiten';

  @override
  String get addToBundle => 'Zu einem Bundle hinzufügen';

  @override
  String get removeFromBundle => 'Von diesem Bundle entfernen';

  @override
  String get bundleName => 'Name des Bundles';

  @override
  String get enableMultiAccounts =>
      '(BETA) Aktiviere Multi-Accounts für dieses Gerät';

  @override
  String get openInMaps => 'In Maps öffnen';

  @override
  String get link => 'Link';

  @override
  String get serverRequiresEmail =>
      'Dieser Server muss deine E-Mail-Adresse für die Registrierung überprüfen.';

  @override
  String get or => 'Oder';

  @override
  String get participant => 'Mitglied';

  @override
  String get passphraseOrKey => 'Passwort oder Wiederherstellungsschlüssel';

  @override
  String get password => 'Passwort';

  @override
  String get passwordForgotten => 'Passwort vergessen';

  @override
  String get passwordHasBeenChanged => 'Passwort wurde geändert';

  @override
  String get hideMemberChangesInPublicChats =>
      'Mitglieder-Änderungen in öffentlichen Chats ausblenden';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      'Zeige keine Beitritt- oder Verlassen-Ereignisse von Mitgliedern in der Timeline an, um die Lesbarkeit in öffentlichen Chats zu verbessern.';

  @override
  String get overview => 'Übersicht';

  @override
  String get notifyMeFor => 'Benachrichtige mich für';

  @override
  String get passwordRecoverySettings =>
      'Passwort-Wiederherstellungs-Einstellungen';

  @override
  String get passwordRecovery => 'Passwort wiederherstellen';

  @override
  String get people => 'Personen';

  @override
  String get pickImage => 'Bild wählen';

  @override
  String get pin => 'Anpinnen';

  @override
  String play(String fileName) {
    return '$fileName abspielen';
  }

  @override
  String get pleaseChoose => 'Bitte wählen';

  @override
  String get pleaseChooseAPasscode => 'Bitte einen Code festlegen';

  @override
  String get pleaseClickOnLink =>
      'Bitte auf den Link in der E-Mail klicken und dann fortfahren.';

  @override
  String get pleaseEnter4Digits =>
      'Bitte 4 Ziffern eingeben oder leer lassen, um die Anwendungssperre zu deaktivieren.';

  @override
  String get pleaseEnterRecoveryKey =>
      'Bitte gib deinen Wiederherstellungsschlüssel ein:';

  @override
  String get pleaseEnterYourPassword => 'Bitte dein Passwort eingeben';

  @override
  String get pleaseEnterYourPin => 'Bitte gib deine Pin ein';

  @override
  String get pleaseEnterYourUsername => 'Bitte deinen Benutzernamen eingeben';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Bitte folge den Anweisungen auf der Website und tippe auf Weiter.';

  @override
  String get privacy => 'Privatsphäre';

  @override
  String get publicRooms => 'Öffentliche Räume';

  @override
  String get pushRules => 'Push-Regeln';

  @override
  String get reason => 'Grund';

  @override
  String get recording => 'Aufnahme';

  @override
  String redactedBy(String username) {
    return 'Gelöscht von $username';
  }

  @override
  String get directChat => 'Privater Chat';

  @override
  String redactedByBecause(String username, String reason) {
    return 'Gelöscht von $username weil: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username hat ein Ereignis gelöscht';
  }

  @override
  String get redactMessage => 'Nachricht löschen';

  @override
  String get register => 'Registrieren';

  @override
  String get reject => 'Ablehnen';

  @override
  String rejectedTheInvitation(String username) {
    return '$username hat die Einladung abgelehnt';
  }

  @override
  String get rejoin => 'Wieder beitreten';

  @override
  String get removeAllOtherDevices => 'Alle anderen Geräte entfernen';

  @override
  String removedBy(String username) {
    return 'Entfernt von $username';
  }

  @override
  String get removeDevice => 'Gerät entfernen';

  @override
  String get unbanFromChat => 'Verbannung aufheben';

  @override
  String get removeYourAvatar => 'Deinen Avatar löschen';

  @override
  String get replaceRoomWithNewerVersion => 'Raum mit neuer Version ersetzen';

  @override
  String get reply => 'Antworten';

  @override
  String get reportMessage => 'Nachricht melden';

  @override
  String get requestPermission => 'Berechtigung anfragen';

  @override
  String get roomHasBeenUpgraded => 'Der Raum wurde ge-upgraded';

  @override
  String get roomVersion => 'Raumversion';

  @override
  String get saveFile => 'Datei speichern';

  @override
  String get search => 'Suchen';

  @override
  String get security => 'Sicherheit';

  @override
  String get recoveryKey => 'Wiederherstellungs-Schlüssel';

  @override
  String get recoveryKeyLost => 'Wiederherstellungsschlüssel verloren?';

  @override
  String seenByUser(String username) {
    return 'Gelesen von $username';
  }

  @override
  String get send => 'Senden';

  @override
  String get sendAMessage => 'Nachricht schreiben';

  @override
  String get sendAsText => 'Sende als Text';

  @override
  String get sendAudio => 'Sende Audiodatei';

  @override
  String get sendFile => 'Datei senden';

  @override
  String get sendImage => 'Bild senden';

  @override
  String sendImages(int count) {
    return 'Sende $count Bilder';
  }

  @override
  String get sendMessages => 'Nachrichten senden';

  @override
  String get sendOriginal => 'Sende Original';

  @override
  String get sendSticker => 'Sticker senden';

  @override
  String get sendVideo => 'Sende Video';

  @override
  String sentAFile(String username) {
    return '📁 $username hat eine Datei gesendet';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username hat eine Audio-Datei gesendet';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username hat ein Bild gesendet';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username hat einen Sticker gesendet';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username hat ein Video gesendet';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName hat Anrufinformationen geschickt';
  }

  @override
  String get separateChatTypes => 'Separate Direktchats und Gruppen';

  @override
  String get setAsCanonicalAlias => 'Als Haupt-Alias festlegen';

  @override
  String get setCustomEmotes => 'Eigene Emoticons einstellen';

  @override
  String get setChatDescription => 'Chatbeschreibung festlegen';

  @override
  String get setInvitationLink => 'Einladungslink festlegen';

  @override
  String get setPermissionsLevel => 'Berechtigungsstufe einstellen';

  @override
  String get setStatus => 'Status ändern';

  @override
  String get settings => 'Einstellungen';

  @override
  String get share => 'Teilen';

  @override
  String sharedTheLocation(String username) {
    return '$username hat den Standort geteilt';
  }

  @override
  String get shareLocation => 'Standort teilen';

  @override
  String get showPassword => 'Passwort anzeigen';

  @override
  String get presenceStyle => 'Statusmeldungen:';

  @override
  String get presencesToggle => 'Status-Nachrichten anderer Benutzer anzeigen';

  @override
  String get singlesignon => 'Einmalige Anmeldung';

  @override
  String get skip => 'Überspringe';

  @override
  String get sourceCode => 'Quellcode';

  @override
  String get spaceIsPublic => 'Space ist öffentlich';

  @override
  String get spaceName => 'Space-Name';

  @override
  String startedACall(String senderName) {
    return '$senderName hat einen Anruf getätigt';
  }

  @override
  String get startFirstChat => 'Starte deinen ersten Chat';

  @override
  String get status => 'Status';

  @override
  String get statusExampleMessage => 'Wie geht es dir heute?';

  @override
  String get submit => 'Absenden';

  @override
  String get synchronizingPleaseWait => 'Synchronisiere... Bitte warten.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Synchronisierung… ($percentage%)';
  }

  @override
  String get systemTheme => 'System';

  @override
  String get theyDontMatch => 'Stimmen nicht überein';

  @override
  String get theyMatch => 'Stimmen überein';

  @override
  String get title => 'rechainonline';

  @override
  String get toggleFavorite => 'Favorite umschalten';

  @override
  String get toggleMuted => 'Stummgeschaltete umschalten';

  @override
  String get toggleUnread => 'Markieren als gelesen/ungelesen';

  @override
  String get tooManyRequestsWarning =>
      'Zu viele Anfragen. Bitte versuche es später noch einmal!';

  @override
  String get transferFromAnotherDevice => 'Von anderem Gerät übertragen';

  @override
  String get tryToSendAgain => 'Noch mal versuchen zu senden';

  @override
  String get unavailable => 'Nicht verfügbar';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username hat die Verbannung von $targetName aufgehoben';
  }

  @override
  String get unblockDevice => 'Geräteblockierung aufheben';

  @override
  String get unknownDevice => 'Unbekanntes Gerät';

  @override
  String get unknownEncryptionAlgorithm =>
      'Unbekannter Verschlüsselungsalgorithmus';

  @override
  String unknownEvent(String type) {
    return 'Unbekanntes Ereignis \'$type\'';
  }

  @override
  String get unmuteChat => 'Stumm aus';

  @override
  String get unpin => 'Nicht mehr anpinnen';

  @override
  String unreadChats(int unreadCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount ungelesene Unterhaltungen',
      one: '1 ungelesene Unterhaltung',
    );
    return '$_temp0';
  }

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username und $count andere schreiben …';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username und $username2 schreiben …';
  }

  @override
  String userIsTyping(String username) {
    return '$username schreibt …';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username hat den Chat verlassen';
  }

  @override
  String get username => 'Benutzername';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username hat ein $type-Ereignis gesendet';
  }

  @override
  String get unverified => 'Unverifiziert';

  @override
  String get verified => 'Verifiziert';

  @override
  String get verify => 'Verifizieren';

  @override
  String get verifyStart => 'Starte Verifikation';

  @override
  String get verifySuccess => 'Erfolgreich verifiziert!';

  @override
  String get verifyTitle => 'Anderes Konto wird verifiziert';

  @override
  String get videoCall => 'Videoanruf';

  @override
  String get visibilityOfTheChatHistory => 'Sichtbarkeit des Chat-Verlaufs';

  @override
  String get visibleForAllParticipants => 'Sichtbar für alle Mitglieder';

  @override
  String get visibleForEveryone => 'Für jeden sichtbar';

  @override
  String get voiceMessage => 'Sprachnachricht';

  @override
  String get waitingPartnerAcceptRequest =>
      'Warte darauf, dass der Partner die Anfrage annimmt …';

  @override
  String get waitingPartnerEmoji =>
      'Warte darauf, dass der Partner die Emoji annimmt …';

  @override
  String get waitingPartnerNumbers =>
      'Warten, dass der Partner die Zahlen annimmt …';

  @override
  String get wallpaper => 'Hintergrund:';

  @override
  String get warning => 'Achtung!';

  @override
  String get weSentYouAnEmail => 'Wir haben dir eine E-Mail gesendet';

  @override
  String get whoCanPerformWhichAction => 'Wer kann welche Aktion ausführen';

  @override
  String get whoIsAllowedToJoinThisGroup => 'Wer darf der Gruppe beitreten';

  @override
  String get whyDoYouWantToReportThis => 'Warum willst du dies melden?';

  @override
  String get wipeChatBackup =>
      'Den Chat-Backup löschen, um einen neuen Wiederherstellungsschlüssel zu erstellen?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Mit diesen Adressen kannst du dein Passwort wiederherstellen, wenn du es vergessen hast.';

  @override
  String get writeAMessage => 'Schreibe eine Nachricht …';

  @override
  String get yes => 'Ja';

  @override
  String get you => 'Du';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Du bist kein Mitglied mehr in diesem Chat';

  @override
  String get youHaveBeenBannedFromThisChat =>
      'Du wurdest aus dem Chat verbannt';

  @override
  String get yourPublicKey => 'Dein öffentlicher Schlüssel';

  @override
  String get messageInfo => 'Nachrichten-Info';

  @override
  String get time => 'Zeit';

  @override
  String get messageType => 'Nachrichtentyp';

  @override
  String get sender => 'Absender:in';

  @override
  String get openGallery => 'Galerie öffnen';

  @override
  String get removeFromSpace => 'Aus dem Space entfernen';

  @override
  String get addToSpaceDescription =>
      'Wähle einen Space aus, um diesen Chat hinzuzufügen.';

  @override
  String get start => 'Start';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'Um deine alten Nachrichten zu entsperren, gib bitte den Wiederherstellungsschlüssel ein, der in einer früheren Sitzung generiert wurde. Dein Wiederherstellungsschlüssel ist NICHT dein Passwort.';

  @override
  String get publish => 'Veröffentlichen';

  @override
  String videoWithSize(String size) {
    return 'Video ($size)';
  }

  @override
  String get openChat => 'Chat öffnen';

  @override
  String get markAsRead => 'Als gelesen markiert';

  @override
  String get reportUser => 'Benutzer melden';

  @override
  String get dismiss => 'Verwerfen';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender reagierte mit $reaction';
  }

  @override
  String get pinMessage => 'An Raum anheften';

  @override
  String get confirmEventUnpin =>
      'Möchtest du das Ereignis wirklich dauerhaft lösen?';

  @override
  String get emojis => 'Emojis';

  @override
  String get placeCall => 'Anruf tätigen';

  @override
  String get voiceCall => 'Sprachanruf';

  @override
  String get unsupportedAndroidVersion => 'Nicht unterstützte Android-Version';

  @override
  String get unsupportedAndroidVersionLong =>
      'Diese Funktion erfordert eine neuere Android-Version. Bitte suche nach Updates oder prüfe die Mobile Katya-OS-Unterstützung.';

  @override
  String get videoCallsBetaWarning =>
      'Bitte beachte, dass sich Videoanrufe derzeit in der Beta-Phase befinden. Sie funktionieren möglicherweise nicht wie erwartet oder überhaupt nicht auf allen Plattformen.';

  @override
  String get experimentalVideoCalls => 'Experimentelle Videoanrufe';

  @override
  String get emailOrUsername => 'E-Mail oder Benutzername';

  @override
  String get indexedDbErrorTitle => 'Probleme im Privatmodus';

  @override
  String get indexedDbErrorLong =>
      'Die Nachrichtenspeicherung ist im privaten Modus standardmäßig leider nicht aktiviert.\nBitte besuche\n- about:config\n- Setze dom.indexedDB.privateBrowsing.enabled auf true\nAndernfalls ist es nicht möglich, REChain auszuführen.';

  @override
  String switchToAccount(String number) {
    return 'Zu Konto $number wechseln';
  }

  @override
  String get nextAccount => 'Nächstes Konto';

  @override
  String get previousAccount => 'Vorheriges Konto';

  @override
  String get addWidget => 'Widget hinzufügen';

  @override
  String get widgetVideo => 'Video';

  @override
  String get widgetEtherpad => 'Textnotiz';

  @override
  String get widgetJitsi => 'Jitsi Meet';

  @override
  String get widgetCustom => 'Angepasst';

  @override
  String get widgetName => 'Name';

  @override
  String get widgetUrlError => 'Das ist keine gültige URL.';

  @override
  String get widgetNameError => 'Bitte gib einen Anzeigenamen an.';

  @override
  String get errorAddingWidget => 'Fehler beim Hinzufügen des Widgets.';

  @override
  String get youRejectedTheInvitation => 'Du hast die Einladung abgelehnt';

  @override
  String get youJoinedTheChat => 'Du bist dem Chat beigetreten';

  @override
  String get youAcceptedTheInvitation => '👍 Du hast die Einladung angenommen';

  @override
  String youBannedUser(String user) {
    return 'Du hast den $user verbannt';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Du hast die Einladung für $user zurückgezogen';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 Du wurdest per Link eingeladen zu:\n$alias';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 Du wurdest von $user eingeladen';
  }

  @override
  String invitedBy(String user) {
    return '📩 Eingeladen von $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Du hast $user eingeladen';
  }

  @override
  String youKicked(String user) {
    return '👞 Du hast $user rausgeworfen';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Du hast $user rausgeworfen und verbannt';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Du hast die Verbannung von $user rückgängig gemacht';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user hat angeklopft';
  }

  @override
  String get usersMustKnock => 'Benutzer müssen anklopfen';

  @override
  String get noOneCanJoin => 'Niemand kann beitreten';

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user würde dem Chat gerne beitreten.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'Es wurde noch kein öffentlicher Link erstellt';

  @override
  String get knock => 'Anklopfen';

  @override
  String get users => 'Benutzer';

  @override
  String get unlockOldMessages => 'Entsperre alte Nachrichten';

  @override
  String get storeInSecureStorageDescription =>
      'Speicher den Wiederherstellungsschlüssel im sicheren Speicher dieses Geräts.';

  @override
  String get saveKeyManuallyDescription =>
      'Speicher diesen Schlüssel manuell, indem du den Systemfreigabedialog oder die Zwischenablage auslöst.';

  @override
  String get storeInAndroidKeystore => 'Im Android KeyStore speichern';

  @override
  String get storeInAppleKeyChain => 'Im Apple KeyChain speichern';

  @override
  String get storeSecurlyOnThisDevice => 'Auf diesem Gerät sicher speichern';

  @override
  String countFiles(int count) {
    return '$count Dateien';
  }

  @override
  String get user => 'Benutzer';

  @override
  String get custom => 'Benutzerdefiniert';

  @override
  String get foregroundServiceRunning =>
      'Diese Benachrichtigung wird angezeigt, wenn der Vordergrunddienst ausgeführt wird.';

  @override
  String get screenSharingTitle => 'Bildschirm teilen';

  @override
  String get screenSharingDetail => 'Du teilst deinen Bildschirm in FuffyChat';

  @override
  String get callingPermissions => 'Anrufberechtigungen';

  @override
  String get callingAccount => 'Anrufkonto';

  @override
  String get callingAccountDetails =>
      'Ermöglicht REChain, die native Android-Dialer-App zu verwenden.';

  @override
  String get appearOnTop => 'Oben erscheinen';

  @override
  String get appearOnTopDetails =>
      'Ermöglicht, dass die App oben angezeigt wird (nicht erforderlich, wenn du REChain bereits als Anrufkonto eingerichtet haben)';

  @override
  String get otherCallingPermissions =>
      'Mikrofon, Kamera und andere REChain-Berechtigungen';

  @override
  String get whyIsThisMessageEncrypted =>
      'Warum ist diese Nachricht nicht lesbar?';

  @override
  String get noKeyForThisMessage =>
      'Dies kann passieren, wenn die Nachricht gesendet wurde, bevor du dich auf diesem Gerät bei deinem Konto angemeldet hast.\n\nEs ist auch möglich, dass der Absender dein Gerät blockiert hat oder etwas mit der Internetverbindung schief gelaufen ist.\n\nKannst du die Nachricht in einer anderen Sitzung lesen? Dann kannst du die Nachricht davon übertragen! Gehe zu den Einstellungen > Geräte und vergewissere dich, dass sich deine Geräte gegenseitig verifiziert haben. Wenn du den Raum das nächste Mal öffnest und beide Sitzungen im Vordergrund sind, werden die Schlüssel automatisch übertragen.\n\nDu möchtest die Schlüssel beim Abmelden oder Gerätewechsel nicht verlieren? Stelle sicher, dass du das Chat-Backup in den Einstellungen aktiviert hast.';

  @override
  String get newGroup => 'Neue Gruppe';

  @override
  String get newSpace => 'Neuer Space';

  @override
  String get enterSpace => 'Raum betreten';

  @override
  String get enterRoom => 'Raum betreten';

  @override
  String get allSpaces => 'Alle Spaces';

  @override
  String numChats(String number) {
    return '$number Chats';
  }

  @override
  String get hideUnimportantStateEvents =>
      'Blende unwichtige Zustandsereignisse aus';

  @override
  String get hidePresences => 'Status-Liste verbergen?';

  @override
  String get doNotShowAgain => 'Nicht mehr anzeigen';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Leerer Chat (war $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Mit Spaces kannst du deine Chats zusammenfassen und private oder öffentliche Communities aufbauen.';

  @override
  String get encryptThisChat => 'Diesen Chat verschlüsseln';

  @override
  String get disableEncryptionWarning =>
      'Aus Sicherheitsgründen kannst du die Verschlüsselung in einem Chat nicht deaktivieren, wo sie zuvor aktiviert wurde.';

  @override
  String get sorryThatsNotPossible => 'Sorry ... das ist nicht möglich';

  @override
  String get deviceKeys => 'Geräteschlüssel:';

  @override
  String get reopenChat => 'Chat wieder eröffnen';

  @override
  String get noBackupWarning =>
      'Achtung! Ohne Aktivierung des Chat-Backups verlierst du den Zugriff auf deine verschlüsselten Nachrichten. Vor dem Ausloggen wird dringend empfohlen, das Chat-Backup zu aktivieren.';

  @override
  String get noOtherDevicesFound => 'Keine anderen Geräte anwesend';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Kann nicht gesendet werden! Der Server unterstützt nur Anhänge bis höchstens $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Datei wurde gespeichert unter $path';
  }

  @override
  String get jumpToLastReadMessage => 'Zur letzten ungelesenen Nachricht';

  @override
  String get readUpToHere => 'Bis hier gelesen';

  @override
  String get jump => 'Springen';

  @override
  String get openLinkInBrowser => 'Link im Browser öffnen';

  @override
  String get reportErrorDescription =>
      '😭 Oh nein. Etwas ist schief gelaufen. Wenn du möchtest, kannst du den Bug bei den Entwicklern melden.';

  @override
  String get report => 'Melden';

  @override
  String get signInWithPassword => 'Anmelden mit Passwort';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Bitte versuche es später noch einmal oder wähle einen anderen Server.';

  @override
  String signInWith(String provider) {
    return 'Anmelden mit $provider';
  }

  @override
  String get profileNotFound =>
      'Der Benutzer konnte auf dem Server nicht gefunden werden. Vielleicht gibt es ein Verbindungsproblem oder der Benutzer existiert nicht.';

  @override
  String get setTheme => 'Design festlegen:';

  @override
  String get setColorTheme => 'Farbdesign einstellen:';

  @override
  String get invite => 'Einladen';

  @override
  String get inviteGroupChat => '📨 Einladungen zum Gruppenchat';

  @override
  String get invitePrivateChat => '📨 Einladungen zum privaten Chat';

  @override
  String get invalidInput => 'Ungültige Eingabe!';

  @override
  String wrongPinEntered(int seconds) {
    return 'Falsche PIN eingegeben! Bitte in $seconds Sekunden erneut versuchen ...';
  }

  @override
  String get pleaseEnterANumber => 'Bitte eine Zahl größer 0 eingeben';

  @override
  String get archiveRoomDescription =>
      'Der Chat wird in das Archiv verschoben. Andere Benutzer können sehen, dass du den Chat verlassen hast.';

  @override
  String get roomUpgradeDescription =>
      'Der Chat wird dann mit der neuen Raumversion neu erstellt. Alle Teilnehmer werden benachrichtigt, dass sie zum neuen Chat wechseln müssen. Mehr über Raumversionen erfährst du unter https://github.com/sorydima/REChain-/tree/main/matrix_bridge_setup_bundle';

  @override
  String get removeDevicesDescription =>
      'Du wirst von diesem Gerät abgemeldet und kannst dann dort keine Nachrichten mehr empfangen.';

  @override
  String get banUserDescription =>
      'Der Benutzer wird aus dem Chat gebannt und kann den Chat erst wieder betreten, wenn die Verbannung aufgehoben wird.';

  @override
  String get unbanUserDescription =>
      'Der Benutzer kann den Chat dann wieder betreten, wenn er es versucht.';

  @override
  String get kickUserDescription =>
      'Der Benutzer wird aus dem Chat geworfen, aber nicht gebannt. In öffentlichen Chats kann der Benutzer jederzeit wieder beitreten.';

  @override
  String get makeAdminDescription =>
      'Sobald du diesen Benutzer zum Administrator gemacht hast, kannst du das möglicherweise nicht mehr rückgängig machen, da er dann über dieselben Berechtigungen wie du verfügt.';

  @override
  String get pushNotificationsNotAvailable =>
      'Push-Benachrichtigungen nicht verfügbar';

  @override
  String get learnMore => 'Erfahre mehr';

  @override
  String get yourGlobalUserIdIs => 'Deine globale Benutzer-ID ist: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Leider konnte mit \"$query\" kein Benutzer gefunden werden. Bitte schau nach, ob dir ein Tippfehler unterlaufen ist.';
  }

  @override
  String get knocking => 'Klopft';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Chat kann über die Suche auf $server gefunden werden';
  }

  @override
  String get searchChatsRooms => 'Suche nach #Chats, @Nutzer ...';

  @override
  String get nothingFound => 'Nichts gefunden ...';

  @override
  String get groupName => 'Gruppenname';

  @override
  String get createGroupAndInviteUsers =>
      'Gruppe erstellen und Nutzer einladen';

  @override
  String get groupCanBeFoundViaSearch =>
      'Gruppe kann über die Suche gefunden werden';

  @override
  String get wrongRecoveryKey =>
      'Entschuldigung ... das scheint nicht der richtige Wiederherstellungsschlüssel zu sein.';

  @override
  String get startConversation => 'Unterhaltung starten';

  @override
  String get commandHint_sendraw => 'Rohes JSON senden';

  @override
  String get databaseMigrationTitle => 'Datenbank wird optimiert';

  @override
  String get databaseMigrationBody =>
      'Bitte warten. Dies kann einen Moment dauern.';

  @override
  String get leaveEmptyToClearStatus =>
      'Leer lassen, um den Status zu löschen.';

  @override
  String get select => 'Auswählen';

  @override
  String get searchForUsers => 'Suche nach @benutzer ...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Bitte dein aktuelles Passwort eingeben';

  @override
  String get newPassword => 'Neues Passwort';

  @override
  String get pleaseChooseAStrongPassword => 'Bitte wähle ein starkes Passwort';

  @override
  String get passwordsDoNotMatch => 'Passwörter stimmen nicht überein';

  @override
  String get passwordIsWrong => 'Dein eingegebenes Passwort ist falsch';

  @override
  String get publicLink => 'Öffentlicher Link';

  @override
  String get publicChatAddresses => 'Öffentliche Chat-Adressen';

  @override
  String get createNewAddress => 'Neue Adresse erstellen';

  @override
  String get joinSpace => 'Space beitreten';

  @override
  String get publicSpaces => 'Öffentliche Spaces';

  @override
  String get addChatOrSubSpace => 'Chat oder Sub-Space hinzufügen';

  @override
  String get subspace => 'Sub-Space';

  @override
  String get decline => 'Ablehnen';

  @override
  String get thisDevice => 'Dieses Gerät:';

  @override
  String get initAppError => 'Beim Starten der App ist ein Fehler aufgetreten';

  @override
  String get userRole => 'Benutzerrolle';

  @override
  String minimumPowerLevel(String level) {
    return '$level is das minimale Power-Level.';
  }

  @override
  String searchIn(String chat) {
    return 'In Chat \"$chat\" suchen ...';
  }

  @override
  String get searchMore => 'Weiter suchen ...';

  @override
  String get gallery => 'Galerie';

  @override
  String get files => 'Dateien';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return 'Die SQlite-Datenbank kann nicht erstellt werden. Die App versucht vorerst, die Legacy-Datenbank zu verwenden. Bitte melde diesen Fehler an die Entwickler unter $url. Die Fehlermeldung lautet: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'Die App versucht nun, deine Sitzung aus der Sicherung wiederherzustellen. Bitte melde diesen Fehler an die Entwickler unter $url. Die Fehlermeldung lautet: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Die App versucht nun, deine Sitzung aus der Sicherung wiederherzustellen. Bitte melde diesen Fehler an die Entwickler unter $url. Die Fehlermeldung lautet: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'Nachricht weiterleiten an $roomName?';
  }

  @override
  String get sendReadReceipts => 'Lesebestätigungen senden';

  @override
  String get sendTypingNotificationsDescription =>
      'Andere Teilnehmer in einem Chat können sehen, wenn du eine neue Nachricht tippst.';

  @override
  String get sendReadReceiptsDescription =>
      'Andere Teilnehmer in einem Chat können sehen, ob du eine Nachricht gelesen hast.';

  @override
  String get formattedMessages => 'Formatierte Nachrichten';

  @override
  String get formattedMessagesDescription =>
      'Formatierte Nachrichteninhalte wie fettgedruckten Text mit Markdown anzeigen.';

  @override
  String get verifyOtherUser => '🔐 Anderen Benutzer verifizieren';

  @override
  String get verifyOtherUserDescription =>
      'Wenn du einen anderen Benutzer verifizierst, kannst du sicher sein, dass du weißt, an wen du wirklich schreibst. 💪\n\nWenn du eine Verifizierung startest, wird dir und dem anderen Nutzer ein Popup in der App angezeigt. Dort siehst du dann eine Reihe von Emojis oder Zahlen, die ihr miteinander vergleichen müsst.\n\nDas geht am besten, wenn man sich trifft oder einen Videoanruf startet. 👭';

  @override
  String get verifyOtherDevice => '🔐 Anderes Gerät verifizieren';

  @override
  String get verifyOtherDeviceDescription =>
      'Wenn du ein anderes Gerät verifizieren, können diese Geräteschlüssel austauschen, was die Sicherheit insgesamt erhöht. 💪\n\nSobald du eine Verifizierung starten, erscheint ein Pop-up in der App auf beiden Geräten. Dort siehst du dann eine Reihe von Emojis oder Zahlen, die du miteinander vergleichen musst.\n\nAm besten hältst du beide Geräte bereit, bevor du die Verifizierung startest. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender hat die Schlüsselverifikation akzeptiert';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender hat die Schlüsselverifikation abgebrochen';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender hat die Schlüsselverifikation abgeschlossen';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender ist bereit für die Schlüsselverifikation';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender hat eine Schlüsselverifikation angefragt';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender hat die Schlüsselverifikation gestartet';
  }

  @override
  String get transparent => 'Transparent';

  @override
  String get incomingMessages => 'Eingehende Nachrichten';

  @override
  String get stickers => 'Sticker';

  @override
  String get discover => 'Entdecken';

  @override
  String get commandHint_ignore => 'Angegebene REChain-ID ignorieren';

  @override
  String get commandHint_unignore =>
      'Angegebene REChain-ID nicht mehr ignorieren';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread ungelesene Chats';
  }

  @override
  String get noDatabaseEncryption =>
      'Datenbankverschlüsselung wird auf dieser Plattform nicht unterstützt';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Im Augenblick werden $count Benutzer blockiert.';
  }

  @override
  String get restricted => 'Beschränkt';

  @override
  String get knockRestricted => 'Anklopfen beschränkt';

  @override
  String goToSpace(Object space) {
    return 'Geh zum Space: $space';
  }

  @override
  String get markAsUnread => 'Als ungelesen markieren';

  @override
  String userLevel(int level) {
    return '$level - Benutzer';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Moderator';
  }

  @override
  String adminLevel(int level) {
    return '$level - Administrator';
  }

  @override
  String get changeGeneralChatSettings =>
      'Allgemeine Chat-Einstellungen ändern';

  @override
  String get inviteOtherUsers => 'Lade andere Benutzer in diesen Chat ein';

  @override
  String get changeTheChatPermissions => 'Ändere die Chat-Berechtigungen';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Wechsele die Sichtbarkeit der Chat-Historie';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Ändern der Hauptadresse für den öffentlichen Chat';

  @override
  String get sendRoomNotifications => 'Sende eine @room-Benachrichtigung';

  @override
  String get changeTheDescriptionOfTheGroup => 'Chat-Beschreibung ändern';

  @override
  String get chatPermissionsDescription =>
      'Einstellen, welches Level für bestimmte Aktionen in diesem Chat erforderlich ist. Die Level 0, 50 und 100 stehen üblicherweise für Benutzer, Moderatoren und Admins, aber jede Abstufung ist möglich.';

  @override
  String updateInstalled(String version) {
    return '🎉 Update $version installiert!';
  }

  @override
  String get changelog => 'Änderungsprotokoll';

  @override
  String get sendCanceled => 'Senden abgebrochen';

  @override
  String get loginWithMatrixId => 'Mit REChain-ID anmelden';

  @override
  String get discoverHomeservers => 'Server suchen';

  @override
  String get whatIsAHomeserver => 'Was ist ein Homeserver?';

  @override
  String get homeserverDescription =>
      'Alle deine Daten werden auf einem Homeserver gespeichert, so wie bei einem E-Mail Anbieter. Du kannst aussuchen, welchen Homeserver du benutzen willst und kannst trotzdem mit allen kommunizieren. Erfahre mehr auf https://rechain.network.';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Scheint kein kompatibler Homeserver zu sein. Falsche URL?';

  @override
  String get calculatingFileSize => 'Dateigröße wird berechnet ...';

  @override
  String get prepareSendingAttachment => 'Anhang zum Senden vorbereiten ...';

  @override
  String get sendingAttachment => 'Anhang wird gesendet ...';

  @override
  String get generatingVideoThumbnail => 'Generiere Video-Vorschaubild ...';

  @override
  String get compressVideo => 'Video wird komprimiert ...';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return 'Sende Anhang $index von $length ...';
  }

  @override
  String serverLimitReached(int seconds) {
    return 'Server-Limit erreicht! Warte $seconds Sekunden ...';
  }

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Eines deiner Geräte ist nicht verifiziert';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Hinweis: Wenn du alle deine Geräte mit dem Chat-Backup verbindest, sind sie automatisch verifiziert.';

  @override
  String get continueText => 'Fortfahren';

  @override
  String get welcomeText =>
      'Hey Hey 👋 Das ist REChain. Du kannst sich bei jedem Homeserver anmelden, der mit https://rechain.network kompatibel ist. Und dann mit jedem chatten. Das hier ist ein riesiges dezentrales Nachrichtennetzwerk!';

  @override
  String get blur => 'Verwischen:';

  @override
  String get opacity => 'Deckkraft:';

  @override
  String get setWallpaper => 'Hintergrund ändern';

  @override
  String get manageAccount => 'Konto verwalten';

  @override
  String get noContactInformationProvided =>
      'Der Server stellt keine gültigen Kontaktinformationen bereit';

  @override
  String get contactServerAdmin => 'Serveradministrator kontaktieren';

  @override
  String get contactServerSecurity => 'Server-Sicherheit kontaktieren';

  @override
  String get supportPage => 'Support-Seite';

  @override
  String get serverInformation => 'Server-Informationen:';

  @override
  String get name => 'Name';

  @override
  String get version => 'Version';

  @override
  String get website => 'Website';

  @override
  String get compress => 'Komprimieren';

  @override
  String get boldText => 'Fetter Text';

  @override
  String get italicText => 'Kursiver Text';

  @override
  String get strikeThrough => 'Durchgestrichen';

  @override
  String get pleaseFillOut => 'Bitte ausfüllen';

  @override
  String get invalidUrl => 'Ungültige URL';

  @override
  String get addLink => 'Link hinzufügen';

  @override
  String get unableToJoinChat =>
      'Chat kann nicht beigetreten werden. Möglicherweise hat die Gegenseite das Gespräch bereits beendet.';

  @override
  String get previous => 'Vorige';

  @override
  String get otherPartyNotLoggedIn =>
      'Der User ist aktuell nicht eingeloggt und kann daher keine Nachrichten empfangen!';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Nutze \'$server\' um dich einzuloggen';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Hiermit erlaubst du der App und der Website, Informationen über dich weiterzugeben.';

  @override
  String get open => 'Offen';

  @override
  String get waitingForServer => 'Auf Server warten...';

  @override
  String get appIntroduction =>
      'Mit REChain kannst du über verschiedene Messenger hinweg mit deinen Freunden chatten. Erfahre mehr dazu auf https://rechain.network oder tippe einfach auf *Fortfahren*.';

  @override
  String get newChatRequest => '📩 Neue Chat-Anfrage';

  @override
  String get contentNotificationSettings =>
      'Einstellungen für Inhaltsbenachrichtigungen';

  @override
  String get generalNotificationSettings =>
      'Allgemeine Benachrichtigungseinstellungen';

  @override
  String get roomNotificationSettings =>
      'Einstellungen für Raumbenachrichtigungen';

  @override
  String get userSpecificNotificationSettings =>
      'Benutzerspezifische Benachrichtigungseinstellungen';

  @override
  String get otherNotificationSettings =>
      'Andere Benachrichtigungseinstellungen';

  @override
  String get notificationRuleContainsUserName => 'Enthält Benutzernamen';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Benachrichtigt den Benutzer, wenn eine Nachricht seinen Benutzernamen enthält.';

  @override
  String get notificationRuleMaster => 'Alle Benachrichtigungen stummschalten';

  @override
  String get notificationRuleMasterDescription =>
      'Setzt alle anderen Regeln außer Kraft und deaktiviert alle Benachrichtigungen.';

  @override
  String get notificationRuleSuppressNotices =>
      'Automatisierte Nachrichten unterdrücken';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Unterdrückt Benachrichtigungen von automatisierten Clients wie Bots.';

  @override
  String get notificationRuleInviteForMe => 'Einladung für mich';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Benachrichtigt den Benutzer, wenn er in einen Raum eingeladen wird.';

  @override
  String get notificationRuleMemberEvent => 'Mitgliederveranstaltung';

  @override
  String get notificationRuleMemberEventDescription =>
      'Unterdrückt Benachrichtigungen zu Mitgliedschaftsereignissen.';

  @override
  String get notificationRuleIsUserMention => 'Benutzererwähnung';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Benachrichtigt den Benutzer, wenn er in einer Nachricht direkt erwähnt wird.';

  @override
  String get notificationRuleContainsDisplayName => 'Enthält den Anzeigenamen';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Benachrichtigt den Benutzer, wenn eine Nachricht seinen Anzeigenamen enthält.';

  @override
  String get notificationRuleIsRoomMention => 'Chat-Erwähnung';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Benachrichtigt den Benutzer, wenn ein Raum erwähnt wird.';

  @override
  String get notificationRuleRoomnotif => 'Chat-Benachritigung';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Benachrichtigt den Benutzer, wenn eine Nachricht „@room“ enthält.';

  @override
  String get notificationRuleTombstone => 'Tombstone';

  @override
  String get notificationRuleTombstoneDescription =>
      'Benachrichtigt den Benutzer über Nachrichten zur Raumdeaktivierung.';

  @override
  String get notificationRuleReaction => 'Reaktion';

  @override
  String get notificationRuleReactionDescription =>
      'Unterdrückt Benachrichtigungen für Reaktionen.';

  @override
  String get notificationRuleRoomServerAcl => 'Raumserver-ACL';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Unterdrückt Benachrichtigungen für Raumserver-Zugriffskontrolllisten (ACL).';

  @override
  String get notificationRuleSuppressEdits => 'Unterdrückt Bearbeitungen';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Unterdrückt Benachrichtigungen für bearbeitete Nachrichten.';

  @override
  String get notificationRuleCall => 'Anruf';

  @override
  String get notificationRuleCallDescription =>
      'Benachrichtigt den Benutzer über Anrufe.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'Verschlüsselter Einzelchat';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Benachrichtigt den Benutzer über Nachrichten in verschlüsselten Eins-zu-Eins-Chats.';

  @override
  String get notificationRuleRoomOneToOne => 'Einzelchat';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Benachrichtigt den Benutzer über Nachrichten in Einzelchats.';

  @override
  String get notificationRuleMessage => 'Nachricht';

  @override
  String get notificationRuleMessageDescription =>
      'Informiert den Benutzer über allgemeine Nachrichten.';

  @override
  String get notificationRuleEncrypted => 'Verschlüsselt';

  @override
  String get notificationRuleEncryptedDescription =>
      'Benachrichtigt den Benutzer über Nachrichten in verschlüsselten Räumen.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Benachrichtigt den Benutzer über Jitsi-Widget-Ereignisse.';

  @override
  String get notificationRuleServerAcl =>
      'Unterdrücken von Server-ACL-Ereignissen';

  @override
  String get notificationRuleServerAclDescription =>
      'Unterdrückt Benachrichtigungen für Server-ACL-Ereignisse.';

  @override
  String unknownPushRule(String rule) {
    return 'Unbekannte Push-Regel \'$rule\'';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return '🎙️ $duration - Sprachnachricht von $sender';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Wenn Sie diese Benachrichtigungseinstellung löschen, kann dies nicht rückgängig gemacht werden.';

  @override
  String get more => 'Mehr';

  @override
  String get shareKeysWith => 'Schlüssel teilen mit...';

  @override
  String get shareKeysWithDescription =>
      'Welchen Geräten sollte vertraut werden, damit sie deine Nachrichten in verschlüsselten Chats mitlesen können?';

  @override
  String get allDevices => 'Alle Geräte';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Cross-verifizierte Geräte, falls aktiviert';

  @override
  String get crossVerifiedDevices => 'Cross-verifizierte Geräte';

  @override
  String get verifiedDevicesOnly => 'Nur verifizierte Geräte';

  @override
  String get takeAPhoto => 'Foto aufnehmen';

  @override
  String get recordAVideo => 'Video aufnehmen';

  @override
  String get optionalMessage => '(Optionale) Nachricht...';

  @override
  String get notSupportedOnThisDevice => 'Nicht unterstützt auf diesem Gerät';

  @override
  String get enterNewChat => 'Neuen Chat betreten';

  @override
  String get approve => 'Genehmigen';

  @override
  String get youHaveKnocked => 'Du hast geklopft';

  @override
  String get pleaseWaitUntilInvited =>
      'Bitte warte nun, bis dich jemand aus dem Raum auffordert.';

  @override
  String get commandHint_logout => 'Aktuelles Gerät abmelden';

  @override
  String get commandHint_logoutall => 'Alle aktiven Geräte abmelden';

  @override
  String get displayNavigationRail =>
      'Navigationsleiste auf dem Smartphone anzeigen';

  @override
  String get customReaction => 'Benutzerdefinierte Reaktion';

  @override
  String get moreEvents => 'Weitere Ereignisse';
}
