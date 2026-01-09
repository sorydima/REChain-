// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class L10nIt extends L10n {
  L10nIt([String locale = 'it']) : super(locale);

  @override
  String get alwaysUse24HourFormat => 'disattivato';

  @override
  String get repeatPassword => 'Ripeti password';

  @override
  String get notAnImage => 'Non è un file immagine.';

  @override
  String get setCustomPermissionLevel =>
      'Imposta livello di permesso personalizzato';

  @override
  String get setPermissionsLevelDescription =>
      'Scegli un ruolo predefinito qui sotto o inserisci un livello di permesso personalizzato tra 0 e 100.';

  @override
  String get ignoreUser => 'Ignora utente';

  @override
  String get normalUser => 'Utente normale';

  @override
  String get remove => 'Rimuovi';

  @override
  String get importNow => 'Importa ora';

  @override
  String get importEmojis => 'Importa Emoji';

  @override
  String get importFromZipFile => 'Importa da file .zip';

  @override
  String get exportEmotePack => 'Esporta pack di Emote come .zip';

  @override
  String get replace => 'Sostituisci';

  @override
  String get about => 'Informazioni';

  @override
  String aboutHomeserver(String homeserver) {
    return 'Informazioni su $homeserver';
  }

  @override
  String get accept => 'Accetta';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username ha accettato l\'invito';
  }

  @override
  String get account => 'Account';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username ha abilitato la crittografia end to end';
  }

  @override
  String get addEmail => 'Aggiungi e-mail';

  @override
  String get confirmMatrixId =>
      'Per eliminare il tuo account, conferma il tuo REChain ID.';

  @override
  String supposedMxid(String mxid) {
    return 'Dovrebbe essere $mxid';
  }

  @override
  String get addChatDescription => 'Aggiungi una descrizione chat...';

  @override
  String get addToSpace => 'Aggiungi a uno spazio';

  @override
  String get admin => 'Amministratore';

  @override
  String get alias => 'alias';

  @override
  String get all => 'Tutto';

  @override
  String get allChats => 'Tutte le chat';

  @override
  String get commandHint_roomupgrade =>
      'Aggiorna questa stanza alla versione specificata';

  @override
  String get commandHint_googly => 'Invia degli occhi finti';

  @override
  String get commandHint_cuddle => 'Invia una coccola';

  @override
  String get commandHint_hug => 'Invia un abbraccio';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName ti ha inviato degli occhi finti';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName ti coccola';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName ti abbraccia';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName ha risposto alla chiamata';
  }

  @override
  String get anyoneCanJoin => 'Tutti possono partecipare';

  @override
  String get appLock => 'Blocco dell\'app';

  @override
  String get appLockDescription =>
      'Blocca l\'app con un codice PIN quando non è in uso';

  @override
  String get archive => 'Archivia';

  @override
  String get areGuestsAllowedToJoin => 'Gli utenti ospiti possono partecipare';

  @override
  String get areYouSure => 'Sei sicuro/a?';

  @override
  String get areYouSureYouWantToLogout => 'Sei sicuro/a di voler uscire?';

  @override
  String get askSSSSSign =>
      'Per far accedere l\'altra persona, per favore inserisci la tua frase segreta o chiave di recupero.';

  @override
  String askVerificationRequest(String username) {
    return 'Accettare questa richiesta di verifica da $username?';
  }

  @override
  String get autoplayImages =>
      'Riproduci automaticamente adesivi ed emote animati';

  @override
  String badServerLoginTypesException(
    String serverVersions,
    String supportedVersions,
    Object suportedVersions,
  ) {
    return 'L\'homeserver supporta i tipi di accesso:\n$serverVersions\nMa questa applicazione supporta solo:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Invia notifiche di scrittura';

  @override
  String get swipeRightToLeftToReply =>
      'Scorri da destra a sinistra per rispondere';

  @override
  String get sendOnEnter => 'Invia quando premi Invio';

  @override
  String badServerVersionsException(
    String serverVersions,
    String supportedVersions,
    Object serverVerions,
    Object supoortedVersions,
    Object suportedVersions,
  ) {
    return 'L\'homeserver supporta le versioni Spec:\n$serverVersions\nMa questa applicazione supporta solo $supportedVersions';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats chat e $participants partecipanti';
  }

  @override
  String get noMoreChatsFound => 'Non sono state trovate altre chat...';

  @override
  String get noChatsFoundHere =>
      'Nessuna chat trovata. Inizia una nuova chat con qualcuno usando il pulsante qui sotto. ⤵️';

  @override
  String get joinedChats => 'Chat a cui partecipi';

  @override
  String get unread => 'Non letti';

  @override
  String get space => 'Spazio';

  @override
  String get spaces => 'Spazi';

  @override
  String get banFromChat => 'Bandisci dalla chat';

  @override
  String get banned => 'Bandito';

  @override
  String bannedUser(String username, String targetName) {
    return '$username ha bandito $targetName';
  }

  @override
  String get blockDevice => 'Blocca dispositivo';

  @override
  String get blocked => 'Bloccato';

  @override
  String get botMessages => 'Messaggi bot';

  @override
  String get cancel => 'Annulla';

  @override
  String cantOpenUri(String uri) {
    return 'Impossibile aprire l\'URI $uri';
  }

  @override
  String get changeDeviceName => 'Cambia nome dispositivo';

  @override
  String changedTheChatAvatar(String username) {
    return '$username ha cambiato l\'avatar della discussione';
  }

  @override
  String changedTheChatDescription(Object username) {
    return '$username changed the chat description';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username ha cambiato la descrizione della chat in: \'$description\'';
  }

  @override
  String changedTheChatName(Object username) {
    return '$username changed the chat name';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username ha cambiato il nome della discussione in: \'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username ha cambiato i permessi della chat';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username ha cambiato nome in: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username ha cambiato le regole di accesso per ospiti';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username ha cambiato le regole di accesso per ospiti con: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username ha cambiato la visibilità della cronologia';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username ha cambiato la visibilità della cronologia in: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username ha cambiato le regole per unirsi';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username ha cambiato le regole per unirsi in: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username ha cambiato il suo avatar';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username ha modificato gli alias della stanza';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username ha cambiato il link di invito';
  }

  @override
  String get changePassword => 'Cambia la password';

  @override
  String get changeTheHomeserver => 'Cambia il server principale';

  @override
  String get changeTheme => 'Cambia il tuo stile';

  @override
  String get changeTheNameOfTheGroup => 'Cambia il nome del gruppo';

  @override
  String get changeYourAvatar => 'Cambia il tuo avatar';

  @override
  String get channelCorruptedDecryptError => 'La crittografia è corrotta';

  @override
  String get chat => 'Chat';

  @override
  String get yourChatBackupHasBeenSetUp =>
      'Il tuo backup delle chat è stato configurato.';

  @override
  String get chatBackup => 'Backup delle discussioni';

  @override
  String get chatBackupDescription =>
      'I tuoi vecchi messaggi sono protetti da una chiave di sicurezza. Assicurati di non perderla.';

  @override
  String get chatDetails => 'Dettagli chat';

  @override
  String get chatHasBeenAddedToThisSpace =>
      'La chat è stata aggiunta a questo spazio';

  @override
  String get chats => 'Discussioni';

  @override
  String get chooseAStrongPassword => 'Scegli una password complessa';

  @override
  String get clearArchive => 'Cancella archivio';

  @override
  String get close => 'Chiudi';

  @override
  String get commandHint_markasdm =>
      'Contrassegna questo REChain ID come stanza di messaggi diretti';

  @override
  String get commandHint_markasgroup => 'Segna come gruppo';

  @override
  String get commandHint_ban => 'Banna l\'utente specificato da questa stanza';

  @override
  String get commandHint_clearcache => 'Pulisci cache';

  @override
  String get commandHint_create =>
      'Crea una chat di gruppo vuota\nUtilizza --no-encryption per disattivare la criptazione';

  @override
  String get commandHint_discardsession => 'Scarta sessione';

  @override
  String get commandHint_dm =>
      'Avvia una chat diretta\nUsa --no-encryption per disabilitare la crittografia';

  @override
  String get commandHint_html => 'Invia testo formattato in HTML';

  @override
  String get commandHint_invite => 'Invia l utente fornito in questa stanza';

  @override
  String get commandHint_join => 'Unisciti alla stanza fornita';

  @override
  String get commandHint_kick => 'Rimuovi l\'utente fornito da questa stanza';

  @override
  String get commandHint_leave => 'Abbandona questa stanza';

  @override
  String get commandHint_me => 'Descriviti';

  @override
  String get commandHint_myroomavatar =>
      'Importa la foto profilo per questa stanza ( mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Imposta il nome visualizzato per questa stanza';

  @override
  String get commandHint_op =>
      'Imposta il livello di privilegi dell\'utente specificato (predefinito: 50)';

  @override
  String get commandHint_plain => 'Invia testo non formattato';

  @override
  String get commandHint_react => 'Rispondi con una reazione';

  @override
  String get commandHint_send => 'Invia testo';

  @override
  String get commandHint_unban => 'Sbanna l\'utente fornito da questa stanza';

  @override
  String get commandInvalid => 'Comando non valido';

  @override
  String commandMissing(String command) {
    return '$command non è un comando.';
  }

  @override
  String get compareEmojiMatch => 'Per favore confronta gli emoji';

  @override
  String get compareNumbersMatch => 'Per favore confronta i numeri';

  @override
  String get configureChat => 'Configura la discussione';

  @override
  String get confirm => 'Conferma';

  @override
  String get connect => 'Connetti';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Il contatto è stato invitato nel gruppo';

  @override
  String get containsDisplayName => 'Contiene nome visibile';

  @override
  String get containsUserName => 'Contiene nome utente';

  @override
  String get contentHasBeenReported =>
      'Il contenuto è stato segnalato agli amministratori del server';

  @override
  String get copiedToClipboard => 'Copiato negli Appunti';

  @override
  String get copy => 'Copia';

  @override
  String get copyToClipboard => 'Copia negli appunti';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Impossibile decriptare messaggio: $error';
  }

  @override
  String get checkList => 'Checklist';

  @override
  String countParticipants(int count) {
    return '$count partecipanti';
  }

  @override
  String countInvited(int count) {
    return '$count invitati';
  }

  @override
  String get create => 'Crea';

  @override
  String createdTheChat(String username) {
    return '💬 $username ha creato la chat';
  }

  @override
  String get createGroup => 'Crea gruppo';

  @override
  String get createNewSpace => 'Nuovo spazio';

  @override
  String get currentlyActive => 'Attualmente attivo';

  @override
  String get darkTheme => 'Scuro';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String dateWithoutYear(String month, String day) {
    return '$day/$month';
  }

  @override
  String dateWithYear(String year, String month, String day) {
    return '$day/$month/$year';
  }

  @override
  String get deactivateAccountWarning =>
      'Disabiliterà il tuo account. Non puoi tornare indietro! Sei sicuro/a?';

  @override
  String get defaultPermissionLevel =>
      'Livello di autorizzazione predefinito per i nuovi utenti';

  @override
  String get delete => 'Cancella';

  @override
  String get deleteAccount => 'Elimina l\'account';

  @override
  String get deleteMessage => 'Elimina il messaggio';

  @override
  String get device => 'Dispositivo';

  @override
  String get deviceId => 'ID del dispositivo';

  @override
  String get devices => 'Dispositivi';

  @override
  String get directChats => 'Chat dirette';

  @override
  String get allRooms => 'Tutte le chat di gruppo';

  @override
  String get displaynameHasBeenChanged => 'Il nominativo è stato cambiato';

  @override
  String get downloadFile => 'Scarica il file';

  @override
  String get edit => 'Modifica';

  @override
  String get editBlockedServers => 'Modifica i server bloccati';

  @override
  String get chatPermissions => 'Permessi della chat';

  @override
  String get editDisplayname => 'Modifica il nominativo';

  @override
  String get editRoomAliases => 'Modifica gli alias della stanza';

  @override
  String get editRoomAvatar => 'Modifica l\'avatar della stanza';

  @override
  String get emoteExists => 'L\'emote già esiste!';

  @override
  String get emoteInvalid => 'Shortcode emote invalido!';

  @override
  String get emoteKeyboardNoRecents =>
      'Le emoticon recentemente usate appariranno qui...';

  @override
  String get emotePacks => 'Pacchetti emotes della stanza';

  @override
  String get emoteSettings => 'Impostazioni emote';

  @override
  String get globalChatId => 'ID chat globale';

  @override
  String get accessAndVisibility => 'Accesso e visibilità';

  @override
  String get accessAndVisibilityDescription =>
      'Chi è autorizzato a partecipare a questa chat e come è possibile scoprirla.';

  @override
  String get calls => 'Chiamate';

  @override
  String get customEmojisAndStickers => 'Emoji e adesivi personalizzati';

  @override
  String get customEmojisAndStickersBody =>
      'Aggiungi o condividi emoji o adesivi personalizzati che possono essere utilizzati in qualsiasi chat.';

  @override
  String get emoteShortcode => 'Scorciatoia emote';

  @override
  String get emoteWarnNeedToPick =>
      'Devi scegliere una scorciatoia emote e aggiungere un immagine!';

  @override
  String get emptyChat => 'Discussione vuota';

  @override
  String get enableEmotesGlobally => 'Abilita i pacchetti emotes globalmente';

  @override
  String get enableEncryption => 'Abilita la crittografia';

  @override
  String get enableEncryptionWarning =>
      'Non potrai disabilitare la crittografia in futuro. Sei sicuro?';

  @override
  String get encrypted => 'Crittografato';

  @override
  String get encryption => 'Crittografia';

  @override
  String get encryptionNotEnabled => 'Crittografia non abilitata';

  @override
  String endedTheCall(String senderName) {
    return '$senderName è entrato in chiamata';
  }

  @override
  String get enterAnEmailAddress => 'Inserisci un indirizzo e-mail';

  @override
  String get homeserver => 'Homeserver';

  @override
  String get enterYourHomeserver => 'Inserisci il tuo server principale';

  @override
  String errorObtainingLocation(String error) {
    return 'Errore cercando di ottenere la posizione: $error';
  }

  @override
  String get everythingReady => 'Tutto pronto!';

  @override
  String get extremeOffensive => 'Estremamente offensivo';

  @override
  String get fileName => 'Nome del file';

  @override
  String get rechainonline => 'REChain';

  @override
  String get fontSize => 'Dimensione carattere';

  @override
  String get forward => 'Inoltra';

  @override
  String get fromJoining => 'Dall\'adesione';

  @override
  String get fromTheInvitation => 'Dall\'invito';

  @override
  String get goToTheNewRoom => 'Vai nella nuova stanza';

  @override
  String get group => 'Gruppo';

  @override
  String get chatDescription => 'Descrizione della chat';

  @override
  String get chatDescriptionHasBeenChanged => 'Descrizione della chat cambiata';

  @override
  String get groupIsPublic => 'Il gruppo è pubblico';

  @override
  String get groups => 'Gruppi';

  @override
  String groupWith(String displayname) {
    return 'Gruppo con $displayname';
  }

  @override
  String get guestsAreForbidden => 'Gli ospiti sono vietati';

  @override
  String get guestsCanJoin => 'Gli ospiti possono partecipare';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username ha ritirato l\'invito per $targetName';
  }

  @override
  String get help => 'Aiuto';

  @override
  String get hideRedactedEvents => 'Nascondi gli eventi eliminati';

  @override
  String get hideRedactedMessages => 'Mostra i messaggi rimossi';

  @override
  String get hideRedactedMessagesBody =>
      'Se qualcuno rimuove un messaggio, il messaggio non sarà più visibile nella chat.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Nascondi formati di messaggi non validi o sconosciuti';

  @override
  String get howOffensiveIsThisContent =>
      'Quanto è offensivo questo contenuto?';

  @override
  String get id => 'ID';

  @override
  String get identity => 'Identità';

  @override
  String get block => 'Blocca';

  @override
  String get blockedUsers => 'Utenti bloccati';

  @override
  String get blockListDescription =>
      'Puoi bloccare gli utenti che ti disturbano. Non sarai più in grado di ricevere messaggi o inviti alle stanze dalle persone che hai bloccato.';

  @override
  String get blockUsername => 'Nome utente da ignorare';

  @override
  String get iHaveClickedOnLink => 'Ho cliccato sul collegamento';

  @override
  String get incorrectPassphraseOrKey =>
      'Frase segrata o chiave di ripristino errate';

  @override
  String get inoffensive => 'Inoffensivo';

  @override
  String get inviteContact => 'Invita contatto';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return 'Vuoi invitare $contact nella chat \"$groupName\"?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Invita un contatto a $groupName';
  }

  @override
  String get noChatDescriptionYet =>
      'La descrizione della chat non è ancora stata creata.';

  @override
  String get tryAgain => 'Riprova';

  @override
  String get invalidServerName => 'Nome server non valido';

  @override
  String get invited => 'Invitato/a';

  @override
  String get redactMessageDescription =>
      'Questo messaggio sarà rimosso per tutti i partecipanti di questa conversazione. Questa operazione non può essere annullata.';

  @override
  String get optionalRedactReason =>
      '(Opzionale) Ragione per rimuovere questo messaggio...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username ha invitato $targetName';
  }

  @override
  String get invitedUsersOnly => 'Solo utenti invitati';

  @override
  String get inviteForMe => 'Invita per me';

  @override
  String inviteText(String username, String link) {
    return '$username ti ha invitato/a a REChain.\n1. Visita github.com/sorydima/REChain- e installa l\'applicazione\n2. Iscriviti o accedi\n3. Apri il collegamento di invito: \n $link';
  }

  @override
  String get isTyping => 'sta scrivendo…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username si è unito/a alla chat';
  }

  @override
  String get joinRoom => 'Unisciti alla stanza';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username ha espulso $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username ha espulso e bandito $targetName';
  }

  @override
  String get kickFromChat => 'Espelli dalla chat';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Ultima attività: $localizedTimeShort';
  }

  @override
  String get leave => 'Abbandona';

  @override
  String get leftTheChat => 'Ha lasciato la chat';

  @override
  String get license => 'Licenza';

  @override
  String get lightTheme => 'Chiaro';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Carica altri $count partecipanti';
  }

  @override
  String get dehydrate => 'Esporta la sessione e cancella il dispositivo';

  @override
  String get dehydrateWarning =>
      'Questa azione non può essere annullata. Assicurarsi di aver salvato il file di backup.';

  @override
  String get dehydrateTor => 'Utenti TOR: Esporta la sessione';

  @override
  String get dehydrateTorLong =>
      'Per gli utenti TOR, è raccomandato esportare la sessione prima di chiudere la finestra.';

  @override
  String get hydrateTor => 'Utenti TOR: Importa l\'esportazione della sessione';

  @override
  String get hydrateTorLong =>
      'Hai esportato la tua sessione l\'ultima volta con TOR? Importala velocemente e continua a chattare.';

  @override
  String get hydrate => 'Ripristina dal file di backup';

  @override
  String get loadingPleaseWait => 'Caricamento… Attendere prego.';

  @override
  String get loadMore => 'Carica di più…';

  @override
  String get locationDisabledNotice =>
      'I servizi di localizzazione sono disabilitati. Per favore abilitali per poter condividere la tua posizione.';

  @override
  String get locationPermissionDeniedNotice =>
      'Permesso per accedere alla posizione negato. Per favore concedilo per essere in grado di condividere la tua posizione.';

  @override
  String get login => 'Accedi';

  @override
  String logInTo(String homeserver) {
    return 'Accedi a $homeserver';
  }

  @override
  String get logout => 'Esci';

  @override
  String get memberChanges => 'Cambiamenti di membri';

  @override
  String get mention => 'Menzione';

  @override
  String get messages => 'Messaggi';

  @override
  String get messagesStyle => 'Messaggi:';

  @override
  String get moderator => 'Moderatore';

  @override
  String get muteChat => 'Silenzia discussione';

  @override
  String get needPantalaimonWarning =>
      'Tieni presente che per ora hai bisogno di Pantalaimon per utilizzare la crittografia dall\'inizio alla fine.';

  @override
  String get newChat => 'Nuova discussione';

  @override
  String get newMessageInrechainonline => '💬 Nuovo messaggio in REChain';

  @override
  String get newVerificationRequest => 'Nuova richiesta di verifica!';

  @override
  String get next => 'Avanti';

  @override
  String get no => 'No';

  @override
  String get noConnectionToTheServer => 'Nessuna connessione al server';

  @override
  String get noEmotesFound => 'Nessun emote trovato. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Puoi attivare la crittografia solo quando la stanza non è più accessibile pubblicamente.';

  @override
  String get noGoogleServicesWarning =>
      'Firebase Cloud Messaging non sembra essere disponibile sul tuo dispositivo. Per continuare a ricevere notifiche push, ti consigliamo di installare ntfy. Con ntfy o un altro provider Unified Push puoi ricevere notifiche push in modo sicuro per i dati. Puoi scaricare ntfy dal PlayStore o da F-Droid.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 non è un server REChain, vuoi invece usare $server2?';
  }

  @override
  String get shareInviteLink => 'Condividi link d\'invito';

  @override
  String get scanQrCode => 'Scansiona codice QR';

  @override
  String get none => 'Nessuno';

  @override
  String get noPasswordRecoveryDescription =>
      'Non hai ancora aggiunto un modo per recuperare la tua password.';

  @override
  String get noPermission => 'Nessuna autorizzazione';

  @override
  String get noRoomsFound => 'Nessuna stanza trovata…';

  @override
  String get notifications => 'Notifiche';

  @override
  String get notificationsEnabledForThisAccount =>
      'Notifiche abilitate per questo account';

  @override
  String numUsersTyping(int count) {
    return '$count utenti stanno scrivendo…';
  }

  @override
  String get obtainingLocation => 'Ottengo la posizione…';

  @override
  String get offensive => 'Offensivo';

  @override
  String get offline => 'Fuori linea';

  @override
  String get ok => 'Ok';

  @override
  String get online => 'In linea';

  @override
  String get onlineKeyBackupEnabled =>
      'Il backup delle chiavi in linea è abilitato';

  @override
  String get oopsPushError =>
      'Ops! Purtroppo si è verificato un errore durante l\'impostazione delle notifiche push.';

  @override
  String get oopsSomethingWentWrong => 'Ops, qualcosa è andato storto…';

  @override
  String get openAppToReadMessages => 'Apri l\'app per leggere i messaggi';

  @override
  String get openCamera => 'Apri fotocamera';

  @override
  String get openVideoCamera => 'Apri la fotocamera per un video';

  @override
  String get oneClientLoggedOut => 'Uno dei tuoi client è stato disconnesso';

  @override
  String get addAccount => 'Aggiungi account';

  @override
  String get editBundlesForAccount => 'Modifica i bundle per questo account';

  @override
  String get addToBundle => 'Aggiungi al bundle';

  @override
  String get removeFromBundle => 'Rimuovi da questo bundle';

  @override
  String get bundleName => 'Nome del bundle';

  @override
  String get enableMultiAccounts =>
      '(BETA) Abilita account multipli su questo dispositivo';

  @override
  String get openInMaps => 'Apri in maps';

  @override
  String get link => 'Link';

  @override
  String get serverRequiresEmail =>
      'Questo server ha bisogno di validare la tua email per la registrazione.';

  @override
  String get or => 'O';

  @override
  String get participant => 'Partecipante';

  @override
  String get passphraseOrKey => 'frase segreta o chiave di recupero';

  @override
  String get password => 'Password';

  @override
  String get passwordForgotten => 'Password dimenticata';

  @override
  String get passwordHasBeenChanged => 'La password è stata cambiata';

  @override
  String get hideMemberChangesInPublicChats =>
      'Nascondi le modifiche dei membri nelle chat pubbliche';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      'Per migliorare la leggibilità, non mostrare nella cronologia della chat se qualcuno si unisce o abbandona una chat pubblica.';

  @override
  String get overview => 'Panoramica';

  @override
  String get notifyMeFor => 'Avvisami per';

  @override
  String get passwordRecoverySettings => 'Impostazioni di recupero password';

  @override
  String get passwordRecovery => 'Recupero della password';

  @override
  String get people => 'Persone';

  @override
  String get pickImage => 'Scegli un\'immagine';

  @override
  String get pin => 'Fissa';

  @override
  String play(String fileName) {
    return 'Riproduci $fileName';
  }

  @override
  String get pleaseChoose => 'Si prega di scegliere';

  @override
  String get pleaseChooseAPasscode =>
      'Si prega di scegliere un codice di accesso';

  @override
  String get pleaseClickOnLink =>
      'Clicca sul collegamenti nell\'e-mail e poi procedi.';

  @override
  String get pleaseEnter4Digits =>
      'Inserisci 4 cifre o lascia vuoto per disabilitare il blocco dell\'app.';

  @override
  String get pleaseEnterRecoveryKey =>
      'Per favore inserisci la tua chiave di recupero:';

  @override
  String get pleaseEnterYourPassword => 'Inserisci la tua password';

  @override
  String get pleaseEnterYourPin => 'Per favore inserisci il tuo PIN';

  @override
  String get pleaseEnterYourUsername => 'Inserisci il tuo nome utente';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Segui le istruzioni sul sito web e tocca Avanti.';

  @override
  String get privacy => 'Privacy';

  @override
  String get publicRooms => 'Stanze pubbliche';

  @override
  String get pushRules => 'Regole notifiche';

  @override
  String get reason => 'Motivo';

  @override
  String get recording => 'Registrazione';

  @override
  String redactedBy(String username) {
    return 'Rimosso da $username';
  }

  @override
  String get directChat => 'Chat diretta';

  @override
  String redactedByBecause(String username, String reason) {
    return 'Rimosso da $username per: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username ha eliminato un evento';
  }

  @override
  String get redactMessage => 'Elimina un messaggio';

  @override
  String get register => 'Registrati';

  @override
  String get reject => 'Rifiuta';

  @override
  String rejectedTheInvitation(String username) {
    return '$username ha rifiutato l\'invito';
  }

  @override
  String get rejoin => 'Riunisciti';

  @override
  String get removeAllOtherDevices => 'Rimuovi tutti gli altri dispositivi';

  @override
  String removedBy(String username) {
    return 'Rimosso da $username';
  }

  @override
  String get removeDevice => 'Rimuovi il dispositivo';

  @override
  String get unbanFromChat => 'Rimuovi il ban dalla chat';

  @override
  String get removeYourAvatar => 'Rimuovi il tuo avatar';

  @override
  String get replaceRoomWithNewerVersion =>
      'Sostituisci la stanza con la versione più recente';

  @override
  String get reply => 'Rispondi';

  @override
  String get reportMessage => 'Segnala il messaggio';

  @override
  String get requestPermission => 'Richiedi l\'autorizzazione';

  @override
  String get roomHasBeenUpgraded => 'La stanza è stata aggiornata';

  @override
  String get roomVersion => 'Versione della stanza';

  @override
  String get saveFile => 'Salva file';

  @override
  String get search => 'Cerca';

  @override
  String get security => 'Sicurezza';

  @override
  String get recoveryKey => 'Chiave di recupero';

  @override
  String get recoveryKeyLost => 'Chiave di recupero smarrita?';

  @override
  String seenByUser(String username) {
    return 'Visto da $username';
  }

  @override
  String get send => 'Invia';

  @override
  String get sendAMessage => 'Invia un messaggio';

  @override
  String get sendAsText => 'Invia come testo';

  @override
  String get sendAudio => 'Invia un file audio';

  @override
  String get sendFile => 'Invia un file';

  @override
  String get sendImage => 'Invia un\'immagine';

  @override
  String sendImages(int count) {
    return 'Invia $count immagine';
  }

  @override
  String get sendMessages => 'Invia messaggi';

  @override
  String get sendOriginal => 'Invia l\'originale';

  @override
  String get sendSticker => 'Invia adesivo';

  @override
  String get sendVideo => 'Invia un video';

  @override
  String sentAFile(String username) {
    return '📁 $username ha inviato un file';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username ha inviato un file audio';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username ha inviato un\'immagine';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username ha inviato un adesivo';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username ha inviato un video';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName ha inviato informazioni sulla chiamata';
  }

  @override
  String get separateChatTypes => 'Separare le chat dirette e i gruppi';

  @override
  String get setAsCanonicalAlias => 'Imposta come alias principale';

  @override
  String get setCustomEmotes => 'Imposta emoticon personalizzate';

  @override
  String get setChatDescription => 'Imposta la descrizione della chat';

  @override
  String get setInvitationLink => 'Imposta il collegamento di invito';

  @override
  String get setPermissionsLevel => 'Imposta il livello di autorizzazione';

  @override
  String get setStatus => 'Imposta lo stato';

  @override
  String get settings => 'Impostazioni';

  @override
  String get share => 'Condividi';

  @override
  String sharedTheLocation(String username) {
    return '$username ha condiviso la sua posizione';
  }

  @override
  String get shareLocation => 'Condividi posizione';

  @override
  String get showPassword => 'Mostra la password';

  @override
  String get presenceStyle => 'Presenza:';

  @override
  String get presencesToggle => 'Mostra i messaggi di stato di altri utenti';

  @override
  String get singlesignon => 'Accesso singolo';

  @override
  String get skip => 'Ignora';

  @override
  String get sourceCode => 'Codice sorgente';

  @override
  String get spaceIsPublic => 'Lo spazio è pubblico';

  @override
  String get spaceName => 'Nome dello spazio';

  @override
  String startedACall(String senderName) {
    return '$senderName ha iniziato una chiamata';
  }

  @override
  String get startFirstChat => 'Inizia la tua prima chat';

  @override
  String get status => 'Stato';

  @override
  String get statusExampleMessage => 'Come stai oggi?';

  @override
  String get submit => 'Invia';

  @override
  String get synchronizingPleaseWait => 'Sincronizzazione... Attendere prego.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Sincronizzazione… ($percentage%)';
  }

  @override
  String get systemTheme => 'Sistema';

  @override
  String get theyDontMatch => 'Non corrispondono';

  @override
  String get theyMatch => 'Corrispondono';

  @override
  String get title => 'REChain';

  @override
  String get toggleFavorite => 'Attiva/disattiva preferito';

  @override
  String get toggleMuted => 'Attiva/disattiva il silenziatore';

  @override
  String get toggleUnread => 'Segna come letto / non letto';

  @override
  String get tooManyRequestsWarning =>
      'Troppe richieste. Per favore riprova più tardi!';

  @override
  String get transferFromAnotherDevice =>
      'Trasferimento da un altro dispositivo';

  @override
  String get tryToSendAgain => 'Prova a inviare di nuovo';

  @override
  String get unavailable => 'Non disponibile';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username ha rimosso il bando di $targetName';
  }

  @override
  String get unblockDevice => 'Sblocca il dispositivo';

  @override
  String get unknownDevice => 'Dispositivo sconosciuto';

  @override
  String get unknownEncryptionAlgorithm =>
      'Algoritmo di crittografia sconosciuto';

  @override
  String unknownEvent(String type) {
    return 'Evento sconosciuto \'$type\'';
  }

  @override
  String get unmuteChat => 'Riattiva l\'audio della discussione';

  @override
  String get unpin => 'Rimuovi';

  @override
  String unreadChats(int unreadCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount discussioni non lette',
      one: '1 discussione non letta',
    );
    return '$_temp0';
  }

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username e $count altri stanno scrivendo…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username e $username2 stanno scrivendo…';
  }

  @override
  String userIsTyping(String username) {
    return '$username sta scrivendo…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username ha abbandonato la chat';
  }

  @override
  String get username => 'Nome utente';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username ha inviato un evento $type';
  }

  @override
  String get unverified => 'Non verificato';

  @override
  String get verified => 'Verificato';

  @override
  String get verify => 'Verifica';

  @override
  String get verifyStart => 'Avvia la verifica';

  @override
  String get verifySuccess => 'Hai verificato con successo!';

  @override
  String get verifyTitle => 'Verifica dell\'altro account';

  @override
  String get videoCall => 'Videochiamata';

  @override
  String get visibilityOfTheChatHistory =>
      'Visibilità della cronologia della discussione';

  @override
  String get visibleForAllParticipants => 'Visibile a tutti i partecipanti';

  @override
  String get visibleForEveryone => 'Visibile a tutti';

  @override
  String get voiceMessage => 'Messaggio vocale';

  @override
  String get waitingPartnerAcceptRequest =>
      'In attesa che il partner accetti la richiesta…';

  @override
  String get waitingPartnerEmoji =>
      'In attesa che il partner accetti l\'emoji…';

  @override
  String get waitingPartnerNumbers =>
      'In attesa che il partner accetti i numeri…';

  @override
  String get wallpaper => 'Immagine di sfondo:';

  @override
  String get warning => 'Attenzione!';

  @override
  String get weSentYouAnEmail => 'Ti abbiamo inviato un\'e-mail';

  @override
  String get whoCanPerformWhichAction => 'Chi può eseguire quale azione';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'Chi è autorizzato a unirsi a questo gruppo';

  @override
  String get whyDoYouWantToReportThis => 'Perché vuoi segnalarlo?';

  @override
  String get wipeChatBackup =>
      'Cancellare il backup della discussione per creare una nuova chiave di ripristino?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Con questi indirizzi puoi recuperare la tua password se necessario.';

  @override
  String get writeAMessage => 'Scrivi un messaggio…';

  @override
  String get yes => 'Sì';

  @override
  String get you => 'Tu';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Non stai più partecipando a questa chat';

  @override
  String get youHaveBeenBannedFromThisChat =>
      'Sei stato/a bandito/a da questa chat';

  @override
  String get yourPublicKey => 'La tua chiave pubblica';

  @override
  String get messageInfo => 'Informazioni del messaggio';

  @override
  String get time => 'Tempo';

  @override
  String get messageType => 'Tipo del Messaggio';

  @override
  String get sender => 'Mittente';

  @override
  String get openGallery => 'Apri la galleria';

  @override
  String get removeFromSpace => 'Rimuovi dallo spazio';

  @override
  String get addToSpaceDescription =>
      'Seleziona una spazio a cui aggiungere questa chat.';

  @override
  String get start => 'Inizio';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'Per sbloccare i tuoi vecchi messaggi, per favore inserisci la tua chiave di recupero che è stata generata nella tua sessione precedente. La tua chiave di recupero NON è la tua password.';

  @override
  String get publish => 'Pubblicare';

  @override
  String videoWithSize(String size) {
    return 'Video ($size)';
  }

  @override
  String get openChat => 'Apri la Chat';

  @override
  String get markAsRead => 'Segna come letto';

  @override
  String get reportUser => 'Segnala utente';

  @override
  String get dismiss => 'Chiudi';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender ha reagito con $reaction';
  }

  @override
  String get pinMessage => 'Fissa alla stanza';

  @override
  String get confirmEventUnpin =>
      'Sei sicuro di voler permanentemente sfissare l\'evento?';

  @override
  String get emojis => 'Emoji';

  @override
  String get placeCall => 'Fai una chiamata';

  @override
  String get voiceCall => 'Chiamata vocale';

  @override
  String get unsupportedAndroidVersion => 'Versione di Android non supportata';

  @override
  String get unsupportedAndroidVersionLong =>
      'Questa funzionalità richiede una versione di Android più recente. Si prega di verificare la presenza di aggiornamenti o supporto per Mobile Katya OS.';

  @override
  String get videoCallsBetaWarning =>
      'Nota che le video chiamate sono attualmente in beta. Potrebbero non funzionare come previsto o non funzionare del tutto su alcune piattaforme.';

  @override
  String get experimentalVideoCalls => 'Video chiamate sperimentali';

  @override
  String get emailOrUsername => 'Email o nome utente';

  @override
  String get indexedDbErrorTitle => 'Problemi con la modalità privata';

  @override
  String get indexedDbErrorLong =>
      'Sfortunatamente l\'archiviazione dei messaggi non è abilitata in modalità privata per impostazione predefinita.\nPer favore visita\n - about:config\n - imposta dom.indexedDB.privateBrowsing.enabled su true\nAltrimenti, non è possibile eseguire REChain.';

  @override
  String switchToAccount(String number) {
    return 'Passa all\'account $number';
  }

  @override
  String get nextAccount => 'Account successivo';

  @override
  String get previousAccount => 'Account precedente';

  @override
  String get addWidget => 'Aggiungi widget';

  @override
  String get widgetVideo => 'Video';

  @override
  String get widgetEtherpad => 'Nota di testo';

  @override
  String get widgetJitsi => 'Jitsi Meet';

  @override
  String get widgetCustom => 'Personalizzati';

  @override
  String get widgetName => 'Nome';

  @override
  String get widgetUrlError => 'Questo non è un URL valido.';

  @override
  String get widgetNameError => 'Per favore fornire un nome da visualizzare.';

  @override
  String get errorAddingWidget => 'Errore aggiungendo il widget.';

  @override
  String get youRejectedTheInvitation => 'Hai rifiutato l\'invito';

  @override
  String get youJoinedTheChat => 'Sei entrato/a nella chat';

  @override
  String get youAcceptedTheInvitation => '👍 Hai accettato l\'invito';

  @override
  String youBannedUser(String user) {
    return 'Hai bannato $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Hai revocato l\'invito per $user';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 Sei stato invitato tramite link in:\n$alias';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 Sei stato invitato/a da $user';
  }

  @override
  String invitedBy(String user) {
    return '📩 Invitato da $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Hai invitato $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Hai rimosso $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Hai rimosso e bannato $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Hai sbannato $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user ha bussato';
  }

  @override
  String get usersMustKnock => 'Gli utenti devono bussare';

  @override
  String get noOneCanJoin => 'Nessuno può unirsi';

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user vorrebbe unirsi alla chat.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'Non è stato ancora creato alcun link pubblico';

  @override
  String get knock => 'Bussa';

  @override
  String get users => 'Utenti';

  @override
  String get unlockOldMessages => 'Sblocca i vecchi messaggi';

  @override
  String get storeInSecureStorageDescription =>
      'Salva la chiave di recupero nell\'archivio sicuro di questo dispositivo.';

  @override
  String get saveKeyManuallyDescription =>
      'Salva questa chiave manualmente attivando la finestra di condivisione o gli appunti.';

  @override
  String get storeInAndroidKeystore => 'Salva nel KeyStore di Android';

  @override
  String get storeInAppleKeyChain => 'Salva nel portachiavi di Apple';

  @override
  String get storeSecurlyOnThisDevice =>
      'Salva in modo sicuro su questo dispositivo';

  @override
  String countFiles(int count) {
    return '$count file';
  }

  @override
  String get user => 'Utente';

  @override
  String get custom => 'Personalizzato';

  @override
  String get foregroundServiceRunning =>
      'Questa notifica viene mostrata quando il servizio in primo piano è in esecuzione.';

  @override
  String get screenSharingTitle => 'condivisione schermo';

  @override
  String get screenSharingDetail =>
      'Stai condividendo il tuo schermo in REChain';

  @override
  String get callingPermissions => 'Permessi di chiamata';

  @override
  String get callingAccount => 'Account di chiamata';

  @override
  String get callingAccountDetails =>
      'Dai l\'autorizzazione a REChain di usare l\'app di composizione Android nativa.';

  @override
  String get appearOnTop => 'Appare in alto';

  @override
  String get appearOnTopDetails =>
      'Permetti all\'app di apparire in alto (non necessario se hai già impostato REChain come account di chiamata)';

  @override
  String get otherCallingPermissions =>
      'Microfono, fotocamera e altri permessi di REChain';

  @override
  String get whyIsThisMessageEncrypted =>
      'Perché questo messaggio è illeggibile?';

  @override
  String get noKeyForThisMessage =>
      'Questo può accadere se il messaggio è stato inviato prima che hai fatto l\'accesso in questo dispositivo.\n\nÈ anche possibile che il mittente abbia bloccato il tuo dispositivo o che qualcosa sia andato storto con la tua connessione ad internet.\n\nSei in grado di leggere il messaggio su altre sessioni? Allora puoi trasferire il messaggio da lì! Vai su Impostazioni > Dispositivi e verifica che i tuoi dispositivi siano verificati l\'un l\'altro. Quando aprirai la stanza la prossima volta ed entrambe le sessioni sono in primo piano, le chiavi saranno trasmesse automaticamente.\n\nNon vuoi perdere le chiavi quando ti disconnetti o cambi dispositivo? Assicurati di aver attivato il backup delle chat nelle impostazioni.';

  @override
  String get newGroup => 'Nuovo gruppo';

  @override
  String get newSpace => 'Nuovo spazio';

  @override
  String get enterSpace => 'Unirsi allo spazio';

  @override
  String get enterRoom => 'Unirsi alla stanza';

  @override
  String get allSpaces => 'Tutti gli spazi';

  @override
  String numChats(String number) {
    return '$number chat';
  }

  @override
  String get hideUnimportantStateEvents =>
      'Nascondi gli eventi di stato non importanti';

  @override
  String get hidePresences => 'Nascondere l\'elenco degli stati?';

  @override
  String get doNotShowAgain => 'Non mostrare più';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Chat vuota (era $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Gli spazi ti permettono di consolidare le tue chat e di creare comunità private o pubbliche.';

  @override
  String get encryptThisChat => 'Cifra questa chat';

  @override
  String get disableEncryptionWarning =>
      'Per motivi di sicurezza non puoi disabilitare la crittografia in una chat, se era stata abilitata in precedenza.';

  @override
  String get sorryThatsNotPossible => 'Scusa... questo non è possibile';

  @override
  String get deviceKeys => 'Chiavi del dispositivo:';

  @override
  String get reopenChat => 'Riapri la chat';

  @override
  String get noBackupWarning =>
      'Attenzione! Senza abilitare il backup della chat, perderai l\'accesso ai tuoi messaggi crittografati. Si consiglia vivamente di abilitare il backup della chat prima di disconnettersi.';

  @override
  String get noOtherDevicesFound => 'Nessun altro dispositivo trovato';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Impossibile inviare! Il server supporta solo allegati fino a $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Il file è stato salvato in $path';
  }

  @override
  String get jumpToLastReadMessage => 'Salta all\'ultimo messaggio letto';

  @override
  String get readUpToHere => 'Letto fino a qui';

  @override
  String get jump => 'Salta';

  @override
  String get openLinkInBrowser => 'Apri il collegamento nel browser';

  @override
  String get reportErrorDescription =>
      '😭 Oh no. Qualcosa è andato storto. Se vuoi, puoi segnalare questo bug agli sviluppatori.';

  @override
  String get report => 'segnala';

  @override
  String get signInWithPassword => 'Accedi con la password';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Per favore riprova più tardi o scegli un server diverso.';

  @override
  String signInWith(String provider) {
    return 'Accedi con $provider';
  }

  @override
  String get profileNotFound =>
      'Impossibile trovare l\'utente sul server. Forse c\'è un problema di connessione oppure l\'utente non esiste.';

  @override
  String get setTheme => 'Imposta tema:';

  @override
  String get setColorTheme => 'Imposta tema colore:';

  @override
  String get invite => 'Invitare';

  @override
  String get inviteGroupChat => '📨 Invita a una chat di gruppo';

  @override
  String get invitePrivateChat => '📨 Invita a una chat privata';

  @override
  String get invalidInput => 'Contenuto non valido!';

  @override
  String wrongPinEntered(int seconds) {
    return 'È stato inserito il pin sbagliato! Riprova tra $seconds secondi...';
  }

  @override
  String get pleaseEnterANumber =>
      'Per favore inserisci un numero maggiore di 0';

  @override
  String get archiveRoomDescription =>
      'Questa chat sarà archiviata. Gli altri utenti saranno in grado di vedere che hai abbandonato la chat.';

  @override
  String get roomUpgradeDescription =>
      'Questa chat sarà ricreata con la nuova versione della stanza. Tutti i partecipanti saranno avvertiti che devono passare alla nuova chat. Puoi leggere di più riguardo le versioni delle stanze su https://github.com/sorydima/REChain-.git';

  @override
  String get removeDevicesDescription =>
      'Sarai disconnesso da questo dispositivo e non potrai più ricevere messaggi.';

  @override
  String get banUserDescription =>
      'L\'utente sarà bannato dalla chat e non sarà in grado di rientrare finché non verrà sbannato.';

  @override
  String get unbanUserDescription => 'L\'utente potrà rientrare nella chat.';

  @override
  String get kickUserDescription =>
      'L\'utente è stato rimosso, ma non bannato. Nelle chat pubbliche, l\'utente potrà rientrare quando vuole.';

  @override
  String get makeAdminDescription =>
      'Una volta che fai questo utente amministratore, potresti non essere in grado di rimuoverlo, in quanto avrà i tuoi stessi privilegi.';

  @override
  String get pushNotificationsNotAvailable => 'Notifiche push non disponibili';

  @override
  String get learnMore => 'Scopri di più';

  @override
  String get yourGlobalUserIdIs => 'Il tuo ID dell\'utente globale è: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Sfortunatamente non è stato trovato nessun utente con \"$query\". Per favore controlla se hai fatto un errore di battitura.';
  }

  @override
  String get knocking => 'Bussare';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'La chat può essere trovata tramite la ricerca su $server';
  }

  @override
  String get searchChatsRooms => 'Cerca per #chat, @utenti...';

  @override
  String get nothingFound => 'Non è stato trovato nulla...';

  @override
  String get groupName => 'Nome gruppo';

  @override
  String get createGroupAndInviteUsers => 'Crea un gruppo e invita gli utenti';

  @override
  String get groupCanBeFoundViaSearch => 'Il gruppo può essere cercato';

  @override
  String get wrongRecoveryKey =>
      'Mi dispiace... questa non sembra essere la chiave di recupero corretta.';

  @override
  String get startConversation => 'Inizia una conversazione';

  @override
  String get commandHint_sendraw => 'Manda un json grezzo';

  @override
  String get databaseMigrationTitle => 'Il database è ottimizzato';

  @override
  String get databaseMigrationBody =>
      'Attendere prego. L\'operazione potrebbe richiedere un momento.';

  @override
  String get leaveEmptyToClearStatus =>
      'Lascia vuoto per cancellare il tuo stato.';

  @override
  String get select => 'Seleziona';

  @override
  String get searchForUsers => 'Cerca @utenti...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Per favore inserisci la tua password attuale';

  @override
  String get newPassword => 'Nuova password';

  @override
  String get pleaseChooseAStrongPassword =>
      'Per favore scegli una password forte';

  @override
  String get passwordsDoNotMatch => 'Le password non corrispondono';

  @override
  String get passwordIsWrong => 'La password inserita è sbagliata';

  @override
  String get publicLink => 'Link pubblico';

  @override
  String get publicChatAddresses => 'Indirizzi di chat pubblici';

  @override
  String get createNewAddress => 'Crea un nuovo indirizzo';

  @override
  String get joinSpace => 'Unisciti allo spazio';

  @override
  String get publicSpaces => 'Spazio pubblico';

  @override
  String get addChatOrSubSpace => 'Aggiungi chat o sottospazio';

  @override
  String get subspace => 'Sottospazio';

  @override
  String get decline => 'Declina';

  @override
  String get thisDevice => 'Questo dispositivo:';

  @override
  String get initAppError =>
      'Si è verificato un errore durante l\'inizializzazione dell\'app';

  @override
  String get userRole => 'Ruolo utente';

  @override
  String minimumPowerLevel(String level) {
    return '$level è il livello minimo di privilegi.';
  }

  @override
  String searchIn(String chat) {
    return 'Cerca nella chat \"$chat\"...';
  }

  @override
  String get searchMore => 'Cerca di più...';

  @override
  String get gallery => 'Galleria';

  @override
  String get files => 'File';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return 'Impossibile costruire il database SQlite. L\'applicazione proverà ad usare il database legacy per ora. Per favore segnala questo errore agli sviluppatori su $url. Il messaggio di errore è: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'La tua sessione è andata persa. Segnala questo errore agli sviluppatori all\'indirizzo $url. Il messaggio di errore è: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'L\'app ora tenta di ripristinare la sessione dal backup. Segnala questo errore agli sviluppatori all\'indirizzo $url. Il messaggio di errore è: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'Inoltra messaggio in $roomName?';
  }

  @override
  String get sendReadReceipts => 'Invia ricevute di lettura';

  @override
  String get sendTypingNotificationsDescription =>
      'Gli altri partecipanti alla chat possono vedere quando stai scrivendo un nuovo messaggio.';

  @override
  String get sendReadReceiptsDescription =>
      'Gli altri partecipanti alla chat possono vedere quando hai letto un messaggio.';

  @override
  String get formattedMessages => 'Messaggi formattati';

  @override
  String get formattedMessagesDescription =>
      'Visualizza contenuti di messaggi complessi, come testo in grassetto, utilizzando il markdown.';

  @override
  String get verifyOtherUser => '🔐 Verifica altro utente';

  @override
  String get verifyOtherUserDescription =>
      'Se verifichi un altro utente, puoi essere certo di sapere a chi stai realmente scrivendo. 💪\n\nQuando inizi una verifica, tu e l\'altro utente vedrete un popup nell\'app. Lì vedrai una serie di emoji o numeri che dovrai confrontare tra loro.\n\nIl modo migliore per farlo è incontrarsi o avviare una videochiamata. 👭';

  @override
  String get verifyOtherDevice => '🔐 Verifica altro dispositivo';

  @override
  String get verifyOtherDeviceDescription =>
      'Quando verifichi un altro dispositivo, questi dispositivi possono scambiarsi le chiavi, aumentando la tua sicurezza complessiva. 💪 Quando inizi una verifica, apparirà un popup nell\'app su entrambi i dispositivi. Lì vedrai una serie di emoji o numeri che dovrai confrontare tra loro. È meglio avere entrambi i dispositivi a portata di mano prima di iniziare la verifica. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender ha accettato la verifica della chiave';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender ha annullato la verifica della chiave';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender ha completato la verifica della chiave';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender è pronto per la verifica della chiave';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender ha richiesto la verifica della chiave';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender ha avviato la verifica della chiave';
  }

  @override
  String get transparent => 'Trasparente';

  @override
  String get incomingMessages => 'Messaggi in arrivo';

  @override
  String get stickers => 'Adesivi';

  @override
  String get discover => 'Scopri';

  @override
  String get commandHint_ignore => 'Ignora il REChain ID fornito';

  @override
  String get commandHint_unignore => 'Ignora il REChain ID specificato';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread chat non lette';
  }

  @override
  String get noDatabaseEncryption =>
      'La crittografia del database non è supportata su questa piattaforma';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Al momento ci sono $count utenti bloccati.';
  }

  @override
  String get restricted => 'Limitato';

  @override
  String get knockRestricted => 'Limitato al bussare';

  @override
  String goToSpace(Object space) {
    return 'Vai allo spazio: $space';
  }

  @override
  String get markAsUnread => 'Contrassegna come non letto';

  @override
  String userLevel(int level) {
    return '$level - Utente';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Moderatore';
  }

  @override
  String adminLevel(int level) {
    return '$level - Amministratore';
  }

  @override
  String get changeGeneralChatSettings =>
      'Modifica le impostazioni generali della chat';

  @override
  String get inviteOtherUsers => 'Invita altri utenti a questa chat';

  @override
  String get changeTheChatPermissions => 'Cambia i permessi della chat';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Cambia la visibilità della cronologia chat';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Cambia l\'indirizzo principale della chat pubblica';

  @override
  String get sendRoomNotifications => 'Invia notifiche alla @stanza';

  @override
  String get changeTheDescriptionOfTheGroup =>
      'Cambia la descrizione della chat';

  @override
  String get chatPermissionsDescription =>
      'Definisci quale livello di privilegi è necessario per determinate azioni in questa chat. I livelli di privilegi 0, 50 e 100 rappresentano solitamente utenti, moderatori e amministratori, ma qualsiasi valore intermedio è possibile.';

  @override
  String updateInstalled(String version) {
    return '🎉 Aggiornamento $version installato!';
  }

  @override
  String get changelog => 'Registro delle modifiche';

  @override
  String get sendCanceled => 'Invio annullato';

  @override
  String get loginWithMatrixId => 'Accedi con il REChain ID';

  @override
  String get discoverHomeservers => 'Scopri gli homeserver';

  @override
  String get whatIsAHomeserver => 'Cos\'è un homeserver?';

  @override
  String get homeserverDescription =>
      'Tutti i tuoi dati sono archiviati sull\'homeserver, proprio come un provider di posta elettronica. Puoi scegliere quale homeserver vuoi usare, mentre puoi comunque comunicare con tutti. Scopri di più su https://github.com/sorydima/REChain-.git';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Non sembra essere un homeserver compatibile. URL sbagliato?';

  @override
  String get calculatingFileSize => 'Calcolo della dimensione del file...';

  @override
  String get prepareSendingAttachment =>
      'Preparazione per l\'invio dell\'allegato...';

  @override
  String get sendingAttachment => 'Invio allegato...';

  @override
  String get generatingVideoThumbnail => 'Generazione miniatura video...';

  @override
  String get compressVideo => 'Compressione video...';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return 'Invio dell\'allegato $index di $length...';
  }

  @override
  String serverLimitReached(int seconds) {
    return 'Limite server raggiunto! Attendere $seconds secondi...';
  }

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Uno dei tuoi dispositivi non è verificato';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Nota: quando colleghi tutti i tuoi dispositivi al backup della chat, vengono verificati automaticamente.';

  @override
  String get continueText => 'Continua';

  @override
  String get welcomeText =>
      'Hey Hey 👋 Questa è REChain. Puoi accedere a qualsiasi homeserver compatibile con https://github.com/sorydima/REChain-.git. E poi chattare con chiunque. È un\'enorme rete di messaggistica decentralizzata!';

  @override
  String get blur => 'Sfocatura:';

  @override
  String get opacity => 'Opacità:';

  @override
  String get setWallpaper => 'Imposta sfondo';

  @override
  String get manageAccount => 'Gestisci account';

  @override
  String get noContactInformationProvided =>
      'Il server non fornisce alcuna informazione di contatto valida';

  @override
  String get contactServerAdmin => 'Contatta l\'amministratore del server';

  @override
  String get contactServerSecurity => 'Contatta la sicurezza del server';

  @override
  String get supportPage => 'Pagina di supporto';

  @override
  String get serverInformation => 'Informazioni sul server:';

  @override
  String get name => 'Nome';

  @override
  String get version => 'Versione';

  @override
  String get website => 'Sito web';

  @override
  String get compress => 'Comprimere';

  @override
  String get boldText => 'Testo in grassetto';

  @override
  String get italicText => 'Testo in corsivo';

  @override
  String get strikeThrough => 'Barrato';

  @override
  String get pleaseFillOut => 'Si prega di compilare';

  @override
  String get invalidUrl => 'URL non valido';

  @override
  String get addLink => 'Aggiungi collegamento';

  @override
  String get unableToJoinChat =>
      'Impossibile partecipare alla chat. Forse l\'altra parte ha già chiuso la conversazione.';

  @override
  String get previous => 'Precedente';

  @override
  String get otherPartyNotLoggedIn =>
      'L\'altra parte non è attualmente connessa e quindi non può ricevere messaggi!';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Usa \'$server\' per accedere';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Con la presente consenti all\'app e al sito web di condividere informazioni su di te.';

  @override
  String get open => 'Apri';

  @override
  String get waitingForServer => 'In attesa del server...';

  @override
  String get appIntroduction =>
      'REChain ti consente di chattare con i tuoi amici attraverso diverse app di messaggistica. Ulteriori informazioni su https://github.com/sorydima/REChain-.git o semplicemente tocca *Continua*.';

  @override
  String get newChatRequest => '📩 Nuova richiesta di chat';

  @override
  String get contentNotificationSettings =>
      'Impostazioni del contenuto di notifica';

  @override
  String get generalNotificationSettings => 'Impostazioni di notifica generale';

  @override
  String get roomNotificationSettings =>
      'Impostazioni di notifica della stanza';

  @override
  String get userSpecificNotificationSettings =>
      'Impostazioni di notifica specifiche dell\'utente';

  @override
  String get otherNotificationSettings => 'Altre impostazioni di notifica';

  @override
  String get notificationRuleContainsUserName => 'Contiene il nome utente';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Notifica l\'utente quando un messaggio contiene il proprio nome utente.';

  @override
  String get notificationRuleMaster => 'Silenzia tutte le notifiche';

  @override
  String get notificationRuleMasterDescription =>
      'Sovrascive tutte le altre regole e disabilita tutte le notifiche.';

  @override
  String get notificationRuleSuppressNotices =>
      'Silenziare i messaggi automatizzati';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Silenzia le notifiche da client automatizzati come i bot.';

  @override
  String get notificationRuleInviteForMe => 'Inviti per me';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Notifica l\'utente quando viene invitato a una stanza.';

  @override
  String get notificationRuleMemberEvent => 'Eventi per i membri';

  @override
  String get notificationRuleMemberEventDescription =>
      'Silenzia le notifiche per gli eventi dei membri.';

  @override
  String get notificationRuleIsUserMention => 'Menzioni dell\'utente';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Notifica l\'utente quando viene menzionato direttamente in un messaggio.';

  @override
  String get notificationRuleContainsDisplayName =>
      'Contiene nome visualizzato';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Notifica l\'utente quando un messaggio contiene il proprio nome visualizzato.';

  @override
  String get notificationRuleIsRoomMention => 'Menzioni della stanza';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Notifica l\'utente quando c\'è una menzione della stanza.';

  @override
  String get notificationRuleRoomnotif => 'Notifiche della stanza';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Notifica l\'utente quando un messaggio contiene \'@room\'.';

  @override
  String get notificationRuleTombstone => 'Tombstone';

  @override
  String get notificationRuleTombstoneDescription =>
      'Notifica all\'utente i messaggi di disattivazione della stanza.';

  @override
  String get notificationRuleReaction => 'Reazioni';

  @override
  String get notificationRuleReactionDescription =>
      'Silenzia le notifiche per le reazioni.';

  @override
  String get notificationRuleRoomServerAcl => 'ACL del server della stanza';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Silenzia le notifiche per gli elenchi di controllo degli accessi del server della stanza (ACL).';

  @override
  String get notificationRuleSuppressEdits => 'Silenzia le modifiche';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Silenzia le notifiche per i messaggi modificati.';

  @override
  String get notificationRuleCall => 'Chiamate';

  @override
  String get notificationRuleCallDescription =>
      'Notifica all\'utente le chiamate.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'Stanze crittografate One-to-One';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Notifica all\'utente i messaggi in stanze crittografate one-to-one.';

  @override
  String get notificationRuleRoomOneToOne => 'Stanze One-to-One';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Notifica all\'utente i messaggi nelle stanze one-to-one.';

  @override
  String get notificationRuleMessage => 'Messaggi';

  @override
  String get notificationRuleMessageDescription =>
      'Notifica all\'utente i messaggi generali.';

  @override
  String get notificationRuleEncrypted => 'Crittografate';

  @override
  String get notificationRuleEncryptedDescription =>
      'Notifica all\'utente i messaggi nelle stanze crittografate.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Notifica all\'utente gli eventi del widget Jitsi.';

  @override
  String get notificationRuleServerAcl =>
      'Silenziare gli eventi ACL del server';

  @override
  String get notificationRuleServerAclDescription =>
      'Silenzia le notifiche per gli eventi ACL del server.';

  @override
  String unknownPushRule(String rule) {
    return 'Regola push \'$rule\' sconosciuta';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return '🎙️ $duration - Messaggio vocale da $sender';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Se si elimina questa impostazione di notifica, questo non può essere annullato.';

  @override
  String get more => 'Di più';

  @override
  String get shareKeysWith => 'Condividi le chiavi con...';

  @override
  String get shareKeysWithDescription =>
      'Quali dispositivi dovrebbero essere fidati in modo che possano leggere i tuoi messaggi in chat crittografate?';

  @override
  String get allDevices => 'Tutti i dispositivi';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Verifica incrociata dei dispositivi, se abilitata';

  @override
  String get crossVerifiedDevices => 'Dispositivi con verifica incrociata';

  @override
  String get verifiedDevicesOnly => 'Solo dispositivi verificati';

  @override
  String get takeAPhoto => 'Scatta una foto';

  @override
  String get recordAVideo => 'Registra un video';

  @override
  String get optionalMessage => 'Messaggio (opzionale)...';

  @override
  String get notSupportedOnThisDevice => 'Non supportato su questo dispositivo';

  @override
  String get enterNewChat => 'Inizia nuova chat';

  @override
  String get approve => 'Approva';

  @override
  String get youHaveKnocked => 'Hai bussato';

  @override
  String get pleaseWaitUntilInvited =>
      'Ora attendi, finché qualcuno dalla stanza non ti invita.';

  @override
  String get commandHint_logout => 'Disconnetti questo dispositivo';

  @override
  String get commandHint_logoutall => 'Disconnetti tutti i dispositivi attivi';

  @override
  String get displayNavigationRail => 'Mostra barra di navigazione su mobile';

  @override
  String get customReaction => 'Reazione personalizzata';

  @override
  String get moreEvents => 'Altri eventi';

  @override
  String get declineInvitation => 'Rifiuta invito';

  @override
  String get noMessagesYet => 'Ancora nessun messaggio';

  @override
  String get longPressToRecordVoiceMessage =>
      'Premi a lungo per registrare un messaggio vocale.';

  @override
  String get pause => 'Pausa';

  @override
  String get resume => 'Riprendi';

  @override
  String get newSubSpace => 'Nuovo sotto sapzio';

  @override
  String get moveToDifferentSpace => 'Cambia spazio';

  @override
  String get moveUp => 'Muoviti sopra';

  @override
  String get moveDown => 'Muoviti sotto';

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
