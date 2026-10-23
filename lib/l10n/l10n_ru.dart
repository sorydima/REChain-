// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class L10nRu extends L10n {
  L10nRu([String locale = 'ru']) : super(locale);

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
  String get repeatPassword => 'Повторите пароль';

  @override
  String get notAnImage => 'Это не картинка.';

  @override
  String get remove => 'Удалить';

  @override
  String get importNow => 'Импортировать сейчас';

  @override
  String get importEmojis => 'Импортировать эмодзи';

  @override
  String get importFromZipFile => 'Импортировать из ZIP-файла';

  @override
  String get exportEmotePack => 'Экспортировать набор эмодзи как ZIP';

  @override
  String get replace => 'Заменить';

  @override
  String get about => 'О проекте';

  @override
  String aboutHomeserver(String homeserver) {
    return 'О сервере $homeserver';
  }

  @override
  String get accept => 'Принять';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username принял(а) приглашение';
  }

  @override
  String get account => 'Учётная запись';

  @override
  String get accountsAndSettings => 'Accounts and settings';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username активировал(а) сквозное шифрование';
  }

  @override
  String get addEmail => 'Добавить электронную почту';

  @override
  String get confirmREChainId =>
      'Please confirm your REChain ID in order to delete your account.';

  @override
  String supposedMxid(String mxid) {
    return 'Это должно быть $mxid';
  }

  @override
  String get addToSpace => 'Добавить в пространство';

  @override
  String get admin => 'Администратор';

  @override
  String get alias => 'псевдоним';

  @override
  String get all => 'Все';

  @override
  String get commandHint_roomupgrade => 'Обновить комнату до указанной версии';

  @override
  String get commandHint_googly => 'Отправить выпученные глаза';

  @override
  String get commandHint_cuddle => 'Отправить улыбку';

  @override
  String get commandHint_hug => 'Отправить обнимашки';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName выпучил глаза';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName обнимает вас';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName обнял(а) Вас';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName ответил(а) на звонок';
  }

  @override
  String get anyoneCanJoin => 'Каждый может присоединиться';

  @override
  String get appLock => 'Блокировка приложения';

  @override
  String get appLockDescription =>
      'Заблокировать приложение когда не используется пин код';

  @override
  String get archive => 'Архив';

  @override
  String get areGuestsAllowedToJoin => 'Разрешено ли гостям присоединяться';

  @override
  String get areYouSure => 'Вы уверены?';

  @override
  String get discardEdits => 'You have unsaved changes. Discard your edits?';

  @override
  String get areYouSureYouWantToLogout => 'Вы действительно хотите выйти?';

  @override
  String get askSSSSSign =>
      'Для подписи ключа другого пользователя, пожалуйста, введите вашу парольную фразу или ключ восстановления.';

  @override
  String askVerificationRequest(String username) {
    return 'Принять этот запрос подтверждения от $username?';
  }

  @override
  String get autoplayImages =>
      'Автоматически воспроизводить анимированные стикеры и эмодзи';

  @override
  String badServerLoginTypesException(
    String serverVersions,
    String supportedVersions,
    Object suportedVersions,
  ) {
    return 'Домашний сервер поддерживает следующие типы входа в систему:\n$serverVersions\nНо это приложение поддерживает только:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications =>
      'Отправлять уведомления о наборе текста';

  @override
  String get swipeRightToLeftToReply => 'Для ответа проведите справа налево';

  @override
  String get sendOnEnter => 'Отправлять по Enter';

  @override
  String get noMoreChatsFound => 'Больше чатов не обнаружено...';

  @override
  String get noChatsFoundHere =>
      'Не было найдено ни одного чата. Начать с кем-нибудь новый чат можно, нажав кнопку ниже. ⤵️';

  @override
  String get unread => 'Непрочитанные';

  @override
  String get space => 'Пространство';

  @override
  String get banFromChat => 'Заблокировать в чате';

  @override
  String get banned => 'Заблокирован(а)';

  @override
  String bannedUser(String username, String targetName) {
    return '$username заблокировал(а) $targetName';
  }

  @override
  String get blockDevice => 'Заблокировать устройство';

  @override
  String get blocked => 'Заблокировано';

  @override
  String get cancel => 'Отмена';

  @override
  String cantOpenUri(String uri) {
    return 'Не удается открыть URI $uri';
  }

  @override
  String get changeDeviceName => 'Изменить имя устройства';

  @override
  String changedTheChatAvatar(String username) {
    return '$username изменил(а) аватар чата';
  }

  @override
  String changedTheChatDescription(Object username) {
    return '$username изменил описание чата';
  }

  @override
  String changedTheChatName(Object username) {
    return '$username изменил(а) имя чата';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username изменил(а) права доступа к чату';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username изменил(а) отображаемое имя на \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username изменил(а) правила гостевого доступа';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username изменил(а) правила гостевого доступа на $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username изменил(а) видимость истории';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username изменил(а) видимость истории на $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username изменил(а) правила присоединения';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username изменил(а) правила присоединения на $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username изменил(а) аватар';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username изменил(а) псевдонимы комнаты';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username изменил(а) ссылку для приглашения';
  }

  @override
  String get changePassword => 'Изменить пароль';

  @override
  String get changeTheHomeserver => 'Изменить домашний сервер';

  @override
  String get changeTheme => 'Персонализация';

  @override
  String get changeTheNameOfTheGroup => 'Изменить название группы';

  @override
  String get changeYourAvatar => 'Изменить свой аватар';

  @override
  String get channelCorruptedDecryptError => 'Шифрование было повреждено';

  @override
  String get chat => 'Чат';

  @override
  String get chatBackup => 'Резервное копирование чата';

  @override
  String get chatDetails => 'Детали чата';

  @override
  String get chats => 'Чаты';

  @override
  String get chooseAStrongPassword => 'Выберите надёжный пароль';

  @override
  String get clearArchive => 'Очистить архив';

  @override
  String get close => 'Закрыть';

  @override
  String get commandHint_markasdm => 'Пометить как комнату личных сообщений';

  @override
  String get commandHint_markasgroup => 'Пометить как группу';

  @override
  String get commandHint_ban =>
      'Заблокировать данного пользователя в этой комнате';

  @override
  String get commandHint_clearcache => 'Очистить кэш';

  @override
  String get commandHint_create =>
      'Создайте пустой групповой чат\nИспользуйте --no-encryption, чтобы отключить шифрование';

  @override
  String get commandHint_discardsession => 'Удалить сеанс';

  @override
  String get commandHint_dm =>
      'Начните личный чат\nИспользуйте --no-encryption, чтобы отключить шифрование';

  @override
  String get commandHint_html => 'Отправить текст формата HTML';

  @override
  String get commandHint_invite =>
      'Пригласить данного пользователя в эту комнату';

  @override
  String get commandHint_join => 'Присоединиться к данной комнате';

  @override
  String get commandHint_kick => 'Удалить данного пользователя из этой комнаты';

  @override
  String get commandHint_leave => 'Покинуть эту комнату';

  @override
  String get commandHint_me => 'Опишите себя';

  @override
  String get commandHint_myroomavatar =>
      'Установите свою фотографию для этой комнаты (автор: mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Задайте отображаемое имя для этой комнаты';

  @override
  String get commandHint_op =>
      'Установить уровень прав данного пользователя (по умолчанию: 50)';

  @override
  String get commandHint_plain => 'Отправить неотформатированный текст';

  @override
  String get commandHint_react => 'Отправить ответ как реакцию';

  @override
  String get commandHint_send => 'Отправить текст';

  @override
  String get commandHint_unban =>
      'Разблокировать данного пользователя в этой комнате';

  @override
  String get commandInvalid => 'Недопустимая команда';

  @override
  String commandMissing(String command) {
    return '$command не является командой.';
  }

  @override
  String get compareEmojiMatch => 'Сравните эмодзи';

  @override
  String get compareNumbersMatch => 'Сравните числа';

  @override
  String get configureChat => 'Настроить чат';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Контакт был приглашен в группу';

  @override
  String get contentHasBeenReported =>
      'О контенте было сообщено администраторам сервера';

  @override
  String get copiedToClipboard => 'Скопировано в буфер обмена';

  @override
  String get copy => 'Копировать';

  @override
  String get copyToClipboard => 'Скопировать в буфер обмена';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Не удалось расшифровать сообщение: $error';
  }

  @override
  String get checkList => 'Контрольный список';

  @override
  String countParticipants(int count) {
    return '$count участника(ов)';
  }

  @override
  String countInvited(int count) {
    return '$count invited';
  }

  @override
  String get create => 'Создать';

  @override
  String createdTheChat(String username) {
    return '💬 $username создал(а) чат';
  }

  @override
  String get createGroup => 'Создать группу';

  @override
  String get createNewSpace => 'Новое пространство';

  @override
  String get currentlyActive => 'В настоящее время активен(а)';

  @override
  String get darkTheme => 'Тёмная';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$timeOfDay, $date';
  }

  @override
  String get deactivateAccountWarning =>
      'Это деактивирует вашу учётную запись пользователя. Данное действие не может быть отменено! Вы уверены?';

  @override
  String get defaultPermissionLevel =>
      'Уровень разрешений по умолчанию для новых пользователей';

  @override
  String get delete => 'Удалить';

  @override
  String get deleteAccount => 'Удалить аккаунт';

  @override
  String get deleteMessage => 'Удалить сообщение';

  @override
  String get devices => 'Устройства';

  @override
  String get directChats => 'Личные чаты';

  @override
  String get displaynameHasBeenChanged => 'Отображаемое имя было изменено';

  @override
  String get downloadFile => 'Скачать файл';

  @override
  String get edit => 'Редактировать';

  @override
  String get editBlockedServers => 'Редактировать заблокированные серверы';

  @override
  String get chatPermissions => 'Права в чате';

  @override
  String get editDisplayname => 'Отображаемое имя';

  @override
  String get editRoomAliases => 'Редактировать псевдонимы комнаты';

  @override
  String get editRoomAvatar => 'Изменить аватар комнаты';

  @override
  String get emoteExists => 'Эмодзи уже существует!';

  @override
  String get emoteInvalid => 'Недопустимый код эмодзи!';

  @override
  String get emoteKeyboardNoRecents =>
      'Недавно использованные эмодзи появятся здесь...';

  @override
  String get globalChatId => 'ID глобального чата';

  @override
  String get accessAndVisibility => 'Доступность и видимость';

  @override
  String get accessAndVisibilityDescription =>
      'Кому разрешено войти в этот чат и как этот чат может быть обнаружен.';

  @override
  String get customEmojisAndStickers => 'Пользовательские эмодзи и стикеры';

  @override
  String get customEmojisAndStickersBody =>
      'Добавить или поделиться пользовательскими эмодзи или стикерами, которые могут быть применены в любом чате.';

  @override
  String get emoteShortcode => 'Код эмодзи';

  @override
  String get emptyChat => 'Пустой чат';

  @override
  String get enableEmotesGlobally => 'Включить набор эмодзи глобально';

  @override
  String get enableEncryption => 'Включить шифрование';

  @override
  String get enableEncryptionWarning =>
      'Вы больше не сможете отключить шифрование. Вы уверены?';

  @override
  String get encrypted => 'Зашифровано';

  @override
  String get encryption => 'Шифрование';

  @override
  String get encryptionNotEnabled => 'Шифрование не включено';

  @override
  String endedTheCall(String senderName) {
    return '$senderName завершил(а) звонок';
  }

  @override
  String get enterAnEmailAddress => 'Введите адрес электронной почты';

  @override
  String errorObtainingLocation(String error) {
    return 'Ошибка получения местоположения: $error';
  }

  @override
  String get fontSize => 'Размер шрифта';

  @override
  String get forward => 'Переслать';

  @override
  String get fromJoining => 'С момента присоединения';

  @override
  String get fromTheInvitation => 'С момента приглашения';

  @override
  String get group => 'Группа';

  @override
  String get chatDescription => 'Описание чата';

  @override
  String get chatDescriptionHasBeenChanged => 'Описание чата изменено';

  @override
  String get groupIsPublic => 'Публичная группа';

  @override
  String get groups => 'Группы';

  @override
  String groupWith(String displayname) {
    return 'Группа с $displayname';
  }

  @override
  String get guestsAreForbidden => 'Гости не могут присоединиться';

  @override
  String get guestsCanJoin => 'Гости могут присоединиться';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username отозвал(а) приглашение для $targetName';
  }

  @override
  String get help => 'Помощь';

  @override
  String get hideRedactedMessages => 'Скрыть редактированные сообщения';

  @override
  String get hideRedactedMessagesBody =>
      'Если кто-то редактирует сообщение, оно будет скрыто в чате.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Скрыть неправильные или неизвестные форматы сообщения';

  @override
  String get block => 'Заглушить';

  @override
  String get blockedUsers => 'Заглушённые пользователи';

  @override
  String get blockListDescription =>
      'Вы можете заглушить тревожащих вас пользователей. Вы не будете получать сообщения или приглашения в комнату от пользователей из вашего личного чёрного списка.';

  @override
  String get blockUsername => 'Игнорировать имя пользователя';

  @override
  String get iHaveClickedOnLink => 'Я перешёл по ссылке';

  @override
  String get incorrectPassphraseOrKey =>
      'Неверный пароль или ключ восстановления';

  @override
  String get inviteContact => 'Пригласить контакт';

  @override
  String inviteContactToGroup(String groupName) {
    return 'Пригласить контакт в $groupName';
  }

  @override
  String get noChatDescriptionYet => 'Описание чата не создано.';

  @override
  String get tryAgain => 'Повторите попытку';

  @override
  String get invalidServerName => 'Недопустимое имя сервера';

  @override
  String get invited => 'Приглашён';

  @override
  String get redactMessageDescription =>
      'Сообщение будет отредактировано для всех участников. Это необратимо.';

  @override
  String get optionalRedactReason =>
      '(Необязательно) Причина редактирования...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username пригласил(а) $targetName';
  }

  @override
  String get invitedUsersOnly => 'Только приглашённым пользователям';

  @override
  String inviteText(String username, String link) {
    return '$username пригласил(а) вас в REChain. \n1. Посетите https://github.com/sorydima/REChain- и установите приложение \n2. Зарегистрируйтесь или войдите \n3. Откройте ссылку приглашения: \n $link';
  }

  @override
  String get isTyping => 'печатает…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username присоединился(ась) к чату';
  }

  @override
  String get joinRoom => 'Присоединиться к комнате';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username выгнал(а) $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username выгнал(а) и заблокировал(а) $targetName';
  }

  @override
  String get kickFromChat => 'Выгнать из чата';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Последнее посещение: $localizedTimeShort';
  }

  @override
  String get leave => 'Покинуть';

  @override
  String get leftTheChat => 'Покинуть чат';

  @override
  String get lightTheme => 'Светлая';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Load $count more participants';
  }

  @override
  String get dehydrate => 'Экспорт сеанса и очистка устройства';

  @override
  String get dehydrateWarning =>
      'Это действие не может быть отменено. Убедитесь, что вы безопасно сохранили файл резервной копии.';

  @override
  String get hydrate => 'Восстановить из файла резервной копии';

  @override
  String get loadingPleaseWait => 'Загрузка... Пожалуйста, подождите.';

  @override
  String get loadMore => 'Загрузить больше…';

  @override
  String get locationDisabledNotice =>
      'Службы определения местоположения отключены. Включите их, чтобы иметь возможность обмениваться информацией о своем местоположении.';

  @override
  String get locationPermissionDeniedNotice =>
      'Разрешение на определение местоположения отклонено. Пожалуйста, предоставьте это разрешение, чтобы иметь возможность делиться своим местоположением.';

  @override
  String get login => 'Войти';

  @override
  String logInTo(String homeserver) {
    return 'Войти в $homeserver';
  }

  @override
  String get logout => 'Выйти';

  @override
  String get mention => 'Упомянуть';

  @override
  String get messages => 'Сообщения';

  @override
  String get messagesStyle => 'Сообщения:';

  @override
  String get moderator => 'Модератор';

  @override
  String get muteChat => 'Отключить уведомления';

  @override
  String get newChat => 'Новый чат';

  @override
  String get newMessageInrechainonline => '💬 Новое сообщение во REChain';

  @override
  String get newVerificationRequest => 'Новый запрос на подтверждение!';

  @override
  String get next => 'Далее';

  @override
  String get no => 'Нет';

  @override
  String get noConnectionToTheServer => 'Нет соединения с сервером';

  @override
  String get noEmotesFound => 'Эмодзи не найдены 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Вы можете активировать шифрование только тогда, когда комната перестает быть общедоступной.';

  @override
  String get noGoogleServicesWarning =>
      'Похоже, у вас нет служб Google на вашем телефоне. Это хорошее решение для вашей конфиденциальности! Для получения push-уведомлений во REChain мы рекомендуем использовать ntfy. С ntfy или другим провайдером единых уведомлений вы можете получать push-уведомления безопасным способом передачи данных. Скачать ntfy можно из F-Droid или из Play Маркета.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 не является REChain-сервером, использовать $server2 вместо него?';
  }

  @override
  String get shareInviteLink => 'Поделиться приглашением';

  @override
  String get scanQrCode => 'Сканировать QR-код';

  @override
  String get noPasswordRecoveryDescription =>
      'Вы ещё не добавили способ восстановления пароля.';

  @override
  String get noPermission => 'Нет прав доступа';

  @override
  String get noRoomsFound => 'Комнаты не найдены…';

  @override
  String get notifications => 'Уведомления';

  @override
  String numUsersTyping(int count) {
    return '$count пользователей печатают…';
  }

  @override
  String get obtainingLocation => 'Получение местоположения…';

  @override
  String get ok => 'Ок';

  @override
  String get onlineKeyBackupEnabled =>
      'Резервное копирование ключей на сервере включено';

  @override
  String get oopsPushError =>
      'Ой! К сожалению, при настройке push-уведомлений произошла ошибка.';

  @override
  String get oopsSomethingWentWrong => 'Ой, что-то пошло не так…';

  @override
  String get openAppToReadMessages =>
      'Откройте приложение для чтения сообщений';

  @override
  String get openCamera => 'Открыть камеру';

  @override
  String get oneClientLoggedOut => 'Один из ваших клиентов вышел';

  @override
  String get addAccount => 'Добавить учетную запись';

  @override
  String get editBundlesForAccount => 'Изменить пакеты для этой учетной записи';

  @override
  String get addToBundle => 'Добавить в пакет';

  @override
  String get removeFromBundle => 'Удалить из этого пакета';

  @override
  String get bundleName => 'Название пакета';

  @override
  String get openInMaps => 'Открыть на картах';

  @override
  String get link => 'Ссылка';

  @override
  String get or => 'Или';

  @override
  String get participant => 'Участник';

  @override
  String get passphraseOrKey => 'пароль или ключ восстановления';

  @override
  String get password => 'Пароль';

  @override
  String get passwordForgotten => 'Забыли пароль';

  @override
  String get passwordHasBeenChanged => 'Пароль был изменён';

  @override
  String get passwordRecoverySettings => 'Настройки восстановления пароля';

  @override
  String get passwordRecovery => 'Восстановление пароля';

  @override
  String get pin => 'Закрепить';

  @override
  String get pleaseChooseAPasscode => 'Пожалуйста, выберите код доступа';

  @override
  String get pleaseClickOnLink =>
      'Пожалуйста, нажмите на ссылку в электронной почте, для того чтобы продолжить.';

  @override
  String get pleaseEnterYourPassword => 'Пожалуйста, введите ваш пароль';

  @override
  String get pleaseEnterYourPin => 'Пожалуйста, введите свой пин-код';

  @override
  String get pleaseEnterYourUsername => 'Пожалуйста, введите имя пользователя';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Следуйте инструкциям на веб-сайте и нажмите «Далее».';

  @override
  String get privacy => 'Конфиденциальность';

  @override
  String get publicRooms => 'Публичные комнаты';

  @override
  String get reason => 'Причина';

  @override
  String redactedBy(String username) {
    return '$username отредактировал это событие';
  }

  @override
  String redactedByBecause(String username, String reason) {
    return '$username отредактировал это событие. Причина: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username отредактировал(а) событие';
  }

  @override
  String get redactMessage => 'Отредактировать сообщение';

  @override
  String get reject => 'Отказать';

  @override
  String rejectedTheInvitation(String username) {
    return '$username отклонил(а) приглашение';
  }

  @override
  String get removeAllOtherDevices => 'Удалить все другие устройства';

  @override
  String get unbanFromChat => 'Разблокировать в чате';

  @override
  String get removeYourAvatar => 'Удалить свой аватар';

  @override
  String get replaceRoomWithNewerVersion =>
      'Заменить комнату более новой версией';

  @override
  String get reply => 'Ответить';

  @override
  String get reportMessage => 'Сообщить о сообщении';

  @override
  String get roomHasBeenUpgraded => 'Комната обновлена';

  @override
  String sendingFilesDoNotExit(int count) {
    return 'Sending $count files... Please do not exit!';
  }

  @override
  String get roomVersion => 'Версия комнаты';

  @override
  String get compressingVideo => 'Compressing video...';

  @override
  String get saveFile => 'Сохранить файл';

  @override
  String get search => 'Поиск';

  @override
  String get security => 'Безопасность';

  @override
  String get send => 'Прислать';

  @override
  String get sendAMessage => 'Отправить сообщение';

  @override
  String get sendAsText => 'Отправить как текст';

  @override
  String get sendAudio => 'Отправить аудио';

  @override
  String get sendFile => 'Отправить файл';

  @override
  String get sendImage => 'Отправить изображение';

  @override
  String sendImages(int count) {
    return 'Отправить $count изображение';
  }

  @override
  String get sendMessages => 'Отправить сообщения';

  @override
  String get sendVideo => 'Отправить видео';

  @override
  String sentAFile(String username) {
    return '📁 $username отправил(а) файл';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username отправил(а) аудио';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username отправил(а) изображение';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username отправил(а) стикер';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username отправил(а) видео';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName отправил(а) информацию о звонке';
  }

  @override
  String get setAsCanonicalAlias => 'Установить как основной псевдоним';

  @override
  String get setChatDescription => 'Установить описание чата';

  @override
  String get setStatus => 'Задать статус';

  @override
  String get settings => 'Настройки';

  @override
  String get share => 'Поделиться';

  @override
  String sharedTheLocation(String username) {
    return '$username поделился(ась) местоположением';
  }

  @override
  String get shareLocation => 'Поделиться местоположением';

  @override
  String get skip => 'Пропустить';

  @override
  String get sourceCode => 'Исходный код';

  @override
  String get spaceIsPublic => 'Публичное пространство';

  @override
  String get spaceName => 'Название пространства';

  @override
  String startedACall(String senderName) {
    return '$senderName начал(а) звонок';
  }

  @override
  String get status => 'Статус';

  @override
  String get statusExampleMessage => 'Как у вас сегодня дела?';

  @override
  String get submit => 'Отправить';

  @override
  String get synchronizingPleaseWait => 'Синхронизация… Пожалуйста, подождите.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Синхронизация… ($percentage%)';
  }

  @override
  String get systemTheme => 'Системная';

  @override
  String get theyDontMatch => 'Они не совпадают';

  @override
  String get theyMatch => 'Они совпадают';

  @override
  String get tooManyRequestsWarning =>
      'Слишком много запросов. Пожалуйста, повторите попытку позже!';

  @override
  String get tryToSendAgain => 'Попробуйте отправить ещё раз';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username разблокировал(а) $targetName';
  }

  @override
  String get unblockDevice => 'Разблокировать устройство';

  @override
  String get unknownDevice => 'Неизвестное устройство';

  @override
  String get unknownEncryptionAlgorithm => 'Неизвестный алгоритм шифрования';

  @override
  String unknownEvent(String type) {
    return 'Неизвестное событие \'$type\'';
  }

  @override
  String get unmuteChat => 'Включить уведомления';

  @override
  String get unpin => 'Открепить';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username и еще $count печатают…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username и $username2 печатают…';
  }

  @override
  String userIsTyping(String username) {
    return '$username печатает…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username покинул(а) чат';
  }

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username отправил(а) событие типа \"$type\"';
  }

  @override
  String get unverified => 'Не проверено';

  @override
  String get verified => 'Проверено';

  @override
  String get verifyStart => 'Начать проверку';

  @override
  String get verifySuccess => 'Вы успешно проверены!';

  @override
  String get verifyTitle => 'Проверка другой учётной записи';

  @override
  String get visibilityOfTheChatHistory => 'Видимость истории чата';

  @override
  String get visibleForAllParticipants => 'Видима для всех участников';

  @override
  String get visibleForEveryone => 'Видна всем';

  @override
  String get voiceMessage => 'Отправить голосовое сообщение';

  @override
  String get waitingPartnerAcceptRequest => 'Жду, когда партнер примет запроc…';

  @override
  String get waitingPartnerEmoji => 'Жду, когда партнер примет эмодзи…';

  @override
  String get waitingPartnerNumbers =>
      'В ожидании партнёра, чтобы принять числа…';

  @override
  String get warning => 'Предупреждение!';

  @override
  String get weSentYouAnEmail => 'Мы отправили вам электронное письмо';

  @override
  String get whoCanPerformWhichAction => 'Кто и какое действие может выполнять';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'Кому разрешено вступать в эту группу';

  @override
  String get whyDoYouWantToReportThis => 'Почему вы хотите сообщить об этом?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'По этим адресам вы можете восстановить свой пароль.';

  @override
  String get writeAMessage => 'Напишите сообщение…';

  @override
  String get yes => 'Да';

  @override
  String get you => 'Вы';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Вы больше не участвуете в этом чате';

  @override
  String get yourPublicKey => 'Ваш открытый ключ';

  @override
  String get messageInfo => 'Информация о сообщении';

  @override
  String get time => 'Время';

  @override
  String get sender => 'Отправитель';

  @override
  String get openGallery => 'Открыть галерею';

  @override
  String get removeFromSpace => 'Удалить из пространства';

  @override
  String get markAsRead => 'Отметить как прочитанное';

  @override
  String get reportUser => 'Сообщить о пользователе';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender реагирует с $reaction';
  }

  @override
  String get pinMessage => 'Прикрепить к комнате';

  @override
  String get confirmEventUnpin =>
      'Вы уверены, что хотите навсегда открепить событие?';

  @override
  String get emojis => 'Эмодзи';

  @override
  String get unsupportedAndroidVersion => 'Неподдерживаемая версия Android';

  @override
  String get unsupportedAndroidVersionLong =>
      'Для этой функции требуется более новая версия Android. Проверьте наличие обновлений или поддержку Mobile Katya OS.';

  @override
  String get youRejectedTheInvitation => 'Вы отклонили приглашение';

  @override
  String get youJoinedTheChat => 'Вы присоединились к чату';

  @override
  String get youAcceptedTheInvitation => '👍 Вы приняли приглашение';

  @override
  String youBannedUser(String user) {
    return 'Вы заблокировали $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Вы отозвали приглашение для $user';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 Вы были приглашены $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Вы пригласили $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Вы выгнали $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Вы выгнали и заблокировали $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Вы разблокировали $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user постучался';
  }

  @override
  String get usersMustKnock => 'Пользователи должны постучаться';

  @override
  String get noOneCanJoin => 'Никто не может присоединиться';

  @override
  String get knock => 'Постучаться';

  @override
  String get users => 'Пользователи';

  @override
  String get storeInAndroidKeystore => 'Сохранить в Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Сохранить в Apple KeyChain';

  @override
  String get storeSecurlyOnThisDevice => 'Сохранить на этом устройстве';

  @override
  String countFiles(int count) {
    return '$count files';
  }

  @override
  String get user => 'Пользователь';

  @override
  String get custom => 'Пользовательское';

  @override
  String get whyIsThisMessageEncrypted => 'Почему это сообщение нечитаемо?';

  @override
  String get noKeyForThisMessage =>
      'Это может произойти, если сообщение было отправлено до того, как вы вошли в свою учетную запись на данном устройстве.\n\nТакже возможно, что отправитель заблокировал ваше устройство или что-то пошло не так с интернет-соединением.\n\nВы можете прочитать сообщение на другой сессии? Тогда вы можете перенести сообщение с неё! Перейдите в Настройки > Устройства и убедитесь, что ваши устройства проверили друг друга. Когда вы откроете комнату в следующий раз и обе сессии будут открыты, ключи будут переданы автоматически.\n\nВы не хотите потерять ключи при выходе из системы или переключении устройств? Убедитесь, что вы включили резервное копирование чата в настройках.';

  @override
  String get newSpace => 'Новое пространство';

  @override
  String get doNotShowAgain => 'Не показывать снова';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Пустой чат (был $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Пространства позволяют объединять Ваши чаты и создавать частные или общедоступные сообщества.';

  @override
  String get encryptThisChat => 'Зашифровать этот чат';

  @override
  String get disableEncryptionWarning =>
      'В целях безопасности Вы не можете отключить шифрование в чате, где оно было включено.';

  @override
  String get sorryThatsNotPossible => 'Извините... это невозможно';

  @override
  String get reopenChat => 'Открыть чат заново';

  @override
  String get noBackupWarning =>
      'Внимание! Без резервного копиирования, Вы потеряете доступ к своим зашифрованным сообщениям. Крайне рекомендуется включить резервное копирование перед выходом.';

  @override
  String get noOtherDevicesFound => 'Другие устройства не найдены';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Отправка не удалась! Сервер поддерживает только вложения размером до $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Файл сохранён в $path';
  }

  @override
  String get jumpToLastReadMessage => 'Последнее прочитанное сообщение';

  @override
  String get readUpToHere => 'Непрочитанное';

  @override
  String get jump => 'Перейти';

  @override
  String get openLinkInBrowser => 'Открыть ссылку в браузере';

  @override
  String get reportErrorDescription =>
      '😭 О, нет. Что-то пошло не так. При желании вы можете сообщить об этой ошибке разработчикам.';

  @override
  String get report => 'пожаловаться';

  @override
  String get setColorTheme => 'Цветовая тема:';

  @override
  String get invite => 'Пригласить';

  @override
  String get inviteGroupChat => '📨 Вас пригласили в групповой чат';

  @override
  String get invalidInput => 'Недопустимый ввод!';

  @override
  String wrongPinEntered(int seconds) {
    return 'Wrong pin entered! Try again in $seconds seconds...';
  }

  @override
  String get pleaseEnterANumber => 'Пожалуйста введите число больше 0';

  @override
  String get archiveRoomDescription =>
      'Чат переместится в архив. Другим пользователям будет видно, что вы вышли из чата.';

  @override
  String get roomUpgradeDescription =>
      'Затем чат будет воссоздан с новой версией комнаты. Все участники будут уведомлены о необходимости перейти в новый чат. Вы можете узнать больше о версиях комнат на https://github.com/sorydima/REChain-.git';

  @override
  String get removeDevicesDescription =>
      'Вы выйдете с этого устройства и больше не будете получать сообщения.';

  @override
  String get banUserDescription =>
      'Заблокированные в чате пользователи не смогут перезайти в чат, пока они не будут разблокированны.';

  @override
  String get unbanUserDescription =>
      'Пользователь сможет при желании зайти в чат снова.';

  @override
  String get kickUserDescription =>
      'Пользователь будет изгнан из чата, но не будет заблокирован. В публичных чатах пользователь может перезайти когда угодно.';

  @override
  String get makeAdminDescription =>
      'Как только вы назначите этого пользователя администратором, вы не сможете этого отменить, так как их права доступа и ваши будут одинаковы.';

  @override
  String get pushNotificationsNotAvailable => 'Push-уведомления недоступны';

  @override
  String get learnMore => 'Узнать больше';

  @override
  String get yourGlobalUserIdIs => 'Ваш глобальный идентификатор - ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'К сожалению пользователей с именем \"$query\" не найдено. Убедитесь, что вы не совершили опечатку.';
  }

  @override
  String get knocking => 'Стучаться';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Чат может быть обнаружен через поиск в $server';
  }

  @override
  String get searchChatsRooms => 'Поиск #чатов, @людей...';

  @override
  String get nothingFound => 'Ничего не найдено...';

  @override
  String get groupName => 'Название группы';

  @override
  String get createGroupAndInviteUsers => 'Создать и начать приглашать';

  @override
  String get groupCanBeFoundViaSearch => 'Группа может быть найдена поиском';

  @override
  String get wrongRecoveryKey =>
      'Простите... судя по всему это неверный ключ восстановления.';

  @override
  String get commandHint_sendraw => 'Отправить сырой json';

  @override
  String get databaseMigrationTitle => 'База данных оптимизированна';

  @override
  String get databaseMigrationBody =>
      'Пожалуйста, подождите. Это может занять некоторое время.';

  @override
  String get leaveEmptyToClearStatus =>
      'Чтобы очистить статус, оставьте поле пустым.';

  @override
  String get select => 'Выбрать';

  @override
  String get searchForUsers => 'Поиск @пользователей...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Пожалуйста, введите свой текущий пароль';

  @override
  String get newPassword => 'Новый пароль';

  @override
  String get pleaseChooseAStrongPassword =>
      'Пожалуйста, подберите сильный пароль';

  @override
  String get passwordsDoNotMatch => 'Пароли не совпадают';

  @override
  String get passwordIsWrong => 'Вы ввели неверный пароль';

  @override
  String get publicChatAddresses => 'Адресы публичного чата';

  @override
  String get createNewAddress => 'Создать новый адрес';

  @override
  String get joinSpace => 'Присоединиться к пространству';

  @override
  String get publicSpaces => 'Публичные пространства';

  @override
  String get addChatOrSubSpace => 'Добавить чат или субпространство';

  @override
  String get thisDevice => 'Данное устройство:';

  @override
  String get initAppError => 'Произошла ошибка при запуске приложения';

  @override
  String searchIn(String chat) {
    return 'Поиск в чате \"$chat\"...';
  }

  @override
  String get searchMore => 'Найти еще...';

  @override
  String get gallery => 'Галерея';

  @override
  String get files => 'Файлы';

  @override
  String sessionLostBody(String url, String error) {
    return 'Ваш сеанс утерян. Пожалуйста, сообщите об этой ошибке разработчикам по адресу $url. Сообщение об ошибке: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Приложение пытается восстановить сеанс из резервной копии. Пожалуйста, сообщите об этой ошибке разработчикам по адресу $url. Сообщение об ошибке: $error';
  }

  @override
  String get sendReadReceipts => 'Отправка квитанций о прочтении';

  @override
  String get sendTypingNotificationsDescription =>
      'Другие участники чата могут видеть, когда вы набираете новое сообщение.';

  @override
  String get sendReadReceiptsDescription =>
      'Другие участники чата могут видеть, когда вы прочитали сообщение.';

  @override
  String get formattedMessages => 'Форматированные сообщения';

  @override
  String get formattedMessagesDescription =>
      'Отображать содержимое расширенных сообщений, такой как жирный текст, с помощью Markdown.';

  @override
  String get verifyOtherUser => '🔐 Подтвердить другого пользователя';

  @override
  String get verifyOtherUserDescription =>
      'Если вы подтвердите другого пользователя, то вы можете быть уверены зная, кому вы действительно пишете. 💪\n\nКогда вы начинаете подтверждение, вы и другой пользователь увидите всплывающее окно в приложении. Там вы увидите ряд чисел или эмодзи, которые вы должны сравнить друг с другом.\n\nЛучший способ сделать это - встретиться в реальной жизни или по видео звонку. 👭';

  @override
  String get verifyOtherDevice => '🔐 Подтвердить другое устройство';

  @override
  String get verifyOtherDeviceDescription =>
      'При подтверждении другого устройства эти устройства могут обмениваться ключами, повышая общую безопасность. 💪 При запуске подтверждения в приложении на обоих устройствах появится всплывающее окно. Там вы увидите ряд чисел или эмодзи, которые вы должны сравнить друг с другом. Лучше иметь оба устройства под рукой перед началом проверки. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender принял(а) подтверждение ключей';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender отклонил(а) подтверждение ключей';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender завершил(а) подтверждение ключей';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender готов(а) к подтверждению ключей';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender запросил(а) подтверждение ключей';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender начал(а) подтверждение ключей';
  }

  @override
  String get incomingMessages => 'Входящие сообщения';

  @override
  String get stickers => 'Стикеры';

  @override
  String get discover => 'Исследовать';

  @override
  String get commandHint_ignore => 'Игнорировать данный REChain ID';

  @override
  String get commandHint_unignore => 'Не игнорировать данный REChain ID';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread unread chats';
  }

  @override
  String get noDatabaseEncryption =>
      'Шифрование базы данных не поддерживается на этой платформе';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Right now there are $count users blocked.';
  }

  @override
  String goToSpace(Object space) {
    return 'Перейти к пространству: $space';
  }

  @override
  String get markAsUnread => 'Отметить как непрочитанное';

  @override
  String userLevel(int level) {
    return '$level - Пользователь';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Модератор';
  }

  @override
  String adminLevel(int level) {
    return '$level - Администратор';
  }

  @override
  String get changeGeneralChatSettings => 'Изменить общие настройки чата';

  @override
  String get inviteOtherUsers => 'Пригласить других пользователей в этот чат';

  @override
  String get changeTheChatPermissions => 'Изменить права доступа к чату';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Изменить видимость истории чата';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Изменить основной общедоступный адрес чата';

  @override
  String get sendRoomNotifications => 'Упоминать @room';

  @override
  String get changeTheDescriptionOfTheGroup => 'Изменить описание чата';

  @override
  String get chatPermissionsDescription =>
      'Задайте уровень власти, необходимый для совершения определённых действий в этом чате. Уровни власти 0, 50 и 100 обычно означают пользователей, модераторов и администраторов соответственно, но любая градация также возможна.';

  @override
  String updateInstalled(String version) {
    return '🎉 Обновление $version успешно установлено!';
  }

  @override
  String get changelog => 'Список изменений';

  @override
  String updateAvailable(String version) {
    return 'Update $version available';
  }

  @override
  String get download => 'Download';

  @override
  String get sendCanceled => 'Отправка отменена';

  @override
  String get loginWithREChainId => 'Login with REChain-ID';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Этот домашний сервер выглядит несовместимым. Нет ли в ссылке опечаток?';

  @override
  String get calculatingFileSize => 'Вычисление размера файла...';

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Одно из ваших устройств не подтверждено';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Примечание: Если вы подключите все свои устройства к резервному копированию чатов, то они автоматически станут подтверждёнными.';

  @override
  String get continueText => 'Продолжить';

  @override
  String get blur => 'Размытие:';

  @override
  String get opacity => 'Прозрачность:';

  @override
  String get setWallpaper => 'Установить обои';

  @override
  String get manageAccount => 'Управление аккаунтом';

  @override
  String get noContactInformationProvided =>
      'Сервер не предоставляет никакой правдивой контактной информации';

  @override
  String get contactServerAdmin => 'Админ сервера';

  @override
  String get contactServerSecurity => 'Безопасность контактов сервера';

  @override
  String get supportPage => 'Поддержка';

  @override
  String get serverInformation => 'Информация о сервере:';

  @override
  String get name => 'Имя';

  @override
  String get version => 'Версия';

  @override
  String get website => 'Сайт';

  @override
  String get compress => 'Сжатие';

  @override
  String get boldText => 'Жирный шрифт';

  @override
  String get italicText => 'Italic';

  @override
  String get strikeThrough => 'Перечёркнутый';

  @override
  String get pleaseFillOut => 'Пожалуйста, заполните';

  @override
  String get invalidUrl => 'Не верный URL';

  @override
  String get addLink => 'Добавить ссылку';

  @override
  String get unableToJoinChat =>
      'Невозможно присоединиться к чату. Возможно, другая сторона уже закончила разговор.';

  @override
  String get previous => 'Предыдущий';

  @override
  String get otherPartyNotLoggedIn =>
      'Другая сторона в настоящее время не вошла в систему и поэтому не может получать сообщения!';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Использовать \'$server\' для входа';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Вы позволяете приложению и веб-сайту делиться информацией о вас.';

  @override
  String get open => 'Открыть';

  @override
  String get waitingForServer => 'Ожидание сервера...';

  @override
  String get newChatRequest => '📩 Запрос нового чата';

  @override
  String get contentNotificationSettings => 'Настройки уведомлений по тексту';

  @override
  String get generalNotificationSettings => 'Общие настройки уведомлений';

  @override
  String get roomNotificationSettings => 'Настройки уведомлений комнаты';

  @override
  String get userSpecificNotificationSettings =>
      'Настроки уведомлений пользователя';

  @override
  String get otherNotificationSettings => 'Другие настройки уведомлений';

  @override
  String get notificationRuleContainsUserName => 'Содержит имя пользователя';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Уведомляет пользователя, когда сообщение содержит его имя пользователя.';

  @override
  String get notificationRuleMaster => 'Отключить все уведомления';

  @override
  String get notificationRuleMasterDescription =>
      'Перекрывает все другие правила и отключает все уведомления.';

  @override
  String get notificationRuleSuppressNotices =>
      'Отключить автоматические сообщения';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Отключить уведомления от автоматизированных клиентов, таких как боты.';

  @override
  String get notificationRuleInviteForMe => 'Приглашение для меня';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Уведомляет пользователя, когда его приглашают в комнату.';

  @override
  String get notificationRuleMemberEvent => 'Мероприятие участника';

  @override
  String get notificationRuleMemberEventDescription =>
      'Отключить уведомления о событиях о членстве.';

  @override
  String get notificationRuleIsUserMention => 'Упоминание пользователя';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Уведомляет пользователя, когда он упоминается непосредственно в сообщении.';

  @override
  String get notificationRuleContainsDisplayName => 'Содержит отображаемое имя';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Уведомляет пользователя, когда сообщение содержит его имя отображения.';

  @override
  String get notificationRuleIsRoomMention => 'Упоминание комнаты';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Уведомляет пользователя о наличии упоминания о комнате.';

  @override
  String get notificationRuleRoomnotif => 'Уведомление о комнате';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Уведомляет пользователя, когда сообщение содержит \'@room\'.';

  @override
  String get notificationRuleTombstone => 'Надгробный камень';

  @override
  String get notificationRuleTombstoneDescription =>
      'Уведомляет пользователя о сообщениях о деактивации комнаты.';

  @override
  String get notificationRuleReaction => 'Реакция';

  @override
  String get notificationRuleReactionDescription =>
      'Отключить уведомления о реакциях.';

  @override
  String get notificationRuleRoomServerAcl => 'ACL сервера комнаты';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Удаляет уведомления о списках контроля доступа к серверу комнат (ACL).';

  @override
  String get notificationRuleSuppressEdits => 'Подавление правки';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Отключить уведомления о отредактированных сообщениях.';

  @override
  String get notificationRuleCall => 'Звонок';

  @override
  String get notificationRuleCallDescription =>
      'Уведомляет пользователя про звонки.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'Шифрованная комната «Один на один»';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Уведомляет пользователя про сообщение в зашифрованных комнатах «Один на один».';

  @override
  String get notificationRuleRoomOneToOne => 'Комната «Один на один»';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Уведомляет пользователя о сообщениях в разделах один на один.';

  @override
  String get notificationRuleMessage => 'Сообщение';

  @override
  String get notificationRuleMessageDescription =>
      'Уведомляет пользователя об общих сообщениях.';

  @override
  String get notificationRuleEncrypted => 'Зашифровано';

  @override
  String get notificationRuleEncryptedDescription =>
      'Уведомляет пользователя о сообщениях в зашифрованных комнатах.';

  @override
  String get notificationRuleJitsi => 'Джици';

  @override
  String get notificationRuleJitsiDescription =>
      'Уведомляет пользователя о событиях виджета Jitsi.';

  @override
  String get notificationRuleServerAcl => 'Запретить события ACL сервера';

  @override
  String get notificationRuleServerAclDescription =>
      'Удаляет уведомления о событиях ACL сервера.';

  @override
  String unknownPushRule(String rule) {
    return 'Неизвестное правило оповещения \'$rule\'';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return '️🎙️ $duration - Голосовое сообщение от $sender';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Если вы удалите эту настройку уведомлений, это невозможно отменить.';

  @override
  String get more => 'Больше';

  @override
  String get shareKeysWith => 'Поделиться ключами с...';

  @override
  String get shareKeysWithDescription =>
      'Каким устройствам следует доверять, чтобы они могли читать ваши сообщения в зашифрованных чатах?';

  @override
  String get allDevices => 'Все устройства';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Если включено, перекрестите проверенные устройства';

  @override
  String get crossVerifiedDevices => 'Кросс-верифицированные устройства';

  @override
  String get verifiedDevicesOnly => 'Только проверенные устройства';

  @override
  String get takeAPhoto => 'Снять фото';

  @override
  String get recordAVideo => 'Записать видео';

  @override
  String get optionalMessage => '(Необязательно) сообщение...';

  @override
  String get notSupportedOnThisDevice => 'Не поддерживается на этом устройстве';

  @override
  String get enterNewChat => 'Введите новый чат';

  @override
  String get approve => 'Утверждать';

  @override
  String get youHaveKnocked => 'Вы постучали';

  @override
  String get pleaseWaitUntilInvited =>
      'Пожалуйста, подождите, пока кто-нибудь из комнаты не пригласит вас.';

  @override
  String get commandHint_logout => 'Выйти из текущего устройства';

  @override
  String get commandHint_logoutall => 'Выйти из всех активных устройств';

  @override
  String get displayNavigationRail =>
      'Показать навигационный рельс на мобильном устройстве';

  @override
  String get customReaction => 'Пользовательская реакция';

  @override
  String get moreEvents => 'Больше событий';

  @override
  String get showMore => 'Show more';

  @override
  String get showLess => 'Show less';

  @override
  String get declineInvitation => 'Отказаться от приглашения';

  @override
  String get noMessagesYet => 'Пока нет сообщений';

  @override
  String get longPressToRecordVoiceMessage =>
      'Нажмите длиннее, чтобы записать голосовое сообщение.';

  @override
  String get pause => 'Пауза';

  @override
  String get resume => 'Резюмировать';

  @override
  String get removeFromSpaceDescription =>
      'Чат будет удален из пространства, но все равно появится в вашем списке чатов.';

  @override
  String countChats(int chats) {
    return '$chats чатов';
  }

  @override
  String spaceMemberOf(String spaces) {
    return 'Участник пространства из $spaces';
  }

  @override
  String spaceMemberOfCanKnock(String spaces) {
    return 'Участник пространства из $spaces может постучать';
  }

  @override
  String get startPoll => 'Начать опрос';

  @override
  String get endPoll => 'Завершить опрос';

  @override
  String get answersVisible => 'Ответы видны';

  @override
  String get pollQuestion => 'Вопрос по опросу';

  @override
  String get answerOption => 'Вариант ответа';

  @override
  String get addAnswerOption => 'Добавить вариант ответа';

  @override
  String get allowMultipleAnswers => 'Разрешить несколько ответов';

  @override
  String get pollHasBeenEnded => 'Опрос завершен';

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
      'Ответы будут видны после завершения опроса';

  @override
  String get replyInThread => 'Ответить в потоке';

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
  String get thread => 'Нить';

  @override
  String get backToMainChat => 'Вернуться в основной чат';

  @override
  String get saveChanges => 'Сохранить изменения';

  @override
  String get createSticker => 'Создать стикер или эмоджи';

  @override
  String get useAsSticker => 'Использовать как стикер';

  @override
  String get useAsEmoji => 'Использовать в качестве эмоджи';

  @override
  String get stickerPackNameAlreadyExists =>
      'Имя набора стикеров уже существует';

  @override
  String get newStickerPack => 'Новая упаковка стикеров';

  @override
  String get stickerPackName => 'Имя упаковки стикеров';

  @override
  String get attribution => 'Атрибуция';

  @override
  String get skipChatBackup => 'Пропустить резервную копию чата';

  @override
  String get skipChatBackupWarning =>
      'Вы уверены? Без включения резервного копирования чата вы можете потерять доступ к своим сообщениям, если переключите устройство.';

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
  String get loadingMessages => 'Загрузка сообщений';

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
      'Обратите внимание, что видеозвонки в настоящее время находятся в бета-версии. Они могут работать не так, как ожидалось, или вообще не работать на всех платформах.';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get incomingCall => 'Incoming call';

  @override
  String get videoCall => 'Видеозвонок';

  @override
  String get voiceCall => 'Голосовой звонок';

  @override
  String get missedCall => 'Missed call';

  @override
  String get callBack => 'Call back';

  @override
  String get hangUp => 'Hang up';

  @override
  String get waitingForParticipant => 'Waiting for participant...';

  @override
  String get decline => 'Отклонить';

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
