// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class L10nRu extends L10n {
  L10nRu([String locale = 'ru']) : super(locale);

  @override
  String get alwaysUse24HourFormat => '';

  @override
  String get repeatPassword => 'Повторите пароль';

  @override
  String get notAnImage => 'Это не картинка.';

  @override
  String get setCustomPermissionLevel =>
      'Установить уровень пользовательских разрешений';

  @override
  String get setPermissionsLevelDescription =>
      'Please choose a predefined role below or enter a custom permission level between 0 and 100.';

  @override
  String get ignoreUser => 'Ignore user';

  @override
  String get normalUser => 'Normal user';

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
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username активировал(а) сквозное шифрование';
  }

  @override
  String get addEmail => 'Добавить электронную почту';

  @override
  String get confirmMatrixId =>
      'Пожалуйста, подтвердите REChain ID, чтобы удалить свою учётную запись.';

  @override
  String supposedMxid(String mxid) {
    return 'Это должно быть $mxid';
  }

  @override
  String get addChatDescription => 'Добавить описание чата...';

  @override
  String get addToSpace => 'Добавить в пространство';

  @override
  String get admin => 'Администратор';

  @override
  String get alias => 'псевдоним';

  @override
  String get all => 'Все';

  @override
  String get allChats => 'Все чаты';

  @override
  String get commandHint_roomupgrade =>
      'Upgrade this room to the given room version';

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
    return '$senderName улыбнулся(-ась) Вам';
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
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'Домашний сервер поддерживает следующие типы входа в систему:\n$serverVersions\nНо это приложение поддерживает только:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications =>
      'Отправлять уведомления о наборе текста';

  @override
  String get swipeRightToLeftToReply => 'Для ответа проведите с права на лево';

  @override
  String get sendOnEnter => 'Отправлять по Enter';

  @override
  String badServerVersionsException(
      String serverVersions,
      String supportedVersions,
      Object serverVerions,
      Object supoortedVersions,
      Object suportedVersions) {
    return 'Домашний сервер поддерживает следующие версии спецификации:\n$serverVersions\nНо это приложение поддерживает только $supportedVersions';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats чатов и $participants участников';
  }

  @override
  String get noMoreChatsFound => 'Больше чатов не обнаружено...';

  @override
  String get noChatsFoundHere =>
      'Не было найдено ни одного чата. Начать с кем-нибудь новый чат можно, нажав кнопку ниже. ⤵️';

  @override
  String get joinedChats => 'Вступленные чаты';

  @override
  String get unread => 'Непрочитанные';

  @override
  String get space => 'Пространство';

  @override
  String get spaces => 'Пространства';

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
  String get botMessages => 'Сообщения ботов';

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
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username изменил(а) описание чата на: \'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username изменил(а) имя чата на: \'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username изменил(а) права доступа к чату';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username изменил(а) отображаемое имя на: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username изменил(а) правила гостевого доступа';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username изменил(а) правила гостевого доступа на: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username изменил(а) видимость истории';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username изменил(а) видимость истории на: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username изменил(а) правила присоединения';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username изменил(а) правила присоединения на: $joinRules';
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
  String get yourChatBackupHasBeenSetUp =>
      'Резервное копирование чата настроено.';

  @override
  String get chatBackup => 'Резервное копирование чата';

  @override
  String get chatBackupDescription =>
      'Резервная старых сообщений защищена ключом восстановления. Пожалуйста, не потеряйте его.';

  @override
  String get chatDetails => 'Детали чата';

  @override
  String get chatHasBeenAddedToThisSpace =>
      'Чат был добавлен в это пространство';

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
  String get confirm => 'Подтвердить';

  @override
  String get connect => 'Присоединиться';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Контакт был приглашен в группу';

  @override
  String get containsDisplayName => 'Содержит отображаемое имя';

  @override
  String get containsUserName => 'Содержит имя пользователя';

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
  String get checkList => 'Check list';

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
  String dateWithoutYear(String month, String day) {
    return '$day-$month';
  }

  @override
  String dateWithYear(String year, String month, String day) {
    return '$day-$month-$year';
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
  String get device => 'Устройство';

  @override
  String get deviceId => 'Идентификатор устройства';

  @override
  String get devices => 'Устройства';

  @override
  String get directChats => 'Личные чаты';

  @override
  String get allRooms => 'Все группы';

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
  String get emotePacks => 'Наборы эмодзи для комнаты';

  @override
  String get emoteSettings => 'Настройки эмодзи';

  @override
  String get globalChatId => 'ID глобального чата';

  @override
  String get accessAndVisibility => 'Доступность и видимость';

  @override
  String get accessAndVisibilityDescription =>
      'Кому разрешено войти в этот чат и как этот чат может быть обнаружен.';

  @override
  String get calls => 'Звонки';

  @override
  String get customEmojisAndStickers => 'Пользовательские эмодзи и стикеры';

  @override
  String get customEmojisAndStickersBody =>
      'Добавить или поделиться пользовательскими эмодзи или стикерами, которые могут быть применены в любом чате.';

  @override
  String get emoteShortcode => 'Код эмодзи';

  @override
  String get emoteWarnNeedToPick =>
      'Вам нужно задать код эмодзи и изображение!';

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
  String get homeserver => 'Домашний сервер';

  @override
  String get enterYourHomeserver => 'Введите адрес вашего домашнего сервера';

  @override
  String errorObtainingLocation(String error) {
    return 'Ошибка получения местоположения: $error';
  }

  @override
  String get everythingReady => 'Всё готово!';

  @override
  String get extremeOffensive => 'Крайне оскорбительный';

  @override
  String get fileName => 'Имя файла';

  @override
  String get rechainonline => 'rechainonline';

  @override
  String get fontSize => 'Размер шрифта';

  @override
  String get forward => 'Переслать';

  @override
  String get fromJoining => 'С момента присоединения';

  @override
  String get fromTheInvitation => 'С момента приглашения';

  @override
  String get goToTheNewRoom => 'В новую комнату';

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
  String get hideRedactedEvents => 'Скрыть отредактированные события';

  @override
  String get hideRedactedMessages => 'Скрыть редактированные сообщения';

  @override
  String get hideRedactedMessagesBody =>
      'Если кто-то редактирует сообщение, оно будет скрыто в чате.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Скрыть неправильные или неизвестные форматы сообщения';

  @override
  String get howOffensiveIsThisContent =>
      'Насколько оскорбительным является этот контент?';

  @override
  String get id => 'ID';

  @override
  String get identity => 'Идентификация';

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
  String get inoffensive => 'Безобидный';

  @override
  String get inviteContact => 'Пригласить контакт';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return 'Вы хотите пригласить $contact в чат \"$groupName\"?';
  }

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
  String get inviteForMe => 'Приглашение для меня';

  @override
  String inviteText(String username, String link) {
    return '$username пригласил(а) вас в REChain. \n1. Посетите https://online.rechain.network и установите приложение \n2. Зарегистрируйтесь или войдите \n3. Откройте ссылку приглашения: \n $link';
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
  String get license => 'Лицензия';

  @override
  String get lightTheme => 'Светлая';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Загрузить еще $count участника(ов)';
  }

  @override
  String get dehydrate => 'Экспорт сеанса и очистка устройства';

  @override
  String get dehydrateWarning =>
      'Это действие не может быть отменено. Убедитесь, что вы безопасно сохранили файл резервной копии.';

  @override
  String get dehydrateTor => 'Пользователи TOR: Экспорт сеанса';

  @override
  String get dehydrateTorLong =>
      'Для пользователей TOR рекомендуется экспортировать сессию перед закрытием окна.';

  @override
  String get hydrateTor => 'Пользователи TOR: Импорт экспорта сессии';

  @override
  String get hydrateTorLong =>
      'В прошлый раз вы экспортировали свою сессию в TOR? Быстро импортируйте его и продолжайте общение.';

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
  String get memberChanges => 'Изменения участников';

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
  String get needPantalaimonWarning =>
      'Помните, что вам нужен Pantalaimon для использования сквозного шифрования.';

  @override
  String get newChat => 'Новый чат';

  @override
  String get newMessageInrechainonline => '💬 Новое сообщение во rechainonline';

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
  String get none => 'Ничего';

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
  String get notificationsEnabledForThisAccount =>
      'Уведомления включены для этой учётной записи';

  @override
  String numUsersTyping(int count) {
    return '$count пользователей печатают…';
  }

  @override
  String get obtainingLocation => 'Получение местоположения…';

  @override
  String get offensive => 'Оскорбительный';

  @override
  String get offline => 'Не в сети';

  @override
  String get ok => 'Ок';

  @override
  String get online => 'В сети';

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
  String get openVideoCamera => 'Открыть камеру для видео';

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
  String get enableMultiAccounts =>
      '(БЕТА) Включить несколько учетных записей на этом устройстве';

  @override
  String get openInMaps => 'Открыть на картах';

  @override
  String get link => 'Ссылка';

  @override
  String get serverRequiresEmail =>
      'Этот сервер должен подтвердить ваш адрес электронной почты для регистрации.';

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
  String get hideMemberChangesInPublicChats =>
      'Скрыть изменения участников в публичных чатах';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      'Для улучшения читаемости не показывать на временной шкале входы и выходы из чата.';

  @override
  String get overview => 'Обзор';

  @override
  String get notifyMeFor => 'Уведомлять меня о';

  @override
  String get passwordRecoverySettings => 'Настройки восстановления пароля';

  @override
  String get passwordRecovery => 'Восстановление пароля';

  @override
  String get people => 'Люди';

  @override
  String get pickImage => 'Выбрать изображение';

  @override
  String get pin => 'Закрепить';

  @override
  String play(String fileName) {
    return 'Проиграть $fileName';
  }

  @override
  String get pleaseChoose => 'Пожалуйста, выберите';

  @override
  String get pleaseChooseAPasscode => 'Пожалуйста, выберите код доступа';

  @override
  String get pleaseClickOnLink =>
      'Пожалуйста, нажмите на ссылку в электронной почте, для того чтобы продолжить.';

  @override
  String get pleaseEnter4Digits =>
      'Введите 4 цифры или оставьте поле пустым, чтобы отключить блокировку приложения.';

  @override
  String get pleaseEnterRecoveryKey => 'Введите ключ восстановления:';

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
  String get pushRules => 'Правила push';

  @override
  String get reason => 'Причина';

  @override
  String get recording => 'Запись';

  @override
  String redactedBy(String username) {
    return '$username отредактировал это событие';
  }

  @override
  String get directChat => 'Личный чат';

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
  String get register => 'Зарегистрироваться';

  @override
  String get reject => 'Отказать';

  @override
  String rejectedTheInvitation(String username) {
    return '$username отклонил(а) приглашение';
  }

  @override
  String get rejoin => 'Зайти повторно';

  @override
  String get removeAllOtherDevices => 'Удалить все другие устройства';

  @override
  String removedBy(String username) {
    return 'Удалено пользователем $username';
  }

  @override
  String get removeDevice => 'Удалить устройство';

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
  String get requestPermission => 'Запросить разрешение';

  @override
  String get roomHasBeenUpgraded => 'Комната обновлена';

  @override
  String get roomVersion => 'Версия комнаты';

  @override
  String get saveFile => 'Сохранить файл';

  @override
  String get search => 'Поиск';

  @override
  String get security => 'Безопасность';

  @override
  String get recoveryKey => 'Ключ восстановления';

  @override
  String get recoveryKeyLost => 'Ключ восстановления утерян?';

  @override
  String seenByUser(String username) {
    return 'Просмотрено пользователем $username';
  }

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
    return 'Отправить $count изображений';
  }

  @override
  String get sendMessages => 'Отправить сообщения';

  @override
  String get sendOriginal => 'Отправить оригинал';

  @override
  String get sendSticker => 'Отправить стикер';

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
  String get separateChatTypes => 'Разделять личные чаты и группы';

  @override
  String get setAsCanonicalAlias => 'Установить как основной псевдоним';

  @override
  String get setCustomEmotes => 'Установить пользовательские эмодзи';

  @override
  String get setChatDescription => 'Установить описание чата';

  @override
  String get setInvitationLink => 'Установить ссылку для приглашения';

  @override
  String get setPermissionsLevel => 'Установить уровень разрешений';

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
  String get showPassword => 'Показать пароль';

  @override
  String get presenceStyle => 'Представление:';

  @override
  String get presencesToggle =>
      'Показывать сообщения в статусах других пользователей';

  @override
  String get singlesignon => 'Единая точка входа';

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
  String get startFirstChat => 'Начните Ваш первый чат';

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
  String get title => 'rechainonline';

  @override
  String get toggleFavorite => 'Переключить избранное';

  @override
  String get toggleMuted => 'Переключить без звука';

  @override
  String get toggleUnread => 'Отметить как прочитанное/непрочитанное';

  @override
  String get tooManyRequestsWarning =>
      'Слишком много запросов. Пожалуйста, повторите попытку позже!';

  @override
  String get transferFromAnotherDevice => 'Перенос с другого устройства';

  @override
  String get tryToSendAgain => 'Попробуйте отправить ещё раз';

  @override
  String get unavailable => 'Недоступен';

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
  String unreadChats(int unreadCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount непрочитанных чата(ов)',
    );
    return '$_temp0';
  }

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username и $count других участников печатают…';
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
  String get username => 'Имя пользователя';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username отправил(а) событие типа \"$type\"';
  }

  @override
  String get unverified => 'Не проверено';

  @override
  String get verified => 'Проверено';

  @override
  String get verify => 'Проверить';

  @override
  String get verifyStart => 'Начать проверку';

  @override
  String get verifySuccess => 'Вы успешно проверены!';

  @override
  String get verifyTitle => 'Проверка другой учётной записи';

  @override
  String get videoCall => 'Видеозвонок';

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
  String get wallpaper => 'Обои:';

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
  String get wipeChatBackup =>
      'Удалить резервную копию чата, чтобы создать новый ключ восстановления?';

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
  String get youHaveBeenBannedFromThisChat =>
      'Вы были заблокированы в этом чате';

  @override
  String get yourPublicKey => 'Ваш открытый ключ';

  @override
  String get messageInfo => 'Информация о сообщении';

  @override
  String get time => 'Время';

  @override
  String get messageType => 'Тип сообщения';

  @override
  String get sender => 'Отправитель';

  @override
  String get openGallery => 'Открыть галерею';

  @override
  String get removeFromSpace => 'Удалить из пространства';

  @override
  String get addToSpaceDescription =>
      'Выберите пространство, чтобы добавить к нему этот чат.';

  @override
  String get start => 'Начать';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'Чтобы разблокировать старые сообщения, введите ключ восстановления, сгенерированный в предыдущем сеансе. Ваш ключ восстановления НЕ является вашим паролем.';

  @override
  String get publish => 'Опубликовать';

  @override
  String videoWithSize(String size) {
    return 'Видео ($size)';
  }

  @override
  String get openChat => 'Открыть чат';

  @override
  String get markAsRead => 'Отметить как прочитанное';

  @override
  String get reportUser => 'Сообщить о пользователе';

  @override
  String get dismiss => 'Отклонить';

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
  String get placeCall => 'Совершить звонок';

  @override
  String get voiceCall => 'Голосовой звонок';

  @override
  String get unsupportedAndroidVersion => 'Неподдерживаемая версия Android';

  @override
  String get unsupportedAndroidVersionLong =>
      'Для этой функции требуется более новая версия Android. Проверьте наличие обновлений или поддержку Mobile Katya OS.';

  @override
  String get videoCallsBetaWarning =>
      'Обратите внимание, что видеозвонки в настоящее время находятся в бета-версии. Они могут работать не так, как ожидалось, или вообще не работать на всех платформах.';

  @override
  String get experimentalVideoCalls => 'Экспериментальные видеозвонки';

  @override
  String get emailOrUsername => 'Адрес электронной почты или имя пользователя';

  @override
  String get indexedDbErrorTitle => 'Проблемы с приватным режимом';

  @override
  String get indexedDbErrorLong =>
      'К сожалению, по умолчанию хранилище сообщений не включено в приватном режиме.\nПожалуйста, посетите\n- about:config\n- установите для dom.indexedDB.privateBrowsing.enabled значение true\nВ противном случае запуск REChain будет невозможен.';

  @override
  String switchToAccount(String number) {
    return 'Переключиться на учётную запись $number';
  }

  @override
  String get nextAccount => 'Следующая учётная запись';

  @override
  String get previousAccount => 'Предыдущая учётная запись';

  @override
  String get addWidget => 'Добавить виджет';

  @override
  String get widgetVideo => 'Видео';

  @override
  String get widgetEtherpad => 'Текстовая записка';

  @override
  String get widgetJitsi => 'Совещание Jitsi';

  @override
  String get widgetCustom => 'Пользовательский';

  @override
  String get widgetName => 'Имя';

  @override
  String get widgetUrlError => 'Этот URL не действителен.';

  @override
  String get widgetNameError => 'Пожалуйста, укажите отображаемое имя.';

  @override
  String get errorAddingWidget => 'Ошибка при добавлении виджета.';

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
  String youInvitedToBy(String alias) {
    return '📩 Вы были приглашены по ссылке на:\n$alias';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 Вы были приглашены $user';
  }

  @override
  String invitedBy(String user) {
    return '📩 Приглашен(а) $user';
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
  String userWouldLikeToChangeTheChat(String user) {
    return '$user желает присоединиться к чату.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'Публичная ссылка еще не была создана';

  @override
  String get knock => 'Постучаться';

  @override
  String get users => 'Пользователи';

  @override
  String get unlockOldMessages => 'Разблокировать старые сообщения';

  @override
  String get storeInSecureStorageDescription =>
      'Сохраните ключ восстановления в безопасном хранилище этого устройства.';

  @override
  String get saveKeyManuallyDescription =>
      'Сохраните этот ключ вручную, вызвав диалог общего доступа системы или буфера обмена.';

  @override
  String get storeInAndroidKeystore => 'Сохранить в Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Сохранить в Apple KeyChain';

  @override
  String get storeSecurlyOnThisDevice => 'Сохранить на этом устройстве';

  @override
  String countFiles(int count) {
    return '$count файлов';
  }

  @override
  String get user => 'Пользователь';

  @override
  String get custom => 'Пользовательское';

  @override
  String get foregroundServiceRunning =>
      'Это уведомление появляется, когда запущена основная служба.';

  @override
  String get screenSharingTitle => 'общий доступ к экрану';

  @override
  String get screenSharingDetail => 'Вы делитесь своим экраном в FuffyChat';

  @override
  String get callingPermissions => 'Разрешения на звонки';

  @override
  String get callingAccount => 'Аккаунт для звонков';

  @override
  String get callingAccountDetails =>
      'Позволяет REChain использовать родное android приложение для звонков.';

  @override
  String get appearOnTop => 'Появляться сверху';

  @override
  String get appearOnTopDetails =>
      'Позволяет приложению отображаться сверху (не требуется, если у вас уже настроен REChain как аккаунт для звонков)';

  @override
  String get otherCallingPermissions =>
      'Микрофон, камера и другие разрешения rechainonline';

  @override
  String get whyIsThisMessageEncrypted => 'Почему это сообщение нечитаемо?';

  @override
  String get noKeyForThisMessage =>
      'Это может произойти, если сообщение было отправлено до того, как вы вошли в свою учетную запись на данном устройстве.\n\nТакже возможно, что отправитель заблокировал ваше устройство или что-то пошло не так с интернет-соединением.\n\nВы можете прочитать сообщение на другой сессии? Тогда вы можете перенести сообщение с неё! Перейдите в Настройки > Устройства и убедитесь, что ваши устройства проверили друг друга. Когда вы откроете комнату в следующий раз и обе сессии будут открыты, ключи будут переданы автоматически.\n\nВы не хотите потерять ключи при выходе из системы или переключении устройств? Убедитесь, что вы включили резервное копирование чата в настройках.';

  @override
  String get newGroup => 'Новая группа';

  @override
  String get newSpace => 'Новое пространство';

  @override
  String get enterSpace => 'Войти в пространство';

  @override
  String get enterRoom => 'Войти в комнату';

  @override
  String get allSpaces => 'Все пространства';

  @override
  String numChats(String number) {
    return '$number чатов';
  }

  @override
  String get hideUnimportantStateEvents =>
      'Скрыть необязательные события статуса';

  @override
  String get hidePresences => 'Скрыть список статусов?';

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
  String get deviceKeys => 'Ключи устройств:';

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
  String get signInWithPassword => 'Войти с помощью пароля';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Повторите попытку позже или выберите другой сервер.';

  @override
  String signInWith(String provider) {
    return 'Войти с $provider';
  }

  @override
  String get profileNotFound =>
      'Пользователь не найден на сервере. Это может быть проблемой подключения или пользователь не существует.';

  @override
  String get setTheme => 'Тема:';

  @override
  String get setColorTheme => 'Цветовая тема:';

  @override
  String get invite => 'Пригласить';

  @override
  String get inviteGroupChat => '📨 Пригласить в групповой чат';

  @override
  String get invitePrivateChat => '📨 Пригласить в приватный чат';

  @override
  String get invalidInput => 'Недопустимый ввод!';

  @override
  String wrongPinEntered(int seconds) {
    return 'Введён неверный пин-код! Повторите попытку через $seconds секунд...';
  }

  @override
  String get pleaseEnterANumber => 'Пожалуйста введите число больше 0';

  @override
  String get archiveRoomDescription =>
      'Чат переместится в архив. Другим пользователям будет видно, что вы вышли из чата.';

  @override
  String get roomUpgradeDescription =>
      'Затем чат будет воссоздан с новой версией комнаты. Все участники будут уведомлены о необходимости перейти в новый чат. Вы можете узнать больше о версиях комнат на https://github.com/sorydima/REChain-/tree/main/matrix_bridge_setup_bundle';

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
  String get startConversation => 'Начать общение';

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
  String get publicLink => 'Публичная ссылка';

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
  String get subspace => 'Субпространство';

  @override
  String get decline => 'Отклонить';

  @override
  String get thisDevice => 'Данное устройство:';

  @override
  String get initAppError => 'Произошла ошибка при запуске приложения';

  @override
  String get userRole => 'Роль пользователя';

  @override
  String minimumPowerLevel(String level) {
    return '$level является минимальным уровнем.';
  }

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
  String databaseBuildErrorBody(String url, String error) {
    return 'Невозможно собрать базу данных SQlite. Приложение пытается использовать старую базу данных. Пожалуйста, сообщите об этой ошибке разработчикам по адресу $url. Сообщение об ошибке: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'Ваш сеанс утерян. Пожалуйста, сообщите об этой ошибке разработчикам по адресу $url. Сообщение об ошибке: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Приложение пытается восстановить сеанс из резервной копии. Пожалуйста, сообщите об этой ошибке разработчикам по адресу $url. Сообщение об ошибке: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'Переслать сообщение в $roomName?';
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
  String get transparent => 'Прозрачный';

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
    return '$appname: $unread непрочитанные чаты';
  }

  @override
  String get noDatabaseEncryption =>
      'Шифрование базы данных не поддерживается на этой платформе';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Сейчас заблокировано $count пользователей.';
  }

  @override
  String get restricted => 'Запрещено';

  @override
  String get knockRestricted => 'Стук запрещен';

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
  String get sendCanceled => 'Отправка отменена';

  @override
  String get loginWithMatrixId => 'Войти через REChain ID';

  @override
  String get discoverHomeservers => 'Список домашних серверов';

  @override
  String get whatIsAHomeserver => 'Для чего нужен домашний сервер?';

  @override
  String get homeserverDescription =>
      'Все ваши данные хранятся на домашнем сервере, прямо как у вашего провайдера электронной почты. Вы можете выбрать, какому серверу вы их доверите, при этом сохраняя возможность общаться со всеми. Узнайте больше на https://rechain.network.';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Этот домашний сервер выглядит несовместимым. Нет ли в ссылке опечаток?';

  @override
  String get calculatingFileSize => 'Вычисление размера файла...';

  @override
  String get prepareSendingAttachment => 'Подготовка к отправке вложения...';

  @override
  String get sendingAttachment => 'Отправка вложения...';

  @override
  String get generatingVideoThumbnail => 'Создание превью видео...';

  @override
  String get compressVideo => 'Сжатие видео...';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return 'Отправляю... $index $length...';
  }

  @override
  String serverLimitReached(int seconds) {
    return 'Ограничения сервера. Ожидайте$seconds секунд...';
  }

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Одно из ваших устройств не подтверждено';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Примечание: Если вы подключите все свои устройства к резервному копированию чатов, то они автоматически станут подтверждёнными.';

  @override
  String get continueText => 'Продолжить';

  @override
  String get welcomeText =>
      'Привет. Это REChain. Вы можете подписаться на любой сервер, который совместим с https://rechain.network. А потом поболтать с кем нибудь. Это огромная децентрализованная сеть обмена сообщениями!';

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
  String get appIntroduction =>
      'REChain позволяет вам общаться с друзьями с разными мессенджерами. Узнайте больше на https://rechain.network или просто нажмите *Продолжить*.';

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
      'Уведомляет пользователя когда сообщение содержит его имя пользователя.';

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
      'Notifies the user when they are invited to a room.';

  @override
  String get notificationRuleMemberEvent => 'Member Event';

  @override
  String get notificationRuleMemberEventDescription =>
      'Отключить уведомления о событиях о членстве.';

  @override
  String get notificationRuleIsUserMention => 'Упоминание пользователя';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Notifies the user when they are directly mentioned in a message.';

  @override
  String get notificationRuleContainsDisplayName => 'Содержит отображаемое имя';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Notifies the user when a message contains their display name.';

  @override
  String get notificationRuleIsRoomMention => 'Упоминание комнаты';

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
  String get notificationRuleReaction => 'Реакция';

  @override
  String get notificationRuleReactionDescription =>
      'Отключить уведомления о реакциях.';

  @override
  String get notificationRuleRoomServerAcl => 'Room Server ACL';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Suppresses notifications for room server access control lists (ACL).';

  @override
  String get notificationRuleSuppressEdits => 'Suppress Edits';

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
      'Notifies the user about messages in one-to-one rooms.';

  @override
  String get notificationRuleMessage => 'Сообщение';

  @override
  String get notificationRuleMessageDescription =>
      'Notifies the user about general messages.';

  @override
  String get notificationRuleEncrypted => 'Зашифровано';

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
  String get more => 'Больше';

  @override
  String get shareKeysWith => 'Share keys with...';

  @override
  String get shareKeysWithDescription =>
      'Which devices should be trusted so that they can read along your messages in encrypted chats?';

  @override
  String get allDevices => 'Все устройства';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Cross verified devices if enabled';

  @override
  String get crossVerifiedDevices => 'Cross verified devices';

  @override
  String get verifiedDevicesOnly => 'Verified devices only';

  @override
  String get takeAPhoto => 'Снять фото';

  @override
  String get recordAVideo => 'Записать видео';

  @override
  String get optionalMessage => '(Optional) message...';

  @override
  String get notSupportedOnThisDevice => 'Not supported on this device';

  @override
  String get enterNewChat => 'Введите новый чат';

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
