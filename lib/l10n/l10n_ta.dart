// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class L10nTa extends L10n {
  L10nTa([String locale = 'ta']) : super(locale);

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
  String get repeatPassword => 'கடவுச்சொல்லை மீண்டும் செய்யவும்';

  @override
  String get notAnImage => 'படக் கோப்பு அல்ல.';

  @override
  String get remove => 'அகற்று';

  @override
  String get importNow => 'இப்போது இறக்குமதி செய்யுங்கள்';

  @override
  String get importEmojis => 'ஈமோசிகளை இறக்குமதி செய்யுங்கள்';

  @override
  String get importFromZipFile => '.Zip கோப்பிலிருந்து இறக்குமதி செய்யுங்கள்';

  @override
  String get exportEmotePack => 'எமோட் பேக் .zip என ஏற்றுமதி செய்யுங்கள்';

  @override
  String get replace => 'மாற்றவும்';

  @override
  String get about => 'பற்றி';

  @override
  String aboutHomeserver(String homeserver) {
    return '$homeserver பற்றி';
  }

  @override
  String get accept => 'ஏற்றுக்கொள்';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username அழைப்பை ஏற்றுக்கொண்டது';
  }

  @override
  String get account => 'கணக்கு';

  @override
  String get accountsAndSettings => 'Accounts and settings';

  @override
  String activatedEndToEndEncryption(String username) {
    return '$username இறுதி குறியாக்கத்திற்கு செயல்படுத்தப்பட்ட முடிவு';
  }

  @override
  String get addEmail => 'மின்னஞ்சல் சேர்க்கவும்';

  @override
  String get confirmREChainId =>
      'Please confirm your REChain ID in order to delete your account.';

  @override
  String supposedMxid(String mxid) {
    return 'இது $mxid be ஆக இருக்க வேண்டும்';
  }

  @override
  String get addToSpace => 'விண்வெளியில் சேர்க்கவும்';

  @override
  String get admin => 'நிர்வாகி';

  @override
  String get alias => 'மாற்றுப்பெயர்';

  @override
  String get all => 'அனைத்தும்';

  @override
  String get commandHint_roomupgrade =>
      'கொடுக்கப்பட்ட அறை பதிப்பிற்கு இந்த அறையை மேம்படுத்தவும்';

  @override
  String get commandHint_googly => 'சில கூகிள் கண்களை அனுப்பவும்';

  @override
  String get commandHint_cuddle => 'ஒரு கசப்பு அனுப்பவும்';

  @override
  String get commandHint_hug => 'கட்டிப்பிடிக்கவும்';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName உங்களுக்கு கூகிள் கண்களை அனுப்புகிறது';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName பெயர் you உங்களை கசக்குகிறது';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName உங்களை அணைத்துக்கொள்கிறது';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName அழைப்புக்கு பதிலளித்தார்';
  }

  @override
  String get anyoneCanJoin => 'யார் வேண்டுமானாலும் சேரலாம்';

  @override
  String get appLock => 'பயன்பாட்டு பூட்டு';

  @override
  String get appLockDescription =>
      'முள் குறியீட்டைக் கொண்டு பயன்படுத்தாதபோது பயன்பாட்டைப் பூட்டவும்';

  @override
  String get archive => 'காப்பகம்';

  @override
  String get areGuestsAllowedToJoin =>
      'விருந்தினர் பயனர்கள் சேர அனுமதிக்கப்படுகிறார்களா';

  @override
  String get areYouSure => 'நீங்கள் உறுதியாக இருக்கிறீர்களா?';

  @override
  String get discardEdits => 'You have unsaved changes. Discard your edits?';

  @override
  String get areYouSureYouWantToLogout =>
      'நீங்கள் நிச்சயமாக வெளியேற விரும்புகிறீர்களா?';

  @override
  String get askSSSSSign =>
      'மற்ற நபரில் கையெழுத்திட, தயவுசெய்து உங்கள் பாதுகாப்பான கடை பாச்ஃபிரேச் அல்லது மீட்பு விசையை உள்ளிடவும்.';

  @override
  String askVerificationRequest(String username) {
    return '$usernameபயனர்பெயர் இருந்து இலிருந்து இந்த சரிபார்ப்பு கோரிக்கையை ஏற்றுக்கொள்ளவா?';
  }

  @override
  String get autoplayImages =>
      'அனிமேசன் செய்யப்பட்ட ச்டிக்கர்கள் மற்றும் உணர்ச்சிகளை தானாக இயக்கவும்';

  @override
  String badServerLoginTypesException(
    String serverVersions,
    String supportedVersions,
    Object suportedVersions,
  ) {
    return 'உள்நாட்டு வகைகளை ஓம்சர்வர் ஆதரிக்கிறது:\n $serverVersions\n ஆனால் இந்த பயன்பாடு மட்டுமே ஆதரிக்கிறது:\n $supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'தட்டச்சு அறிவிப்புகளை அனுப்பவும்';

  @override
  String get swipeRightToLeftToReply =>
      'பதிலளிக்க வலமிருந்து இடமாக ச்வைப் செய்யவும்';

  @override
  String get sendOnEnter => 'Enter ஐ அனுப்பவும்';

  @override
  String get noMoreChatsFound => 'இனி அரட்டைகள் கிடைக்கவில்லை ...';

  @override
  String get noChatsFoundHere =>
      'இங்கே அரட்டைகள் எதுவும் காணப்படவில்லை. கீழே உள்ள பொத்தானைப் பயன்படுத்தி ஒருவருடன் புதிய அரட்டையைத் தொடங்கவும். ⤵️';

  @override
  String get unread => 'படிக்காதது';

  @override
  String get space => 'இடைவெளி';

  @override
  String get banFromChat => 'அரட்டையிலிருந்து தடை';

  @override
  String get banned => 'தடைசெய்யப்பட்டது';

  @override
  String bannedUser(String username, String targetName) {
    return '$username தடைசெய்யப்பட்ட $targetName';
  }

  @override
  String get blockDevice => 'தொகுதி சாதனம்';

  @override
  String get blocked => 'தடுக்கப்பட்டது';

  @override
  String get cancel => 'ரத்துசெய்';

  @override
  String cantOpenUri(String uri) {
    return 'யூரி $uri வேலை ஐ திறக்க முடியாது';
  }

  @override
  String get changeDeviceName => 'சாதனத்தின் பெயரை மாற்றவும்';

  @override
  String changedTheChatAvatar(String username) {
    return '$username அரட்டை அவதாரத்தை மாற்றியது';
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
    return '$username அரட்டை அனுமதிகளை மாற்றியுள்ளார்';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username அவற்றின் காட்சி பெயர்: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username விருந்தினர் அணுகல் விதிகளை மாற்றியது';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username விருந்தினர் அணுகல் விதிகளை மாற்றியது: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username வரலாற்று தெரிவுநிலையை மாற்றியது';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username வரலாற்று தெரிவுநிலையை மாற்றியது: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username சேர விதிகளை மாற்றியது';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username சேர விதிகளை மாற்றியது: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username அவர்களின் அவதாரத்தை மாற்றியது';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username அறை மாற்றுப்பெயர்களை மாற்றியது';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username அழைப்பிதழ் இணைப்பை மாற்றியது';
  }

  @override
  String get changePassword => 'கடவுச்சொல்லை மாற்றவும்';

  @override
  String get changeTheHomeserver => 'ஓம்சர்வரை மாற்றவும்';

  @override
  String get changeTheme => 'உங்கள் பாணியை மாற்றவும்';

  @override
  String get changeTheNameOfTheGroup => 'குழுவின் பெயரை மாற்றவும்';

  @override
  String get changeYourAvatar => 'உங்கள் அவதாரத்தை மாற்றவும்';

  @override
  String get channelCorruptedDecryptError => 'குறியாக்கம் சிதைந்துள்ளது';

  @override
  String get chat => 'அரட்டை';

  @override
  String get chatBackup => 'அரட்டை காப்புப்பிரதி';

  @override
  String get chatDetails => 'அரட்டை விவரங்கள்';

  @override
  String get chats => 'அரட்டைகள்';

  @override
  String get chooseAStrongPassword => 'வலுவான கடவுச்சொல்லைத் தேர்வுசெய்க';

  @override
  String get clearArchive => 'தெளிவான காப்பகம்';

  @override
  String get close => 'மூடு';

  @override
  String get commandHint_markasdm =>
      'கொடுக்கப்பட்ட மேட்ரிக்சிற்கான நேரடி செய்தி அறையாக குறிக்கவும்';

  @override
  String get commandHint_markasgroup => 'குழுவாக குறி';

  @override
  String get commandHint_ban =>
      'கொடுக்கப்பட்ட பயனரை இந்த அறையிலிருந்து தடை செய்யுங்கள்';

  @override
  String get commandHint_clearcache => 'தெளிவான தற்காலிக சேமிப்பு';

  @override
  String get commandHint_create =>
      'வெற்று குழு அரட்டையை உருவாக்கவும்\n குறியாக்கத்தை முடக்க-இல்லை-குறியாக்கத்தைப் பயன்படுத்தவும்';

  @override
  String get commandHint_discardsession => 'அமர்வை நிராகரிக்கவும்';

  @override
  String get commandHint_dm =>
      'நேரடி அரட்டையைத் தொடங்கவும்\n குறியாக்கத்தை முடக்க-இல்லை-குறியாக்கத்தைப் பயன்படுத்தவும்';

  @override
  String get commandHint_html => 'உஉகுமொ வடிவமைக்கப்பட்ட உரையை அனுப்பவும்';

  @override
  String get commandHint_invite =>
      'கொடுக்கப்பட்ட பயனரை இந்த அறைக்கு அழைக்கவும்';

  @override
  String get commandHint_join => 'கொடுக்கப்பட்ட அறையில் சேரவும்';

  @override
  String get commandHint_kick =>
      'இந்த அறையிலிருந்து கொடுக்கப்பட்ட பயனரை அகற்றவும்';

  @override
  String get commandHint_leave => 'இந்த அறையை விட்டு விடுங்கள்';

  @override
  String get commandHint_me => 'உங்களை விவரிக்கவும்';

  @override
  String get commandHint_myroomavatar =>
      'இந்த அறைக்கு உங்கள் படத்தை அமைக்கவும் (MXC-URI எழுதியது)';

  @override
  String get commandHint_myroomnick =>
      'இந்த அறைக்கு உங்கள் காட்சி பெயரை அமைக்கவும்';

  @override
  String get commandHint_op =>
      'கொடுக்கப்பட்ட பயனரின் ஆற்றல் மட்டத்தை அமைக்கவும் (இயல்புநிலை: 50)';

  @override
  String get commandHint_plain => 'வடிவமைக்கப்படாத உரையை அனுப்பவும்';

  @override
  String get commandHint_react => 'ஒரு எதிர்வினையாக பதிலை அனுப்பவும்';

  @override
  String get commandHint_send => 'உரையை அனுப்பவும்';

  @override
  String get commandHint_unban =>
      'இந்த அறையிலிருந்து கொடுக்கப்பட்ட பயனரைத் தடுக்கிறது';

  @override
  String get commandInvalid => 'கட்டளை தவறானது';

  @override
  String commandMissing(String command) {
    return '$command என்பது கட்டளை அல்ல.';
  }

  @override
  String get compareEmojiMatch => 'தயவுசெய்து ஈமோசிகளை ஒப்பிடுக';

  @override
  String get compareNumbersMatch => 'எண்களை ஒப்பிடுக';

  @override
  String get configureChat => 'அரட்டையை உள்ளமைக்கவும்';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'குழுவிற்கு தொடர்பு அழைக்கப்பட்டுள்ளது';

  @override
  String get contentHasBeenReported =>
      'உள்ளடக்கம் சேவையக நிர்வாகிகளுக்கு தெரிவிக்கப்பட்டுள்ளது';

  @override
  String get copiedToClipboard => 'இடைநிலைப்பலகைக்கு நகலெடுக்கப்பட்டது';

  @override
  String get copy => 'நகலெடு';

  @override
  String get copyToClipboard => 'இடைநிலைப்பலகைக்கு நகலெடுக்கவும்';

  @override
  String couldNotDecryptMessage(String error) {
    return 'செய்தியை மறைகுறியாக்க முடியவில்லை: $error';
  }

  @override
  String get checkList => 'சரிபார்ப்பு பட்டியல்';

  @override
  String countParticipants(int count) {
    return '$count பங்கேற்பாளர்கள்';
  }

  @override
  String countInvited(int count) {
    return '$count அழைக்கப்பட்டது';
  }

  @override
  String get create => 'உருவாக்கு';

  @override
  String createdTheChat(String username) {
    return '💬 $username அரட்டையை உருவாக்கினார்';
  }

  @override
  String get createGroup => 'குழுவை உருவாக்கவும்';

  @override
  String get createNewSpace => 'புதிய இடம்';

  @override
  String get currentlyActive => 'தற்போது செயலில் உள்ளது';

  @override
  String get darkTheme => 'இருண்ட';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String get deactivateAccountWarning =>
      'இது உங்கள் பயனர் கணக்கை செயலிழக்கச் செய்யும். இதை செயல்தவிர்க்க முடியாது! நீங்கள் உறுதியாக இருக்கிறீர்களா?';

  @override
  String get defaultPermissionLevel =>
      'புதிய பயனர்களுக்கான இயல்புநிலை இசைவு நிலை';

  @override
  String get delete => 'நீக்கு';

  @override
  String get deleteAccount => 'கணக்கை நீக்கு';

  @override
  String get deleteMessage => 'செய்தியை நீக்கு';

  @override
  String get devices => 'சாதனங்கள்';

  @override
  String get directChats => 'நேரடி அரட்டைகள்';

  @override
  String get displaynameHasBeenChanged => 'காட்சி பெயர் மாற்றப்பட்டுள்ளது';

  @override
  String get downloadFile => 'கோப்பைப் பதிவிறக்கவும்';

  @override
  String get edit => 'தொகு';

  @override
  String get editBlockedServers => 'தடுக்கப்பட்ட சேவையகங்களைத் திருத்து';

  @override
  String get chatPermissions => 'அரட்டை அனுமதிகள்';

  @override
  String get editDisplayname => 'காட்சி பெயர் திருத்து';

  @override
  String get editRoomAliases => 'அறை மாற்றுப்பெயர்களைத் திருத்து';

  @override
  String get editRoomAvatar => 'அறை அவதார் திருத்து';

  @override
  String get emoteExists => 'எமோட் ஏற்கனவே உள்ளது!';

  @override
  String get emoteInvalid => 'தவறான எமோட் சார்ட்கோட்!';

  @override
  String get emoteKeyboardNoRecents =>
      'அண்மைக் காலத்தில் பயன்படுத்தப்பட்ட உணர்ச்சிகள் இங்கே தோன்றும் ...';

  @override
  String get globalChatId => 'உலகளாவிய அரட்டை ஐடி';

  @override
  String get accessAndVisibility => 'அணுகல் மற்றும் தெரிவுநிலை';

  @override
  String get accessAndVisibilityDescription =>
      'இந்த அரட்டையில் யார் சேர அனுமதிக்கப்படுகிறார்கள், அரட்டையை எவ்வாறு கண்டுபிடிப்பது.';

  @override
  String get customEmojisAndStickers =>
      'தனிப்பயன் ஈமோசிகள் மற்றும் ச்டிக்கர்கள்';

  @override
  String get customEmojisAndStickersBody =>
      'எந்தவொரு அரட்டையிலும் பயன்படுத்தக்கூடிய தனிப்பயன் ஈமோசிகள் அல்லது ச்டிக்கர்களைச் சேர்க்கவும் அல்லது பகிரவும்.';

  @override
  String get emoteShortcode => 'சார்ட்கோட் எமோட்';

  @override
  String get emptyChat => 'வெற்று அரட்டை';

  @override
  String get enableEmotesGlobally => 'உலகளவில் எமோட் பேக்கை இயக்கவும்';

  @override
  String get enableEncryption => 'குறியாக்கத்தை இயக்கவும்';

  @override
  String get enableEncryptionWarning =>
      'நீங்கள் இனி குறியாக்கத்தை முடக்க முடியாது. நீங்கள் உறுதியாக இருக்கிறீர்களா?';

  @override
  String get encrypted => 'குறியாக்கப்பட்டது';

  @override
  String get encryption => 'குறியாக்கம்';

  @override
  String get encryptionNotEnabled => 'குறியாக்கம் இயக்கப்படவில்லை';

  @override
  String endedTheCall(String senderName) {
    return '$senderName அழைப்பை முடித்தார்';
  }

  @override
  String get enterAnEmailAddress => 'மின்னஞ்சல் முகவரியை உள்ளிடவும்';

  @override
  String errorObtainingLocation(String error) {
    return 'இருப்பிடத்தைப் பெறுவதில் பிழை: $error';
  }

  @override
  String get fontSize => 'எழுத்துரு அளவு';

  @override
  String get forward => 'முன்னோக்கி';

  @override
  String get fromJoining => 'சேருவதிலிருந்து';

  @override
  String get fromTheInvitation => 'அழைப்பிலிருந்து';

  @override
  String get group => 'குழு';

  @override
  String get chatDescription => 'அரட்டை விளக்கம்';

  @override
  String get chatDescriptionHasBeenChanged => 'அரட்டை விளக்கம் மாற்றப்பட்டது';

  @override
  String get groupIsPublic => 'குழு பொது';

  @override
  String get groups => 'குழுக்கள்';

  @override
  String groupWith(String displayname) {
    return '$displayname உடன் குழு';
  }

  @override
  String get guestsAreForbidden => 'விருந்தினர்கள் தடைசெய்யப்பட்டுள்ளனர்';

  @override
  String get guestsCanJoin => 'விருந்தினர்கள் சேரலாம்';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$targetName க்கான அழைப்பை $username திரும்பப் பெற்றுள்ளார்';
  }

  @override
  String get help => 'உதவி';

  @override
  String get hideRedactedMessages => 'சரிசெய்யப்பட்ட செய்திகளை மறைக்கவும்';

  @override
  String get hideRedactedMessagesBody =>
      'யாராவது ஒரு செய்தியை மாற்றியமைத்தால், இந்த செய்தி இனி அரட்டையில் காணப்படாது.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'தவறான அல்லது அறியப்படாத செய்தி வடிவங்களை மறைக்கவும்';

  @override
  String get block => 'தொகுதி';

  @override
  String get blockedUsers => 'தடுக்கப்பட்ட பயனர்கள்';

  @override
  String get blockListDescription =>
      'உங்களை தொந்தரவு செய்யும் பயனர்களைத் தடுக்கலாம். உங்கள் தனிப்பட்ட தொகுதி பட்டியலில் பயனர்களிடமிருந்து எந்த செய்திகளையும் அல்லது அறை அழைப்புகளையும் நீங்கள் பெற முடியாது.';

  @override
  String get blockUsername => 'பயனர்பெயரை புறக்கணிக்கவும்';

  @override
  String get iHaveClickedOnLink => 'நான் இணைப்பைக் சொடுக்கு செய்துள்ளேன்';

  @override
  String get incorrectPassphraseOrKey => 'தவறான கடவுச்சொல் அல்லது மீட்பு விசை';

  @override
  String get inviteContact => 'தொடர்பை அழைக்கவும்';

  @override
  String inviteContactToGroup(String groupName) {
    return '$groupName க்கு தொடர்பை அழை';
  }

  @override
  String get noChatDescriptionYet =>
      'அரட்டை விளக்கம் இதுவரை உருவாக்கப்படவில்லை.';

  @override
  String get tryAgain => 'மீண்டும் முயற்சிக்கவும்';

  @override
  String get invalidServerName => 'தவறான சேவையக பெயர்';

  @override
  String get invited => 'அழைக்கப்பட்டார்';

  @override
  String get redactMessageDescription =>
      'இந்த உரையாடலில் பங்கேற்பாளர்கள் அனைவருக்கும் செய்தி திருத்தப்படும். இதை செயல்தவிர்க்க முடியாது.';

  @override
  String get optionalRedactReason =>
      '(விரும்பினால்) இந்த செய்தியை மாற்றியமைப்பதற்கான காரணம் ...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username $targetName அழைக்கப்பட்டார்';
  }

  @override
  String get invitedUsersOnly => 'பயனர்களை மட்டுமே அழைத்தது';

  @override
  String inviteText(String username, String link) {
    return '$username உங்களை பஞ்சுபோன்றதாக அழைத்தது.\n 1. FulufyChat.im ஐப் பார்வையிட்டு பயன்பாட்டை நிறுவவும்\n 2. பதிவு செய்யுங்கள் அல்லது உள்நுழைக\n 3. அழைப்பிதழ் இணைப்பைத் திறக்கவும்:\n $link';
  }

  @override
  String get isTyping => 'தட்டச்சு செய்கிறது…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username அரட்டையில் சேர்ந்தார்';
  }

  @override
  String get joinRoom => 'அறையில் சேரவும்';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username $targetName ஐ உதைத்தார்';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username உதைத்து $targetName ஐத் தடை செய்தார்';
  }

  @override
  String get kickFromChat => 'அரட்டையிலிருந்து கிக்';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'கடைசியாக செயலில்: $localizedTimeShort';
  }

  @override
  String get leave => 'விடுப்பு';

  @override
  String get leftTheChat => 'அரட்டையை விட்டு வெளியேறினார்';

  @override
  String get lightTheme => 'ஒளி';

  @override
  String loadCountMoreParticipants(int count) {
    return 'ஏற்றவும் $count மேலும் பங்கேற்பாளர்கள்';
  }

  @override
  String get dehydrate => 'ஏற்றுமதி அமர்வு மற்றும் சாதனத்தை துடைக்கவும்';

  @override
  String get dehydrateWarning =>
      'இந்த செயலை செயல்தவிர்க்க முடியாது. காப்புப்பிரதி கோப்பை பாதுகாப்பாக சேமித்து வைக்கவும்.';

  @override
  String get hydrate => 'காப்பு கோப்பிலிருந்து மீட்டமைக்கவும்';

  @override
  String get loadingPleaseWait => 'ஏற்றுகிறது… தயவுசெய்து காத்திருங்கள்.';

  @override
  String get loadMore => 'மேலும் ஏற்றவும்…';

  @override
  String get locationDisabledNotice =>
      'இருப்பிட சேவைகள் முடக்கப்பட்டுள்ளன. தயவுசெய்து உங்கள் இருப்பிடத்தைப் பகிர்ந்து கொள்ள அவர்களுக்கு உதவவும்.';

  @override
  String get locationPermissionDeniedNotice =>
      'இருப்பிட இசைவு மறுக்கப்பட்டது. உங்கள் இருப்பிடத்தைப் பகிர்ந்து கொள்ள தயவுசெய்து அவர்களுக்கு வழங்குங்கள்.';

  @override
  String get login => 'புகுபதிவு';

  @override
  String logInTo(String homeserver) {
    return '$homeserver இல் உள்நுழைக';
  }

  @override
  String get logout => 'வெளியேற்றம்';

  @override
  String get mention => 'குறிப்பு';

  @override
  String get messages => 'செய்திகள்';

  @override
  String get messagesStyle => 'செய்திகள்:';

  @override
  String get moderator => 'மதிப்பீட்டாளர்';

  @override
  String get muteChat => 'முடக்கு அரட்டை';

  @override
  String get newChat => 'புதிய அரட்டை';

  @override
  String get newMessageInrechainonline => 'Fuf பஞ்சுபோன்ற புதிய செய்தி';

  @override
  String get newVerificationRequest => 'புதிய சரிபார்ப்பு கோரிக்கை!';

  @override
  String get next => 'அடுத்தது';

  @override
  String get no => 'இல்லை';

  @override
  String get noConnectionToTheServer => 'சேவையகத்துடன் எந்த தொடர்பும் இல்லை';

  @override
  String get noEmotesFound => 'உணர்ச்சிகள் எதுவும் காணப்படவில்லை. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'அறை இனி பகிரங்கமாக அணுக முடியாதவுடன் மட்டுமே நீங்கள் குறியாக்கத்தை செயல்படுத்த முடியும்.';

  @override
  String get noGoogleServicesWarning =>
      'ஃபயர்பேச் முகில் செய்தி உங்கள் சாதனத்தில் கிடைக்கவில்லை. இன்னும் புச் அறிவிப்புகளைப் பெற, NTFY ஐ நிறுவ பரிந்துரைக்கிறோம். NTFY அல்லது மற்றொரு ஒருங்கிணைந்த புச் வழங்குநருடன் நீங்கள் தரவு பாதுகாப்பான வழியில் புச் அறிவிப்புகளைப் பெறலாம். நீங்கள் பிளேச்டோரிலிருந்து அல்லது எஃப்-டிராய்டிலிருந்து NTFY ஐ பதிவிறக்கம் செய்யலாம்.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 என்பது மேட்ரிக்ஸ் சர்வர் இல்லை, அதற்கு பதிலாக $server2 ஐ பயன்படுத்தவா?';
  }

  @override
  String get shareInviteLink => 'இணைப்பைப் பகிரவும்';

  @override
  String get scanQrCode => 'QR குறியீட்டை ச்கேன் செய்யுங்கள்';

  @override
  String get noPasswordRecoveryDescription =>
      'உங்கள் கடவுச்சொல்லை மீட்டெடுப்பதற்கான வழியை நீங்கள் இன்னும் சேர்க்கவில்லை.';

  @override
  String get noPermission => 'இசைவு இல்லை';

  @override
  String get noRoomsFound => 'அறைகள் எதுவும் கிடைக்கவில்லை…';

  @override
  String get notifications => 'அறிவிப்புகள்';

  @override
  String numUsersTyping(int count) {
    return '$count பயனர்கள் தட்டச்சு செய்கிறார்கள்…';
  }

  @override
  String get obtainingLocation => 'இருப்பிடத்தைப் பெறுதல்…';

  @override
  String get ok => 'சரி';

  @override
  String get onlineKeyBackupEnabled =>
      'நிகழ்நிலை விசை காப்புப்பிரதி இயக்கப்பட்டது';

  @override
  String get oopsPushError =>
      'அச்சச்சோ! துரதிர்ச்டவசமாக, புச் அறிவிப்புகளை அமைக்கும் போது பிழை ஏற்பட்டது.';

  @override
  String get oopsSomethingWentWrong => 'அச்சச்சோ, ஏதோ தவறு நடந்தது…';

  @override
  String get openAppToReadMessages =>
      'செய்திகளைப் படிக்க பயன்பாட்டைத் திறக்கவும்';

  @override
  String get openCamera => 'திறந்த கேமரா';

  @override
  String get oneClientLoggedOut =>
      'உங்கள் வாடிக்கையாளர்களில் ஒருவர் உள்நுழைந்துள்ளார்';

  @override
  String get addAccount => 'கணக்கைச் சேர்க்கவும்';

  @override
  String get editBundlesForAccount =>
      'இந்த கணக்கிற்கான மூட்டைகளைத் திருத்தவும்';

  @override
  String get addToBundle => 'மூட்டையில் சேர்க்கவும்';

  @override
  String get removeFromBundle => 'இந்த மூட்டையிலிருந்து அகற்றவும்';

  @override
  String get bundleName => 'மூட்டை பெயர்';

  @override
  String get openInMaps => 'வரைபடங்களில் திறந்திருக்கும்';

  @override
  String get link => 'இணைப்பு';

  @override
  String get or => 'அல்லது';

  @override
  String get participant => 'பங்கேற்பாளர்';

  @override
  String get passphraseOrKey => 'கடவுச்சொல் அல்லது மீட்பு விசை';

  @override
  String get password => 'கடவுச்சொல்';

  @override
  String get passwordForgotten => 'கடவுச்சொல் மறந்துவிட்டது';

  @override
  String get passwordHasBeenChanged => 'கடவுச்சொல் மாற்றப்பட்டுள்ளது';

  @override
  String get passwordRecoverySettings => 'கடவுச்சொல் மீட்பு அமைப்புகள்';

  @override
  String get passwordRecovery => 'கடவுச்சொல் மீட்பு';

  @override
  String get pin => 'முள்';

  @override
  String get pleaseChooseAPasscode => 'பாச் குறியீட்டைத் தேர்வுசெய்க';

  @override
  String get pleaseClickOnLink =>
      'மின்னஞ்சலில் உள்ள இணைப்பைக் சொடுக்கு செய்து தொடரவும்.';

  @override
  String get pleaseEnterYourPassword => 'உங்கள் கடவுச்சொல்லை உள்ளிடவும்';

  @override
  String get pleaseEnterYourPin => 'உங்கள் முள் உள்ளிடவும்';

  @override
  String get pleaseEnterYourUsername => 'உங்கள் பயனர்பெயரை உள்ளிடவும்';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'வலைத்தளத்தின் வழிமுறைகளைப் பின்பற்றி அடுத்து தட்டவும்.';

  @override
  String get privacy => 'தனியுரிமை';

  @override
  String get publicRooms => 'பொது அறைகள்';

  @override
  String get reason => 'காரணம்';

  @override
  String redactedBy(String username) {
    return '$username ஆல் திருத்தப்பட்டது';
  }

  @override
  String redactedByBecause(String username, String reason) {
    return '$username ஆல் திருத்தப்பட்டது ஏனெனில்: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username ஒரு நிகழ்வை மறுவடிவமைத்தது';
  }

  @override
  String get redactMessage => 'திருத்தும் செய்தி';

  @override
  String get reject => 'நிராகரிக்கவும்';

  @override
  String rejectedTheInvitation(String username) {
    return '$username அழைப்பை நிராகரித்தது';
  }

  @override
  String get removeAllOtherDevices => 'மற்ற எல்லா சாதனங்களையும் அகற்றவும்';

  @override
  String get unbanFromChat => 'அரட்டையிலிருந்து தடையின்றி';

  @override
  String get removeYourAvatar => 'உங்கள் அவதாரத்தை அகற்று';

  @override
  String get replaceRoomWithNewerVersion => 'புதிய பதிப்போடு அறையை மாற்றவும்';

  @override
  String get reply => 'பதில்';

  @override
  String get reportMessage => 'செய்தி அறிக்கை';

  @override
  String get roomHasBeenUpgraded => 'அறை மேம்படுத்தப்பட்டுள்ளது';

  @override
  String sendingFilesDoNotExit(int count) {
    return 'Sending $count files... Please do not exit!';
  }

  @override
  String get roomVersion => 'அறை பதிப்பு';

  @override
  String get compressingVideo => 'Compressing video...';

  @override
  String get saveFile => 'கோப்பை சேமி';

  @override
  String get search => 'தேடல்';

  @override
  String get security => 'பாதுகாப்பு';

  @override
  String get send => 'அனுப்பு';

  @override
  String get sendAMessage => 'ஒரு செய்தியை அனுப்பவும்';

  @override
  String get sendAsText => 'உரையாக அனுப்பவும்';

  @override
  String get sendAudio => 'ஆடியோ அனுப்பவும்';

  @override
  String get sendFile => 'கோப்பு அனுப்பவும்';

  @override
  String get sendImage => 'படத்தை அனுப்பு';

  @override
  String sendImages(int count) {
    return '$count படத்தை அனுப்பு';
  }

  @override
  String get sendMessages => 'செய்திகளை அனுப்பவும்';

  @override
  String get sendVideo => 'வீடியோ அனுப்பவும்';

  @override
  String sentAFile(String username) {
    return '📁 $username கோப்பை அனுப்பியுள்ளார்';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username ஆடியோவை அனுப்பியுள்ளார்';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username படத்தை அனுப்பியுள்ளார்';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username ஒரு ச்டிக்கரை அனுப்பியது';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username ஒரு வீடியோவை அனுப்பியுள்ளார்';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName அனுப்பப்பட்ட அழைப்பு செய்தி';
  }

  @override
  String get setAsCanonicalAlias => 'முதன்மையான மாற்றுப்பெயராக அமைக்கவும்';

  @override
  String get setChatDescription => 'அரட்டை விளக்கத்தை அமைக்கவும்';

  @override
  String get setStatus => 'நிலையை அமைக்கவும்';

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get share => 'பங்கு';

  @override
  String sharedTheLocation(String username) {
    return '$username அவற்றின் இருப்பிடத்தைப் பகிர்ந்து கொண்டது';
  }

  @override
  String get shareLocation => 'இருப்பிடத்தைப் பகிரவும்';

  @override
  String get skip => 'தவிர்';

  @override
  String get sourceCode => 'மூலக் குறியீடு';

  @override
  String get spaceIsPublic => 'இடம் பொது';

  @override
  String get spaceName => 'விண்வெளி பெயர்';

  @override
  String startedACall(String senderName) {
    return '$senderName அழைப்பைத் தொடங்கினார்';
  }

  @override
  String get status => 'நிலை';

  @override
  String get statusExampleMessage => 'இன்று நீங்கள் எப்படி இருக்கிறீர்கள்?';

  @override
  String get submit => 'சமர்ப்பிக்கவும்';

  @override
  String get synchronizingPleaseWait =>
      'ஒத்திசைத்தல்… தயவுசெய்து காத்திருங்கள்.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' ஒத்திசைத்தல்… ($percentage%)';
  }

  @override
  String get systemTheme => 'மண்டலம்';

  @override
  String get theyDontMatch => 'அவர்கள் பொருந்தவில்லை';

  @override
  String get theyMatch => 'அவர்கள் பொருந்துகிறார்கள்';

  @override
  String get tooManyRequestsWarning =>
      'பல கோரிக்கைகள். தயவுசெய்து பின்னர் மீண்டும் முயற்சிக்கவும்!';

  @override
  String get tryToSendAgain => 'மீண்டும் அனுப்ப முயற்சிக்கவும்';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username தடைசெய்யப்படாத $targetName';
  }

  @override
  String get unblockDevice => 'சாதனத்தைத் தடைசெய்க';

  @override
  String get unknownDevice => 'தெரியாத சாதனம்';

  @override
  String get unknownEncryptionAlgorithm => 'அறியப்படாத குறியாக்க வழிமுறை';

  @override
  String unknownEvent(String type) {
    return 'அறியப்படாத நிகழ்வு \'$type\'';
  }

  @override
  String get unmuteChat => 'மாறுதல் அரட்டை';

  @override
  String get unpin => 'மூள்நீக்கு';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username மற்றும் $count மற்றவர்கள் தட்டச்சு செய்கிறார்கள்…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username மற்றும் $username2 தட்டச்சு செய்கின்றன…';
  }

  @override
  String userIsTyping(String username) {
    return '$username தட்டச்சு செய்கிறது…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username அரட்டையை விட்டு வெளியேறினார்';
  }

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username ஒரு $type நிகழ்வை அனுப்பியது';
  }

  @override
  String get unverified => 'சரிபார்க்கப்படாதது';

  @override
  String get verified => 'சரிபார்க்கப்பட்டது';

  @override
  String get verifyStart => 'சரிபார்ப்பைத் தொடங்கவும்';

  @override
  String get verifySuccess => 'நீங்கள் வெற்றிகரமாக சரிபார்த்தீர்கள்!';

  @override
  String get verifyTitle => 'பிற கணக்கை சரிபார்க்கிறது';

  @override
  String get visibilityOfTheChatHistory => 'அரட்டை வரலாற்றின் தெரிவுநிலை';

  @override
  String get visibleForAllParticipants =>
      'பங்கேற்பாளர்கள் அனைவருக்கும் தெரியும்';

  @override
  String get visibleForEveryone => 'அனைவருக்கும் தெரியும்';

  @override
  String get voiceMessage => 'குரல் செய்தி';

  @override
  String get waitingPartnerAcceptRequest =>
      'கூட்டாளர் கோரிக்கையை ஏற்றுக்கொள்வதற்காக காத்திருக்கிறார்…';

  @override
  String get waitingPartnerEmoji =>
      'பங்குதாரர் ஈமோசியை ஏற்றுக்கொள்வதற்காக காத்திருக்கிறார்…';

  @override
  String get waitingPartnerNumbers =>
      'பங்குதாரர் எண்களை ஏற்றுக்கொள்வதற்காக காத்திருக்கிறார்…';

  @override
  String get warning => 'எச்சரிக்கை!';

  @override
  String get weSentYouAnEmail =>
      'நாங்கள் உங்களுக்கு ஒரு மின்னஞ்சல் அனுப்பினோம்';

  @override
  String get whoCanPerformWhichAction => 'எந்த செயலைச் செய்ய முடியும்';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'இந்த குழுவில் சேர யார் அனுமதிக்கப்படுகிறார்கள்';

  @override
  String get whyDoYouWantToReportThis =>
      'இதை ஏன் புகாரளிக்க விரும்புகிறீர்கள்?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'இந்த முகவரிகள் மூலம் உங்கள் கடவுச்சொல்லை மீட்டெடுக்கலாம்.';

  @override
  String get writeAMessage => 'ஒரு செய்தியை எழுதுங்கள்…';

  @override
  String get yes => 'ஆம்';

  @override
  String get you => 'நீங்கள்';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'இந்த அரட்டையில் நீங்கள் இனி பங்கேற்கவில்லை';

  @override
  String get yourPublicKey => 'உங்கள் பொது விசை';

  @override
  String get messageInfo => 'செய்தி தகவல்';

  @override
  String get time => 'நேரம்';

  @override
  String get sender => 'அனுப்புநர்';

  @override
  String get openGallery => 'திறந்த கேலரி';

  @override
  String get removeFromSpace => 'இடத்திலிருந்து அகற்று';

  @override
  String get markAsRead => 'படித்தபடி குறி';

  @override
  String get reportUser => 'பயனர் புகாரளிக்கவும்';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender $reaction உடன் பதிலளித்தார்';
  }

  @override
  String get pinMessage => 'அறைக்கு முள்';

  @override
  String get confirmEventUnpin => 'நிகழ்வை நிரந்தரமாக அவிழ்ப்பது உறுதி?';

  @override
  String get emojis => 'ஈமோசிகள்';

  @override
  String get unsupportedAndroidVersion => 'ஆதரிக்கப்படாத ஆண்ட்ராய்டு பதிப்பு';

  @override
  String get unsupportedAndroidVersionLong =>
      'இந்த அம்சத்திற்கு புதிய ஆண்ட்ராய்டு பதிப்பு தேவைப்படுகிறது. புதுப்பிப்புகள் அல்லது பரம்பரை OS ஆதரவை சரிபார்க்கவும்.';

  @override
  String get youRejectedTheInvitation => 'நீங்கள் அழைப்பை நிராகரித்தீர்கள்';

  @override
  String get youJoinedTheChat => 'நீங்கள் அரட்டையில் சேர்ந்தீர்கள்';

  @override
  String get youAcceptedTheInvitation =>
      '👍 நீங்கள் அழைப்பை ஏற்றுக்கொண்டீர்கள்';

  @override
  String youBannedUser(String user) {
    return 'நீங்கள் $user தடை செய்தீர்கள்';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return '$userக்கான அழைப்பை திரும்பப் பெற்றுவிட்டீர்கள்';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 நீங்கள் $user ஆல் அழைக்கப்பட்டுள்ளீர்கள்';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 $user ஐ அழைத்தீர்கள்';
  }

  @override
  String youKicked(String user) {
    return '👞 $userஐ உதைத்துள்ளீர்கள்';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 நீங்கள் உதைத்து தடைசெய்துள்ளீர்கள் $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'நீங்கள் $user தடைசெய்யவில்லை';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user தட்டியது';
  }

  @override
  String get usersMustKnock => 'பயனர்கள் தட்ட வேண்டும்';

  @override
  String get noOneCanJoin => 'யாரும் சேர முடியாது';

  @override
  String get knock => 'தட்டவும்';

  @override
  String get users => 'பயனர்கள்';

  @override
  String get storeInAndroidKeystore => 'ஆண்ட்ராய்டு கீச்டோரில் சேமிக்கவும்';

  @override
  String get storeInAppleKeyChain => 'ஆப்பிள் கீச்சினில் சேமிக்கவும்';

  @override
  String get storeSecurlyOnThisDevice =>
      'இந்த சாதனத்தில் பாதுகாப்பாக சேமிக்கவும்';

  @override
  String countFiles(int count) {
    return '$count கோப்புகள்';
  }

  @override
  String get user => 'பயனர்';

  @override
  String get custom => 'தனிப்பயன்';

  @override
  String get whyIsThisMessageEncrypted => 'இந்த செய்தி ஏன் படிக்க முடியாதது?';

  @override
  String get noKeyForThisMessage =>
      'இந்த சாதனத்தில் உங்கள் கணக்கில் கையொப்பமிடுவதற்கு முன்பு செய்தி அனுப்பப்பட்டால் இது நிகழலாம்.\n\n அனுப்புநர் உங்கள் சாதனத்தைத் தடுத்துள்ளார் அல்லது இணைய இணைப்பில் ஏதேனும் தவறு ஏற்பட்டுள்ளது.\n\n மற்றொரு அமர்வில் செய்தியைப் படிக்க முடியுமா? அதிலிருந்து செய்தியை மாற்றலாம்! அமைப்புகள்> சாதனங்களுக்குச் சென்று, உங்கள் சாதனங்கள் ஒருவருக்கொருவர் சரிபார்த்துள்ளன என்பதை உறுதிப்படுத்தவும். அடுத்த முறை நீங்கள் அறையைத் திறக்கும்போது, இரண்டு அமர்வுகளும் முன்னணியில் இருக்கும்போது, விசைகள் தானாகவே அனுப்பப்படும்.\n\n வெளியேறும்போது அல்லது சாதனங்களை மாற்றும்போது விசைகளை இழக்க நீங்கள் விரும்பவில்லையா? அமைப்புகளில் அரட்டை காப்புப்பிரதியை நீங்கள் இயக்கியுள்ளீர்கள் என்பதை உறுதிப்படுத்திக் கொள்ளுங்கள்.';

  @override
  String get newSpace => 'புதிய இடம்';

  @override
  String get doNotShowAgain => 'மீண்டும் காட்ட வேண்டாம்';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'வெற்று அரட்டை ($oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'உங்கள் அரட்டைகளை ஒருங்கிணைத்து தனியார் அல்லது பொது சமூகங்களை உருவாக்க இடைவெளிகள் உங்களை அனுமதிக்கிறது.';

  @override
  String get encryptThisChat => 'இந்த அரட்டையை குறியாக்கவும்';

  @override
  String get disableEncryptionWarning =>
      'பாதுகாப்பு காரணங்களுக்காக நீங்கள் ஒரு அரட்டையில் குறியாக்கத்தை முடக்க முடியாது, அது இதற்கு முன்பு இயக்கப்பட்டிருக்கிறது.';

  @override
  String get sorryThatsNotPossible => 'மன்னிக்கவும் ... அது சாத்தியமில்லை';

  @override
  String get reopenChat => 'அரட்டையை மீண்டும் திறக்கவும்';

  @override
  String get noBackupWarning =>
      'எச்சரிக்கை! அரட்டை காப்புப்பிரதியை இயக்காமல், உங்கள் மறைகுறியாக்கப்பட்ட செய்திகளுக்கான அணுகலை இழப்பீர்கள். வெளியேறுவதற்கு முன் முதலில் அரட்டை காப்புப்பிரதியை இயக்க மிகவும் பரிந்துரைக்கப்படுகிறது.';

  @override
  String get noOtherDevicesFound => 'வேறு சாதனங்கள் எதுவும் கிடைக்கவில்லை';

  @override
  String fileIsTooBigForServer(String max) {
    return 'அனுப்ப முடியவில்லை! சேவையகம் $max வரை இணைப்புகளை மட்டுமே ஆதரிக்கிறது.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'கோப்பு $path';
  }

  @override
  String get jumpToLastReadMessage => 'கடைசி வாசிப்பு செய்திக்கு செல்லவும்';

  @override
  String get readUpToHere => 'இங்கே படிக்கவும்';

  @override
  String get jump => 'தாவு';

  @override
  String get openLinkInBrowser => 'உலாவியில் திறந்த இணைப்பை திறக்கவும்';

  @override
  String get reportErrorDescription =>
      '😭 ஓ இல்லை. ஏதோ தவறு நடந்தது. நீங்கள் விரும்பினால், இந்த பிழையை டெவலப்பர்களிடம் புகாரளிக்கலாம்.';

  @override
  String get report => 'அறிக்கை';

  @override
  String get setColorTheme => 'வண்ண கருப்பொருள் அமைக்கவும்:';

  @override
  String get invite => 'அழைக்கவும்';

  @override
  String get inviteGroupChat => '📨 குழு அரட்டை அழைப்பு';

  @override
  String get invalidInput => 'தவறான உள்ளீடு!';

  @override
  String wrongPinEntered(int seconds) {
    return 'தவறான முள் நுழைந்தது! $seconds விநாடிகளில் மீண்டும் முயற்சிக்கவும் ...';
  }

  @override
  String get pleaseEnterANumber =>
      'தயவுசெய்து 0 ஐ விட அதிகமான எண்ணை உள்ளிடவும்';

  @override
  String get archiveRoomDescription =>
      'அரட்டை காப்பகத்திற்கு நகர்த்தப்படும். மற்ற பயனர்கள் நீங்கள் அரட்டையை விட்டுவிட்டீர்கள் என்பதைக் காண முடியும்.';

  @override
  String get roomUpgradeDescription =>
      'அரட்டை பின்னர் புதிய அறை பதிப்பில் மீண்டும் உருவாக்கப்படும். பங்கேற்பாளர்கள் அனைவருக்கும் புதிய அரட்டைக்கு மாற வேண்டும் என்று அறிவிக்கப்படும். அறை பதிப்புகள் பற்றி மேலும் அறிய https://github.com/sorydima/REChain-.git';

  @override
  String get removeDevicesDescription =>
      'நீங்கள் இந்த சாதனத்திலிருந்து வெளியேறுவீர்கள், இனி செய்திகளைப் பெற முடியாது.';

  @override
  String get banUserDescription =>
      'பயனர் அரட்டையிலிருந்து தடைசெய்யப்படுவார், மேலும் அவை தடைசெய்யப்படாத வரை மீண்டும் அரட்டையில் நுழைய முடியாது.';

  @override
  String get unbanUserDescription =>
      'அவர்கள் முயற்சித்தால் பயனர் மீண்டும் அரட்டையை உள்ளிட முடியும்.';

  @override
  String get kickUserDescription =>
      'பயனர் அரட்டையிலிருந்து வெளியேற்றப்படுகிறார், ஆனால் தடை செய்யப்படவில்லை. பொது அரட்டைகளில், பயனர் எந்த நேரத்திலும் மீண்டும் சேரலாம்.';

  @override
  String get makeAdminDescription =>
      'இந்த பயனர் நிர்வாகியை நீங்கள் செய்தவுடன், இதை நீங்கள் செயல்தவிர்க்க முடியாமல் போகலாம், ஏனெனில் அவை உங்களைப் போன்ற அதே அனுமதிகளைக் கொண்டிருக்கும்.';

  @override
  String get pushNotificationsNotAvailable => 'புச் அறிவிப்புகள் கிடைக்கவில்லை';

  @override
  String get learnMore => 'மேலும் அறிக';

  @override
  String get yourGlobalUserIdIs => 'உங்கள் உலகளாவிய பயனர் ஐடி: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'துரதிர்ச்டவசமாக \"$query\" உடன் எந்த பயனரையும் காண முடியவில்லை. நீங்கள் ஒரு எழுத்துப்பிழை செய்தீர்களா என்பதை சரிபார்க்கவும்.';
  }

  @override
  String get knocking => 'தட்டுதல்';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return '$server';
  }

  @override
  String get searchChatsRooms => '#Chats, Us பயனர்களைத் தேடுங்கள் ...';

  @override
  String get nothingFound => 'எதுவும் கிடைக்கவில்லை ...';

  @override
  String get groupName => 'குழு பெயர்';

  @override
  String get createGroupAndInviteUsers =>
      'ஒரு குழுவை உருவாக்கி பயனர்களை அழைக்கவும்';

  @override
  String get groupCanBeFoundViaSearch => 'தேடல் வழியாக குழுவை காணலாம்';

  @override
  String get wrongRecoveryKey =>
      'மன்னிக்கவும் ... இது சரியான மீட்பு விசையாகத் தெரியவில்லை.';

  @override
  String get commandHint_sendraw => 'மூல சாதொபொகு ஐ அனுப்புங்கள்';

  @override
  String get databaseMigrationTitle => 'தரவுத்தளம் உகந்ததாக உள்ளது';

  @override
  String get databaseMigrationBody =>
      'தயவுசெய்து காத்திருங்கள். இது ஒரு கணம் ஆகலாம்.';

  @override
  String get leaveEmptyToClearStatus => 'உங்கள் நிலையை அழிக்க காலியாக விடவும்.';

  @override
  String get select => 'தேர்ந்தெடு';

  @override
  String get searchForUsers => '@Users ஐத் தேடுங்கள் ...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'உங்கள் தற்போதைய கடவுச்சொல்லை உள்ளிடவும்';

  @override
  String get newPassword => 'புதிய கடவுச்சொல்';

  @override
  String get pleaseChooseAStrongPassword => 'வலுவான கடவுச்சொல்லைத் தேர்வுசெய்க';

  @override
  String get passwordsDoNotMatch => 'கடவுச்சொற்கள் பொருந்தவில்லை';

  @override
  String get passwordIsWrong => 'நீங்கள் உள்ளிட்ட கடவுச்சொல் தவறு';

  @override
  String get publicChatAddresses => 'பொது அரட்டை முகவரிகள்';

  @override
  String get createNewAddress => 'புதிய முகவரியை உருவாக்கவும்';

  @override
  String get joinSpace => 'விண்வெளியில் சேரவும்';

  @override
  String get publicSpaces => 'பொது இடங்கள்';

  @override
  String get addChatOrSubSpace => 'அரட்டை அல்லது துணை இடத்தைச் சேர்க்கவும்';

  @override
  String get thisDevice => 'இந்த சாதனம்:';

  @override
  String get initAppError => 'பயன்பாட்டைத் தொடங்கும்போது பிழை ஏற்பட்டது';

  @override
  String searchIn(String chat) {
    return 'அரட்டையில் தேடு \"$chat\" ...';
  }

  @override
  String get searchMore => 'மேலும் தேடுங்கள் ...';

  @override
  String get gallery => 'கேலரி';

  @override
  String get files => 'கோப்புகள்';

  @override
  String sessionLostBody(String url, String error) {
    return 'உங்கள் அமர்வு தொலைந்துவிட்டது. $url இல் டெவலப்பர்களிடம் இந்தப் பிழையைப் புகாரளிக்கவும். பிழை செய்தி: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'ஆப்ஸ் இப்போது உங்கள் அமர்வை காப்புப்பிரதியிலிருந்து மீட்டெடுக்க முயற்சிக்கிறது. $url இல் டெவலப்பர்களிடம் இந்தப் பிழையைப் புகாரளிக்கவும். பிழை செய்தி: $error';
  }

  @override
  String get sendReadReceipts => 'வாசிப்பு ரசீதுகளை அனுப்பவும்';

  @override
  String get sendTypingNotificationsDescription =>
      'அரட்டையில் பங்கேற்பாளர்கள் நீங்கள் ஒரு புதிய செய்தியைத் தட்டச்சு செய்யும் போது காணலாம்.';

  @override
  String get sendReadReceiptsDescription =>
      'அரட்டையில் பங்கேற்பாளர்கள் நீங்கள் ஒரு செய்தியைப் படிக்கும்போது பார்க்கலாம்.';

  @override
  String get formattedMessages => 'வடிவமைக்கப்பட்ட செய்திகள்';

  @override
  String get formattedMessagesDescription =>
      'மார்க் டவுனைப் பயன்படுத்தி தைரியமான உரை போன்ற பணக்கார செய்தி உள்ளடக்கத்தைக் காண்பி.';

  @override
  String get verifyOtherUser => 'Poser மற்ற பயனரை சரிபார்க்கவும்';

  @override
  String get verifyOtherUserDescription =>
      'நீங்கள் மற்றொரு பயனரைச் சரிபார்த்தால், நீங்கள் உண்மையில் யாருக்கு எழுதுகிறீர்கள் என்பது உங்களுக்குத் தெரியும் என்பதை நீங்கள் உறுதியாக நம்பலாம். 💪\n\nநீங்கள் ஒரு சரிபார்ப்பைத் தொடங்கும்போது, நீங்களும் மற்ற பயனரும் பயன்பாட்டில் ஒரு பாப்அப்பைக் காண்பீர்கள். நீங்கள் ஒருவருக்கொருவர் ஒப்பிட வேண்டிய தொடர்ச்சியான ஈமோசிகள் அல்லது எண்களைக் காண்பீர்கள்.\n\nஇதைச் செய்வதற்கான சிறந்த வழி வீடியோ அழைப்பைச் சந்திப்பது அல்லது தொடங்குவது. 👭';

  @override
  String get verifyOtherDevice => 'Sevice பிற சாதனத்தை சரிபார்க்கவும்';

  @override
  String get verifyOtherDeviceDescription =>
      'நீங்கள் மற்றொரு சாதனத்தைச் சரிபார்க்கும்போது, அந்தச் சாதனங்கள் விசைகளைப் பரிமாறிக்கொள்ளலாம், உங்கள் ஒட்டுமொத்த பாதுகாப்பை அதிகரிக்கும். 💪 நீங்கள் ஒரு சரிபார்ப்பைத் தொடங்கும்போது, இரண்டு சாதனங்களிலும் பயன்பாட்டில் ஒரு பாப்அப் தோன்றும். நீங்கள் ஒருவருக்கொருவர் ஒப்பிட வேண்டிய தொடர்ச்சியான ஈமோசிகள் அல்லது எண்களைக் காண்பீர்கள். நீங்கள் சரிபார்ப்பைத் தொடங்குவதற்கு முன்பு இரண்டு சாதனங்களையும் எளிதில் வைத்திருப்பது நல்லது. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender ஏற்றுக்கொள்ளப்பட்ட விசை சரிபார்ப்பு';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender ரத்து செய்யப்பட்ட விசை சரிபார்ப்பு';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender நிறைவு செய்யப்பட்ட விசை சரிபார்ப்பு';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return 'விசை சரிபார்ப்பிற்கு $sender தயாராக உள்ளார்';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender கோரப்பட்ட விசை சரிபார்ப்பு';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender விசை சரிபார்ப்பைத் தொடங்கினார்';
  }

  @override
  String get incomingMessages => 'உள்வரும் செய்திகள்';

  @override
  String get stickers => 'ச்டிக்கர்கள்';

  @override
  String get discover => 'கண்டுபிடி';

  @override
  String get commandHint_ignore =>
      'கொடுக்கப்பட்ட மேட்ரிக்ச் ஐடியை புறக்கணிக்கவும்';

  @override
  String get commandHint_unignore =>
      'கொடுக்கப்பட்ட மேட்ரிக்ச் ஐடியை இணைக்கவும்';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread படிக்காத அரட்டைகள்';
  }

  @override
  String get noDatabaseEncryption =>
      'இந்த மேடையில் தரவுத்தள குறியாக்கம் ஆதரிக்கப்படவில்லை';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'இப்போது $count பயனர்கள் தடுக்கப்பட்டுள்ளனர்.';
  }

  @override
  String goToSpace(Object space) {
    return 'விண்வெளிக்குச் செல்லுங்கள்: $space';
  }

  @override
  String get markAsUnread => 'படிக்காத எனக் குறிக்கவும்';

  @override
  String userLevel(int level) {
    return '$level - பயனர்';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - மதிப்பீட்டாளர்';
  }

  @override
  String adminLevel(int level) {
    return '$level - நிர்வாகி';
  }

  @override
  String get changeGeneralChatSettings => 'பொது அரட்டை அமைப்புகளை மாற்றவும்';

  @override
  String get inviteOtherUsers => 'இந்த அரட்டைக்கு மற்ற பயனர்களை அழைக்கவும்';

  @override
  String get changeTheChatPermissions => 'அரட்டை அனுமதிகளை மாற்றவும்';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'அரட்டை வரலாற்றின் தெரிவுநிலையை மாற்றவும்';

  @override
  String get changeTheCanonicalRoomAlias =>
      'முக்கிய பொது அரட்டை முகவரியை மாற்றவும்';

  @override
  String get sendRoomNotifications => 'ஒரு @ROOM அறிவிப்புகளை அனுப்பவும்';

  @override
  String get changeTheDescriptionOfTheGroup =>
      'அரட்டையின் விளக்கத்தை மாற்றவும்';

  @override
  String get chatPermissionsDescription =>
      'இந்த அரட்டையில் சில செயல்களுக்கு எந்த ஆற்றல் நிலை தேவை என்பதை வரையறுக்கவும். 0, 50 மற்றும் 100 ஆற்றல் நிலைகள் பொதுவாக பயனர்கள், மதிப்பீட்டாளர்கள் மற்றும் நிர்வாகிகளைக் குறிக்கின்றன, ஆனால் எந்த தரமும் சாத்தியமாகும்.';

  @override
  String updateInstalled(String version) {
    return '🎉 புதுப்பிப்பு $version நிறுவப்பட்டது!';
  }

  @override
  String get changelog => 'மாற்றபதிவு';

  @override
  String updateAvailable(String version) {
    return 'Update $version available';
  }

  @override
  String get download => 'Download';

  @override
  String get sendCanceled => 'அனுப்பப்பட்டது ரத்து செய்யப்பட்டது';

  @override
  String get loginWithREChainId => 'Login with REChain-ID';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'இணக்கமான ஓம்சர்வர் என்று தெரியவில்லை. தவறான URL?';

  @override
  String get calculatingFileSize => 'கோப்பு அளவைக் கணக்கிடுகிறது ...';

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'உங்கள் சாதனங்களில் ஒன்று சரிபார்க்கப்படவில்லை';

  @override
  String get noticeChatBackupDeviceVerification =>
      'குறிப்பு: உங்கள் எல்லா சாதனங்களையும் அரட்டை காப்புப்பிரதியுடன் இணைக்கும்போது, அவை தானாகவே சரிபார்க்கப்படும்.';

  @override
  String get continueText => 'தொடரவும்';

  @override
  String get blur => 'மங்கலானது:';

  @override
  String get opacity => 'ஒளிபுகாநிலை:';

  @override
  String get setWallpaper => 'வால்பேப்பரை அமைக்கவும்';

  @override
  String get manageAccount => 'கணக்கை நிர்வகிக்கவும்';

  @override
  String get noContactInformationProvided =>
      'சேவையகம் எந்த சரியான தொடர்பு தகவலையும் வழங்காது';

  @override
  String get contactServerAdmin => 'சேவையக நிர்வாகி தொடர்பு';

  @override
  String get contactServerSecurity => 'சேவையக பாதுகாப்பைத் தொடர்பு கொள்ளுங்கள்';

  @override
  String get supportPage => 'உதவி பக்கம்';

  @override
  String get serverInformation => 'சேவையக தகவல்:';

  @override
  String get name => 'பெயர்';

  @override
  String get version => 'பதிப்பு';

  @override
  String get website => 'வலைத்தளம்';

  @override
  String get compress => 'சுருக்க';

  @override
  String get boldText => 'தைரியமான உரை';

  @override
  String get italicText => 'சாய்வு உரை';

  @override
  String get strikeThrough => 'ச்ட்ரைகெத்ரோ';

  @override
  String get pleaseFillOut => 'தயவுசெய்து நிரப்பவும்';

  @override
  String get invalidUrl => 'தவறான முகவரி';

  @override
  String get addLink => 'இணைப்பைச் சேர்க்கவும்';

  @override
  String get unableToJoinChat =>
      'அரட்டையில் சேர முடியவில்லை. ஒருவேளை மற்ற கட்சி ஏற்கனவே உரையாடலை மூடியிருக்கலாம்.';

  @override
  String get previous => 'முந்தைய';

  @override
  String get otherPartyNotLoggedIn =>
      'மற்ற கட்சி தற்போது உள்நுழைந்திருக்கவில்லை, எனவே செய்திகளைப் பெற முடியாது!';

  @override
  String appWantsToUseForLogin(String server) {
    return 'உள்நுழைய \'$server\' ஐப் பயன்படுத்தவும்';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'உங்களைப் பற்றிய தகவல்களைப் பகிர பயன்பாடு மற்றும் வலைத்தளத்தை இதன்மூலம் அனுமதிக்கிறீர்கள்.';

  @override
  String get open => 'திற';

  @override
  String get waitingForServer => 'சேவையகத்திற்காக காத்திருக்கிறது ...';

  @override
  String get newChatRequest => 'அரட்டை கோரிக்கை';

  @override
  String get contentNotificationSettings => 'உள்ளடக்க அறிவிப்பு அமைப்புகள்';

  @override
  String get generalNotificationSettings => 'பொது அறிவிப்பு அமைப்புகள்';

  @override
  String get roomNotificationSettings => 'அறை அறிவிப்பு அமைப்புகள்';

  @override
  String get userSpecificNotificationSettings =>
      'பயனர் குறிப்பிட்ட அறிவிப்பு அமைப்புகள்';

  @override
  String get otherNotificationSettings => 'பிற அறிவிப்பு அமைப்புகள்';

  @override
  String get notificationRuleContainsUserName => 'பயனர் பெயரைக் கொண்டுள்ளது';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'ஒரு செய்தியில் அவற்றின் பயனர்பெயர் இருக்கும்போது பயனருக்கு அறிவிக்கிறது.';

  @override
  String get notificationRuleMaster => 'அனைத்து அறிவிப்புகளையும் முடக்குகிறது';

  @override
  String get notificationRuleMasterDescription =>
      'மற்ற எல்லா விதிகளையும் மீறி அனைத்து அறிவிப்புகளையும் முடக்குகிறது.';

  @override
  String get notificationRuleSuppressNotices => 'தானியங்கு செய்திகளை அடக்கவும்';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'போட்ச் போன்ற தானியங்கி வாடிக்கையாளர்களிடமிருந்து அறிவிப்புகளை அடக்குகிறது.';

  @override
  String get notificationRuleInviteForMe => 'எனக்கு அழைக்கவும்';

  @override
  String get notificationRuleInviteForMeDescription =>
      'ஒரு அறைக்கு அழைக்கப்படும்போது பயனருக்கு அறிவிக்கிறது.';

  @override
  String get notificationRuleMemberEvent => 'உறுப்பினர் நிகழ்வு';

  @override
  String get notificationRuleMemberEventDescription =>
      'உறுப்பினர் நிகழ்வுகளுக்கான அறிவிப்புகளை அடக்குகிறது.';

  @override
  String get notificationRuleIsUserMention => 'பயனர் குறிப்பு';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'ஒரு செய்தியில் நேரடியாக குறிப்பிடப்படும்போது பயனருக்கு அறிவிக்கிறது.';

  @override
  String get notificationRuleContainsDisplayName =>
      'காட்சி பெயரைக் கொண்டுள்ளது';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'ஒரு செய்தியில் அவற்றின் காட்சி பெயர் இருக்கும்போது பயனருக்கு அறிவிக்கிறது.';

  @override
  String get notificationRuleIsRoomMention => 'அறை குறிப்பு';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'ஒரு அறை குறிப்பு இருக்கும்போது பயனருக்கு அறிவிக்கிறது.';

  @override
  String get notificationRuleRoomnotif => 'அறை அறிவிப்பு';

  @override
  String get notificationRuleRoomnotifDescription =>
      'ஒரு செய்தியில் \'@ROOM\' இருக்கும்போது பயனருக்கு அறிவிக்கிறது.';

  @override
  String get notificationRuleTombstone => 'கல்லறை';

  @override
  String get notificationRuleTombstoneDescription =>
      'அறை செயலிழக்கச் செய்திகளைப் பற்றி பயனருக்கு அறிவிக்கிறது.';

  @override
  String get notificationRuleReaction => 'எதிர்வினை';

  @override
  String get notificationRuleReactionDescription =>
      'எதிர்வினைகளுக்கான அறிவிப்புகளை அடக்குகிறது.';

  @override
  String get notificationRuleRoomServerAcl => 'அறை சேவையகம் ACL';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'அறை சேவையக அணுகல் கட்டுப்பாட்டு பட்டியல்களுக்கான (ACL) அறிவிப்புகளை அடக்குகிறது.';

  @override
  String get notificationRuleSuppressEdits => 'திருத்தங்களை அடக்கவும்';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'திருத்தப்பட்ட செய்திகளுக்கான அறிவிப்புகளை அடக்குகிறது.';

  @override
  String get notificationRuleCall => 'அழை';

  @override
  String get notificationRuleCallDescription =>
      'அழைப்புகள் பற்றி பயனருக்கு அறிவிக்கிறது.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'மறைகுறியாக்கப்பட்ட அறை ஒன்றுக்கு ஒன்று';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'மறைகுறியாக்கப்பட்ட ஒன்றுக்கு ஒன்று அறைகளில் செய்திகளைப் பற்றி பயனருக்கு அறிவிக்கிறது.';

  @override
  String get notificationRuleRoomOneToOne => 'அறை ஒன்று';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'ஒருவருக்கு ஒன்று அறைகளில் செய்திகளைப் பற்றி பயனருக்கு அறிவிக்கிறது.';

  @override
  String get notificationRuleMessage => 'செய்தி';

  @override
  String get notificationRuleMessageDescription =>
      'பொதுவான செய்திகளைப் பற்றி பயனருக்கு அறிவிக்கிறது.';

  @override
  String get notificationRuleEncrypted => 'குறியாக்கப்பட்டது';

  @override
  String get notificationRuleEncryptedDescription =>
      'மறைகுறியாக்கப்பட்ட அறைகளில் செய்திகளைப் பற்றி பயனருக்கு அறிவிக்கிறது.';

  @override
  String get notificationRuleJitsi => 'சியோட்ச்';

  @override
  String get notificationRuleJitsiDescription =>
      'சிட்சி விட்செட் நிகழ்வுகளைப் பற்றி பயனருக்கு அறிவிக்கிறது.';

  @override
  String get notificationRuleServerAcl => 'சேவையக ACL நிகழ்வுகளை அடக்கவும்';

  @override
  String get notificationRuleServerAclDescription =>
      'சேவையக ACL நிகழ்வுகளுக்கான அறிவிப்புகளை அடக்குகிறது.';

  @override
  String unknownPushRule(String rule) {
    return 'அறியப்படாத புச் விதி \'$rule\'';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return '🎙️$duration - $sender இலிருந்து குரல் செய்தி';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'இந்த அறிவிப்பு அமைப்பை நீங்கள் நீக்கினால், இதை செயல்தவிர்க்க முடியாது.';

  @override
  String get more => 'மேலும்';

  @override
  String get shareKeysWith => 'விசைகளைப் பகிரவும் ...';

  @override
  String get shareKeysWithDescription =>
      'மறைகுறியாக்கப்பட்ட அரட்டைகளில் உங்கள் செய்திகளுடன் படிக்க எந்த சாதனங்களை நம்ப வேண்டும்?';

  @override
  String get allDevices => 'அனைத்து சாதனங்களும்';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'இயக்கப்பட்டால் சரிபார்க்கப்பட்ட சாதனங்களை குறுக்கு';

  @override
  String get crossVerifiedDevices => 'குறுக்கு சரிபார்க்கப்பட்ட சாதனங்கள்';

  @override
  String get verifiedDevicesOnly => 'சரிபார்க்கப்பட்ட சாதனங்கள் மட்டுமே';

  @override
  String get takeAPhoto => 'புகைப்படம் எடுக்கவும்';

  @override
  String get recordAVideo => 'வீடியோவைப் பதிவுசெய்க';

  @override
  String get optionalMessage => '(விரும்பினால்) செய்தி ...';

  @override
  String get notSupportedOnThisDevice => 'இந்த சாதனத்தில் ஆதரிக்கப்படவில்லை';

  @override
  String get enterNewChat => 'புதிய அரட்டையை உள்ளிடவும்';

  @override
  String get approve => 'ஒப்புதல்';

  @override
  String get youHaveKnocked => 'நீங்கள் தட்டிவிட்டீர்கள்';

  @override
  String get pleaseWaitUntilInvited =>
      'அறையில் இருந்து யாராவது உங்களை அழைக்கும் வரை தயவுசெய்து இப்போது காத்திருங்கள்.';

  @override
  String get commandHint_logout => 'உங்கள் தற்போதைய சாதனத்தை பதிவு செய்க';

  @override
  String get commandHint_logoutall =>
      'அனைத்து செயலில் உள்ள சாதனங்களையும் அனுப்புகிறது';

  @override
  String get displayNavigationRail => 'மொபைலில் வழிசெலுத்தல் ரெயிலைக் காட்டு';

  @override
  String get customReaction => 'தனிப்பயன் எதிர்வினை';

  @override
  String get moreEvents => 'மேலும் நிகழ்வுகள்';

  @override
  String get showMore => 'Show more';

  @override
  String get showLess => 'Show less';

  @override
  String get declineInvitation => 'அழைப்பை நிராகரிக்கவும்';

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
      'வீடியோ அழைப்புகள் தற்போது பீட்டாவில் உள்ளன என்பதை நினைவில் கொள்க. அவர்கள் எதிர்பார்த்தபடி வேலை செய்யக்கூடாது அல்லது எல்லா தளங்களிலும் வேலை செய்யக்கூடாது.';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get incomingCall => 'Incoming call';

  @override
  String get videoCall => 'வீடியோ அழைப்பு';

  @override
  String get voiceCall => 'குரல் அழைப்பு';

  @override
  String get missedCall => 'Missed call';

  @override
  String get callBack => 'Call back';

  @override
  String get hangUp => 'Hang up';

  @override
  String get waitingForParticipant => 'Waiting for participant...';

  @override
  String get decline => 'வீழ்ச்சி';

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
