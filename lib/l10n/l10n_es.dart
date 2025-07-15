// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class L10nEs extends L10n {
  L10nEs([String locale = 'es']) : super(locale);

  @override
  String get alwaysUse24HourFormat => 'falso';

  @override
  String get repeatPassword => 'Repite la contraseña';

  @override
  String get notAnImage => 'El archivo no es una imagen.';

  @override
  String get setCustomPermissionLevel =>
      'Agregar nivel personalizado de permiso';

  @override
  String get setPermissionsLevelDescription =>
      'Por favor elige un rol predeterminado o un nivel de permiso personalizado entre 0 a 100.';

  @override
  String get ignoreUser => 'Ignorar usuario';

  @override
  String get normalUser => 'Usuario normal';

  @override
  String get remove => 'Eliminar';

  @override
  String get importNow => 'Importar ahora';

  @override
  String get importEmojis => 'Importar emojis';

  @override
  String get importFromZipFile => 'Importar de un archivo .zip';

  @override
  String get exportEmotePack => 'Exportar paquete de emotes a .zip';

  @override
  String get replace => 'Reemplazar';

  @override
  String get about => 'Acerca de';

  @override
  String aboutHomeserver(String homeserver) {
    return 'Acerca de $homeserver';
  }

  @override
  String get accept => 'Aceptar';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username aceptó la invitación';
  }

  @override
  String get account => 'Cuenta';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username activó el cifrado de extremo a extremo';
  }

  @override
  String get addEmail => 'Añadir dirección de correo';

  @override
  String get confirmMatrixId =>
      'Por favor confirma tu REChain ID para borrar tu cuenta.';

  @override
  String supposedMxid(String mxid) {
    return 'Esto debería ser $mxid';
  }

  @override
  String get addChatDescription => 'Añadir una descripción del chat...';

  @override
  String get addToSpace => 'Agregar al espacio';

  @override
  String get admin => 'Administrador';

  @override
  String get alias => 'alias';

  @override
  String get all => 'Todo';

  @override
  String get allChats => 'Todos los chats';

  @override
  String get commandHint_roomupgrade =>
      'Actualizar este chat a la versión de chat dada';

  @override
  String get commandHint_googly => 'Enviar unos ojos saltones';

  @override
  String get commandHint_cuddle => 'Enviar un abrazo';

  @override
  String get commandHint_hug => 'Mandar un abrazo';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName te manda ojos saltones';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName se acurruca contigo';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName te abraza';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName respondió a la llamada';
  }

  @override
  String get anyoneCanJoin => 'Cualquiera puede unirse';

  @override
  String get appLock => 'Bloqueo de aplicación';

  @override
  String get appLockDescription =>
      'Bloquear la aplicación cuando no se use con código pin';

  @override
  String get archive => 'Archivo';

  @override
  String get areGuestsAllowedToJoin => '¿Pueden unirse usuarios de visita?';

  @override
  String get areYouSure => '¿Estás seguro?';

  @override
  String get areYouSureYouWantToLogout => '¿Confirma que quiere cerrar sesión?';

  @override
  String get askSSSSSign =>
      'Para poder confirmar a la otra persona, ingrese su contraseña de almacenamiento segura o la clave de recuperación.';

  @override
  String askVerificationRequest(String username) {
    return '¿Aceptar esta solicitud de verificación de $username?';
  }

  @override
  String get autoplayImages =>
      'Reproducir emoticonos y stickers animados automáticamente';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'El servidor soporta los siguientes mecanismos para autenticación:\n$serverVersions\npero esta aplicación sólo soporta:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications =>
      'Enviar notificaciones \"está escribiendo\"';

  @override
  String get swipeRightToLeftToReply => 'Desliza a la izquierda para responder';

  @override
  String get sendOnEnter => 'Enviar con enter';

  @override
  String badServerVersionsException(
      String serverVersions,
      String supportedVersions,
      Object serverVerions,
      Object supoortedVersions,
      Object suportedVersions) {
    return 'El servidor soporta las siguientes versiones de la especificación:\n$serverVersions\npero esta aplicación sólo soporta las versiones $supportedVersions';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats chats y $participants participantes';
  }

  @override
  String get noMoreChatsFound => 'No se encontraron más chats...';

  @override
  String get noChatsFoundHere =>
      'No se han encontrado chats. Inicia un nuevo chat usando el botón de abajo. ⤵️';

  @override
  String get joinedChats => 'Chats Unidos';

  @override
  String get unread => 'No leídos';

  @override
  String get space => 'Espacio';

  @override
  String get spaces => 'Espacios';

  @override
  String get banFromChat => 'Vetar del chat';

  @override
  String get banned => 'Vetado';

  @override
  String bannedUser(String username, String targetName) {
    return '$username vetó a $targetName';
  }

  @override
  String get blockDevice => 'Bloquear dispositivo';

  @override
  String get blocked => 'Bloqueado';

  @override
  String get botMessages => 'Mensajes de bot';

  @override
  String get cancel => 'Cancelar';

  @override
  String cantOpenUri(String uri) {
    return 'No puedo abrir el URI $uri';
  }

  @override
  String get changeDeviceName => 'Cambiar el nombre del dispositivo';

  @override
  String changedTheChatAvatar(String username) {
    return '$username cambió el icono del chat';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username cambió la descripción del chat a: \'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username cambió el nombre del chat a: \'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username cambió los permisos del chat';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username cambió su nombre visible a: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username cambió las reglas de acceso de visitantes';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username cambió las reglas de acceso de visitantes a: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username cambió la visibilidad del historial';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username cambió la visibilidad del historial a: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username cambió las reglas de ingreso';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username cambió las reglas de ingreso a $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username cambió su imagen de perfil';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username cambió el alias de la sala';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username cambió el enlace de invitación';
  }

  @override
  String get changePassword => 'Cambiar la contraseña';

  @override
  String get changeTheHomeserver => 'Cambiar el servidor';

  @override
  String get changeTheme => 'Cambia tu estilo';

  @override
  String get changeTheNameOfTheGroup => 'Cambiar el nombre del grupo';

  @override
  String get changeYourAvatar => 'Cambiar tu avatar';

  @override
  String get channelCorruptedDecryptError => 'El cifrado se ha corrompido';

  @override
  String get chat => 'Chat';

  @override
  String get yourChatBackupHasBeenSetUp =>
      'Se ha configurado la copia de respaldo del chat.';

  @override
  String get chatBackup => 'Copia de respaldo del chat';

  @override
  String get chatBackupDescription =>
      'La copia de respaldo del chat está protegida por una llave de seguridad. Procure no perderla.';

  @override
  String get chatDetails => 'Detalles del chat';

  @override
  String get chatHasBeenAddedToThisSpace =>
      'El chat se ha agregado a este espacio';

  @override
  String get chats => 'Conversaciones';

  @override
  String get chooseAStrongPassword => 'Elija una contraseña segura';

  @override
  String get clearArchive => 'Borrar archivo';

  @override
  String get close => 'Cerrar';

  @override
  String get commandHint_markasdm =>
      'Marcar como sala de mensajes directos para el ID de REChain';

  @override
  String get commandHint_markasgroup => 'Marcar como grupo';

  @override
  String get commandHint_ban => 'Prohibir al usuario dado en esta sala';

  @override
  String get commandHint_clearcache => 'Limpiar cache';

  @override
  String get commandHint_create =>
      'Crear un chat grupal vacío\nUse --no-encryption para deshabilitar el cifrado';

  @override
  String get commandHint_discardsession => 'Descartar sesión';

  @override
  String get commandHint_dm =>
      'Iniciar un chat directo\nUse --no-encryption para deshabilitar el cifrado';

  @override
  String get commandHint_html => 'Enviar texto con formato HTML';

  @override
  String get commandHint_invite => 'Invitar al usuario indicado a esta sala';

  @override
  String get commandHint_join => 'Únete a la sala indicada';

  @override
  String get commandHint_kick => 'Eliminar el usuario indicado de esta sala';

  @override
  String get commandHint_leave => 'Deja esta sala';

  @override
  String get commandHint_me => 'Descríbete';

  @override
  String get commandHint_myroomavatar =>
      'Selecciona tu foto para esta sala (by mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Establece tu nombre para mostrar para esta sala';

  @override
  String get commandHint_op =>
      'Establece el nivel de potencia del usuario dado (default: 50)';

  @override
  String get commandHint_plain => 'Enviar texto sin formato';

  @override
  String get commandHint_react => 'Enviar respuesta como reacción';

  @override
  String get commandHint_send => 'Enviar texto';

  @override
  String get commandHint_unban => 'Des banear al usuario dado en esta sala';

  @override
  String get commandInvalid => 'Comando inválido';

  @override
  String commandMissing(String command) {
    return '$command no es un comando.';
  }

  @override
  String get compareEmojiMatch => 'Por favor compare los emojis';

  @override
  String get compareNumbersMatch => 'Por favor compare los números';

  @override
  String get configureChat => 'Configurar chat';

  @override
  String get confirm => 'Confirmar';

  @override
  String get connect => 'Conectar';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'El contacto ha sido invitado al grupo';

  @override
  String get containsDisplayName => 'Contiene nombre para mostrar';

  @override
  String get containsUserName => 'Contiene nombre de usuario';

  @override
  String get contentHasBeenReported =>
      'El contenido ha sido reportado a los administradores del servidor';

  @override
  String get copiedToClipboard => 'Copiado al portapapeles';

  @override
  String get copy => 'Copiar';

  @override
  String get copyToClipboard => 'Copiar al portapapeles';

  @override
  String couldNotDecryptMessage(String error) {
    return 'No se pudo descifrar el mensaje: $error';
  }

  @override
  String get checkList => 'Lista de tareas';

  @override
  String countParticipants(int count) {
    return '$count participantes';
  }

  @override
  String countInvited(int count) {
    return '$count invitado';
  }

  @override
  String get create => 'Crear';

  @override
  String createdTheChat(String username) {
    return '💬$username creó el chat';
  }

  @override
  String get createGroup => 'Crear grupo';

  @override
  String get createNewSpace => 'Nuevo espacio';

  @override
  String get currentlyActive => 'Actualmente activo';

  @override
  String get darkTheme => 'Oscuro';

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
      'Se desactivará su cuenta de usuario. ¡La operación no se puede cancelar! ¿Está seguro?';

  @override
  String get defaultPermissionLevel =>
      'Nivel de permiso predeterminado para nuevo usuarios';

  @override
  String get delete => 'Eliminar';

  @override
  String get deleteAccount => 'Cancelar cuenta';

  @override
  String get deleteMessage => 'Eliminar mensaje';

  @override
  String get device => 'Dispositivo';

  @override
  String get deviceId => 'ID del dispositivo';

  @override
  String get devices => 'Dispositivos';

  @override
  String get directChats => 'Chat directo';

  @override
  String get allRooms => 'Todos los chats grupales';

  @override
  String get displaynameHasBeenChanged => 'El nombre visible ha cambiado';

  @override
  String get downloadFile => 'Descargar archivo';

  @override
  String get edit => 'Editar';

  @override
  String get editBlockedServers => 'Editar servidores bloqueado';

  @override
  String get chatPermissions => 'Permisos del chat';

  @override
  String get editDisplayname => 'Editar nombre visible';

  @override
  String get editRoomAliases => 'Editar alias de la sala';

  @override
  String get editRoomAvatar => 'Editar avatar de sala';

  @override
  String get emoteExists => '¡El emote ya existe!';

  @override
  String get emoteInvalid => '¡El atajo del emote es inválido!';

  @override
  String get emoteKeyboardNoRecents =>
      'Los emotes usados recientemente aparecerán aquí...';

  @override
  String get emotePacks => 'Paquetes de emoticonos para la habitación';

  @override
  String get emoteSettings => 'Configuración de emotes';

  @override
  String get globalChatId => 'ID de chat Global';

  @override
  String get accessAndVisibility => 'Acceso y visibilidad';

  @override
  String get accessAndVisibilityDescription =>
      'A quién se le permite unirse a este chat y cómo se puede descubrir el chat.';

  @override
  String get calls => 'Llamadas';

  @override
  String get customEmojisAndStickers => 'Emojis y stickers personalizados';

  @override
  String get customEmojisAndStickersBody =>
      'Agrega o comparte emojis y stickers personalizados que se pueden utilizar en cualquier chat.';

  @override
  String get emoteShortcode => 'Atajo de emote';

  @override
  String get emoteWarnNeedToPick =>
      '¡Debes elegir un atajo de emote y una imagen!';

  @override
  String get emptyChat => 'Chat vacío';

  @override
  String get enableEmotesGlobally =>
      'Habilitar paquete de emoticonos a nivel general';

  @override
  String get enableEncryption => 'Habilitar la encriptación';

  @override
  String get enableEncryptionWarning =>
      'Ya no podrá deshabilitar el cifrado. ¿Estás seguro?';

  @override
  String get encrypted => 'Encriptado';

  @override
  String get encryption => 'Cifrado';

  @override
  String get encryptionNotEnabled => 'El cifrado no está habilitado';

  @override
  String endedTheCall(String senderName) {
    return '$senderName terminó la llamada';
  }

  @override
  String get enterAnEmailAddress =>
      'Introducir una dirección de correo electrónico';

  @override
  String get homeserver => 'Servidor inicial';

  @override
  String get enterYourHomeserver => 'Ingrese su servidor';

  @override
  String errorObtainingLocation(String error) {
    return 'Error al obtener la ubicación: $error';
  }

  @override
  String get everythingReady => '¡Todo listo!';

  @override
  String get extremeOffensive => 'Extremadamente ofensivo';

  @override
  String get fileName => 'Nombre del archivo';

  @override
  String get rechainonline => 'rechainonline';

  @override
  String get fontSize => 'Tamaño de fuente';

  @override
  String get forward => 'Reenviar';

  @override
  String get fromJoining => 'Desde que se unió';

  @override
  String get fromTheInvitation => 'Desde la invitación';

  @override
  String get goToTheNewRoom => 'Ir a la nueva sala';

  @override
  String get group => 'Grupo';

  @override
  String get chatDescription => 'Descripción del chat';

  @override
  String get chatDescriptionHasBeenChanged =>
      'Se ha cambiado la descripción del chat';

  @override
  String get groupIsPublic => 'El grupo es público';

  @override
  String get groups => 'Grupos';

  @override
  String groupWith(String displayname) {
    return 'Grupo con $displayname';
  }

  @override
  String get guestsAreForbidden => 'Los visitantes están prohibidos';

  @override
  String get guestsCanJoin => 'Los visitantes pueden unirse';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username ha retirado la invitación para $targetName';
  }

  @override
  String get help => 'Ayuda';

  @override
  String get hideRedactedEvents => 'Ocultar sucesos censurados';

  @override
  String get hideRedactedMessages => 'Esconde mensajes eliminados';

  @override
  String get hideRedactedMessagesBody =>
      'Si alguien elimina un mensaje, este mensaje ya no será visible en el chat.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Esconde formatos de mensajes inválidos o desconocidos';

  @override
  String get howOffensiveIsThisContent => '¿Cuán ofensivo es este contenido?';

  @override
  String get id => 'Identificación';

  @override
  String get identity => 'Identidad';

  @override
  String get block => 'Bloquear';

  @override
  String get blockedUsers => 'Usuarios bloqueados';

  @override
  String get blockListDescription =>
      'Puedes bloquear usuarios que te estén molestando. No podrás recibir mensajes ni invitaciones de chat de los usuarios de tu lista de bloqueo.';

  @override
  String get blockUsername => 'Ignorar nombre de usuario';

  @override
  String get iHaveClickedOnLink => 'He hecho clic en el enlace';

  @override
  String get incorrectPassphraseOrKey =>
      'Frase de contraseña o clave de recuperación incorrecta';

  @override
  String get inoffensive => 'Inofensivo';

  @override
  String get inviteContact => 'Invitar contacto';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return '¿Quieres invitar a $contact al chat $groupName?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Invitar contacto a $groupName';
  }

  @override
  String get noChatDescriptionYet =>
      'No se ha creado una descripción del chat aún.';

  @override
  String get tryAgain => 'Inténtelo de nuevo';

  @override
  String get invalidServerName => 'Nombre del servidor no válido';

  @override
  String get invited => 'Invitado';

  @override
  String get redactMessageDescription =>
      'El mensaje será censurado para todas las personas participantes en la conversación. Esto no se puede deshacer.';

  @override
  String get optionalRedactReason =>
      '(Opcional) Motivo para censurar este mensaje...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩$username invitó a $targetName';
  }

  @override
  String get invitedUsersOnly => 'Sólo usuarios invitados';

  @override
  String get inviteForMe => 'Invitar por mí';

  @override
  String inviteText(String username, String link) {
    return '$username te invitó a REChain.\n1.Visita online.rechain.network e instala la app\n2. Regístrate o inicia sesión\n3. Abre el enlace de invitación:\n$link';
  }

  @override
  String get isTyping => 'está escribiendo…';

  @override
  String joinedTheChat(String username) {
    return '👋$username se unió al chat';
  }

  @override
  String get joinRoom => 'Unirse a la sala';

  @override
  String kicked(String username, String targetName) {
    return '👞$username echó a $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅$username echó y vetó a $targetName';
  }

  @override
  String get kickFromChat => 'Echar del chat';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Última vez activo: $localizedTimeShort';
  }

  @override
  String get leave => 'Abandonar';

  @override
  String get leftTheChat => 'Abandonó el chat';

  @override
  String get license => 'Licencia';

  @override
  String get lightTheme => 'Claro';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Mostrar $count participantes más';
  }

  @override
  String get dehydrate => 'Exportar sesión y limpiar dispositivo';

  @override
  String get dehydrateWarning =>
      'Esta acción no se puede deshacer. Asegúrese de que ha almacenado de forma segura el fichero de copia de seguridad.';

  @override
  String get dehydrateTor => 'TOR: Exportar sesión';

  @override
  String get dehydrateTorLong =>
      'Si está usando TOR, es recomendable exportar la sesión antes de cerrar la ventana.';

  @override
  String get hydrateTor => 'TOR: Importar sesión exportada';

  @override
  String get hydrateTorLong =>
      '¿Exportó su sesión la última vez que estuvo en TOR? Impórtela rápidamente y continúe chateando.';

  @override
  String get hydrate => 'Restaurar desde fichero de copia de seguridad';

  @override
  String get loadingPleaseWait => 'Cargando… Por favor espere.';

  @override
  String get loadMore => 'Mostrar más…';

  @override
  String get locationDisabledNotice =>
      'Los servicios de ubicación están deshabilitado. Habilite para poder compartir su ubicación.';

  @override
  String get locationPermissionDeniedNotice =>
      'Permiso de ubicación denegado. Concédeles que puedan compartir tu ubicación.';

  @override
  String get login => 'Acceso';

  @override
  String logInTo(String homeserver) {
    return 'Iniciar sesión en $homeserver';
  }

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get memberChanges => 'Cambios de miembros';

  @override
  String get mention => 'Mencionar';

  @override
  String get messages => 'Mensajes';

  @override
  String get messagesStyle => 'Mensajes:';

  @override
  String get moderator => 'Moderador';

  @override
  String get muteChat => 'Silenciar chat';

  @override
  String get needPantalaimonWarning =>
      'Tenga en cuenta que necesita Pantalaimon para utilizar el cifrado de extremo a extremo por ahora.';

  @override
  String get newChat => 'Nuevo chat';

  @override
  String get newMessageInrechainonline => 'Nuevo mensaje en rechainonline';

  @override
  String get newVerificationRequest => '¡Nueva solicitud de verificación!';

  @override
  String get next => 'Siguiente';

  @override
  String get no => 'No';

  @override
  String get noConnectionToTheServer => 'Sin conexión al servidor';

  @override
  String get noEmotesFound => 'Ningún emote encontrado. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Sólo se puede activar el cifrado en cuanto la sala deja de ser de acceso público.';

  @override
  String get noGoogleServicesWarning =>
      'Parece que no tienes servicios de Firebase Cloud Messaging en tu dispositivo. Para recibir de todas formas notificaciones, recomendamos instalar ntfy. Con ntfy o cualquier proveedor Unified Push, puedes recibir notificaciones manteniendo seguridad de datos. Puedes descargar ntfy de la PlayStore o de F-Droid.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 no es un servidor REChain, usar $server2 en su lugar?';
  }

  @override
  String get shareInviteLink => 'Compartir enlace de invitación';

  @override
  String get scanQrCode => 'Escanear código QR';

  @override
  String get none => 'Ninguno';

  @override
  String get noPasswordRecoveryDescription =>
      'Aún no ha agregado una forma de recuperar su contraseña.';

  @override
  String get noPermission => 'Sin autorización';

  @override
  String get noRoomsFound => 'Ninguna sala encontrada…';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get notificationsEnabledForThisAccount =>
      'Notificaciones habilitadas para esta cuenta';

  @override
  String numUsersTyping(int count) {
    return '$count usuarios están escribiendo…';
  }

  @override
  String get obtainingLocation => 'Obteniendo ubicación…';

  @override
  String get offensive => 'Ofensiva';

  @override
  String get offline => 'Desconectado';

  @override
  String get ok => 'Ok';

  @override
  String get online => 'Conectado';

  @override
  String get onlineKeyBackupEnabled =>
      'La copia de seguridad de la clave en línea está habilitada';

  @override
  String get oopsPushError =>
      '¡UPS¡ Desafortunadamente, se produjo un error al configurar las notificaciones push.';

  @override
  String get oopsSomethingWentWrong => 'Ups, algo salió mal…';

  @override
  String get openAppToReadMessages =>
      'Abrir la aplicación para leer los mensajes';

  @override
  String get openCamera => 'Abrir cámara';

  @override
  String get openVideoCamera => 'Abrir la cámara para un video';

  @override
  String get oneClientLoggedOut =>
      'Se ha cerrado en la sesión de uno de sus clientes';

  @override
  String get addAccount => 'Añadir cuenta';

  @override
  String get editBundlesForAccount => 'Editar paquetes para esta cuenta';

  @override
  String get addToBundle => 'Agregar al paquete';

  @override
  String get removeFromBundle => 'Quitar de este paquete';

  @override
  String get bundleName => 'Nombre del paquete';

  @override
  String get enableMultiAccounts =>
      '(BETA) habilite varias cuenta en este dispositivo';

  @override
  String get openInMaps => 'Abrir en maps';

  @override
  String get link => 'Link';

  @override
  String get serverRequiresEmail =>
      'Este servidor necesita validar su dirección de correo electrónico para registrarse.';

  @override
  String get or => 'O';

  @override
  String get participant => 'Participante';

  @override
  String get passphraseOrKey => 'contraseña o clave de recuperación';

  @override
  String get password => 'Contraseña';

  @override
  String get passwordForgotten => 'Contraseña olvidada';

  @override
  String get passwordHasBeenChanged => 'La contraseña ha sido cambiada';

  @override
  String get hideMemberChangesInPublicChats =>
      'Ocultar cambios de miembros en salas públicas';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      'No mostrar en el chat que alguien entra o sale de una sala pública para mejorar la inteligibilidad.';

  @override
  String get overview => 'Vista general';

  @override
  String get notifyMeFor => 'Notificarme';

  @override
  String get passwordRecoverySettings => 'Ajustes de recuperación de clave';

  @override
  String get passwordRecovery => 'Recuperación de contraseña';

  @override
  String get people => 'Personas';

  @override
  String get pickImage => 'Elegir imagen';

  @override
  String get pin => 'Pin';

  @override
  String play(String fileName) {
    return 'Reproducir $fileName';
  }

  @override
  String get pleaseChoose => 'Por favor elija';

  @override
  String get pleaseChooseAPasscode => 'Elija un código de acceso';

  @override
  String get pleaseClickOnLink =>
      'Haga clic en el enlace del correo electrónico y luego continúe.';

  @override
  String get pleaseEnter4Digits =>
      'Ingrese 4 dígitos o déjelo en blanco para deshabilitar el bloqueo de la aplicación.';

  @override
  String get pleaseEnterRecoveryKey =>
      'Por favor, introduzca su clave de recuperación:';

  @override
  String get pleaseEnterYourPassword => 'Por favor ingrese su contraseña';

  @override
  String get pleaseEnterYourPin => 'Por favor ingrese su PIN';

  @override
  String get pleaseEnterYourUsername =>
      'Por favor ingrese su nombre de usuario';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Por favor, siga las instrucciones del sitio web y presione \"siguiente\".';

  @override
  String get privacy => 'Privacidad';

  @override
  String get publicRooms => 'Salas públicas';

  @override
  String get pushRules => 'Regla de Push';

  @override
  String get reason => 'Razón';

  @override
  String get recording => 'Grabando';

  @override
  String redactedBy(String username) {
    return 'Censurado por $username';
  }

  @override
  String get directChat => 'Chat directo';

  @override
  String redactedByBecause(String username, String reason) {
    return 'Censurado por $username porque: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username censuró un suceso';
  }

  @override
  String get redactMessage => 'Censurar mensaje';

  @override
  String get register => 'Registrarse';

  @override
  String get reject => 'Rechazar';

  @override
  String rejectedTheInvitation(String username) {
    return '$username rechazó la invitación';
  }

  @override
  String get rejoin => 'Volver a unirse';

  @override
  String get removeAllOtherDevices => 'Eliminar todos los otros dispositivos';

  @override
  String removedBy(String username) {
    return 'Eliminado por $username';
  }

  @override
  String get removeDevice => 'Eliminar dispositivo';

  @override
  String get unbanFromChat => 'Eliminar la expulsión';

  @override
  String get removeYourAvatar => 'Quitar tu avatar';

  @override
  String get replaceRoomWithNewerVersion =>
      'Reemplazar habitación con una versión más nueva';

  @override
  String get reply => 'Responder';

  @override
  String get reportMessage => 'Mensaje de informe';

  @override
  String get requestPermission => 'Solicitar permiso';

  @override
  String get roomHasBeenUpgraded => 'La sala ha subido de categoría';

  @override
  String get roomVersion => 'Versión de sala';

  @override
  String get saveFile => 'Guardar el archivo';

  @override
  String get search => 'Buscar';

  @override
  String get security => 'Seguridad';

  @override
  String get recoveryKey => 'Clave de recuperación';

  @override
  String get recoveryKeyLost => '¿Perdió su clave de recuperación?';

  @override
  String seenByUser(String username) {
    return 'Visto por $username';
  }

  @override
  String get send => 'Enviar';

  @override
  String get sendAMessage => 'Enviar un mensaje';

  @override
  String get sendAsText => 'Enviar como texto';

  @override
  String get sendAudio => 'Enviar audio';

  @override
  String get sendFile => 'Enviar un archivo';

  @override
  String get sendImage => 'Enviar una imagen';

  @override
  String sendImages(int count) {
    return 'Envío de la imagen $count';
  }

  @override
  String get sendMessages => 'Enviar mensajes';

  @override
  String get sendOriginal => 'Enviar el original';

  @override
  String get sendSticker => 'Enviar stickers';

  @override
  String get sendVideo => 'Enviar video';

  @override
  String sentAFile(String username) {
    return '$username envió un archivo';
  }

  @override
  String sentAnAudio(String username) {
    return '$username envió un audio';
  }

  @override
  String sentAPicture(String username) {
    return '$username envió una imagen';
  }

  @override
  String sentASticker(String username) {
    return '$username envió un sticker';
  }

  @override
  String sentAVideo(String username) {
    return '$username envió un video';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName envió información de la llamada';
  }

  @override
  String get separateChatTypes => 'Separar chats directos de grupos';

  @override
  String get setAsCanonicalAlias => 'Fijar alias principal';

  @override
  String get setCustomEmotes => 'Establecer emoticonos personalizados';

  @override
  String get setChatDescription => 'Establecer descripción del chat';

  @override
  String get setInvitationLink => 'Establecer enlace de invitación';

  @override
  String get setPermissionsLevel => 'Establecer nivel de permisos';

  @override
  String get setStatus => 'Establecer estado';

  @override
  String get settings => 'Ajustes';

  @override
  String get share => 'Compartir';

  @override
  String sharedTheLocation(String username) {
    return '$username compartió la ubicación';
  }

  @override
  String get shareLocation => 'Compartir ubicación';

  @override
  String get showPassword => 'Mostrar contraseña';

  @override
  String get presenceStyle => 'Presencia:';

  @override
  String get presencesToggle => 'Mostrar mensajes de estado de otros usuarios';

  @override
  String get singlesignon => 'Inicio de sesión único';

  @override
  String get skip => 'Omitir';

  @override
  String get sourceCode => 'Código fuente';

  @override
  String get spaceIsPublic => 'El espacio es público';

  @override
  String get spaceName => 'Nombre del espacio';

  @override
  String startedACall(String senderName) {
    return '$senderName comenzó una llamada';
  }

  @override
  String get startFirstChat => 'Comience su primer chat';

  @override
  String get status => 'Estado';

  @override
  String get statusExampleMessage => '¿Cómo estás hoy?';

  @override
  String get submit => 'Enviar';

  @override
  String get synchronizingPleaseWait => 'Sincronizando... por favor espere.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Sincronizando… ($percentage%)';
  }

  @override
  String get systemTheme => 'Sistema';

  @override
  String get theyDontMatch => 'No coinciden';

  @override
  String get theyMatch => 'Coinciden';

  @override
  String get title => 'rechainonline';

  @override
  String get toggleFavorite => 'Alternar favorito';

  @override
  String get toggleMuted => 'Alternar silenciado';

  @override
  String get toggleUnread => 'Marcar como: leído / no leído';

  @override
  String get tooManyRequestsWarning =>
      'Demasiadas solicitudes. ¡Por favor inténtelo más tarde!';

  @override
  String get transferFromAnotherDevice => 'Transferir desde otro dispositivo';

  @override
  String get tryToSendAgain => 'Intentar enviar nuevamente';

  @override
  String get unavailable => 'Indisponible';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username admitió a $targetName nuevamente';
  }

  @override
  String get unblockDevice => 'Desbloquear dispositivo';

  @override
  String get unknownDevice => 'Dispositivo desconocido';

  @override
  String get unknownEncryptionAlgorithm => 'Algoritmo de cifrado desconocido';

  @override
  String unknownEvent(String type) {
    return 'Evento desconocido \'$type\'';
  }

  @override
  String get unmuteChat => 'Dejar de silenciar el chat';

  @override
  String get unpin => 'Despinchar';

  @override
  String unreadChats(int unreadCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount chats no leídos',
      one: '1 chat no leído',
    );
    return '$_temp0';
  }

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username y $count más están escribiendo…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username y $username2 están escribiendo…';
  }

  @override
  String userIsTyping(String username) {
    return '$username está escribiendo…';
  }

  @override
  String userLeftTheChat(String username) {
    return '$username abandonó el chat';
  }

  @override
  String get username => 'Nombre de usuario';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username envió un evento $type';
  }

  @override
  String get unverified => 'No verificado';

  @override
  String get verified => 'Verificado';

  @override
  String get verify => 'Verificar';

  @override
  String get verifyStart => 'Comenzar verificación';

  @override
  String get verifySuccess => '¡Has verificado exitosamente!';

  @override
  String get verifyTitle => 'Verificando la otra cuenta';

  @override
  String get videoCall => 'Video llamada';

  @override
  String get visibilityOfTheChatHistory => 'Visibilidad del historial del chat';

  @override
  String get visibleForAllParticipants =>
      'Visible para todos los participantes';

  @override
  String get visibleForEveryone => 'Visible para todo el mundo';

  @override
  String get voiceMessage => 'Mensaje de voz';

  @override
  String get waitingPartnerAcceptRequest =>
      'Esperando a que el socio acepte la solicitud…';

  @override
  String get waitingPartnerEmoji =>
      'Esperando a que el socio acepte los emojis…';

  @override
  String get waitingPartnerNumbers =>
      'Esperando a que el socio acepte los números…';

  @override
  String get wallpaper => 'Fondo de pantalla:';

  @override
  String get warning => '¡Advertencia!';

  @override
  String get weSentYouAnEmail => 'Te enviamos un correo electrónico';

  @override
  String get whoCanPerformWhichAction => 'Quién puede realizar qué acción';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'Quién tiene permitido unirse al grupo';

  @override
  String get whyDoYouWantToReportThis => '¿Por qué quieres denunciar esto?';

  @override
  String get wipeChatBackup =>
      '¿Limpiar la copia de seguridad de tu chat para crear una nueva clave de recuperación?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Con esta dirección puede recuperar su contraseña.';

  @override
  String get writeAMessage => 'Escribe un mensaje…';

  @override
  String get yes => 'Sí';

  @override
  String get you => 'Tú';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Ya no estás participando en este chat';

  @override
  String get youHaveBeenBannedFromThisChat => 'Has sido vetado de este chat';

  @override
  String get yourPublicKey => 'Tu clave pública';

  @override
  String get messageInfo => 'Información del mensaje';

  @override
  String get time => 'Tiempo';

  @override
  String get messageType => 'Tipo de Mensaje';

  @override
  String get sender => 'Remitente';

  @override
  String get openGallery => 'Abrir galería';

  @override
  String get removeFromSpace => 'Eliminar del espacio';

  @override
  String get addToSpaceDescription =>
      'Elige un espacio para añadirle este chat.';

  @override
  String get start => 'Iniciar';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'Para desbloquear sus viejos mensajes, introduzca su clave de recuperación que se generó en una sesión anterior. Su clave de recuperación NO es su contraseña.';

  @override
  String get publish => 'Publicar';

  @override
  String videoWithSize(String size) {
    return 'Video ($size)';
  }

  @override
  String get openChat => 'Abrir chat';

  @override
  String get markAsRead => 'Marcar como leído';

  @override
  String get reportUser => 'Reportar usuario';

  @override
  String get dismiss => 'Descartar';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender reaccionó con $reaction';
  }

  @override
  String get pinMessage => 'Anclar a la sala';

  @override
  String get confirmEventUnpin =>
      '¿Seguro que quiere desfijar permanentemente el evento?';

  @override
  String get emojis => 'Emojis';

  @override
  String get placeCall => 'Llamar';

  @override
  String get voiceCall => 'Llamada de voz';

  @override
  String get unsupportedAndroidVersion => 'Versión de Android no compatible';

  @override
  String get unsupportedAndroidVersionLong =>
      'Esta característica requiere una versión más reciente de Android. Por favor, compruebe las actualizaciones o la compatibilidad de Mobile KatyaOS.';

  @override
  String get videoCallsBetaWarning =>
      'Tenga en cuenta que las videollamadas están actualmente en fase beta. Es posible que no funcionen como se espera o que no funcionen de ninguna manera en algunas plataformas.';

  @override
  String get experimentalVideoCalls => 'Videollamadas experimentales';

  @override
  String get emailOrUsername => 'Correo electrónico o nombre de usuario';

  @override
  String get indexedDbErrorTitle => 'Problemas con el modo privado';

  @override
  String get indexedDbErrorLong =>
      'El almacenamiento de mensajes, por desgracia, no está habilitado en el modo privado por defecto.\nPor favor, visite\n - about:config\n - Establezca dom.indexedDB.privateBrowsing.enabled a true\nDe otra forma, no es posible usar REChain.';

  @override
  String switchToAccount(String number) {
    return 'Cambiar a la cuenta $number';
  }

  @override
  String get nextAccount => 'Siguiente cuenta';

  @override
  String get previousAccount => 'Cuenta anterior';

  @override
  String get addWidget => 'Añadir widget';

  @override
  String get widgetVideo => 'Vídeo';

  @override
  String get widgetEtherpad => 'Nota de texto';

  @override
  String get widgetJitsi => 'Jitsi Meet';

  @override
  String get widgetCustom => 'Personalizado';

  @override
  String get widgetName => 'Nombre';

  @override
  String get widgetUrlError => 'Esta no es una URL válida.';

  @override
  String get widgetNameError => 'Por favor proporciona un nombre para mostrar.';

  @override
  String get errorAddingWidget => 'Fallo al añadir el widget.';

  @override
  String get youRejectedTheInvitation => 'Rechazaste la invitación';

  @override
  String get youJoinedTheChat => 'Usted se ha unido al chat';

  @override
  String get youAcceptedTheInvitation => '👍 Aceptaste la invitación';

  @override
  String youBannedUser(String user) {
    return 'Usted prohibió el acceso a $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Usted retiró la invitación a $user';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 Te han invitado con un enlace a:\n$alias';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 Has sido invitado por $user';
  }

  @override
  String invitedBy(String user) {
    return '📩 Invitado por $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Usted invitó a $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Usted expulsó a $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Usted expulsó y prohibió el acceso a $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Usted volvió a permitir el acceso a $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user ha avisado';
  }

  @override
  String get usersMustKnock => 'Los usuarios han de avisar';

  @override
  String get noOneCanJoin => 'Nadie puede unirse';

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user quiere unirse al chat.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'No se ha creado un enlace público aún';

  @override
  String get knock => 'Aviso';

  @override
  String get users => 'Usuarios';

  @override
  String get unlockOldMessages => 'Desbloquear mensajes viejos';

  @override
  String get storeInSecureStorageDescription =>
      'Almacenar la clave de recuperación en el almacenamiento seguro de este dispositivo.';

  @override
  String get saveKeyManuallyDescription =>
      'Compartir esta clave manualmente usando el diálogo de compartir del sistema o el portapapeles.';

  @override
  String get storeInAndroidKeystore => 'Almacenar en la KeyStore de Android';

  @override
  String get storeInAppleKeyChain => 'Almacenar en la KeyChain de Apple';

  @override
  String get storeSecurlyOnThisDevice =>
      'Almacenar de forma segura en este dispositivo';

  @override
  String countFiles(int count) {
    return '$count archivos';
  }

  @override
  String get user => 'Usuario';

  @override
  String get custom => 'Personalizado';

  @override
  String get foregroundServiceRunning =>
      'Esta notificación aparece cuando el servicio en segundo plano se está ejecutando.';

  @override
  String get screenSharingTitle => 'Compartir la pantalla';

  @override
  String get screenSharingDetail =>
      'Usted está compartiendo su pantalla en rechainonline';

  @override
  String get callingPermissions => 'Permisos de llamadas';

  @override
  String get callingAccount => 'Llamando a cuenta';

  @override
  String get callingAccountDetails =>
      'Permite a REChain utilizar la aplicación de llamadas nativa de Android.';

  @override
  String get appearOnTop => 'Aparecer en la cima';

  @override
  String get appearOnTopDetails =>
      'Permite que la app aparezca delante (no hace falta si ya tienes REChain configurado como cuenta llamante)';

  @override
  String get otherCallingPermissions =>
      'Micrófono, cámara y otros permisos de rechainonline';

  @override
  String get whyIsThisMessageEncrypted =>
      '¿Por qué no se puede leer este mensaje?';

  @override
  String get noKeyForThisMessage =>
      'Esto puede ocurrir si el mensaje se envió antes de que entraras en tu cuenta en este dispositivo.\n\nTambién puede que el remitente haya bloqueado tu dispositivo o haya fallado algo en la conexión a Internet.\n\n¿Puedes leer el mensaje en otra sesión? Entonces, ¡puedes transferir el mensaje desde allí! Ve a Ajustes > Dispositivos y asegúrate de que tus dispositivos se han verificado mutuamente. Cuando abras la sala la próxima vez y ambas sesiones estén en primer plano, las claves se transmitirán automáticamente.\n\n¿No quieres perder las claves al salir o al cambiar de dispositivo? Asegúrate de que has habilitado la copia de seguridad del chat en los ajustes.';

  @override
  String get newGroup => 'Nuevo grupo';

  @override
  String get newSpace => 'Nuevo espacio';

  @override
  String get enterSpace => 'Unirse al espacio';

  @override
  String get enterRoom => 'Unirse a la sala';

  @override
  String get allSpaces => 'Todos los espacios';

  @override
  String numChats(String number) {
    return '$number chats';
  }

  @override
  String get hideUnimportantStateEvents =>
      'Ocultar eventos de estado no importantes';

  @override
  String get hidePresences => '¿Esconder la lista de estado?';

  @override
  String get doNotShowAgain => 'No mostrar de nuevo';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Chat vacío (era $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Los espacios permiten consolidar los chats y montar comunidades privadas o públicas.';

  @override
  String get encryptThisChat => 'Cifrar este chat';

  @override
  String get disableEncryptionWarning =>
      'Por motivos de seguridad no es posible deshabilitar el cifrado en un chat si ha sido habilitado previamente.';

  @override
  String get sorryThatsNotPossible => 'Lo siento... eso no es posible';

  @override
  String get deviceKeys => 'Claves de dispositivo:';

  @override
  String get reopenChat => 'Reabrir chat';

  @override
  String get noBackupWarning =>
      '¡Cuidado! Si no se habilita la copia de seguridad del chat, perderás acceso a tus mensajes cifrados. Se recomienda encarecidamente habilitar la copia de seguridad del chat antes de salir.';

  @override
  String get noOtherDevicesFound => 'No se han encontrado otros dispositivos';

  @override
  String fileIsTooBigForServer(String max) {
    return '¡No se pudo mandar! El servidor solamente permite adjuntos de hasta $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Archivo guardado en $path';
  }

  @override
  String get jumpToLastReadMessage => 'Saltar al último mensaje leído';

  @override
  String get readUpToHere => 'Leer hasta aquí';

  @override
  String get jump => 'Saltar';

  @override
  String get openLinkInBrowser => 'Abrir enlace en navegador';

  @override
  String get reportErrorDescription =>
      '😭 Oh, no. Algo ha salido mal. Si quieres, puedes informar de este fallo a los desarrolladores.';

  @override
  String get report => 'informe';

  @override
  String get signInWithPassword => 'Entrar con clave';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Por favor, intente luego o elija un servidor distinto.';

  @override
  String signInWith(String provider) {
    return 'Entrar con $provider';
  }

  @override
  String get profileNotFound =>
      'El usuario no se encontró en el servidor. Puede que haya un problema de conexión o el usuario no exista.';

  @override
  String get setTheme => 'Poner tema:';

  @override
  String get setColorTheme => 'Poner tema de color:';

  @override
  String get invite => 'Invitación';

  @override
  String get inviteGroupChat => '📨 Invitar a grupo de chat';

  @override
  String get invitePrivateChat => '📨 Invitar a chat privado';

  @override
  String get invalidInput => '¡Entrada no válida!';

  @override
  String wrongPinEntered(int seconds) {
    return '¡Pin erróneo! Vuelve a intenrarlo en $seconds segundos...';
  }

  @override
  String get pleaseEnterANumber => 'Por favor pon un número mayor que 0';

  @override
  String get archiveRoomDescription =>
      'El chat se moverá al archivo. Otros usuarios podrán ver que has abandonado el chat.';

  @override
  String get roomUpgradeDescription =>
      'El chat se volverá a crear con la nueva versión de sala. Todos los participantes serán notificados de que tienen que cambiarse al nuevo chat. Puedes encontrar más información sobre versiones de salas en https://github.com/sorydima/REChain-/tree/main/matrix_bridge_setup_bundle';

  @override
  String get removeDevicesDescription =>
      'Vas a salir en este dispositivo y ya no podrás recibir mensajes.';

  @override
  String get banUserDescription =>
      'Se expulsará al usuario del chat y no podrá volver a entrar hasta que se le permita.';

  @override
  String get unbanUserDescription =>
      'El usuario podrá entrar al chat de nuevo si lo intenta.';

  @override
  String get kickUserDescription =>
      'Se expulsa al usuario del chat, pero no se le prohíbe volver a entrar. En chats públicos, el usuario podrá volver a entrar en cualquier momento.';

  @override
  String get makeAdminDescription =>
      'Una vez hagas que este usuario sea admin, puede que no puedas deshacerlo porque tendrá los mismos permisos que tú.';

  @override
  String get pushNotificationsNotAvailable =>
      'No están disponibles las notificaciones emergentes';

  @override
  String get learnMore => 'Aprender más';

  @override
  String get yourGlobalUserIdIs => 'Tu id de usuario global es: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Desgraciadamente, no se encontró ningún usuario con \"$query\". Por favor, revisa si cometiste un error.';
  }

  @override
  String get knocking => 'Avisando';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'El chat se puede descubrir buscando en $server';
  }

  @override
  String get searchChatsRooms => 'Buscar #chats, @usuarios...';

  @override
  String get nothingFound => 'No se encontró nada...';

  @override
  String get groupName => 'Nombre de grupo';

  @override
  String get createGroupAndInviteUsers => 'Crear un grupo e invitar usuarios';

  @override
  String get groupCanBeFoundViaSearch =>
      'Los grupos se pueden encontrar buscando';

  @override
  String get wrongRecoveryKey =>
      'Lo siento... esta no parece ser la clave de recuperación correcta.';

  @override
  String get startConversation => 'Iniciar conversación';

  @override
  String get commandHint_sendraw => 'Mandar json pelado';

  @override
  String get databaseMigrationTitle => 'La base de datos está optimizada';

  @override
  String get databaseMigrationBody =>
      'Por favor espera. Esto llevará un momento.';

  @override
  String get leaveEmptyToClearStatus => 'Deja vacío para limpiar tu estado.';

  @override
  String get select => 'Elegir';

  @override
  String get searchForUsers => 'Buscar @usuarios...';

  @override
  String get pleaseEnterYourCurrentPassword => 'Por favor, pon tu clave actual';

  @override
  String get newPassword => 'Nueva clave';

  @override
  String get pleaseChooseAStrongPassword => 'Por favor, pon una clave fuerte';

  @override
  String get passwordsDoNotMatch => 'Las claves no coinciden';

  @override
  String get passwordIsWrong => 'La clave que has puesto es incorrecta';

  @override
  String get publicLink => 'Enlace público';

  @override
  String get publicChatAddresses => 'Dirección de chat pública';

  @override
  String get createNewAddress => 'Crear nueva dirección';

  @override
  String get joinSpace => 'Unirse al espacio';

  @override
  String get publicSpaces => 'Espacios públicos';

  @override
  String get addChatOrSubSpace => 'Añadir chat o sub espacio';

  @override
  String get subspace => 'Sub espacio';

  @override
  String get decline => 'Declinar';

  @override
  String get thisDevice => 'Este dispositivo:';

  @override
  String get initAppError => 'Hubo un error al arrancar la app';

  @override
  String get userRole => 'Rol de usuario';

  @override
  String minimumPowerLevel(String level) {
    return '$level es el nivel mínimo.';
  }

  @override
  String searchIn(String chat) {
    return 'Buscar en chat \"$chat\"...';
  }

  @override
  String get searchMore => 'Buscar más...';

  @override
  String get gallery => 'Galería';

  @override
  String get files => 'Archivos';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return 'No pude crear la base de datos SQlite. La app intenta usar la base de datos heredada por ahora. Por favor, informa de este error a los desarrolladores en $url. El mensaje de error es: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'Se perdió tu sesión. Por favor, informa de este error a los desarrolladores en $url. El mensaje de error es: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'La app ahora trata de recuperar tu sesión de la copia de seguridad. Por favor, informa de este error a los desarrolladores en $url. El mensaje de error es: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return '¿Reenviar mensaje a $roomName?';
  }

  @override
  String get sendReadReceipts => 'Mandar recibos de lectura';

  @override
  String get sendTypingNotificationsDescription =>
      'Otros participantes en un chat pueden ver cuándo estás escribiendo un mensaje.';

  @override
  String get sendReadReceiptsDescription =>
      'Otros participantes en un chat pueden ver cuándo has leído un mensaje.';

  @override
  String get formattedMessages => 'Mensajes con formato';

  @override
  String get formattedMessagesDescription =>
      'Mostrar contenido de mensaje enriquecido, como texto en negrita, usando markdown.';

  @override
  String get verifyOtherUser => '🔐 Verificar a otro usuario';

  @override
  String get verifyOtherUserDescription =>
      'Si verificas a otro usuario, puedes estar seguro de a quién estás escribiendo realmente. 💪\n\nCuando empiezas una verificación, tú y el otro usuario veréis una ventana emergente en la app. En ella veréis una serie de emojiso números que tenéis que comparar.\n\nLa mejor forma de hacer esto es quedar o una videollamada. 👭';

  @override
  String get verifyOtherDevice => '🔐 Verificar otro dispositivo';

  @override
  String get verifyOtherDeviceDescription =>
      'Cuando verificas otro dispositivo, esos dispositivos pueden intercambiar claves, incrementando tu seguridad global. 💪 Cuando inicias una verificación, aparece una ventana en la app en ambos dispositivos. En ella, verás una serie de emojis o números que tienes que comparar. Es mejor tener ambos dispositivos a mano antes de empezar la verificación. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender aceptó la verificación de clave';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender canceló la verificación de clave';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender completó la verificación de clave';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender está preparado para verificación de clave';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender ha pedido verificación de clave';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender ha comenzado verificación de clave';
  }

  @override
  String get transparent => 'Transparente';

  @override
  String get incomingMessages => 'Mensajes entrantes';

  @override
  String get stickers => 'Pegatinas';

  @override
  String get discover => 'Descubrir';

  @override
  String get commandHint_ignore => 'Ignorar la ID de REChain dada';

  @override
  String get commandHint_unignore => 'No ignorar la ID de REChain dada';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread chats no leídos';
  }

  @override
  String get noDatabaseEncryption =>
      'En esta plataforma no hay cifrado de base de datos';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Ahora mismo, hay $count usuarios bloqueados.';
  }

  @override
  String get restricted => 'Restringido';

  @override
  String get knockRestricted => 'Aviso restringido';

  @override
  String goToSpace(Object space) {
    return 'Ir al espacio: $space';
  }

  @override
  String get markAsUnread => 'Marcar no leído';

  @override
  String userLevel(int level) {
    return '$level - Usuario';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Moderador';
  }

  @override
  String adminLevel(int level) {
    return '$level - Administrador';
  }

  @override
  String get changeGeneralChatSettings =>
      'Cambiar los ajustes generales de chat';

  @override
  String get inviteOtherUsers => 'Invitar a otros usuarios a este chat';

  @override
  String get changeTheChatPermissions => 'Cambiar los permisos de chat';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Cambiar la visibilidad de la historia de chat';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Cambiar la dirección pública principal de chat';

  @override
  String get sendRoomNotifications => 'Mandar notificación @sala';

  @override
  String get changeTheDescriptionOfTheGroup =>
      'Cambiar la descripción del chat';

  @override
  String get chatPermissionsDescription =>
      'Definir el nivel necesario para ciertas acciones en este chat. Los niveles 0, 50 y 100 habitualmente representan usuarios, moderadores y administradores, pero se puede establecer cualquier escala.';

  @override
  String updateInstalled(String version) {
    return '¡🎉 Actualización $version instalada!';
  }

  @override
  String get changelog => 'Cambios';

  @override
  String get sendCanceled => 'Envío cancelado';

  @override
  String get loginWithMatrixId => 'Entrar con un ID de REChain';

  @override
  String get discoverHomeservers => 'Descubrir homeservers';

  @override
  String get whatIsAHomeserver => '¿Qué es un homeserver?';

  @override
  String get homeserverDescription =>
      'Todos tus datos se guardan en el homeserver, como en un proveedor de correo electrónico. Puedes elegir el homeserver que quieres usar, a la par que te puedes comunicar con todos. Más en https://rechain.network.';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'No parece ser un homeserver compatible. ¿URL equivocada?';

  @override
  String get calculatingFileSize => 'Calculando tamaño de archivo...';

  @override
  String get prepareSendingAttachment => 'Prepara envío del adjunto...';

  @override
  String get sendingAttachment => 'Enviando adjunto...';

  @override
  String get generatingVideoThumbnail => 'Generando miniatura de vídeo...';

  @override
  String get compressVideo => 'Comprimiendo vídeo...';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return 'Enviando adjunto $index de $length...';
  }

  @override
  String serverLimitReached(int seconds) {
    return '¡Alcanzado límite del servidor! Esperando $seconds segundos...';
  }

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Uno de tus dispositivos no está verificado';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Nota: Cuando conectas todos tus dispositivos a la copia de seguridad del chat, son verificados automáticamente.';

  @override
  String get continueText => 'Continuar';

  @override
  String get welcomeText =>
      'Eh, eh, 👋 Esto es REChain. Puedes acceder a cualquier homeserver, que sea compatible con https://rechain.network. Y luego chatear con cualquiera. ¡Es una red de mensajería descentralizada enorme!';

  @override
  String get blur => 'Difuminar:';

  @override
  String get opacity => 'Opacidad:';

  @override
  String get setWallpaper => 'Poner fondo';

  @override
  String get manageAccount => 'Gestionar cuenta';

  @override
  String get noContactInformationProvided =>
      'El servidor no suministra ninguna información de contacto válida';

  @override
  String get contactServerAdmin =>
      'Contactar con el administrador del servidor';

  @override
  String get contactServerSecurity => 'Contactar con seguridad del servidor';

  @override
  String get supportPage => 'Página de atención';

  @override
  String get serverInformation => 'Información del servidor:';

  @override
  String get name => 'Nombre';

  @override
  String get version => 'Versión';

  @override
  String get website => 'Web';

  @override
  String get compress => 'Comprimir';

  @override
  String get boldText => 'Texto en negrita';

  @override
  String get italicText => 'Texto en cursiva';

  @override
  String get strikeThrough => 'Tachado';

  @override
  String get pleaseFillOut => 'Por favor, rellenar';

  @override
  String get invalidUrl => 'URL incorrecta';

  @override
  String get addLink => 'Añadir enlace';

  @override
  String get unableToJoinChat =>
      'No se puede entrar al chat. Puede que la otra parte ya haya cerrado la conversación.';

  @override
  String get previous => 'Anterior';

  @override
  String get otherPartyNotLoggedIn =>
      'La otra parte ahora mismo no está conectada y por tanto ¡no puede recibir mensajes!';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Usar \'$server\' para entrar';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Por la presente permites a la app y web compartir información sobre ti.';

  @override
  String get open => 'Abrir';

  @override
  String get waitingForServer => 'Esperando al servidor...';

  @override
  String get appIntroduction =>
      'REChain te permite chatear con tus amigos con diferentes mensajerías. Aprende más en https://rechain.network o simplemente pincha *Continuar*.';

  @override
  String get newChatRequest => '📩 Nueva petición de chat';

  @override
  String get contentNotificationSettings =>
      'Ajustes de notificación de contenido';

  @override
  String get generalNotificationSettings => 'Ajustes de notificación generales';

  @override
  String get roomNotificationSettings => 'Ajustes de notificación de salas';

  @override
  String get userSpecificNotificationSettings =>
      'Ajustes de notificación por usuario';

  @override
  String get otherNotificationSettings => 'Otros ajustes de notificación';

  @override
  String get notificationRuleContainsUserName => 'Contiene nombre de usuario';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Notifica al usuario cuando un mensaje contiene su nombre de usuario.';

  @override
  String get notificationRuleMaster => 'Silenciar todas las notificaciones';

  @override
  String get notificationRuleMasterDescription =>
      'Anula todas las demás reglas y desactiva todas las notificaciones.';

  @override
  String get notificationRuleSuppressNotices =>
      'Suprimir los mensajes automáticos';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Suprimir notificaciones de clientes automáticos, como bots.';

  @override
  String get notificationRuleInviteForMe => 'Invitación para mí';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Notifica al usuario cuando se les invita a una sala.';

  @override
  String get notificationRuleMemberEvent => 'Evento para miembros';

  @override
  String get notificationRuleMemberEventDescription =>
      'Suprimir notificaciones de eventos para miembros.';

  @override
  String get notificationRuleIsUserMention => 'Mención al usuario';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Notifica al usuario cuando son mencionados directamente en un mensaje.';

  @override
  String get notificationRuleContainsDisplayName =>
      'Contiene el nombre visible';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Notifica al usuario cuando un mensaje contiene su nombre visible.';

  @override
  String get notificationRuleIsRoomMention => 'Mención de sala';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Notifica al usuario cuando hay una mención de sala.';

  @override
  String get notificationRuleRoomnotif => 'Notificación de sala';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Notifica al usuario cuando un mensaje contiene \'@sala\'.';

  @override
  String get notificationRuleTombstone => 'Lápida';

  @override
  String get notificationRuleTombstoneDescription =>
      'Notifica al usuario sobre mensajes de desactivación de sala.';

  @override
  String get notificationRuleReaction => 'Reacción';

  @override
  String get notificationRuleReactionDescription =>
      'Suprime notificaciones por reacciones.';

  @override
  String get notificationRuleRoomServerAcl => 'ACL de servidor de sala';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Suprime notificaciones de listas de control de acceso de servidores de sala.';

  @override
  String get notificationRuleSuppressEdits => 'Suprimir ediciones';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Suprime las notificaciones de mensajes editados.';

  @override
  String get notificationRuleCall => 'Llamar';

  @override
  String get notificationRuleCallDescription =>
      'Notifica al usuario de llamadas.';

  @override
  String get notificationRuleEncryptedRoomOneToOne => 'Sala cifrada uno a uno';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Notifica al usuario sobre mensajes en salas cifradas uno a uno.';

  @override
  String get notificationRuleRoomOneToOne => 'Sala uno a uno';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Notifica al usuario sobre mensajes en salas uno a uno.';

  @override
  String get notificationRuleMessage => 'Mensaje';

  @override
  String get notificationRuleMessageDescription =>
      'Notifica al usuario sobre mensajes generales.';

  @override
  String get notificationRuleEncrypted => 'Cifrado';

  @override
  String get notificationRuleEncryptedDescription =>
      'Notifica al usuario sobre mensajes en salas cifradas.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Notifica al usuario sobre eventos del componente de Jitsi.';

  @override
  String get notificationRuleServerAcl =>
      'Suprimir eventos de ACL del servidor';

  @override
  String get notificationRuleServerAclDescription =>
      'Suprime notificaciones de eventos de ACL del servidor.';

  @override
  String unknownPushRule(String rule) {
    return 'Regla de notificación desconocida \'$rule\'';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return '🎙️ $duration - Mensaje de voz de $sender';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Si eliminas este ajuste de notificación, esto no se puede deshacer.';

  @override
  String get more => 'Más';

  @override
  String get shareKeysWith => 'Compartir claves con...';

  @override
  String get shareKeysWithDescription =>
      '¿Qué dispositivos deben ser de confianza para que puedan leer tus mensajes en chats cifrados?';

  @override
  String get allDevices => 'Todos los dispositivos';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Dispositivos verificados si están habilitados';

  @override
  String get crossVerifiedDevices => 'Dispositivos verificados';

  @override
  String get verifiedDevicesOnly => 'Solo dispositivos verificados';

  @override
  String get takeAPhoto => 'Tomar foto';

  @override
  String get recordAVideo => 'Grabar video';

  @override
  String get optionalMessage => '(Opcional) mensaje...';

  @override
  String get notSupportedOnThisDevice =>
      'No es compatible con este dispositivo';

  @override
  String get enterNewChat => 'Ingresar a nuevo chat';

  @override
  String get approve => 'Aprobar';

  @override
  String get youHaveKnocked => 'Has sido golpeado';

  @override
  String get pleaseWaitUntilInvited =>
      'Por favor espera, hasta que alguien del chat te invite.';

  @override
  String get commandHint_logout => 'Salir del dispositivo actual';

  @override
  String get commandHint_logoutall => 'Salir de todos los dispositivos activos';

  @override
  String get displayNavigationRail => 'Mostrar carril de navegación en móvil';

  @override
  String get customReaction => 'Custom reaction';

  @override
  String get moreEvents => 'More events';
}
