// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class L10nFa extends L10n {
  L10nFa([String locale = 'fa']) : super(locale);

  @override
  String get alwaysUse24HourFormat => 'false';

  @override
  String get repeatPassword => 'تکرار رمزعبور';

  @override
  String get notAnImage => 'یک فایل تصویری نیست.';

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
  String get remove => 'حذف کردن';

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
  String get about => 'درباره';

  @override
  String aboutHomeserver(String homeserver) {
    return 'About $homeserver';
  }

  @override
  String get accept => 'پذیرش';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username دعوت را پذیرفت';
  }

  @override
  String get account => 'حساب';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username رمزگذاری سرتاسر را فعال کرد';
  }

  @override
  String get addEmail => 'افزودن ایمیل';

  @override
  String get confirmMatrixId =>
      'برای حذف حسابتان، لطفا هویت ماتریکستان را تایید کنید.';

  @override
  String supposedMxid(String mxid) {
    return 'این باید $mxid باشد';
  }

  @override
  String get addChatDescription => 'Add a chat description...';

  @override
  String get addToSpace => 'به فضا اضافه کنید';

  @override
  String get admin => 'ادمین';

  @override
  String get alias => 'نام مستعار';

  @override
  String get all => 'همه';

  @override
  String get allChats => 'همه گپ‌ها';

  @override
  String get commandHint_roomupgrade =>
      'Upgrade this room to the given room version';

  @override
  String get commandHint_googly => 'ارسال چند چشم گوگولی';

  @override
  String get commandHint_cuddle => 'ارسال آغوش';

  @override
  String get commandHint_hug => 'ارسال بغل';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName به شما چشمان گوگولی می‌فرستد';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName شما را در آغوش می‌گیرد';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName شما را بغل می‌کند';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName پاسخ تماس را داد';
  }

  @override
  String get anyoneCanJoin => 'هرکسی می‌تواند بپیوندد';

  @override
  String get appLock => 'قفل برنامه';

  @override
  String get appLockDescription =>
      'Lock the app when not using with a pin code';

  @override
  String get archive => 'بایگانی';

  @override
  String get areGuestsAllowedToJoin => 'آیا کاربران مهمان اجازه پیوستن دارند';

  @override
  String get areYouSure => 'مطمئن هستید؟';

  @override
  String get areYouSureYouWantToLogout => 'مطمئن هستید می‌خواهید خارج شوید؟';

  @override
  String get askSSSSSign =>
      'لطفا عبارت عبور یا کلید بازیابی حافظه امن خود را وارد کنید تا بتوانید شخص دیگر را امضا کنید.';

  @override
  String askVerificationRequest(String username) {
    return 'این درخواست تایید را از $username می‌پذیرید؟';
  }

  @override
  String get autoplayImages => 'اموجی و برچسب‌های متحرک به طور خودکار پخش شوند';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'سرور می‌تواند این گونه‌های ورود‮ را پشتیباتی کند:\n$serverVersions\nولی این برنامه فقط می‌تواند این‌ها را پشتیبانی کند:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Send typing notifications';

  @override
  String get swipeRightToLeftToReply => 'Swipe right to left to reply';

  @override
  String get sendOnEnter => 'ارسال با کلید تعويض سطر';

  @override
  String badServerVersionsException(
      String serverVersions,
      String supportedVersions,
      Object serverVerions,
      Object supoortedVersions,
      Object suportedVersions) {
    return 'سرور می‌تواند این نسخه‌های مشخصات را پشتیبانی کند:\n$serverVersions\nولی این برنامه فقط می‌تواند این‌ها را پشتیبانی کند:\n$supportedVersions';
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
  String get banFromChat => 'از گپ محروم کنید';

  @override
  String get banned => 'محروم شده';

  @override
  String bannedUser(String username, String targetName) {
    return '$username $targetName را محروم کرد';
  }

  @override
  String get blockDevice => 'دستگاه را مسدود کنید';

  @override
  String get blocked => 'مسدود شده';

  @override
  String get botMessages => 'پیام‌های روبات';

  @override
  String get cancel => 'لغو';

  @override
  String cantOpenUri(String uri) {
    return 'نمی‌توانیم این آدرس اینترنتی را باز کنیم: $uri';
  }

  @override
  String get changeDeviceName => 'نام دستگاه را تغییر دهید';

  @override
  String changedTheChatAvatar(String username) {
    return '$username تصویر گپ را تغییر داد';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username توصیف گپ را تغییر داد به: «$description»';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username نام گپ را تغییر داد به: «$chatname»';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username اجازه‌های گپ را تغییر داد';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username نام نمایشی خود را تغییر داد به: «$displayname»';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username قوانین دسترسی مهمان را تغییر داد';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username قوانین دسترسی مهمان را تغییر داد به: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username قابليت‌ ديدن‌ تاریخچه را تغییر داد';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username قابليت‌ ديدن‌ تاریخچه را تغییر داد به: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username قوانین پیوستن را تغییر داد';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username قوانین پیوستن را تغییر داد به: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username عکس پروفایل خود را تغییر داد';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username نام‌های مستعار اتاق را تغییر داد';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username لینک دعوت را تغییر داد';
  }

  @override
  String get changePassword => 'تغییر رمز عبور';

  @override
  String get changeTheHomeserver => 'تغییر سرور خانه';

  @override
  String get changeTheme => 'سبک خود را تغییر دهید';

  @override
  String get changeTheNameOfTheGroup => 'نام گروه را تغییر دهید';

  @override
  String get changeYourAvatar => 'عکس پروفایل خود را تغییر دهید';

  @override
  String get channelCorruptedDecryptError => 'رمزگذاری مخدوش شده‌ است';

  @override
  String get chat => 'گپ';

  @override
  String get yourChatBackupHasBeenSetUp => 'پشتیبان گپ‌تان تنظیم شده است.';

  @override
  String get chatBackup => 'پشتیبان گپ';

  @override
  String get chatBackupDescription =>
      'پیام‌های قدیمی‌تان با یک کلید باز یابی، امن می‌شوند. لطفا مطمئن شوید که آن را گم نمی‌کنید.';

  @override
  String get chatDetails => 'جزئیات گپ';

  @override
  String get chatHasBeenAddedToThisSpace => 'گپ به این فضا اضافه شده است';

  @override
  String get chats => 'گپ‌ها';

  @override
  String get chooseAStrongPassword => 'رمز عبور قوی انتخاب کنید';

  @override
  String get clearArchive => 'بایگانی را پاک کنید';

  @override
  String get close => 'بستن';

  @override
  String get commandHint_markasdm =>
      'برای دادن شناسه ماتریکس به عنوان اتاق پیام‌های مستقیم علامت بگذارید';

  @override
  String get commandHint_markasgroup => 'به عنوان گروه علامت بگذارید';

  @override
  String get commandHint_ban => 'کاربر مشخص شده را از این اتاق محروم کنید';

  @override
  String get commandHint_clearcache => 'حافظه پنھان را پاک کنید';

  @override
  String get commandHint_create =>
      'یک گپ گروهی خالی بسازید\nاز «--no-encryption» برای غیرفعال کردن رمزگذاری استفاده کنید';

  @override
  String get commandHint_discardsession => 'طرد نشست';

  @override
  String get commandHint_dm =>
      'یک گپ مستقیم شروع کنید\nاز «--no-encryption» برای غیرفعال کردن رمزگذاری استفاده کنید';

  @override
  String get commandHint_html => 'متن با فرمت HTML بفرستید';

  @override
  String get commandHint_invite => 'کاربر مشخص شده را به این اتاق دعوت کنید';

  @override
  String get commandHint_join => 'به اتاق مشخص شده بپیوندید';

  @override
  String get commandHint_kick => 'کاربر مشخص شده را از این اتاق حذف کنید';

  @override
  String get commandHint_leave => 'این اتاق را ترک کنید';

  @override
  String get commandHint_me => 'خود را توصیف کنید';

  @override
  String get commandHint_myroomavatar =>
      'عکس پروفایل خود را برای این اتاق تنظیم کنید (با mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'نام نمایشی خود را برای این اتاق تنظیم کنید';

  @override
  String get commandHint_op =>
      'درجه اختیار کاربر مشخص شده را تنظیم کنید (پیشفرض: ۵۰)';

  @override
  String get commandHint_plain => 'متن بی‌فرمت بفرستید';

  @override
  String get commandHint_react => 'پاسخ را به عنوان یک واکنش بفرستید';

  @override
  String get commandHint_send => 'متن را بفرستید';

  @override
  String get commandHint_unban =>
      'محرومیت کاربر مشخص شده را از این اتاق لغو کنید';

  @override
  String get commandInvalid => 'دستور نامعتبر';

  @override
  String commandMissing(String command) {
    return '$command یک دستور نیست.';
  }

  @override
  String get compareEmojiMatch => 'لطفا ایموجی‌ها را مقایسه کنید';

  @override
  String get compareNumbersMatch => 'لطفا اعداد را مقایسه کنید';

  @override
  String get configureChat => 'گپ را تنظیم کنید';

  @override
  String get confirm => 'تایید';

  @override
  String get connect => 'اتصال';

  @override
  String get contactHasBeenInvitedToTheGroup => 'مخاطب به گروه دعوت شده است';

  @override
  String get containsDisplayName => 'شامل نام نمایشی است';

  @override
  String get containsUserName => 'شامل نام کاربری است';

  @override
  String get contentHasBeenReported => 'محتوا به مدیران سرور گزارش شده است';

  @override
  String get copiedToClipboard => 'در حافظه کپی شد';

  @override
  String get copy => 'کپی';

  @override
  String get copyToClipboard => 'در حافظه کپی کنید';

  @override
  String couldNotDecryptMessage(String error) {
    return 'نتوانستیم پیام را رمزگشایی کنیم: $error';
  }

  @override
  String get checkList => 'Check list';

  @override
  String countParticipants(int count) {
    return '$count شرکت کننده';
  }

  @override
  String countInvited(int count) {
    return '$count invited';
  }

  @override
  String get create => 'ایجاد';

  @override
  String createdTheChat(String username) {
    return '💬 $username گپ را ایجاد کرد';
  }

  @override
  String get createGroup => 'Create group';

  @override
  String get createNewSpace => 'فضای جدید';

  @override
  String get currentlyActive => 'اکنون فعال';

  @override
  String get darkTheme => 'تاریک';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date، $timeOfDay';
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
      'این کار حساب کاربری‌تان را غیرفعال خواهد کرد. این عمل قابل جبران و بازگشت نیست! آیا اطمینان دارید؟';

  @override
  String get defaultPermissionLevel => 'درجه اجازۀ پیشفرض';

  @override
  String get delete => 'حذف';

  @override
  String get deleteAccount => 'حساب را حذف کنید';

  @override
  String get deleteMessage => 'پیام را حذف کنید';

  @override
  String get device => 'دستگاه';

  @override
  String get deviceId => 'هویت دستگاه';

  @override
  String get devices => 'دستگاه‌ها';

  @override
  String get directChats => 'گپ‌های مستقیم';

  @override
  String get allRooms => 'تمام چت‌های گروهی';

  @override
  String get displaynameHasBeenChanged => 'نام نمایشی تغییر یافته است';

  @override
  String get downloadFile => 'بارگیری فایل';

  @override
  String get edit => 'ویرایش';

  @override
  String get editBlockedServers => 'سرور‌های مسدود را ویرایش کنید';

  @override
  String get chatPermissions => 'Chat permissions';

  @override
  String get editDisplayname => 'ویرایش نام نمایشی';

  @override
  String get editRoomAliases => 'نام‌های مستعار اتاق را ویرایش کنید';

  @override
  String get editRoomAvatar => 'عکس اتاق را ویرایش کنید';

  @override
  String get emoteExists => 'شکلک از پیش وجود دارد!';

  @override
  String get emoteInvalid => 'کد کوتاه شکلک نامعتبر!';

  @override
  String get emoteKeyboardNoRecents =>
      'Recently-used emotes will appear here...';

  @override
  String get emotePacks => 'بسته‌های شکلک برای اتاق';

  @override
  String get emoteSettings => '‏تنظیمات شکلک';

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
  String get emoteShortcode => 'کد کوتاه شکلک';

  @override
  String get emoteWarnNeedToPick =>
      'باید یک کد کوتاه شکلک و یک تصویر انتخاب کنید!';

  @override
  String get emptyChat => 'گپ خالی';

  @override
  String get enableEmotesGlobally => 'بسته شکلک را به طور سراسری فعال کنید';

  @override
  String get enableEncryption => 'رمزگذاری را فعال کنید';

  @override
  String get enableEncryptionWarning =>
      'شما دیگر قادر به غیرفعال کردن رمزگذاری نخواهید بود. آیا مطمئن هستید؟';

  @override
  String get encrypted => 'رمزگذاری شده';

  @override
  String get encryption => 'رمزگذاری';

  @override
  String get encryptionNotEnabled => 'رمزگذاری فعال نیست';

  @override
  String endedTheCall(String senderName) {
    return '$senderName به تماس پایان داد';
  }

  @override
  String get enterAnEmailAddress => 'یک آدرس رایانامه(ایمیل) وارد کنید';

  @override
  String get homeserver => 'سرور خانه';

  @override
  String get enterYourHomeserver => 'سرور خانه خود را وارد کنید';

  @override
  String errorObtainingLocation(String error) {
    return 'خطا هنگام بدست آوردن مکان: $error';
  }

  @override
  String get everythingReady => 'همه‌چیز آماده است!';

  @override
  String get extremeOffensive => 'به شدت توهین آمیز';

  @override
  String get fileName => 'نام فایل';

  @override
  String get rechainonline => 'فلافی‌چت';

  @override
  String get fontSize => 'اندازه قلم';

  @override
  String get forward => 'ارسال';

  @override
  String get fromJoining => 'از پیوستن';

  @override
  String get fromTheInvitation => 'از دعوت';

  @override
  String get goToTheNewRoom => 'به اتاق جدید بروید';

  @override
  String get group => 'گروه';

  @override
  String get chatDescription => 'Chat description';

  @override
  String get chatDescriptionHasBeenChanged => 'Chat description changed';

  @override
  String get groupIsPublic => 'گروه عمومی است';

  @override
  String get groups => 'گروه‌ها';

  @override
  String groupWith(String displayname) {
    return 'گروه با $displayname';
  }

  @override
  String get guestsAreForbidden => 'مهمان‌ها ممنوع شده‌اند';

  @override
  String get guestsCanJoin => 'مهمان‌ها می‌توانند بپیوندند';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username دعوت‌نامه $targetName را پس گرفته است';
  }

  @override
  String get help => 'کمک';

  @override
  String get hideRedactedEvents => 'پنهان کردن رویدادهای ویرایش شده';

  @override
  String get hideRedactedMessages => 'Hide redacted messages';

  @override
  String get hideRedactedMessagesBody =>
      'If someone redacts a message, this message won\'t be visible in the chat anymore.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Hide invalid or unknown message formats';

  @override
  String get howOffensiveIsThisContent => 'این محتوا چه مقدار توهین آمیز است؟';

  @override
  String get id => 'آی‌دی';

  @override
  String get identity => 'هویت';

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
  String get iHaveClickedOnLink => 'من روی پیوند کلیک کردم';

  @override
  String get incorrectPassphraseOrKey =>
      'عبارت عبور یا کلید بازیابی اشتباه است';

  @override
  String get inoffensive => 'بی ضرر';

  @override
  String get inviteContact => 'دعوت از مخاطب';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return 'Do you want to invite $contact to the chat \"$groupName\"?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'دعوت از مخاطب به $groupName';
  }

  @override
  String get noChatDescriptionYet => 'No chat description created yet.';

  @override
  String get tryAgain => 'Try again';

  @override
  String get invalidServerName => 'Invalid server name';

  @override
  String get invited => 'دعوت شده';

  @override
  String get redactMessageDescription =>
      'The message will be redacted for all participants in this conversation. This cannot be undone.';

  @override
  String get optionalRedactReason =>
      '(Optional) Reason for redacting this message...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username از $targetName دعوت کرد';
  }

  @override
  String get invitedUsersOnly => 'فقط کاربران دعوت شده';

  @override
  String get inviteForMe => 'دعوت برای من';

  @override
  String inviteText(String username, String link) {
    return '$username شما را به فلافی‌چت دعوت کرد.\n۱. به online.rechain.network مراجعه کرده و کاره را نصب کنید\n۲. ثبت نام کنید یا وارد شوید.\n۳. لینک دعوت را باز کنید:\n $link';
  }

  @override
  String get isTyping => 'در حال نوشتن…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username به گپ پیوست';
  }

  @override
  String get joinRoom => 'پیوستن به اتاق';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username $targetName را بیرون کرد';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username $targetName را بیرون و محروم کرد';
  }

  @override
  String get kickFromChat => 'از گفتگو بیرون کردن';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'آخرین فعالیت: $localizedTimeShort';
  }

  @override
  String get leave => 'ترک کردن';

  @override
  String get leftTheChat => 'گپ را ترک کرد';

  @override
  String get license => 'پروانه';

  @override
  String get lightTheme => 'روشن';

  @override
  String loadCountMoreParticipants(int count) {
    return 'بارگیری $count شرکت کنندۀ بیشتر';
  }

  @override
  String get dehydrate => 'صدور جلسه و پاک کردن دستگاه';

  @override
  String get dehydrateWarning =>
      'این عمل قابل لغو نیست. مطمئن شوید که فایل پشتیبان را به صورت امن ذخیره می کنید.';

  @override
  String get dehydrateTor => 'کاربران تور (TOR): صدور جلسه';

  @override
  String get dehydrateTorLong =>
      'برای کاربران تور (TOR)، توصیه می شود قبل از بستن پنجره، جلسه را صادر کنند.';

  @override
  String get hydrateTor => 'کاربران تور (TOR): صادرات جلسه را وارد کنید';

  @override
  String get hydrateTorLong =>
      'آیا آخرین بار جلسه خود را با تور (TOR) صادر کردید؟ به سرعت آن را وارد کنید و به گپ‌زنی ادامه دهید.';

  @override
  String get hydrate => 'بازیابی از فایل پشتیبان';

  @override
  String get loadingPleaseWait => 'در حال بارگیری... لطفا صبر کنید.';

  @override
  String get loadMore => 'بارگیری بیشتر…';

  @override
  String get locationDisabledNotice =>
      'خدمات مکان غیرفعال است. لطفا آن را فعال کنید تا بتوانید موقعیت مکانی خود را به اشتراک بگذارید.';

  @override
  String get locationPermissionDeniedNotice =>
      'مجوز مکان رد شد. برای به اشتراک گذاشتن موقعیت مکانی شما لطفا به آن اجازه دهید.';

  @override
  String get login => 'وارد شدن';

  @override
  String logInTo(String homeserver) {
    return 'وارد شدن به $homeserver';
  }

  @override
  String get logout => 'خارج شدن';

  @override
  String get memberChanges => 'تغییرات اعضا';

  @override
  String get mention => 'نام‌‌بردن‌';

  @override
  String get messages => 'پیام‌ها';

  @override
  String get messagesStyle => 'Messages:';

  @override
  String get moderator => 'مدیر';

  @override
  String get muteChat => 'بی‌صدا کردن گپ';

  @override
  String get needPantalaimonWarning =>
      'لطفا توجه داشته باشید که در حال حاضر برای استفاده از رمزگذاری انتها به انتها به Pantalaimon نیاز دارید.';

  @override
  String get newChat => 'گپ جدید';

  @override
  String get newMessageInrechainonline => '💬 پیام جدید در فلافی‌چت';

  @override
  String get newVerificationRequest => 'درخواست تایید جدید!';

  @override
  String get next => 'بعدی';

  @override
  String get no => 'نه';

  @override
  String get noConnectionToTheServer => 'عدم اتصال به سرور';

  @override
  String get noEmotesFound => 'هیچ شکلکی پیدا نشد. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'فقط زمانی می‌توانید رمزگذاری را فعال کنید که اتاق، دیگر در دسترس عموم نباشد.';

  @override
  String get noGoogleServicesWarning =>
      'به نظر می رسد که شما سرویس‌های گوگل را در گوشی خود ندارید. این تصمیم خوبی برای حفظ حریم خصوصی شماست! برای دریافت اعلان‌ها در فلافی‌چت توصیه می‌کنیم ازhttps://ntfy.sh استفاده کنید. با ntfy یا یک ارائه دهنده UnifiedPush می توانید اعلان‌های فشار را به روش داده امن دریافت کنید. می توانید ntfy را از پلی استور یا از اف‌دروید بارگیری کنید.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 سرور ماتریکس نیست، به جای آن از $server2 استفاده شود؟';
  }

  @override
  String get shareInviteLink => 'Share invite link';

  @override
  String get scanQrCode => 'کد QR را اسکن کنید';

  @override
  String get none => 'هیچ‌کدام';

  @override
  String get noPasswordRecoveryDescription =>
      'شما هنوز راهی برای بازیابی رمز عبور خود اضافه نکرده‌اید.';

  @override
  String get noPermission => 'بدون اجازه';

  @override
  String get noRoomsFound => 'اتاقی پیدا نشد…';

  @override
  String get notifications => 'اعلان‌ها';

  @override
  String get notificationsEnabledForThisAccount =>
      'اعلان‌ها برای این حساب فعال شد';

  @override
  String numUsersTyping(int count) {
    return '$count کاربر در حال نوشتن…';
  }

  @override
  String get obtainingLocation => 'به دست آوردن مکان…';

  @override
  String get offensive => 'توهین آمیز';

  @override
  String get offline => 'آفلاین';

  @override
  String get ok => 'تایید';

  @override
  String get online => 'آنلاین';

  @override
  String get onlineKeyBackupEnabled => 'پشتیبان‌گیری آنلاین از کلید فعال است';

  @override
  String get oopsPushError =>
      'اوه! متاسفانه هنگام تنظیم اعلان‌ها خطایی روی داد.';

  @override
  String get oopsSomethingWentWrong => 'اوه، مشکلی پیش آمد…';

  @override
  String get openAppToReadMessages => 'برای خواندن پیام‌ها، برنامه را باز کنید';

  @override
  String get openCamera => 'باز کردن دوربین';

  @override
  String get openVideoCamera => 'بازکردن دوربین برای فیلم‌برداری';

  @override
  String get oneClientLoggedOut =>
      'یکی از کلاینت(برنامه)های شما از سیستم خارج شده است';

  @override
  String get addAccount => 'اضافه کردن حساب کاربری';

  @override
  String get editBundlesForAccount => 'بسته‌های این حساب را ویرایش کنید';

  @override
  String get addToBundle => 'به بسته نرم‌افزاری اضافه کنید';

  @override
  String get removeFromBundle => 'از این بسته حذف کنید';

  @override
  String get bundleName => 'اسم بسته';

  @override
  String get enableMultiAccounts =>
      '(آزمایشی) چند حساب را در این دستگاه فعال کنید';

  @override
  String get openInMaps => 'باز کردن در نقشه';

  @override
  String get link => 'پیوند';

  @override
  String get serverRequiresEmail =>
      'برای ثبت‌نام، این سرور باید آدرس ایمیل شما را تایید کند.';

  @override
  String get or => 'یا';

  @override
  String get participant => 'شرکت‌کننده';

  @override
  String get passphraseOrKey => 'عبارت عبور یا کلید بازیابی';

  @override
  String get password => 'رمز عبور';

  @override
  String get passwordForgotten => 'رمز عبور را فراموش کرده‌ام';

  @override
  String get passwordHasBeenChanged => 'رمز عبور تغییر کرد';

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
  String get passwordRecovery => 'بازیابی رمز عبور';

  @override
  String get people => 'مردم';

  @override
  String get pickImage => 'یک عکس انتخاب کنید';

  @override
  String get pin => 'سنجاق کردن';

  @override
  String play(String fileName) {
    return 'پخش $fileName';
  }

  @override
  String get pleaseChoose => 'لطفا انتخاب کنید';

  @override
  String get pleaseChooseAPasscode => 'لطفا یک کد عبور انتخاب کنید';

  @override
  String get pleaseClickOnLink =>
      'لطفا روی لینک موجود در رایانامه(ایمیل) کلیک کنید و سپس ادامه دهید.';

  @override
  String get pleaseEnter4Digits =>
      'لطفا ۴ رقم وارد کنید یا خالی بگذارید تا قفل برنامه غیرفعال شود.';

  @override
  String get pleaseEnterRecoveryKey => 'لطفا کلید بازیابی خود را وارد کنید:';

  @override
  String get pleaseEnterYourPassword => 'لطفا رمزعبور خود را وارد کنید';

  @override
  String get pleaseEnterYourPin => 'لطفا کد خود را وارد کنید';

  @override
  String get pleaseEnterYourUsername => 'لطفا نام‌کاربری خود را وارد کنید';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'لطفا دستورالعمل‌های وب‌سایت را دنبال کنید و روی بعدی بزنید.';

  @override
  String get privacy => 'حریم خصوصی';

  @override
  String get publicRooms => 'اتاق‌های عمومی';

  @override
  String get pushRules => 'قواعد دریافت اعلان';

  @override
  String get reason => 'دلیل';

  @override
  String get recording => 'در حال ضبط';

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
    return '$username یک رویداد را ویرایش کرد';
  }

  @override
  String get redactMessage => 'ویرایش پیام';

  @override
  String get register => 'ثبت نام';

  @override
  String get reject => 'رد کردن';

  @override
  String rejectedTheInvitation(String username) {
    return '$username دعوت را رد کرد';
  }

  @override
  String get rejoin => 'دوباره پیوستن';

  @override
  String get removeAllOtherDevices => 'حذف تمام دستگاه‌های دیگر';

  @override
  String removedBy(String username) {
    return 'حذف شده توسط $username';
  }

  @override
  String get removeDevice => 'حذف دستگاه';

  @override
  String get unbanFromChat => 'لغو محرومیت از گپ';

  @override
  String get removeYourAvatar => 'آواتار(عکس حساب) خود را حذف کنید';

  @override
  String get replaceRoomWithNewerVersion =>
      'اتاق را با نسخه جدیدتر جایگزین کنید';

  @override
  String get reply => 'پاسخ';

  @override
  String get reportMessage => 'گزارش دادن پیام';

  @override
  String get requestPermission => 'درخواست اجازه';

  @override
  String get roomHasBeenUpgraded => 'اتاق ارتقا پیدا کرد';

  @override
  String get roomVersion => 'نسخه اتاق';

  @override
  String get saveFile => 'ذخیره فایل';

  @override
  String get search => 'جستجو';

  @override
  String get security => 'امنیت';

  @override
  String get recoveryKey => 'کلید بازیابی';

  @override
  String get recoveryKeyLost => 'کلید بازیابی را گم کردید؟';

  @override
  String seenByUser(String username) {
    return 'دیده شده توسط $username';
  }

  @override
  String get send => 'ارسال';

  @override
  String get sendAMessage => 'ارسال پیام';

  @override
  String get sendAsText => 'ارسال به عنوان متن';

  @override
  String get sendAudio => 'ارسال صدا';

  @override
  String get sendFile => 'ارسال فایل';

  @override
  String get sendImage => 'ارسال تصویر';

  @override
  String sendImages(int count) {
    return 'Send $count image';
  }

  @override
  String get sendMessages => 'ارسال پیام‌ها';

  @override
  String get sendOriginal => 'ارسال اصل';

  @override
  String get sendSticker => 'ارسال برچسب';

  @override
  String get sendVideo => 'ارسال ویدئو';

  @override
  String sentAFile(String username) {
    return '📁 $username یک فایل فرستاد';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username یک صدای ضبط شده فرستاد';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username یک عکس فرستاد';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username یک برچسب فرستاد';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username یک ویدئو فرستاد';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName اطلاعات تماس را فرستاد';
  }

  @override
  String get separateChatTypes => 'گپ‌های مستقیم را از گروه‌ها جدا کنید';

  @override
  String get setAsCanonicalAlias => 'به عنوان نام مستعار اصلی تنظیم کنید';

  @override
  String get setCustomEmotes => 'شکلک سفارشی را تنظیم کنید';

  @override
  String get setChatDescription => 'Set chat description';

  @override
  String get setInvitationLink => 'تنظیم پیوند دعوت';

  @override
  String get setPermissionsLevel => 'تنظیم درجه اجازه‌ها';

  @override
  String get setStatus => 'تنظیم وضعیت';

  @override
  String get settings => 'تنظیمات';

  @override
  String get share => 'اشتراک‌گذاری';

  @override
  String sharedTheLocation(String username) {
    return '$username وضعیت مکانی خود را به اشتراک گذاشت';
  }

  @override
  String get shareLocation => 'اشتراک‌گذاری وضعیت مکانی';

  @override
  String get showPassword => 'نمایش رمز عبور';

  @override
  String get presenceStyle => 'Presence:';

  @override
  String get presencesToggle => 'Show status messages from other users';

  @override
  String get singlesignon => 'شناسایی یگانه(Single Sign on)';

  @override
  String get skip => 'رد شدن';

  @override
  String get sourceCode => 'کد منبع';

  @override
  String get spaceIsPublic => 'فضا عمومی است';

  @override
  String get spaceName => 'نام فضا';

  @override
  String startedACall(String senderName) {
    return '$senderName تماسی را شروع کرد';
  }

  @override
  String get startFirstChat => 'اولین گپ خود را شروع کنید';

  @override
  String get status => 'وضعیت';

  @override
  String get statusExampleMessage => 'امروز حالتان چطور است؟';

  @override
  String get submit => 'ارسال';

  @override
  String get synchronizingPleaseWait => 'در حال همگام‌سازی... لطفا صبر کنید.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Synchronizing… ($percentage%)';
  }

  @override
  String get systemTheme => 'سیستم';

  @override
  String get theyDontMatch => 'با هم منطبق نیستند';

  @override
  String get theyMatch => 'با هم منطبق هستند';

  @override
  String get title => 'فلافی‌چت';

  @override
  String get toggleFavorite => 'تغییر حالت محبوبیت';

  @override
  String get toggleMuted => 'تغییر حالت بی‌صدا';

  @override
  String get toggleUnread => 'علامت‌گذاشتن به عنوان خوانده‌شده/خوانده‌نشده';

  @override
  String get tooManyRequestsWarning =>
      'تعداد درخواست‌های بیش از حد. لطفا بعدا دوباره امتحان کنید!';

  @override
  String get transferFromAnotherDevice => 'انتقال از دستگاهی دیگر';

  @override
  String get tryToSendAgain => 'تلاش برای ارسال مجدد';

  @override
  String get unavailable => 'خارج از دسترس';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username محرومیت $targetName را برداشت';
  }

  @override
  String get unblockDevice => 'برداشتن مسدود بودن دستگاه';

  @override
  String get unknownDevice => 'دستگاه ناشناس';

  @override
  String get unknownEncryptionAlgorithm => 'الگوریتم رمزگذاری ناشناخته';

  @override
  String unknownEvent(String type) {
    return 'رویداد ناشناخته «$type»';
  }

  @override
  String get unmuteChat => 'بازکردن صدای گپ';

  @override
  String get unpin => 'برداشتن سنجاق';

  @override
  String unreadChats(int unreadCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount گپ خوانده نشده',
    );
    return '$_temp0';
  }

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username و $count نفر دیگر در حال تایپ کردن…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username و $username2 در حال تایپ کردن…';
  }

  @override
  String userIsTyping(String username) {
    return '$username در حال تایپ کردن…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪$username گپ را ترک کرد';
  }

  @override
  String get username => 'نام‌کاربری';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username یک رویداد $type فرستاد';
  }

  @override
  String get unverified => 'تاییدنشده';

  @override
  String get verified => 'تاییدشده';

  @override
  String get verify => 'بازبینی و تایید';

  @override
  String get verifyStart => 'شروع بازبینی و تایید';

  @override
  String get verifySuccess => 'بازبینی و تایید با موفقیت انجام شد!';

  @override
  String get verifyTitle => 'در حال تایید حساب دیگر';

  @override
  String get videoCall => 'تماس تصویری';

  @override
  String get visibilityOfTheChatHistory => 'قابلیت دیدن تاریخچه گپ';

  @override
  String get visibleForAllParticipants => 'قابل رویت برای تمام شرکت‌کنندگان';

  @override
  String get visibleForEveryone => 'قابل رویت برای همه';

  @override
  String get voiceMessage => 'پیام صوتی';

  @override
  String get waitingPartnerAcceptRequest =>
      'در انتظار پذیرفتن درخواست از جانب فرد دیگر…';

  @override
  String get waitingPartnerEmoji => 'در انتظار پذیرفتن شکلک از جانب فرد دیگر…';

  @override
  String get waitingPartnerNumbers =>
      'در انتظار پذیرفتن اعداد از جانب فرد دیگر…';

  @override
  String get wallpaper => 'کاغذدیواری:';

  @override
  String get warning => 'هشدار!';

  @override
  String get weSentYouAnEmail => 'یک ایمیل برایتان فرستادیم';

  @override
  String get whoCanPerformWhichAction => 'چه کسی توان انجام کدام عمل را داراست';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'چه کسی اجازه پیوستن به این گروه را دارد';

  @override
  String get whyDoYouWantToReportThis => 'چرا می‌خواهید گزارش دهید؟';

  @override
  String get wipeChatBackup =>
      'برای ایجاد کلید بازیابی جدید، پشتیبان گپ خود را پاک می‌کنید؟';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'با این آدرس‌ها می‌توانید رمز خود را بازیابی کنید.';

  @override
  String get writeAMessage => 'نوشتن پیام…';

  @override
  String get yes => 'بله';

  @override
  String get you => 'شما';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'شما دیگر در این گپ شرکت نمی‌کنید';

  @override
  String get youHaveBeenBannedFromThisChat => 'شما از این گپ محروم شده‌اید';

  @override
  String get yourPublicKey => 'کلید عمومی شما';

  @override
  String get messageInfo => 'اطلاعات پیام';

  @override
  String get time => 'زمان';

  @override
  String get messageType => 'نوع پیام';

  @override
  String get sender => 'فرستنده';

  @override
  String get openGallery => 'بازکردن گالری';

  @override
  String get removeFromSpace => 'حذف از فضا';

  @override
  String get addToSpaceDescription =>
      'فضایی برای افزودن این گپ به آن انتخاب کنید.';

  @override
  String get start => 'شروع';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'برای گشودن قفل پیام‌های قدیمیتان، لطفا کلید بازیابی‌ای که در یک نشست پیشین تولید شده را وارد کنید. کلید بازیابی شما، رمز عبور شما نیست.';

  @override
  String get publish => 'انتشار';

  @override
  String videoWithSize(String size) {
    return 'ویدئو ($size)';
  }

  @override
  String get openChat => 'بازکردن گپ';

  @override
  String get markAsRead => 'علامت‌گذاشتن به عنوان خوانده شده';

  @override
  String get reportUser => 'گزارش دادن کاربر';

  @override
  String get dismiss => 'رد كردن‌';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender با $reaction واکنش نشان داد';
  }

  @override
  String get pinMessage => 'سنجاق کردن به اتاق';

  @override
  String get confirmEventUnpin =>
      'آیا از برداشتن سنجاق رویداد به صورت دائمی مطمئن هستید؟';

  @override
  String get emojis => 'شکلک‌ها';

  @override
  String get placeCall => 'برقراری تماس';

  @override
  String get voiceCall => 'تماس صوتی';

  @override
  String get unsupportedAndroidVersion => 'نسخه اندروید پشتیبانی نشده';

  @override
  String get unsupportedAndroidVersionLong =>
      'این ویژگی به نسخه تازه‌تری از اندروید نیاز دارد. لطفا به‌روزرسانی یا پشتیبانی لینیج‌اواس(Mobile KatyaOS) را بررسی کنید.';

  @override
  String get videoCallsBetaWarning =>
      'لطفا توجه داشته باشید که تماس‌های تصویری در حال حاضر آزمایشی هستند. ممکن است طبق انتظار کار نکنند یا روی همه پلتفرم‌ها اصلا کار نکنند.';

  @override
  String get experimentalVideoCalls => 'تماس‌های تصویری آزمایشی';

  @override
  String get emailOrUsername => 'رایانامه(ایمیل) یا نام کاربری';

  @override
  String get indexedDbErrorTitle => 'اشکالات حالت خصوصی';

  @override
  String get indexedDbErrorLong =>
      'متاسفانه فضای ذخیره‌سازی پیام‌ها، به صورت پیش‌فرض در حالت خصوصی فعال نیست.\nلطفا آدرس زیر را باز کنید:\nabout:config\nمقدار «dom.indexedDB.privateBrowsing.enabled» را به «true» تغییر دهید\nدر غیر این صورت، امکان اجرای فلافی‌چت وجود ندارد.';

  @override
  String switchToAccount(String number) {
    return 'تغییر به حساب $number';
  }

  @override
  String get nextAccount => 'حساب بعدی';

  @override
  String get previousAccount => 'حساب قبلی';

  @override
  String get addWidget => 'افزودن ویجت';

  @override
  String get widgetVideo => 'ویدئو';

  @override
  String get widgetEtherpad => 'یادداشت متنی';

  @override
  String get widgetJitsi => 'جیتسی‌میت(Jitsi Meet)';

  @override
  String get widgetCustom => 'سفارشی';

  @override
  String get widgetName => 'نام';

  @override
  String get widgetUrlError => 'این آدرس وب معتبر نیست.';

  @override
  String get widgetNameError => 'لطفا یک نام نمایشی مشخص کنید.';

  @override
  String get errorAddingWidget => 'بروز خطا هنگام افزودن ویجت.';

  @override
  String get youRejectedTheInvitation => 'شما دعوت را رد کردید';

  @override
  String get youJoinedTheChat => 'شما به گپ پیوستید';

  @override
  String get youAcceptedTheInvitation => '👍 شما دعوت را پذیرفتید';

  @override
  String youBannedUser(String user) {
    return 'شما $user را محروم کردید';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'شما دعوت $user را پس‌گرفتید';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 You have been invited via link to:\n$alias';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 شما توسط $user دعوت شده‌اید';
  }

  @override
  String invitedBy(String user) {
    return '📩 Invited by $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 شما $user را دعوت کردید';
  }

  @override
  String youKicked(String user) {
    return '👞 شما $user را بیرون کردید';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 شما $user را بیرون و محروم کردید';
  }

  @override
  String youUnbannedUser(String user) {
    return 'شما محرومیت $user را برداشتید';
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
  String get users => 'کاربرها';

  @override
  String get unlockOldMessages => 'گشودن قفل پیام‌های قدیمی';

  @override
  String get storeInSecureStorageDescription =>
      'کلید بازیابی را در محل ذخیره‌سازی امن این دستگاه ذخیره کنید.';

  @override
  String get saveKeyManuallyDescription =>
      'این کلید را به صورت دستی با فعال کردن گفتگوی اشتراک گذاری سیستم یا کلیپ بورد ذخیره کنید.';

  @override
  String get storeInAndroidKeystore => 'در Android KeyStore ذخیره کنید';

  @override
  String get storeInAppleKeyChain => 'در Apple KeyChain ذخیره کنید';

  @override
  String get storeSecurlyOnThisDevice => 'به طور ایمن در دستگاه ذخیره کنید';

  @override
  String countFiles(int count) {
    return '$count فایل';
  }

  @override
  String get user => 'کاربر';

  @override
  String get custom => 'سفارشی';

  @override
  String get foregroundServiceRunning =>
      'این اعلان زمانی وقتی ظاهر می شود که سرویس پیش‌زمینه در حال اجرا است.';

  @override
  String get screenSharingTitle => 'اشتراک گذاری صفحه نمایش';

  @override
  String get screenSharingDetail =>
      'شما در حال به اشتراک‌گذاری صفحه‌نمایش خود در فلافی‌چت هستید';

  @override
  String get callingPermissions => 'اجازه‌های تماس';

  @override
  String get callingAccount => 'حساب تماس';

  @override
  String get callingAccountDetails =>
      'به فلافی‌چت اجازه می‌دهد تا از برنامه شماره‌گیر بومی اندروید استفاده کند.';

  @override
  String get appearOnTop => 'در بالا ظاهر شود';

  @override
  String get appearOnTopDetails =>
      'به برنامه اجازه می‌دهد در بالا ظاهر شود (اگر قبلا فلافی‌‌چت را به عنوان حساب تماس تنظیم کرده‌اید، لازم نیست)';

  @override
  String get otherCallingPermissions =>
      'میکروفون، دوربین و سایر مجوزهای فلافی‌چت';

  @override
  String get whyIsThisMessageEncrypted => 'چرا این پیام قابل خواندن نیست؟';

  @override
  String get noKeyForThisMessage =>
      'اگر پیام قبل از ورود به حسابتان در این دستگاه ارسال شده باشد، ممکن است این اتفاق بیفتد.\n\nهمچنین ممکن است فرستنده، دستگاه شما را مسدود کرده باشد یا مشکلی در اتصال اینترنت رخ داده باشد.\n\nآیا می توانید پیام را در نشست دیگری بخوانید؟ بنابراین می توانید پیام را از آن منتقل کنید! به تنظیمات > دستگاه‌ها بروید و مطمئن شوید که دستگاه های شما یکدیگر را تایید کرده‌اند. هنگامی که دفعه بعد اتاق را باز می‌کنید و هر دو جلسه در پیش‌زمینه هستند، کلیدها به طور خودکار منتقل می‌شوند.\n\nآیا نمی‌خواهید هنگام خروج از سیستم یا تعویض دستگاه، کلیدها را گم کنید؟ مطمئن شوید که پشتیبان گپ را در تنظیمات فعال کرده‌اید.';

  @override
  String get newGroup => 'گروه جدید';

  @override
  String get newSpace => 'فضای جدید';

  @override
  String get enterSpace => 'ورود به فضا';

  @override
  String get enterRoom => 'ورود به اتاق';

  @override
  String get allSpaces => 'همه فضاها';

  @override
  String numChats(String number) {
    return '$number گپ';
  }

  @override
  String get hideUnimportantStateEvents =>
      'رویدادهای غیر مهم مربوط به وضعیت را پنهان کنید';

  @override
  String get hidePresences => 'Hide Status List?';

  @override
  String get doNotShowAgain => 'دوباره نشان نده';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'گپ خالی ($oldDisplayName بود)';
  }

  @override
  String get newSpaceDescription =>
      'فضاها به شما امکان می‌دهند گپ‌های خود را یکپارچه کنید و جوامع خصوصی یا عمومی بسازید.';

  @override
  String get encryptThisChat => 'این گپ را رمزگذاری کنید';

  @override
  String get disableEncryptionWarning =>
      'به دلایل امنیتی نمی‌توانید رمزگذاری را در گپ غیرفعال کنید، در حالی که از قبل فعال شده است.';

  @override
  String get sorryThatsNotPossible => 'متاسفم... این امکان‌پذیر نیست';

  @override
  String get deviceKeys => 'کلیدهای دستگاه:';

  @override
  String get reopenChat => 'گپ را دوباره باز کنید';

  @override
  String get noBackupWarning =>
      'هشدار! بدون فعال کردن پشتیبان گپ، دسترسی به پیام های رمزگذاری شده خود را از دست خواهید داد. قویا توصیه می‌شود قبل از خروج از سیستم، ابتدا پشتیبان‌گیری گپ را فعال کنید.';

  @override
  String get noOtherDevicesFound => 'دستگاه دیگری پیدا نشد';

  @override
  String fileIsTooBigForServer(String max) {
    return 'سرور گزارش می‌دهد که فایل برای ارسال بسیار بزرگ است.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'فایل در $path ذخیره شده است';
  }

  @override
  String get jumpToLastReadMessage => 'پرش به آخرین پیام خوانده شده';

  @override
  String get readUpToHere => 'تا اینجا خوانده شده';

  @override
  String get jump => 'پرش';

  @override
  String get openLinkInBrowser => 'بازکردن پیوند در مرورگر';

  @override
  String get reportErrorDescription =>
      'اوه نه. اشتباهی رخ داد. اگر تمایل دارید، می‌توانید این اشکال را با توسعه‌دهندگان گزارش دهید.';

  @override
  String get report => 'گزارش';

  @override
  String get signInWithPassword => 'ورود با رمزعبور';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'لطفا بعدا تلاش کنید یا سرور دیگری انتخاب کنید.';

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
