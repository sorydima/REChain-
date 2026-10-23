// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class L10nUz extends L10n {
  L10nUz([String locale = 'uz']) : super(locale);

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
  String get repeatPassword => 'Parolni takrorlang';

  @override
  String get notAnImage => 'Rasm fayli emas.';

  @override
  String get remove => 'O‘chirish';

  @override
  String get importNow => 'Hozir import qilish';

  @override
  String get importEmojis => 'Emojilarni import qilish';

  @override
  String get importFromZipFile => '.zip faylidan import qilish';

  @override
  String get exportEmotePack =>
      'Emotsiyalar to‘plamini .zip fayl ko‘rinishida eksport qilish';

  @override
  String get replace => 'Almashtirmoq';

  @override
  String get about => 'Biz haqimizda';

  @override
  String aboutHomeserver(String homeserver) {
    return '$homeserver haqida';
  }

  @override
  String get accept => 'Qabul qilmoq';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username taklifni qabul qildi';
  }

  @override
  String get account => 'Hisob';

  @override
  String get accountsAndSettings => 'Accounts and settings';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username shifrlashni yakunlash uchun faollashtirdi';
  }

  @override
  String get addEmail => 'Email qo‘shish';

  @override
  String get confirmREChainId =>
      'Please confirm your REChain ID in order to delete your account.';

  @override
  String supposedMxid(String mxid) {
    return 'Bu $mxid bo‘lishi kerak';
  }

  @override
  String get addToSpace => 'Maydonga qo‘shish';

  @override
  String get admin => 'Admin';

  @override
  String get alias => 'taxallus';

  @override
  String get all => 'Hammasi';

  @override
  String get commandHint_roomupgrade =>
      'Bu guruhni berilgan guruh versiyasiga yangilang';

  @override
  String get commandHint_googly => 'G‘ilay ko‘zlarini yuboring';

  @override
  String get commandHint_cuddle => 'Erkalash yuborish';

  @override
  String get commandHint_hug => 'Quchoqlash yuborish';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName sizga gʻilay ko‘zlarini yubormoqda';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName sizni erkalamoqda';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName sizni quchoqlamoqda';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName chaqiruvga javob berdi';
  }

  @override
  String get anyoneCanJoin => 'Har kim qo‘shilishi mumkin';

  @override
  String get appLock => 'Ilova qulfi';

  @override
  String get appLockDescription =>
      'PIN kod ishlatilmayotganida ilovani qulflash';

  @override
  String get archive => 'Arxiv';

  @override
  String get areGuestsAllowedToJoin =>
      'Mehmon foydalanuvchilarga qo‘shilishga ruxsat berilganmi';

  @override
  String get areYouSure => 'Ishonchingiz komilmi?';

  @override
  String get discardEdits => 'You have unsaved changes. Discard your edits?';

  @override
  String get areYouSureYouWantToLogout =>
      'Haqiqatan ham hisobingizdan chiqamoqchimisiz?';

  @override
  String get askSSSSSign =>
      'Narigi foydalanuvchini imzolash uchun xavfsiz do‘kon parol iborasi yoki tiklash kalitini kiriting.';

  @override
  String askVerificationRequest(String username) {
    return '${username}dan ushbu tasdiqlash so‘rovi qabul qilinsinmi?';
  }

  @override
  String get autoplayImages =>
      'Animatsiyali stikerlar va emojilarni avtomatik ijro etish';

  @override
  String badServerLoginTypesException(
    String serverVersions,
    String supportedVersions,
    Object suportedVersions,
  ) {
    return 'Homeserver quyidagi kirish turlarini qo\'llab-quvvatlaydi:\n$serverVersions\nLekin bu ilova faqat quyidagi turlarni qo\'llab-quvvatlaydi:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Yozish bildirishnomalarini yuborish';

  @override
  String get swipeRightToLeftToReply =>
      'Javob berish uchun o‘ngdan chapga suring';

  @override
  String get sendOnEnter => 'Enterda yuborish';

  @override
  String get noMoreChatsFound => 'Boshqa chatlar topilmadi...';

  @override
  String get noChatsFoundHere =>
      'Bu yerda hali chat topilmadi. Quyidagi tugmadan foydalanib, kimdir bilan yangi suhbat boshlang. ⤵️';

  @override
  String get unread => 'Oʻqilmagan';

  @override
  String get space => 'Boʻshliq';

  @override
  String get banFromChat => 'Suhbatdan taqiqlash';

  @override
  String get banned => 'Taqiqlangan';

  @override
  String bannedUser(String username, String targetName) {
    return '$username taqiqladi $targetName(ni)';
  }

  @override
  String get blockDevice => 'Qurilmani bloklash';

  @override
  String get blocked => 'Bloklandi';

  @override
  String get cancel => 'Bekor qilish';

  @override
  String cantOpenUri(String uri) {
    return '$uri URIni ochib boʻlmadi';
  }

  @override
  String get changeDeviceName => 'Qurilma nomini oʻzgartirish';

  @override
  String changedTheChatAvatar(String username) {
    return '$username suhbat avatarini oʻzgartirdi';
  }

  @override
  String changedTheChatDescription(Object username) {
    return '$username chat tavsifini o‘zgartirdi';
  }

  @override
  String changedTheChatName(Object username) {
    return '$username chat nomini o‘zgartirdi';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username suhbat ruxsatnomalarini oʻzgartirdi';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username oʻzining nomini \'$displayname\'ga oʻzgartirdi';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username mehmon kirish qoidalarini oʻzgartirdi';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username mehmon kirish qoidalarini: ${rules}ga oʻzgartirdi';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username tarix koʻrinishini oʻzgartirdi';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username tarix koʻrinishini: ${rules}ga oʻzgartirdi';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username qoʻshilish qoidalarini oʻzgartirdi';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username qoʻshilish qoidalarini: ${joinRules}ga oʻzgartirdi';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username avatarini oʻzgartirdi';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username xona taxalluslarini oʻzgartirdi';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username taklif havolasini oʻzgartirdi';
  }

  @override
  String get changePassword => 'Parolni o‘zgartirish';

  @override
  String get changeTheHomeserver => 'Homeserverni almashtirish';

  @override
  String get changeTheme => 'Uslubingizni o‘zgartiring';

  @override
  String get changeTheNameOfTheGroup => 'Guruh nomini o‘zgartirish';

  @override
  String get changeYourAvatar => 'Avataringizni almashtiring';

  @override
  String get channelCorruptedDecryptError => 'Shifrlash buzilgan';

  @override
  String get chat => 'Suhbat';

  @override
  String get chatBackup => 'Suhbat zaxirasi';

  @override
  String get chatDetails => 'Suhbat tafsilotlari';

  @override
  String get chats => 'Suhbatlar';

  @override
  String get chooseAStrongPassword => 'Kuchli parol tanlang';

  @override
  String get clearArchive => 'Arxivni tozalash';

  @override
  String get close => 'Yopish';

  @override
  String get commandHint_markasdm =>
      'REChain identifikatorini berish uchun shaxsiy xabar guruhi sifatida belgilang';

  @override
  String get commandHint_markasgroup => 'Guruh sifatida belgilash';

  @override
  String get commandHint_ban => 'Bu guruhdan berilgan foydalanuvchini bloklash';

  @override
  String get commandHint_clearcache => 'Kesh tozalash';

  @override
  String get commandHint_create =>
      'Boʻsh guruh suhbati yarating\nShifrlashni oʻchirish uchun --no-encryption dan foydalaning';

  @override
  String get commandHint_discardsession => 'Seansni bekor qilish';

  @override
  String get commandHint_dm =>
      'Jonli suhbatni boshlash\nShifrlashni o‘chirish uchun --no-encryption dan foydalaning';

  @override
  String get commandHint_html => 'HTML formatidagi matnni yuborish';

  @override
  String get commandHint_invite =>
      'Berilgan foydalanuvchini ushbu guruhga taklif qiling';

  @override
  String get commandHint_join => 'Berilgan guruhga qoʻshilish';

  @override
  String get commandHint_kick => 'Berilgan foydalanuvchini guruhdan oʻchirish';

  @override
  String get commandHint_leave => 'Guruhni tark etish';

  @override
  String get commandHint_me => 'Oʻzingizni tariflang';

  @override
  String get commandHint_myroomavatar =>
      'Bu guruh uchun rasmingizni sozlang (mxc-uri tomonidan)';

  @override
  String get commandHint_myroomnick => 'Bu guruh uchun displey nomini sozlang';

  @override
  String get commandHint_op =>
      'Berilgan foydalanuvchi quvvat darajasini oʻrnating (standart: 50)';

  @override
  String get commandHint_plain => 'Formatlanmagan matnni yuboring';

  @override
  String get commandHint_react => 'Javobni reaksiya sifatida yuboring';

  @override
  String get commandHint_send => 'Matn yuborish';

  @override
  String get commandHint_unban =>
      'Berilgan foydalanuvchini bu guruhdan blokdan chiqazish';

  @override
  String get commandInvalid => 'Buyruq yaroqsiz';

  @override
  String commandMissing(String command) {
    return '$command komanda emas.';
  }

  @override
  String get compareEmojiMatch => 'Iltimos emojilarni taqqoslang';

  @override
  String get compareNumbersMatch => 'Iltimos raqamlarni taqqoslang';

  @override
  String get configureChat => 'Suhbatni sozlash';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Kontakt guruhga taklif qilindi';

  @override
  String get contentHasBeenReported =>
      'Kontent server administratorlariga xabar qilindi';

  @override
  String get copiedToClipboard => 'Buferga nusxalandi';

  @override
  String get copy => 'Nusxalash';

  @override
  String get copyToClipboard => 'Buferga nusxalash';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Xabarni shifrlab boʻlmadi: $error';
  }

  @override
  String get checkList => 'Tekshirish roʻyxati';

  @override
  String countParticipants(int count) {
    return '$count qatnashuvchilar';
  }

  @override
  String countInvited(int count) {
    return '$count taklif qilindi';
  }

  @override
  String get create => 'Yaratish';

  @override
  String createdTheChat(String username) {
    return '💬 $username suhbat yaratdi';
  }

  @override
  String get createGroup => 'Guruh yaratish';

  @override
  String get createNewSpace => 'Yangi maydon';

  @override
  String get currentlyActive => 'Hozirda faol';

  @override
  String get darkTheme => 'Qorongʻi';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String get deactivateAccountWarning =>
      'Bu sizning foydalanuvchi hisobingizni oʻchirib qoʻyadi. Buni qaytarib boʻlmaydi! Ishonchingiz komilmi?';

  @override
  String get defaultPermissionLevel =>
      'Yangi foydalanuvchilar uchun standart ruxsat darajasi';

  @override
  String get delete => 'Oʻchirish';

  @override
  String get deleteAccount => 'Hisobni oʻchirish';

  @override
  String get deleteMessage => 'Xabarni oʻchirish';

  @override
  String get devices => 'Qurilmalar';

  @override
  String get directChats => 'Shaxsiy suhbatlar';

  @override
  String get displaynameHasBeenChanged => 'Displey nomi o‘zgartirildi';

  @override
  String get downloadFile => 'Faylni yuklab olish';

  @override
  String get edit => 'Tahrirlash';

  @override
  String get editBlockedServers => 'Bloklangan serverlarni tahrirlash';

  @override
  String get chatPermissions => 'Suhbat ruxsatlari';

  @override
  String get editDisplayname => 'Displey nomini tahrirlash';

  @override
  String get editRoomAliases => 'Xona taxalluslarini tahrirlash';

  @override
  String get editRoomAvatar => 'Xona avatarini tahrirlash';

  @override
  String get emoteExists => 'Emotsiya allaqachon mavjud!';

  @override
  String get emoteInvalid => 'Noto‘g‘ri emotsiya kodi!';

  @override
  String get emoteKeyboardNoRecents =>
      'Yaqinda ishlatilgan emotsiyalar shu yerda chiqadi...';

  @override
  String get globalChatId => 'Ommaviy suhbat IDʼsi';

  @override
  String get accessAndVisibility => 'Kirish va koʻrinish';

  @override
  String get accessAndVisibilityDescription =>
      'Bu suhbatga kim qoʻshilishi mumkin va suhbatni qanday topish mumkin.';

  @override
  String get customEmojisAndStickers => 'Maxsus emojilar va stikerlar';

  @override
  String get customEmojisAndStickersBody =>
      'Istalgan suhbatda ishlatilishi mumkin boʻlgan maxsus emojilar yoki stikerlarni qoʻshing yoki ulashing.';

  @override
  String get emoteShortcode => 'Emote qisqa kodi';

  @override
  String get emptyChat => 'Boʻsh suhbat';

  @override
  String get enableEmotesGlobally => 'Emote paketini global miqyosda yoqish';

  @override
  String get enableEncryption => 'Shifrlashni yoqish';

  @override
  String get enableEncryptionWarning =>
      'Siz endi shifrlashni oʻchira olmaysiz. Ishonchingiz komilmi?';

  @override
  String get encrypted => 'Shifrlangan';

  @override
  String get encryption => 'Shifrlash';

  @override
  String get encryptionNotEnabled => 'Shifrlash yoqilmagan';

  @override
  String endedTheCall(String senderName) {
    return '$senderName chaqiruvni tugatdi';
  }

  @override
  String get enterAnEmailAddress => 'Email manzilini kiriting';

  @override
  String errorObtainingLocation(String error) {
    return 'Joylashuv axboroti olinmadi: $error';
  }

  @override
  String get fontSize => 'Shrift oʻlchami';

  @override
  String get forward => 'Yuborvorish';

  @override
  String get fromJoining => 'Qoʻshilishdan';

  @override
  String get fromTheInvitation => 'Taklifnomadan';

  @override
  String get group => 'Guruh';

  @override
  String get chatDescription => 'Suhbat tavsifi';

  @override
  String get chatDescriptionHasBeenChanged => 'Suhbat tavsifi oʻzgartirildi';

  @override
  String get groupIsPublic => 'Guruh ommaviy';

  @override
  String get groups => 'Guruhlar';

  @override
  String groupWith(String displayname) {
    return '$displayname bilan guruh';
  }

  @override
  String get guestsAreForbidden => 'Mehmonlarga kirish taqiqlangan';

  @override
  String get guestsCanJoin => 'Mehmonlar qoʻshila oladi';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username $targetName uchun taklifnomani qaytarib oldi';
  }

  @override
  String get help => 'Yordam';

  @override
  String get hideRedactedMessages => 'Oʻchirilgan xabarlarni yashirish';

  @override
  String get hideRedactedMessagesBody =>
      'Agar kimdir xabarni oʻchirsa, bu xabar endi suhbatda koʻrinmaydi.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Notoʻgʻri yoki nomaʼlum xabar formatlarini yashirish';

  @override
  String get block => 'Bloklash';

  @override
  String get blockedUsers => 'Bloklangan foydalanuvchilar';

  @override
  String get blockListDescription =>
      'Sizni bezovta qilayotgan foydalanuvchilarni bloklashingiz mumkin. Shaxsiy bloklash roʻyxatingizdagi foydalanuvchilardan hech qanday xabar yoki guruhga taklifnomalarni qabul qila olmaysiz.';

  @override
  String get blockUsername => 'Foydalanuvchi nomini eʻtiborsiz qoldirish';

  @override
  String get iHaveClickedOnLink => 'Men havolani bosdim';

  @override
  String get incorrectPassphraseOrKey => 'Notoʻgʻri parol yoki tiklash kaliti';

  @override
  String get inviteContact => 'Kontaktni taklif qilish';

  @override
  String inviteContactToGroup(String groupName) {
    return 'Kontaktni $groupName ga taklif qiling';
  }

  @override
  String get noChatDescriptionYet => 'Hali suhbat tavsifi yaratilmagan.';

  @override
  String get tryAgain => 'Qayta urinib koʻrish';

  @override
  String get invalidServerName => 'Server nomi notoʻgʻri';

  @override
  String get invited => 'Taklif qilindi';

  @override
  String get redactMessageDescription =>
      'Xabar ushbu suhbatdagi barcha ishtirokchilar uchun oʻchiriladi. Buni bekor qilib boʻlmaydi.';

  @override
  String get optionalRedactReason =>
      '(Ixtiyoriy) Ushbu xabarni oʻchirish sababi...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username ${targetName}ni taklif qildi';
  }

  @override
  String get invitedUsersOnly => 'Faqat taklif qilingan foydalanuvchilar';

  @override
  String inviteText(String username, String link) {
    return '$username sizni REChain.ga taklif qildi.\n1. github.com/sorydima/REChain- saytiga tashrif buyuring va ilovani oʻrnating.\n2. Roʻyxatdan oʻting yoki tizimga kiring.\n3. Taklif havolasini oching:\n$link';
  }

  @override
  String get isTyping => 'yozmoqda…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username suhbatga qoʻshildi';
  }

  @override
  String get joinRoom => 'Guruhga qoʻshilish';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username ${targetName}ni tepdi';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username ${targetName}ni tepdi va blokladi';
  }

  @override
  String get kickFromChat => 'Suhbatdan tepish';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Oxirgi faol: $localizedTimeShort';
  }

  @override
  String get leave => 'Chiqish';

  @override
  String get leftTheChat => 'Suhbatni tark etdi';

  @override
  String get lightTheme => 'Yorugʻlik';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Yana $count ishtirokchini yuklang';
  }

  @override
  String get dehydrate => 'Sessiyani eksport qilish va qurilmani oʻchirish';

  @override
  String get dehydrateWarning =>
      'Bu amalni bekor qilib boʻlmaydi. Zaxira faylini xavfsiz saqlang.';

  @override
  String get hydrate => 'Zaxira faylidan tiklash';

  @override
  String get loadingPleaseWait => 'Yuklanmoqda… Iltimos, kuting.';

  @override
  String get loadMore => 'Koʻproq yuklash…';

  @override
  String get locationDisabledNotice =>
      'Joylashuv xizmatlari oʻchirib qoʻyilgan. Joylashuvingizni ulashish uchun ularni yoqing.';

  @override
  String get locationPermissionDeniedNotice =>
      'Joylashuvga ruxsat berilmadi. Iltimos, ularga joylashuvingizni ulashishga ruxsat bering.';

  @override
  String get login => 'Kirish';

  @override
  String logInTo(String homeserver) {
    return '$homeserver ga kirish';
  }

  @override
  String get logout => 'Chiqish';

  @override
  String get mention => 'Qayd etmoq';

  @override
  String get messages => 'Xabarlar';

  @override
  String get messagesStyle => 'Xabarlar:';

  @override
  String get moderator => 'Moderator';

  @override
  String get muteChat => 'Suhbatni ovozsizlantirish';

  @override
  String get newChat => 'Yangi suhbat';

  @override
  String get newMessageInrechainonline => '💬 REChain yangi xabarlar';

  @override
  String get newVerificationRequest => 'Yangi tasdiqlash so\'rovi!';

  @override
  String get next => 'Keyingi';

  @override
  String get no => 'Yoʻq';

  @override
  String get noConnectionToTheServer => 'Serverga ulanish yoʻq';

  @override
  String get noEmotesFound => 'Hech qanday emoteʼlar topilmadi 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Shifrlashni faqat guruh endi hamma uchun ochiq bo\'lmay qolgandan keyingina faollashtirishingiz mumkin.';

  @override
  String get noGoogleServicesWarning =>
      'Firebase Cloud Messaging qurilmangizda mavjud emasga o\'xshaydi. Push-bildirishnomalarni olishda davom etish uchun ntfy-ni o\'rnatishingizni tavsiya qilamiz. NTFY yoki boshqa Unified Push provayderi yordamida siz ma\'lumotlar xavfsizligini ta\'minlash orqali push-bildirishnomalarni olishingiz mumkin. Siz ntfy-ni PlayStore yoki F-Droid-dan yuklab olishingiz mumkin.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 REChain serveri emas, buning o\'rniga $server2 dan foydalanilsinmi?';
  }

  @override
  String get shareInviteLink => 'Taklifnoma havolasini ulashish';

  @override
  String get scanQrCode => 'QR kodini skanerlang';

  @override
  String get noPasswordRecoveryDescription =>
      'Siz hali parolingizni tiklash usulini qoʻshmadingiz.';

  @override
  String get noPermission => 'Ruxsat yoʻq';

  @override
  String get noRoomsFound => 'Hech qanday guruhlar topilmadi…';

  @override
  String get notifications => 'Bildirishnomalar';

  @override
  String numUsersTyping(int count) {
    return '$count foydalanuvchilar yozmoqda…';
  }

  @override
  String get obtainingLocation => 'Joylashuv aniqlanmoqda…';

  @override
  String get ok => 'Hop';

  @override
  String get onlineKeyBackupEnabled => 'Onlayn kalit zaxira nusxasi yoqilgan';

  @override
  String get oopsPushError =>
      'Afsuski, push-bildirishnomalarni sozlashda xatolik yuz berdi.';

  @override
  String get oopsSomethingWentWrong => 'Voy, nimadir notoʻgʻri ketdi…';

  @override
  String get openAppToReadMessages => 'Xabarlarni oʻqish uchun ilovani oching';

  @override
  String get openCamera => 'Kamerani ochish';

  @override
  String get oneClientLoggedOut => 'Mijozlaringizdan biri tizimdan chiqdi';

  @override
  String get addAccount => 'Hisob qoʻshish';

  @override
  String get editBundlesForAccount => 'Bu hisob uchun toʻplamlarni tahrirlash';

  @override
  String get addToBundle => 'Toʻplamga qoʻshish';

  @override
  String get removeFromBundle => 'Bu toʻplamdan oʻchirish';

  @override
  String get bundleName => 'Toʻplam nomi';

  @override
  String get openInMaps => 'Xaritalarda ochish';

  @override
  String get link => 'Havola';

  @override
  String get or => 'Yoki';

  @override
  String get participant => 'Qatnashuvchi';

  @override
  String get passphraseOrKey => 'parol yoki tiklash kaliti';

  @override
  String get password => 'Parol';

  @override
  String get passwordForgotten => 'Parol unitilgan';

  @override
  String get passwordHasBeenChanged => 'Parol oʻzgartirildi';

  @override
  String get passwordRecoverySettings => 'Parolni qayta tiklash sozlamalari';

  @override
  String get passwordRecovery => 'Parolni qayta tiklash';

  @override
  String get pin => 'Toʻgʻnash';

  @override
  String get pleaseChooseAPasscode => 'Iltimos, kirish kodini tanlang';

  @override
  String get pleaseClickOnLink =>
      'Iltimos, elektron pochtadagi havolani bosing va keyin davom eting.';

  @override
  String get pleaseEnterYourPassword => 'Iltimos parolingizni kiriting';

  @override
  String get pleaseEnterYourPin => 'Iltimos PIN kodingizni kiriting';

  @override
  String get pleaseEnterYourUsername => 'Iltimos foydalanuvchi nomini kiriting';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Iltimos, veb-saytdagi koʻrsatmalarga amal qiling va keyingisini bosing.';

  @override
  String get privacy => 'Maxfiylik';

  @override
  String get publicRooms => 'Ommaviy guruhlar';

  @override
  String get reason => 'Sabab';

  @override
  String redactedBy(String username) {
    return '$username tomonidan tahrirlangan';
  }

  @override
  String redactedByBecause(String username, String reason) {
    return '$username tomonidan tahrirlandi, sababi: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username tadbirni oʻchirib tashladi';
  }

  @override
  String get redactMessage => 'Xabarni tahrirlash';

  @override
  String get reject => 'Rad qilish';

  @override
  String rejectedTheInvitation(String username) {
    return '$username taklifni rad qildi';
  }

  @override
  String get removeAllOtherDevices => 'Qolgan barcha qurilmalarni oʻchirish';

  @override
  String get unbanFromChat => 'Suhbat blokidan chiqazish';

  @override
  String get removeYourAvatar => 'Avatarni oʻchirish';

  @override
  String get replaceRoomWithNewerVersion =>
      'Guruhni yangiroq versiya bilan almashtirish';

  @override
  String get reply => 'Javob yozish';

  @override
  String get reportMessage => 'Xabar berish';

  @override
  String get roomHasBeenUpgraded => 'Xona takomillashtirildi';

  @override
  String sendingFilesDoNotExit(int count) {
    return 'Sending $count files... Please do not exit!';
  }

  @override
  String get roomVersion => 'Guruh versiyasi';

  @override
  String get compressingVideo => 'Compressing video...';

  @override
  String get saveFile => 'Fayl saqlash';

  @override
  String get search => 'Qidiruv';

  @override
  String get security => 'Xavfsizlik';

  @override
  String get send => 'Yuborish';

  @override
  String get sendAMessage => 'Xabar yuborish';

  @override
  String get sendAsText => 'Matn sifatida yuborish';

  @override
  String get sendAudio => 'Audio yuborish';

  @override
  String get sendFile => 'Faylni yuborish';

  @override
  String get sendImage => 'Rasm yuborish';

  @override
  String sendImages(int count) {
    return '$count ta rasm yuborish';
  }

  @override
  String get sendMessages => 'Xabarlar yuborish';

  @override
  String get sendVideo => 'Video yuborish';

  @override
  String sentAFile(String username) {
    return '📁 $username fayl yubordi';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username audio yubordi';
  }

  @override
  String sentAPicture(String username) {
    return '️ 🖼️ $username rasm yubordi';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username stiker yubordi';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username video yubordi';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName chaqiruv axborotini yubordi';
  }

  @override
  String get setAsCanonicalAlias => 'Asosiy taxallus sifatida belgilash';

  @override
  String get setChatDescription => 'Suhbat tavsifini sozlash';

  @override
  String get setStatus => 'Holatni sozlash';

  @override
  String get settings => 'Sozlamalar';

  @override
  String get share => 'Bo‘lishmoq';

  @override
  String sharedTheLocation(String username) {
    return '$username joylashuvini ulashdi';
  }

  @override
  String get shareLocation => 'Joylashuvni ulashish';

  @override
  String get skip => 'Tashlab ketish';

  @override
  String get sourceCode => 'Manba kodi';

  @override
  String get spaceIsPublic => 'Guruh ochiq';

  @override
  String get spaceName => 'Guruh nomi';

  @override
  String startedACall(String senderName) {
    return '$senderName chaqiruv boshladi';
  }

  @override
  String get status => 'Holati';

  @override
  String get statusExampleMessage => 'Bugun ahvolingiz qalay?';

  @override
  String get submit => 'Yuborish';

  @override
  String get synchronizingPleaseWait => 'Sinxronlanmoqda... Iltimos, kuting.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Sinxronlanmoqda... ($percentage%)';
  }

  @override
  String get systemTheme => 'Tizim';

  @override
  String get theyDontMatch => 'Ular mos emas';

  @override
  String get theyMatch => 'Ular mos keladi';

  @override
  String get tooManyRequestsWarning =>
      'Talablar soni oshib ketdi. Keyinroq qayta urining!';

  @override
  String get tryToSendAgain => 'Qayta yuborishga urining';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username ${targetName}ni blokdan chiqardi';
  }

  @override
  String get unblockDevice => 'Qurilmani blokdan chiqarish';

  @override
  String get unknownDevice => 'Notanish qurilma';

  @override
  String get unknownEncryptionAlgorithm => 'Noma’lum shifrlash algoritmi';

  @override
  String unknownEvent(String type) {
    return 'Noma’lum hodisa \'$type\'';
  }

  @override
  String get unmuteChat => 'Suhbatni ovozli qilish';

  @override
  String get unpin => 'Olib tashlash';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username va yana $count kishi yozmoqda…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username va $username2 yozmoqda…';
  }

  @override
  String userIsTyping(String username) {
    return '$username yozmoqda…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username suhbatni tark etdi';
  }

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username $type tadbirini yubordi';
  }

  @override
  String get unverified => 'Tasdiqlanmagan';

  @override
  String get verified => 'Tasdiqlangan';

  @override
  String get verifyStart => 'Tasdiqlashni boshlash';

  @override
  String get verifySuccess => 'Siz tasdiqladingiz!';

  @override
  String get verifyTitle => 'Boshqa hisob tasdiqlanmoqda';

  @override
  String get visibilityOfTheChatHistory => 'Suhbat tarixining ko‘rinishi';

  @override
  String get visibleForAllParticipants => 'Barcha ishtirokchilarga ko‘rinadi';

  @override
  String get visibleForEveryone => 'Hammaga ko‘rinadigan';

  @override
  String get voiceMessage => 'Ovozli xabar';

  @override
  String get waitingPartnerAcceptRequest =>
      'Hamkor so‘rovni qabul qilishi kutilmoqda…';

  @override
  String get waitingPartnerEmoji => 'Hamkor emoji qabul qilishini kutmoqda…';

  @override
  String get waitingPartnerNumbers =>
      'Hamkor raqamlarni qabul qilishi kutilmoqda…';

  @override
  String get warning => 'Ogohlantirish!';

  @override
  String get weSentYouAnEmail => 'Sizga xat yubordik';

  @override
  String get whoCanPerformWhichAction => 'Kim qaysi amalni bajarishi mumkin';

  @override
  String get whoIsAllowedToJoinThisGroup => 'Bu guruhga kim qo‘shilishi mumkin';

  @override
  String get whyDoYouWantToReportThis =>
      'Nima uchun bu haqda xabar bermoqchisiz?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Ushbu manzillar yordamida parolingizni tiklashingiz mumkin.';

  @override
  String get writeAMessage => 'Xabar yozish…';

  @override
  String get yes => 'Ha';

  @override
  String get you => 'Siz';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Siz ortiq bu suhbatda qatnashmayapsiz';

  @override
  String get yourPublicKey => 'Ochiq kalitingiz';

  @override
  String get messageInfo => 'Xabar axboroti';

  @override
  String get time => 'Vaqt';

  @override
  String get sender => 'Yuboruvchi';

  @override
  String get openGallery => 'Galereyani ochish';

  @override
  String get removeFromSpace => 'Guruhdan olib tashlash';

  @override
  String get markAsRead => 'Oʻqilgan sifatida belgilash';

  @override
  String get reportUser => 'Foydalanuvchi haqida xabar berish';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender $reaction bilan reaksiya bildirdi';
  }

  @override
  String get pinMessage => 'Xonaga mahkamlash';

  @override
  String get confirmEventUnpin =>
      'Tadbirni butunlay olib tashlashga ishonchingiz komilmi?';

  @override
  String get emojis => 'Emojilar';

  @override
  String get unsupportedAndroidVersion =>
      'Qoʻllab-quvvatlanmaydigan Android versiyasi';

  @override
  String get unsupportedAndroidVersionLong =>
      'Bu funksiya Androidning yangi versiyasini talab qiladi. Iltimos, yangilanishlar yoki Mobile Katya OS qoʻllab-quvvatlashini tekshiring.';

  @override
  String get youRejectedTheInvitation => 'Taklifni rad etdingiz';

  @override
  String get youJoinedTheChat => 'Siz suhbatga qoʻshildingiz';

  @override
  String get youAcceptedTheInvitation => '👍 Taklifni qabul qildingiz';

  @override
  String youBannedUser(String user) {
    return 'Siz ${user}ni blokladingiz';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Siz $user uchun taklifnomani bekor qildingiz';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 Sizni $user taklif qildi';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Siz ${user}ni taklif qildingiz';
  }

  @override
  String youKicked(String user) {
    return '👞 Siz ${user}ni chiqarib yubordingiz';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Siz ${user}ni chiqardingiz va blokladingiz';
  }

  @override
  String youUnbannedUser(String user) {
    return '${user}ni blokdan chiqardingiz';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user taqillatdi';
  }

  @override
  String get usersMustKnock => 'Foydalanuvchilar taqillatishi kerak';

  @override
  String get noOneCanJoin => 'Hech kim qoʻshila olmaydi';

  @override
  String get knock => 'Taqillating';

  @override
  String get users => 'Foydalanuvchilar';

  @override
  String get storeInAndroidKeystore => 'Android KeyStoreʼda saqlang';

  @override
  String get storeInAppleKeyChain => 'Apple KeyChainʼda saqlang';

  @override
  String get storeSecurlyOnThisDevice => 'Ushbu qurilmada xavfsiz saqlang';

  @override
  String countFiles(int count) {
    return '$count fayllar';
  }

  @override
  String get user => 'Foydalanuvchi';

  @override
  String get custom => 'Maxsus';

  @override
  String get whyIsThisMessageEncrypted =>
      'Nima uchun bu xabarni oʻqib boʻlmaydi?';

  @override
  String get noKeyForThisMessage =>
      'Bu xabar siz ushbu qurilmada hisobingizga kirishdan oldin yuborilgan boʻlsa sodir boʻlishi mumkin.\n\nShuningdek, joʻnatuvchi qurilmangizni bloklagan yoki internet ulanishida biron bir muammo yuzaga kelgan boʻlishi mumkin.\n\nXabarni boshqa sessiyada oʻqiy olasizmi? Keyin xabarni undan uzatishingiz mumkin! Sozlamalar > Qurilmalar boʻlimiga oʻting va qurilmalaringiz bir-birini tasdiqlaganligiga ishonch hosil qiling. Keyingi safar xonani ochganingizda va ikkala sessiya ham oldinda boʻlganda, kalitlar avtomatik ravishda uzatiladi.\n\nTizimdan chiqishda yoki qurilmalarni almashtirishda kalitlarni yoʻqotishni xohlamaysizmi? Sozlamalarda suhbatning zaxira nusxasini yoqganingizga ishonch hosil qiling.';

  @override
  String get newSpace => 'Yangi maydon';

  @override
  String get doNotShowAgain => 'Qaytib koʻrsatilmasin';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Boʻsh suhbat ($oldDisplayName edi)';
  }

  @override
  String get newSpaceDescription =>
      'Maydonlar sizga suhbatlaringizni birlashtirish va shaxsiy yoki ommaviy hamjamiyatlarni yaratish imkonini beradi.';

  @override
  String get encryptThisChat => 'Bu suhbatni shifrlash';

  @override
  String get disableEncryptionWarning =>
      'Xavfsizlik nuqtai nazaridan, agar u ilgari yoqilgan boʻlsa, suhbatda shifrlashni oʻchirib qoʻyolmaysiz.';

  @override
  String get sorryThatsNotPossible => 'Kechirasiz... bu mumkin emas';

  @override
  String get reopenChat => 'Suhbatni qayta ochish';

  @override
  String get noBackupWarning =>
      'Diqqat! Suhbatni zaxiralashni yoqmasangiz, shifrlangan xabarlaringizga kirish huquqini yoʻqotasiz. Tizimdan chiqishdan oldin chatni zaxiralashni yoqishingiz tavsiya etiladi.';

  @override
  String get noOtherDevicesFound => 'Boshqa qurilma topilmadi';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Yuborish imkonsiz! Server faqat $max hajmgacha bo‘lgan ilovalarni qo‘llab-quvvatlaydi.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Fayl ${path}da saqlandi';
  }

  @override
  String get jumpToLastReadMessage => 'Oxirgi o‘qilgan xabarga o‘tish';

  @override
  String get readUpToHere => 'Bu yerga qadar o‘qish';

  @override
  String get jump => 'Sakrash';

  @override
  String get openLinkInBrowser => 'Havolani brauzerda ochish';

  @override
  String get reportErrorDescription =>
      '😭 Voy yo‘q. Nimadir xato ketdi. Agar xohlasangiz, bu xato haqida dasturchilarga xabar berishingiz mumkin.';

  @override
  String get report => 'hisobot';

  @override
  String get setColorTheme => 'Rang mavzusini sozlash:';

  @override
  String get invite => 'Taklif qilish';

  @override
  String get inviteGroupChat => '📨 Guruh suhbatiga taklif';

  @override
  String get invalidInput => 'Xato kiritildi!';

  @override
  String wrongPinEntered(int seconds) {
    return 'PIN noto‘g‘ri kiritildi! $seconds soniyadan keyin qayta urining...';
  }

  @override
  String get pleaseEnterANumber => '0 dan katta son kiriting';

  @override
  String get archiveRoomDescription =>
      'Suhbat arxivga koʻchiriladi. Boshqa foydalanuvchilar sizning suhbatdan chiqqaningizni koʻra oladilar.';

  @override
  String get roomUpgradeDescription =>
      'Keyin suhbat yangi guruh versiyasi bilan qayta yaratiladi. Barcha ishtirokchilarga yangi suhbatga oʻtishlari kerakligi haqida xabar beriladi. Guruh versiyalari haqida koʻproq maʼlumotni https://github.com/sorydima/REChain-.git manzilida topishingiz mumkin';

  @override
  String get removeDevicesDescription =>
      'Bu qurilmadan chiqarilasiz va ortiq xabarlarni qabul qila olmaysiz.';

  @override
  String get banUserDescription =>
      'Foydalanuvchi suhbatdan bloklanadi va blokdan chiqarilmaguncha suhbatga qayta kira olmaydi.';

  @override
  String get unbanUserDescription =>
      'Foydalanuvchi qayta suhbatga kira oladi agar ular urinib koʻrishsa.';

  @override
  String get kickUserDescription =>
      'Foydalanuvchi suhbatdan chiqarib yuboriladi, ammo taqiqlanmaydi. Ommaviy chatlarda foydalanuvchi istalgan vaqtda qayta qoʻshilishi mumkin.';

  @override
  String get makeAdminDescription =>
      'Bu foydalanuvchini admini qilsangiz, uni bekor qila olmasligingiz mumkin, chunki u siz bilan bir xil ruxsatlarga ega bo‘ladi.';

  @override
  String get pushNotificationsNotAvailable =>
      'Push-bildirishnomalar mavjud emas';

  @override
  String get learnMore => 'Batafsil';

  @override
  String get yourGlobalUserIdIs => 'Global foydalanuvchi ID raqamingiz: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Afsuski, \"$query\" soʻrovi bilan foydalanuvchi topilmadi. Iltimos, xato qilganingizni tekshiring.';
  }

  @override
  String get knocking => 'Taqillatmoqda';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Suhbatni $server saytidagi qidiruv orqali topish mumkin';
  }

  @override
  String get searchChatsRooms => 'Qidiruv #chats, @users...';

  @override
  String get nothingFound => 'Hech nima topilmadi...';

  @override
  String get groupName => 'Guruh nomi';

  @override
  String get createGroupAndInviteUsers =>
      'Guruh yaratish va foydalanuvchilarni taklif qilish';

  @override
  String get groupCanBeFoundViaSearch =>
      'Guruh qidiruv orqali topilishi mumkin';

  @override
  String get wrongRecoveryKey =>
      'Kechirasiz... bu toʻgʻri tiklash kaliti emasga oʻxshaydi.';

  @override
  String get commandHint_sendraw => 'Xom jsonni yuborish';

  @override
  String get databaseMigrationTitle => 'Maʼlumotlar bazasi optimallashtirilgan';

  @override
  String get databaseMigrationBody =>
      'Iltimos, kuting. Bu biroz vaqt olishi mumkin.';

  @override
  String get leaveEmptyToClearStatus =>
      'Holatingizni tozalash uchun boʻsh qoldiring.';

  @override
  String get select => 'Tanlash';

  @override
  String get searchForUsers => '@users ni qidiring...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Iltimos, joriy maxfiy soʻzingizni kiriting';

  @override
  String get newPassword => 'Yangi maxfiy soʻz';

  @override
  String get pleaseChooseAStrongPassword =>
      'Iltimos kuchli maxfiy soʻz tanlang';

  @override
  String get passwordsDoNotMatch => 'Maxfiy soʻzlar mos kelmadi';

  @override
  String get passwordIsWrong => 'Siz kiritgan maxfiy soʻz xato';

  @override
  String get publicChatAddresses => 'Ommaviy suhbat manzillari';

  @override
  String get createNewAddress => 'Yangi manzil yarating';

  @override
  String get joinSpace => 'Maydonga qoʻshiling';

  @override
  String get publicSpaces => 'Ommaviy maydonlar';

  @override
  String get addChatOrSubSpace => 'Suhbat yoki sub-maydon qoʻshing';

  @override
  String get thisDevice => 'Ushbu qurilma:';

  @override
  String get initAppError => 'Ilovani ishga tushirishda xatolik yuz berdi';

  @override
  String searchIn(String chat) {
    return 'Suhbat \"$chat\"da qidiring...';
  }

  @override
  String get searchMore => 'Koʻproq qidirish...';

  @override
  String get gallery => 'Galereya';

  @override
  String get files => 'Fayllar';

  @override
  String sessionLostBody(String url, String error) {
    return 'Seansingiz yoʻqoldi. Iltimos, ushbu xato haqida $url manzilidagi dasturchilarga xabar bering. Xato xabari: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Ilova endi seansingizni zaxira nusxasidan tiklashga harakat qiladi. Iltimos, ushbu xato haqida $url manzilidagi dasturchilarga xabar bering. Xato xabari: $error';
  }

  @override
  String get sendReadReceipts => 'Oʻqilganlik haqida xabarnomalarni yuborish';

  @override
  String get sendTypingNotificationsDescription =>
      'Suhbatdagi boshqa ishtirokchilar siz yangi xabar yozayotganingizni koʻrishlari mumkin.';

  @override
  String get sendReadReceiptsDescription =>
      'Suhbatdagi boshqa ishtirokchilar sizning xabarni qachon oʻqiganingizni koʻrishlari mumkin.';

  @override
  String get formattedMessages => 'Formatlangan xabarlar';

  @override
  String get formattedMessagesDescription =>
      'Markdown yordamida qalin matn kabi boy xabar mazmunini koʻrsating.';

  @override
  String get verifyOtherUser => '🔐 Boshqa foydalanuvchini tasdiqlang';

  @override
  String get verifyOtherUserDescription =>
      'Agar siz boshqa foydalanuvchini tasdiqlasangiz, aslida kimga yozayotganingizni bilishingizga amin boʻlishingiz mumkin. 💪\n\nTekshiruvni boshlaganingizda, siz va boshqa foydalanuvchi ilovada qalqib chiquvchi oynani koʻrasiz. Keyin u yerda siz bir-biringiz bilan taqqoslashingiz kerak boʻlgan bir qator emojilar yoki raqamlarni koʻrasiz.\n\nBuning eng yaxshi usuli - uchrashish yoki video qoʻngʻiroqni boshlash. 👭';

  @override
  String get verifyOtherDevice => '🔐 Boshqa qurilmani tasdiqlang';

  @override
  String get verifyOtherDeviceDescription =>
      'Boshqa qurilmani tasdiqlaganingizda, bu qurilmalar kalitlarni almashishi mumkin, bu umumiy xavfsizligingizni oshiradi. 💪 Tasdiqlashni boshlaganingizda, ikkala qurilmada ham ilovada qalqib chiquvchi oyna paydo bo‘ladi. U yerda siz bir-biri bilan taqqoslashingiz kerak bo‘lgan emojilar yoki raqamlar qatorini ko‘rasiz. Tasdiqlashni boshlashdan oldin ikkala qurilma ham yoningizda bo‘lgani ma’qul. ✓';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender kalit tekshiruvini qabul qildi';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender kalit tekshiruvini bekor qildi';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender kalitni tasdiqlashni yakunladi';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender kalitni tasdiqlash uchun tayyor';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender kalitni tasdiqlash talabini yubordi';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender kalit tekshiruvini so‘radi';
  }

  @override
  String get incomingMessages => 'Kiruvchi xabarlar';

  @override
  String get stickers => 'Stikerlar';

  @override
  String get discover => 'Kashf etish';

  @override
  String get commandHint_ignore => 'Berilgan matriks ID e’tiborga olinmasin';

  @override
  String get commandHint_unignore =>
      'Berilgan matriks IDni e’tiborsiz qoldirish';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread ta oʻqilmagan suhbatlar';
  }

  @override
  String get noDatabaseEncryption =>
      'Bu platformada ma’lumotlar bazasini shifrlash ishlamaydi';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Hozirda $count ta foydalanuvchi bloklangan.';
  }

  @override
  String goToSpace(Object space) {
    return 'Maydonga o‘tish: $space';
  }

  @override
  String get markAsUnread => 'Ochilmagan deb belgilash';

  @override
  String userLevel(int level) {
    return '$level - Foydalanuvchi';
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
  String get changeGeneralChatSettings =>
      'Umumiy suhbat sozlamalarini oʻzgartirish';

  @override
  String get inviteOtherUsers =>
      'Boshqa foydalanuvchilarni bu suhbatga taklif qilish';

  @override
  String get changeTheChatPermissions => 'Suhbat ruxsatnomalarini oʻzgartirish';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Suhbat tarix koʻrinishini oʻzgartirish';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Asosiy umumiy suhbat manzilini oʻzgartirish';

  @override
  String get sendRoomNotifications => '@room bildirishnomalarini yuborish';

  @override
  String get changeTheDescriptionOfTheGroup => 'Suhbat tavsifini oʻzgartirish';

  @override
  String get chatPermissionsDescription =>
      'Ushbu suhbatda muayyan harakatlar uchun qaysi quvvat darajasi zarurligini aniqlang. 0, 50 va 100 quvvat darajalari odatda foydalanuvchilar, moderatorlar va administratorlarni ifodalaydi, ammo har qanday gradatsiya mumkin.';

  @override
  String updateInstalled(String version) {
    return '🎉 $version versiyasiga yangilandi!';
  }

  @override
  String get changelog => 'O‘zgarishlar jurnali';

  @override
  String updateAvailable(String version) {
    return 'Update $version available';
  }

  @override
  String get download => 'Download';

  @override
  String get sendCanceled => 'Yuborish bekor qilindi';

  @override
  String get loginWithREChainId => 'Login with REChain-ID';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Uy serveri mos emasga o‘xshaydi. URL xato kiritilganmi?';

  @override
  String get calculatingFileSize => 'Fayl hajmi hisoblanmoqda...';

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Qurilmalaringizdan biri tasdiqlanmagan';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Eslatma: Barcha qurilmalaringizni suhbat zaxira nusxasiga ulaganingizda, ular avtomatik ravishda tasdiqlanadi.';

  @override
  String get continueText => 'Davom ettirish';

  @override
  String get blur => 'Xiralashtirish:';

  @override
  String get opacity => 'Noaniqlik:';

  @override
  String get setWallpaper => 'Fon rasmini sozlash';

  @override
  String get manageAccount => 'Hisobni boshqarish';

  @override
  String get noContactInformationProvided =>
      'Server hech qanday yaroqli kontakt axborotini taqdim etmaydi';

  @override
  String get contactServerAdmin => 'Server administratori bilan bog‘lanish';

  @override
  String get contactServerSecurity => 'Aloqa serveri xavfsizligi';

  @override
  String get supportPage => 'Yordam sahifasi';

  @override
  String get serverInformation => 'Server haqida ma’lumot:';

  @override
  String get name => 'Nomi';

  @override
  String get version => 'Versiya';

  @override
  String get website => 'Sayt';

  @override
  String get compress => 'Siqmoq';

  @override
  String get boldText => 'Qalin matn';

  @override
  String get italicText => 'Qiya matn';

  @override
  String get strikeThrough => 'O‘tish joyi';

  @override
  String get pleaseFillOut => 'Iltimos, to‘ldiring';

  @override
  String get invalidUrl => 'Yaroqsiz url';

  @override
  String get addLink => 'Havola kiritish';

  @override
  String get unableToJoinChat =>
      'Chatga qoʻshilib boʻlmadi. Ehtimol, boshqa tomon suhbatni allaqachon yopib qoʻygan.';

  @override
  String get previous => 'Avvalgi';

  @override
  String get otherPartyNotLoggedIn =>
      'Narigi tomon hozirda hisobingizga kirmagan va shuning uchun xabarlarni qabul qila olmaydi!';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Hisobga kirish \'$server\' ishlating';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Siz bu bilan ilova va veb-saytga siz haqingizdagi axborotni ulashishga ruxsat berasiz.';

  @override
  String get open => 'Ochish';

  @override
  String get waitingForServer => 'Server kutilmoqda...';

  @override
  String get newChatRequest => '📩 Yangi suhbat uchun soʻrov';

  @override
  String get contentNotificationSettings =>
      'Kontent bildirishnomasi sozlamalari';

  @override
  String get generalNotificationSettings => 'Umumiy bildirishnoma sozlamalari';

  @override
  String get roomNotificationSettings => 'Xona bildirishnomasi sozlamalari';

  @override
  String get userSpecificNotificationSettings =>
      'Foydalanuvchiga xos bildirishnoma sozlamalari';

  @override
  String get otherNotificationSettings => 'Boshqa bildirishnoma sozlamalari';

  @override
  String get notificationRuleContainsUserName =>
      'Foydalanuvchi nomini ichiga oladi';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Xabarda foydalanuvchi nomi mavjud bo‘lsa, foydalanuvchiga xabar beradi.';

  @override
  String get notificationRuleMaster =>
      'Barcha bildirishnomalarni ovozsiz qilish';

  @override
  String get notificationRuleMasterDescription =>
      'Boshqa barcha qoidalarni bekor qiladi va barcha bildirishnomalarni faolsizlantiradi.';

  @override
  String get notificationRuleSuppressNotices =>
      'Avtomatlashtirilgan xabarlarni o‘chirish';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Botlar kabi avtomatlashtirilgan mijozlardan kelgan bildirishnomalarni to‘xtatadi.';

  @override
  String get notificationRuleInviteForMe => 'Men uchun taklif qilish';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Foydalanuvchi xonaga taklif qilinganda unga xabar beradi.';

  @override
  String get notificationRuleMemberEvent => 'A’zo tadbirlari';

  @override
  String get notificationRuleMemberEventDescription =>
      'Obuna tadbirlari uchun bildirishnomalarni o‘chiradi.';

  @override
  String get notificationRuleIsUserMention => 'Foydalanuvchi zikri';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Foydalanuvchi xabarida to‘g‘ridan-to‘g‘ri tilga olinganida unga xabar beradi.';

  @override
  String get notificationRuleContainsDisplayName =>
      'Tarkibida displey nomi bor';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Xabarda foydalanuvchining displey nomi mavjudligi haqida foydalanuvchiga xabar beradi.';

  @override
  String get notificationRuleIsRoomMention => 'Xonaga eslatma';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Xona zikri mavjudligida foydalanuvchiga xabar beradi.';

  @override
  String get notificationRuleRoomnotif => 'Xona bildirishnomasi';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Xabar tarkibida @room bo‘lsa, foydalanuvchiga xabar beradi.';

  @override
  String get notificationRuleTombstone => 'Qabrtosh';

  @override
  String get notificationRuleTombstoneDescription =>
      'Xonani faolsizlantirish xabarlari haqida foydalanuvchiga xabar beradi.';

  @override
  String get notificationRuleReaction => 'Reaksiya';

  @override
  String get notificationRuleReactionDescription =>
      'Munosabat bildirishnomalarini o‘chiradi.';

  @override
  String get notificationRuleRoomServerAcl => 'Guruh serveri ACL';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Guruh serveriga kirishni boshqarish ro‘yxatlari (ACL) uchun bildirishnomalarni bostiradi.';

  @override
  String get notificationRuleSuppressEdits => 'Tahrirlarni bostirish';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Tahrirlangan xabarlar uchun bildirishnomalarni o‘chiradi.';

  @override
  String get notificationRuleCall => 'Chaqiruv';

  @override
  String get notificationRuleCallDescription =>
      'Chaqiruvlar haqida foydalanuvchiga xabar beradi.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'Shifrlangan birga-bir guruh';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Shifrlangan birga-bir guruhlardagi xabarlar haqida foydalanuvchiga xabar beradi.';

  @override
  String get notificationRuleRoomOneToOne => 'Birga-bir guruh';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Birga-bir guruhlardagidagi xabarlar haqida foydalanuvchiga xabar beradi.';

  @override
  String get notificationRuleMessage => 'Xabar';

  @override
  String get notificationRuleMessageDescription =>
      'Foydalanuvchiga umumiy xabarlar haqida xabar beradi.';

  @override
  String get notificationRuleEncrypted => 'Shifrlangan';

  @override
  String get notificationRuleEncryptedDescription =>
      'Shifrlangan guruhlardagi xabarlar haqida foydalanuvchiga xabar beradi.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Jitsi vidjet hodisalari haqida foydalanuvchiga xabar beradi.';

  @override
  String get notificationRuleServerAcl => 'Server ACL hodisalarini bostirish';

  @override
  String get notificationRuleServerAclDescription =>
      'Server ACL hodisalari uchun bildirishnomalarni o‘chiradi.';

  @override
  String unknownPushRule(String rule) {
    return 'Noma’lum push qoidasi \'$rule\'';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return '️ 🎙️$duration - ${sender}dan ovozli xabar';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Agar ushbu bildirishnoma sozlamasini o‘chirib tashlasangiz, buni bekor qilib bo‘lmaydi.';

  @override
  String get more => 'Yana';

  @override
  String get shareKeysWith => 'Kalitlarni ulashish...';

  @override
  String get shareKeysWithDescription =>
      'Shifrlangan suhbatlarda xabarlaringizni oʻqishlari uchun qaysi qurilmalarga ishonish kerak?';

  @override
  String get allDevices => 'Barcha qurilmalar';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Agar yoqilgan bo‘lsa, tasdiqlangan qurilmalarni kesib o‘tish';

  @override
  String get crossVerifiedDevices => 'O‘zaro tekshirilgan qurilmalar';

  @override
  String get verifiedDevicesOnly => 'Faqat tasdiqlangan qurilmalar';

  @override
  String get takeAPhoto => 'Suratga olish';

  @override
  String get recordAVideo => 'Video yozib olish';

  @override
  String get optionalMessage => '(Ixtiyoriy) xabar...';

  @override
  String get notSupportedOnThisDevice => 'Bu qurilmada ishlamaydi';

  @override
  String get enterNewChat => 'Yangi suhbatga kirish';

  @override
  String get approve => 'Tasdiqlash';

  @override
  String get youHaveKnocked => 'Siz taqillatdingiz';

  @override
  String get pleaseWaitUntilInvited =>
      'Iltimos, hozir kutib turing, xonadan kimdir sizni taklif qilguncha.';

  @override
  String get commandHint_logout => 'Joriy qurilmadan chiqish';

  @override
  String get commandHint_logoutall => 'Barcha faol qurilmalardan chiqish';

  @override
  String get displayNavigationRail =>
      'Mobilda navigatsiya temir yo‘lini ko‘rsatish';

  @override
  String get customReaction => 'Maxsus reaksiya';

  @override
  String get moreEvents => 'Boshqa hodisalar';

  @override
  String get showMore => 'Show more';

  @override
  String get showLess => 'Show less';

  @override
  String get declineInvitation => 'Taklifni rad etish';

  @override
  String get noMessagesYet => 'Hozircha xabarlar yo‘q';

  @override
  String get longPressToRecordVoiceMessage =>
      'Ovozli xabarni yozib olish uchun uzoq bosing.';

  @override
  String get pause => 'Pauza';

  @override
  String get resume => 'Davom etish';

  @override
  String get removeFromSpaceDescription =>
      'Suhbat maydondan olib tashlanadi, lekin hali ham suhbatlarlar ro‘yxatida chiqadi.';

  @override
  String countChats(int chats) {
    return '$chats suhbatlar';
  }

  @override
  String spaceMemberOf(String spaces) {
    return '$spaces maydoni a’zosi';
  }

  @override
  String spaceMemberOfCanKnock(String spaces) {
    return '$spaces maydoni a’zosi eshikni taqillatishi mumkin';
  }

  @override
  String get startPoll => 'So‘rovni boshlash';

  @override
  String get endPoll => 'So‘rovnomani yakunlash';

  @override
  String get answersVisible => 'Javoblar ko‘rinadi';

  @override
  String get pollQuestion => 'So‘rovnoma savoli';

  @override
  String get answerOption => 'Javob varianti';

  @override
  String get addAnswerOption => 'Javob variantini kiritish';

  @override
  String get allowMultipleAnswers => 'Bir nechta javobga ruxsat berish';

  @override
  String get pollHasBeenEnded => 'So‘rovnoma yakunlandi';

  @override
  String countVotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ta ovoz',
      one: 'Bir ovoz',
    );
    return '$_temp0';
  }

  @override
  String get answersWillBeVisibleWhenPollHasEnded =>
      'So‘rovnoma tugaganida javoblar chiqadi';

  @override
  String get replyInThread => 'Sahifada javob berish';

  @override
  String countReplies(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ta javob',
      one: 'Bitta javob',
    );
    return '$_temp0';
  }

  @override
  String get thread => 'Sahifa';

  @override
  String get backToMainChat => 'Asosiy suhbatga qaytish';

  @override
  String get saveChanges => 'O‘zgarishlarni saqlash';

  @override
  String get createSticker => 'Stiker yoki emoji yaratish';

  @override
  String get useAsSticker => 'Stiker sifatida ishlatish';

  @override
  String get useAsEmoji => 'Emoji sifatida ishlatish';

  @override
  String get stickerPackNameAlreadyExists =>
      'Stiker paketi nomi allaqachon mavjud';

  @override
  String get newStickerPack => 'Yangi stikerlar paketi';

  @override
  String get stickerPackName => 'Stiker paketi nomi';

  @override
  String get attribution => 'Atributsiya';

  @override
  String get skipChatBackup => 'Chat zaxirasini tashlab ketish';

  @override
  String get skipChatBackupWarning =>
      'Ishonchingiz komilmi? Chat zaxirasini yoqmasdan qurilmangizni almashtirsangiz, xabarlaringizga kira olmay qolishingiz mumkin.';

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
  String get loadingMessages => 'Xabarlar yuklanmoqda';

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
      'Iltimos, video qoʻngʻiroqlar hozirda beta-versiyada ekanligini unutmang. Ular kutilganidek ishlamasligi yoki barcha platformalarda umuman ishlamasligi mumkin.';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get incomingCall => 'Incoming call';

  @override
  String get videoCall => 'Video chaqiruv';

  @override
  String get voiceCall => 'Ovozli qoʻngʻiroq';

  @override
  String get missedCall => 'Missed call';

  @override
  String get callBack => 'Call back';

  @override
  String get hangUp => 'Hang up';

  @override
  String get waitingForParticipant => 'Waiting for participant...';

  @override
  String get decline => 'Rad qilish';

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
