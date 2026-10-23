// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class L10nUk extends L10n {
  L10nUk([String locale = 'uk']) : super(locale);

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
  String get repeatPassword => 'Повторіть пароль';

  @override
  String get notAnImage => 'Не файл зображення.';

  @override
  String get remove => 'Вилучити';

  @override
  String get importNow => 'Імпортувати зараз';

  @override
  String get importEmojis => 'Імпорт емодзі';

  @override
  String get importFromZipFile => 'Імпорт з файлу .zip';

  @override
  String get exportEmotePack => 'Експортувати набір смайликів у форматі .zip';

  @override
  String get replace => 'Замінити';

  @override
  String get about => 'Про застосунок';

  @override
  String aboutHomeserver(String homeserver) {
    return 'Про $homeserver';
  }

  @override
  String get accept => 'Прийняти';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username приймає запрошення';
  }

  @override
  String get account => 'Обліковий запис';

  @override
  String get accountsAndSettings => 'Accounts and settings';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username активує наскрізне шифрування';
  }

  @override
  String get addEmail => 'Додати е-пошту';

  @override
  String get confirmREChainId =>
      'Please confirm your REChain ID in order to delete your account.';

  @override
  String supposedMxid(String mxid) {
    return 'Це має бути $mxid';
  }

  @override
  String get addToSpace => 'Додати простір';

  @override
  String get admin => 'Адміністратор';

  @override
  String get alias => 'псевдонім';

  @override
  String get all => 'Усі';

  @override
  String get commandHint_roomupgrade =>
      'Оновити цю кімнату до версії даної кімнати';

  @override
  String get commandHint_googly => 'Надіслати кілька гугл-очей';

  @override
  String get commandHint_cuddle => 'Надіслати пригортайку';

  @override
  String get commandHint_hug => 'Надіслати обійми';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName надсилає вам гугл-очі';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName пригортається до вас';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName обіймає вас';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName відповідає на виклик';
  }

  @override
  String get anyoneCanJoin => 'Будь-хто може приєднатись';

  @override
  String get appLock => 'Блокування застосунку';

  @override
  String get appLockDescription =>
      'Блокувати застосунок, коли не використовується ПІН-код';

  @override
  String get archive => 'Архів';

  @override
  String get areGuestsAllowedToJoin => 'Чи дозволено гостям приєднуватись';

  @override
  String get areYouSure => 'Ви впевнені?';

  @override
  String get discardEdits => 'You have unsaved changes. Discard your edits?';

  @override
  String get areYouSureYouWantToLogout => 'Ви впевнені, що хочете вийти?';

  @override
  String get askSSSSSign =>
      'Для підпису ключа іншого користувача введіть свою парольну фразу або ключ відновлення.';

  @override
  String askVerificationRequest(String username) {
    return 'Прийняти цей запит на підтвердження від $username?';
  }

  @override
  String get autoplayImages =>
      'Автоматично відтворювати анімовані наліпки та емодзі';

  @override
  String badServerLoginTypesException(
    String serverVersions,
    String supportedVersions,
    Object suportedVersions,
  ) {
    return 'Домашній сервер підтримує такі типи входу:\n$serverVersions\nАле цей застосунок підтримує лише:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Надсилати сповіщення про ввід тексту';

  @override
  String get swipeRightToLeftToReply =>
      'Посунути праворуч або ліворуч, щоб відповісти';

  @override
  String get sendOnEnter => 'Надсилати натисканням Enter';

  @override
  String get noMoreChatsFound => 'Більше чатів не знайдено...';

  @override
  String get noChatsFoundHere =>
      'Бесід ще немає. Розпочніть спілкування натиснувши кнопку нижче. ⤵️';

  @override
  String get unread => 'Непрочитані';

  @override
  String get space => 'Простір';

  @override
  String get banFromChat => 'Заблокувати в бесіді';

  @override
  String get banned => 'Заблоковано';

  @override
  String bannedUser(String username, String targetName) {
    return '$username блокує $targetName';
  }

  @override
  String get blockDevice => 'Заблокувати пристрій';

  @override
  String get blocked => 'Заблоковано';

  @override
  String get cancel => 'Скасувати';

  @override
  String cantOpenUri(String uri) {
    return 'Не вдалося відкрити URI $uri';
  }

  @override
  String get changeDeviceName => 'Змінити назву пристрою';

  @override
  String changedTheChatAvatar(String username) {
    return '$username змінює аватар бесіди';
  }

  @override
  String changedTheChatDescription(Object username) {
    return '$username змінює опис бесіди';
  }

  @override
  String changedTheChatName(Object username) {
    return '$username змінює назву бесіди';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username змінює права доступу бесіди';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username змінює показуване ім\'я на: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username змінює правила гостьового доступу';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username змінює правила гостьового доступу на: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username змінює видимість історії';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username змінює видимість історії на: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username змінює правила приєднання';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username змінює правила приєднання на: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username змінює аватар';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username змінює псевдоніми кімнати';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username змінює посилання для запрошення';
  }

  @override
  String get changePassword => 'Змінити пароль';

  @override
  String get changeTheHomeserver => 'Змінити домашній сервер';

  @override
  String get changeTheme => 'Змінити стиль';

  @override
  String get changeTheNameOfTheGroup => 'Змінити назву групи';

  @override
  String get changeYourAvatar => 'Змінити аватар';

  @override
  String get channelCorruptedDecryptError => 'Шифрування було пошкоджено';

  @override
  String get chat => 'Бесіда';

  @override
  String get chatBackup => 'Резервне копіювання бесіди';

  @override
  String get chatDetails => 'Подробиці бесіди';

  @override
  String get chats => 'Бесіди';

  @override
  String get chooseAStrongPassword => 'Виберіть надійний пароль';

  @override
  String get clearArchive => 'Очистити архів';

  @override
  String get close => 'Закрити';

  @override
  String get commandHint_markasdm =>
      'Позначити кімнатою особистого спілкування для надання REChain ID';

  @override
  String get commandHint_markasgroup => 'Позначити групою';

  @override
  String get commandHint_ban => 'Заблокувати цього користувача кімнати';

  @override
  String get commandHint_clearcache => 'Очистити кеш';

  @override
  String get commandHint_create =>
      'Створіть порожню групову бесіду\nВикористовуйте --no-encryption, щоб вимкнути шифрування';

  @override
  String get commandHint_discardsession => 'Відкинути сеанс';

  @override
  String get commandHint_dm =>
      'Початок особистої бесіди\nВикористовуйте --no-encryption, що вимкнути шифрування';

  @override
  String get commandHint_html => 'Надіслати текст у форматі HTML';

  @override
  String get commandHint_invite =>
      'Запросіть цього користувача до цієї кімнати';

  @override
  String get commandHint_join => 'Приєднатися до цієї кімнати';

  @override
  String get commandHint_kick => 'Вилучити цього користувача з цієї кімнати';

  @override
  String get commandHint_leave => 'Вийти з цієї кімнати';

  @override
  String get commandHint_me => 'Опишіть себе';

  @override
  String get commandHint_myroomavatar =>
      'Встановіть зображення для цієї кімнати (від mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Укажіть показуване ім\'я для цієї кімнати';

  @override
  String get commandHint_op =>
      'Укажіть рівень повноважень цього користувача (типово: 50)';

  @override
  String get commandHint_plain => 'Надіслати неформатований текст';

  @override
  String get commandHint_react => 'Надіслати відповідь як реакцію';

  @override
  String get commandHint_send => 'Надіслати текст';

  @override
  String get commandHint_unban =>
      'Розблокувати цього користувача у цій кімнаті';

  @override
  String get commandInvalid => 'Неприпустима команда';

  @override
  String commandMissing(String command) {
    return '$command не є командою.';
  }

  @override
  String get compareEmojiMatch => 'Порівняйте емодзі';

  @override
  String get compareNumbersMatch => 'Порівняйте цифри';

  @override
  String get configureChat => 'Налаштувати бесіду';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Контакт був запрошений в групу';

  @override
  String get contentHasBeenReported =>
      'Скаргу на вміст надіслано адміністраторам сервера';

  @override
  String get copiedToClipboard => 'Скопійовано в буфер обміну';

  @override
  String get copy => 'Копіювати';

  @override
  String get copyToClipboard => 'Копіювати до буфера обміну';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Помилка розшифрування повідомлення: $error';
  }

  @override
  String get checkList => 'Контрольний список';

  @override
  String countParticipants(int count) {
    return 'Учасників: $count';
  }

  @override
  String countInvited(int count) {
    return 'Запрошено $count';
  }

  @override
  String get create => 'Створити';

  @override
  String createdTheChat(String username) {
    return '💬 $username створює бесіду';
  }

  @override
  String get createGroup => 'Створити групу';

  @override
  String get createNewSpace => 'Новий простір';

  @override
  String get currentlyActive => 'Зараз у мережі';

  @override
  String get darkTheme => 'Темний';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$timeOfDay, $date';
  }

  @override
  String get deactivateAccountWarning =>
      'Це деактивує ваш обліковий запис. Це неможливо скасувати! Ви впевнені?';

  @override
  String get defaultPermissionLevel =>
      'Типовий рівень дозволів для нових користувачів';

  @override
  String get delete => 'Видалити';

  @override
  String get deleteAccount => 'Видалити обліковий запис';

  @override
  String get deleteMessage => 'Видалити повідомлення';

  @override
  String get devices => 'Пристрої';

  @override
  String get directChats => 'Особисті бесіди';

  @override
  String get displaynameHasBeenChanged => 'Показуване ім\'я було змінено';

  @override
  String get downloadFile => 'Завантажити файл';

  @override
  String get edit => 'Редагувати';

  @override
  String get editBlockedServers => 'Редагувати заблоковані сервери';

  @override
  String get chatPermissions => 'Дозволи бесіди';

  @override
  String get editDisplayname => 'Змінити показуване ім\'я';

  @override
  String get editRoomAliases => 'Змінити псевдоніми кімнати';

  @override
  String get editRoomAvatar => 'Змінити аватар кімнати';

  @override
  String get emoteExists => 'Емодзі вже існує!';

  @override
  String get emoteInvalid => 'Неприпустимий короткий код емодзі!';

  @override
  String get emoteKeyboardNoRecents =>
      'Тут з\'являться нещодавно використані смайлики...';

  @override
  String get globalChatId => 'Глобальний ID бесіди';

  @override
  String get accessAndVisibility => 'Доступ і видимість';

  @override
  String get accessAndVisibilityDescription =>
      'Хто може приєднатися до цієї бесіди і як її можна знайти.';

  @override
  String get customEmojisAndStickers => 'Власні емодзі та наліпки';

  @override
  String get customEmojisAndStickersBody =>
      'Додавайте або діліться власними емодзі або наліпками, які можна використовувати в будь-якій бесіді.';

  @override
  String get emoteShortcode => 'Короткий код для емодзі';

  @override
  String get emptyChat => 'Порожня бесіда';

  @override
  String get enableEmotesGlobally => 'Увімкнути набір емодзі глобально';

  @override
  String get enableEncryption => 'Увімкнути шифрування';

  @override
  String get enableEncryptionWarning =>
      'Ви більше не зможете вимкнути шифрування. Ви впевнені?';

  @override
  String get encrypted => 'Зашифровано';

  @override
  String get encryption => 'Шифрування';

  @override
  String get encryptionNotEnabled => 'Шифрування вимкнено';

  @override
  String endedTheCall(String senderName) {
    return '$senderName завершує виклик';
  }

  @override
  String get enterAnEmailAddress => 'Введіть адресу е-пошти';

  @override
  String errorObtainingLocation(String error) {
    return 'Помилка під час отримання розташування: $error';
  }

  @override
  String get fontSize => 'Розмір шрифту';

  @override
  String get forward => 'Переслати';

  @override
  String get fromJoining => 'З моменту приєднання';

  @override
  String get fromTheInvitation => 'З моменту запрошення';

  @override
  String get group => 'Група';

  @override
  String get chatDescription => 'Опис бесіди';

  @override
  String get chatDescriptionHasBeenChanged => 'Опис бесіди змінено';

  @override
  String get groupIsPublic => 'Загальнодоступна група';

  @override
  String get groups => 'Групи';

  @override
  String groupWith(String displayname) {
    return 'Група з $displayname';
  }

  @override
  String get guestsAreForbidden => 'Гості не можуть приєднуватись';

  @override
  String get guestsCanJoin => 'Гості можуть приєднуватись';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username відкликає запрошення для $targetName';
  }

  @override
  String get help => 'Довідка';

  @override
  String get hideRedactedMessages => 'Сховати змінені повідомлення';

  @override
  String get hideRedactedMessagesBody =>
      'Якщо хтось змінить повідомлення, його більше не буде видно в бесіді.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Сховати недійсні або невідомі формати повідомлень';

  @override
  String get block => 'Заблокувати';

  @override
  String get blockedUsers => 'Заблоковані користувачі';

  @override
  String get blockListDescription =>
      'Ви можете заблокувати користувачів, які вас турбують. Ви не зможете отримувати жодних повідомлень або запрошень до кімнати від користувачів з вашого персонального списку блокування.';

  @override
  String get blockUsername => 'Ігнорувати ім\'я користувача';

  @override
  String get iHaveClickedOnLink => 'Мною виконано перехід за посиланням';

  @override
  String get incorrectPassphraseOrKey =>
      'Неправильна парольна фраза або ключ відновлення';

  @override
  String get inviteContact => 'Запросити контакт';

  @override
  String inviteContactToGroup(String groupName) {
    return 'Запросити контакт до $groupName';
  }

  @override
  String get noChatDescriptionYet => 'Опис бесіди ще не створено.';

  @override
  String get tryAgain => 'Повторіть спробу';

  @override
  String get invalidServerName => 'Недійсна назва сервера';

  @override
  String get invited => 'Запрошено';

  @override
  String get redactMessageDescription =>
      'Повідомлення буде відредаговано для всіх учасників цієї розмови. Це не можна скасувати.';

  @override
  String get optionalRedactReason =>
      '(Необов\'язково) Причина редагування цього повідомлення...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username запрошує $targetName';
  }

  @override
  String get invitedUsersOnly => 'Лише запрошені користувачі';

  @override
  String inviteText(String username, String link) {
    return '$username запрошує вас у REChain. \n1. Перейдіть на github.com/sorydima/REChain- й установіть застосунок \n2. Зареєструйтесь або ввійдіть \n3. Відкрийте запрошувальне посилання:\n $link';
  }

  @override
  String get isTyping => 'пише…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username приєднується до бесіди';
  }

  @override
  String get joinRoom => 'Приєднатися до кімнати';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username вилучає $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username вилучає та блокує $targetName';
  }

  @override
  String get kickFromChat => 'Вилучити з бесіди';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Остання активність: $localizedTimeShort';
  }

  @override
  String get leave => 'Вийти';

  @override
  String get leftTheChat => 'Виходить з бесіди';

  @override
  String get lightTheme => 'Світлий';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Завантажити ще $count учасників';
  }

  @override
  String get dehydrate => 'Експортувати сеанс та очистити пристрій';

  @override
  String get dehydrateWarning =>
      'Цю дію не можна скасувати. Переконайтеся, що ви безпечно зберігаєте файл резервної копії.';

  @override
  String get hydrate => 'Відновлення з файлу резервної копії';

  @override
  String get loadingPleaseWait => 'Завантаження… Будь ласка, зачекайте.';

  @override
  String get loadMore => 'Завантажити ще…';

  @override
  String get locationDisabledNotice =>
      'Служби визначення розташування вимкнені. Увімкніть їх, щоб мати змогу ділитися своїм розташуванням.';

  @override
  String get locationPermissionDeniedNotice =>
      'Дозвіл на розташування відхилено. Надайте можливість ділитися своїм розташуванням.';

  @override
  String get login => 'Увійти';

  @override
  String logInTo(String homeserver) {
    return 'Увійти до $homeserver';
  }

  @override
  String get logout => 'Вийти';

  @override
  String get mention => 'Згадати';

  @override
  String get messages => 'Повідомлення';

  @override
  String get messagesStyle => 'Повідомлення:';

  @override
  String get moderator => 'Модератор';

  @override
  String get muteChat => 'Вимкнути сповіщення';

  @override
  String get newChat => 'Нова бесіда';

  @override
  String get newMessageInrechainonline => '💬 Нове повідомлення у REChain';

  @override
  String get newVerificationRequest => 'Новий запит перевірки!';

  @override
  String get next => 'Далі';

  @override
  String get no => 'Ні';

  @override
  String get noConnectionToTheServer => 'Немає з\'єднання з сервером';

  @override
  String get noEmotesFound => 'Емодзі не знайдено. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Активувати шифрування можна лише тоді, коли кімната більше не буде загальнодоступною.';

  @override
  String get noGoogleServicesWarning =>
      'Схоже, Firebase Cloud Messaging недоступна на вашому пристрої. Щоб отримувати push-сповіщення, радимо встановити ntfy. За допомогою ntfy або іншого постачальника Unified Push ви можете отримувати push-сповіщення у безпечний спосіб. Ви можете завантажити ntfy з PlayStore або з F-Droid.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 не є сервером REChain, використовувати $server2 натомість?';
  }

  @override
  String get shareInviteLink => 'Надіслати запрошувальне посилання';

  @override
  String get scanQrCode => 'Сканувати QR-код';

  @override
  String get noPasswordRecoveryDescription =>
      'Ви ще не додали спосіб відновлення пароля.';

  @override
  String get noPermission => 'Немає прав доступу';

  @override
  String get noRoomsFound => 'Кімнат не знайдено…';

  @override
  String get notifications => 'Сповіщення';

  @override
  String numUsersTyping(int count) {
    return '$count користувачів пишуть…';
  }

  @override
  String get obtainingLocation => 'Отримання розташування…';

  @override
  String get ok => 'Гаразд';

  @override
  String get onlineKeyBackupEnabled =>
      'Резервне онлайн-копіювання ключів увімкнено';

  @override
  String get oopsPushError =>
      'Дідько! На жаль, сталася помилка під час налаштування push-сповіщень.';

  @override
  String get oopsSomethingWentWrong => 'Халепа, щось пішло не так…';

  @override
  String get openAppToReadMessages =>
      'Відкрийте застосунок читання повідомлень';

  @override
  String get openCamera => 'Відкрити камеру';

  @override
  String get oneClientLoggedOut =>
      'На одному з ваших клієнтів виконано вихід із системи';

  @override
  String get addAccount => 'Додати обліковий запис';

  @override
  String get editBundlesForAccount =>
      'Змінити вузол для цього облікового запису';

  @override
  String get addToBundle => 'Додати до вузлів';

  @override
  String get removeFromBundle => 'Вилучити з цього вузла';

  @override
  String get bundleName => 'Назва вузла';

  @override
  String get openInMaps => 'Відкрити в картах';

  @override
  String get link => 'Посилання';

  @override
  String get or => 'Або';

  @override
  String get participant => 'Учасник';

  @override
  String get passphraseOrKey => 'парольна фраза або ключ відновлення';

  @override
  String get password => 'Пароль';

  @override
  String get passwordForgotten => 'Забули пароль';

  @override
  String get passwordHasBeenChanged => 'Пароль змінено';

  @override
  String get passwordRecoverySettings => 'Налаштування відновлення пароля';

  @override
  String get passwordRecovery => 'Відновлення пароля';

  @override
  String get pin => 'Закріпити';

  @override
  String get pleaseChooseAPasscode => 'Виберіть код доступу';

  @override
  String get pleaseClickOnLink =>
      'Натисніть на посилання в електронному листі, а потім продовжуйте.';

  @override
  String get pleaseEnterYourPassword => 'Введіть свій пароль';

  @override
  String get pleaseEnterYourPin => 'Введіть свій PIN-код';

  @override
  String get pleaseEnterYourUsername => 'Введіть своє ім\'я користувача';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Виконайте вказівки вебсайту та торкніться далі.';

  @override
  String get privacy => 'Приватність';

  @override
  String get publicRooms => 'Загальнодоступні кімнати';

  @override
  String get reason => 'Причина';

  @override
  String redactedBy(String username) {
    return 'Відредаговано $username';
  }

  @override
  String redactedByBecause(String username, String reason) {
    return 'Відредаговано $username, тому що: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username змінює подію';
  }

  @override
  String get redactMessage => 'Редагувати повідомлення';

  @override
  String get reject => 'Відхилити';

  @override
  String rejectedTheInvitation(String username) {
    return '$username відхиляє запрошення';
  }

  @override
  String get removeAllOtherDevices => 'Вилучити всі інші пристрої';

  @override
  String get unbanFromChat => 'Розблокувати у бесіді';

  @override
  String get removeYourAvatar => 'Вилучити свій аватар';

  @override
  String get replaceRoomWithNewerVersion => 'Замінити кімнату новішою версією';

  @override
  String get reply => 'Відповісти';

  @override
  String get reportMessage => 'Поскаржитися на повідомлення';

  @override
  String get roomHasBeenUpgraded => 'Кімнату було оновлено';

  @override
  String sendingFilesDoNotExit(int count) {
    return 'Sending $count files... Please do not exit!';
  }

  @override
  String get roomVersion => 'Версія кімнати';

  @override
  String get compressingVideo => 'Compressing video...';

  @override
  String get saveFile => 'Зберегти файл';

  @override
  String get search => 'Пошук';

  @override
  String get security => 'Безпека';

  @override
  String get send => 'Надіслати';

  @override
  String get sendAMessage => 'Надіслати повідомлення';

  @override
  String get sendAsText => 'Надіслати як текст';

  @override
  String get sendAudio => 'Надіслати аудіо';

  @override
  String get sendFile => 'Надіслати файл';

  @override
  String get sendImage => 'Надіслати зображення';

  @override
  String sendImages(int count) {
    return 'Надіслати $count зображення';
  }

  @override
  String get sendMessages => 'Надсилати повідомлення';

  @override
  String get sendVideo => 'Надіслати відео';

  @override
  String sentAFile(String username) {
    return '📁 $username надсилає файл';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username надсилає аудіо';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username надсилає зображення';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username надсилає наліпку';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username надсилає відео';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName надсилає відомості про виклик';
  }

  @override
  String get setAsCanonicalAlias => 'Установити основним псевдонімом';

  @override
  String get setChatDescription => 'Налаштувати опис бесіди';

  @override
  String get setStatus => 'Указати статус';

  @override
  String get settings => 'Налаштування';

  @override
  String get share => 'Поділитися';

  @override
  String sharedTheLocation(String username) {
    return '$username ділиться своїм місцеперебуванням';
  }

  @override
  String get shareLocation => 'Поділитися місцеперебуванням';

  @override
  String get skip => 'Пропустити';

  @override
  String get sourceCode => 'Джерельний код';

  @override
  String get spaceIsPublic => 'Простір загальнодоступний';

  @override
  String get spaceName => 'Назва простору';

  @override
  String startedACall(String senderName) {
    return '$senderName розпочинає виклик';
  }

  @override
  String get status => 'Статус';

  @override
  String get statusExampleMessage => 'Як справи сьогодні?';

  @override
  String get submit => 'Надіслати';

  @override
  String get synchronizingPleaseWait => 'Синхронізація… Будь ласка, зачекайте.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Синхронізація… ($percentage%)';
  }

  @override
  String get systemTheme => 'Системна';

  @override
  String get theyDontMatch => 'Вони відрізняються';

  @override
  String get theyMatch => 'Вони збігаються';

  @override
  String get tooManyRequestsWarning => 'Забагато запитів. Спробуйте пізніше!';

  @override
  String get tryToSendAgain => 'Спробуйте надіслати ще раз';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username розблоковує $targetName';
  }

  @override
  String get unblockDevice => 'Розблокувати пристрій';

  @override
  String get unknownDevice => 'Невідомий пристрій';

  @override
  String get unknownEncryptionAlgorithm => 'Невідомий алгоритм шифрування';

  @override
  String unknownEvent(String type) {
    return 'Невідома подія \'$type\'';
  }

  @override
  String get unmuteChat => 'Увімкнути сповіщення';

  @override
  String get unpin => 'Відкріпити';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username та $count інших пишуть…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username і $username2 пишуть…';
  }

  @override
  String userIsTyping(String username) {
    return '$username пише…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username виходить з бесіди';
  }

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username надсилає подію $type';
  }

  @override
  String get unverified => 'Неперевірений';

  @override
  String get verified => 'Перевірений';

  @override
  String get verifyStart => 'Почати перевірку';

  @override
  String get verifySuccess => 'Ви успішно перевірені!';

  @override
  String get verifyTitle => 'Перевірка іншого облікового запису';

  @override
  String get visibilityOfTheChatHistory => 'Видимість історії бесіди';

  @override
  String get visibleForAllParticipants => 'Видима для всіх учасників';

  @override
  String get visibleForEveryone => 'Видима для всіх';

  @override
  String get voiceMessage => 'Голосове повідомлення';

  @override
  String get waitingPartnerAcceptRequest =>
      'Очікування прийняття запиту партнером…';

  @override
  String get waitingPartnerEmoji => 'Очікування прийняття емодзі партнером…';

  @override
  String get waitingPartnerNumbers => 'Очікування прийняття чисел партнером…';

  @override
  String get warning => 'Попередження!';

  @override
  String get weSentYouAnEmail => 'Ми надіслали вам електронний лист';

  @override
  String get whoCanPerformWhichAction => 'Хто і яку дію може виконувати';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'Кому дозволено приєднуватися до цієї групи';

  @override
  String get whyDoYouWantToReportThis => 'Чому ви хочете поскаржитися?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'За допомогою цих адрес ви можете відновити свій пароль.';

  @override
  String get writeAMessage => 'Написати повідомлення…';

  @override
  String get yes => 'Так';

  @override
  String get you => 'Ви';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Ви більше не берете участь у цій бесіді';

  @override
  String get yourPublicKey => 'Ваш відкритий ключ';

  @override
  String get messageInfo => 'Відомості про повідомлення';

  @override
  String get time => 'Час';

  @override
  String get sender => 'Відправник';

  @override
  String get openGallery => 'Відкрити галерею';

  @override
  String get removeFromSpace => 'Вилучити з простору';

  @override
  String get markAsRead => 'Позначити прочитаним';

  @override
  String get reportUser => 'Поскаржився на користувача';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender реагує з $reaction';
  }

  @override
  String get pinMessage => 'Прикріпити в кімнаті';

  @override
  String get confirmEventUnpin =>
      'Ви впевнені, що бажаєте назавжди відкріпити подію?';

  @override
  String get emojis => 'Емодзі';

  @override
  String get unsupportedAndroidVersion => 'Непідтримувана версія Android';

  @override
  String get unsupportedAndroidVersionLong =>
      'Для цієї функції потрібна новіша версія Android. Перевірте наявність оновлень або підтримку Mobile Katya OS.';

  @override
  String get youRejectedTheInvitation => 'Ви відхилили запрошення';

  @override
  String get youJoinedTheChat => 'Ви приєдналися до бесіди';

  @override
  String get youAcceptedTheInvitation => '👍 Ви погодилися на запрошення';

  @override
  String youBannedUser(String user) {
    return 'Ви заблокували $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Ви відкликали запрошення для $user';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 Ви були запрошені $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Ви запросили $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Ви вилучили $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Ви вилучили й заблокували $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Ви розблокували $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪$user стукає до вас';
  }

  @override
  String get usersMustKnock => 'Користувачі повинні постукатись';

  @override
  String get noOneCanJoin => 'Ніхто не може приєднатись';

  @override
  String get knock => 'Постукатись';

  @override
  String get users => 'Користувачі';

  @override
  String get storeInAndroidKeystore => 'Зберегти в Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Зберегти в Apple KeyChain';

  @override
  String get storeSecurlyOnThisDevice => 'Зберегти безпечно на цей пристрій';

  @override
  String countFiles(int count) {
    return '$count файлів';
  }

  @override
  String get user => 'Користувач';

  @override
  String get custom => 'Користувацький';

  @override
  String get whyIsThisMessageEncrypted => 'Чому це повідомлення нечитабельне?';

  @override
  String get noKeyForThisMessage =>
      'Це може статися, якщо повідомлення було надіслано до того, як ви ввійшли у свій обліковий запис на цьому пристрої.\n\nТакож можливо, що відправник заблокував ваш пристрій або щось пішло не так з під\'єднанням до інтернету.\n\nЧи можете ви прочитати повідомлення на іншому сеансі? Тоді ви зможете перенести повідомлення з нього! Перейдіть до Налаштування > Пристрої та переконайтеся, що ваші пристрої перевірили один одного. Коли ви відкриєте кімнату наступного разу й обидва сеанси будуть на активні, ключі будуть передані автоматично.\n\nВи ж не хочете втрачати ключі після виходу або зміни пристроїв? Переконайтеся, що ви ввімкнули резервне копіювання бесід у налаштуваннях.';

  @override
  String get newSpace => 'Новий простір';

  @override
  String get doNotShowAgain => 'Не показувати знову';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Порожня бесіда (раніше $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Простори дозволяють об\'єднувати ваші бесіди та створювати приватні або загальнодоступні спільноти.';

  @override
  String get encryptThisChat => 'Зашифрувати цю бесіду';

  @override
  String get disableEncryptionWarning =>
      'З міркувань безпеки ви не можете вимкнути шифрування в бесіді, ув якій воно було ввімкнене раніше.';

  @override
  String get sorryThatsNotPossible => 'Вибачте... це неможливо';

  @override
  String get reopenChat => 'Відновити бесіду';

  @override
  String get noBackupWarning =>
      'Увага! Якщо ви не ввімкнете резервне копіювання бесіди, ви втратите доступ до своїх зашифрованих повідомлень. Наполегливо радимо ввімкнути резервне копіювання бесіди перед виходом.';

  @override
  String get noOtherDevicesFound => 'Інших пристроїв не знайдено';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Не вдалося надіслати! Сервер підтримує вкладення розміром до $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Файл збережено в $path';
  }

  @override
  String get jumpToLastReadMessage =>
      'Перейти до останнього прочитаного повідомлення';

  @override
  String get readUpToHere => 'Читати тут';

  @override
  String get jump => 'Перейти';

  @override
  String get openLinkInBrowser => 'Відкрити посилання у браузері';

  @override
  String get reportErrorDescription =>
      'О, ні. Щось пішло не так. Якщо хочете, можете повідомити про помилку розробникам.';

  @override
  String get report => 'повідомити';

  @override
  String get setColorTheme => 'Налаштувати колірну тему:';

  @override
  String get invite => 'Запросити';

  @override
  String get inviteGroupChat => '📨 Запрошення до групової бесіди';

  @override
  String get invalidInput => 'Недійсний ввід!';

  @override
  String wrongPinEntered(int seconds) {
    return 'Введено неправильний PIN! Повторіть спробу за $seconds секунд...';
  }

  @override
  String get pleaseEnterANumber => 'Введіть число більше ніж 0';

  @override
  String get archiveRoomDescription =>
      'Бесіду буде переміщено до архіву. Інші користувачі зможуть побачити, що ви вийшли з неї.';

  @override
  String get roomUpgradeDescription =>
      'Після цього бесіду буде відтворено з новою версією кімнати. Усі учасники отримають сповіщення, що їм потрібно перейти до нової бесіди. Ви можете дізнатися більше про версії кімнат на https://github.com/sorydima/REChain-.git';

  @override
  String get removeDevicesDescription =>
      'Ви вийдете з цього пристрою і більше не зможете отримувати повідомлення.';

  @override
  String get banUserDescription =>
      'Користувача буде заблоковано в бесіді, і він не зможе знову увійти в неї, поки його не буде розблоковано.';

  @override
  String get unbanUserDescription =>
      'Користувач зможе знову увійти в бесіду, якщо спробує.';

  @override
  String get kickUserDescription =>
      'Користувача вигнали з бесіди, але не заблокували. До загальнодоступних бесід користувач може приєднатися будь-коли.';

  @override
  String get makeAdminDescription =>
      'Після того, як ви зробите цього користувача адміністратором, ви, можливо, не зможете це скасувати, оскільки він матиме ті самі права, що й ви.';

  @override
  String get pushNotificationsNotAvailable => 'Push-сповіщення недоступні';

  @override
  String get learnMore => 'Докладніше';

  @override
  String get yourGlobalUserIdIs => 'Ваш глобальний ID користувача: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'На жаль, не знайдено жодного користувача з запитом \"$query\".Перевірте, чи не було допущено помилки.';
  }

  @override
  String get knocking => 'Стукаються';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Бесіду можна знайти за допомогою пошуку на $server';
  }

  @override
  String get searchChatsRooms => 'Пошук для #chats, @users...';

  @override
  String get nothingFound => 'Нічого не знайдено...';

  @override
  String get groupName => 'Назва групи';

  @override
  String get createGroupAndInviteUsers =>
      'Створити групу та запросити користувачів';

  @override
  String get groupCanBeFoundViaSearch => 'Групу можна знайти через пошук';

  @override
  String get wrongRecoveryKey =>
      'Вибачте... схоже, це неправильний ключ відновлення.';

  @override
  String get commandHint_sendraw => 'Надіслати необроблений json';

  @override
  String get databaseMigrationTitle => 'Базу даних оптимізовано';

  @override
  String get databaseMigrationBody =>
      'Зачекайте, будь ласка. Це може тривати деякий час.';

  @override
  String get leaveEmptyToClearStatus => 'Лишіть порожнім, щоб оновити статус.';

  @override
  String get select => 'Вибрати';

  @override
  String get searchForUsers => 'Пошук @користувачів...';

  @override
  String get pleaseEnterYourCurrentPassword => 'Введіть поточний пароль';

  @override
  String get newPassword => 'Новий пароль';

  @override
  String get pleaseChooseAStrongPassword => 'Виберіть надійний пароль';

  @override
  String get passwordsDoNotMatch => 'Паролі відрізняються';

  @override
  String get passwordIsWrong => 'Введений пароль неправильний';

  @override
  String get publicChatAddresses => 'Адреси загальнодоступної бесіди';

  @override
  String get createNewAddress => 'Створити нову адресу';

  @override
  String get joinSpace => 'Приєднатися до простору';

  @override
  String get publicSpaces => 'Загальнодоступний простір';

  @override
  String get addChatOrSubSpace => 'Додати бесіду або підпростір';

  @override
  String get thisDevice => 'Цей пристрій:';

  @override
  String get initAppError => 'Виникла помилка під час запуску застосунку';

  @override
  String searchIn(String chat) {
    return 'Пошук у бесіді \"$chat\"...';
  }

  @override
  String get searchMore => 'Шукати ще...';

  @override
  String get gallery => 'Галерея';

  @override
  String get files => 'Файли';

  @override
  String sessionLostBody(String url, String error) {
    return 'Ваш сеанс втрачено. Будь ласка, повідомте про цю помилку розробникам за адресою $url. Текст помилки: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Наразі застосунок намагається відновити ваш сеанс з резервної копії. Будь ласка, повідомте про цю помилку розробникам за адресою $url. Текст помилки: $error';
  }

  @override
  String get sendReadReceipts => 'Надіслати підтвердження прочитання';

  @override
  String get sendTypingNotificationsDescription =>
      'Інші учасники бесіди бачитимуть, коли ви набираєте нове повідомлення.';

  @override
  String get sendReadReceiptsDescription =>
      'Інші учасники бесіди бачитимуть, що ви прочитали повідомлення.';

  @override
  String get formattedMessages => 'Форматовані повідомлення';

  @override
  String get formattedMessagesDescription =>
      'Показувати розширений вміст повідомлень, наприклад, жирний текст, використовуючи markdown.';

  @override
  String get verifyOtherUser => '🔐 Звірити іншого користувача';

  @override
  String get verifyOtherUserDescription =>
      'Якщо ви звіряєте іншого користувача, ви можете бути впевнені, що знаєте, кому ви насправді пишете. 💪\n\nКоли ви почнете звірення, ви та інший користувач побачите спливне вікно в застосунку. Там ви побачите набір смайликів або чисел, які вам потрібно буде порівняти між собою.\n\nНайкращий спосіб зробити це — зустрітися або розпочати відеовиклик. 👭';

  @override
  String get verifyOtherDevice => '🔐 Звірити інший пристрій';

  @override
  String get verifyOtherDeviceDescription =>
      'Коли ви звіряєте інший пристрій, ці пристрої можуть обмінюватися ключами, підвищуючи вашу загальну безпеку. 💪 Коли ви розпочнете звірення, в застосунку на обох пристроях з\'явиться спливне вікно. Там ви побачите набір смайликів або чисел, які вам потрібно буде порівняти між собою. Найкраще мати обидва пристрої під рукою перед початком звірення. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender погоджується звірити ключі';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender скасовує звірення ключів';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender завершує звірення ключів';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender готовий до звірення ключів';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender просить звірити ключі';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender розпочинає звірення ключів';
  }

  @override
  String get incomingMessages => 'Вхідні повідомлення';

  @override
  String get stickers => 'Наліпки';

  @override
  String get discover => 'Огляд';

  @override
  String get commandHint_ignore => 'Ігнорувати цей REChain ID';

  @override
  String get commandHint_unignore => 'Не ігнорувати цей REChain ID';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread непрочитаних бесід';
  }

  @override
  String get noDatabaseEncryption =>
      'Шифрування бази даних не підтримується на цій платформі';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Наразі заблоковано $count користувачів.';
  }

  @override
  String goToSpace(Object space) {
    return 'Перейти до простору: $space';
  }

  @override
  String get markAsUnread => 'Позначити непрочитаним';

  @override
  String userLevel(int level) {
    return '$level - Користувач';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Модератор';
  }

  @override
  String adminLevel(int level) {
    return '$level - Адміністратор';
  }

  @override
  String get changeGeneralChatSettings => 'Змінити загальні налаштування чату';

  @override
  String get inviteOtherUsers => 'Запросити інших користувачів до цього чату';

  @override
  String get changeTheChatPermissions => 'Змінити права доступу до чату';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Змінити видимість історії чату';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Змінити основну адресу загальнодоступного чату';

  @override
  String get sendRoomNotifications => 'Надсилати сповіщення @room';

  @override
  String get changeTheDescriptionOfTheGroup => 'Змінити опис чату';

  @override
  String get chatPermissionsDescription =>
      'Визначте, який рівень повноважень необхідний для певних дій у цьому чаті. Рівні повноважень 0, 50 і 100 зазвичай представляють користувачів, модераторів та адміністраторів, але можливі будь-які градації.';

  @override
  String updateInstalled(String version) {
    return '🎉 Оновлення $version встановлено!';
  }

  @override
  String get changelog => 'Зміни';

  @override
  String updateAvailable(String version) {
    return 'Update $version available';
  }

  @override
  String get download => 'Download';

  @override
  String get sendCanceled => 'Надсилання скасовано';

  @override
  String get loginWithREChainId => 'Login with REChain-ID';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Здається, це несумісний домашній сервер. Неправильна URL-адреса?';

  @override
  String get calculatingFileSize => 'Обчислення розміру файлу...';

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Один із ваших пристроїв не верифікований';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Примітка: Коли ви під\'єднуєте всі свої пристрої до резервної копії бесіди, вони автоматично верифікуються.';

  @override
  String get continueText => 'Продовжити';

  @override
  String get blur => 'Розмиття:';

  @override
  String get opacity => 'Прозорість:';

  @override
  String get setWallpaper => 'Встановити шпалери';

  @override
  String get manageAccount => 'Керувати обліковим записом';

  @override
  String get noContactInformationProvided =>
      'Сервер не надає жодної дійсної контактної інформації';

  @override
  String get contactServerAdmin => 'Зв’язатися з адміністратором сервера';

  @override
  String get contactServerSecurity => 'Зв’язатися з відділом безпеки сервера';

  @override
  String get supportPage => 'Сторінка підтримки';

  @override
  String get serverInformation => 'Інформація про сервер:';

  @override
  String get name => 'Ім\'я';

  @override
  String get version => 'Версія';

  @override
  String get website => 'Вебсайт';

  @override
  String get compress => 'Стиснути';

  @override
  String get boldText => 'Жирний текст';

  @override
  String get italicText => 'Курсивний текст';

  @override
  String get strikeThrough => 'Перекреслений текст';

  @override
  String get pleaseFillOut => 'Будь ласка, заповніть';

  @override
  String get invalidUrl => 'Недійсний URL';

  @override
  String get addLink => 'Додати посилання';

  @override
  String get unableToJoinChat =>
      'Неможливо приєднатися до бесіди. Можливо, інша сторона вже закрила розмову.';

  @override
  String get previous => 'Попередній';

  @override
  String get otherPartyNotLoggedIn =>
      'Інша сторона наразі не увійшла в систему, тому не може отримувати повідомлення!';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Використати \'$server\', щоб увійти';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Цим ви дозволяєте застосунку та вебсайту ділитися інформацією про вас.';

  @override
  String get open => 'Відкрити';

  @override
  String get waitingForServer => 'Очікування сервера...';

  @override
  String get newChatRequest => '📩 Новий запит на спілкування';

  @override
  String get contentNotificationSettings => 'Налаштування сповіщень про вміст';

  @override
  String get generalNotificationSettings => 'Загальні налаштування сповіщень';

  @override
  String get roomNotificationSettings => 'Налаштування сповіщень кімнати';

  @override
  String get userSpecificNotificationSettings =>
      'Налаштування сповіщень для користувача';

  @override
  String get otherNotificationSettings => 'Інші налаштування сповіщень';

  @override
  String get notificationRuleContainsUserName => 'Містить ім\'я користувача';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Сповіщає користувача, коли повідомлення містить його ім\'я користувача.';

  @override
  String get notificationRuleMaster => 'Вимкнути всі сповіщення';

  @override
  String get notificationRuleMasterDescription =>
      'Перевизначає всі інші правила і вимикає всі сповіщення.';

  @override
  String get notificationRuleSuppressNotices =>
      'Заборонити автоматичні повідомлення';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Забороняє сповіщення від автоматизованих клієнтів, як-от боти.';

  @override
  String get notificationRuleInviteForMe => 'Запрошення мене';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Сповіщає користувача, коли його запрошують до кімнати.';

  @override
  String get notificationRuleMemberEvent => 'Події участі';

  @override
  String get notificationRuleMemberEventDescription =>
      'Забороняє сповіщення про події учасників.';

  @override
  String get notificationRuleIsUserMention => 'Згадки користувачів';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Сповіщає користувачів, коли безпосередньо їх згадують у повідомленні.';

  @override
  String get notificationRuleContainsDisplayName => 'Містить показуване ім’я';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Сповіщає користувача, коли повідомлення містить показуване ім\'я.';

  @override
  String get notificationRuleIsRoomMention => 'Згадки кімнати';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Сповіщає користувача, коли є згадка всієї кімнати.';

  @override
  String get notificationRuleRoomnotif => 'Сповіщення кімнати';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Сповіщає користувача, коли повідомлення містить \'@room\'.';

  @override
  String get notificationRuleTombstone => 'Могильний камінь';

  @override
  String get notificationRuleTombstoneDescription =>
      'Повідомляє користувача про повідомлення деактивації кімнати.';

  @override
  String get notificationRuleReaction => 'Реакція';

  @override
  String get notificationRuleReactionDescription =>
      'Приховує сповіщення про реакції.';

  @override
  String get notificationRuleRoomServerAcl => 'ACL сервера кімнати';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Приховує сповіщення про списки контролю доступу (ACL) сервера кімнати.';

  @override
  String get notificationRuleSuppressEdits => 'Приховує редагування';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Приховує сповіщення про відредаговані повідомлення.';

  @override
  String get notificationRuleCall => 'Виклик';

  @override
  String get notificationRuleCallDescription =>
      'Повідомляє користувача про виклики.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'Зашифрована кімната \"Один на один\"';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Повідомляє користувача про повідомлення в зашифрованих кімнатах \"Один на один\".';

  @override
  String get notificationRuleRoomOneToOne => 'Кімната \"Один на один\"';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Повідомляє користувача про повідомлення в кімнатах \"Один на один\".';

  @override
  String get notificationRuleMessage => 'Повідомлення';

  @override
  String get notificationRuleMessageDescription =>
      'Повідомляє користувача про загальні повідомлення.';

  @override
  String get notificationRuleEncrypted => 'Зашифровано';

  @override
  String get notificationRuleEncryptedDescription =>
      'Повідомляє користувача про повідомлення в зашифрованих кімнатах.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Повідомляє користувача про події віджетів Jitsi.';

  @override
  String get notificationRuleServerAcl => 'Приховує події сервера ACL';

  @override
  String get notificationRuleServerAclDescription =>
      'Приховує сповіщення про події Server ACL.';

  @override
  String unknownPushRule(String rule) {
    return 'Невідоме правило сповіщення \'$rule\'';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return '🎙️Голосове повідомлення від $sender ($duration)';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Якщо ви видалите це налаштування сповіщень, відновити його буде неможливо.';

  @override
  String get more => 'Більше';

  @override
  String get shareKeysWith => 'Поділитися ключами з...';

  @override
  String get shareKeysWithDescription =>
      'Яким пристроям довіряти, щоб вони могли читати ваші повідомлення в зашифрованих бесідах?';

  @override
  String get allDevices => 'Усім пристроям';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'З перехресною верифікацією пристроїв, якщо ввімкнено';

  @override
  String get crossVerifiedDevices => 'З перехресною верифікацією пристроїв';

  @override
  String get verifiedDevicesOnly => 'Лише верифіковані пристрої';

  @override
  String get takeAPhoto => 'Зробити фото';

  @override
  String get recordAVideo => 'Записати відео';

  @override
  String get optionalMessage => '(Необов\'язково) повідомлення...';

  @override
  String get notSupportedOnThisDevice => 'Не підтримується на цьому пристрої';

  @override
  String get enterNewChat => 'Створити новий чат';

  @override
  String get approve => 'Схвалити';

  @override
  String get youHaveKnocked => 'Ви постукали';

  @override
  String get pleaseWaitUntilInvited =>
      'Будь ласка, зачекайте, поки хтось з кімнати запросить вас.';

  @override
  String get commandHint_logout => 'Вийти на цьому пристрої';

  @override
  String get commandHint_logoutall => 'Вийти на всіх активних пристроях';

  @override
  String get displayNavigationRail =>
      'Показати навігаційну карту на мобільному';

  @override
  String get customReaction => 'Власні реакції';

  @override
  String get moreEvents => 'Інші події';

  @override
  String get showMore => 'Show more';

  @override
  String get showLess => 'Show less';

  @override
  String get declineInvitation => 'Відхилити запрошення';

  @override
  String get noMessagesYet => 'Поки немає повідомлень';

  @override
  String get longPressToRecordVoiceMessage =>
      'Довге натискання, щоби записати голосове повідомлення.';

  @override
  String get pause => 'Призупинити';

  @override
  String get resume => 'Продовжити';

  @override
  String get removeFromSpaceDescription =>
      'Бесіду буде видалено з простору, та вона залишиться у вашому списку бесід.';

  @override
  String countChats(int chats) {
    return '$chats бесід';
  }

  @override
  String spaceMemberOf(String spaces) {
    return 'Учасник $spaces просторів';
  }

  @override
  String spaceMemberOfCanKnock(String spaces) {
    return 'Учасник просторів $spaces може постукати';
  }

  @override
  String get startPoll => 'Розпочати опитування';

  @override
  String get endPoll => 'Завершити опитування';

  @override
  String get answersVisible => 'Публічні відповіді';

  @override
  String get pollQuestion => 'Запитання';

  @override
  String get answerOption => 'Варіант відповіді';

  @override
  String get addAnswerOption => 'Додати варіант відповіді';

  @override
  String get allowMultipleAnswers => 'Дозволити декілька варіантів відповіді';

  @override
  String get pollHasBeenEnded => 'Опитування завершилось';

  @override
  String countVotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count голосів',
      one: 'Один голос',
    );
    return '$_temp0';
  }

  @override
  String get answersWillBeVisibleWhenPollHasEnded =>
      'Відповіді стануть публічними після завершення опитування';

  @override
  String get replyInThread => 'Відповісти у вітці';

  @override
  String countReplies(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count відповідей',
      one: 'Одна відповідь',
    );
    return '$_temp0';
  }

  @override
  String get thread => 'Вітка';

  @override
  String get backToMainChat => 'Повернутись до основної бесіди';

  @override
  String get saveChanges => 'Зберегти зміни';

  @override
  String get createSticker => 'Створити наліпку чи емодзі';

  @override
  String get useAsSticker => 'Використати як наліпку';

  @override
  String get useAsEmoji => 'Використати як емодзі';

  @override
  String get stickerPackNameAlreadyExists =>
      'Набір наліпок з такою назвою вже є';

  @override
  String get newStickerPack => 'Новий набір наліпок';

  @override
  String get stickerPackName => 'Назва набору наліпок';

  @override
  String get attribution => 'Атрибуція';

  @override
  String get skipChatBackup => 'Пропустити резервне копіювання бесід';

  @override
  String get skipChatBackupWarning =>
      'Ви впевнені? Без резервного копіювання бесід ви можете втратити доступ до повідомлень, якщо ви зміните пристрій.';

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
  String get loadingMessages => 'Завантажуються повідомлення';

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
      'Зауважте, що відеовиклики на ранньому етапі розробки. Вони можуть працювати не так, як очікувалося, або взагалі не працювати на всіх платформах.';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get incomingCall => 'Incoming call';

  @override
  String get videoCall => 'Відеовиклик';

  @override
  String get voiceCall => 'Голосовий виклик';

  @override
  String get missedCall => 'Missed call';

  @override
  String get callBack => 'Call back';

  @override
  String get hangUp => 'Hang up';

  @override
  String get waitingForParticipant => 'Waiting for participant...';

  @override
  String get decline => 'Відхилити';

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
