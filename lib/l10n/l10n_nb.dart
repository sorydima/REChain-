// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class L10nNb extends L10n {
  L10nNb([String locale = 'nb']) : super(locale);

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
  String get repeatPassword => 'Gjenta passord';

  @override
  String get notAnImage => 'Ikke en bildefil.';

  @override
  String get remove => 'Fjern';

  @override
  String get importNow => 'Importer nå';

  @override
  String get importEmojis => 'Importer emojier';

  @override
  String get importFromZipFile => 'Importer fra .zip-fil';

  @override
  String get exportEmotePack => 'Eksporter smilefjes som .zip-fil';

  @override
  String get replace => 'Erstatt';

  @override
  String get about => 'Om';

  @override
  String aboutHomeserver(String homeserver) {
    return 'Om $homeserver';
  }

  @override
  String get accept => 'Godta';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username godtok invitasjonen';
  }

  @override
  String get account => 'Konto';

  @override
  String get accountsAndSettings => 'Accounts and settings';

  @override
  String activatedEndToEndEncryption(String username) {
    return '$username skrudde på ende-til-ende -kryptering';
  }

  @override
  String get addEmail => 'Legg til e-post';

  @override
  String get confirmREChainId =>
      'Please confirm your REChain ID in order to delete your account.';

  @override
  String supposedMxid(String mxid) {
    return 'Denne bør være $mxid';
  }

  @override
  String get addToSpace => 'Legg til space';

  @override
  String get admin => 'Administrator';

  @override
  String get alias => 'alias';

  @override
  String get all => 'Alle';

  @override
  String get commandHint_roomupgrade =>
      'Oppgrader dette rommet til den gitte romversjonen';

  @override
  String get commandHint_googly => 'Send noen stirreøyne';

  @override
  String get commandHint_cuddle => 'Send en kos';

  @override
  String get commandHint_hug => 'Send en klem';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName sender deg noen stirreøyner';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName koser med deg';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName klemmer deg';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName besvarte anropet';
  }

  @override
  String get anyoneCanJoin => 'Hvem som helst kan delta';

  @override
  String get appLock => 'Programlås';

  @override
  String get appLockDescription =>
      'Lås appen med en PIN-kode når den ikke er i bruk';

  @override
  String get archive => 'Arkiv';

  @override
  String get areGuestsAllowedToJoin => 'Skal gjester tillates å ta del';

  @override
  String get areYouSure => 'Er du sikker?';

  @override
  String get discardEdits => 'You have unsaved changes. Discard your edits?';

  @override
  String get areYouSureYouWantToLogout => 'Er du sikker på at du vil logge ut?';

  @override
  String get askSSSSSign =>
      'For å kunne signere den andre personen, skriv inn ditt sikre lagerpassord eller gjenopprettingsnøkkel.';

  @override
  String askVerificationRequest(String username) {
    return 'Godta denne bekreftelsesforespørselen fra $username?';
  }

  @override
  String get autoplayImages =>
      'Automatisk spill av animerte stickers og emojis';

  @override
  String badServerLoginTypesException(
    String serverVersions,
    String supportedVersions,
    Object suportedVersions,
  ) {
    return 'Denne hjemme serveren støtter følgende innloggings-typer:\n$serverVersions\nMen denne applikasjonen støtter kun:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Send skrivevarsler';

  @override
  String get swipeRightToLeftToReply =>
      'Sveip fra høyre mot venstre for å svare';

  @override
  String get sendOnEnter => 'Trykk på enter for å sende';

  @override
  String get noMoreChatsFound => 'Ingen flere chatter funnet ...';

  @override
  String get noChatsFoundHere =>
      'No chats found here yet. Start a new chat with someone by using the button below. ⤵️';

  @override
  String get unread => 'Ulest';

  @override
  String get space => 'Område';

  @override
  String get banFromChat => 'Bannlys fra sludring';

  @override
  String get banned => 'Bannlyst';

  @override
  String bannedUser(String username, String targetName) {
    return '$username bannlyste $targetName';
  }

  @override
  String get blockDevice => 'Blokker enhet';

  @override
  String get blocked => 'Blokkert';

  @override
  String get cancel => 'Avbryt';

  @override
  String cantOpenUri(String uri) {
    return 'Kan ikke åpne URI $uri';
  }

  @override
  String get changeDeviceName => 'Endre enhetsnavn';

  @override
  String changedTheChatAvatar(String username) {
    return '$username endret sludreavatar';
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
    return '$username endret sludretilgangene';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username endret visningsnavn til: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username endret gjestetilgangsreglene';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username endret gjestetilgangsregler til: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username endret historikksynlighet';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username endret historikksynlighet til: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username endret tilgangsreglene';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username endret tilgangsreglene til: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username endret avataren sin';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username endret rom-aliasene';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username endret invitasjonslenken';
  }

  @override
  String get changePassword => 'Endre passord';

  @override
  String get changeTheHomeserver => 'Endre hjemmetjener';

  @override
  String get changeTheme => 'Endre din stil';

  @override
  String get changeTheNameOfTheGroup => 'Endre gruppens navn';

  @override
  String get changeYourAvatar => 'Bytt profilbilde';

  @override
  String get channelCorruptedDecryptError => 'Krypteringen er skadet';

  @override
  String get chat => 'Sludring';

  @override
  String get chatBackup => 'Sludringssikkerhetskopi';

  @override
  String get chatDetails => 'Sludringsdetaljer';

  @override
  String get chats => 'Chatter';

  @override
  String get chooseAStrongPassword => 'Velg et sterkt passord';

  @override
  String get clearArchive => 'Tøm arkivet';

  @override
  String get close => 'Lukk';

  @override
  String get commandHint_markasdm =>
      'Mark as direct message room for the giving REChain ID';

  @override
  String get commandHint_markasgroup => 'Merk som gruppe';

  @override
  String get commandHint_ban => 'Utesteng den gitte brukeren fra dette rommet';

  @override
  String get commandHint_clearcache => 'Tøm cache';

  @override
  String get commandHint_create =>
      'Opprett en tom gruppechat\nBruk --no-encryption for å deaktivere kryptering';

  @override
  String get commandHint_discardsession => 'Forkast økten';

  @override
  String get commandHint_dm =>
      'Start en direkte chat\nBruk --no-encryption for å deaktivere kryptering';

  @override
  String get commandHint_html => 'Send HTML-formatert tekst';

  @override
  String get commandHint_invite =>
      'Inviter den gitte brukeren til dette rommet';

  @override
  String get commandHint_join => 'Bli med i det gitte rommet';

  @override
  String get commandHint_kick => 'Fjern den gitte brukeren fra dette rommet';

  @override
  String get commandHint_leave => 'Forlat dette rommet';

  @override
  String get commandHint_me => 'Beskriv deg selv';

  @override
  String get commandHint_myroomavatar =>
      'Angi bilde for dette rommet (med mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Angi visningsnavnet ditt for dette rommet';

  @override
  String get commandHint_op =>
      'Set the given user\'s power level (default: 50)';

  @override
  String get commandHint_plain => 'Send uformatert tekst';

  @override
  String get commandHint_react => 'Send svar som en reaksjon';

  @override
  String get commandHint_send => 'Send tekst';

  @override
  String get commandHint_unban =>
      'Opphev utestengelsen til den gitte brukeren fra dette rommet';

  @override
  String get commandInvalid => 'Ugyldig kommando';

  @override
  String commandMissing(String command) {
    return '$command er ikke en kommando.';
  }

  @override
  String get compareEmojiMatch =>
      'Sammenlign og forsikre at følgende smilefjes samsvarer med de på den andre enheten:';

  @override
  String get compareNumbersMatch =>
      'Sammenlign og forsikre at følgende tall samsvarer med de på den andre enheten:';

  @override
  String get configureChat => 'Sett opp sludring';

  @override
  String get contactHasBeenInvitedToTheGroup => 'Kontakt invitert til gruppen';

  @override
  String get contentHasBeenReported =>
      'Innholdet har blitt rapportert til tjeneradministratorene';

  @override
  String get copiedToClipboard => 'Kopiert til utklippstavle';

  @override
  String get copy => 'Kopier';

  @override
  String get copyToClipboard => 'Kopier til utklippstavle';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Kunne ikke dekryptere melding: $error';
  }

  @override
  String get checkList => 'Sjekkliste';

  @override
  String countParticipants(int count) {
    return '$count deltagere';
  }

  @override
  String countInvited(int count) {
    return '$count inviterte';
  }

  @override
  String get create => 'Opprett';

  @override
  String createdTheChat(String username) {
    return '$username opprettet sludringen';
  }

  @override
  String get createGroup => 'Opprett gruppe';

  @override
  String get createNewSpace => 'Nytt område';

  @override
  String get currentlyActive => 'Aktiv nå';

  @override
  String get darkTheme => 'Mørk';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$timeOfDay, $date';
  }

  @override
  String get deactivateAccountWarning =>
      'Dette vil skru av din brukerkonto for godt, og kan ikke angres! Er du sikker?';

  @override
  String get defaultPermissionLevel => 'Forvalgt tilgangsnivå';

  @override
  String get delete => 'Slett';

  @override
  String get deleteAccount => 'Slett konto';

  @override
  String get deleteMessage => 'Slett melding';

  @override
  String get devices => 'Enheter';

  @override
  String get directChats => 'Direktesludringer';

  @override
  String get displaynameHasBeenChanged => 'Visningsnavn endret';

  @override
  String get downloadFile => 'Last ned fil';

  @override
  String get edit => 'Rediger';

  @override
  String get editBlockedServers => 'Rediger blokkerte tjenere';

  @override
  String get chatPermissions => 'Chat tillatelser';

  @override
  String get editDisplayname => 'Rediger visningsnavn';

  @override
  String get editRoomAliases => 'Rediger rom aliaser';

  @override
  String get editRoomAvatar => 'Rediger romavatar';

  @override
  String get emoteExists => 'Smilefjeset finnes allerede!';

  @override
  String get emoteInvalid => 'Ugyldig smilefjes-kode!';

  @override
  String get emoteKeyboardNoRecents => 'Nylig brukte emotes vil vises her ...';

  @override
  String get globalChatId => 'Global chat-ID';

  @override
  String get accessAndVisibility => 'Tilgang og synlighet';

  @override
  String get accessAndVisibilityDescription =>
      'Hvem som har lov til å bli med i denne chatten og hvordan chatten kan oppdages.';

  @override
  String get customEmojisAndStickers =>
      'Egendefinerte emojier og klistremerker';

  @override
  String get customEmojisAndStickersBody =>
      'Legg til eller del tilpassede emojier eller klistremerker som kan brukes i hvilken som helst chat.';

  @override
  String get emoteShortcode => 'Smilefjes-kode';

  @override
  String get emptyChat => 'Tom sludring';

  @override
  String get enableEmotesGlobally =>
      'Skru på smilefjespakke for hele programmet';

  @override
  String get enableEncryption => 'Skru på kryptering';

  @override
  String get enableEncryptionWarning =>
      'Du vil ikke kunne skru av kryptering lenger. Er du sikker?';

  @override
  String get encrypted => 'Kryptert';

  @override
  String get encryption => 'Kryptering';

  @override
  String get encryptionNotEnabled => 'Kryptering er ikke påskrudd';

  @override
  String endedTheCall(String senderName) {
    return '$senderName avsluttet samtalen';
  }

  @override
  String get enterAnEmailAddress => 'Skriv inn en e-postadresse';

  @override
  String errorObtainingLocation(String error) {
    return 'Feil ved henting av posisjon: $error';
  }

  @override
  String get fontSize => 'Skriftstørrelse';

  @override
  String get forward => 'Videre';

  @override
  String get fromJoining => 'Fra å ta del';

  @override
  String get fromTheInvitation => 'Fra invitasjonen';

  @override
  String get group => 'Gruppe';

  @override
  String get chatDescription => 'Chat beskrivelse';

  @override
  String get chatDescriptionHasBeenChanged => 'Chatbeskrivelsen er endret';

  @override
  String get groupIsPublic => 'Gruppen er offentlig';

  @override
  String get groups => 'Grupper';

  @override
  String groupWith(String displayname) {
    return 'Gruppe med $displayname';
  }

  @override
  String get guestsAreForbidden => 'Gjester forbudt';

  @override
  String get guestsCanJoin => 'Gjester kan ta del';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username har trukket tilbake invitasjonen til $targetName';
  }

  @override
  String get help => 'Hjelp';

  @override
  String get hideRedactedMessages => 'Skjul redigerte meldinger';

  @override
  String get hideRedactedMessagesBody =>
      'Hvis noen redigerer en melding, vil ikke denne meldingen lenger være synlig i chatten.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Skjul ugyldige eller ukjente meldingsformater';

  @override
  String get block => 'Blokkér';

  @override
  String get blockedUsers => 'Blokkerte brukere';

  @override
  String get blockListDescription =>
      'Du kan blokkere brukere som forstyrrer deg. Du vil ikke kunne motta meldinger eller rominvitasjoner fra brukerne på din personlige blokkeringsliste.';

  @override
  String get blockUsername => 'Ignorer brukernavn';

  @override
  String get iHaveClickedOnLink => 'Jeg har klikket på lenken';

  @override
  String get incorrectPassphraseOrKey =>
      'Feilaktig passord eller gjenopprettingsnøkkel';

  @override
  String get inviteContact => 'Inviter kontakt';

  @override
  String inviteContactToGroup(String groupName) {
    return 'Inviter kontakt til $groupName';
  }

  @override
  String get noChatDescriptionYet => 'Ingen chatbeskrivelse er opprettet ennå.';

  @override
  String get tryAgain => 'Prøv igjen';

  @override
  String get invalidServerName => 'Ugyldig servernavn';

  @override
  String get invited => 'Invitert';

  @override
  String get redactMessageDescription =>
      'Meldingen vil bli redigert for alle deltakerne i denne samtalen. Dette kan ikke angres.';

  @override
  String get optionalRedactReason =>
      '(Valgfritt) Årsak til redigering av denne meldingen...';

  @override
  String invitedUser(String username, String targetName) {
    return '$username inviterte $targetName';
  }

  @override
  String get invitedUsersOnly => 'Kun inviterte brukere';

  @override
  String inviteText(String username, String link) {
    return '$username har invitert deg til REChain. \n1. Installer REChain. https://github.com/sorydima/REChain- \n2. Registrer deg eller logg inn \n3. Åpne invitasjonslenken: $link';
  }

  @override
  String get isTyping => 'skriver…';

  @override
  String joinedTheChat(String username) {
    return '${username}ble med i samtalen';
  }

  @override
  String get joinRoom => 'Ta del i rom';

  @override
  String kicked(String username, String targetName) {
    return '$username kastet ut $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '$username kastet ut og bannlyste $targetName';
  }

  @override
  String get kickFromChat => 'Kast ut av sludringen';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Sist aktiv: $localizedTimeShort';
  }

  @override
  String get leave => 'Forlat';

  @override
  String get leftTheChat => 'Forlat sludringen';

  @override
  String get lightTheme => 'Lys';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Last inn $count deltagere til';
  }

  @override
  String get dehydrate => 'Eksporter økten og slett enheten';

  @override
  String get dehydrateWarning =>
      'Denne handlingen kan ikke angres. Sørg for at du lagrer sikkerhetskopifilen på en trygg måte.';

  @override
  String get hydrate => 'Gjenopprett fra sikkerhetskopifil';

  @override
  String get loadingPleaseWait => 'Laster inn… Vent.';

  @override
  String get loadMore => 'Last inn mer…';

  @override
  String get locationDisabledNotice =>
      'Lokasjonstjenester er deaktivert. Vennligst aktiver dem for at du skal kunne dele posisjonen din.';

  @override
  String get locationPermissionDeniedNotice =>
      'Lokasjonstillatelse nektet. Gi dem tillatelse til å dele din lokasjon.';

  @override
  String get login => 'Logg inn';

  @override
  String logInTo(String homeserver) {
    return 'Logg inn på $homeserver';
  }

  @override
  String get logout => 'Logg ut';

  @override
  String get mention => 'Nevn';

  @override
  String get messages => 'Meldinger';

  @override
  String get messagesStyle => 'Meldinger:';

  @override
  String get moderator => 'Moderator';

  @override
  String get muteChat => 'Forstum sludring';

  @override
  String get newChat => 'Ny sludring';

  @override
  String get newMessageInrechainonline => 'Ny melding i REChain';

  @override
  String get newVerificationRequest => 'Ny bekreftelsesforespørsel!';

  @override
  String get next => 'Neste';

  @override
  String get no => 'Nei';

  @override
  String get noConnectionToTheServer => 'Ingen tilkobling til tjeneren';

  @override
  String get noEmotesFound => 'Fant ingen smilefjes. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Du kan bare aktivere kryptering på rom som ikke er offentlig tilgjengelig.';

  @override
  String get noGoogleServicesWarning =>
      'Bruk https://microg.org/ for å få Google-tjenester (uten at det går ut over personvernet) for å få push-merknader i REChain.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 er ingen REChain-server, bruk $server2 i stedet?';
  }

  @override
  String get shareInviteLink => 'Del invitasjonslenke';

  @override
  String get scanQrCode => 'Skann QR-kode';

  @override
  String get noPasswordRecoveryDescription =>
      'Du har ikke lagt til en måte å gjenopprette passordet ditt på.';

  @override
  String get noPermission => 'Ingen tilgang';

  @override
  String get noRoomsFound => 'Fant ingen rom …';

  @override
  String get notifications => 'Merknader';

  @override
  String numUsersTyping(int count) {
    return '$count brukere skriver …';
  }

  @override
  String get obtainingLocation => 'Henter sted …';

  @override
  String get ok => 'OK';

  @override
  String get onlineKeyBackupEnabled =>
      'Nettbasert sikkerhetskopiering av nøkler på';

  @override
  String get oopsPushError =>
      'Oops! Dessverre oppsto det en feil under oppsettet av push-varsler.';

  @override
  String get oopsSomethingWentWrong => 'Oida, noe gikk galt …';

  @override
  String get openAppToReadMessages => 'Åpne programmet for å lese meldinger';

  @override
  String get openCamera => 'Åpne kamera';

  @override
  String get oneClientLoggedOut => 'En av klientene dine har blitt logget ut';

  @override
  String get addAccount => 'Legg til konto';

  @override
  String get editBundlesForAccount => 'Edit bundles for this account';

  @override
  String get addToBundle => 'Add to bundle';

  @override
  String get removeFromBundle => 'Remove from this bundle';

  @override
  String get bundleName => 'Bundle name';

  @override
  String get openInMaps => 'Åpne i kart';

  @override
  String get link => 'Lenke';

  @override
  String get or => 'Eller';

  @override
  String get participant => 'Deltager';

  @override
  String get passphraseOrKey => 'Passord eller gjenopprettingsnøkkel';

  @override
  String get password => 'Passord';

  @override
  String get passwordForgotten => 'Passord glemt';

  @override
  String get passwordHasBeenChanged => 'Passord endret';

  @override
  String get passwordRecoverySettings =>
      'Innstillinger for gjenoppretting av passord';

  @override
  String get passwordRecovery => 'Passordgjenoppretting';

  @override
  String get pin => 'Fest';

  @override
  String get pleaseChooseAPasscode => 'Vennligst velg en passordkode';

  @override
  String get pleaseClickOnLink => 'Klikk på lenken i e-posten og fortsett.';

  @override
  String get pleaseEnterYourPassword => 'Skriv inn passordet ditt';

  @override
  String get pleaseEnterYourPin => 'Vennligst skriv inn PIN-koden din';

  @override
  String get pleaseEnterYourUsername => 'Skriv inn brukernavnet ditt';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Følg instruksen på nettsiden og trykk på «Neste».';

  @override
  String get privacy => 'Personvern';

  @override
  String get publicRooms => 'Offentlige rom';

  @override
  String get reason => 'Grunn';

  @override
  String redactedBy(String username) {
    return 'Redigert av $username';
  }

  @override
  String redactedByBecause(String username, String reason) {
    return 'Redigert av $username fordi: «$reason»';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username har trukket tilbake en hendelse';
  }

  @override
  String get redactMessage => 'Rediger melding';

  @override
  String get reject => 'Avslå';

  @override
  String rejectedTheInvitation(String username) {
    return '$username avslo invitasjonen';
  }

  @override
  String get removeAllOtherDevices => 'Fjern alle andre enheter';

  @override
  String get unbanFromChat => 'Opphev bannlysning';

  @override
  String get removeYourAvatar => 'Fjern din avatar';

  @override
  String get replaceRoomWithNewerVersion => 'Erstatt rom med nyere versjon';

  @override
  String get reply => 'Svar';

  @override
  String get reportMessage => 'Rapporter melding';

  @override
  String get roomHasBeenUpgraded => 'Rommet har blitt oppgradert';

  @override
  String sendingFilesDoNotExit(int count) {
    return 'Sending $count files... Please do not exit!';
  }

  @override
  String get roomVersion => 'Rom versjon';

  @override
  String get compressingVideo => 'Compressing video...';

  @override
  String get saveFile => 'Lagre fil';

  @override
  String get search => 'Søk';

  @override
  String get security => 'Sikkerhet';

  @override
  String get send => 'Send';

  @override
  String get sendAMessage => 'Send en melding';

  @override
  String get sendAsText => 'Send som tekst';

  @override
  String get sendAudio => 'Send lyd';

  @override
  String get sendFile => 'Send fil';

  @override
  String get sendImage => 'Send bilde';

  @override
  String sendImages(int count) {
    return 'Send $count bilde';
  }

  @override
  String get sendMessages => 'Send meldinger';

  @override
  String get sendVideo => 'Send video';

  @override
  String sentAFile(String username) {
    return '$username sendte en fil';
  }

  @override
  String sentAnAudio(String username) {
    return '$username sendte lyd';
  }

  @override
  String sentAPicture(String username) {
    return '$username sendte et bilde';
  }

  @override
  String sentASticker(String username) {
    return '$username sendte et klistremerke';
  }

  @override
  String sentAVideo(String username) {
    return '$username sendte en video';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName sendte anropsinfo';
  }

  @override
  String get setAsCanonicalAlias => 'Set as main alias';

  @override
  String get setChatDescription => 'Sett chat beskrivelse';

  @override
  String get setStatus => 'Angi status';

  @override
  String get settings => 'Innstilinger';

  @override
  String get share => 'Del';

  @override
  String sharedTheLocation(String username) {
    return '$username delte posisjonen';
  }

  @override
  String get shareLocation => 'Del lokasjon';

  @override
  String get skip => 'Hopp over';

  @override
  String get sourceCode => 'Kildekode';

  @override
  String get spaceIsPublic => 'Space is public';

  @override
  String get spaceName => 'Space name';

  @override
  String startedACall(String senderName) {
    return '$senderName startet en samtale';
  }

  @override
  String get status => 'Status';

  @override
  String get statusExampleMessage => 'Hvordan har du det i dag?';

  @override
  String get submit => 'Send inn';

  @override
  String get synchronizingPleaseWait => 'Synkroniserer … Vent litt.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Synkroniserer… ($percentage%)';
  }

  @override
  String get systemTheme => 'System';

  @override
  String get theyDontMatch => 'Samsvarer ikke';

  @override
  String get theyMatch => 'Samsvarer';

  @override
  String get tooManyRequestsWarning =>
      'For mange forespørsler. Prøv igjen senere!';

  @override
  String get tryToSendAgain => 'Prøv å sende igjen';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username opphevet bannlysning av $targetName';
  }

  @override
  String get unblockDevice => 'Opphev blokkering av enhet';

  @override
  String get unknownDevice => 'Ukjent enhet';

  @override
  String get unknownEncryptionAlgorithm => 'Ukjent krypteringsalgoritme';

  @override
  String unknownEvent(String type) {
    return 'Ukjent hendelse «$type»';
  }

  @override
  String get unmuteChat => 'Opphev forstumming av sludring';

  @override
  String get unpin => 'Løsne';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username og $count andre skriver…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username og $username2 skriver…';
  }

  @override
  String userIsTyping(String username) {
    return '$username skriver…';
  }

  @override
  String userLeftTheChat(String username) {
    return '$username har forlatt sludringen';
  }

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username sendte en $type-hendelse';
  }

  @override
  String get unverified => 'Ikke verifisert';

  @override
  String get verified => 'Verifisert';

  @override
  String get verifyStart => 'Start bekreftelse';

  @override
  String get verifySuccess => 'Du har bekreftet!';

  @override
  String get verifyTitle => 'Bekrefter annen konto';

  @override
  String get visibilityOfTheChatHistory => 'Sludrehistorikkens synlighet';

  @override
  String get visibleForAllParticipants => 'Synlig for alle deltagere';

  @override
  String get visibleForEveryone => 'Synlig for alle';

  @override
  String get voiceMessage => 'Lydmelding';

  @override
  String get waitingPartnerAcceptRequest =>
      'Venter på at partneren skal godta forespørselen…';

  @override
  String get waitingPartnerEmoji =>
      'Venter på at partneren skal godta emojien…';

  @override
  String get waitingPartnerNumbers =>
      'Venter på at samtalepartner skal godta tallene …';

  @override
  String get warning => 'Advarsel!';

  @override
  String get weSentYouAnEmail => 'Du har fått en e-post';

  @override
  String get whoCanPerformWhichAction => 'Hvem kan utføre hvilken handling';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'Hvem tillates å ta del i denne gruppen';

  @override
  String get whyDoYouWantToReportThis =>
      'Hvorfor ønsker du å rapportere dette?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Med disse adressene kan du gjenopprette passordet ditt hvis du trenger det.';

  @override
  String get writeAMessage => 'Skriv en melding …';

  @override
  String get yes => 'Ja';

  @override
  String get you => 'Deg';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Du deltar ikke lenger i denne sludringen';

  @override
  String get yourPublicKey => 'Din offentlige nøkkel';

  @override
  String get messageInfo => 'Meldingsinformasjon';

  @override
  String get time => 'Tid';

  @override
  String get sender => 'Avsender';

  @override
  String get openGallery => 'Åpne galleri';

  @override
  String get removeFromSpace => 'Fjern fra området';

  @override
  String get markAsRead => 'Marker som lest';

  @override
  String get reportUser => 'Rapporter bruker';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender reagerte med $reaction';
  }

  @override
  String get pinMessage => 'Fest til rommet';

  @override
  String get confirmEventUnpin =>
      'Are you sure to permanently unpin the event?';

  @override
  String get emojis => 'Emojier';

  @override
  String get unsupportedAndroidVersion => 'Usupportert Android-versjon';

  @override
  String get unsupportedAndroidVersionLong =>
      'Denne funksjonen krever en nyere Android-versjon. Se etter oppdateringer eller støtte for Mobile Katya OS.';

  @override
  String get youRejectedTheInvitation => 'Du har avvist invitasjonen';

  @override
  String get youJoinedTheChat => 'Du har blitt med i chatten';

  @override
  String get youAcceptedTheInvitation => '👍 Du har akseptert invitasjonen';

  @override
  String youBannedUser(String user) {
    return 'Du stengte ute $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Du har trukket tilbake invitasjonen for $user';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 Du har blitt invitert av $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Du inviterte $user';
  }

  @override
  String youKicked(String user) {
    return '👞 You sparket ut $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Du sparket og stengte ute $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Du opphevet utestengelsen av $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user has knocked';
  }

  @override
  String get usersMustKnock => 'Users must knock';

  @override
  String get noOneCanJoin => 'Ingen kan bli med';

  @override
  String get knock => 'Knock';

  @override
  String get users => 'Brukere';

  @override
  String get storeInAndroidKeystore => 'Lagre i Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Lagre i Apple nøkkelring';

  @override
  String get storeSecurlyOnThisDevice => 'Lagre sikkert på denne enheten';

  @override
  String countFiles(int count) {
    return '$count filer';
  }

  @override
  String get user => 'Bruker';

  @override
  String get custom => 'Egendefinert';

  @override
  String get whyIsThisMessageEncrypted =>
      'Hvorfor er denne meldingen uleselig?';

  @override
  String get noKeyForThisMessage =>
      'This can happen if the message was sent before you have signed in to your account at this device.\n\nIt is also possible that the sender has blocked your device or something went wrong with the internet connection.\n\nAre you able to read the message on another session? Then you can transfer the message from it! Go to Settings > Devices and make sure that your devices have verified each other. When you open the room the next time and both sessions are in the foreground, the keys will be transmitted automatically.\n\nDo you not want to lose the keys when logging out or switching devices? Make sure that you have enabled the chat backup in the settings.';

  @override
  String get newSpace => 'Nytt område';

  @override
  String get doNotShowAgain => 'Ikke vis igjen';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Tom chat (var $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Spaces allows you to consolidate your chats and build private or public communities.';

  @override
  String get encryptThisChat => 'Krypter denne chatten';

  @override
  String get disableEncryptionWarning =>
      'Av sikkerhetshensyn kan du ikke deaktivere kryptering i en chat der det har vært aktivert tidligere.';

  @override
  String get sorryThatsNotPossible => 'Beklager... det er ikke mulig';

  @override
  String get reopenChat => 'Gjenåpne chat';

  @override
  String get noBackupWarning =>
      'Warning! Without enabling chat backup, you will lose access to your encrypted messages. It is highly recommended to enable the chat backup first before logging out.';

  @override
  String get noOtherDevicesFound => 'Ingen andre enheter funnet';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Kan ikke sende! Serveren støtter bare vedlegg opptil $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Filen er lagret på $path';
  }

  @override
  String get jumpToLastReadMessage => 'Hopp til sist leste melding';

  @override
  String get readUpToHere => 'Lest frem til her';

  @override
  String get jump => 'Hopp';

  @override
  String get openLinkInBrowser => 'Åpne lenke i nettleser';

  @override
  String get reportErrorDescription =>
      '😭 Å nei. Noe gikk galt. Hvis du ønsker det, kan du rapportere denne feilen til utviklerne.';

  @override
  String get report => 'report';

  @override
  String get setColorTheme => 'Angi fargetema:';

  @override
  String get invite => 'Inviter';

  @override
  String get inviteGroupChat => '📨 Invitasjon til gruppechat';

  @override
  String get invalidInput => 'Ugyldig inndata!';

  @override
  String wrongPinEntered(int seconds) {
    return 'Feil PIN-kode tastet inn! Prøv igjen om $seconds sekunder...';
  }

  @override
  String get pleaseEnterANumber => 'Vennligst skriv inn et tall større enn 0';

  @override
  String get archiveRoomDescription =>
      'Chatten vil bli flyttet til arkivet. Andre brukere vil kunne se at du har forlatt chatten.';

  @override
  String get roomUpgradeDescription =>
      'Chatten vil deretter bli gjenskapt med den nye romversjonen. Alle deltakere vil bli varslet om at de må bytte til den nye chatten. Du kan finne ut mer om romversjoner på https://github.com/sorydima/REChain-.git';

  @override
  String get removeDevicesDescription =>
      'Du vil bli logget ut av denne enheten og vil ikke lenger kunne motta meldinger.';

  @override
  String get banUserDescription =>
      'Brukeren vil bli utestengt fra chatten og vil ikke kunne delta i chatten igjen før utestengelsen er opphevet.';

  @override
  String get unbanUserDescription =>
      'Brukeren vil kunne gå inn i chatten igjen hvis vedkommende prøver.';

  @override
  String get kickUserDescription =>
      'Brukeren blir kastet ut av chatten, men ikke utestengt. I offentlige chatter kan brukeren bli med på nytt når som helst.';

  @override
  String get makeAdminDescription =>
      'Once you make this user admin, you may not be able to undo this as they will then have the same permissions as you.';

  @override
  String get pushNotificationsNotAvailable =>
      'Push-varsler er ikke tilgjengelige';

  @override
  String get learnMore => 'Lær mer';

  @override
  String get yourGlobalUserIdIs => 'Din globale bruker-ID er: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Dessverre ble ingen bruker funnet med \"$query\". Sjekk om du har skrevet feil.';
  }

  @override
  String get knocking => 'Knocking';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Chatten kan oppdages via søket på $server';
  }

  @override
  String get searchChatsRooms => 'Søk etter #chatter, @brukere...';

  @override
  String get nothingFound => 'Ingenting funnet...';

  @override
  String get groupName => 'Gruppenavn';

  @override
  String get createGroupAndInviteUsers =>
      'Opprett en gruppe og inviter brukere';

  @override
  String get groupCanBeFoundViaSearch => 'Gruppen kan finnes via søk';

  @override
  String get wrongRecoveryKey =>
      'Beklager ... dette ser ikke ut til å være riktig gjenopprettingsnøkkel.';

  @override
  String get commandHint_sendraw => 'Send raw json';

  @override
  String get databaseMigrationTitle => 'Databasen er optimalisert';

  @override
  String get databaseMigrationBody => 'Vent litt. Dette kan ta et øyeblikk.';

  @override
  String get leaveEmptyToClearStatus =>
      'La stå tomt for å slette statusen din.';

  @override
  String get select => 'Velg';

  @override
  String get searchForUsers => 'Søk etter @brukere...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Skriv inn ditt nåværende passord';

  @override
  String get newPassword => 'Nytt passord';

  @override
  String get pleaseChooseAStrongPassword => 'Vennligst velg et sterkt passord';

  @override
  String get passwordsDoNotMatch => 'Passordene stemmer ikke overens';

  @override
  String get passwordIsWrong => 'Det inntastede passordet ditt er feil';

  @override
  String get publicChatAddresses => 'Offentlige chatadresser';

  @override
  String get createNewAddress => 'Opprett ny adresse';

  @override
  String get joinSpace => 'Join space';

  @override
  String get publicSpaces => 'Public spaces';

  @override
  String get addChatOrSubSpace => 'Add chat or sub space';

  @override
  String get thisDevice => 'Denne enheten:';

  @override
  String get initAppError => 'Det oppsto en feil under oppstart av appen';

  @override
  String searchIn(String chat) {
    return 'Søk i chatten «$chat»...';
  }

  @override
  String get searchMore => 'Søk mer...';

  @override
  String get gallery => 'Galleri';

  @override
  String get files => 'Filer';

  @override
  String sessionLostBody(String url, String error) {
    return 'Sesjonen din er tapt. Vennligst rapporter denne feilen til utviklerne på $url. Feilmeldingen er: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Appen prøver nå å gjenopprette økten din fra sikkerhetskopien. Rapporter denne feilen til utviklerne på $url. Feilmeldingen er: $error';
  }

  @override
  String get sendReadReceipts => 'Send lesebekreftelser';

  @override
  String get sendTypingNotificationsDescription =>
      'Andre deltakere i en chat kan se når du skriver en ny melding.';

  @override
  String get sendReadReceiptsDescription =>
      'Andre deltakere i en chat kan se når du har lest en melding.';

  @override
  String get formattedMessages => 'Formaterte meldinger';

  @override
  String get formattedMessagesDescription =>
      'Vis rikt meldingsinnhold som fet skrift ved hjelp av markdown.';

  @override
  String get verifyOtherUser => '🔐 Verifiser annen bruker';

  @override
  String get verifyOtherUserDescription =>
      'If you verify another user, you can be sure that you know who you are really writing to. 💪\n\nWhen you start a verification, you and the other user will see a popup in the app. There you will then see a series of emojis or numbers that you have to compare with each other.\n\nThe best way to do this is to meet up or start a video call. 👭';

  @override
  String get verifyOtherDevice => '🔐 Verifiser annen enhet';

  @override
  String get verifyOtherDeviceDescription =>
      'When you verify another device, those devices can exchange keys, increasing your overall security. 💪 When you start a verification, a popup will appear in the app on both devices. There you will then see a series of emojis or numbers that you have to compare with each other. It\'s best to have both devices handy before you start the verification. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender godtok nøkkelverifisering';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender avbrøt nøkkelverifisering';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender fullførte nøkkelverifisering';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender er klar for nøkkelverifisering';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender har bedt om nøkkelverifisering';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender startet nøkkelverifisering';
  }

  @override
  String get incomingMessages => 'Innkommende meldinger';

  @override
  String get stickers => 'Stickers';

  @override
  String get discover => 'Oppdag';

  @override
  String get commandHint_ignore => 'Ignorer den oppgitte REChain IDen';

  @override
  String get commandHint_unignore =>
      'Opphev ignorering av den gitte REChain IDen';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread uleste chatter';
  }

  @override
  String get noDatabaseEncryption =>
      'Databasekryptering støttes ikke på denne plattformen';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Akkurat nå er det $count blokkerte brukere.';
  }

  @override
  String goToSpace(Object space) {
    return 'Gå til område: $space';
  }

  @override
  String get markAsUnread => 'Marker som ulest';

  @override
  String userLevel(int level) {
    return '$level - Bruker';
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
  String get changeGeneralChatSettings => 'Endre generelle chatinnstillinger';

  @override
  String get inviteOtherUsers => 'Inviter andre brukere til denne chatten';

  @override
  String get changeTheChatPermissions => 'Endre chattillatelsene';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Endre synligheten til chatloggen';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Endre hovedadressen til den offentlige chatten';

  @override
  String get sendRoomNotifications => 'Send en @room varsling';

  @override
  String get changeTheDescriptionOfTheGroup => 'Endre beskrivelsen til chatten';

  @override
  String get chatPermissionsDescription =>
      'Define which power level is necessary for certain actions in this chat. The power levels 0, 50 and 100 are usually representing users, moderators and admins, but any gradation is possible.';

  @override
  String updateInstalled(String version) {
    return '🎉 Oppdatering $version installert!';
  }

  @override
  String get changelog => 'Endringslogg';

  @override
  String updateAvailable(String version) {
    return 'Update $version available';
  }

  @override
  String get download => 'Download';

  @override
  String get sendCanceled => 'Sending avbrutt';

  @override
  String get loginWithREChainId => 'Login with REChain-ID';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Ser ikke ut til å være en kompatibel hjemmeserver. Feil URL?';

  @override
  String get calculatingFileSize => 'Beregner filstørrelse...';

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'En av dine enheter er ikke verifisert';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Merk: Når du kobler alle enhetene dine til chat-sikkerhetskopien, blir de automatisk bekreftet.';

  @override
  String get continueText => 'Fortsett';

  @override
  String get blur => 'Uskarphet:';

  @override
  String get opacity => 'Ugjennomsiktighet:';

  @override
  String get setWallpaper => 'Sett bakgrunnsbilde';

  @override
  String get manageAccount => 'Administrer konto';

  @override
  String get noContactInformationProvided =>
      'Serveren oppgir ingen gyldig kontaktinformasjon';

  @override
  String get contactServerAdmin => 'Kontakt serveradministrator';

  @override
  String get contactServerSecurity => 'Contact server security';

  @override
  String get supportPage => 'Supportside';

  @override
  String get serverInformation => 'Serverinformasjon:';

  @override
  String get name => 'Navn';

  @override
  String get version => 'Versjon';

  @override
  String get website => 'Nettside';

  @override
  String get compress => 'Komprimer';

  @override
  String get boldText => 'Fet skrift';

  @override
  String get italicText => 'Kursiv tekst';

  @override
  String get strikeThrough => 'Gjennomstreking';

  @override
  String get pleaseFillOut => 'Vennligst fyll ut';

  @override
  String get invalidUrl => 'Ugyldig url';

  @override
  String get addLink => 'Legg til lenke';

  @override
  String get unableToJoinChat =>
      'Kan ikke bli med i chatten. Kanskje den andre parten allerede har lukket samtalen.';

  @override
  String get previous => 'Forrige';

  @override
  String get otherPartyNotLoggedIn =>
      'Den andre parten er ikke logget inn og kan derfor ikke motta meldinger!';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Bruk \'$server\' for å logge inn';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Du gir herved tillatelse til at appen og nettstedet deler informasjon om deg.';

  @override
  String get open => 'Åpne';

  @override
  String get waitingForServer => 'Venter på server...';

  @override
  String get newChatRequest => '📩 Ny chatforespørsel';

  @override
  String get contentNotificationSettings =>
      'Innstillinger for innholdsvarslinger';

  @override
  String get generalNotificationSettings => 'Generelle varslingsinnstillinger';

  @override
  String get roomNotificationSettings => 'Innstillinger for romvarsler';

  @override
  String get userSpecificNotificationSettings =>
      'Brukerspesifikke varslingsinnstillinger';

  @override
  String get otherNotificationSettings => 'Andre varslingsinnstillinger';

  @override
  String get notificationRuleContainsUserName => 'Inneholder brukernavn';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Varsler bruker når en melding inneholder ens brukernavn.';

  @override
  String get notificationRuleMaster => 'Demp alle varslinger';

  @override
  String get notificationRuleMasterDescription =>
      'Overstyrer alle andre regler og deaktiverer alle varsler.';

  @override
  String get notificationRuleSuppressNotices =>
      'Undertrykk automatiserte meldinger';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Demper varsler fra automatiserte klienter som roboter.';

  @override
  String get notificationRuleInviteForMe => 'Inviter for meg';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Varsler bruker når en blir invitert til et rom.';

  @override
  String get notificationRuleMemberEvent => 'Member Event';

  @override
  String get notificationRuleMemberEventDescription =>
      'Suppresses notifications for membership events.';

  @override
  String get notificationRuleIsUserMention => 'Brukeromtale';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Varsler brukeren når de er direkte nevnt i en melding.';

  @override
  String get notificationRuleContainsDisplayName => 'Inneholder visningsnavn';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Varsler brukeren når en melding inneholder ens visningsnavnet.';

  @override
  String get notificationRuleIsRoomMention => 'Romomtale';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Varsler brukeren når det er en romomtale.';

  @override
  String get notificationRuleRoomnotif => 'Romvarsel';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Varsler brukeren når en melding inneholder ‘@room’.';

  @override
  String get notificationRuleTombstone => 'Gravstein';

  @override
  String get notificationRuleTombstoneDescription =>
      'Varsler brukeren om meldinger om deaktivering av rom.';

  @override
  String get notificationRuleReaction => 'Reaksjon';

  @override
  String get notificationRuleReactionDescription =>
      'Demper varsler for reaksjoner.';

  @override
  String get notificationRuleRoomServerAcl =>
      'Romserverens tilgangskontrolliste';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Suppresses notifications for room server access control lists (ACL).';

  @override
  String get notificationRuleSuppressEdits => 'Demp redigeringer';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Demper varsler for redigerte meldinger.';

  @override
  String get notificationRuleCall => 'Anrop';

  @override
  String get notificationRuleCallDescription => 'Varsler brukeren om anrop.';

  @override
  String get notificationRuleEncryptedRoomOneToOne => 'Kryptert rom én-til-én';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Varsler brukeren om meldinger i krypterte en-til-en-rom.';

  @override
  String get notificationRuleRoomOneToOne => 'Rom én-til-én';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Varsler brukeren om meldinger i én-til-én-rom.';

  @override
  String get notificationRuleMessage => 'Melding';

  @override
  String get notificationRuleMessageDescription =>
      'Varsler brukeren om generelle meldinger.';

  @override
  String get notificationRuleEncrypted => 'Kkryptert';

  @override
  String get notificationRuleEncryptedDescription =>
      'Varsler brukeren om meldinger i krypterte rom.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Varsler brukeren om hendelser i Jitsi-widgeten.';

  @override
  String get notificationRuleServerAcl => 'Suppress Server ACL Events';

  @override
  String get notificationRuleServerAclDescription =>
      'Suppresses notifications for Server ACL events.';

  @override
  String unknownPushRule(String rule) {
    return 'Ukjent push-regel \'$rule\'';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return '🎙️ $duration – Talemelding fra $sender';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Hvis du sletter denne varslingsinnstillingen, kan du ikke angre dette.';

  @override
  String get more => 'Mer';

  @override
  String get shareKeysWith => 'Del nøkler med...';

  @override
  String get shareKeysWithDescription =>
      'Hvilke enheter bør man stole på, slik at de kan lese meldingene dine i krypterte chatter?';

  @override
  String get allDevices => 'Alle enheter';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Kryssbekreftede enheter hvis dette er aktivert';

  @override
  String get crossVerifiedDevices => 'Kryssverifiserte enheter';

  @override
  String get verifiedDevicesOnly => 'Bare verifiserte enheter';

  @override
  String get takeAPhoto => 'Ta et bilde';

  @override
  String get recordAVideo => 'Ta opp en video';

  @override
  String get optionalMessage => '(Valgfritt) melding...';

  @override
  String get notSupportedOnThisDevice => 'Ikke støttet på denne enheten';

  @override
  String get enterNewChat => 'Bli med i ny chat';

  @override
  String get approve => 'Godkjenn';

  @override
  String get youHaveKnocked => 'You have knocked';

  @override
  String get pleaseWaitUntilInvited =>
      'Vennligst vent nå, til noen fra rommet inviterer deg.';

  @override
  String get commandHint_logout => 'Logg av din nåværende enhet';

  @override
  String get commandHint_logoutall => 'Logg ut alle aktive enheter';

  @override
  String get displayNavigationRail => 'Show navigation rail on mobile';

  @override
  String get customReaction => 'Egendefinert reaksjon';

  @override
  String get moreEvents => 'More events';

  @override
  String get showMore => 'Show more';

  @override
  String get showLess => 'Show less';

  @override
  String get declineInvitation => 'Avslå invitasjon';

  @override
  String get noMessagesYet => 'Ingen meldinger enda';

  @override
  String get longPressToRecordVoiceMessage =>
      'Langt trykk for å spille inn talemelding.';

  @override
  String get pause => 'Pause';

  @override
  String get resume => 'Gjenoppta';

  @override
  String get removeFromSpaceDescription =>
      'Chatten blir fjernet fra området, men vises fortsatt i chatlisten din.';

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
  String get startPoll => 'Start avstemning';

  @override
  String get endPoll => 'Avslutt avstemning';

  @override
  String get answersVisible => 'Svar synlige';

  @override
  String get pollQuestion => 'Poll question';

  @override
  String get answerOption => 'Svaralternativ';

  @override
  String get addAnswerOption => 'Legg til svaralternativ';

  @override
  String get allowMultipleAnswers => 'Tillat flere svar';

  @override
  String get pollHasBeenEnded => 'Avstemningen er avsluttet';

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
      'Svarene vil være synlige når avstemningen er avsluttet';

  @override
  String get replyInThread => 'Svar i tråden';

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
  String get thread => 'Tråd';

  @override
  String get backToMainChat => 'Tilbake til hovedchatten';

  @override
  String get saveChanges => 'Lagre endringer';

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
  String get skipChatBackup => 'Hopp over sikkerhetskopiering av chat';

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
  String get loadingMessages => 'Laster inn meldinger';

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
      'Vær oppmerksom på at videosamtaler for øyeblikket er i betaversjon. Det fungerer kanskje ikke som forventet eller i det hele tatt.';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get incomingCall => 'Incoming call';

  @override
  String get videoCall => 'Videosamtale';

  @override
  String get voiceCall => 'Taleanrop';

  @override
  String get missedCall => 'Missed call';

  @override
  String get callBack => 'Call back';

  @override
  String get hangUp => 'Hang up';

  @override
  String get waitingForParticipant => 'Waiting for participant...';

  @override
  String get decline => 'Avslå';

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
