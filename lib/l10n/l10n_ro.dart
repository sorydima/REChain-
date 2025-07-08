// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class L10nRo extends L10n {
  L10nRo([String locale = 'ro']) : super(locale);

  @override
  String get alwaysUse24HourFormat => 'false';

  @override
  String get repeatPassword => 'Repetați parola';

  @override
  String get notAnImage => 'Not an image file.';

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
  String get remove => 'Eliminați';

  @override
  String get importNow => 'Import now';

  @override
  String get importEmojis => 'Import Emojis';

  @override
  String get importFromZipFile => 'Import from .zip file';

  @override
  String get exportEmotePack => 'Export Emote pack as .zip';

  @override
  String get replace => 'Replace';

  @override
  String get about => 'Despre';

  @override
  String aboutHomeserver(String homeserver) {
    return 'About $homeserver';
  }

  @override
  String get accept => 'Accept';

  @override
  String acceptedTheInvitation(String username) {
    return '$username a aceptat invitați';
  }

  @override
  String get account => 'Cont';

  @override
  String activatedEndToEndEncryption(String username) {
    return '$username a activat criptarea end-to-end';
  }

  @override
  String get addEmail => 'Adăugați email';

  @override
  String get confirmMatrixId =>
      'Vă rugăm să confirmați REChain ID-ul vostru să ștergeți contul vostru.';

  @override
  String supposedMxid(String mxid) {
    return 'ID-ul ar trebuii să fie $mxid';
  }

  @override
  String get addChatDescription => 'Add a chat description...';

  @override
  String get addToSpace => 'Adăugați la spațiu';

  @override
  String get admin => 'Administrator';

  @override
  String get alias => 'poreclă';

  @override
  String get all => 'Toate';

  @override
  String get allChats => 'Toate Chaturile';

  @override
  String get commandHint_roomupgrade =>
      'Upgrade this room to the given room version';

  @override
  String get commandHint_googly => 'Trimiteți câțiva ochi googly';

  @override
  String get commandHint_cuddle => 'Trimiteți o îmbrățișare';

  @override
  String get commandHint_hug => 'Trimiteți o îmbrățișare';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName v-a trimis ochi googly';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName vă îmbrățișează';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName vă îmbrățișează';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName a acceptat apelul';
  }

  @override
  String get anyoneCanJoin => 'Oricine se poate alătura';

  @override
  String get appLock => 'Lacăt aplicație';

  @override
  String get appLockDescription =>
      'Lock the app when not using with a pin code';

  @override
  String get archive => 'Arhivă';

  @override
  String get areGuestsAllowedToJoin => 'Vizitatorii \"guest\" se pot alătura';

  @override
  String get areYouSure => 'Ești sigur?';

  @override
  String get areYouSureYouWantToLogout =>
      'Sunteți sigur că doriți să vă deconectați?';

  @override
  String get askSSSSSign =>
      'Pentru a putea conecta cealaltă persoană, te rog introdu parola sau cheia ta de recuperare.';

  @override
  String askVerificationRequest(String username) {
    return 'Accepți cererea de verificare de la $username?';
  }

  @override
  String get autoplayImages => 'Anima automatic stickere și emote animate';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'Homeserver-ul suportă următoarele feluri de login:\n$serverVersions\nDar această aplicație suportă numai:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Send typing notifications';

  @override
  String get swipeRightToLeftToReply => 'Swipe right to left to reply';

  @override
  String get sendOnEnter => 'Trimite cu tasta enter';

  @override
  String badServerVersionsException(
      String serverVersions,
      String supportedVersions,
      Object serverVerions,
      Object supoortedVersions,
      Object suportedVersions) {
    return 'Homeserver-ul suportă versiunele de Spec următoare:\n$serverVersions\nDar această aplicație suportă numai $supportedVersions';
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
  String get banFromChat => 'Interzis din conversație';

  @override
  String get banned => 'Interzis';

  @override
  String bannedUser(String username, String targetName) {
    return '$username a interzis pe $targetName';
  }

  @override
  String get blockDevice => 'Blochează dispozitiv';

  @override
  String get blocked => 'Blocat';

  @override
  String get botMessages => 'Mesaje Bot';

  @override
  String get cancel => 'Anulează';

  @override
  String cantOpenUri(String uri) {
    return 'Nu se poate deschide URI-ul $uri';
  }

  @override
  String get changeDeviceName => 'Schimbă numele dispozitiv';

  @override
  String changedTheChatAvatar(String username) {
    return '$username a schimbat poza conversați';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username a schimbat descrierea grupului în \'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username a schimbat porecla în \'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username a schimbat permisiunile chatului';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username s-a schimbat displayname la: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username a schimbat regulile pentru acesul musafirilor';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username a schimbat regulile pentru acesul musafirilor la: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username a schimbat vizibilitatea istoriei chatului';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username a schimbat vizibilitatea istoriei chatului la: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username a schimbat regulile de alăturare';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username a schimbat regulile de alăturare la: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username s-a schimbat avatarul';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username a schimbat pseudonimele camerei';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username a schimbat linkul de invitație';
  }

  @override
  String get changePassword => 'Schimbați parola';

  @override
  String get changeTheHomeserver => 'Schimbați homeserver-ul';

  @override
  String get changeTheme => 'Schimbați tema aplicației';

  @override
  String get changeTheNameOfTheGroup => 'Schimbați numele grupului';

  @override
  String get changeYourAvatar => 'Schimbați avatarul vostru';

  @override
  String get channelCorruptedDecryptError => 'Criptarea a fost corupată';

  @override
  String get chat => 'Chat';

  @override
  String get yourChatBackupHasBeenSetUp =>
      'Backup-ul vostru de chat a fost configurat.';

  @override
  String get chatBackup => 'Backup de chat';

  @override
  String get chatBackupDescription =>
      'Mesajele voastre vechi sunt sigurate cu o cheie de recuperare. Vă rugăm să nu o pierdeți.';

  @override
  String get chatDetails => 'Detalii de chat';

  @override
  String get chatHasBeenAddedToThisSpace =>
      'Chatul a fost adăugat la acest spațiu';

  @override
  String get chats => 'Chaturi';

  @override
  String get chooseAStrongPassword => 'Alegeți o parolă robustă';

  @override
  String get clearArchive => 'Ștergeți arhiva';

  @override
  String get close => 'Închideți';

  @override
  String get commandHint_markasdm => 'Marcați ca cameră de mesaje directe';

  @override
  String get commandHint_markasgroup => 'Marcați ca grup';

  @override
  String get commandHint_ban =>
      'Interziceți acesul utilizatorului ales din această cameră';

  @override
  String get commandHint_clearcache => 'Ștergeți cache';

  @override
  String get commandHint_create =>
      'Creați un grup de chat gol\nFolosiți --no-encryption să dezactivați criptare';

  @override
  String get commandHint_discardsession => 'Renunțați sesiunea';

  @override
  String get commandHint_dm =>
      'Porniți un chat direct\nFolosiți --no-encryption să dezactivați criptare';

  @override
  String get commandHint_html => 'Trimiteți text format ca HTML';

  @override
  String get commandHint_invite =>
      'Invitați utilizatorul ales la această cameră';

  @override
  String get commandHint_join => 'Alăturați-vă la camera alesă';

  @override
  String get commandHint_kick =>
      'Dați afară pe utilizatorul ales din această cameră';

  @override
  String get commandHint_leave => 'Renunțați la această cameră';

  @override
  String get commandHint_me => 'Descrieți-vă';

  @override
  String get commandHint_myroomavatar =>
      'Alegeți un avatar pentru această cameră (foloșește mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Alegeți un displayname pentru această cameră';

  @override
  String get commandHint_op =>
      'Stabiliți nivelul de putere a utilizatorul ales (implicit: 50)';

  @override
  String get commandHint_plain => 'Trimiteți text simplu/neformatat';

  @override
  String get commandHint_react => 'Trimiteți răspuns ca reacție';

  @override
  String get commandHint_send => 'Trimiteți text';

  @override
  String get commandHint_unban =>
      'Dezinterziceți utilizatorul ales din această cameră';

  @override
  String get commandInvalid => 'Comandă nevalibilă';

  @override
  String commandMissing(String command) {
    return '$command nu este o comandă.';
  }

  @override
  String get compareEmojiMatch => 'Vă rugăm să comparați emoji-urile';

  @override
  String get compareNumbersMatch => 'Vă rugăm să comparați numerele';

  @override
  String get configureChat => 'Configurați chat';

  @override
  String get confirm => 'Confirmați';

  @override
  String get connect => 'Conectați';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Contactul a fost invitat la grup';

  @override
  String get containsDisplayName => 'Conține displayname';

  @override
  String get containsUserName => 'Conține nume de utilizator';

  @override
  String get contentHasBeenReported =>
      'Conținutul a fost reportat la administratori serverului';

  @override
  String get copiedToClipboard => 'Copiat în clipboard';

  @override
  String get copy => 'Copiați';

  @override
  String get copyToClipboard => 'Copiați în clipboard';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Dezcriptarea mesajului a eșuat: $error';
  }

  @override
  String get checkList => 'Check list';

  @override
  String countParticipants(int count) {
    return '$count participanți';
  }

  @override
  String countInvited(int count) {
    return '$count invited';
  }

  @override
  String get create => 'Creați';

  @override
  String createdTheChat(String username) {
    return '💬$username a creat chatul';
  }

  @override
  String get createGroup => 'Create group';

  @override
  String get createNewSpace => 'Spațiu nou';

  @override
  String get currentlyActive => 'Activ acum';

  @override
  String get darkTheme => 'Întunecat';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String dateWithoutYear(String month, String day) {
    return '$month-$day';
  }

  @override
  String dateWithYear(String year, String month, String day) {
    return '$year-$month-$day';
  }

  @override
  String get deactivateAccountWarning =>
      'Această acțiune va dezactiva contul vostru. Nu poate fi anulat! Sunteți sigur?';

  @override
  String get defaultPermissionLevel => 'Nivel de permisiuni implicită';

  @override
  String get delete => 'Ștergeți';

  @override
  String get deleteAccount => 'Ștergeți contul';

  @override
  String get deleteMessage => 'Ștergeți mesajul';

  @override
  String get device => 'Dispozitiv';

  @override
  String get deviceId => 'ID-ul Dispozitiv';

  @override
  String get devices => 'Dispozitive';

  @override
  String get directChats => 'Chaturi directe';

  @override
  String get allRooms => 'Toate chaturi de grup';

  @override
  String get displaynameHasBeenChanged => 'Displayname a fost schimbat';

  @override
  String get downloadFile => 'Descărcați fișierul';

  @override
  String get edit => 'Editați';

  @override
  String get editBlockedServers => 'Editați servere blocate';

  @override
  String get chatPermissions => 'Chat permissions';

  @override
  String get editDisplayname => 'Schimbați displayname';

  @override
  String get editRoomAliases => 'Schimbați pseudonimele camerei';

  @override
  String get editRoomAvatar => 'Schimbați avatarul din cameră';

  @override
  String get emoteExists => 'Emote deja există!';

  @override
  String get emoteInvalid => 'Shortcode de emote nevalibil!';

  @override
  String get emoteKeyboardNoRecents =>
      'Recently-used emotes will appear here...';

  @override
  String get emotePacks => 'Pachete de emoturi din cameră';

  @override
  String get emoteSettings => 'Configurări Emote';

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
  String get emoteShortcode => 'Shortcode de emote';

  @override
  String get emoteWarnNeedToPick =>
      'Trebuie să alegeți shortcode pentru emote și o imagine!';

  @override
  String get emptyChat => 'Chat gol';

  @override
  String get enableEmotesGlobally => 'Activați pachet de emote global';

  @override
  String get enableEncryption => 'Activați criptare';

  @override
  String get enableEncryptionWarning =>
      'Activând criptare, nu mai puteți să o dezactivați în viitor. Sunteți sigur?';

  @override
  String get encrypted => 'Criptat';

  @override
  String get encryption => 'Criptare';

  @override
  String get encryptionNotEnabled => 'Criptare nu e activată';

  @override
  String endedTheCall(String senderName) {
    return '$senderName a terminat apelul';
  }

  @override
  String get enterAnEmailAddress => 'Introduceți o adresă email';

  @override
  String get homeserver => 'Homeserver';

  @override
  String get enterYourHomeserver => 'Introduceți homeserverul vostru';

  @override
  String errorObtainingLocation(String error) {
    return 'Obținerea locației a eșuat: $error';
  }

  @override
  String get everythingReady => 'Totul e gata!';

  @override
  String get extremeOffensive => 'De foarte mare ofensă';

  @override
  String get fileName => 'Nume de fișier';

  @override
  String get rechainonline => 'rechainonline';

  @override
  String get fontSize => 'Mărimea fontului';

  @override
  String get forward => 'Înainte';

  @override
  String get fromJoining => 'De la alăturare';

  @override
  String get fromTheInvitation => 'De la invitația';

  @override
  String get goToTheNewRoom => 'Mergeți la camera nouă';

  @override
  String get group => 'Grup';

  @override
  String get chatDescription => 'Chat description';

  @override
  String get chatDescriptionHasBeenChanged => 'Chat description changed';

  @override
  String get groupIsPublic => 'Grupul este public';

  @override
  String get groups => 'Grupuri';

  @override
  String groupWith(String displayname) {
    return 'Grup cu $displayname';
  }

  @override
  String get guestsAreForbidden => 'Musafiri sunt interziși';

  @override
  String get guestsCanJoin => 'Musafiri pot să se alăture';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username a retras invitația pentru $targetName';
  }

  @override
  String get help => 'Ajutor';

  @override
  String get hideRedactedEvents => 'Ascunde evenimente redactate';

  @override
  String get hideRedactedMessages => 'Hide redacted messages';

  @override
  String get hideRedactedMessagesBody =>
      'If someone redacts a message, this message won\'t be visible in the chat anymore.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Hide invalid or unknown message formats';

  @override
  String get howOffensiveIsThisContent => 'Cât de ofensiv este acest conținut?';

  @override
  String get id => 'ID';

  @override
  String get identity => 'Identitate';

  @override
  String get block => 'Block';

  @override
  String get blockedUsers => 'Blocked users';

  @override
  String get blockListDescription =>
      'You can block users who are disturbing you. You won\'t be able to receive any messages or room invites from the users on your personal block list.';

  @override
  String get blockUsername => 'Ignore username';

  @override
  String get iHaveClickedOnLink => 'Am făcut click pe link';

  @override
  String get incorrectPassphraseOrKey =>
      'Parolă sau cheie de recuperare incorectă';

  @override
  String get inoffensive => 'Inofensiv';

  @override
  String get inviteContact => 'Invitați contact';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return 'Do you want to invite $contact to the chat \"$groupName\"?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Invitați contact la $groupName';
  }

  @override
  String get noChatDescriptionYet => 'No chat description created yet.';

  @override
  String get tryAgain => 'Try again';

  @override
  String get invalidServerName => 'Invalid server name';

  @override
  String get invited => 'Invitat';

  @override
  String get redactMessageDescription =>
      'The message will be redacted for all participants in this conversation. This cannot be undone.';

  @override
  String get optionalRedactReason =>
      '(Optional) Reason for redacting this message...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩$username a invitat $targetName';
  }

  @override
  String get invitedUsersOnly => 'Numai utilizatori invitați';

  @override
  String get inviteForMe => 'Invitați pentru mine';

  @override
  String inviteText(String username, String link) {
    return '$username v-a invitat la REChain.\n1. Instalați REChain: https://online.rechain.network\n2. Înregistrați-vă sau conectați-vă\n3. Deschideți invitația: $link';
  }

  @override
  String get isTyping => 'tastează…';

  @override
  String joinedTheChat(String username) {
    return '👋$username a intrat în chat';
  }

  @override
  String get joinRoom => 'Alăturați la cameră';

  @override
  String kicked(String username, String targetName) {
    return '👞$username a dat afară pe $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅$username a dat afară și a interzis pe $targetName din cameră';
  }

  @override
  String get kickFromChat => 'Dați afară din chat';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Ultima dată activ: $localizedTimeShort';
  }

  @override
  String get leave => 'Renunțați';

  @override
  String get leftTheChat => 'A plecat din chat';

  @override
  String get license => 'Permis';

  @override
  String get lightTheme => 'Luminat';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Încărcați încă mai $count participanți';
  }

  @override
  String get dehydrate => 'Exportați sesiunea și ștergeți dispozitivul';

  @override
  String get dehydrateWarning =>
      'Această actiune nu poate fi anulată. Asigurați-vă că păstrați fișierul backup.';

  @override
  String get dehydrateTor => 'Utilizatori de TOR: Exportați sesiunea';

  @override
  String get dehydrateTorLong =>
      'Pentru utilizatori de TOR, este recomandat să exportați sesiunea înainte de a închideți fereastra.';

  @override
  String get hydrateTor => 'Utilizatori TOR: Importați sesiune exportată';

  @override
  String get hydrateTorLong =>
      'Ați exportat sesiunea vostră ultima dată pe TOR? Importați-o repede și continuați să conversați.';

  @override
  String get hydrate => 'Restaurați din fișier backup';

  @override
  String get loadingPleaseWait => 'Încărcând... Vă rugăm să așteptați.';

  @override
  String get loadMore => 'Încarcă mai multe…';

  @override
  String get locationDisabledNotice =>
      'Servicile de locație sunt dezactivate. Vă rugăm să le activați să împărțiți locația voastră.';

  @override
  String get locationPermissionDeniedNotice =>
      'Permisiunea locației blocată. Vă rugăm să o dezblocați să împărțiți locația voastră.';

  @override
  String get login => 'Conectați-vă';

  @override
  String logInTo(String homeserver) {
    return 'Conectați-vă la $homeserver';
  }

  @override
  String get logout => 'Deconectați-vă';

  @override
  String get memberChanges => 'Schimbări de membri';

  @override
  String get mention => 'Menționați';

  @override
  String get messages => 'Mesaje';

  @override
  String get messagesStyle => 'Messages:';

  @override
  String get moderator => 'Moderator';

  @override
  String get muteChat => 'Amuțați chatul';

  @override
  String get needPantalaimonWarning =>
      'Vă rugăm să fiți conștienți că e nevoie de Pantalaimon să folosiți criptare end-to-end deocamdată.';

  @override
  String get newChat => 'Chat nou';

  @override
  String get newMessageInrechainonline => '💬 Mesaj nou în rechainonline';

  @override
  String get newVerificationRequest => 'Cerere de verificare nouă!';

  @override
  String get next => 'Următor';

  @override
  String get no => 'Nu';

  @override
  String get noConnectionToTheServer => 'Fără conexiune la server';

  @override
  String get noEmotesFound => 'Nu s-a găsit nici un emote. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Criptare nu poate fi activată până când camera este accesibilă public.';

  @override
  String get noGoogleServicesWarning =>
      'Se pare că nu aveți serviciile google pe dispozitivul vostru. Această decizie este bună pentru confidențialitatea voastră! Să primiți notificari push în REChain vă recomandăm https://microg.org/ sau https://unifiedpush.org/.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 nu este server REChain, înlocuiți cu $server2?';
  }

  @override
  String get shareInviteLink => 'Share invite link';

  @override
  String get scanQrCode => 'Scanați cod QR';

  @override
  String get none => 'Niciunul';

  @override
  String get noPasswordRecoveryDescription =>
      'Nu ați adăugat încă nici un mod de recuperare pentru parola voastră.';

  @override
  String get noPermission => 'Fără permisie';

  @override
  String get noRoomsFound => 'Nici o cameră nu s-a găsit…';

  @override
  String get notifications => 'Notificări';

  @override
  String get notificationsEnabledForThisAccount =>
      'Notificări activate pentru acest cont';

  @override
  String numUsersTyping(int count) {
    return '$count utilizatori tastează…';
  }

  @override
  String get obtainingLocation => 'Obținând locație…';

  @override
  String get offensive => 'Ofensiv';

  @override
  String get offline => 'Offline';

  @override
  String get ok => 'Ok';

  @override
  String get online => 'Online';

  @override
  String get onlineKeyBackupEnabled => 'Backup de cheie online este activat';

  @override
  String get oopsPushError =>
      'Ups! Din păcate, o eroare s-a întâmplat cu stabilirea de notificări push.';

  @override
  String get oopsSomethingWentWrong => 'Ups, ceva a eșuat…';

  @override
  String get openAppToReadMessages => 'Deschideți aplicația să citiți mesajele';

  @override
  String get openCamera => 'Deschideți camera';

  @override
  String get openVideoCamera => 'Deschideți camera pentru video';

  @override
  String get oneClientLoggedOut =>
      'Unul dintre clienților voștri a fost deconectat';

  @override
  String get addAccount => 'Adăugați cont';

  @override
  String get editBundlesForAccount => 'Editați pachetele pentru acest cont';

  @override
  String get addToBundle => 'Adăugați în pachet';

  @override
  String get removeFromBundle => 'Stergeți din acest pachet';

  @override
  String get bundleName => 'Numele pachetului';

  @override
  String get enableMultiAccounts =>
      '(BETA) Activați multiple conturi pe acest dispozitiv';

  @override
  String get openInMaps => 'Deschideți pe hartă';

  @override
  String get link => 'Link';

  @override
  String get serverRequiresEmail =>
      'Acest server trebuie să valideze emailul vostru pentru înregistrare.';

  @override
  String get or => 'Sau';

  @override
  String get participant => 'Participant';

  @override
  String get passphraseOrKey => 'frază de acces sau cheie de recuperare';

  @override
  String get password => 'Parolă';

  @override
  String get passwordForgotten => 'Parola uitată';

  @override
  String get passwordHasBeenChanged => 'Parola a fost schimbată';

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
  String get passwordRecovery => 'Recuperare parolei';

  @override
  String get people => 'Persoane';

  @override
  String get pickImage => 'Alegeți o imagine';

  @override
  String get pin => 'Fixați';

  @override
  String play(String fileName) {
    return 'Redați $fileName';
  }

  @override
  String get pleaseChoose => 'Vă rugăm să alegeți';

  @override
  String get pleaseChooseAPasscode => 'Vă rugăm să alegeți un passcode';

  @override
  String get pleaseClickOnLink =>
      'Vă rugăm să deschideți linkul din email și apoi să procedați.';

  @override
  String get pleaseEnter4Digits =>
      'Vă rugăm să introduceți 4 cifre sau puteți să lăsați gol să dezactivați lacătul aplicației.';

  @override
  String get pleaseEnterRecoveryKey =>
      'Vă rugăm să introduceți cheia voastră de recuperare:';

  @override
  String get pleaseEnterYourPassword =>
      'Vă rugăm să introduceți parola voastră';

  @override
  String get pleaseEnterYourPin => 'Vă rugăm să introduceți pinul vostru';

  @override
  String get pleaseEnterYourUsername =>
      'Vă rugăm să introduceți username-ul vostru';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Vă rugăm să urmați instrucțiunele pe website și apoi să apăsați pe următor.';

  @override
  String get privacy => 'Confidențialitate';

  @override
  String get publicRooms => 'Camere Publice';

  @override
  String get pushRules => 'Regulile Push';

  @override
  String get reason => 'Motiv';

  @override
  String get recording => 'Înregistrare';

  @override
  String redactedBy(String username) {
    return 'Redacted by $username';
  }

  @override
  String get directChat => 'Direct chat';

  @override
  String redactedByBecause(String username, String reason) {
    return 'Redacted by $username because: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username a redactat un eveniment';
  }

  @override
  String get redactMessage => 'Redactați mesaj';

  @override
  String get register => 'Înregistrați-vă';

  @override
  String get reject => 'Respingeți';

  @override
  String rejectedTheInvitation(String username) {
    return '$username a respins invitația';
  }

  @override
  String get rejoin => 'Reintrați';

  @override
  String get removeAllOtherDevices => 'Eliminați toate celelalte dispozitive';

  @override
  String removedBy(String username) {
    return 'Eliminat de $username';
  }

  @override
  String get removeDevice => 'Eliminați dispozitivul';

  @override
  String get unbanFromChat => 'Revoca interzicerea din chat';

  @override
  String get removeYourAvatar => 'Ștergeți avatarul';

  @override
  String get replaceRoomWithNewerVersion =>
      'Înlocuiți camera cu versiune mai nouă';

  @override
  String get reply => 'Răspundeți';

  @override
  String get reportMessage => 'Raportați mesajul';

  @override
  String get requestPermission => 'Cereți permisiune';

  @override
  String get roomHasBeenUpgraded => 'Camera a fost actualizată';

  @override
  String get roomVersion => 'Versiunea camerei';

  @override
  String get saveFile => 'Salvați fișierul';

  @override
  String get search => 'Căutați';

  @override
  String get security => 'Securitate';

  @override
  String get recoveryKey => 'Cheie de recuperare';

  @override
  String get recoveryKeyLost => 'Cheia de recuperare pierdută?';

  @override
  String seenByUser(String username) {
    return 'Văzut de $username';
  }

  @override
  String get send => 'Trimiteți';

  @override
  String get sendAMessage => 'Trimiteți un mesaj';

  @override
  String get sendAsText => 'Trimiteți ca text';

  @override
  String get sendAudio => 'Trimiteți audio';

  @override
  String get sendFile => 'Trimiteți fișier';

  @override
  String get sendImage => 'Trimiteți imagine';

  @override
  String sendImages(int count) {
    return 'Send $count image';
  }

  @override
  String get sendMessages => 'Trimiteți mesaje';

  @override
  String get sendOriginal => 'Trimiteți original';

  @override
  String get sendSticker => 'Trimiteți sticker';

  @override
  String get sendVideo => 'Trimiteți video';

  @override
  String sentAFile(String username) {
    return '📁$username a trimis un fișier';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤$username a trimis audio';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username a trimis o poză';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username a trimis un sticker';
  }

  @override
  String sentAVideo(String username) {
    return '🎥$username a trimis un video';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName a trimis informație de apel';
  }

  @override
  String get separateChatTypes => 'Afișați chaturi directe și grupuri separat';

  @override
  String get setAsCanonicalAlias => 'Stabiliți ca pseudonimul primar';

  @override
  String get setCustomEmotes => 'Stabiliți emoji-uri personalizate';

  @override
  String get setChatDescription => 'Set chat description';

  @override
  String get setInvitationLink => 'Stabiliți linkul de invitație';

  @override
  String get setPermissionsLevel => 'Stabiliți nivelul de permisii';

  @override
  String get setStatus => 'Stabiliți status';

  @override
  String get settings => 'Configurări';

  @override
  String get share => 'Partajați';

  @override
  String sharedTheLocation(String username) {
    return '$username sa partajat locația';
  }

  @override
  String get shareLocation => 'Partajați locația';

  @override
  String get showPassword => 'Afișați parola';

  @override
  String get presenceStyle => 'Presence:';

  @override
  String get presencesToggle => 'Show status messages from other users';

  @override
  String get singlesignon => 'Autentificare unică';

  @override
  String get skip => 'Săriți peste';

  @override
  String get sourceCode => 'Codul surs';

  @override
  String get spaceIsPublic => 'Spațiul este public';

  @override
  String get spaceName => 'Numele spațiului';

  @override
  String startedACall(String senderName) {
    return '$senderName a început un apel';
  }

  @override
  String get startFirstChat => 'Începeți primul chatul vostru';

  @override
  String get status => 'Status';

  @override
  String get statusExampleMessage => 'Ce faceți?';

  @override
  String get submit => 'Trimiteți';

  @override
  String get synchronizingPleaseWait =>
      'Sincronizează... Vă rugăm să așteptați.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Synchronizing… ($percentage%)';
  }

  @override
  String get systemTheme => 'Sistem';

  @override
  String get theyDontMatch => 'Nu sunt asemănători';

  @override
  String get theyMatch => 'Sunt asemănători';

  @override
  String get title => 'rechainonline';

  @override
  String get toggleFavorite => 'Comutați favoritul';

  @override
  String get toggleMuted => 'Comutați amuțeștarea';

  @override
  String get toggleUnread => 'Marcați Citit/Necitit';

  @override
  String get tooManyRequestsWarning =>
      'Prea multe cereri. Vă rugăm să încercați din nou mai tărziu!';

  @override
  String get transferFromAnotherDevice => 'Transfera de la alt dispozitiv';

  @override
  String get tryToSendAgain => 'Încercați să trimiteți din nou';

  @override
  String get unavailable => 'Nedisponibil';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username a ridicat interzicerea lui $targetName';
  }

  @override
  String get unblockDevice => 'Debloca dispozitiv';

  @override
  String get unknownDevice => 'Dispozitiv necunoscut';

  @override
  String get unknownEncryptionAlgorithm => 'Algoritm de criptare necunoscut';

  @override
  String unknownEvent(String type) {
    return 'Evenimet necunoscut \'$type\'';
  }

  @override
  String get unmuteChat => 'Dezamuțați chat';

  @override
  String get unpin => 'Anulează fixarea';

  @override
  String unreadChats(int unreadCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount chaturi necitite',
      one: 'Un chat necitit',
    );
    return '$_temp0';
  }

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username și $count alți tastează…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username și $username2 tastează…';
  }

  @override
  String userIsTyping(String username) {
    return '$username tastează…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪$username a plecat din chat';
  }

  @override
  String get username => 'Nume de utilizator';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username a trimis un eveniment $type';
  }

  @override
  String get unverified => 'Neverificat';

  @override
  String get verified => 'Verificat';

  @override
  String get verify => 'Verificați';

  @override
  String get verifyStart => 'Începeți verificare';

  @override
  String get verifySuccess => 'A reușit verificarea!';

  @override
  String get verifyTitle => 'Verificând celălalt cont';

  @override
  String get videoCall => 'Apel video';

  @override
  String get visibilityOfTheChatHistory => 'Vizibilitatea istoria chatului';

  @override
  String get visibleForAllParticipants => 'Vizibil pentru toți participanți';

  @override
  String get visibleForEveryone => 'Vizibil pentru toți';

  @override
  String get voiceMessage => 'Mesaj vocal';

  @override
  String get waitingPartnerAcceptRequest =>
      'Așteptând pe partenerul să accepte cererea…';

  @override
  String get waitingPartnerEmoji =>
      'Așteptând pe partenerul să accepte emoji-ul…';

  @override
  String get waitingPartnerNumbers =>
      'Așteptând pe partenerul să accepte numerele…';

  @override
  String get wallpaper => 'Imagine de fundal';

  @override
  String get warning => 'Avertizment!';

  @override
  String get weSentYouAnEmail => 'V-am trimis un email';

  @override
  String get whoCanPerformWhichAction => 'Cine poate face care acțiune';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'Cine se poate alătura la acest grup';

  @override
  String get whyDoYouWantToReportThis =>
      'De ce doriți să reportați acest conținut?';

  @override
  String get wipeChatBackup =>
      'Ștergeți backup-ul vostru de chat să creați o nouă cheie de recuperare?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Cu acestea adrese puteți să vă recuperați parola.';

  @override
  String get writeAMessage => 'Scrieți un mesaj…';

  @override
  String get yes => 'Da';

  @override
  String get you => 'Voi';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Nu mai participați în acest chat';

  @override
  String get youHaveBeenBannedFromThisChat =>
      'Ați fost interzis din acest chat';

  @override
  String get yourPublicKey => 'Cheia voastră publică';

  @override
  String get messageInfo => 'Info mesajului';

  @override
  String get time => 'Timp';

  @override
  String get messageType => 'Fel de mesaj';

  @override
  String get sender => 'Trimițător';

  @override
  String get openGallery => 'Deschideți galeria';

  @override
  String get removeFromSpace => 'Eliminați din spațiu';

  @override
  String get addToSpaceDescription =>
      'Alegeți un spațiu în care să adăugați acest chat.';

  @override
  String get start => 'Începeți';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'Să vă deblocați mesajele vechi, vă rugăm să introduceți cheia de recuperare creată de o seșiune anterioră. Cheia de recuperare NU este parola voastră.';

  @override
  String get publish => 'Publicați';

  @override
  String videoWithSize(String size) {
    return 'Video ($size)';
  }

  @override
  String get openChat => 'Deschideți Chat';

  @override
  String get markAsRead => 'Marcați ca citit';

  @override
  String get reportUser => 'Reportați utilizator';

  @override
  String get dismiss => 'Respingeți';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender a reacționat cu $reaction';
  }

  @override
  String get pinMessage => 'Fixați în cameră';

  @override
  String get confirmEventUnpin =>
      'Sunteți sigur că doriți să anulați permanent fixarea evenimentului?';

  @override
  String get emojis => 'Emoji-uri';

  @override
  String get placeCall => 'Faceți apel';

  @override
  String get voiceCall => 'Apel vocal';

  @override
  String get unsupportedAndroidVersion => 'Versiune de Android nesuportat';

  @override
  String get unsupportedAndroidVersionLong =>
      'Această funcție are nevoie de o versiune de Android mai nouă. Vă rugăm să verificați dacă sunt actualizări sau suport de la Mobile Katya OS.';

  @override
  String get videoCallsBetaWarning =>
      'Vă rugăm să luați notă că apeluri video sunt în beta. Se poate că nu funcționează normal sau de loc pe fie care platformă.';

  @override
  String get experimentalVideoCalls => 'Apeluri video experimentale';

  @override
  String get emailOrUsername => 'Email sau nume de utilizator';

  @override
  String get indexedDbErrorTitle => 'Probleme cu modul privat';

  @override
  String get indexedDbErrorLong =>
      'Stocarea de mesaje nu este activat implicit în modul privat.\nVă rugăm să vizitați\n- about:config\n- stabiliți dom.indexedDB.privateBrowsing.enabled la true\nAstfel, nu este posibil să folosiți REChain.';

  @override
  String switchToAccount(String number) {
    return 'Schimbați la contul $number';
  }

  @override
  String get nextAccount => 'Contul următor';

  @override
  String get previousAccount => 'Contul anterior';

  @override
  String get addWidget => 'Adăugați widget';

  @override
  String get widgetVideo => 'Video';

  @override
  String get widgetEtherpad => 'Notiță text';

  @override
  String get widgetJitsi => 'Jitsi Meet';

  @override
  String get widgetCustom => 'Personalizat';

  @override
  String get widgetName => 'Nume';

  @override
  String get widgetUrlError => 'Acest URL nu este valibil.';

  @override
  String get widgetNameError => 'Vă rugăm să introduceți un nume de afișare.';

  @override
  String get errorAddingWidget => 'Adăugarea widget-ului a eșuat.';

  @override
  String get youRejectedTheInvitation => 'Ați respins invitația';

  @override
  String get youJoinedTheChat => 'Va-ți alăturat la chat';

  @override
  String get youAcceptedTheInvitation => '👍Ați acceptat invitația';

  @override
  String youBannedUser(String user) {
    return 'Ați interzis pe $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Ați retras invitația pentru $user';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 You have been invited via link to:\n$alias';
  }

  @override
  String youInvitedBy(String user) {
    return '📩Ați fost invitat de $user';
  }

  @override
  String invitedBy(String user) {
    return '📩 Invited by $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩Ați invitat pe $user';
  }

  @override
  String youKicked(String user) {
    return '👞Ați dat afară pe $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅Ați dat afară și interzis pe $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Ați ridicat interzicerea lui $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user has knocked';
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
  String get users => 'Utilizatori';

  @override
  String get unlockOldMessages => 'Deblocați mesajele vechi';

  @override
  String get storeInSecureStorageDescription =>
      'Păstrați cheia de recuperare în stocarea sigură a acestui dispozitiv.';

  @override
  String get saveKeyManuallyDescription =>
      'Activați dialogul de partajare sistemului sau folosiți clipboard-ul să salvați manual această cheie.';

  @override
  String get storeInAndroidKeystore => 'Stoca în Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Stoca în Apple KeyChain';

  @override
  String get storeSecurlyOnThisDevice => 'Stoca sigur pe acest dispozitiv';

  @override
  String countFiles(int count) {
    return '$count fișiere';
  }

  @override
  String get user => 'Utilizator';

  @override
  String get custom => 'Personalizat';

  @override
  String get foregroundServiceRunning =>
      'Această notificare apare când serviciul de foreground rulează.';

  @override
  String get screenSharingTitle => 'partajarea de ecran';

  @override
  String get screenSharingDetail => 'Partajați ecranul în rechainonline';

  @override
  String get callingPermissions => 'Permisiuni de apel';

  @override
  String get callingAccount => 'Cont de apel';

  @override
  String get callingAccountDetails =>
      'Permite REChain să folosească aplicația de apeluri nativă android.';

  @override
  String get appearOnTop => 'Apare deasupra';

  @override
  String get appearOnTopDetails =>
      'Permite aplicația să apare deasupra (nu este necesar dacă aveți REChain stabilit ca cont de apeluri)';

  @override
  String get otherCallingPermissions =>
      'Microfon, cameră și alte permisiuni lui rechainonline';

  @override
  String get whyIsThisMessageEncrypted => 'De ce este acest mesaj ilizibil?';

  @override
  String get noKeyForThisMessage =>
      'Această chestie poate să se întâmple când mesajul a fost trimis înainte să vă conectați contul cu acest dispozitiv.\n\nO altă explicație ar fi dacă trimițătorul a blocat dispozitivul vostru sau ceva s-a întâmplat cu conexiunea la internet\n\nPuteți să citiți mesajul în o altă seșiune? Atunci puteți să transferați mesajul de acolo! Mergeți la Configurări > Dispozitive și verificați că dispozitivele s-au verificat. Când deschideți camera în viitor și ambele seșiune sunt în foreground, cheile va fi transmise automat. \n\nDoriți să îți păstrați cheile când deconectați sau schimbați dispozitive? Fiți atenți să activați backup de chat în configurări.';

  @override
  String get newGroup => 'Grup nou';

  @override
  String get newSpace => 'Spațiu nou';

  @override
  String get enterSpace => 'Intrați în spațiu';

  @override
  String get enterRoom => 'Intrați în cameră';

  @override
  String get allSpaces => 'Toate spațiile';

  @override
  String numChats(String number) {
    return '$number chaturi';
  }

  @override
  String get hideUnimportantStateEvents =>
      'Ascundeți evenimente de stare neimportante';

  @override
  String get hidePresences => 'Hide Status List?';

  @override
  String get doNotShowAgain => 'Nu se mai apară din nou';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Chat gol (a fost $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Spațiile vă permit să vă consolidați chaturile și să stabiliți comunități private sau publice.';

  @override
  String get encryptThisChat => 'Criptați acest chat';

  @override
  String get disableEncryptionWarning =>
      'Pentru motive de securitate, nu este posibil să dezactivați criptarea unui chat în care criptare este activată.';

  @override
  String get sorryThatsNotPossible => 'Scuze... acest nu este posibil';

  @override
  String get deviceKeys => 'Cheile dispozitivului:';

  @override
  String get reopenChat => 'Deschide din nou chatul';

  @override
  String get noBackupWarning =>
      'Avertisment! Fără să activați backup de chat, veți pierde accesul la mesajele voastre criptate. E foarte recomandat să activați backup de chat înainte să vă deconectați.';

  @override
  String get noOtherDevicesFound => 'Nu s-a găsit alte dispozitive';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Serverul reportează că fișierul este prea mare să fie trimis.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Fișierul a fost salvat la $path';
  }

  @override
  String get jumpToLastReadMessage => 'Săriți la ultimul citit mesaj';

  @override
  String get readUpToHere => 'Citit până aici';

  @override
  String get jump => 'Săriți';

  @override
  String get openLinkInBrowser => 'Deschideți linkul în browser';

  @override
  String get reportErrorDescription =>
      'Ceva a eșuat. Vă rugăm să încercați din nou mai tărziu. Dacă doriți, puteți să reportați problema la dezvoltatori.';

  @override
  String get report => 'reportați';

  @override
  String get signInWithPassword => 'Conectați-vă cu parolă';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Vă rugăm să încercați din nou mai târziu sau să alegeți un server diferit.';

  @override
  String signInWith(String provider) {
    return 'Sign in with $provider';
  }

  @override
  String get profileNotFound =>
      'The user could not be found on the server. Maybe there is a connection problem or the user doesn\'t exist.';

  @override
  String get setTheme => 'Set theme:';

  @override
  String get setColorTheme => 'Set color theme:';

  @override
  String get invite => 'Invite';

  @override
  String get inviteGroupChat => '📨 Invite group chat';

  @override
  String get invitePrivateChat => '📨 Invite private chat';

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
      'The chat will then be recreated with the new room version. All participants will be notified that they need to switch to the new chat. You can find out more about room versions at https://github.com/sorydima/REChain-/tree/main/matrix_bridge_setup_bundle';

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
  String get startConversation => 'Start conversation';

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
  String get publicLink => 'Public link';

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
  String get subspace => 'Subspace';

  @override
  String get decline => 'Decline';

  @override
  String get thisDevice => 'This device:';

  @override
  String get initAppError => 'An error occured while init the app';

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
    return 'Unable to build the SQlite database. The app tries to use the legacy database for now. Please report this error to the developers at $url. The error message is: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'Your session is lost. Please report this error to the developers at $url. The error message is: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'The app now tries to restore your session from the backup. Please report this error to the developers at $url. The error message is: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'Forward message to $roomName?';
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
  String get transparent => 'Transparent';

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
      'All your data is stored on the homeserver, just like an email provider. You can choose which homeserver you want to use, while you can still communicate with everyone. Learn more at at https://rechain.network.';

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
      'Hey Hey 👋 This is REChain. You can sign in to any homeserver, which is compatible with https://rechain.network. And then chat with anyone. It\'s a huge decentralized messaging network!';

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
      'REChain lets you chat with your friends across different messengers. Learn more at https://rechain.network or just tap *Continue*.';

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
}
