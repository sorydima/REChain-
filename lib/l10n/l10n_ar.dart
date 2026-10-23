// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class L10nAr extends L10n {
  L10nAr([String locale = 'ar']) : super(locale);

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
  String get repeatPassword => 'كرّر كلمة السر';

  @override
  String get notAnImage => 'ليس ملف صورة.';

  @override
  String get remove => 'أزِل';

  @override
  String get importNow => 'استيراد الآن';

  @override
  String get importEmojis => 'استيراد الرموز التعبيرية';

  @override
  String get importFromZipFile => 'الاستيراد من ملف .zip';

  @override
  String get exportEmotePack => 'تصدير حزمة الرموز التعبيرية بتنسيق zip';

  @override
  String get replace => 'استبدال';

  @override
  String get about => 'حول';

  @override
  String aboutHomeserver(String homeserver) {
    return 'حول $homeserver';
  }

  @override
  String get accept => 'أقبل';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username قبل الدعوة';
  }

  @override
  String get account => 'الحساب';

  @override
  String get accountsAndSettings => 'Accounts and settings';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 تم تنشيط $username التشفير من طرف إلى طرف';
  }

  @override
  String get addEmail => 'أضف بريدًا إلكترونيًا';

  @override
  String get confirmREChainId =>
      'Please confirm your REChain ID in order to delete your account.';

  @override
  String supposedMxid(String mxid) {
    return 'يجب أن يكون هذا $mxid';
  }

  @override
  String get addToSpace => 'أضف إلى المساحة';

  @override
  String get admin => 'المدير';

  @override
  String get alias => 'اللقب';

  @override
  String get all => 'الكل';

  @override
  String get commandHint_roomupgrade =>
      'Upgrade this room to the given room version';

  @override
  String get commandHint_googly => 'أرسل بعض عيون googly';

  @override
  String get commandHint_cuddle => 'أرسل عناق';

  @override
  String get commandHint_hug => 'إرسال حضن';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName يرسل لك عيون googly';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName يحتضنك';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName يعانقك';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName أجاب على المكالمة';
  }

  @override
  String get anyoneCanJoin => 'يمكن لأي أحد الدخول';

  @override
  String get appLock => 'قفل التطبيق';

  @override
  String get appLockDescription => 'قفل التطبيق عند عدم استخدامه بالرمز السري';

  @override
  String get archive => 'الأرشيف';

  @override
  String get areGuestsAllowedToJoin => 'هل يُسمح للزوار الدخول';

  @override
  String get areYouSure => 'أمتأكد؟';

  @override
  String get discardEdits => 'You have unsaved changes. Discard your edits?';

  @override
  String get areYouSureYouWantToLogout => 'أمتأكد من الخروج؟';

  @override
  String get askSSSSSign =>
      'لتتمكن من التأكد من الشخص الآخر، يرجى إدخال عبارة المرور أو مفتاح الاسترداد.';

  @override
  String askVerificationRequest(String username) {
    return 'أتقبل طلب تحقق $username؟';
  }

  @override
  String get autoplayImages => 'شغِّل الملصقات والوجوه المتحركة تلقائيا';

  @override
  String badServerLoginTypesException(
    String serverVersions,
    String supportedVersions,
    Object suportedVersions,
  ) {
    return 'يدعم الخادم المستخدم أنواع تسجيل الدخول التالية:\n$serverVersions\nلكن هذا التطبيق يدعم فقط:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'إرسال إشعارات الكتابة';

  @override
  String get swipeRightToLeftToReply => 'اسحب من اليمين إلى اليسار للرد';

  @override
  String get sendOnEnter => 'أرسل عند الدخول';

  @override
  String get noMoreChatsFound => 'لم يتم العثور على دردشات...';

  @override
  String get noChatsFoundHere =>
      'لم يتم العثور على دردشات هنا حتى الآن. ابدأ محادثة جديدة مع شخص ما باستخدام الزر أدناه. ⤵️';

  @override
  String get unread => 'غير المقروءة';

  @override
  String get space => 'المساحة';

  @override
  String get banFromChat => 'حظر من المحادثة';

  @override
  String get banned => 'محظور';

  @override
  String bannedUser(String username, String targetName) {
    return '$username حظر $targetName';
  }

  @override
  String get blockDevice => 'أُحظر الجهاز';

  @override
  String get blocked => 'محجوب';

  @override
  String get cancel => 'ألغِ';

  @override
  String cantOpenUri(String uri) {
    return 'تعذر فتح المسار $uri';
  }

  @override
  String get changeDeviceName => 'غيّر اسم الجهاز';

  @override
  String changedTheChatAvatar(String username) {
    return 'غيَّر $username صورة المحادثة';
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
    return 'غيَّر $username أذون المحادثة';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username غير إسمه العلني إلى: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return 'غيّر $username قواعد وصول الزوار';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return 'غيّر $username قواعد وصول الزوار الى: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return 'غيَّر $username مرئية التأريخ';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return 'غيَّر $username مرئية التأريخ الى: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return 'غيَّر $username قواعد الانضمام';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return 'غيَّر $username قواعد الانضمام الى: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return 'غيّر $username صورته الشخصية';
  }

  @override
  String changedTheRoomAliases(String username) {
    return 'غيّر $username ألقاب الغرف';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return 'غيّر $username رابط الدعوة';
  }

  @override
  String get changePassword => 'غيّر كلمة السر';

  @override
  String get changeTheHomeserver => 'غيّر الخادم';

  @override
  String get changeTheme => 'غيّر أسلوبك';

  @override
  String get changeTheNameOfTheGroup => 'غيِّر اسم المجموعة';

  @override
  String get changeYourAvatar => 'غيّر الصورة الرمزية';

  @override
  String get channelCorruptedDecryptError => 'فسُد التشفير';

  @override
  String get chat => 'محادثة';

  @override
  String get chatBackup => 'النسخ الاحتياطي للمحادثات';

  @override
  String get chatDetails => 'تفاصيل المحادثة';

  @override
  String get chats => 'المحادثات';

  @override
  String get chooseAStrongPassword => 'اختر كلمة سر قوية';

  @override
  String get clearArchive => 'امسح الأرشيف';

  @override
  String get close => 'اغلق';

  @override
  String get commandHint_markasdm =>
      'وضع علامة على أنها غرفة رسائل مباشرة لمعرف المصفوفة';

  @override
  String get commandHint_markasgroup => 'وضع علامة كمجموعة';

  @override
  String get commandHint_ban => 'يحظر المستخدم المذكور من هذه الغرفة';

  @override
  String get commandHint_clearcache => 'مسح الذاكرة المؤقتة';

  @override
  String get commandHint_create =>
      'أنشأ محادثة جماعية فارغة\nاستخدم --لا-تشفير لتعطيل التشفير';

  @override
  String get commandHint_discardsession => 'إنهاء الجلسة';

  @override
  String get commandHint_dm =>
      'إبدأ محادثة مباشرة\nاستخدم --لا-تشفير لتعطيل التشفير';

  @override
  String get commandHint_html => 'أرسل نصًا بتنسيق HTML';

  @override
  String get commandHint_invite => 'يدعو المستخدم المذكور الى الغرفة';

  @override
  String get commandHint_join => 'تنضم الى الغرفة المذكورة';

  @override
  String get commandHint_kick => 'يزيل المستخدم المذكور من الغرفة';

  @override
  String get commandHint_leave => 'تغادر هذه الغرفة';

  @override
  String get commandHint_me => 'صف نفسك';

  @override
  String get commandHint_myroomavatar =>
      'حدد صورتك لهذه الغرفة (عن طريق mxc-uri)';

  @override
  String get commandHint_myroomnick => 'عين اسمًا لك مخصص لهذه الغرفة';

  @override
  String get commandHint_op =>
      'عين مستوى نفوذ المستخدم في هذه الغرفة (الافتراضي: 50)';

  @override
  String get commandHint_plain => 'أرسل نصًا غير منسق';

  @override
  String get commandHint_react => 'أرسل ردًا كتفاعل';

  @override
  String get commandHint_send => 'أرسل نصًا';

  @override
  String get commandHint_unban => 'فك الحظر عن المستخدم المذكور في هذه الغرفة';

  @override
  String get commandInvalid => 'أمر غير صالح';

  @override
  String commandMissing(String command) {
    return '$command ليس بأمر.';
  }

  @override
  String get compareEmojiMatch => 'يرجى مقارنة الرموز التعبيرية';

  @override
  String get compareNumbersMatch => 'الرجاء مقارنة الأرقام';

  @override
  String get configureChat => 'ضبط المحادثة';

  @override
  String get contactHasBeenInvitedToTheGroup => 'دعيَ المراسل للمجموعة';

  @override
  String get contentHasBeenReported => 'أّرسل الابلاغ الى مدير الخادم';

  @override
  String get copiedToClipboard => 'نُسخ للحافظة';

  @override
  String get copy => 'انسخ';

  @override
  String get copyToClipboard => 'انسخ الى الحافظة';

  @override
  String couldNotDecryptMessage(String error) {
    return 'تعذر فك تشفير الرسالة: $error';
  }

  @override
  String get checkList => 'Check list';

  @override
  String countParticipants(int count) {
    return '$count منتسبا';
  }

  @override
  String countInvited(int count) {
    return '$count invited';
  }

  @override
  String get create => 'أنشئ';

  @override
  String createdTheChat(String username) {
    return '💬 أنشأ $username المحادثة';
  }

  @override
  String get createGroup => 'إنشاء مجموعة';

  @override
  String get createNewSpace => 'مساحة جديدة';

  @override
  String get currentlyActive => 'نشطٌ حاليا';

  @override
  String get darkTheme => 'داكن';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String get deactivateAccountWarning => 'لا مجال للعودة، أتأكد تعطيل حسابك؟';

  @override
  String get defaultPermissionLevel =>
      'مستوى الأذونات الافتراضية للمستخدمين الجدد';

  @override
  String get delete => 'احذف';

  @override
  String get deleteAccount => 'احذف الحساب';

  @override
  String get deleteMessage => 'حذف الرسالة';

  @override
  String get devices => 'الأجهزة';

  @override
  String get directChats => 'محادثات مباشرة';

  @override
  String get displaynameHasBeenChanged => 'غُيِّر الاسم العلني';

  @override
  String get downloadFile => 'نزِّل الملف';

  @override
  String get edit => 'عدّل';

  @override
  String get editBlockedServers => 'عدّل الخوادم المحجوبة';

  @override
  String get chatPermissions => 'صلاحيات المحادثة';

  @override
  String get editDisplayname => 'حرر الاسم العلني';

  @override
  String get editRoomAliases => 'عدّل الاسم المميز للغرفة';

  @override
  String get editRoomAvatar => 'عدّل الصورة الرمزية للغرفة';

  @override
  String get emoteExists => 'الانفعالة موجودة مسبقا!';

  @override
  String get emoteInvalid => 'رمز الانفعالة غير صالح!';

  @override
  String get emoteKeyboardNoRecents =>
      'التعبيرات المستخدمة مؤخرًا ستظهر هنا ...';

  @override
  String get globalChatId => 'معرف المحادثة العامة';

  @override
  String get accessAndVisibility => 'الوصول والرؤية';

  @override
  String get accessAndVisibilityDescription =>
      'من المسموح له بالانضمام إلى هذه المحادثة وكيف يمكن اكتشاف المحادثة.';

  @override
  String get customEmojisAndStickers => 'الرموز التعبيرية والملصقات المخصصة';

  @override
  String get customEmojisAndStickersBody =>
      'قم بإضافة أو مشاركة الرموز التعبيرية أو الملصقات المخصصة التي يمكن استخدامها في أي دردشة.';

  @override
  String get emoteShortcode => 'رمز الانفعالة';

  @override
  String get emptyChat => 'محادثة فارغة';

  @override
  String get enableEmotesGlobally => 'تفعيل حزمة التعبيرات بشكل عام';

  @override
  String get enableEncryption => 'فعّل التشفير';

  @override
  String get enableEncryptionWarning => 'لن يمكنك تعطيل التشفير أبدا، أمتأكد؟';

  @override
  String get encrypted => 'مشفر';

  @override
  String get encryption => 'التشفير';

  @override
  String get encryptionNotEnabled => 'التشفير معطل';

  @override
  String endedTheCall(String senderName) {
    return 'أنهى $senderName المكالمة';
  }

  @override
  String get enterAnEmailAddress => 'أدخل عنوان بريد إلكتروني';

  @override
  String errorObtainingLocation(String error) {
    return 'خطأ أثناء الحصول على الموقع: $error';
  }

  @override
  String get fontSize => 'حجم الخط';

  @override
  String get forward => 'أعد التوجيه';

  @override
  String get fromJoining => 'من بعد الانضمام';

  @override
  String get fromTheInvitation => 'من بعد الدعوة';

  @override
  String get group => 'المجموعة';

  @override
  String get chatDescription => 'وصف المحادثة';

  @override
  String get chatDescriptionHasBeenChanged => 'تغير وصف المجموعة';

  @override
  String get groupIsPublic => 'المجموعة عامة';

  @override
  String get groups => 'المجموعات';

  @override
  String groupWith(String displayname) {
    return 'في مجموعة مع $displayname';
  }

  @override
  String get guestsAreForbidden => 'يمنع الزوار';

  @override
  String get guestsCanJoin => 'يمكن للزوار الانضمام';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return 'سحب $username دعوة $targetName';
  }

  @override
  String get help => 'المساعدة';

  @override
  String get hideRedactedMessages => 'إخفاء الرسائل المكررة';

  @override
  String get hideRedactedMessagesBody =>
      'إذا قام شخص ما بتنقيح رسالة، فلن تكون هذه الرسالة مرئية في المحادثة بعد الآن.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'إخفاء تنسيقات الرسائل غير الصالحة أو غير المعروفة';

  @override
  String get block => 'حظر';

  @override
  String get blockedUsers => 'المستخدمون المحظورون';

  @override
  String get blockListDescription =>
      'يمكنك حظر المستخدمين الذين يزعجونك. لن تتمكن من تلقي أي رسائل أو دعوات للغرفة من المستخدمين الموجودين في قائمة الحظر الشخصية الخاصة بك.';

  @override
  String get blockUsername => 'تجاهل اسم المستخدم';

  @override
  String get iHaveClickedOnLink => 'نقرت على الرابط';

  @override
  String get incorrectPassphraseOrKey => 'عبارة مرور أو مفتاح استرداد خطأ';

  @override
  String get inviteContact => 'دعوة مراسل';

  @override
  String inviteContactToGroup(String groupName) {
    return 'أدعو مراسلا الى $groupName';
  }

  @override
  String get noChatDescriptionYet => 'لم يتم إنشاء وصف للمحادثة حتى الآن.';

  @override
  String get tryAgain => 'أعد المحاولة';

  @override
  String get invalidServerName => 'اسم الخادم غير متاح';

  @override
  String get invited => 'دُعيَ';

  @override
  String get redactMessageDescription =>
      'سيتم تنقيح الرسالة لجميع المشاركين في هذه المحادثة. هذا لا يمكن التراجع عنها.';

  @override
  String get optionalRedactReason => '(اختياري) سبب تنقيح هذه الرسالة ...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username دعا $targetName';
  }

  @override
  String get invitedUsersOnly => 'المستخدمون المدعوون فقط';

  @override
  String inviteText(String username, String link) {
    return 'دعاك $username إلى REChain.\n1. قم بزيارة موقع github.com/sorydima/REChain- وقم بتثبيت التطبيق\n2. قم بإنشاءحساب أو تسجيل الدخول\n3. افتح رابط الدعوة:\n $link';
  }

  @override
  String get isTyping => 'يكتب…';

  @override
  String joinedTheChat(String username) {
    return '👋 انضم $username إلى المحادثة';
  }

  @override
  String get joinRoom => 'انضم للمحادثة';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username ركل $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username ركل وحظر $targetName';
  }

  @override
  String get kickFromChat => 'طرد من المحادثة';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'آخر نشاط: $localizedTimeShort';
  }

  @override
  String get leave => 'غادر';

  @override
  String get leftTheChat => 'غادر المحادثة';

  @override
  String get lightTheme => 'فاتح';

  @override
  String loadCountMoreParticipants(int count) {
    return 'حمِّل $count منتسبًا إضافيًا';
  }

  @override
  String get dehydrate => 'تصدير الجلسة ومسح الجهاز';

  @override
  String get dehydrateWarning =>
      'لا يمكن التراجع عن هذا الإجراء. تأكد من تخزين ملف النسخ الاحتياطي بأمان.';

  @override
  String get hydrate => 'استعادة من ملف النسخ الاحتياطي';

  @override
  String get loadingPleaseWait => 'يحمّل… يرجى الانتظار.';

  @override
  String get loadMore => 'حمِّل المزيد…';

  @override
  String get locationDisabledNotice =>
      'خدمات الموقع معطلة. مكنها لتتمكن من مشاركة موقعك.';

  @override
  String get locationPermissionDeniedNotice =>
      'تم رفض إذن الموقع. الرجاء منح الإذن للقدرة على مشاركة موقعك.';

  @override
  String get login => 'لِج';

  @override
  String logInTo(String homeserver) {
    return 'لِج ل $homeserver';
  }

  @override
  String get logout => 'اخرج';

  @override
  String get mention => 'اذكر';

  @override
  String get messages => 'الرسائل';

  @override
  String get messagesStyle => 'الرسائل:';

  @override
  String get moderator => 'مشرف';

  @override
  String get muteChat => 'أكتم الماحدثة';

  @override
  String get newChat => 'محادثة جديدة';

  @override
  String get newMessageInrechainonline => '💬 رسالة جديدة في REChain';

  @override
  String get newVerificationRequest => 'طلب تحقق جديد!';

  @override
  String get next => 'التالي';

  @override
  String get no => 'لا';

  @override
  String get noConnectionToTheServer => 'انقطع الاتصال بالخادم';

  @override
  String get noEmotesFound => 'لم يُعثر على انفعالة. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'يمكنك فقط تفعيل التشفير عندما تصبح الغرفة غير متاحة للعامة.';

  @override
  String get noGoogleServicesWarning =>
      'يبدو أن خدمة Firebase Cloud Messaging غير متاحة على جهازك. لمواصلة تلقي الإشعارات، نوصي بتثبيت ntfy. باستخدام ntfy أو أي مزود خدمة Unified Push آخر، يمكنك تلقي إشعارات الدفع بطريقة آمنة للبيانات. يمكنك تنزيل ntfy من PlayStore أو من F-Droid.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 ليس خادم ماتريكس، بدلًا منه أتريد استخدام $server2؟';
  }

  @override
  String get shareInviteLink => 'شارك رابط الدعوة';

  @override
  String get scanQrCode => 'امسح رمز الاستجابة السريعة';

  @override
  String get noPasswordRecoveryDescription =>
      'لم تضف أي طريقة لاستعادة كلمة السر.';

  @override
  String get noPermission => 'بدون اذن';

  @override
  String get noRoomsFound => 'لم يُعثر على غرف…';

  @override
  String get notifications => 'الإشعارات';

  @override
  String numUsersTyping(int count) {
    return '$count يكتبون…';
  }

  @override
  String get obtainingLocation => 'يحصل على الموقع…';

  @override
  String get ok => 'موافق';

  @override
  String get onlineKeyBackupEnabled =>
      'تم تفعيل النسخ الاحتياطي للمفاتيح عبر الإنترنت';

  @override
  String get oopsPushError => 'عذراً! للأسف، حدث خطأ أثناء إعداد الإشعارات.';

  @override
  String get oopsSomethingWentWrong => 'عفوًا، حدث خطأ ما…';

  @override
  String get openAppToReadMessages => 'افتح التطبيق لقراءة الرسائل';

  @override
  String get openCamera => 'افتح الكميرا';

  @override
  String get oneClientLoggedOut => 'أُ خرج أحد العملاء الذي تسختدمها';

  @override
  String get addAccount => 'أضف حسابًا';

  @override
  String get editBundlesForAccount => 'عدّل حزم هذا الحساب';

  @override
  String get addToBundle => 'أضفه الى حزمة';

  @override
  String get removeFromBundle => 'أزله من الحزمة';

  @override
  String get bundleName => 'اسم الحزمة';

  @override
  String get openInMaps => 'افتح في الخريطة';

  @override
  String get link => 'رابط';

  @override
  String get or => 'أو';

  @override
  String get participant => 'منتسب';

  @override
  String get passphraseOrKey => 'عبارة المرور أو مفتاح الاستعادة';

  @override
  String get password => 'كلمة السر';

  @override
  String get passwordForgotten => 'نسيتَ كلمة السر';

  @override
  String get passwordHasBeenChanged => 'غُيّرت كلمة السر';

  @override
  String get passwordRecoverySettings => 'إعدادات استعادة كلمة المرور';

  @override
  String get passwordRecovery => 'استعادة كلمة السر';

  @override
  String get pin => 'ثبِّت';

  @override
  String get pleaseChooseAPasscode => 'اختر رمز المرور';

  @override
  String get pleaseClickOnLink =>
      'يرجى النقر على الرابط الموجود في البريد الإلكتروني ثم المتابعة.';

  @override
  String get pleaseEnterYourPassword => 'أدخل كلمة السر';

  @override
  String get pleaseEnterYourPin => 'الرجاء إدخال رقم التعريف الشخصي الخاص بك';

  @override
  String get pleaseEnterYourUsername => 'أدخل اسم المستخدم';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'يرجى اتباع التعليمات الموجودة على الموقع والنقر على التالي.';

  @override
  String get privacy => 'الخصوصية';

  @override
  String get publicRooms => 'الغرف العامة';

  @override
  String get reason => 'السبب';

  @override
  String redactedBy(String username) {
    return 'منقح بواسطة $username';
  }

  @override
  String redactedByBecause(String username, String reason) {
    return 'تم حجبه بواسطة $username بسبب: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return 'حذف $username حدثًا';
  }

  @override
  String get redactMessage => 'احذف رسالة';

  @override
  String get reject => 'رفض';

  @override
  String rejectedTheInvitation(String username) {
    return 'رفض $username الدعوة';
  }

  @override
  String get removeAllOtherDevices => 'أزِل كل الأجهزة الأخرى';

  @override
  String get unbanFromChat => 'فك حجبه من المحادثة';

  @override
  String get removeYourAvatar => 'أزل الصورة الرمزية';

  @override
  String get replaceRoomWithNewerVersion => 'استبدل الغرفة باصدار أحدث';

  @override
  String get reply => 'ردّ';

  @override
  String get reportMessage => 'أبلغ عن الرسالة';

  @override
  String get roomHasBeenUpgraded => 'رُقيّت الغرفة';

  @override
  String sendingFilesDoNotExit(int count) {
    return 'Sending $count files... Please do not exit!';
  }

  @override
  String get roomVersion => 'إصدار الغرفة';

  @override
  String get compressingVideo => 'Compressing video...';

  @override
  String get saveFile => 'احفظ الملف';

  @override
  String get search => 'ابحث';

  @override
  String get security => 'الأمان';

  @override
  String get send => 'أرسل';

  @override
  String get sendAMessage => 'أرسل رسالة';

  @override
  String get sendAsText => 'أرسل نصًا';

  @override
  String get sendAudio => 'أرسل ملفًا صوتيًا';

  @override
  String get sendFile => 'أرسل ملف';

  @override
  String get sendImage => 'أرسل صورة';

  @override
  String sendImages(int count) {
    return 'إرسال $count صورة';
  }

  @override
  String get sendMessages => 'إرسال رسائل';

  @override
  String get sendVideo => 'أرسل فيديو';

  @override
  String sentAFile(String username) {
    return '📁 أرسل $username ملفا';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 أرسل $username ملفا صوتيا';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username أرسل صورة';
  }

  @override
  String sentASticker(String username) {
    return '😊 أرسل $username ملصقا';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 أرسل $username مقطع فيديو';
  }

  @override
  String sentCallInformations(String senderName) {
    return 'أرسل $senderName معلومات مكالمة';
  }

  @override
  String get setAsCanonicalAlias => 'تعيين كاسم مستعار رئيسي';

  @override
  String get setChatDescription => 'تعيين وصفًا للدردشة';

  @override
  String get setStatus => 'عيّن الحالة';

  @override
  String get settings => 'الإعدادات';

  @override
  String get share => 'شارك';

  @override
  String sharedTheLocation(String username) {
    return 'شارك $username موقعه';
  }

  @override
  String get shareLocation => 'شارك الموقع';

  @override
  String get skip => 'تخط';

  @override
  String get sourceCode => 'الشفرة المصدرية';

  @override
  String get spaceIsPublic => 'عام في المساحة';

  @override
  String get spaceName => 'اسم المساحة';

  @override
  String startedACall(String senderName) {
    return 'بدأ $senderName مكالمة';
  }

  @override
  String get status => 'الحالة';

  @override
  String get statusExampleMessage => 'ماهو وضعك؟';

  @override
  String get submit => 'أرسل';

  @override
  String get synchronizingPleaseWait => 'يُزامن… يرجى الانتظار.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Synchronizing… ($percentage%)';
  }

  @override
  String get systemTheme => 'النظام';

  @override
  String get theyDontMatch => 'لا يتطبقان';

  @override
  String get theyMatch => 'متطبقان';

  @override
  String get tooManyRequestsWarning => 'طابات كثيرة. حاول مجددًا لاحقًا!';

  @override
  String get tryToSendAgain => 'حاول إعادة الارسال';

  @override
  String unbannedUser(String username, String targetName) {
    return 'ألغى $username حظر $targetName';
  }

  @override
  String get unblockDevice => 'ألغ حظر الجهاز';

  @override
  String get unknownDevice => 'جهز مجهول';

  @override
  String get unknownEncryptionAlgorithm => 'خوارزمية تشفير مجهولة';

  @override
  String unknownEvent(String type) {
    return 'حدث مجهول \'$type\'';
  }

  @override
  String get unmuteChat => 'ألغِ كتم المحادثة';

  @override
  String get unpin => 'ألغِ التثبيت';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username و $count أخرون يكتبون…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username و $username2 يكتبان…';
  }

  @override
  String userIsTyping(String username) {
    return '$username يكتب…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username غادر المحادثة';
  }

  @override
  String userSentUnknownEvent(String username, String type) {
    return 'أرسل $username حدث $type';
  }

  @override
  String get unverified => 'غير مؤكد';

  @override
  String get verified => 'موثّق';

  @override
  String get verifyStart => 'ابدأ التحقق';

  @override
  String get verifySuccess => 'تُحقق منك بنجاح!';

  @override
  String get verifyTitle => 'يتحقق من الحساب الآخر';

  @override
  String get visibilityOfTheChatHistory => 'مرئية تأريخ المحادثة';

  @override
  String get visibleForAllParticipants => 'مرئي لكل المنتسبين';

  @override
  String get visibleForEveryone => 'مرئي للجميع';

  @override
  String get voiceMessage => 'رسالة صوتية';

  @override
  String get waitingPartnerAcceptRequest => 'ينتظر قبول الشريك للطلب…';

  @override
  String get waitingPartnerEmoji => 'ينتظر قبول الشريك لإيموجي…';

  @override
  String get waitingPartnerNumbers => 'ينتظر قبول الشريك للأرقام…';

  @override
  String get warning => 'تحذير!';

  @override
  String get weSentYouAnEmail => 'أرسلنا لك رسالة بالبريد الإلكتروني';

  @override
  String get whoCanPerformWhichAction => 'من يستطيع القيام بأي عمل';

  @override
  String get whoIsAllowedToJoinThisGroup => 'من يسمح له الانضمام للمجموعة';

  @override
  String get whyDoYouWantToReportThis => 'لماذا تريد الإبلاغ عنه؟';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'يمكنك استعادة كلمة السر بهذه العناوين.';

  @override
  String get writeAMessage => 'اكتب رسالة…';

  @override
  String get yes => 'نعم';

  @override
  String get you => 'انت';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'لم تعد منتسبا لهذه المحادثة';

  @override
  String get yourPublicKey => 'مفتاحك العمومي';

  @override
  String get messageInfo => 'معلومات الرسالة';

  @override
  String get time => 'الوقت';

  @override
  String get sender => 'المرسل';

  @override
  String get openGallery => 'افتخ المعرض';

  @override
  String get removeFromSpace => 'أزل من المساحة';

  @override
  String get markAsRead => 'حدد كمقروء';

  @override
  String get reportUser => 'التبيلغ عن المستخدم';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender تفاعل ب $reaction';
  }

  @override
  String get pinMessage => 'تثبيت في الغرفة';

  @override
  String get confirmEventUnpin =>
      'هل أنت متأكد من إلغاء تثبيت الحدث بشكل دائم؟';

  @override
  String get emojis => 'إيموجي';

  @override
  String get unsupportedAndroidVersion => 'نسخة أندرويد غير مدعومة';

  @override
  String get unsupportedAndroidVersionLong =>
      'تتطلب هذه الميزة إصدار Android أحدث. يرجى التحقق من وجود تحديثات أو دعم Mobile Katya OS.';

  @override
  String get youRejectedTheInvitation => 'لقد رفضت الدعوة';

  @override
  String get youJoinedTheChat => 'لقد انضممت إلى المحادثة';

  @override
  String get youAcceptedTheInvitation => '👍 لقد قبلت الدعوة';

  @override
  String youBannedUser(String user) {
    return 'لقد حظرت $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'لقد سحبت الدعوة لـ $user';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 لقد تمت دعوتك من قبل $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 قمت بدعوة $user';
  }

  @override
  String youKicked(String user) {
    return '👞 لقد ركلت $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 لقد ركلت وحظرت $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'قمت بإلغاء الحظر $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 لقد طرق $user';
  }

  @override
  String get usersMustKnock => 'المستخدم يجب أن يطرق الباب';

  @override
  String get noOneCanJoin => 'لا أحد يستطيع الانضمام';

  @override
  String get knock => 'دق';

  @override
  String get users => 'المستخدمون';

  @override
  String get storeInAndroidKeystore => 'تخزين في سجل مفاتيح اندرويد';

  @override
  String get storeInAppleKeyChain => 'تخزين في سلسلة مفاتيح ابل';

  @override
  String get storeSecurlyOnThisDevice => 'احفظه بأمان على هذا الجهاز';

  @override
  String countFiles(int count) {
    return 'ملفات $count';
  }

  @override
  String get user => 'مستخدم';

  @override
  String get custom => 'مُخصّص';

  @override
  String get whyIsThisMessageEncrypted =>
      'لماذا هذه الرسالة غير قابلة للقراءة؟';

  @override
  String get noKeyForThisMessage =>
      'يمكن أن يحدث هذا إذا تم إرسال الرسالة قبل تسجيل الدخول إلى حسابك على هذا الجهاز.\n\nمن الممكن أيضا أن يكون المرسل قد حظر جهازك أو حدث خطأ ما في الاتصال بالإنترنت.\n\nهل يمكنك قراءة الرسالة في جلسة أخرى؟ ثم يمكنك نقل الرسالة منه! انتقل إلى الإعدادات > الأجهزة وتأكد من أن أجهزتك قد تحققت من بعضها البعض. عندما تفتح الغرفة في المرة التالية وتكون كلتا الجلستين في المقدمة ، سيتم إرسال المفاتيح تلقائيا.\n\nألا تريد أن تفقد المفاتيح عند تسجيل الخروج أو تبديل الأجهزة؟ تأكد من تمكين النسخ الاحتياطي للدردشة في الإعدادات.';

  @override
  String get newSpace => 'مساحة جديدة';

  @override
  String get doNotShowAgain => 'لا تظهر مرة أخرى';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'محادثة فارغة (كانت $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'يسمح لك تطبيق المساحات بتوحيد دردشاتك وبناء مجتمعات خاصة أو عامة.';

  @override
  String get encryptThisChat => 'تشفير هذه المحادثة';

  @override
  String get disableEncryptionWarning =>
      'لأسباب أمنية ، لا يمكنك تعطيل التشفير في المحادثة ، حيث تم تمكينه من قبل.';

  @override
  String get sorryThatsNotPossible => 'معذرة... هذا غير ممكن';

  @override
  String get reopenChat => 'إعادة فتح المحادثة';

  @override
  String get noBackupWarning =>
      'تحذير! بدون تمكين النسخ الاحتياطي للدردشة ، ستفقد الوصول إلى رسائلك المشفرة. يوصى بشدة بتمكين النسخ الاحتياطي للدردشة أولاً قبل تسجيل الخروج.';

  @override
  String get noOtherDevicesFound => 'لم يتم العثور على أجهزة أخرى';

  @override
  String fileIsTooBigForServer(String max) {
    return 'تعذر الإرسال! لا يدعم الخادم سوى المرفقات التي تصل إلى $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'تم حفظ الملف في $path';
  }

  @override
  String get jumpToLastReadMessage => 'الانتقال إلى آخر رسالة مقروءة';

  @override
  String get readUpToHere => 'اقرأ حتى هنا';

  @override
  String get jump => 'قفز';

  @override
  String get openLinkInBrowser => 'فتح الرابط في المتصفح';

  @override
  String get reportErrorDescription =>
      '😭 أوه لا. هناك خطأ ما. إذا كنت تريد، يمكنك الإبلاغ عن هذا الخطأ إلى المطورين.';

  @override
  String get report => 'الإبلاغ';

  @override
  String get setColorTheme => 'تعيين لون السمة:';

  @override
  String get invite => 'دعوة';

  @override
  String get inviteGroupChat => '📨 دعوة للمحادثة الجماعية';

  @override
  String get invalidInput => 'مدخل غير صالح!';

  @override
  String wrongPinEntered(int seconds) {
    return 'تم إدخال رمز خاطئ! حاول مرة أخرى خلال $seconds ثانية...';
  }

  @override
  String get pleaseEnterANumber => 'الرجاء إدخال رقم أكبر من 0';

  @override
  String get archiveRoomDescription =>
      'سيتم نقل المحادثة إلى الأرشيف. سيتمكن المستخدمون الآخرون من رؤية أنك غادرت المحادثة.';

  @override
  String get roomUpgradeDescription =>
      'سيتم بعد ذلك إعادة إنشاء المحادثة باستخدام إصدار الغرفة الجديد. سيتم إخطار جميع المشاركين بأنهم بحاجة إلى التبديل إلى المحادثة الجديدة. يمكنك معرفة المزيد حول إصدارات الغرف على https://github.com/sorydima/REChain-.git';

  @override
  String get removeDevicesDescription =>
      'سيتم تسجيل خروجك من هذا الجهاز ولن تتمكن بعد ذلك من تلقي الرسائل.';

  @override
  String get banUserDescription =>
      'سيتم حظر المستخدم من المحادثة ولن يتمكن من الدخول إلى المحادثة مرة أخرى حتى يتم رفع الحظر عنه.';

  @override
  String get unbanUserDescription =>
      'سيتمكن المستخدم من الدخول إلى المحادثة مرة أخرى إذا حاول.';

  @override
  String get kickUserDescription =>
      'يتم طرد المستخدم من المحادثة ولكن لا يتم حظره. في المحادثات العامة، يمكن للمستخدم الانضمام مرة أخرى في أي وقت.';

  @override
  String get makeAdminDescription =>
      'بمجرد تعيين هذا المستخدم كمسؤول، قد لا تتمكن من التراجع عن هذا لأنه سيكون لديه نفس الأذونات التي تتمتع بها.';

  @override
  String get pushNotificationsNotAvailable => 'دفع الإخطارات غير متوفرة';

  @override
  String get learnMore => 'تعلم المزيد';

  @override
  String get yourGlobalUserIdIs => 'معرف المستخدم العمومي الخاص بك هو: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'لسوء الحظ، لا يمكن العثور على مستخدم لديه \"$query\". يرجى التحقق مما إذا كنت قد ارتكبت خطأ كتابي.';
  }

  @override
  String get knocking => 'طرق';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'يمكن اكتشاف الشات عن طريق البحث في $server';
  }

  @override
  String get searchChatsRooms => 'ابحث عن #الدردشات، @المستخدمين...';

  @override
  String get nothingFound => 'لم نجد شيئاً.';

  @override
  String get groupName => 'أسم المجموعة';

  @override
  String get createGroupAndInviteUsers => 'إنشاء مجموعة ودعوة المستخدمين';

  @override
  String get groupCanBeFoundViaSearch => 'يمكن العثور على المجموعة عبر البحث';

  @override
  String get wrongRecoveryKey =>
      'عذرًا... لا يبدو أن هذا هو مفتاح الاسترداد الصحيح.';

  @override
  String get commandHint_sendraw => 'إرسال جيسون الخام';

  @override
  String get databaseMigrationTitle => 'تم تحسين قاعدة البيانات';

  @override
  String get databaseMigrationBody => 'انتظر من فضلك. قد يستغرق ذلك بعض الوقت.';

  @override
  String get leaveEmptyToClearStatus => 'اتركه فارغًا لمسح حالتك.';

  @override
  String get select => 'اختر';

  @override
  String get searchForUsers => 'ابحث عن @users...';

  @override
  String get pleaseEnterYourCurrentPassword => 'من فضلك أدخل كلمة السر الحالية';

  @override
  String get newPassword => 'كلمة المرور الجديدة';

  @override
  String get pleaseChooseAStrongPassword => 'الرجاء اختيار كلمة مرور قوية';

  @override
  String get passwordsDoNotMatch => 'كلمات المرور لا تتطابق';

  @override
  String get passwordIsWrong => 'كلمة السر للدخول خاطئة';

  @override
  String get publicChatAddresses => 'عناوين المحادثة العامة';

  @override
  String get createNewAddress => 'إنشاء عنوان جديد';

  @override
  String get joinSpace => 'انضم إلى المساحة';

  @override
  String get publicSpaces => 'مساحة عامة';

  @override
  String get addChatOrSubSpace => 'إضافة دردشة أو مساحة فرعية';

  @override
  String get thisDevice => 'هذا الجهاز:';

  @override
  String get initAppError => 'حدث خطأ بداخل التطبيق';

  @override
  String searchIn(String chat) {
    return 'بحث في $chat...';
  }

  @override
  String get searchMore => 'ابحث أكثر...';

  @override
  String get gallery => 'المعرض';

  @override
  String get files => 'الملفات';

  @override
  String sessionLostBody(String url, String error) {
    return 'جلستك مفقودة يرجى إبلاغ المطورين بهذا الخطأ في $url. رسالة الخطأ هي: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'يحاول التطبيق الآن استعادة جلستك من النسخة الاحتياطية. الرجاء الإبلاغ عن هذا الخطأ للمطورين على $url. رسالة الخطأ هي:$error';
  }

  @override
  String get sendReadReceipts => 'إرسال بالقراءة';

  @override
  String get sendTypingNotificationsDescription =>
      'يستطيع المشاركون الآخرون في المحادثة رؤيتك عند كتابة رسالة جديدة.';

  @override
  String get sendReadReceiptsDescription =>
      'يمكن للمشاركين الآخرين في المحادثة معرفة متى قرأت الرسالة.';

  @override
  String get formattedMessages => 'رسائل منسقة';

  @override
  String get formattedMessagesDescription =>
      'عرض محتوى الرسالة الغنية مثل النص الغامق باستخدام الماركداون.';

  @override
  String get verifyOtherUser => '🔐 التحقق من المستخدم الآخر';

  @override
  String get verifyOtherUserDescription =>
      'إذا قمت بالتحقق من مستخدم آخر، فيمكنك التأكد من أنك تعرف من تكتب إليه حقًا. 💪\n\nعند بدء عملية التحقق، سترى أنت والمستخدم الآخر نافذة منبثقة في التطبيق. هناك سترى بعد ذلك سلسلة من الرموز التعبيرية أو الأرقام التي يتعين عليك مقارنتها مع بعضها البعض.\n\nأفضل طريقة للقيام بذلك هي الالتقاء أو بدء مكالمة فيديو. 👭';

  @override
  String get verifyOtherDevice => '🔐 التحقق من الجهاز الآخر';

  @override
  String get verifyOtherDeviceDescription =>
      'عند التحقق من جهاز آخر، يمكن لهذه الأجهزة تبادل المفاتيح، مما يزيد من أمانك بشكل عام. 💪 عند بدء عملية التحقق، ستظهر نافذة منبثقة في التطبيق على كلا الجهازين. هناك سترى بعد ذلك سلسلة من الرموز التعبيرية أو الأرقام التي يتعين عليك مقارنتها مع بعضها البعض. من الأفضل أن يكون كلا الجهازين في متناول يديك قبل بدء عملية التحقق. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return 'وافق $sender على التحقق من المفتاح';
  }

  @override
  String canceledKeyVerification(String sender) {
    return 'قام $sender بإلغاء التحقق من المفتاح';
  }

  @override
  String completedKeyVerification(String sender) {
    return 'أكمل $sender عملية التحقق من المفتاح';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender جاهز للتحقق من المفتاح';
  }

  @override
  String requestedKeyVerification(String sender) {
    return 'طلب $sender التحقق من المفتاح';
  }

  @override
  String startedKeyVerification(String sender) {
    return 'بدأ $sender عملية التحقق من المفتاح';
  }

  @override
  String get incomingMessages => 'الرسائل الواردة';

  @override
  String get stickers => 'الملصقات';

  @override
  String get discover => 'استكشف';

  @override
  String get commandHint_ignore => 'تجاهل معرف المصفوفة المعطى';

  @override
  String get commandHint_unignore => 'إلغاء تجاهل معرف المصفوفة المحدد';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread الدردشات غير المقروءة';
  }

  @override
  String get noDatabaseEncryption =>
      'تشفير قاعدة البيانات غير مدعوم على هذا النظام الأساسي';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'يوجد حاليًا $count من المستخدمين المحظورين.';
  }

  @override
  String goToSpace(Object space) {
    return 'انتقل إلى المساحة: $space';
  }

  @override
  String get markAsUnread => 'تحديد كغير مقروء';

  @override
  String userLevel(int level) {
    return '$level - مستخدم';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - مشرف';
  }

  @override
  String adminLevel(int level) {
    return '$level - مدير';
  }

  @override
  String get changeGeneralChatSettings => 'تغيير إعدادات الدردشة العامة';

  @override
  String get inviteOtherUsers => 'دعوة مستخدمين آخرين إلى هذه الدردشة';

  @override
  String get changeTheChatPermissions => 'تغيير أذونات الدردشة';

  @override
  String get changeTheVisibilityOfChatHistory => 'تغيير رؤية سجل الدردشة';

  @override
  String get changeTheCanonicalRoomAlias =>
      'تغيير عنوان الدردشة العامة الرئيسي';

  @override
  String get sendRoomNotifications => 'إرسال إشعارات @room';

  @override
  String get changeTheDescriptionOfTheGroup => 'تغيير وصف الدردشة';

  @override
  String get chatPermissionsDescription =>
      '‪حدد مستوى الصلاحية الضروري لإجراءات معينة في هذه الدردشة. عادة ما تمثل مستويات الصلاحية 0 و 50 و 100 المستخدمين والمشرفين ولكن أي تدرج ممكن.';

  @override
  String updateInstalled(String version) {
    return 'تم تثبيت🎉 تحديث $version!';
  }

  @override
  String get changelog => 'سجل التغييرات';

  @override
  String updateAvailable(String version) {
    return 'Update $version available';
  }

  @override
  String get download => 'Download';

  @override
  String get sendCanceled => 'تم إلغاء الإرسال';

  @override
  String get loginWithREChainId => 'Login with REChain-ID';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'لا يبدو أنه خادم منزلي متوافق. عنوان URL غير صحيح ؟';

  @override
  String get calculatingFileSize => 'جارٍ حساب حجم الملف...';

  @override
  String get oneOfYourDevicesIsNotVerified => 'لم يتم التحقق من أحد أجهزتك';

  @override
  String get noticeChatBackupDeviceVerification =>
      'ملاحظة: عند توصيل جميع أجهزتك بنسخة احتياطية للدردشة، يتم التحقق منها تلقائيًا.';

  @override
  String get continueText => 'استمرار';

  @override
  String get blur => 'الضبابية:';

  @override
  String get opacity => 'التعتيم:';

  @override
  String get setWallpaper => 'تعيين الخلفية';

  @override
  String get manageAccount => '‫إدارة الحساب‬';

  @override
  String get noContactInformationProvided =>
      'لا يقدم السيرفر أي معلومات اتصال صحيحة';

  @override
  String get contactServerAdmin => 'اتصل بمسؤول الخادم';

  @override
  String get contactServerSecurity => 'الاتصال بمسؤول أمان ااخادم';

  @override
  String get supportPage => 'صفحة الدعم';

  @override
  String get serverInformation => 'معلومات الخادم:';

  @override
  String get name => 'الإسم';

  @override
  String get version => 'اﻹصدار';

  @override
  String get website => 'الموقع اﻹلكتروني';

  @override
  String get compress => 'ضغط';

  @override
  String get boldText => 'خط غامق';

  @override
  String get italicText => 'خط مائل';

  @override
  String get strikeThrough => 'يتوسطه خط';

  @override
  String get pleaseFillOut => 'من فضلك قم بتعبئته';

  @override
  String get invalidUrl => 'رابط غير صحيح';

  @override
  String get addLink => 'إضافة رابط';

  @override
  String get unableToJoinChat =>
      'يتعذر الانضمام إلى الدردشة. ربما يكون الطرف الآخر قد أغلق المحادثة بالفعل.';

  @override
  String get previous => 'السابق';

  @override
  String get otherPartyNotLoggedIn =>
      'لم يقم الطرف الآخر بتسجيل الدخول حالياً وبالتالي لا يمكنه تلقي الرسائل!';

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
      'يرجى ملاحظة أن مكالمات الفيديو حالياً في مرحلة تجريبية. قد لا تعمل كما هو متوقع أو تعمل على الإطلاق على جميع المنصات.';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get incomingCall => 'Incoming call';

  @override
  String get videoCall => 'مكالمة فيديو';

  @override
  String get voiceCall => 'مكالمة صوتية';

  @override
  String get missedCall => 'Missed call';

  @override
  String get callBack => 'Call back';

  @override
  String get hangUp => 'Hang up';

  @override
  String get waitingForParticipant => 'Waiting for participant...';

  @override
  String get decline => 'رفض';

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
