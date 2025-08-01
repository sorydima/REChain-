// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Galician (`gl`).
class L10nGl extends L10n {
  L10nGl([String locale = 'gl']) : super(locale);

  @override
  String get alwaysUse24HourFormat => 'falso';

  @override
  String get repeatPassword => 'Repite o contrasinal';

  @override
  String get notAnImage => 'Non é un ficheiro de imaxe.';

  @override
  String get setCustomPermissionLevel =>
      'Establecer nivel personalizado dos permisos';

  @override
  String get setPermissionsLevelDescription =>
      'Elixe un rol predefinido dos indicados ou escribe un nivel personalizado entre 0 e 100.';

  @override
  String get ignoreUser => 'Ignorar usuaria';

  @override
  String get normalUser => 'Usuaria corrente';

  @override
  String get remove => 'Quitar';

  @override
  String get importNow => 'Importar agora';

  @override
  String get importEmojis => 'Importar Emojis';

  @override
  String get importFromZipFile => 'Importar desde ficheiro .zip';

  @override
  String get exportEmotePack => 'Exportar paquete Emote como .zip';

  @override
  String get replace => 'Substituír';

  @override
  String get about => 'Acerca de';

  @override
  String aboutHomeserver(String homeserver) {
    return 'Sobre $homeserver';
  }

