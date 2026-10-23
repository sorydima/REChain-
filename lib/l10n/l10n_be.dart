// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Belarusian (`be`).
class L10nBe extends L10n {
  L10nBe([String locale = 'be']) : super(locale);

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
  String get repeatPassword => 'Паўтарыце пароль';

  @override
  String get notAnImage => 'Не файл выявы.';

  @override
  String get remove => 'Прыбраць';

  @override
  String get importNow => 'Імпартаваць зараз';

  @override
  String get importEmojis => 'Імпартаваць эмодзі';

  @override
  String get importFromZipFile => 'Імпартаваць з файла .zip';

  @override
  String get exportEmotePack => 'Экспартаваць пак эмодзі як .zip';

  @override
  String get replace => 'Замяніць';

  @override
  String get about => 'Пра праграму';

  @override
  String aboutHomeserver(String homeserver) {
    return 'Пра $homeserver';
  }

  @override
  String get accept => 'Прыняць';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username прыняў запрашэнне';
  }

  @override
  String get account => 'Уліковы запіс';

  @override
  String get accountsAndSettings => 'Accounts and settings';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username актывіраваў end to end шыфраванне';
  }

  @override
  String get addEmail => 'Дадаць email';

  @override
  String get confirmREChainId =>
      'Please confirm your REChain ID in order to delete your account.';

  @override
  String supposedMxid(String mxid) {
    return 'Гэта павінна быць накшталт $mxid';
  }

  @override
  String get addToSpace => 'Дадаць у прастору';

  @override
  String get admin => 'Адмін';

  @override
  String get alias => 'псеўданім';

  @override
  String get all => 'Усё';

  @override
  String get commandHint_roomupgrade =>
      'Абнавіце гэты пакой да згаданай версіі';

  @override
  String get commandHint_googly => 'Даслаць смешныя вочы';

  @override
  String get commandHint_cuddle => 'Даслаць усмешку';

  @override
  String get commandHint_hug => 'Даслаць абдымашкі';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName даслаў(-ла) вам смешныя вочы';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName усміхаецца вам';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName абдымае вас';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName адказаў(-ла) на выклік';
  }

  @override
  String get anyoneCanJoin => 'Усе могуць далучыцца';

  @override
  String get appLock => 'Код-пароль';

  @override
  String get appLockDescription =>
      'Блакіруе праграму, пакуль вы не ўвядзіце пін-код';

  @override
  String get archive => 'Архіў';

  @override
  String get areGuestsAllowedToJoin =>
      'Ці дазволена карыстальнікам-гасцям далучыцца';

  @override
  String get areYouSure => 'Вы ўпэўнены?';

  @override
  String get discardEdits => 'You have unsaved changes. Discard your edits?';

  @override
  String get areYouSureYouWantToLogout => 'Вы ўпэўнены, што хаціце выйсці?';

  @override
  String get askSSSSSign =>
      'Каб спраўдзіць іншага чалавека, калі ласка, увядзіце фразу-пароль ці ключ аднаўлення.';

  @override
  String askVerificationRequest(String username) {
    return 'Прыняць запрос на верыфікацыю ад $username?';
  }

  @override
  String get autoplayImages =>
      'Аўтаматычна прайграваць аніміраваныя стыкеры і эмодзі';

  @override
  String badServerLoginTypesException(
    String serverVersions,
    String supportedVersions,
    Object suportedVersions,
  ) {
    return 'Хатні сервер падтрымлівае наступныя метады ўваходу:\n$serverVersions\nАле гэта праграма падтрымлівае толькі:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Дасылаць паведамленне пра друк';

  @override
  String get swipeRightToLeftToReply => 'Змахніце ўлева, каб адказаць';

  @override
  String get sendOnEnter => 'Дасылаць на enter';

  @override
  String get noMoreChatsFound => 'Болей чатаў не знойдзена...';

  @override
  String get noChatsFoundHere =>
      'Здаецца, тут пуста. Пачніце новы чат з кімсьці праз кнопку ніжэй. ⤵️';

  @override
  String get unread => 'Непрачытаные';

  @override
  String get space => 'Прастора';

  @override
  String get banFromChat => 'Заблакіраваць ў чаце';

  @override
  String get banned => 'Заблакіраваны';

  @override
  String bannedUser(String username, String targetName) {
    return '$username заблакіраваў $targetName';
  }

  @override
  String get blockDevice => 'Заблакіраваць прыладу';

  @override
  String get blocked => 'Заблакіравана';

  @override
  String get cancel => 'Скасаваць';

  @override
  String cantOpenUri(String uri) {
    return 'Немагчыма адкрыць URI $uri';
  }

  @override
  String get changeDeviceName => 'Змяніць назву прылады';

  @override
  String changedTheChatAvatar(String username) {
    return '$username змяніў выяву чата';
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
    return '$username змяніў дазволы чата';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username змяніў адлюстроўваемае імя на: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username змяніў правілы гасцявога доступу';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username змяніў правілы гасцявога доступу на: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username змяніў бачнасць гісторыі';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username змяніў бачнасць гісторыі на: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username змяніў правілы падлучэння';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username змяніў правілы падлучэння на: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username змяніў свой аватар';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username змяніў псеўданімы пакою';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username змяніў(-ла) запрашальную спасылку';
  }

  @override
  String get changePassword => 'Змяніць пароль';

  @override
  String get changeTheHomeserver => 'Змяніць дамашні сервер';

  @override
  String get changeTheme => 'Змяніць ваш стыль';

  @override
  String get changeTheNameOfTheGroup => 'Змяніць назву групы';

  @override
  String get changeYourAvatar => 'Змяніць вашу выяву';

  @override
  String get channelCorruptedDecryptError => 'Шыфраванне было сапсавана';

  @override
  String get chat => 'Чат';

  @override
  String get chatBackup => 'Рэзервовае капіраванне чатаў';

  @override
  String get chatDetails => 'Дэталі чата';

  @override
  String get chats => 'Чаты';

  @override
  String get chooseAStrongPassword => 'Стварыце надзейны пароль';

  @override
  String get clearArchive => 'Ачысціць архіў';

  @override
  String get close => 'Закрыць';

  @override
  String get commandHint_markasdm =>
      'Пазначыць як пакой асабоных паведамленняў для дадання REChain ID';

  @override
  String get commandHint_markasgroup => 'Пазначыць як групу';

  @override
  String get commandHint_ban => 'Заблакіраваць карыстальніка у гэтым пакое';

  @override
  String get commandHint_clearcache => 'Ачысціць кэш';

  @override
  String get commandHint_create =>
      'Стварыць пусты групавы чат.\nВыкарыстоўвайце --no-encryption каб адключыць шыфраванне';

  @override
  String get commandHint_discardsession => 'Спыніць сеанс';

  @override
  String get commandHint_dm =>
      'Пачаць асобны чат.\nВыкарыстоўвайце --no-encryption, каб адключыць шыфраванне';

  @override
  String get commandHint_html => 'Даслаць тэкст з разметкай HTML';

  @override
  String get commandHint_invite => 'Запрасіць карыстальніка ў гэты пакой';

  @override
  String get commandHint_join => 'Далучыцца да гэтага пакою';

  @override
  String get commandHint_kick => 'Выдаліць карыстальніка з гэтага пакою';

  @override
  String get commandHint_leave => 'Пакінуць гэты пакой';

  @override
  String get commandHint_me => 'Апішыце сябе';

  @override
  String get commandHint_myroomavatar =>
      'Задаць выяву гэтага пакою (ад mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Задайце адлюстроўваемае імя для гэтага пакою';

  @override
  String get commandHint_op =>
      'Задайце ўзровень правоў гэтага карыстальніка (па змаўчанні: 50)';

  @override
  String get commandHint_plain => 'Даслаць неадфарматыраваны тэкст';

  @override
  String get commandHint_react => 'Даслаць адказ як рэакцыю';

  @override
  String get commandHint_send => 'Даслаць тэкст';

  @override
  String get commandHint_unban => 'Разблакіраваць карыстальніка ў гэтым пакое';

  @override
  String get commandInvalid => 'Няслушная каманда';

  @override
  String commandMissing(String command) {
    return '$command не каманда.';
  }

  @override
  String get compareEmojiMatch => 'Калі ласка, параўнайце эмодзі';

  @override
  String get compareNumbersMatch => 'Калі ласка, параўнайце лічбы';

  @override
  String get configureChat => 'Наладзіць чат';

  @override
  String get contactHasBeenInvitedToTheGroup => 'Кантакт быў запрошаны ў групу';

  @override
  String get contentHasBeenReported =>
      'Пра кантэнт было паведамлена адміністратарам сервера';

  @override
  String get copiedToClipboard => 'Скапіравана ў буфер';

  @override
  String get copy => 'Капіраваць';

  @override
  String get copyToClipboard => 'Скапіраваць у буфер';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Немагчыма расшыфраваць паведамленне: $error';
  }

  @override
  String get checkList => 'Кантрольны спіс';

  @override
  String countParticipants(int count) {
    return '$count удзельніка(-ў)';
  }

  @override
  String countInvited(int count) {
    return 'Запрошана $count';
  }

  @override
  String get create => 'Стварыць';

  @override
  String createdTheChat(String username) {
    return '💬 $username стварыў(-ла) чат';
  }

  @override
  String get createGroup => 'Стварыць групу';

  @override
  String get createNewSpace => 'Новая прастора';

  @override
  String get currentlyActive => 'Зараз актыўны';

  @override
  String get darkTheme => 'Цёмная';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String get deactivateAccountWarning =>
      'Гэта дэактывіруе ваш уліковы запіс. Гэта дзеянне не можа быць адменена! Вы ўпэўнены?';

  @override
  String get defaultPermissionLevel =>
      'Узровень дазволаў для новых карыстальнікаў па змаўчанні';

  @override
  String get delete => 'Выдаліць';

  @override
  String get deleteAccount => 'Выдаліць уліковы запіс';

  @override
  String get deleteMessage => 'Выдаліць паведамленне';

  @override
  String get devices => 'Прылады';

  @override
  String get directChats => 'Асобныя чаты';

  @override
  String get displaynameHasBeenChanged => 'Адлюстроўваемае імя было зменена';

  @override
  String get downloadFile => 'Спампаваць файл';

  @override
  String get edit => 'Змяніць';

  @override
  String get editBlockedServers => 'Змяніць заблакіраваныя сервера';

  @override
  String get chatPermissions => 'Дазволы чату';

  @override
  String get editDisplayname => 'Змяніць адлюстроўваемае імя';

  @override
  String get editRoomAliases => 'Змяніць псеўданімы пакою';

  @override
  String get editRoomAvatar => 'Змяніць выяву пакою';

  @override
  String get emoteExists => 'Эмодзі ўжо існуе!';

  @override
  String get emoteInvalid => 'Недапушчальнае скарачэнне эмодзі!';

  @override
  String get emoteKeyboardNoRecents => 'Нядаўна ўжытыя эмодзі паявяцца тут...';

  @override
  String get globalChatId => 'ID габальнага чату';

  @override
  String get accessAndVisibility => 'Даступнасць і бачнасць';

  @override
  String get accessAndVisibilityDescription =>
      'Каму дазволена далучацца да гэтага чату і як ён можа быць знойдзены.';

  @override
  String get customEmojisAndStickers => 'Карыстальніцкія эмодзі і стыкеры';

  @override
  String get customEmojisAndStickersBody =>
      'Дадаць ці падзяліцца карыстальніцкімі эмодзі ці стыкерамі, што могуць быць ужыты ў любым чаце.';

  @override
  String get emoteShortcode => 'Скарачэнне эмодзі';

  @override
  String get emptyChat => 'Пусты чат';

  @override
  String get enableEmotesGlobally => 'Уключыць набор эмодзі глабальна';

  @override
  String get enableEncryption => 'Уключыць шыфраванне';

  @override
  String get enableEncryptionWarning =>
      'Вы больш не зможаце адключыць шыфраванне. Вы ўпэўнены?';

  @override
  String get encrypted => 'Зашыфравана';

  @override
  String get encryption => 'Шыфраванне';

  @override
  String get encryptionNotEnabled => 'Шыфраванне не ўключана';

  @override
  String endedTheCall(String senderName) {
    return '$senderName скончыў выклік';
  }

  @override
  String get enterAnEmailAddress => 'Увядзіце электроную пошту (email)';

  @override
  String errorObtainingLocation(String error) {
    return 'Памылка атрымання месцазнаходжання: $error';
  }

  @override
  String get fontSize => 'Памер шрыфту';

  @override
  String get forward => 'Пераслаць';

  @override
  String get fromJoining => 'З далучэння';

  @override
  String get fromTheInvitation => 'З запрашэння';

  @override
  String get group => 'Група';

  @override
  String get chatDescription => 'Апісанне чату';

  @override
  String get chatDescriptionHasBeenChanged => 'Апісанне чату зменена';

  @override
  String get groupIsPublic => 'Група публічная';

  @override
  String get groups => 'Групы';

  @override
  String groupWith(String displayname) {
    return 'Групы з $displayname';
  }

  @override
  String get guestsAreForbidden => 'Госці забаронены';

  @override
  String get guestsCanJoin => 'Госці могуць далучацца';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username адазваў запрашэнне для $targetName';
  }

  @override
  String get help => 'Дапамога';

  @override
  String get hideRedactedMessages => 'Схаваць адрэдагаваныя паведамленні';

  @override
  String get hideRedactedMessagesBody =>
      'Калі хтосьці рэдагуе паведамленне, яно будзе схавана ў чаце.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Хаваць памылковыя ці невядомыя фарматы паведамленняў';

  @override
  String get block => 'Заблакіраваць';

  @override
  String get blockedUsers => 'Заблакіраваныя карыстальнікі';

  @override
  String get blockListDescription =>
      'Вы можаце заблакіраваць карыстальнікаў, якія вам перашкаджаюць. Вы не атрымаеце ад іх ні паведамленняў, ні запрашэнняў.';

  @override
  String get blockUsername => 'Ігнараваць імя карыстальніка';

  @override
  String get iHaveClickedOnLink => 'Я перайшоў па спасылцы';

  @override
  String get incorrectPassphraseOrKey =>
      'Няслушныя фраза-пароль ці ключ аднаўлення';

  @override
  String get inviteContact => 'Запрасіць кантакт';

  @override
  String inviteContactToGroup(String groupName) {
    return 'Запрасіць кантакт да $groupName';
  }

  @override
  String get noChatDescriptionYet => 'Апісанне чату яшчэ няма.';

  @override
  String get tryAgain => 'Паспрабуйце зноў';

  @override
  String get invalidServerName => 'Недапушчальная назва сервера';

  @override
  String get invited => 'Запрошаны';

  @override
  String get redactMessageDescription =>
      'Гэта паведамленне будзе адрэдагавана для усіх карыстальнікаў. Вы не зможаце яго адмяніць.';

  @override
  String get optionalRedactReason =>
      '(Неабавязкова) Прычына рэдагавання паведамлення...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username запрасіў(-ла) $targetName';
  }

  @override
  String get invitedUsersOnly => 'Толькі запрошаныя карыстальнікі';

  @override
  String inviteText(String username, String link) {
    return '$username запрасіў вас у REChain.\n1. Перайдзіце на github.com/sorydima/REChain- і ўстанавіце праграму\n2. Зарэгестрыруйцесь альбо ўвайдзіце\n3. Перайдзіце па запрашальнай спасылцы:\n$link';
  }

  @override
  String get isTyping => 'піша…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username далучыўся(лася) да чату';
  }

  @override
  String get joinRoom => 'Далучыцца да пакою';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username выгнаў(-ла) $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username выгнаў(-ла) і заблакіраваў(-ла) $targetName';
  }

  @override
  String get kickFromChat => 'Выгнаць з чату';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Апошняя актыўнасць: $localizedTimeShort';
  }

  @override
  String get leave => 'Выйсці';

  @override
  String get leftTheChat => 'Выйсці з чату';

  @override
  String get lightTheme => 'Светлая';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Загрузіць яшчэ $count удзельнікаў';
  }

  @override
  String get dehydrate => 'Экспарт сеансу і ачыстка прылады';

  @override
  String get dehydrateWarning =>
      'Гэта дзеянне не можа быць адменена. Пераканайцеся, што вы бяспечна захавалі файл рэзервовай копіі.';

  @override
  String get hydrate => 'Аднавіць з рэзервовай копіі';

  @override
  String get loadingPleaseWait => 'Загрузка... Калі ласка, пачакайце.';

  @override
  String get loadMore => 'Загрузіць больш…';

  @override
  String get locationDisabledNotice =>
      'Сервісы месцазнаходжанн, адключаны. Калі ласка, уключыце іх, каб зноў дзяліцца месцазнаходжаннем.';

  @override
  String get locationPermissionDeniedNotice =>
      'Дазвол атрымання месцазнаходжання скасаваны. Калі ласка, дайце яго каб дзяліцца месцазнаходжаннем.';

  @override
  String get login => 'Логін';

  @override
  String logInTo(String homeserver) {
    return 'Увайсці ў $homeserver';
  }

  @override
  String get logout => 'Выйсці';

  @override
  String get mention => 'Згадаць';

  @override
  String get messages => 'Паведамленні';

  @override
  String get messagesStyle => 'Паведамленні:';

  @override
  String get moderator => 'Мадэратар';

  @override
  String get muteChat => 'Заглушыць чат';

  @override
  String get newChat => 'Новы чат';

  @override
  String get newMessageInrechainonline => '💬 Новае паведамленне ў REChain';

  @override
  String get newVerificationRequest => 'Новы запыт на верыфікацыю!';

  @override
  String get next => 'Далей';

  @override
  String get no => 'Не';

  @override
  String get noConnectionToTheServer => 'Няма злучэння з серверам';

  @override
  String get noEmotesFound => 'Эмодзі не знойдзены. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Вы зможаце актывіраваць шыфраванне як толькі пакой перастане быць агульнадаступным.';

  @override
  String get noGoogleServicesWarning =>
      'Здаецца, на вашай прыладзе няма ці недаступны Firebase Cloud Messaging. Каб далей атрымліваць паведамленні, мы прапануем усталяваць ntfy ці іншы правайдар паведамленняў, каб атрымліваць іх бяспечна. Вы можаце спампаваць ntfy з PlayStore ці F-Droid.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 не з\'яўляецца серверам REChain. Выкарыстоўваць $server2 замест яго?';
  }

  @override
  String get shareInviteLink => 'Падзяліцца запрашальнай спасылкай';

  @override
  String get scanQrCode => 'Сканіраваць QR-код';

  @override
  String get noPasswordRecoveryDescription =>
      'Вы яшчэ не дадалі метад аднаўлення пароля.';

  @override
  String get noPermission => 'Няма дазволу';

  @override
  String get noRoomsFound => 'Пакоі не знойдзены…';

  @override
  String get notifications => 'Паведамленні';

  @override
  String numUsersTyping(int count) {
    return '$count карыстальнікаў пішуць…';
  }

  @override
  String get obtainingLocation => 'Атрыманне месцазнаходжання…';

  @override
  String get ok => 'Ок';

  @override
  String get onlineKeyBackupEnabled => 'Рэзервовае капіраванне ключэй уключана';

  @override
  String get oopsPushError =>
      'Упс! На жаль, пры наладжванні пуш-паведамленняў, адбылася памылка.';

  @override
  String get oopsSomethingWentWrong => 'Упс, штосьці пайшло не так…';

  @override
  String get openAppToReadMessages =>
      'Адкройце праграму, каб прачытаць паведамленні';

  @override
  String get openCamera => 'Адкрыць камеру';

  @override
  String get oneClientLoggedOut => 'Адзін з вашых кліентаў выйшаў';

  @override
  String get addAccount => 'Дадаць уліковы запіс';

  @override
  String get editBundlesForAccount =>
      'Змяніць пакеты для гэтага ўліковага запісу';

  @override
  String get addToBundle => 'Дадаць у пакет';

  @override
  String get removeFromBundle => 'Выдаліць з пакета';

  @override
  String get bundleName => 'Назва пакета';

  @override
  String get openInMaps => 'Адкрыць на картах';

  @override
  String get link => 'Спасылка';

  @override
  String get or => 'Ці';

  @override
  String get participant => 'Удзельнік';

  @override
  String get passphraseOrKey => 'фраза-пароль ці ключ аднаўлення';

  @override
  String get password => 'Пароль';

  @override
  String get passwordForgotten => 'Не памятаю пароль';

  @override
  String get passwordHasBeenChanged => 'Пароль быў зменены';

  @override
  String get passwordRecoverySettings => 'Налады скіду пароля';

  @override
  String get passwordRecovery => 'Аднаўленне пароля';

  @override
  String get pin => 'Замацаваць';

  @override
  String get pleaseChooseAPasscode => 'Калі ласка, выберыце код доступу';

  @override
  String get pleaseClickOnLink =>
      'Калі ласка, націсніце на спасылку ў лісце на email, каб працягнуць.';

  @override
  String get pleaseEnterYourPassword => 'Калі ласка, увядзіце ваш пароль';

  @override
  String get pleaseEnterYourPin => 'Калі ласка, увядзіце пін-код';

  @override
  String get pleaseEnterYourUsername =>
      'Калі ласка, увядзіце імя карыстальніка';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Калі ласка, сачыце за інстуркцыямі ў браўзеры і націсніце \"Далей\".';

  @override
  String get privacy => 'Прыватнасць';

  @override
  String get publicRooms => 'Публічныя пакоі';

  @override
  String get reason => 'Прычына';

  @override
  String redactedBy(String username) {
    return 'Адрэдагавана $username';
  }

  @override
  String redactedByBecause(String username, String reason) {
    return 'Адрэдагавана $username, прычына: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username адрэдагаваў(-ла) падзею';
  }

  @override
  String get redactMessage => 'Адрэдагаваць паведамленне';

  @override
  String get reject => 'Адмовіць';

  @override
  String rejectedTheInvitation(String username) {
    return '$username адмовіў запрашэнне';
  }

  @override
  String get removeAllOtherDevices => 'Выдаліць усе іншыя прылады';

  @override
  String get unbanFromChat => 'Разблакіраваць у чаце';

  @override
  String get removeYourAvatar => 'Выдаліць выяву ўліковага запісу';

  @override
  String get replaceRoomWithNewerVersion => 'Замяніць пакой навейшай версіяй';

  @override
  String get reply => 'Адказаць';

  @override
  String get reportMessage => 'Паведаміць пра паведамленне';

  @override
  String get roomHasBeenUpgraded => 'Пакой быў абноўлены';

  @override
  String sendingFilesDoNotExit(int count) {
    return 'Sending $count files... Please do not exit!';
  }

  @override
  String get roomVersion => 'Версія пакою';

  @override
  String get compressingVideo => 'Compressing video...';

  @override
  String get saveFile => 'Захаваць файл';

  @override
  String get search => 'Пошук';

  @override
  String get security => 'Бяспека';

  @override
  String get send => 'Даслаць';

  @override
  String get sendAMessage => 'Даслаць паведамленне';

  @override
  String get sendAsText => 'Даслаць як тэкст';

  @override
  String get sendAudio => 'Даслаць аўдыё';

  @override
  String get sendFile => 'Даслаць файл';

  @override
  String get sendImage => 'Даслаць выяву';

  @override
  String sendImages(int count) {
    return 'Даслаць $count выяў(-вы)';
  }

  @override
  String get sendMessages => 'Даслаць паведамленні';

  @override
  String get sendVideo => 'Даслаць відэа';

  @override
  String sentAFile(String username) {
    return '📁 $username даслаў файл';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username даслаў аўдыё';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username даслаў выяву';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username даслаў стыкер';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username даслаў відэа';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName даслаў інфрамацыю пра выклік';
  }

  @override
  String get setAsCanonicalAlias => 'Задаць як асноўны псеўданім';

  @override
  String get setChatDescription => 'Задаць апісанне чату';

  @override
  String get setStatus => 'Задаць статус';

  @override
  String get settings => 'Налады';

  @override
  String get share => 'Падзяліцца';

  @override
  String sharedTheLocation(String username) {
    return '$username падзяліўся(-лася) сваім месцазнаходжаннем';
  }

  @override
  String get shareLocation => 'Падзяліцца месцазнаходжаннем';

  @override
  String get skip => 'Прапусціць';

  @override
  String get sourceCode => 'Зыходны код';

  @override
  String get spaceIsPublic => 'Прастора публічна';

  @override
  String get spaceName => 'Назва прасторы';

  @override
  String startedACall(String senderName) {
    return '$senderName пачаў выклік';
  }

  @override
  String get status => 'Статус';

  @override
  String get statusExampleMessage => 'Як вашыя справы?';

  @override
  String get submit => 'Дастасаваць';

  @override
  String get synchronizingPleaseWait =>
      'Сінхранізацыя... Калі ласка, пачакайце.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Сінхарнізацыя… ($percentage%)';
  }

  @override
  String get systemTheme => 'Сістэма';

  @override
  String get theyDontMatch => 'Яны не супадаюць';

  @override
  String get theyMatch => 'Яны супадаюць';

  @override
  String get tooManyRequestsWarning =>
      'Занадта шмат запытаў. Паспрабуйце пазней!';

  @override
  String get tryToSendAgain => 'Паспрабуйце даслаць зноў';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username разблакіраваў $targetName';
  }

  @override
  String get unblockDevice => 'Разблакіраваць прыладу';

  @override
  String get unknownDevice => 'Невядомая прылада';

  @override
  String get unknownEncryptionAlgorithm => 'Невядомы алгарытм шыфравання';

  @override
  String unknownEvent(String type) {
    return 'Невядомая падзея \'$type\'';
  }

  @override
  String get unmuteChat => 'Уключыць павдеамленні чата';

  @override
  String get unpin => 'Адмацаваць';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username і $count іншых удзельнікаў пішуць…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username і $username2 пішуць…';
  }

  @override
  String userIsTyping(String username) {
    return '$username піша…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username пакінуў(-ла) чат';
  }

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username даслаў падзею $type';
  }

  @override
  String get unverified => 'Не спраўджана';

  @override
  String get verified => 'Спраўджана';

  @override
  String get verifyStart => 'Пачаць спраўджванне';

  @override
  String get verifySuccess => 'Вы паспяхова спраўджаны!';

  @override
  String get verifyTitle => 'Спраўдзіць іншы ўліковы запіс';

  @override
  String get visibilityOfTheChatHistory => 'Бачнасць гісторыі чату';

  @override
  String get visibleForAllParticipants => 'Бачна для ўсіх удзельнікаў';

  @override
  String get visibleForEveryone => 'Бачна ўсім';

  @override
  String get voiceMessage => 'Галасавое паведамленне';

  @override
  String get waitingPartnerAcceptRequest => 'Чакаем, калі партнёр прыме запыт…';

  @override
  String get waitingPartnerEmoji => 'Чакаем, калі партнёр прыме эмодзі…';

  @override
  String get waitingPartnerNumbers => 'Чакаем, калі партнёр зацвердзіць лічбы…';

  @override
  String get warning => 'Увага!';

  @override
  String get weSentYouAnEmail => 'Мы даслалі вам ліст на email';

  @override
  String get whoCanPerformWhichAction => 'Хто якія дзеянні можа выконваць';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'Каму дазволена далучацца да гэтай группы';

  @override
  String get whyDoYouWantToReportThis => 'Чаму вы хаціце паскардзіцца?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'З гэтымі адрасамі, вы сожаце аднавіць свой пароль.';

  @override
  String get writeAMessage => 'Напісать паведамленне…';

  @override
  String get yes => 'Так';

  @override
  String get you => 'Вы';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Вы больш не ўдзельнічаеце ў гэтым чаце';

  @override
  String get yourPublicKey => 'Ваш публічны ключ';

  @override
  String get messageInfo => 'Інфармацыя пра паведамленне';

  @override
  String get time => 'Час';

  @override
  String get sender => 'Адпраўшчык';

  @override
  String get openGallery => 'Адкрыць галерэю';

  @override
  String get removeFromSpace => 'Выдаліць з прасторы';

  @override
  String get markAsRead => 'Адзначыць як прачытанае';

  @override
  String get reportUser => 'Паскардзіцца на карыстальніка';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender рэагуе з $reaction';
  }

  @override
  String get pinMessage => 'Прымацаваць да пакою';

  @override
  String get confirmEventUnpin =>
      'Вы ўпэўнены ў тым, што хаціце назаўсёды адмацаваць гэту падзею?';

  @override
  String get emojis => 'Эмодзі';

  @override
  String get unsupportedAndroidVersion => 'Непадтрымліваемая версія Android';

  @override
  String get unsupportedAndroidVersionLong =>
      'Гэта функцыя патрабуе навейшай версіі Android. Калі ласка, праверце наяўнасць абнаўленняў ці падтрымку Linage OS.';

  @override
  String get youRejectedTheInvitation => 'Вы скасавалі запрашэнне';

  @override
  String get youJoinedTheChat => 'Вы далучыліся да чату';

  @override
  String get youAcceptedTheInvitation => '👍 Вы прынялі запрашэнне';

  @override
  String youBannedUser(String user) {
    return 'Вы заблакіравалі $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Вы адазвалі запрашэнне для $user';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 Вы былі запрошаны карыстальнікам $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Вы запрасілі $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Вы выгналі $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Вы выгналі і заблакіравалі $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Вы разблакіравалі $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user пагрукаўся';
  }

  @override
  String get usersMustKnock => 'Карыстальнікі абавязаны пагрукацца';

  @override
  String get noOneCanJoin => 'Ніхто не можа далучыцца';

  @override
  String get knock => 'Пагрукацца';

  @override
  String get users => 'Карыстальнікі';

  @override
  String get storeInAndroidKeystore => 'Захаваць у Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Захаваць у Apple KeyChain';

  @override
  String get storeSecurlyOnThisDevice => 'Захаваць на гэтай прыладзе';

  @override
  String countFiles(int count) {
    return '$count файлаў';
  }

  @override
  String get user => 'Карыстальнік';

  @override
  String get custom => 'Карыстальніцкае';

  @override
  String get whyIsThisMessageEncrypted =>
      'Чаму гэта паведамленне нельга прачытаць?';

  @override
  String get noKeyForThisMessage =>
      'Гэта можа здарыцца з-за таго, што паведамленне было даслана да таго, як вы увайшлі ў уліковы запіс на гэтай прыладзе.\n\nТаксама верагодна, што адпраўшчык заблакіраваў вашу прыладу ці ў вас хібы з інтэрнэтам.\n\nВы можаце чытаць гэта паведамленне з іншага сеансу? Тад дашліце паведамленне адтуль! Перайдзіце ў Налады > Прылады і пераканайцеся ў тым, што вашы прылады верыфікавалі адна адну. Калі вы адкрыеце пакой наступны раз і абодве сэсіі будуць запушчаны, ключы павінны сінхранізавацца аўтаматычна.\n\nВы не хаціце згубіць клбчы, калі будзеце выходзіць ці змяняць прылады? Пераканайцеся ў тым, што вы уключылі рэзервовае капіраванне чатаў у наладах.';

  @override
  String get newSpace => 'Новая прастора';

  @override
  String get doNotShowAgain => 'Не паказваць зноў';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Пусты чат (быў $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Прасторы дазваляюць аб\'ядноўваць вашы чаты і ствараць агульныя ці асобныя супольнасці.';

  @override
  String get encryptThisChat => 'Шыфраваць гэты чат';

  @override
  String get disableEncryptionWarning =>
      'У мэтах бяспекі, вы не можаце адклбчауь шыфраванне ў гэтым чаце, дзе яно было ўключана.';

  @override
  String get sorryThatsNotPossible => 'Прабачце... Гэта немагчыма';

  @override
  String get reopenChat => 'Адкрыць чат зноў';

  @override
  String get noBackupWarning =>
      'Увага! Без уключэння рэзервовага капіравання чатаў, вы страціце доступ да вашых зашыфраваных паведамленняў. Настойліва рэкамендуецца уключыць фукнцыю да таго, як выйсці.';

  @override
  String get noOtherDevicesFound => 'Іншыя прылады не знойдзены';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Немагчыма даслаць! Сервер падтрымлівае файлы да $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Файл быў захаваны ў $path';
  }

  @override
  String get jumpToLastReadMessage => 'Перайсці да апошняга паведамлення';

  @override
  String get readUpToHere => 'Чытаць тут';

  @override
  String get jump => 'Перайсці';

  @override
  String get openLinkInBrowser => 'Адкрыць спасылку ў браўзеры';

  @override
  String get reportErrorDescription =>
      '😭 О не, штосьці пайшло не так. Калі жадаеце, можаце падаць справаздачу аб памылке распрауоўшчыкам.';

  @override
  String get report => 'паскардзіцца';

  @override
  String get setColorTheme => 'Каляровая схема:';

  @override
  String get invite => 'Запрасіць';

  @override
  String get inviteGroupChat => '📨 Запрашэнне ў групавы чат';

  @override
  String get invalidInput => 'Недапушчальны ўвод!';

  @override
  String wrongPinEntered(int seconds) {
    return 'Няверны пін-код! Паспрабуйце праз $seconds секунд...';
  }

  @override
  String get pleaseEnterANumber => 'Калі ласка, увядзіце лічбу большую за 0';

  @override
  String get archiveRoomDescription =>
      'Чат перамясціцца ў архіў. Іншыя карыстальнікі будуць бачыць гэта так, быццам вы выйшлі з чату.';

  @override
  String get roomUpgradeDescription =>
      'Чат будзе пераствораны з новай версіяй пакою. Усе ўдзельнікі будуць паведамлены пра неабходнасць перайсці ў новы чат. Вы можаце даведацца пра версіі пакояў тут: https://github.com/sorydima/REChain-.git';

  @override
  String get removeDevicesDescription =>
      'Вы выйдзеце з гэтай прылады і больш не будзеце атрымліваць паведамленні.';

  @override
  String get banUserDescription =>
      'Карыстальнік будзе заблакіраваны з чату і больш не зможа ўвайсці, пакуль вы яго не разблакіруеце.';

  @override
  String get unbanUserDescription =>
      'Карыстальнік зможа зноў далучыцца да чату.';

  @override
  String get kickUserDescription =>
      'Карыстальнік будзе выгнаны, але не заблакіраваны. У публічных чатах, ён зможа далучыцца зноў у любы час.';

  @override
  String get makeAdminDescription =>
      'Калі вы зробіце карыстальніка адміністратарам, вы не зможаце адмяніць гэта дзеянне, бо ён будзе мець такія ж правы, як і вы.';

  @override
  String get pushNotificationsNotAvailable => 'Пуш-паведамленні недаступны';

  @override
  String get learnMore => 'Даведацца больш';

  @override
  String get yourGlobalUserIdIs => 'Ваш глабальны ID-карыстальніка: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'На жаль, мы не змаглі знайсці карыстальніка з імём \"$query\". Калі ласка, праверце наяўнасць памылак.';
  }

  @override
  String get knocking => 'Грукацца';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Чат можа быць знойдзены праз пошук у $server';
  }

  @override
  String get searchChatsRooms => 'Пошук #чатаў, @карыстальнікаў...';

  @override
  String get nothingFound => 'Нічога не знойдзена...';

  @override
  String get groupName => 'Назва групы';

  @override
  String get createGroupAndInviteUsers =>
      'Стварыць групу і запрасіць карыстальнікаў';

  @override
  String get groupCanBeFoundViaSearch => 'Група можа быць знойдзена праз пошук';

  @override
  String get wrongRecoveryKey =>
      'Прабачце... гэта не выглядае як ключ аднаўлення.';

  @override
  String get commandHint_sendraw => 'Даслаць толькі json';

  @override
  String get databaseMigrationTitle => 'База даных аптымізавана';

  @override
  String get databaseMigrationBody =>
      'Калі ласка, пачакайце. Гэта можа заняць некаторы час.';

  @override
  String get leaveEmptyToClearStatus =>
      'Пакіньце пустым, каб ачысціць свой статус.';

  @override
  String get select => 'Выбраць';

  @override
  String get searchForUsers => 'Пошук @карыстальнікаў...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Калі ласка, увядзіце свой бягучы пароль';

  @override
  String get newPassword => 'Новы пароль';

  @override
  String get pleaseChooseAStrongPassword =>
      'Калі ласка, падбярыце больш надзейны пароль';

  @override
  String get passwordsDoNotMatch => 'Паролі не супадаюць';

  @override
  String get passwordIsWrong => 'Вы ўвялі няверны пароль';

  @override
  String get publicChatAddresses => 'Публічныя адрасы чату';

  @override
  String get createNewAddress => 'Стварыць новы адрас';

  @override
  String get joinSpace => 'Далучыцца да прасторы';

  @override
  String get publicSpaces => 'Публічныя прасторы';

  @override
  String get addChatOrSubSpace => 'Дадаць чат ці пад-прастору';

  @override
  String get thisDevice => 'Гэта прылада:';

  @override
  String get initAppError => 'Адбылася памылка пры ініцыялізацыі праграмы';

  @override
  String searchIn(String chat) {
    return 'Пошук у чаце \"$chat\"...';
  }

  @override
  String get searchMore => 'Шукаць яшчэ...';

  @override
  String get gallery => 'Галерэя';

  @override
  String get files => 'Файлы';

  @override
  String sessionLostBody(String url, String error) {
    return 'Ваш сеанс страчаны. Калі ласка, паведаміце пра гэта распрацоўшчыкам: $url. Паведамленне памылкі: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Праграма спрабуе аднавіць вашу сесію з рэзервовай копіі. Калі ласка, паведаміце пра памылку распрацоўшчыкам па спасылцы $url. Паведамленне памылкі: $error';
  }

  @override
  String get sendReadReceipts => 'Дасылаць адзнаку аб чытанні';

  @override
  String get sendTypingNotificationsDescription =>
      'Іншыя ўдзельнікі чату могуць бачыць, калі вы пішаце новае паведамленне.';

  @override
  String get sendReadReceiptsDescription =>
      'Іншыя карыстальнікі чатаў будуць бачыць, калі вы прачыталі паведамленні.';

  @override
  String get formattedMessages => 'Фармаціраваныя паведамленні';

  @override
  String get formattedMessagesDescription =>
      'Адлюстроўваць пашыраныя паведамленні разметкай markdown.';

  @override
  String get verifyOtherUser => '🔐 Спраўдзіць іншага карыстальніка';

  @override
  String get verifyOtherUserDescription =>
      'Калі вы спраўдзілі іншага карыстальніка, вы можаце быць упэўненым з кім вы сапраўды перапісваецеся.💪\n\nКалі вы пачнеце спраўджванне, вы і іншы карыстальнік, убачыце ўсплывальнае акно ў праграме. У ім вы ўбачыце некалькі эмодзі ці лічб, якія вы павінны параўнаць адзін з адным.\n\nЛепшы метад зрабіць гэта - пачаць відэа выклік. 👭';

  @override
  String get verifyOtherDevice => '🔐 Спраўдзіць іншую прыладу';

  @override
  String get verifyOtherDeviceDescription =>
      'Калі вы спраўдзіце другую прыладу, яны абмяняюцца ключамі, якія ўзмоцняць вашу бяспеку. 💪 Калі вы пачнеце спраўджванне, у праграмах прылад з\'явіцца ўсплывальнае паведамленне. Потым, вы ўбачыце некалькі эмодзі ці лічбаў, якія вы павінны параўнаць паміж сабой. Прасцей за ўсё гэта зрабіць, маючы дзве прылады побач. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender прыняў(-ла) спраўджванне ключэй';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender адхіліў(-ла) спраўджванне ключэй';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender скочныў(-ла) спраўджванне ключэй';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender гатовы(-а) да спраўджвання ключэй';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender запрасіў(-ла) спраўджванне ключэй';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender пачаў(-ла) спраўджванне ключэй';
  }

  @override
  String get incomingMessages => 'Уваходныя паведамленні';

  @override
  String get stickers => 'Стыкеры';

  @override
  String get discover => 'Даследаваць';

  @override
  String get commandHint_ignore => 'Ігнараваць дадзены REChain ID';

  @override
  String get commandHint_unignore => 'Перастаць ігнараваць дадзены REChain ID';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread непрачытаных чатаў';
  }

  @override
  String get noDatabaseEncryption =>
      'Шыфраванне базы даных не падтрымліваецца гэтай платформай';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'На гэты момант, $count карыстальнікаў заблакіравана.';
  }

  @override
  String goToSpace(Object space) {
    return 'Перайсці да прасторы: $space';
  }

  @override
  String get markAsUnread => 'Адзначыць як непрачытанае';

  @override
  String userLevel(int level) {
    return '$level - Карыстальнік';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Мадэратар';
  }

  @override
  String adminLevel(int level) {
    return '$level - Адміністратар';
  }

  @override
  String get changeGeneralChatSettings => 'Змяніць агульныя налады чату';

  @override
  String get inviteOtherUsers => 'Запрасіць іншых карыстальнікаў у гэты чат';

  @override
  String get changeTheChatPermissions => 'Змяніць дазволы чату';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Змяніць бачнасць гісторыі чату';

  @override
  String get changeTheCanonicalRoomAlias => 'Змяніць публічны адрас чату';

  @override
  String get sendRoomNotifications => 'Дасылаць паведамленні @room';

  @override
  String get changeTheDescriptionOfTheGroup => 'Змяніць апісанне чату';

  @override
  String get chatPermissionsDescription =>
      'Задаць узровень дазволаў, які неабходны для некаторых дзеянняў у чаце. Узроўні 0, 50 і 100 звычайна адлюстроўваюць карыстальнікаў, мадэратараў і адміністратараў, але любая градацыя магчыма.';

  @override
  String updateInstalled(String version) {
    return '🎉 Абнаўленне $version усталявана!';
  }

  @override
  String get changelog => 'Спіс змен';

  @override
  String updateAvailable(String version) {
    return 'Update $version available';
  }

  @override
  String get download => 'Download';

  @override
  String get sendCanceled => 'Адпраўка скасавана';

  @override
  String get loginWithREChainId => 'Login with REChain-ID';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Гэта не выглядае як дамашні сервер. Няслушны URL?';

  @override
  String get calculatingFileSize => 'Вылічэнне памеру файла...';

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Адна з вашых прылад не спраўджана';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Заўвага: Калі вы падключыце ўсе свае прылады да рэзервовага капіравання, яны аўтаматычна спраўдзяцца.';

  @override
  String get continueText => 'Працягнуць';

  @override
  String get blur => 'Размыццё:';

  @override
  String get opacity => 'Празрыстасць:';

  @override
  String get setWallpaper => 'Задаць шпалеры';

  @override
  String get manageAccount => 'Кіраванне ўліковым запісам';

  @override
  String get noContactInformationProvided =>
      'Сервер не мае ніякай вернай кантактнай інфармацыі';

  @override
  String get contactServerAdmin => 'Звязацца з адміністратарам сервера';

  @override
  String get contactServerSecurity => 'Звязацца з сервернай бяспекай';

  @override
  String get supportPage => 'Падтрымка';

  @override
  String get serverInformation => 'Серверная інфармацыя:';

  @override
  String get name => 'Імя';

  @override
  String get version => 'Версія';

  @override
  String get website => 'Сайт';

  @override
  String get compress => 'Сцісканне';

  @override
  String get boldText => 'Цёмны';

  @override
  String get italicText => 'Курсіў';

  @override
  String get strikeThrough => 'Перакрэслены';

  @override
  String get pleaseFillOut => 'Калі ласка, запоўніце';

  @override
  String get invalidUrl => 'Няслушны url';

  @override
  String get addLink => 'Дадаць спасылку';

  @override
  String get unableToJoinChat =>
      'Немагчыма далучыцца да чату. Магчыма, іншы бок ужо скончыў размову.';

  @override
  String get previous => 'Мінулы';

  @override
  String get otherPartyNotLoggedIn =>
      'Іншы бок зараз не увайшоў, таму не можа атрымліваць паведамленні!';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Выкарыстоўваць \'$server\' для ўвахода';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Тым самым, вы дазваляеце праграме і сайту дзяліцца інфармацыяй пра вас.';

  @override
  String get open => 'Адкрыць';

  @override
  String get waitingForServer => 'Чаканне сервера...';

  @override
  String get newChatRequest => '📩 Запыт новага чату';

  @override
  String get contentNotificationSettings => 'Налады паведамленняў кантэнту';

  @override
  String get generalNotificationSettings => 'Агульныя налады паведамленняў';

  @override
  String get roomNotificationSettings => 'Налады паведамленняў пакою';

  @override
  String get userSpecificNotificationSettings =>
      'Налады паведамленняў карыстальніка';

  @override
  String get otherNotificationSettings => 'Іншыя налады паведамленняў';

  @override
  String get notificationRuleContainsUserName => 'Змяшчае імя карыстальніка';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Паведамляе пра тое, што паведамленне мае імя карыстальніка.';

  @override
  String get notificationRuleMaster => 'Заглушыць усе паведамленні';

  @override
  String get notificationRuleMasterDescription =>
      'Перазапісвае ўсе іншыя правілы і адключае паведамленні.';

  @override
  String get notificationRuleSuppressNotices =>
      'Адключыць аўтаматычныя паведамленні';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Адключыць паведамленні ад аўтаматызаваных кліентаў, накшталт ботаў.';

  @override
  String get notificationRuleInviteForMe => 'Запрашэнне мяне';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Паведамляе карыстальніка, калі яго запрашаюць у пакой.';

  @override
  String get notificationRuleMemberEvent => 'Падзеі ўдзельніцтва';

  @override
  String get notificationRuleMemberEventDescription =>
      'Спыніць усе паведамленні пра ўдзельніцтва.';

  @override
  String get notificationRuleIsUserMention => 'Згадванні карыстальніка';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Паведамляе, калі карыстальніка згадалі ў паведамленні.';

  @override
  String get notificationRuleContainsDisplayName => 'Мае адлюстроўваемае імя';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Паведамляе, калі паведамленне мае іх адлюстроўваемае імя.';

  @override
  String get notificationRuleIsRoomMention => 'Згадванні пакою';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Паведамляе карыстальніка, калі згадваюць пакой.';

  @override
  String get notificationRuleRoomnotif => 'Паведамленні пакою';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Паведамляе пра згадванні \'@room\'.';

  @override
  String get notificationRuleTombstone => 'Помнік';

  @override
  String get notificationRuleTombstoneDescription =>
      'Паведамляе пра дэактывацыю пакою.';

  @override
  String get notificationRuleReaction => 'Рэакцыя';

  @override
  String get notificationRuleReactionDescription =>
      'Адключыць усе паведамленні пра рэакцыі.';

  @override
  String get notificationRuleRoomServerAcl => 'ACL сервера пакою';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Адключыць паведамленні пра серверныя спісы кантролю пакою (ACL).';

  @override
  String get notificationRuleSuppressEdits => 'Заглушыць змены';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Заглушыць паведамленні пра адрэдагаваныя паведамленні.';

  @override
  String get notificationRuleCall => 'Выклік';

  @override
  String get notificationRuleCallDescription => 'Паведамляе пра выклікі.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'Шыфраваны пакой One-to-One';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Паведамляе пра паведамленні ў шыфраваных one-to-one пакоях.';

  @override
  String get notificationRuleRoomOneToOne => 'Пакой One-to-One';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Паведамляе пра паведамленні ў пакоях one-to-one.';

  @override
  String get notificationRuleMessage => 'Паведамленне';

  @override
  String get notificationRuleMessageDescription =>
      'Паведамляе пра звычайныя паведамленні.';

  @override
  String get notificationRuleEncrypted => 'Зашыфравана';

  @override
  String get notificationRuleEncryptedDescription =>
      'Паведамляе пра паведамленні ў зашыфраваных пакоях.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Паведамляе пра падзеі віджэту Jitsi.';

  @override
  String get notificationRuleServerAcl => 'Заглушыць серверныя падзеі ACL';

  @override
  String get notificationRuleServerAclDescription =>
      'Заглушыць паведамленні пра серверныя падзеі ACL.';

  @override
  String unknownPushRule(String rule) {
    return 'Невядомае правіла пуша \'$rule\'';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return '🎙️$duration - Галасавое паведамленне ад $sender';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Калі вы выдаліце гэтыя налады паведамленняў, гэта не можа быць адменена.';

  @override
  String get more => 'Больш';

  @override
  String get shareKeysWith => 'Падзяліцца ключамі з...';

  @override
  String get shareKeysWithDescription =>
      'Якім прыладам вы давяраеце настолькі, каб яны маглі чытаць вашыя зашыфраваныя паведамленні?';

  @override
  String get allDevices => 'Усе прылады';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'З перакрыжаваным спраўджваннем прылад, калі ўключана';

  @override
  String get crossVerifiedDevices => 'Перакрыжавана спраўджаныя прылады';

  @override
  String get verifiedDevicesOnly => 'Толькі спраўджаныя прылады';

  @override
  String get takeAPhoto => 'Зрабіць здымак';

  @override
  String get recordAVideo => 'Запісаць відэа';

  @override
  String get optionalMessage => '(Апцыянальна) паведамленне...';

  @override
  String get notSupportedOnThisDevice => 'Не падтрымліваецца на гэтай прыладзе';

  @override
  String get enterNewChat => 'Увядзіце новы чат';

  @override
  String get approve => 'Пацвердзіць';

  @override
  String get youHaveKnocked => 'Вы былі выгнаны';

  @override
  String get pleaseWaitUntilInvited =>
      'Калі ласка, пачакайце, пакуль хтосьці з пакою вас не запрасіць.';

  @override
  String get commandHint_logout => 'Выйсці з бягуяай прылады';

  @override
  String get commandHint_logoutall => 'Выйсці на ўсіх актыўных прыладах';

  @override
  String get displayNavigationRail => 'Паказваць навігацыйны след на тэлефоне';

  @override
  String get customReaction => 'Карыстальніцкая рэакцыя';

  @override
  String get moreEvents => 'Больш падзей';

  @override
  String get showMore => 'Show more';

  @override
  String get showLess => 'Show less';

  @override
  String get declineInvitation => 'Скасаваць запрашэнне';

  @override
  String get noMessagesYet => 'Паведамленняў пакуль што няма';

  @override
  String get longPressToRecordVoiceMessage =>
      'Доўга цісніце, каб запісаць галасавое паведамленне.';

  @override
  String get pause => 'Паўза';

  @override
  String get resume => 'Працягнуць';

  @override
  String get removeFromSpaceDescription =>
      'Гэты чат будзе выдалены з прасторы, але з\'явіцца ў вашым спісе чатаў.';

  @override
  String countChats(int chats) {
    return '$chats чатаў';
  }

  @override
  String spaceMemberOf(String spaces) {
    return 'Удзельнік прасторы $spaces';
  }

  @override
  String spaceMemberOfCanKnock(String spaces) {
    return 'Удзельнікі прасторы з $spaces могуць грукацца';
  }

  @override
  String get startPoll => 'Пачаць апытанне';

  @override
  String get endPoll => 'Скончыць апытанне';

  @override
  String get answersVisible => 'Адказы бачны';

  @override
  String get pollQuestion => 'Пытанне апытання';

  @override
  String get answerOption => 'Варыянт адказу';

  @override
  String get addAnswerOption => 'Дадаць варыянт адказу';

  @override
  String get allowMultipleAnswers => 'Дазволіць некалькі адказаў';

  @override
  String get pollHasBeenEnded => 'Апытанне было скончана';

  @override
  String countVotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count галасы(-оў)',
      one: 'Адзін голас',
    );
    return '$_temp0';
  }

  @override
  String get answersWillBeVisibleWhenPollHasEnded =>
      'Вынікі будуць бачны, калі апытанне скончыцца';

  @override
  String get replyInThread => 'Адказаць у гутарку';

  @override
  String countReplies(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count адказа(-ў)',
      one: 'Адзін адказ',
    );
    return '$_temp0';
  }

  @override
  String get thread => 'Гутарка';

  @override
  String get backToMainChat => 'Вярнуцца ў галоўны чат';

  @override
  String get saveChanges => 'Захаваць змены';

  @override
  String get createSticker => 'Стварыць стыкер ці эмадзі';

  @override
  String get useAsSticker => 'Ужыць як стыкер';

  @override
  String get useAsEmoji => 'Ужыць як эмадзі';

  @override
  String get stickerPackNameAlreadyExists => 'Назва набору стыкераў ужо існуе';

  @override
  String get newStickerPack => 'Новы набор стыкераў';

  @override
  String get stickerPackName => 'Назва набору стыкераў';

  @override
  String get attribution => 'Атрыбуцыя';

  @override
  String get skipChatBackup => 'Прапусціць рэзервовае капіраванне чатаў';

  @override
  String get skipChatBackupWarning =>
      'Вы ўпэўнены? Без наладжвання рэзервовага капіравання чатаў, вы можаце згубіць доступ да ўсіх вашых чатаў, калі вы зменіце прыладу.';

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
  String get loadingMessages => 'Загрузка паведамленняў';

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
      'Звярніце ўвагу, што відэа выклікі знаходзяцца ў бэце. Яны могуць працаваць некарэктна ці не на ўсіх платформах.';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get incomingCall => 'Incoming call';

  @override
  String get videoCall => 'Відэа выклік';

  @override
  String get voiceCall => 'Галасавы выклік';

  @override
  String get missedCall => 'Missed call';

  @override
  String get callBack => 'Call back';

  @override
  String get hangUp => 'Hang up';

  @override
  String get waitingForParticipant => 'Waiting for participant...';

  @override
  String get decline => 'Адхіліць';

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
