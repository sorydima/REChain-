// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class L10nHr extends L10n {
  L10nHr([String locale = 'hr']) : super(locale);

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
  String get repeatPassword => 'Ponovi lozinku';

  @override
  String get notAnImage => 'Nije slikovna datoteka.';

  @override
  String get remove => 'Ukloni';

  @override
  String get importNow => 'Uvezi sada';

  @override
  String get importEmojis => 'Uvezi emoji slike';

  @override
  String get importFromZipFile => 'Uvezi iz .zip datoteke';

  @override
  String get exportEmotePack => 'Izvezi paket emotikona kao .zip';

  @override
  String get replace => 'Zamijeni';

  @override
  String get about => 'Informacije';

  @override
  String aboutHomeserver(String homeserver) {
    return 'Informacije o $homeserver';
  }

  @override
  String get accept => 'Prihvati';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username je prihvatio/la poziv';
  }

  @override
  String get account => 'Račun';

  @override
  String get accountsAndSettings => 'Accounts and settings';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username je aktivirao/la obostrano šifriranje';
  }

  @override
  String get addEmail => 'Dodaj e-mail';

  @override
  String get confirmREChainId =>
      'Please confirm your REChain ID in order to delete your account.';

  @override
  String supposedMxid(String mxid) {
    return 'Trebao bi biti $mxid';
  }

  @override
  String get addToSpace => 'Dodaj u prostor';

  @override
  String get admin => 'Administrator';

  @override
  String get alias => 'pseudonim';

  @override
  String get all => 'Svi';

  @override
  String get commandHint_roomupgrade =>
      'Nadogradi ovu sobu na zadanu verziju sobe';

  @override
  String get commandHint_googly => 'Pošalji kotrljajuće oči';

  @override
  String get commandHint_cuddle => 'Pošalji maženje';

  @override
  String get commandHint_hug => 'Pošalji grljenje';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName ti šalje kotrljajuće oči';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName te mazi';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName te grli';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName je odgovorio/la na poziv';
  }

  @override
  String get anyoneCanJoin => 'Svatko se može pridružiti';

  @override
  String get appLock => 'Zaključavanje programa';

  @override
  String get appLockDescription =>
      'Zaključaj aplikaciju kada je ne koristiš s PIN kodom';

  @override
  String get archive => 'Arhiv';

  @override
  String get areGuestsAllowedToJoin => 'Smiju li se gosti pridružiti';

  @override
  String get areYouSure => 'Stvarno to želiš?';

  @override
  String get discardEdits => 'You have unsaved changes. Discard your edits?';

  @override
  String get areYouSureYouWantToLogout => 'Stvarno se želiš odjaviti?';

  @override
  String get askSSSSSign =>
      'Za potpisivanje druge osobe, upiši svoju sigurnosnu lozinku ili ključ za oporavak.';

  @override
  String askVerificationRequest(String username) {
    return 'Prihvatiti ovaj zahtjev za potvrđivanje od $username?';
  }

  @override
  String get autoplayImages =>
      'Automatski pokreni animirane naljepnice i emotikone';

  @override
  String badServerLoginTypesException(
    String serverVersions,
    String supportedVersions,
    Object suportedVersions,
  ) {
    return 'Domaći poslužitelj podržava vrste prijave:\n$serverVersions\nMeđutim ovaj program podržava samo:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Pošalji pismene obavijesti';

  @override
  String get swipeRightToLeftToReply =>
      'Za odgovaranje povuci prstom zdesna ulijevo';

  @override
  String get sendOnEnter => 'Pošalji pritiskom tipke enter';

  @override
  String get noMoreChatsFound => 'No more chats found...';

  @override
  String get noChatsFoundHere =>
      'No chats found here yet. Start a new chat with someone by using the button below. ⤵️';

  @override
  String get unread => 'Unread';

  @override
  String get space => 'Space';

  @override
  String get banFromChat => 'Isključi iz razgovora';

  @override
  String get banned => 'Isključen';

  @override
  String bannedUser(String username, String targetName) {
    return '$username je isključio/la $targetName';
  }

  @override
  String get blockDevice => 'Blokiraj uređaj';

  @override
  String get blocked => 'Blokirano';

  @override
  String get cancel => 'Odustani';

  @override
  String cantOpenUri(String uri) {
    return 'URI adresa $uri se ne može otvoriti';
  }

  @override
  String get changeDeviceName => 'Promijeni ime uređaja';

  @override
  String changedTheChatAvatar(String username) {
    return '$username je promijenio/la avatar razgovora';
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
    return '$username je promijenio/la dozvole razgovora';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username je promijenio/la svoje prikazno ime u: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username je promijenio/la pravila pristupa za goste';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username je promijenio/la pravila pristupa za goste u: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username je promijenio/la vidljivost kronologije';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username je promijenio/la vidljivost kronologije u: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username je promijenio/la pravila pridruživanja';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username je promijenio/la pravila pridruživanja u: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username je promijenio/la svoj avatar';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username je promijenio/la pseudonime soba';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username je promijenio/la poveznicu poziva';
  }

  @override
  String get changePassword => 'Promijeni lozinku';

  @override
  String get changeTheHomeserver => 'Promijeni domaćeg poslužitelja';

  @override
  String get changeTheme => 'Promijeni tvoj stil';

  @override
  String get changeTheNameOfTheGroup => 'Promijeni ime grupe';

  @override
  String get changeYourAvatar => 'Promijeni svoj avatar';

  @override
  String get channelCorruptedDecryptError => 'Šifriranje je oštećeno';

  @override
  String get chat => 'Razgovor';

  @override
  String get chatBackup => 'Sigurnosna kopija razgovora';

  @override
  String get chatDetails => 'Detalji razgovora';

  @override
  String get chats => 'Razgovori';

  @override
  String get chooseAStrongPassword => 'Odaberi snažnu lozinku';

  @override
  String get clearArchive => 'Isprazni arhiv';

  @override
  String get close => 'Zatvori';

  @override
  String get commandHint_markasdm =>
      'Označi kao sobu za izravnu razmjenu poruka za zadani REChain ID';

  @override
  String get commandHint_markasgroup => 'Označi kao grupu';

  @override
  String get commandHint_ban => 'Isključi navedenog korisnika iz ove sobe';

  @override
  String get commandHint_clearcache => 'Isprazni predmemoriju';

  @override
  String get commandHint_create =>
      'Stvori prazan grupni razgovor\nKoristi --no-encryption za deaktiviranje šifriranja';

  @override
  String get commandHint_discardsession => 'Odbaci sesiju';

  @override
  String get commandHint_dm =>
      'Započni izravni razgovor\nKoristi --no-encryption za deaktiviranje šifriranja';

  @override
  String get commandHint_html => 'Pošalji HTML formatirani tekst';

  @override
  String get commandHint_invite => 'Pozovi navedenog korisnika u ovu sobu';

  @override
  String get commandHint_join => 'Pridruži se navedenoj sobi';

  @override
  String get commandHint_kick => 'Ukloni navedenog korisnika iz ove sobe';

  @override
  String get commandHint_leave => 'Napusti ovu sobu';

  @override
  String get commandHint_me => 'Opiši se';

  @override
  String get commandHint_myroomavatar =>
      'Postavi svoju sliku za ovu sobu (mxc-uri)';

  @override
  String get commandHint_myroomnick => 'Postavi svoje ime za ovu sobu';

  @override
  String get commandHint_op =>
      'Postavi razinu prava navedenog korisnika (standardno: 50)';

  @override
  String get commandHint_plain => 'Pošalji neformatirani tekst';

  @override
  String get commandHint_react => 'Pošalji odgovor kao reakciju';

  @override
  String get commandHint_send => 'Pošalji tekst';

  @override
  String get commandHint_unban =>
      'Ponovo uključi navedenog korisnika u ovu sobu';

  @override
  String get commandInvalid => 'Naredba nevaljana';

  @override
  String commandMissing(String command) {
    return '$command nije naredba.';
  }

  @override
  String get compareEmojiMatch => 'Usporedi emoji sličice';

  @override
  String get compareNumbersMatch => 'Usporedi brojeve';

  @override
  String get configureChat => 'Konfiguriraj razgovor';

  @override
  String get contactHasBeenInvitedToTheGroup => 'Kontakt je pozvan u grupu';

  @override
  String get contentHasBeenReported =>
      'Sadržaj je prijavljen administratorima poslužitelja';

  @override
  String get copiedToClipboard => 'Kopirano u međuspremnik';

  @override
  String get copy => 'Kopiraj';

  @override
  String get copyToClipboard => 'Kopiraj u međuspremnik';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Neuspjelo dešifriranje poruke: $error';
  }

  @override
  String get checkList => 'Check list';

  @override
  String countParticipants(int count) {
    return '$count sudionika';
  }

  @override
  String countInvited(int count) {
    return '$count invited';
  }

  @override
  String get create => 'Stvori';

  @override
  String createdTheChat(String username) {
    return '💬 $username je započeo/la razgovor';
  }

  @override
  String get createGroup => 'Stvori grupu';

  @override
  String get createNewSpace => 'Novi prostor';

  @override
  String get currentlyActive => 'Trenutačno aktivni';

  @override
  String get darkTheme => 'Tamna';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String get deactivateAccountWarning =>
      'Ovo će nepovratno deaktivirati tvoj korisnički račun. Stvarno to želiš?';

  @override
  String get defaultPermissionLevel =>
      'Standardna razina dozvole za nove korisnike';

  @override
  String get delete => 'Izbriši';

  @override
  String get deleteAccount => 'Izbriši račun';

  @override
  String get deleteMessage => 'Izbriši poruku';

  @override
  String get devices => 'Uređaji';

  @override
  String get directChats => 'Izravni razgovori';

  @override
  String get displaynameHasBeenChanged => 'Prikazno ime je promijenjeno';

  @override
  String get downloadFile => 'Preuzmi datoteku';

  @override
  String get edit => 'Uredi';

  @override
  String get editBlockedServers => 'Uredi blokirane poslužitelje';

  @override
  String get chatPermissions => 'Dozvole za razgovor';

  @override
  String get editDisplayname => 'Uredi prikazano ime';

  @override
  String get editRoomAliases => 'Uredi pseudonime sobe';

  @override
  String get editRoomAvatar => 'Uredi avatar sobe';

  @override
  String get emoteExists => 'Emotikon već postoji!';

  @override
  String get emoteInvalid => 'Neispravna kratica emotikona!';

  @override
  String get emoteKeyboardNoRecents =>
      'Ovdje će se pojaviti nedavno korišteni emotikoni …';

  @override
  String get globalChatId => 'Globalni ID razgovora';

  @override
  String get accessAndVisibility => 'Pristup i vidljivost';

  @override
  String get accessAndVisibilityDescription =>
      'Tko se smije pridružiti ovom razgovoru i kako se razgovor može otkriti.';

  @override
  String get customEmojisAndStickers => 'Prilagođeni emojiji i naljepnice';

  @override
  String get customEmojisAndStickersBody =>
      'Dodaj ili dijeli prilagođene emojije ili naljepnice koje se mogu koristiti u bilo kojem razgovoru.';

  @override
  String get emoteShortcode => 'Kratica emotikona';

  @override
  String get emptyChat => 'Prazan razgovor';

  @override
  String get enableEmotesGlobally => 'Aktiviraj paket emotikona globalno';

  @override
  String get enableEncryption => 'Aktiviraj šifriranje';

  @override
  String get enableEncryptionWarning =>
      'Više nećeš moći deaktivirati šifriranje. Stvarno to želiš?';

  @override
  String get encrypted => 'Šifrirano';

  @override
  String get encryption => 'Šifriranje';

  @override
  String get encryptionNotEnabled => 'Šifriranje nije aktivirano';

  @override
  String endedTheCall(String senderName) {
    return '$senderName je završio/la poziv';
  }

  @override
  String get enterAnEmailAddress => 'Upiši e-adressu';

  @override
  String errorObtainingLocation(String error) {
    return 'Greška u dohvaćanju lokacije: $error';
  }

  @override
  String get fontSize => 'Veličina fonta';

  @override
  String get forward => 'Proslijedi';

  @override
  String get fromJoining => 'Od pridruživanja';

  @override
  String get fromTheInvitation => 'Od poziva';

  @override
  String get group => 'Grupiraj';

  @override
  String get chatDescription => 'Opis razgovora';

  @override
  String get chatDescriptionHasBeenChanged => 'Opis razgovora je promijenjen';

  @override
  String get groupIsPublic => 'Grupa je javna';

  @override
  String get groups => 'Grupe';

  @override
  String groupWith(String displayname) {
    return 'Grupa s $displayname';
  }

  @override
  String get guestsAreForbidden => 'Gosti su zabranjeni';

  @override
  String get guestsCanJoin => 'Gosti se mogu pridružiti';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username je povukao/la poziv za $targetName';
  }

  @override
  String get help => 'Pomoć';

  @override
  String get hideRedactedMessages => 'Sakrij redigirane poruke';

  @override
  String get hideRedactedMessagesBody =>
      'Ako netko redigira poruku, ta poruka više neće biti vidljiva u razgovoru.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Sakrij nevažeće ili nepoznate formate poruka';

  @override
  String get block => 'Blokiraj';

  @override
  String get blockedUsers => 'Blokirani korisnici';

  @override
  String get blockListDescription =>
      'Možeš blokirati korisnike koji te ometaju. Nećeš moći primati poruke ili pozivnice za sobe od korisnika koji se nalaze u tvom osobnom popisu blokiranih.';

  @override
  String get blockUsername => 'Zanemari korisničko ime';

  @override
  String get iHaveClickedOnLink => 'Pritisnuo/la sam poveznicu';

  @override
  String get incorrectPassphraseOrKey =>
      'Neispravna lozinka ili ključ za obnavljanje';

  @override
  String get inviteContact => 'Pozovi kontakt';

  @override
  String inviteContactToGroup(String groupName) {
    return 'Pozovi kontakt u $groupName';
  }

  @override
  String get noChatDescriptionYet => 'Opis razgovora još nije stvoren.';

  @override
  String get tryAgain => 'Pokušaj ponovo';

  @override
  String get invalidServerName => 'Neispravno ime servera';

  @override
  String get invited => 'Pozvan/a';

  @override
  String get redactMessageDescription =>
      'Poruka će se redigirati za sve sudionike u ovom razgovoru. To se ne može poništiti.';

  @override
  String get optionalRedactReason =>
      '(Opcionalno) Razlog za redigiranje ove poruke …';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username je pozvao/la $targetName';
  }

  @override
  String get invitedUsersOnly => 'Samo pozvani korisnici';

  @override
  String inviteText(String username, String link) {
    return '$username te je pozvao/la u REChain. \n1. Posjeti strnicu github.com/sorydima/REChain- i instaliraj aplikaciju \n2. Registriraj ili prijavi se \n3. Otvori poveznicu poziva: \n $link';
  }

  @override
  String get isTyping => 'piše …';

  @override
  String joinedTheChat(String username) {
    return '👋 $username se pridružio/la razgovoru';
  }

  @override
  String get joinRoom => 'Pridruži se sobi';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username je izbacio/la $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username je izbacio/la i blokirao/la $targetName';
  }

  @override
  String get kickFromChat => 'Izbaci iz razgovora';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Zadnja aktivnost: $localizedTimeShort';
  }

  @override
  String get leave => 'Napusti';

  @override
  String get leftTheChat => 'Napustio/la je razgovor';

  @override
  String get lightTheme => 'Svijetla';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Učitaj još $count sudionika';
  }

  @override
  String get dehydrate => 'Izvezi sesiju i izbriši uređaj';

  @override
  String get dehydrateWarning =>
      'Ovo je nepovratna radnja. Spremi datoteku sigurnosne kopije na sigurno mjeto.';

  @override
  String get hydrate => 'Obnovi pomoću sigurnosne kopije';

  @override
  String get loadingPleaseWait => 'Učitava se … Pričekaj.';

  @override
  String get loadMore => 'Učitaj još …';

  @override
  String get locationDisabledNotice =>
      'Lokacijske usluge su deaktivirane. Za dijeljenje tvoje lokacije aktiviraj ih.';

  @override
  String get locationPermissionDeniedNotice =>
      'Lokacijske dozvole su odbijene. Za dijeljenje tvoje lokacije dozvoli ih.';

  @override
  String get login => 'Prijava';

  @override
  String logInTo(String homeserver) {
    return 'Prijavi se na $homeserver';
  }

  @override
  String get logout => 'Odjava';

  @override
  String get mention => 'Spominjanje';

  @override
  String get messages => 'Poruke';

  @override
  String get messagesStyle => 'Poruke:';

  @override
  String get moderator => 'Voditelj';

  @override
  String get muteChat => 'Isključi zvuk razgovora';

  @override
  String get newChat => 'Novi razgovor';

  @override
  String get newMessageInrechainonline => '💬 Nova poruka u REChain.';

  @override
  String get newVerificationRequest => 'Novi zahtjev za potvrđivanje!';

  @override
  String get next => 'Dalje';

  @override
  String get no => 'Ne';

  @override
  String get noConnectionToTheServer => 'Ne postoji veza s poslužiteljem';

  @override
  String get noEmotesFound => 'Nema emotikona. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Šifriranje možeš aktivirati samo nakon što soba više nije javno dostupna.';

  @override
  String get noGoogleServicesWarning =>
      'Čini se da Firebase Cloud Messaging nije dostupan na tvom uređaju. Za daljnje primanje push obavijesti, preporučujemo da instaliraš ntfy. S ntfy ili drugim pružateljem Unified Push usluge možeš primati push obavijesti na podatkovno siguran način. Ntfy možeš preuzeti s PlayStorea ili s F-Droida.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 nije REChain poslužitelj. Da li umjesto njega koristiti $server2?';
  }

  @override
  String get shareInviteLink => 'Dijeli poveznicu za poziv';

  @override
  String get scanQrCode => 'Snimi QR kod';

  @override
  String get noPasswordRecoveryDescription =>
      'Još nisi dodao/la način za obnavljanje lozinke.';

  @override
  String get noPermission => 'Bez dozvole';

  @override
  String get noRoomsFound => 'Nema soba …';

  @override
  String get notifications => 'Obavijesti';

  @override
  String numUsersTyping(int count) {
    return '$count korisnika pišu …';
  }

  @override
  String get obtainingLocation => 'Dohvaćanje lokacije …';

  @override
  String get ok => 'U redu';

  @override
  String get onlineKeyBackupEnabled =>
      'Internetski ključ sigurnosnih kopija je aktiviran';

  @override
  String get oopsPushError =>
      'Ups! Nažalost se dogodila greška prilikom postavljanja automatskog primanja obavijesti.';

  @override
  String get oopsSomethingWentWrong => 'Ups, dogodila se greška …';

  @override
  String get openAppToReadMessages => 'Za čitanje poruka, otvori program';

  @override
  String get openCamera => 'Otvori kameru';

  @override
  String get oneClientLoggedOut => 'Jedan od tvojih klijenata je odjavljen';

  @override
  String get addAccount => 'Dodaj račun';

  @override
  String get editBundlesForAccount => 'Uredi pakete za ovaj račun';

  @override
  String get addToBundle => 'Dodaj u paket';

  @override
  String get removeFromBundle => 'Ukloni iz ovog paketa';

  @override
  String get bundleName => 'Ime paketa';

  @override
  String get openInMaps => 'Otvori u kartama';

  @override
  String get link => 'Poveznica';

  @override
  String get or => 'Ili';

  @override
  String get participant => 'Sudionik';

  @override
  String get passphraseOrKey => 'tajni izraz ili ključ za obnavljanje';

  @override
  String get password => 'Lozinka';

  @override
  String get passwordForgotten => 'Zaboravljena lozinka';

  @override
  String get passwordHasBeenChanged => 'Lozinka je promijenjena';

  @override
  String get passwordRecoverySettings => 'Postavke za obnavljanje lozinke';

  @override
  String get passwordRecovery => 'Obnavljanje lozinke';

  @override
  String get pin => 'Prikvači';

  @override
  String get pleaseChooseAPasscode => 'Odaberi lozinku';

  @override
  String get pleaseClickOnLink =>
      'Pritisni poveznicu u e-poruci, zatim nastavi.';

  @override
  String get pleaseEnterYourPassword => 'Upiši svoju lozinku';

  @override
  String get pleaseEnterYourPin => 'Upiši svoj pin';

  @override
  String get pleaseEnterYourUsername => 'Upiši svoje korisničko ime';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Slijedi upute na web-stranici i dodirni „Dalje”.';

  @override
  String get privacy => 'Privatnost';

  @override
  String get publicRooms => 'Javne sobe';

  @override
  String get reason => 'Razlog';

  @override
  String redactedBy(String username) {
    return 'Preuređeno od $username';
  }

  @override
  String redactedByBecause(String username, String reason) {
    return 'Preuređeno od $username zbog: „$reason”';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username je preuredio/la događaj';
  }

  @override
  String get redactMessage => 'Ispravi poruku';

  @override
  String get reject => 'Odbij';

  @override
  String rejectedTheInvitation(String username) {
    return '$username je odbio/la poziv';
  }

  @override
  String get removeAllOtherDevices => 'Ukloni sve druge uređaje';

  @override
  String get unbanFromChat => 'Ponovo uključi u razgovor';

  @override
  String get removeYourAvatar => 'Ukloni svoj avatar';

  @override
  String get replaceRoomWithNewerVersion => 'Zamijeni sobu s novom verzijom';

  @override
  String get reply => 'Odgovori';

  @override
  String get reportMessage => 'Prijavi poruku';

  @override
  String get roomHasBeenUpgraded => 'Soba je nadograđena';

  @override
  String sendingFilesDoNotExit(int count) {
    return 'Sending $count files... Please do not exit!';
  }

  @override
  String get roomVersion => 'Verzija sobe';

  @override
  String get compressingVideo => 'Compressing video...';

  @override
  String get saveFile => 'Spremi datoteku';

  @override
  String get search => 'Traži';

  @override
  String get security => 'Sigurnost';

  @override
  String get send => 'Pošalji';

  @override
  String get sendAMessage => 'Pošalji poruku';

  @override
  String get sendAsText => 'Pošalji kao tekst';

  @override
  String get sendAudio => 'Pošalji audio datoteku';

  @override
  String get sendFile => 'Pošalji datoteku';

  @override
  String get sendImage => 'Pošalji sliku';

  @override
  String sendImages(int count) {
    return 'Send $count image';
  }

  @override
  String get sendMessages => 'Šalji poruke';

  @override
  String get sendVideo => 'Pošalji video datoteku';

  @override
  String sentAFile(String username) {
    return '📁 $username ja poslao/la datoteku';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username ja poslao/la audio snimku';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username ja poslao/la sliku';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username je poslao/la naljepnicu';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username je poslao/la video';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName je poslao/la podatke poziva';
  }

  @override
  String get setAsCanonicalAlias => 'Postavi kao glavni pseudonim';

  @override
  String get setChatDescription => 'Postavi opis rzgovora';

  @override
  String get setStatus => 'Postavi stanje';

  @override
  String get settings => 'Postavke';

  @override
  String get share => 'Dijeli';

  @override
  String sharedTheLocation(String username) {
    return '$username je dijelio/la svoje mjesto';
  }

  @override
  String get shareLocation => 'Dijeli lokaciju';

  @override
  String get skip => 'Preskoči';

  @override
  String get sourceCode => 'Izvorni kȏd';

  @override
  String get spaceIsPublic => 'Prostor je javan';

  @override
  String get spaceName => 'Ime prostora';

  @override
  String startedACall(String senderName) {
    return '$senderName ja započeo/la poziv';
  }

  @override
  String get status => 'Stanje';

  @override
  String get statusExampleMessage => 'Kako si danas?';

  @override
  String get submit => 'Pošalji';

  @override
  String get synchronizingPleaseWait => 'Sinkronizira se … Pričekaj.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Synchronizing… ($percentage%)';
  }

  @override
  String get systemTheme => 'Sustav';

  @override
  String get theyDontMatch => 'Ne poklapaju se';

  @override
  String get theyMatch => 'Poklapaju se';

  @override
  String get tooManyRequestsWarning =>
      'Previše zahtjeva. Pokušaj ponovo kasnije!';

  @override
  String get tryToSendAgain => 'Pokušaj ponovo poslati';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username je ponovo uključio/la $targetName';
  }

  @override
  String get unblockDevice => 'Deblokiraj uređaj';

  @override
  String get unknownDevice => 'Nepoznat uređaj';

  @override
  String get unknownEncryptionAlgorithm => 'Nepoznat algoritam šifriranja';

  @override
  String unknownEvent(String type) {
    return 'Nepoznat događaj \'$type\'';
  }

  @override
  String get unmuteChat => 'Uključi zvuk razgovora';

  @override
  String get unpin => 'Otkvači';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username i još $count korisnika pišu …';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username i $username2 pišu …';
  }

  @override
  String userIsTyping(String username) {
    return '$username piše …';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username je napustio/la razgovor';
  }

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username ja poslao/la $type događaj';
  }

  @override
  String get unverified => 'Nepotvrđeno';

  @override
  String get verified => 'Potvrđeno';

  @override
  String get verifyStart => 'Pokreni potvrđivanje';

  @override
  String get verifySuccess => 'Uspješno si potvrdio/la!';

  @override
  String get verifyTitle => 'Potvrđivanje drugog računa';

  @override
  String get visibilityOfTheChatHistory => 'Vidljivost povijesti razgovora';

  @override
  String get visibleForAllParticipants => 'Vidljivo za sve sudionike';

  @override
  String get visibleForEveryone => 'Vidljivo za sve';

  @override
  String get voiceMessage => 'Glasovna poruka';

  @override
  String get waitingPartnerAcceptRequest =>
      'Čeka se na sugovornika da prihvati zahtjev …';

  @override
  String get waitingPartnerEmoji =>
      'Čeka se na sugovornika da prihvati emoji …';

  @override
  String get waitingPartnerNumbers =>
      'Čeka se na sugovornika da prihvati brojeve …';

  @override
  String get warning => 'Upozorenje!';

  @override
  String get weSentYouAnEmail => 'Poslali smo ti e-poruku';

  @override
  String get whoCanPerformWhichAction => 'Tko može izvršiti koju radnju';

  @override
  String get whoIsAllowedToJoinThisGroup => 'Tko se smije pridružiti grupi';

  @override
  String get whyDoYouWantToReportThis => 'Zašto želiš ovo prijaviti?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Lozinku možeš obnoviti pomoću ovih adresa.';

  @override
  String get writeAMessage => 'Napiši poruku …';

  @override
  String get yes => 'Da';

  @override
  String get you => 'Ti';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Više ne sudjeluješ u ovom razgovoru';

  @override
  String get yourPublicKey => 'Tvoj javni ključ';

  @override
  String get messageInfo => 'Informacija poruke';

  @override
  String get time => 'Vrijeme';

  @override
  String get sender => 'Pošiljatelj';

  @override
  String get openGallery => 'Otvori galeriju';

  @override
  String get removeFromSpace => 'Ukloni iz prostora';

  @override
  String get markAsRead => 'Označi kao pročitano';

  @override
  String get reportUser => 'Prijavi korisnika';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender je reagirao/la sa $reaction';
  }

  @override
  String get pinMessage => 'Prikvači na sobu';

  @override
  String get confirmEventUnpin => 'Stvarno želiš trajno otkvačiti događaj?';

  @override
  String get emojis => 'Emojiji';

  @override
  String get unsupportedAndroidVersion => 'Nepodržana Android verzija';

  @override
  String get unsupportedAndroidVersionLong =>
      'Ova funkcija zahtijeva noviju verziju Androida. Provjeri, postoje li nove verzije ili podrška za Mobile Katya OS.';

  @override
  String get youRejectedTheInvitation => 'Odbio/la si poziv';

  @override
  String get youJoinedTheChat => 'Pridružio/la si se razgovoru';

  @override
  String get youAcceptedTheInvitation => '👍 Prihvatio/la si poziv';

  @override
  String youBannedUser(String user) {
    return 'Isključio/la si korisnika $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Povukao/la si poziv za korisnika $user';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 $user te je pozvao/la';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Pozvao/la si korisnika $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Izbacio/la si korisnika $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Izbacio/la si i blokirao/la korisnika $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Ponovo si uključio/la korisnika $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user je pokucao/la';
  }

  @override
  String get usersMustKnock => 'Korisnici moraju pokucati';

  @override
  String get noOneCanJoin => 'Nitko se ne može pridružiti';

  @override
  String get knock => 'Pokucaj';

  @override
  String get users => 'Korisnici';

  @override
  String get storeInAndroidKeystore => 'Spremi u Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Spremi u Apple KeyChain';

  @override
  String get storeSecurlyOnThisDevice => 'Spremi sigurno na ovom uređaju';

  @override
  String countFiles(int count) {
    return 'Broj datoteka: $count';
  }

  @override
  String get user => 'Korisnik';

  @override
  String get custom => 'Prilagođeno';

  @override
  String get whyIsThisMessageEncrypted =>
      'Zašto nije moguće čitati ovu poruku?';

  @override
  String get noKeyForThisMessage =>
      'To se može dogoditi ako je poruka poslana prije prijave na tvoj račun na ovom uređaju.\n\nTakođer je moguće da je pošiljatelj blokirao tvoj uređaj ili je došlo do greške s internetskom vezom.\n\nMožeš li pročitati poruku na jednoj drugoj sesiji? U tom slučaju možeš prenijeti poruku iz nje! Idi na Postavke > Uređaji i uvjeri se da su se tvoji uređaji međusobno provjerili. Kada sljedeći put otvoriš sobu i obje sesije su u prednjem planu, ključevi će se automatski prenijeti.\n\nNe želiš izgubiti ključeve kada se odjaviš ili zamijeniš uređaje? Aktiviraj spremanje sigurnosne kopije razgovora u postavkama.';

  @override
  String get newSpace => 'Novi prostor';

  @override
  String get doNotShowAgain => 'Nemoj više prikazivati';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Prazan razgovor (zvao se $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Prostori omogućuju konsolidiranje tvojih razgovora i izgradnju privatne ili javne zajednice.';

  @override
  String get encryptThisChat => 'Šifiraj ovaj razgovor';

  @override
  String get disableEncryptionWarning =>
      'Iz sigurnosnih razloga ne možeš deaktivirati šifriranje u razgovoru u kojem je prije bilo aktivirano.';

  @override
  String get sorryThatsNotPossible => 'Žao nam je … to nije moguće';

  @override
  String get reopenChat => 'Ponovo otvori razgovor';

  @override
  String get noBackupWarning =>
      'Upozorenje! Bez aktiviranja spremanja sigurnosne kopije razgovora, izgubit ćeš pristup tvojim šifriranim porukama. Preporučujemo spremanje sigurnosne kopije razgovora prije odjave.';

  @override
  String get noOtherDevicesFound => 'Nijedan drugi uređaj nije pronađen';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Neuspjelo slanje! Poslužitelj podržava samo priloge do $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Datoteka je spremljena u $path';
  }

  @override
  String get jumpToLastReadMessage => 'Skoči na zadnju pročitanu poruku';

  @override
  String get readUpToHere => 'Pročitaj do ovdje';

  @override
  String get jump => 'Skoči';

  @override
  String get openLinkInBrowser => 'Otvori poveznicu u pregledniku';

  @override
  String get reportErrorDescription =>
      '😭 Joj! Dogodila se greška. Pokušaj ponovo kasnije. Ako želiš, grešku možeš prijaviti programerima.';

  @override
  String get report => 'prijavi';

  @override
  String get setColorTheme => 'Postavi boju teme:';

  @override
  String get invite => 'Pozovi';

  @override
  String get inviteGroupChat => '📨 Pozivnica u grupni razgovor';

  @override
  String get invalidInput => 'Neispravan unos!';

  @override
  String wrongPinEntered(int seconds) {
    return 'Unesen je pogrešan PIN! Pokušaj ponovo za $seconds sekunde …';
  }

  @override
  String get pleaseEnterANumber => 'Upiši broj veći od 0';

  @override
  String get archiveRoomDescription =>
      'Razgovor će se premjestiti u arhivu. Drugi korisnici će moći vidjeti da si napustio/la razgovor.';

  @override
  String get roomUpgradeDescription =>
      'Razgovor će se tada ponovo stvoriti s novom verzijom sobe. Svi sudionici će biti obaviješteni da se moraju prebaciti na novi razgovor. Više o verzijama soba možeš saznati na https://github.com/sorydima/REChain-.git';

  @override
  String get removeDevicesDescription =>
      'Bit ćeš odjavljen/a s ovog uređaja i više nećeš moći primati poruke.';

  @override
  String get banUserDescription =>
      'Korisnik će biti isključen iz razgovora i moći će ponovo prisustvovati razgovoru kad ga se deblokira.';

  @override
  String get unbanUserDescription =>
      'Korisnik će se ponovo moći pridružiti razgovoru ako pokuša.';

  @override
  String get kickUserDescription =>
      'Korisnik je izbačen iz razgovora, ali nije blokiran. U javnim razgovorima se korisnik može ponovo pridružiti u bilo kojem trenutku.';

  @override
  String get makeAdminDescription =>
      'Nakon postavljanja ovog korisnika kao administratora, to možda nećeš moći poništiti jer će on tada imati iste dozvole kao i ti.';

  @override
  String get pushNotificationsNotAvailable =>
      'Automatsko slanje obavijesti nije dostupno';

  @override
  String get learnMore => 'Saznaj više';

  @override
  String get yourGlobalUserIdIs => 'Tvoj globalni korisnički ID je: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Nažalost nije pronađen nijedan korisnik s „$query”. Provjeri točnost upisa.';
  }

  @override
  String get knocking => 'Kucanje';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Razgovor se može otkriti pretraživanjem servera $server';
  }

  @override
  String get searchChatsRooms => 'Traži #chats, @users …';

  @override
  String get nothingFound => 'Ništa nije pronađeno...';

  @override
  String get groupName => 'Ime grupe';

  @override
  String get createGroupAndInviteUsers => 'Stvori grupu i pozovi korisnike';

  @override
  String get groupCanBeFoundViaSearch => 'Grupa se može pronaći putem pretrage';

  @override
  String get wrongRecoveryKey =>
      'Oprosti … čini se da ovo nije ispravan ključ za obnavljanje.';

  @override
  String get commandHint_sendraw => 'Pošalji neobrađeni json';

  @override
  String get databaseMigrationTitle => 'Baza podataka je optimirana';

  @override
  String get databaseMigrationBody => 'Pričekaj. Ovo može potrajati.';

  @override
  String get leaveEmptyToClearStatus =>
      'Ostavi prazno za brisanje tvog stanja.';

  @override
  String get select => 'Odaberi';

  @override
  String get searchForUsers => 'Traži @users...';

  @override
  String get pleaseEnterYourCurrentPassword => 'Upiši svoju trenutačnu lozinku';

  @override
  String get newPassword => 'Nova lozinka';

  @override
  String get pleaseChooseAStrongPassword => 'Odaberi snažnu lozinku';

  @override
  String get passwordsDoNotMatch => 'Lozinke se ne poklapaju';

  @override
  String get passwordIsWrong => 'Tvoja upisana lozinka je kriva';

  @override
  String get publicChatAddresses => 'Adrese javnih razgovora';

  @override
  String get createNewAddress => 'Stvori novu adresu';

  @override
  String get joinSpace => 'Pridruži se prostoru';

  @override
  String get publicSpaces => 'Javni prostori';

  @override
  String get addChatOrSubSpace => 'Dodaj razgovor ili podpodručje';

  @override
  String get thisDevice => 'Ovaj uređaj:';

  @override
  String get initAppError =>
      'Dogodila se greška prilikom inicijaliziranja aplikacije';

  @override
  String searchIn(String chat) {
    return 'Traži u razgovoru „$chat”...';
  }

  @override
  String get searchMore => 'Traži više...';

  @override
  String get gallery => 'Galerija';

  @override
  String get files => 'Datoteke';

  @override
  String sessionLostBody(String url, String error) {
    return 'Tvoja je sesija izgubljena. Prijavi ovu grešku programerima na $url. Poruka o grešci glasi: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Aplikacija sada pokušava obnoviti tvoju sesiju iz sigurnosne kopije. Prijavi ovu grešku programerima na $url. Poruka o grešci glasi: $error';
  }

  @override
  String get sendReadReceipts => 'Šalji potvrde o čitanju';

  @override
  String get sendTypingNotificationsDescription =>
      'Drugi sudionici u razgovoru mogu vidjeti kada pišeš novu poruku.';

  @override
  String get sendReadReceiptsDescription =>
      'Drugi sudionici u raygovoru mogu vidjeti kada pročitaš poruku.';

  @override
  String get formattedMessages => 'Formatirane poruke';

  @override
  String get formattedMessagesDescription =>
      'Prikaži formatirani sadržaj poruke poput podebljanog teksta koristeći markdown.';

  @override
  String get verifyOtherUser => '🔐 Potvrdi drugog korisnika';

  @override
  String get verifyOtherUserDescription =>
      'Ako potvrdiš jednog drugog korisnika, možeš biti siguran/na da znaš kome zapravo pišeš. 💪\n\nKada pokreneš provjeru, vi i drugi korisnik vidjet ćete skočni prozor u aplikaciji. Tamo ćeš tada vidjeti niz emojija ili brojeve koje morate međusobno usporediti.\n\nNajbolji način za to je da se nađete zajedno ili započnete videopoziv. 👭';

  @override
  String get verifyOtherDevice => '🔐 Potvrdi drugi uređaj';

  @override
  String get verifyOtherDeviceDescription =>
      'Kada potvrdiš jedan drugi uređaj, ti uređaji mogu razmjenjivati ključeve, povećavajući tvoju ukupnu sigurnost. 💪 Kada pokreneš provjeru, pojavit će se skočni prozor u aplikaciji na oba uređaja. Tamo ćeš tada vidjeti niz emojija ili brojeve koje moraš međusobno usporediti. Najbolje je imati oba uređaja pri ruci prije nego što započneš provjeru. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender je prihvatio/la potvrđivanje ključa';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender je prekinuo/la potvrđivanje ključa';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender je dovršio/la potvrđivanje ključa';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender je spreman/na za potvrđivanje ključa';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender je zatražio/la potvrđivanje ključa';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender je pokrenuo/la potvrđivanje ključa';
  }

  @override
  String get incomingMessages => 'Dolazne poruke';

  @override
  String get stickers => 'Naljepnice';

  @override
  String get discover => 'Otkrij';

  @override
  String get commandHint_ignore => 'Zanemari navedeni REChain ID';

  @override
  String get commandHint_unignore =>
      'Poništi zanemarivanje navedenog REChain ID-a';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: Nroj nepročitanih razgovora: $unread';
  }

  @override
  String get noDatabaseEncryption =>
      'Šifriranje baze podataka nije podržano na ovoj platformi';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Broj trenutačno blokiranih korisnika: $count.';
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
      'Napominjemo da se funkcija videopoziva trenutačno nalazi u beta stanju. Možda neće raditi ispravno ili uopće neće raditi na svim platformama.';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get incomingCall => 'Incoming call';

  @override
  String get videoCall => 'Video poziv';

  @override
  String get voiceCall => 'Glasovni poziv';

  @override
  String get missedCall => 'Missed call';

  @override
  String get callBack => 'Call back';

  @override
  String get hangUp => 'Hang up';

  @override
  String get waitingForParticipant => 'Waiting for participant...';

  @override
  String get decline => 'Odbij';

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