  @override
  String get accept => 'Aceptar';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username aceptou o convite';
  }

  @override
  String get account => 'Conta';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username activou a cifraxe extremo-a-extremo';
  }

  @override
  String get addEmail => 'Engadir email';

  @override
  String get confirmREChainId =>
      'Confirma o teu ID REChain para poder eliminar a conta.';

  @override
  String supposedMxid(String mxid) {
    return 'Debería ser $mxid';
  }

  @override
  String get addChatDescription => 'Engadir descrición da conversa...';

  @override
  String get addToSpace => 'Engadir ao espazo';

  @override
  String get admin => 'Admin';

  @override
  String get alias => 'alias';

  @override
  String get all => 'Todos';

  @override
  String get allChats => 'Todas as conversas';

  @override
  String get commandHint_roomupgrade =>
      'Actualizar esta sala á versión de sala indicada';

  @override
  String get commandHint_googly => 'Envía uns ollos desos grandes';

  @override
  String get commandHint_cuddle => 'Envía un agarimo';

  @override
  String get commandHint_hug => 'Envía un abrazo';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName enviouche uns ollos grandes';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName mándache un achuche';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName abrázate';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName respondeu á chamada';
  }

  @override
  String get anyoneCanJoin => 'Calquera pode unirse';

  @override
  String get appLock => 'Bloqueo da app';

  @override
  String get appLockDescription =>
      'Bloquear a app cun código PIN cando non a uses';

  @override
  String get archive => 'Arquivo';

  @override
  String get areGuestsAllowedToJoin => 'Permitir o acceso de convidadas';

  @override
  String get areYouSure => 'Tes a certeza?';

  @override
  String get areYouSureYouWantToLogout => 'Tes a certeza de querer saír?';

  @override
  String get askSSSSSign =>
      'Para poder asinar a outra persoa, escribe a túa frase de paso ou chave de recuperación.';

  @override
  String askVerificationRequest(String username) {
    return 'Aceptar a solicitude de verificación de $username?';
  }

  @override
  String get autoplayImages => 'Reproducir automáticamente adhesivos e emotes';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'O servidor soporta as seguintes formas de conexión:\n$serverVersions\nPero esta app só soporta:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Permitir ver que estás escribindo';

  @override
  String get swipeRightToLeftToReply =>
      'Despraza hacia a esquerda para responder';

  @override
  String get sendOnEnter => 'Enter para enviar';

  @override
  String badServerVersionsException(
      String serverVersions,
      String supportedVersions,
      Object serverVerions,
      Object supoortedVersions,
      Object suportedVersions) {
    return 'O servidor soporta as seguintes características:\n$serverVersions\nPero esta app só soporta $supportedVersions';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats charlas e $participants participantes';
  }

  @override
  String get noMoreChatsFound => 'Non se atopan máis charlas…';

  @override
  String get noChatsFoundHere =>
      'Sen charlas por aquí. Comeza unha nova conversa con alguén premendo no botón de abaixo. ⤵️';

  @override
  String get joinedChats => 'Charlas nas que participas';

  @override
  String get unread => 'Sen ler';

  @override
  String get space => 'Espazo';

  @override
  String get spaces => 'Espazos';

  @override
  String get banFromChat => 'Vetar na conversa';

  @override
  String get banned => 'Vetada';

  @override
  String bannedUser(String username, String targetName) {
    return '$username vetou a $targetName';
  }

  @override
  String get blockDevice => 'Bloquear dispositivo';

  @override
  String get blocked => 'Bloqueado';

  @override
  String get botMessages => 'Mensaxes de Bot';

  @override
  String get cancel => 'Cancelar';

  @override
  String cantOpenUri(String uri) {
    return 'Non se pode abrir o URI $uri';
  }

  @override
  String get changeDeviceName => 'Cambiar nome do dispositivo';

  @override
  String changedTheChatAvatar(String username) {
    return '$username cambiou o avatar da conversa';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username mudou a descrición da conversa a: \'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username mudou o nome da charla a: \'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username mudou os permisos da conversa';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username cambiou o nome público a: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username mudou as regras de acceso para convidadas';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username mudou as regras de acceso para convidadas a: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username mudou a visibilidade do historial';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username mudou a visibilidade do historial a: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username mudou as regras de acceso';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username mudou as regras de acceso a: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username mudou o avatar';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username mudou os alias da sala';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username mudou a ligazón de convite';
  }

  @override
  String get changePassword => 'Mudar contrasinal';

  @override
  String get changeTheHomeserver => 'Mudar de servidor de inicio';

  @override
  String get changeTheme => 'Cambiar o estilo';

  @override
  String get changeTheNameOfTheGroup => 'Mudar o nome do grupo';

  @override
  String get changeYourAvatar => 'Cambia o avatar';

  @override
  String get channelCorruptedDecryptError => 'A cifraxe está estragada';

  @override
  String get chat => 'Conversa';

  @override
  String get yourChatBackupHasBeenSetUp =>
      'Configurouse a copia de apoio da charla.';

  @override
  String get chatBackup => 'Copia de apoio';

  @override
  String get chatBackupDescription =>
      'As mensaxes antigas están protexidas cunha chave de recuperación. Pon coidado e non a perdas.';

  @override
  String get chatDetails => 'Detalles da conversa';

  @override
  String get chatHasBeenAddedToThisSpace =>
      'Engadiuse a conversa a este espazo';

  @override
  String get chats => 'Conversas';

  @override
  String get chooseAStrongPassword => 'Escolle un contrasinal forte';

  @override
  String get clearArchive => 'Baleirar arquivo';

  @override
  String get close => 'Pechar';

  @override
  String get commandHint_markasdm =>
      'Marcar como sala de mensaxe directa para o ID REChain indicado';

  @override
  String get commandHint_markasgroup => 'Marcar como grupo';

  @override
  String get commandHint_ban => 'Vetar a usuaria indicada desta sala';

  @override
  String get commandHint_clearcache => 'Baleirar caché';

  @override
  String get commandHint_create =>
      'Crear un grupo de conversa baleiro\nUsa --no-encryption para desactivar a cifraxe';

  @override
  String get commandHint_discardsession => 'Descartar sesión';

  @override
  String get commandHint_dm =>
      'Iniciar unha charla directa\nUsa --no-encryption para desactivar a cifraxe';

  @override
  String get commandHint_html => 'Enviar texto con formato HTML';

  @override
  String get commandHint_invite => 'Convidar á usuaria a esta sala';

  @override
  String get commandHint_join => 'Unirte á sala indicada';

  @override
  String get commandHint_kick => 'Eliminar a usuaria indicada desta sala';

  @override
  String get commandHint_leave => 'Saír desta sala';

  @override
  String get commandHint_me => 'Conta algo sobre ti';

  @override
  String get commandHint_myroomavatar =>
      'Establece a túa imaxe para esta sala (por mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Establece o teu nome público para esta sala';

  @override
  String get commandHint_op =>
      'Establecer o nivel de responsabilidade da usuaria (por defecto: 50)';

  @override
  String get commandHint_plain => 'Enviar texto sen formato';

  @override
  String get commandHint_react => 'Enviar resposta como reacción';

  @override
  String get commandHint_send => 'Enviar texto';

  @override
  String get commandHint_unban => 'Retirar veto á usuaria para esta sala';

  @override
  String get commandInvalid => 'Comando non válido';

  @override
  String commandMissing(String command) {
    return '$command non é un comando.';
  }

  @override
  String get compareEmojiMatch => 'Compara estes emojis';

  @override
  String get compareNumbersMatch => 'Compara estes números';

  @override
  String get configureChat => 'Configurar conversa';

  @override
  String get confirm => 'Confirmar';

  @override
  String get connect => 'Conectar';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'O contacto foi convidado ao grupo';

  @override
  String get containsDisplayName => 'Contén nome público';

  @override
  String get containsUserName => 'Contén nome de usuaria';

  @override
  String get contentHasBeenReported =>
      'O contido foi denunciado á administración do servidor';

  @override
  String get copiedToClipboard => 'Copiado ao portapapeis';

  @override
  String get copy => 'Copiar';

  @override
  String get copyToClipboard => 'Copiar ao portapapeis';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Non se descifrou a mensaxe: $error';
  }

  @override
  String get checkList => 'Check list';

  @override
  String countParticipants(int count) {
    return '$count participantes';
  }

  @override
  String countInvited(int count) {
    return '$count convidadas';
  }

  @override
  String get create => 'Crear';

  @override
  String createdTheChat(String username) {
    return '💬 $username creou a conversa';
  }

  @override
  String get createGroup => 'Crear grupo';

  @override
  String get createNewSpace => 'Novo espazo';

  @override
  String get currentlyActive => 'Actualmente activo';

  @override
  String get darkTheme => 'Escuro';

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
      'Esto desactivará a conta. Esto non ten volta atrás. Estás segura?';

  @override
  String get defaultPermissionLevel =>
      'Nivel de permisos por defecto para novas usuarias';

  @override
  String get delete => 'Eliminar';

  @override
  String get deleteAccount => 'Eliminar conta';

  @override
  String get deleteMessage => 'Eliminar mensaxe';

  @override
  String get device => 'Dispositivo';

  @override
  String get deviceId => 'ID do dispositivo';

  @override
  String get devices => 'Dispositivos';

  @override
  String get directChats => 'Conversas Directas';

  @override
  String get allRooms => 'Todas as Conversas en grupo';

  @override
  String get displaynameHasBeenChanged => 'O nome público mudou';

  @override
  String get downloadFile => 'Descargar ficheiro';

  @override
  String get edit => 'Editar';

  @override
  String get editBlockedServers => 'Editar servidores bloqueados';

  @override
  String get chatPermissions => 'Permisos da conversa';

  @override
  String get editDisplayname => 'Editar nome público';

  @override
  String get editRoomAliases => 'Editar alias da sala';

  @override
  String get editRoomAvatar => 'Editar avatar da sala';

  @override
  String get emoteExists => 'Xa existe ese emote!';

  @override
  String get emoteInvalid => 'Atallo do emote non é válido!';

  @override
  String get emoteKeyboardNoRecents =>
      'Os emotes usados recentemente aparecerán aquí...';

  @override
  String get emotePacks => 'Paquetes de Emotes para a sala';

  @override
  String get emoteSettings => 'Axustes de Emote';

  @override
  String get globalChatId => 'ID Global da charla';

  @override
  String get accessAndVisibility => 'Acceso e Visibilidade';

  @override
  String get accessAndVisibilityDescription =>
      'Quen pode unirse a esta charla e de que xeito e como poden atopala.';

  @override
  String get calls => 'Chamadas';

  @override
  String get customEmojisAndStickers => 'Emojis personais e adhesivos';

  @override
  String get customEmojisAndStickersBody =>
      'Engade ou comparte emojis personais e adhesivos que poden usarse nas charlas.';

  @override
  String get emoteShortcode => 'Atallo de Emote';

  @override
  String get emoteWarnNeedToPick => 'Escribe un atallo e asocialle unha imaxe!';

  @override
  String get emptyChat => 'Conversa baleira';

  @override
  String get enableEmotesGlobally => 'Activar paquete emote globalmente';

  @override
  String get enableEncryption => 'Activar cifraxe';

  @override
  String get enableEncryptionWarning =>
      'Non poderás desactivar a cifraxe posteriormente, tes certeza?';

  @override
  String get encrypted => 'Cifrado';

  @override
  String get encryption => 'Cifraxe';

  @override
  String get encryptionNotEnabled => 'A cifraxe non está activada';

  @override
  String endedTheCall(String senderName) {
    return '$senderName rematou a chamada';
  }

  @override
  String get enterAnEmailAddress => 'Escribe un enderezo de email';

  @override
  String get homeserver => 'Servidor de inicio';

  @override
  String get enterYourHomeserver => 'Escribe o teu servidor de inicio';

  @override
  String errorObtainingLocation(String error) {
    return 'Erro ao obter a localización: $error';
  }

  @override
  String get everythingReady => 'Todo preparado!';

  @override
  String get extremeOffensive => 'Extremadamente ofensivo';

  @override
  String get fileName => 'Nome do ficheiro';

  @override
  String get rechainonline => 'REChain';

  @override
  String get fontSize => 'Tamaño da letra';

  @override
  String get forward => 'Reenviar';

  @override
  String get fromJoining => 'Desde que se una';

  @override
  String get fromTheInvitation => 'Desde o convite';

  @override
  String get goToTheNewRoom => 'Ir á nova sala';

  @override
  String get group => 'Grupo';

  @override
  String get chatDescription => 'Descrición da conversa';

  @override
  String get chatDescriptionHasBeenChanged =>
      'Cambiou a descrición da conversa';

  @override
  String get groupIsPublic => 'O grupo é público';

  @override
  String get groups => 'Grupos';

  @override
  String groupWith(String displayname) {
    return 'Grupo con $displayname';
  }

  @override
  String get guestsAreForbidden => 'Non se permiten convidadas';

  @override
  String get guestsCanJoin => 'Permítense convidadas';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username retirou o convite para $targetName';
  }

  @override
  String get help => 'Axuda';

  @override
  String get hideRedactedEvents => 'Agochar eventos editados';

  @override
  String get hideRedactedMessages => 'Agochar mensaxes editadas';

  @override
  String get hideRedactedMessagesBody =>
      'Se alguén corrixe unha mensaxe entón esta xa non será visible na charla.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Agochar formatos de mensaxe non válidos ou descoñecidos';

  @override
  String get howOffensiveIsThisContent => 'É moi ofensivo este contido?';

  @override
  String get id => 'ID';

  @override
  String get identity => 'Identidade';

  @override
  String get block => 'Bloquear';

  @override
  String get blockedUsers => 'Usuarias bloqueadas';

  @override
  String get blockListDescription =>
      'Podes bloquear usuarias que che molesten. Non recibirás mensaxes nin convites para salas procedentes das usuarias da túa lista persoal de bloqueo.';

  @override
  String get blockUsername => 'Ignorar identificador';

  @override
  String get iHaveClickedOnLink => 'Premín na ligazón';

  @override
  String get incorrectPassphraseOrKey =>
      'Frase de paso ou chave de recuperación incorrecta';

  @override
  String get inoffensive => 'Inofensivo';

  @override
  String get inviteContact => 'Convidar contacto';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return 'Queres convidar a $contact para que se una á conversa \"$groupName\"?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Convidar contacto a $groupName';
  }

  @override
  String get noChatDescriptionYet =>
      'Aínda non se escribeu a descrición da conversa.';

  @override
  String get tryAgain => 'Intentar outra vez';

  @override
  String get invalidServerName => 'Nome de servidor non válido';

  @override
  String get invited => 'Convidado';

  @override
  String get redactMessageDescription =>
      'A mensaxe vai ser editada para todas as participantes na conversa. Non ten volta atrás.';

  @override
  String get optionalRedactReason =>
      '(Optativo) Razón para editar a mensaxe...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username convidou a $targetName';
  }

  @override
  String get invitedUsersOnly => 'Só usuarias convidadas';

  @override
  String get inviteForMe => 'Convite para min';

  @override
  String inviteText(String username, String link) {
    return '$username convidoute a REChain.\n1. Visita online.rechain.network e instala a app\n2. Crea unha conta ou Accede\n3. Abre a ligazón do convite: \n $link';
  }

  @override
  String get isTyping => 'está escribindo…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username uníuse á conversa';
  }

  @override
  String get joinRoom => 'Unirse á sala';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username expulsou a $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username expulsou e vetou a $targetName';
  }

  @override
  String get kickFromChat => 'Expulsar da conversa';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Última actividade: $localizedTimeShort';
  }

  @override
  String get leave => 'Saír';

  @override
  String get leftTheChat => 'Deixar a conversa';

  @override
  String get license => 'Licenza';

  @override
  String get lightTheme => 'Claro';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Cargar $count participantes máis';
  }

  @override
  String get dehydrate => 'Exportar sesión e eliminar dispositivo';

  @override
  String get dehydrateWarning =>
      'Esta acción non é reversible. Pon coidado en gardar o ficheiro de apoio.';

  @override
  String get dehydrateTor => 'Usuarias TOR: Exportar sesión';

  @override
  String get dehydrateTorLong =>
      'Para usuarias de TOR, é recomendable exportar a sesión antes de pechar a xanela.';

  @override
  String get hydrateTor => 'Usuarias TOR: Importar a sesión exportada';

  @override
  String get hydrateTorLong =>
      'Exportaches a túa sesión a última vez en TOR? Importaa rápidamente e segue conversando.';

  @override
  String get hydrate => 'Restablecer desde copia de apoio';

  @override
  String get loadingPleaseWait => 'Cargando... Agarda.';

  @override
  String get loadMore => 'Cargar máis…';

  @override
  String get locationDisabledNotice =>
      'Os servizos de localización están desactivados. Actívaos para poder compartir a localización.';

  @override
  String get locationPermissionDeniedNotice =>
      'Permiso de localización denegado. Concede este permiso para poder compartir a localización.';

  @override
  String get login => 'Acceder';

  @override
  String logInTo(String homeserver) {
    return 'Entrar en $homeserver';
  }

  @override
  String get logout => 'Pechar sesión';

  @override
  String get memberChanges => 'Cambios de participantes';

  @override
  String get mention => 'Mención';

  @override
  String get messages => 'Mensaxes';

  @override
  String get messagesStyle => 'Mensaxes:';

  @override
  String get moderator => 'Moderadora';

  @override
  String get muteChat => 'Acalar conversa';

  @override
  String get needPantalaimonWarning =>
      'Ten en conta que polo de agora precisas Pantalaimon para a cifraxe extremo-a-extremo.';

  @override
  String get newChat => 'Nova conversa';

  @override
  String get newMessageInrechainonline => '💬 Nova mensaxe en REChain';

  @override
  String get newVerificationRequest => 'Nova solicitude de verificación!';

  @override
  String get next => 'Seguinte';

  @override
  String get no => 'Non';

  @override
  String get noConnectionToTheServer => 'Sen conexión co servidor';

  @override
  String get noEmotesFound => 'Non hai emotes. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Só podes activar a cifraxe tan pronto como a sala non sexa públicamente accesible.';

  @override
  String get noGoogleServicesWarning =>
      'Semella que non tes Firebase Cloud Messaging dispoñible no teu dispositivo. Para recibir notificacións push recomendamos que instales ntfy. Con ntfy ou outro provedor Unified Push podes recibir notificacións push de xeito seguro. Podes descargar ntfy desde a PlayStore ou F-Droid.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 non é un servidor Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node Network, usar $server2 no seu lugar?';
  }

  @override
  String get shareInviteLink => 'Comparte ligazón de convite';

  @override
  String get scanQrCode => 'Escanear código QR';

  @override
  String get none => 'Ningún';

  @override
  String get noPasswordRecoveryDescription =>
      'Aínda non engaiches ningún xeito de recuperar o contrasinal.';

  @override
  String get noPermission => 'Sen permiso';

  @override
  String get noRoomsFound => 'Non se atoparon salas…';

  @override
  String get notifications => 'Notificacións';

  @override
  String get notificationsEnabledForThisAccount =>
      'Notificacións activadas para a conta';

  @override
  String numUsersTyping(int count) {
    return '$count usuarias están escribindo…';
  }

  @override
  String get obtainingLocation => 'Obtendo a localización…';

  @override
  String get offensive => 'Ofensivo';

  @override
  String get offline => 'Desconectada';

  @override
  String get ok => 'Ok';

  @override
  String get online => 'En liña';

  @override
  String get onlineKeyBackupEnabled =>
      'Copia de Apoio en liña das Chaves activada';

  @override
  String get oopsPushError =>
      'Vaites! Desgraciadamente algo fallou ao configurar as notificacións push.';

  @override
  String get oopsSomethingWentWrong => 'Ooooi, algo fallou…';

  @override
  String get openAppToReadMessages => 'Abrir a app e ler mensaxes';

  @override
  String get openCamera => 'Abrir cámara';

  @override
  String get openVideoCamera => 'Abrir a cámara para un vídeo';

  @override
  String get oneClientLoggedOut => 'Un dos teus clientes foi desconectado';

  @override
  String get addAccount => 'Engadir conta';

  @override
  String get editBundlesForAccount => 'Editar os feixes desta conta';

  @override
  String get addToBundle => 'Engadir ao feixe';

  @override
  String get removeFromBundle => 'Eliminar deste feixe';

  @override
  String get bundleName => 'Nome do feixe';

  @override
  String get enableMultiAccounts =>
      '(BETA) Activar varias contas neste dispositivo';

  @override
  String get openInMaps => 'Abrir en mapas';

  @override
  String get link => 'Ligazón';

  @override
  String get serverRequiresEmail =>
      'O servidor precisa validar o teu enderezo de email para rexistrarte.';

  @override
  String get or => 'Ou';

  @override
  String get participant => 'Participante';

  @override
  String get passphraseOrKey => 'frase de paso ou chave de recuperación';

  @override
  String get password => 'Contrasinal';

  @override
  String get passwordForgotten => 'Contrasinal esquecido';

  @override
  String get passwordHasBeenChanged => 'Cambiouse o contrasinal';

  @override
  String get hideMemberChangesInPublicChats =>
      'Agochar cambios dos membros nas charlas públicas';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      'Non mostrar na cronoloxía se alguén se une ou deixa unha conversa pública, para mellorar a lexibilidade.';

  @override
  String get overview => 'Vista xeral';

  @override
  String get notifyMeFor => 'Notificarme sobre';

  @override
  String get passwordRecoverySettings =>
      'Axustes de recuperación do contrasinal';

  @override
  String get passwordRecovery => 'Recuperación do contrasinal';

  @override
  String get people => 'Persoas';

  @override
  String get pickImage => 'Elixe unha imaxe';

  @override
  String get pin => 'Fixar';

  @override
  String play(String fileName) {
    return 'Reproducir $fileName';
  }

  @override
  String get pleaseChoose => 'Por favor elixe';

  @override
  String get pleaseChooseAPasscode => 'Escolle un código de acceso';

  @override
  String get pleaseClickOnLink =>
      'Preme na ligazón do email e segue as instrucións.';

  @override
  String get pleaseEnter4Digits =>
      'Escribe 4 díxitos ou deíxao baleiro para non activar o bloqueo.';

  @override
  String get pleaseEnterRecoveryKey => 'Escribe a túa chave de recuperación:';

  @override
  String get pleaseEnterYourPassword => 'Escribe o teu contrasinal';

  @override
  String get pleaseEnterYourPin => 'Escribe o teu pin';

  @override
  String get pleaseEnterYourUsername => 'Escribe o teu nome de usuaria';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Segue as instruccións do sitio web e toca en seguinte.';

  @override
  String get privacy => 'Privacidade';

  @override
  String get publicRooms => 'Salas públicas';

  @override
  String get pushRules => 'Regras de envío';

  @override
  String get reason => 'Razón';

  @override
  String get recording => 'Gravando';

  @override
  String redactedBy(String username) {
    return 'Editada por $username';
  }

  @override
  String get directChat => 'Conversa Directa';

  @override
  String redactedByBecause(String username, String reason) {
    return 'Editada por $username debido a: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username editou un evento';
  }

  @override
  String get redactMessage => 'Eliminar mensaxe';

  @override
  String get register => 'Crear conta';

  @override
  String get reject => 'Rexeitar';

  @override
  String rejectedTheInvitation(String username) {
    return '$username rexeitou o convite';
  }

  @override
  String get rejoin => 'Volta a unirte';

  @override
  String get removeAllOtherDevices => 'Quitar todos os outros dispositivos';

  @override
  String removedBy(String username) {
    return 'Eliminado por $username';
  }

  @override
  String get removeDevice => 'Quitar dispositivo';

  @override
  String get unbanFromChat => 'Retirar veto na conversa';

  @override
  String get removeYourAvatar => 'Elimina o avatar';

  @override
  String get replaceRoomWithNewerVersion => 'Substituír sala pola nova versión';

  @override
  String get reply => 'Responder';

  @override
  String get reportMessage => 'Denunciar mensaxe';

  @override
  String get requestPermission => 'Solicitar permiso';

  @override
  String get roomHasBeenUpgraded => 'A sala foi actualizada';

  @override
  String get roomVersion => 'Versión da sala';

  @override
  String get saveFile => 'Gardar ficheiro';

  @override
  String get search => 'Buscar';

  @override
  String get security => 'Seguridade';

  @override
  String get recoveryKey => 'Chave de recuperación';

  @override
  String get recoveryKeyLost => 'Perdeches a chave de recuperación?';

  @override
  String seenByUser(String username) {
    return 'Visto por $username';
  }

  @override
  String get send => 'Enviar';

  @override
  String get sendAMessage => 'Enviar unha mensaxe';

  @override
  String get sendAsText => 'Enviar como texto';

  @override
  String get sendAudio => 'Enviar audio';

  @override
  String get sendFile => 'Enviar ficheiro';

  @override
  String get sendImage => 'Enviar imaxe';

  @override
  String sendImages(int count) {
    return 'Enviar $count imaxe';
  }

  @override
  String get sendMessages => 'Enviar mensaxes';

  @override
  String get sendOriginal => 'Enviar orixinal';

  @override
  String get sendSticker => 'Enviar adhesivo';

  @override
  String get sendVideo => 'Enviar vídeo';

  @override
  String sentAFile(String username) {
    return '📁 $username enviou un ficheiro';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username enviou un audio';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username enviou unha imaxe';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username enviou un adhesivo';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username enviou un vídeo';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName enviou información da chamada';
  }

  @override
  String get separateChatTypes => 'Separar Conversas directas e Grupos';

  @override
  String get setAsCanonicalAlias => 'Establecer como alias principal';

  @override
  String get setCustomEmotes => 'Establecer emotes personalizados';

  @override
  String get setChatDescription => 'Escribir descrición da conversa';

  @override
  String get setInvitationLink => 'Establecer ligazón do convite';

  @override
  String get setPermissionsLevel => 'Establecer nivel de permisos';

  @override
  String get setStatus => 'Establecer estado';

  @override
  String get settings => 'Axustes';

  @override
  String get share => 'Compartir';

  @override
  String sharedTheLocation(String username) {
    return '$username compartiu a súa localización';
  }

  @override
  String get shareLocation => 'Compartir localización';

  @override
  String get showPassword => 'Amosar contrasinal';

  @override
  String get presenceStyle => 'Presenza:';

  @override
  String get presencesToggle => 'Mostra mensaxes de estado de outras usuarias';

  @override
  String get singlesignon => 'Conexión Unificada SSO';

  @override
  String get skip => 'Saltar';

  @override
  String get sourceCode => 'Código fonte';

  @override
  String get spaceIsPublic => 'O Espazo é público';

  @override
  String get spaceName => 'Nome do Espazo';

  @override
  String startedACall(String senderName) {
    return '$senderName iniciou unha chamada';
  }

  @override
  String get startFirstChat => 'Abre a túa primeira conversa';

  @override
  String get status => 'Estado';

  @override
  String get statusExampleMessage => '¿Que tal estás hoxe?';

  @override
  String get submit => 'Enviar';

  @override
  String get synchronizingPleaseWait => 'Sincronizando... Agarda.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Sincronizando…($percentage%)';
  }

  @override
  String get systemTheme => 'Sistema';

  @override
  String get theyDontMatch => 'Non concordan';

  @override
  String get theyMatch => 'Concordan';

  @override
  String get title => 'REChain';

  @override
  String get toggleFavorite => 'Marcar Favorito';

  @override
  String get toggleMuted => 'Cambia Noificacións';

  @override
  String get toggleUnread => 'Marcar como Lido/Non lido';

  @override
  String get tooManyRequestsWarning =>
      'Demasiadas solicitudes. Inténtao máis tarde!';

  @override
  String get transferFromAnotherDevice => 'Transferir desde outro dispositivo';

  @override
  String get tryToSendAgain => 'Inténtao outra vez';

  @override
  String get unavailable => 'Non dispoñible';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username retirou o veto a $targetName';
  }

  @override
  String get unblockDevice => 'Desbloquear dispositivo';

  @override
  String get unknownDevice => 'Dispositivo descoñecido';

  @override
  String get unknownEncryptionAlgorithm => 'Algoritmo de cifraxe descoñecido';

  @override
  String unknownEvent(String type) {
    return 'Evento descoñecido \'$type\'';
  }

  @override
  String get unmuteChat => 'Reactivar notificacións';

  @override
  String get unpin => 'Desafixar';

  @override
  String unreadChats(int unreadCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount conversas sen ler',
      one: '1 conversa sen ler',
    );
    return '$_temp0';
  }

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username e $count máis están escribindo…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username e $username2 están escribindo…';
  }

  @override
  String userIsTyping(String username) {
    return '$username está escribindo…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username deixou a conversa';
  }

  @override
  String get username => 'Nome de usuaria';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username enviou un evento $type';
  }

  @override
  String get unverified => 'Sen verificar';

  @override
  String get verified => 'Verificado';

  @override
  String get verify => 'Verificar';

  @override
  String get verifyStart => 'Comezar verificación';

  @override
  String get verifySuccess => 'Verificaches correctamente!';

  @override
  String get verifyTitle => 'Verificando a outra conta';

  @override
  String get videoCall => 'Chamada de vídeo';

  @override
  String get visibilityOfTheChatHistory =>
      'Visibilidade do historial da conversa';

  @override
  String get visibleForAllParticipants => 'Visible para todas as participantes';

  @override
  String get visibleForEveryone => 'Visible para todas';

  @override
  String get voiceMessage => 'Mensaxe de voz';

  @override
  String get waitingPartnerAcceptRequest =>
      'Agardando a que a outra parte acepte a solicitude…';

  @override
  String get waitingPartnerEmoji =>
      'Agardando a que a outra parte acepte as emoticonas…';

  @override
  String get waitingPartnerNumbers =>
      'Agardando a que a outra parte acepte os números…';

  @override
  String get wallpaper => 'Imaxe de fondo:';

  @override
  String get warning => 'Aviso!';

  @override
  String get weSentYouAnEmail => 'Enviamosche un email';

  @override
  String get whoCanPerformWhichAction =>
      'Quen pode realizar determinada acción';

  @override
  String get whoIsAllowedToJoinThisGroup => 'Quen se pode unir a este grupo';

  @override
  String get whyDoYouWantToReportThis => 'Por que queres denunciar esto?';

  @override
  String get wipeChatBackup =>
      'Queres eliminar a copia de apoio da conversa e crear unha nova chave de recuperación?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Con estos enderezos podes recuperar o contrasinal.';

  @override
  String get writeAMessage => 'Escribe unha mensaxe…';

  @override
  String get yes => 'Si';

  @override
  String get you => 'Ti';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Xa non participas desta conversa';

  @override
  String get youHaveBeenBannedFromThisChat => 'Foches vetada nesta conversa';

  @override
  String get yourPublicKey => 'A túa chave pública';

  @override
  String get messageInfo => 'Info da mensaxe';

  @override
  String get time => 'Hora';

  @override
  String get messageType => 'Tipo de mensaxe';

  @override
  String get sender => 'Remitente';

  @override
  String get openGallery => 'Galería pública';

  @override
  String get removeFromSpace => 'Retirar do espazo';

  @override
  String get addToSpaceDescription =>
      'Elixe un espazo ao que engadir esta conversa.';

  @override
  String get start => 'Comezar';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'Para desbloquear as mensaxes antigas, escribe a chave de recuperación creada nunha sesión existente. A chave de recuperación NON é o teu contrasinal.';

  @override
  String get publish => 'Publicar';

  @override
  String videoWithSize(String size) {
    return 'Vídeo ($size)';
  }

  @override
  String get openChat => 'Abrir Conversa';

  @override
  String get markAsRead => 'Marcar como lido';

  @override
  String get reportUser => 'Denunciar usuaria';

  @override
  String get dismiss => 'Desbotar';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender reaccionou con $reaction';
  }

  @override
  String get pinMessage => 'Fixar na sala';

  @override
  String get confirmEventUnpin => 'Tes a certeza de querer desafixar o evento?';

  @override
  String get emojis => 'Emojis';

  @override
  String get placeCall => 'Chamar';

  @override
  String get voiceCall => 'Chamada de voz';

  @override
  String get unsupportedAndroidVersion => 'Version de Android non soportada';

  @override
  String get unsupportedAndroidVersionLong =>
      'Esta característica require unha vesión máis recente de Android. Mira se hai actualizacións ou soporte de Mobile KatyaOS.';

  @override
  String get videoCallsBetaWarning =>
      'Ten en conta que as chamadas de vídeo están en fase beta. Poderían non funcionar correctamente ou non funcionar nalgunhas plataformas.';

  @override
  String get experimentalVideoCalls => 'Chamadas de vídeo en probas';

  @override
  String get emailOrUsername => 'Email ou nome de usuaria';

  @override
  String get indexedDbErrorTitle => 'Problemas no modo privado';

  @override
  String get indexedDbErrorLong =>
      'A almacenaxe de mensaxes non está activada por defecto no modo privado.\nMira en\n- about:config\n- establece dom.indexedDB.privateBrowsing.enabled como true\nSe non, non é posible executar REChain.';

  @override
  String switchToAccount(String number) {
    return 'Cambiar á conta $number';
  }

  @override
  String get nextAccount => 'Conta seguinte';

  @override
  String get previousAccount => 'Conta anterior';

  @override
  String get addWidget => 'Engadir widget';

  @override
  String get widgetVideo => 'Vídeo';

  @override
  String get widgetEtherpad => 'Nota de texto';

  @override
  String get widgetJitsi => 'Jitsi Meet';

  @override
  String get widgetCustom => 'Personalizado';

  @override
  String get widgetName => 'Nome';

  @override
  String get widgetUrlError => 'Non é un URL válido.';

  @override
  String get widgetNameError => 'Escribe un nome público.';

  @override
  String get errorAddingWidget => 'Erro ao engadir o widget.';

  @override
  String get youRejectedTheInvitation => 'Rexeitaches o convite';

  @override
  String get youJoinedTheChat => 'Unícheste á conversa';

  @override
  String get youAcceptedTheInvitation => '👍 Aceptaches o convite';

  @override
  String youBannedUser(String user) {
    return 'Vetaches a $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Retiraches o convite para $user';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 Convidáronte cunha ligazón a:\n$alias';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 $user convidoute';
  }

  @override
  String invitedBy(String user) {
    return '📩 Convidada por $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Convidaches a $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Expulsaches a $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Expulsaches e vetaches a $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Retiraches o veto a $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user petou na porta';
  }

  @override
  String get usersMustKnock => 'As usuarias teñen que pedir entrar';

  @override
  String get noOneCanJoin => 'Ninguén pode unirse';

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user quere unirse á charla.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'Aínda non se creou unha ligazón pública';

  @override
  String get knock => 'Solicitar acceso';

  @override
  String get users => 'Usuarias';

  @override
  String get unlockOldMessages => 'Desbloquear mensaxes antigas';

  @override
  String get storeInSecureStorageDescription =>
      'Gardar a chave de recuperación na almacenaxe segura deste dispositivo.';

  @override
  String get saveKeyManuallyDescription =>
      'Garda esta chave manualmente usando o sistema para compartir do dispositivo ou portapapeis.';

  @override
  String get storeInAndroidKeystore => 'Gardar en Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Gardar en Apple KeyChain';

  @override
  String get storeSecurlyOnThisDevice =>
      'Gardar de xeito seguro no dispositivo';

  @override
  String countFiles(int count) {
    return '$count ficheiros';
  }

  @override
  String get user => 'Usuaria';

  @override
  String get custom => 'Personal';

  @override
  String get foregroundServiceRunning =>
      'Esta notificación aparece cando se está a executar o servizo en segundo plano.';

  @override
  String get screenSharingTitle => 'compartición da pantalla';

  @override
  String get screenSharingDetail =>
      'Estás a compartir a túa pantalla en REChain';

  @override
  String get callingPermissions => 'Permisos de chamada';

  @override
  String get callingAccount => 'Conta que chama';

  @override
  String get callingAccountDetails =>
      'Permítelle a REChain usar a app de telefonía nativa de android.';

  @override
  String get appearOnTop => 'Aparecer arriba';

  @override
  String get appearOnTopDetails =>
      'Permítelle á app aparecer por enriba (non é preciso se xa configuraches REChain como unha conta para chamadas)';

  @override
  String get otherCallingPermissions =>
      'Micrófono, cámara e outros permisos para REChain';

  @override
  String get whyIsThisMessageEncrypted => 'Por que non podo ler esta mensaxe?';

  @override
  String get noKeyForThisMessage =>
      'Pode ser que a mensaxe fose enviada antes de que ti accedeses á túa conta neste dispositivo.\n\nTamén é posible que a remitente non validase o teu dispositivo ou tamén que algo fallase na conexión a internet.\n\nPodes ler a mensaxe noutro dispositivo? Entón podes transferila desde el! Vai a Axustes > Dispositivos e comproba que tes tódolos dispositivos verificados. Entón cando abras a sala a próxima vez a sincronización realizarase e as chaves transmitiranse automáticamente.\n\nNon desexas perder as chaves cando pechas sesión ou cambias de dispositivo? Comproba nos axustes que activaches a copia de apoio das conversas.';

  @override
  String get newGroup => 'Novo grupo';

  @override
  String get newSpace => 'Novo espazo';

  @override
  String get enterSpace => 'Entrar no espazo';

  @override
  String get enterRoom => 'Entrar na sala';

  @override
  String get allSpaces => 'Todos os espazos';

  @override
  String numChats(String number) {
    return '$number conversas';
  }

  @override
  String get hideUnimportantStateEvents =>
      'Agochar os eventos de menor relevancia';

  @override
  String get hidePresences => 'Agochar Lista de estados?';

  @override
  String get doNotShowAgain => 'Non mostrar outra vez';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Conversa baleira (era $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Os Espazos permítenche consolidar as túas conversas e construir comunidades públicas ou privadas.';

  @override
  String get encryptThisChat => 'Cifrar esta conversa';

  @override
  String get disableEncryptionWarning =>
      'Por razóns de seguridade non podes desactivar a cifraxe dunha conversa onde foi activada previamente.';

  @override
  String get sorryThatsNotPossible => 'Lamentámolo... iso non é posible';

  @override
  String get deviceKeys => 'Chaves do dispositivo:';

  @override
  String get reopenChat => 'Reabrir conversa';

  @override
  String get noBackupWarning =>
      'Aviso! Se non activas a copia de apoio da conversa, perderás o acceso ás túas mensaxes cifradas. É moi recomendable activar a copia de apoio da conversa antes de pechar a sesión.';

  @override
  String get noOtherDevicesFound => 'Non se atopan outros dispositivos';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Non se puido enviar! O servidor só permite anexos que non superen $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Gardouse o ficheiro en $path';
  }

  @override
  String get jumpToLastReadMessage => 'Ir á última mensaxe lida';

  @override
  String get readUpToHere => 'Lin ate aquí';

  @override
  String get jump => 'Ir alá';

  @override
  String get openLinkInBrowser => 'Abrir ligazón no navegador';

  @override
  String get reportErrorDescription =>
      '😭 Vaia! Algo fallou. Se queres, podes informar do problema ás persoas desenvolvedoras.';

  @override
  String get report => 'informar';

  @override
  String get signInWithPassword => 'Accede con contrasinal';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Inténtao máis tarde ou elixe un servidor diferente.';

  @override
  String signInWith(String provider) {
    return 'Accede con $provider';
  }

  @override
  String get profileNotFound =>
      'Non se atopa a usuaria no servidor. Pode que haxa un problema coa conexión ou que a usuaria non exista.';

  @override
  String get setTheme => 'Establecer decorado:';

  @override
  String get setColorTheme => 'Cor do decorado:';

  @override
  String get invite => 'Convidar';

  @override
  String get inviteGroupChat => '📨 Convidar a conversa en grupo';

  @override
  String get invitePrivateChat => '📨 Convidar a conversa privada';

  @override
  String get invalidInput => 'Contido non válido!';

  @override
  String wrongPinEntered(int seconds) {
    return 'PIN incorrecto! Inténtao outra vez en $seconds segundos...';
  }

  @override
  String get pleaseEnterANumber => 'Escribe un número maior de cero';

  @override
  String get archiveRoomDescription =>
      'Vaise mover a charla ao arquivo. Outras usuarias poderán ver que saíches da conversa.';

  @override
  String get roomUpgradeDescription =>
      'Vaise recrear a charla coa nova versión da sala. Todas as participantes recibirán unha notificación para que cambien á nova charla. Podes ler máis información acerca das versións das salas en https://spec.online.rechain.network/latest/rooms/';

  @override
  String get removeDevicesDescription =>
      'Vas pechar a sesión neste dispositivo e xa non poderás recibir mensaxes nel.';

  @override
  String get banUserDescription =>
      'Vaise vetar a usuaria na conversa e non poderá entrar outra vez ata que se retire o veto.';

  @override
  String get unbanUserDescription =>
      'A usuaria vai poder entrar outra vez na conversa se quere.';

  @override
  String get kickUserDescription =>
      'A usuaria foi expulsada pero non vetada. En conversas públicas a usuaria pode volver cando queira.';

  @override
  String get makeAdminDescription =>
      'Cando convirtas a esta usuaria en admin non poderás desfacer a acción xa que terá os mesmos permisos ca ti.';

  @override
  String get pushNotificationsNotAvailable =>
      'Non están dispoñibles as notificacións push';

  @override
  String get learnMore => 'Saber máis';

  @override
  String get yourGlobalUserIdIs => 'O teu ID-usuaria global é: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Lamentamos non atopar ningunha usuaria con \"$query\". Comproba se está ben escrito.';
  }

  @override
  String get knocking => 'A solicitar';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'A charla pode ser atopada ao buscar en $server';
  }

  @override
  String get searchChatsRooms => 'Buscar #conversas, @usuarias...';

  @override
  String get nothingFound => 'Non atopamos nada...';

  @override
  String get groupName => 'Nome do grupo';

  @override
  String get createGroupAndInviteUsers => 'Crear un grupo e convidar usuarias';

  @override
  String get groupCanBeFoundViaSearch => 'O grupo pódese atopar ao buscar';

  @override
  String get wrongRecoveryKey =>
      'Desculpa... non semella ser o xeito correcto de recuperar a chave.';

  @override
  String get startConversation => 'Iniciar conversa';

  @override
  String get commandHint_sendraw => 'Enviar json sen editar';

  @override
  String get databaseMigrationTitle => 'Base de datos optimizada';

  @override
  String get databaseMigrationBody => 'Agarda, podería levarnos un pouco.';

  @override
  String get leaveEmptyToClearStatus =>
      'Deixa baleiro para limpar o teu estado.';

  @override
  String get select => 'Escolle';

  @override
  String get searchForUsers => 'Buscar @persoas...';

  @override
  String get pleaseEnterYourCurrentPassword => 'Escribe o contrasinal actual';

  @override
  String get newPassword => 'Novo contrasinal';

  @override
  String get pleaseChooseAStrongPassword => 'Elixe un contrasinal forte';

  @override
  String get passwordsDoNotMatch => 'Os contrasinais non concordan';

  @override
  String get passwordIsWrong => 'O contrasinal escrito non é correcto';

  @override
  String get publicLink => 'Ligazón pública';

  @override
  String get publicChatAddresses => 'Enderezos públicos da charla';

  @override
  String get createNewAddress => 'Crear novos enderezos';

  @override
  String get joinSpace => 'Únete ao espazo';

  @override
  String get publicSpaces => 'Espazos públicos';

  @override
  String get addChatOrSubSpace => 'Engadir charla ou sub espazo';

  @override
  String get subspace => 'Subespazo';

  @override
  String get decline => 'Desbotar';

  @override
  String get thisDevice => 'Este dispositivo:';

  @override
  String get initAppError => 'Houbo un fallo ao iniciar a app';

  @override
  String get userRole => 'Rol da usuaria';

  @override
  String minimumPowerLevel(String level) {
    return '$level é o nivel mínimo de responsabilidade.';
  }

  @override
  String searchIn(String chat) {
    return 'Buscar na conversa \"$chat\"...';
  }

  @override
  String get searchMore => 'Buscar máis...';

  @override
  String get gallery => 'Galería';

  @override
  String get files => 'Ficheiros';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return 'Non se puido crear a base de datos SQlite. A app intentará usar a base de datos clásica. Por favor informa deste fallo ás desenvolvedoras en $url. A mensaxe do erro é: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'Estragouse a túa sesión. Por favor informa deste fallo ás desenvolvedoras en $url. A mensaxe do erro é: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'A app vai intentar restablecer a sesión desde a copia de apoio. Por favor informa deste erro ás desenvolvedoras en $url. A mensaxe do erro é: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'Reenviar a mensaxe a $roomName?';
  }

  @override
  String get sendReadReceipts => 'Enviar confirmación de lectura';

  @override
  String get sendTypingNotificationsDescription =>
      'As outras participantes da conversa poden ver cando estás a escribir unha mensaxe.';

  @override
  String get sendReadReceiptsDescription =>
      'Outras participantes na conversa poden ver cando liches unha mensaxe.';

  @override
  String get formattedMessages => 'Mensaxes con formato';

  @override
  String get formattedMessagesDescription =>
      'Mostrar texto enriquecido nas mensaxes como letra grosa usando markdown.';

  @override
  String get verifyOtherUser => '🔐 Verificar outra usuaria';

  @override
  String get verifyOtherUserDescription =>
      'Se verificas a outra usuaria, podes ter a certeza de que sabes con quen estás a conversar. 💪\n\nAo iniciar a verificación, ti mais a outra usuaria veredes unha xanela emerxente na app onde aparecerán varios emojis ou números que teredes que comparar entre vós.\n\nO mellor xeito de facelo é en persoa o cunha chamada de vídeo. 👭';

  @override
  String get verifyOtherDevice => '🔐 Verificar outro dispositivo';

  @override
  String get verifyOtherDeviceDescription =>
      'Ao verificar outro dispositivo estás compartindo as chaves, aumentando a túa seguridade 💪. Ao iniciar a verificación aparecerá unha xanela emerxente nos dous dispositivos. Nesa xanela verás varios emojis ou números que tes que comparar entre eles. O mellor xeito de facelo é ter os dous dispositivos contigo cando inicias o proceso de verificación. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender aceptou a verificación da chave';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender desbotou a verificación da chave';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender completou a verificación da chave';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender xa pode verificar a chave';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender solicitou verificar a chave';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender comezou coa verificación da chave';
  }

  @override
  String get transparent => 'Transparente';

  @override
  String get incomingMessages => 'Mensaxes recibidas';

  @override
  String get stickers => 'Adhesivos';

  @override
  String get discover => 'Descubrir';

  @override
  String get commandHint_ignore => 'Ignorar o ID REChain indicado';

  @override
  String get commandHint_unignore => 'Non ignorar o ID REChain indicado';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread charlas sen ler';
  }

  @override
  String get noDatabaseEncryption =>
      'Nesta plataforma non temos soporte para cifrar a base de datos';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Agora mesmo hai $count usuarias bloqueadas.';
  }

  @override
  String get restricted => 'Non accesible';

  @override
  String get knockRestricted => 'Peta á porta';

  @override
  String goToSpace(Object space) {
    return 'Ir ao espazo: $space';
  }

  @override
  String get markAsUnread => 'Marcar como non lido';

  @override
  String userLevel(int level) {
    return '$level - Usuaria';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Moderadora';
  }

  @override
  String adminLevel(int level) {
    return '$level - Administradora';
  }

  @override
  String get changeGeneralChatSettings => 'Cambiar os axustes xerais da charla';

  @override
  String get inviteOtherUsers => 'Convidar a outras usuarias a esta charla';

  @override
  String get changeTheChatPermissions => 'Cambiar os permisos na charla';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Cambiar a visibilidade do historial da charla';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Cambiar o enderezo público principal da charla';

  @override
  String get sendRoomNotifications => 'Enviar notificacións a @room';

  @override
  String get changeTheDescriptionOfTheGroup => 'Cambiar a descrición da charla';

  @override
  String get chatPermissionsDescription =>
      'Define que nivel de permisos son necesarios para realizar certas accións nesta charla. Os niveis de permiso 0, 50 e 100 normalmente representan, usuarias, moderadoras e administradoras, pero son posibles outras escalas.';

  @override
  String updateInstalled(String version) {
    return '🎉 Instalouse a actualización a $version!';
  }

  @override
  String get changelog => 'Novidades na versión';

  @override
  String get sendCanceled => 'Cancelouse o envío';

  @override
  String get loginWithREChainId => 'Acceder co ID REChain';

  @override
  String get discoverHomeservers => 'Atopar servidores';

  @override
  String get whatIsAHomeserver => 'Que é un servidor de inicio?';

  @override
  String get homeserverDescription =>
      'Todos os teus datos quedan gardados no servidor de inicio, igual que co teu provedor de correo electrónico. Podes elexir o servidor que queres usar e poderás comunicarte con todos os demais. Aprende máis en https://online.rechain.network.';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Non semella ser un servidor de inicio compatible. É o URL correcto?';

  @override
  String get calculatingFileSize => 'Calculando o tamaño do ficheiro…';

  @override
  String get prepareSendingAttachment => 'Preparando o envío…';

  @override
  String get sendingAttachment => 'Enviando o anexo…';

  @override
  String get generatingVideoThumbnail => 'Creando miniatura do vídeo…';

  @override
  String get compressVideo => 'Comprimindo o vídeo…';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return 'Enviando o anexo $index de $length…';
  }

  @override
  String serverLimitReached(int seconds) {
    return 'Acadouse o límite do servidor! Agarda $seconds segundos…';
  }

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Un dos teus dispositivos non está verificado';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Nota: Cando conectas todos os teus dispositivos á copia de apoio da conversa quedan verificados automaticamente.';

  @override
  String get continueText => 'Continuar';

  @override
  String get welcomeText =>
      'Ola! 👋 Isto é REChain. Podes iniciar sesión en calquera servidor compatible con https://online.rechain.network. Poderás conversar con calquera. Unha enorme rede de mensaxería descentralizada!';

  @override
  String get blur => 'Néboa:';

  @override
  String get opacity => 'Opacidade:';

  @override
  String get setWallpaper => 'Establecer fondo';

  @override
  String get manageAccount => 'Xestionar conta';

  @override
  String get noContactInformationProvided =>
      'O servidor non proporciona información de contacto válida';

  @override
  String get contactServerAdmin => 'Contacto con Admin do servidor';

  @override
  String get contactServerSecurity => 'Contacto con Seguridade do servidor';

  @override
  String get supportPage => 'Páxina de axuda';

  @override
  String get serverInformation => 'Información do servidor:';

  @override
  String get name => 'Nome';

  @override
  String get version => 'Versión';

  @override
  String get website => 'Páxina web';

  @override
  String get compress => 'Comprimir';

  @override
  String get boldText => 'Resaltar texto';

  @override
  String get italicText => 'Cursiva';

  @override
  String get strikeThrough => 'Riscar';

  @override
  String get pleaseFillOut => 'Por favor completa';

  @override
  String get invalidUrl => 'URL non válido';

  @override
  String get addLink => 'Engadir ligazón';

  @override
  String get unableToJoinChat =>
      'Non se puido acceder. Pode que a outra parte xa pechase a conversa.';

  @override
  String get previous => 'Anterior';

  @override
  String get otherPartyNotLoggedIn =>
      'A outra parte non está conectada neste momento e pode que non reciba as mensaxes!';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Usar \'$server\' para acceder';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Por tanto permites que a app e o sitio web compartan información sobre ti.';

  @override
  String get open => 'Abrir';

  @override
  String get waitingForServer => 'Agardando polo servidor…';

  @override
  String get appIntroduction =>
      'REChain permíteche laretar coas túas amizades entre diferentes mensaxerías. Coñece máis en https://online.rechain.network ou toca en *Continuar*.';

  @override
  String get newChatRequest => '📩 Nova solicitude de conversa';

  @override
  String get contentNotificationSettings =>
      'Axustes de notificación de contido';

  @override
  String get generalNotificationSettings => 'Axustes xerais das notificacións';

  @override
  String get roomNotificationSettings => 'Axustes de notificacións da sala';

  @override
  String get userSpecificNotificationSettings =>
      'Axustes de notificación específicos da usuaria';

  @override
  String get otherNotificationSettings => 'Outros axustes das notificacións';

  @override
  String get notificationRuleContainsUserName => 'Contén nome de usuaria';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Informa á usuaria cando unha mensaxe contén o seu identificador.';

  @override
  String get notificationRuleMaster => 'Acalar todas as notificacións';

  @override
  String get notificationRuleMasterDescription =>
      'Sobrescribe todas as outras regras e desactiva todas as notificacións.';

  @override
  String get notificationRuleSuppressNotices =>
      'Suprimir mensaxes automatizadas';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Suprime as notificacións desde clientes automatizados como os robots.';

  @override
  String get notificationRuleInviteForMe => 'Teño un convite';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Informa á usuaria de que recibeu o convite para unha sala.';

  @override
  String get notificationRuleMemberEvent => 'Eventos dos participantes';

  @override
  String get notificationRuleMemberEventDescription =>
      'Suprime as notificacións dos eventos de participación.';

  @override
  String get notificationRuleIsUserMention => 'Mención da usuaria';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Informa cando se menciona explícitamente a usuaria nunha mensaxe.';

  @override
  String get notificationRuleContainsDisplayName => 'Contén o nome público';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Informa á usuaria cando unha mensaxe contén o seu nome público.';

  @override
  String get notificationRuleIsRoomMention => 'Mención da sala';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Informa á usuaria cando hai unha mención da sala.';

  @override
  String get notificationRuleRoomnotif => 'Notificación da sala';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Informa á usuaria cando unha mensaxe contén \'@room\'.';

  @override
  String get notificationRuleTombstone => 'Lápida';

  @override
  String get notificationRuleTombstoneDescription =>
      'Informa á usuaria sobre a desactivación de mensaxes na sala.';

  @override
  String get notificationRuleReaction => 'Reacción';

  @override
  String get notificationRuleReactionDescription =>
      'Omite as notificacións sobre reaccións.';

  @override
  String get notificationRuleRoomServerAcl => 'ACL da servidor da sala';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Omite notificacións para as listas de control de acceso (ACL) do servidor da sala.';

  @override
  String get notificationRuleSuppressEdits => 'Omite edicións';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Omite as notificacións sobre mensaxes editadas.';

  @override
  String get notificationRuleCall => 'Chamada';

  @override
  String get notificationRuleCallDescription =>
      'Informa á usuaria sobre as chamadas.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'Sala cifrada conversa persoal';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Informa á usuaria sobre mensaxes cifradas en salas de conversa persoal.';

  @override
  String get notificationRuleRoomOneToOne => 'Sala de conversa persoal';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Informa á usuaria sobre mensaxes en salas de conversa persoal.';

  @override
  String get notificationRuleMessage => 'Mensaxe';

  @override
  String get notificationRuleMessageDescription =>
      'Informa á usuaria sobre mensaxes xenéricas.';

  @override
  String get notificationRuleEncrypted => 'Salas cifradas';

  @override
  String get notificationRuleEncryptedDescription =>
      'Informa á usuaria sobre mensaxes en salas cifradas.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Informa á usuaria sobre eventos do widget Jitsi.';

  @override
  String get notificationRuleServerAcl => 'Omite eventos do sevidor ACL';

  @override
  String get notificationRuleServerAclDescription =>
      'Omite notificación sobre eventos do servidor ACL.';

  @override
  String unknownPushRule(String rule) {
    return 'Regra push descoñecida \'$rule\'';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return '🎙️ $duration - Mensaxe de voz de  $sender';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Se omites este axuste de notificacións non poderás desfacer a acción.';

  @override
  String get more => 'Máis';

  @override
  String get shareKeysWith => 'Compartir chaves con…';

  @override
  String get shareKeysWithDescription =>
      'En que dispositivos se pode confiar e poden ler as túas conversas cifradas?';

  @override
  String get allDevices => 'Todos os dispositivos';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Dispositivos verificados se está activado';

  @override
  String get crossVerifiedDevices => 'Dispositivos verificados';

  @override
  String get verifiedDevicesOnly => 'Só dispositivos verificados';

  @override
  String get takeAPhoto => 'Facer foto';

  @override
  String get recordAVideo => 'Gravar vídeo';

  @override
  String get optionalMessage => '(Optativo) mensaxe…';

  @override
  String get notSupportedOnThisDevice => 'Non compatible co dispositivo';

  @override
  String get enterNewChat => 'Entrar na nova conversa';

  @override
  String get approve => 'Aprobar';

  @override
  String get youHaveKnocked => 'Petaches á porta';

  @override
  String get pleaseWaitUntilInvited =>
      'Agora agarda a que alguén da sala te convide a entrar.';

  @override
  String get commandHint_logout => 'Fechar a sesión no dispositivo actual';

  @override
  String get commandHint_logoutall =>
      'Fechar a sesión en todos os dispositivos activos';

  @override
  String get displayNavigationRail => 'Show navigation rail on mobile';

  @override
  String get customReaction => 'Reacción personalizada';

  @override
  String get moreEvents => 'Máis eventos';

  @override
  String get declineInvitation => 'Rexeitar o convite';
}
