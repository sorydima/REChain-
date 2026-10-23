// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Galician (`gl`).
class L10nGl extends L10n {
  L10nGl([String locale = 'gl']) : super(locale);

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
  String get repeatPassword => 'Repite o contrasinal';

  @override
  String get notAnImage => 'Non é un ficheiro de imaxe.';

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
  String get accountsAndSettings => 'Accounts and settings';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username activou a cifraxe extremo-a-extremo';
  }

  @override
  String get addEmail => 'Engadir email';

  @override
  String get confirmREChainId =>
      'Please confirm your REChain ID in order to delete your account.';

  @override
  String supposedMxid(String mxid) {
    return 'Debería ser $mxid';
  }

  @override
  String get addToSpace => 'Engadir ao espazo';

  @override
  String get admin => 'Admin';

  @override
  String get alias => 'alias';

  @override
  String get all => 'Todos';

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
  String get discardEdits => 'You have unsaved changes. Discard your edits?';

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
  String badServerLoginTypesException(
    String serverVersions,
    String supportedVersions,
    Object suportedVersions,
  ) {
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
  String get noMoreChatsFound => 'Non se atopan máis charlas…';

  @override
  String get noChatsFoundHere =>
      'Aínda non hai conversas. Comeza a conversar con alguén premendo no botón de abaixo. ⤵️';

  @override
  String get unread => 'Sen ler';

  @override
  String get space => 'Espazo';

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
  String changedTheChatDescription(Object username) {
    return '$username cambiou a descrición da sala';
  }

  @override
  String changedTheChatName(Object username) {
    return '$username cambiou o nome da sala';
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
  String get chatBackup => 'Copia de apoio';

  @override
  String get chatDetails => 'Detalles da conversa';

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
      'Marcar como sala de mensaxe directa para o ID REChain x Matrix indicado';

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
  String get contactHasBeenInvitedToTheGroup =>
      'O contacto foi convidado ao grupo';

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
  String get checkList => 'Comprobar lista';

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
  String get devices => 'Dispositivos';

  @override
  String get directChats => 'Conversas Directas';

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
  String get globalChatId => 'ID Global da charla';

  @override
  String get accessAndVisibility => 'Acceso e Visibilidade';

  @override
  String get accessAndVisibilityDescription =>
      'Quen pode unirse a esta charla e de que xeito e como poden atopala.';

  @override
  String get customEmojisAndStickers => 'Emojis personais e adhesivos';

  @override
  String get customEmojisAndStickersBody =>
      'Engade ou comparte emojis personais e adhesivos que poden usarse nas charlas.';

  @override
  String get emoteShortcode => 'Atallo de Emote';

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
  String errorObtainingLocation(String error) {
    return 'Erro ao obter a localización: $error';
  }

  @override
  String get fontSize => 'Tamaño da letra';

  @override
  String get forward => 'Reenviar';

  @override
  String get fromJoining => 'Desde que se una';

  @override
  String get fromTheInvitation => 'Desde o convite';

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
  String get hideRedactedMessages => 'Agochar mensaxes editadas';

  @override
  String get hideRedactedMessagesBody =>
      'Se alguén corrixe unha mensaxe entón esta xa non será visible na charla.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Agochar formatos de mensaxe non válidos ou descoñecidos';

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
  String get inviteContact => 'Convidar contacto';

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
  String inviteText(String username, String link) {
    return '$username convidoute a REChain.\n1. Visita github.com/sorydima/REChain- e instala a app\n2. Crea unha conta ou Accede\n3. Abre a ligazón do convite: \n $link';
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
    return '$server1 non é un servidor REChain, usar $server2 no seu lugar?';
  }

  @override
  String get shareInviteLink => 'Comparte ligazón de convite';

  @override
  String get scanQrCode => 'Escanear código QR';

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
  String numUsersTyping(int count) {
    return '$count usuarias están escribindo…';
  }

  @override
  String get obtainingLocation => 'Obtendo a localización…';

  @override
  String get ok => 'Ok';

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
  String get openInMaps => 'Abrir en mapas';

  @override
  String get link => 'Ligazón';

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
  String get passwordRecoverySettings =>
      'Axustes de recuperación do contrasinal';

  @override
  String get passwordRecovery => 'Recuperación do contrasinal';

  @override
  String get pin => 'Fixar';

  @override
  String get pleaseChooseAPasscode => 'Escolle un código de acceso';

  @override
  String get pleaseClickOnLink =>
      'Preme na ligazón do email e segue as instrucións.';

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
  String get reason => 'Razón';

  @override
  String redactedBy(String username) {
    return 'Editada por $username';
  }

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
  String get reject => 'Rexeitar';

  @override
  String rejectedTheInvitation(String username) {
    return '$username rexeitou o convite';
  }

  @override
  String get removeAllOtherDevices => 'Quitar todos os outros dispositivos';

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
  String get roomHasBeenUpgraded => 'A sala foi actualizada';

  @override
  String sendingFilesDoNotExit(int count) {
    return 'Sending $count files... Please do not exit!';
  }

  @override
  String get roomVersion => 'Versión da sala';

  @override
  String get compressingVideo => 'Compressing video...';

  @override
  String get saveFile => 'Gardar ficheiro';

  @override
  String get search => 'Buscar';

  @override
  String get security => 'Seguridade';

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
  String get setAsCanonicalAlias => 'Establecer como alias principal';

  @override
  String get setChatDescription => 'Escribir descrición da conversa';

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
  String get tooManyRequestsWarning =>
      'Demasiadas solicitudes. Inténtao máis tarde!';

  @override
  String get tryToSendAgain => 'Inténtao outra vez';

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
  String userSentUnknownEvent(String username, String type) {
    return '$username enviou un evento $type';
  }

  @override
  String get unverified => 'Sen verificar';

  @override
  String get verified => 'Verificado';

  @override
  String get verifyStart => 'Comezar verificación';

  @override
  String get verifySuccess => 'Verificaches correctamente!';

  @override
  String get verifyTitle => 'Verificando a outra conta';

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
  String get yourPublicKey => 'A túa chave pública';

  @override
  String get messageInfo => 'Info da mensaxe';

  @override
  String get time => 'Hora';

  @override
  String get sender => 'Remitente';

  @override
  String get openGallery => 'Galería pública';

  @override
  String get removeFromSpace => 'Retirar do espazo';

  @override
  String get markAsRead => 'Marcar como lido';

  @override
  String get reportUser => 'Denunciar usuaria';

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
  String get unsupportedAndroidVersion => 'Version de Android non soportada';

  @override
  String get unsupportedAndroidVersionLong =>
      'Esta característica require unha vesión máis recente de Android. Mira se hai actualizacións ou soporte de Mobile Katya OS.';

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
  String youInvitedBy(String user) {
    return '📩 $user convidoute';
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
  String get knock => 'Solicitar acceso';

  @override
  String get users => 'Usuarias';

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
  String get whyIsThisMessageEncrypted => 'Por que non podo ler esta mensaxe?';

  @override
  String get noKeyForThisMessage =>
      'Pode ser que a mensaxe fose enviada antes de que ti accedeses á túa conta neste dispositivo.\n\nTamén é posible que a remitente non validase o teu dispositivo ou tamén que algo fallase na conexión a internet.\n\nPodes ler a mensaxe noutro dispositivo? Entón podes transferila desde el! Vai a Axustes > Dispositivos e comproba que tes tódolos dispositivos verificados. Entón cando abras a sala a próxima vez a sincronización realizarase e as chaves transmitiranse automáticamente.\n\nNon desexas perder as chaves cando pechas sesión ou cambias de dispositivo? Comproba nos axustes que activaches a copia de apoio das conversas.';

  @override
  String get newSpace => 'Novo espazo';

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
  String get setColorTheme => 'Cor do decorado:';

  @override
  String get invite => 'Convidar';

  @override
  String get inviteGroupChat => '📨 Convidar a conversa en grupo';

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
      'Vaise recrear a charla coa nova versión da sala. Todas as participantes recibirán unha notificación para que cambien á nova charla. Podes ler máis información acerca das versións das salas en https://github.com/sorydima/REChain-.git';

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
  String get thisDevice => 'Este dispositivo:';

  @override
  String get initAppError => 'Houbo un fallo ao iniciar a app';

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
  String sessionLostBody(String url, String error) {
    return 'Estragouse a túa sesión. Por favor informa deste fallo ás desenvolvedoras en $url. A mensaxe do erro é: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'A app vai intentar restablecer a sesión desde a copia de apoio. Por favor informa deste erro ás desenvolvedoras en $url. A mensaxe do erro é: $error';
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
  String updateAvailable(String version) {
    return 'Update $version available';
  }

  @override
  String get download => 'Download';

  @override
  String get sendCanceled => 'Cancelouse o envío';

  @override
  String get loginWithREChainId => 'Login with REChain-ID';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Non semella ser un servidor de inicio compatible. É o URL correcto?';

  @override
  String get calculatingFileSize => 'Calculando o tamaño do ficheiro…';

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Un dos teus dispositivos non está verificado';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Nota: Cando conectas todos os teus dispositivos á copia de apoio da conversa quedan verificados automaticamente.';

  @override
  String get continueText => 'Continuar';

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
    return '🎙️ $duration - Mensaxe de voz de $sender';
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
  String get displayNavigationRail =>
      'Mostrar carril de navegación nos móbiles';

  @override
  String get customReaction => 'Reacción personalizada';

  @override
  String get moreEvents => 'Máis eventos';

  @override
  String get showMore => 'Show more';

  @override
  String get showLess => 'Show less';

  @override
  String get declineInvitation => 'Rexeitar o convite';

  @override
  String get noMessagesYet => 'Aínda non hai mensaxes';

  @override
  String get longPressToRecordVoiceMessage =>
      'Pulsación longa para gravar mensaxe de voz.';

  @override
  String get pause => 'Deter';

  @override
  String get resume => 'Continuar';

  @override
  String get removeFromSpaceDescription =>
      'Vaise quitar a conversa do espazo pero seguirá aparecendo na túa lista de conversas.';

  @override
  String countChats(int chats) {
    return '$chats conversas';
  }

  @override
  String spaceMemberOf(String spaces) {
    return 'Participa no espazo $spaces';
  }

  @override
  String spaceMemberOfCanKnock(String spaces) {
    return 'Os membros de $spaces poden petar á porta';
  }

  @override
  String get startPoll => 'Publicar enquisa';

  @override
  String get endPoll => 'Finalizar enquisa';

  @override
  String get answersVisible => 'Resultados visibles';

  @override
  String get pollQuestion => 'Pregunta da enquisa';

  @override
  String get answerOption => 'Opción de resposta';

  @override
  String get addAnswerOption => 'Engadir opción';

  @override
  String get allowMultipleAnswers => 'Permitir varias respostas';

  @override
  String get pollHasBeenEnded => 'Rematou a enquisa';

  @override
  String countVotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count votos',
      one: 'Un voto',
    );
    return '$_temp0';
  }

  @override
  String get answersWillBeVisibleWhenPollHasEnded =>
      'As respostas son visibles ao finalizar a enquisa';

  @override
  String get replyInThread => 'Responder ao fío';

  @override
  String countReplies(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count respostas',
      one: 'Unha resposta',
    );
    return '$_temp0';
  }

  @override
  String get thread => 'Fío';

  @override
  String get backToMainChat => 'Volver á conversa principal';

  @override
  String get saveChanges => 'Gardar cambios';

  @override
  String get createSticker => 'Crear adhesivo ou emoji';

  @override
  String get useAsSticker => 'Usar como adhesivo';

  @override
  String get useAsEmoji => 'Usar como emoji';

  @override
  String get stickerPackNameAlreadyExists =>
      'Xa existe ese nome de paquete de adhesivos';

  @override
  String get newStickerPack => 'Novo paquete de adhesivos';

  @override
  String get stickerPackName => 'Nome do paquete de adhesivos';

  @override
  String get attribution => 'Atribución';

  @override
  String get skipChatBackup => 'Omitir copia da conversa';

  @override
  String get skipChatBackupWarning =>
      'Tes certeza? A non activar a copia de apoio da conversa poderías perder o acceso ás mensaxes se cambias de dispositivo.';

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
  String get loadingMessages => 'Cargando mensaxes';

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
      'Ten en conta que as chamadas de vídeo están en fase beta. Poderían non funcionar correctamente ou non funcionar nalgunhas plataformas.';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get incomingCall => 'Incoming call';

  @override
  String get videoCall => 'Chamada de vídeo';

  @override
  String get voiceCall => 'Chamada de voz';

  @override
  String get missedCall => 'Missed call';

  @override
  String get callBack => 'Call back';

  @override
  String get hangUp => 'Hang up';

  @override
  String get waitingForParticipant => 'Waiting for participant...';

  @override
  String get decline => 'Desbotar';

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
