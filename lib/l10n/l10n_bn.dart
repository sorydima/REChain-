// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class L10nBn extends L10n {
  L10nBn([String locale = 'bn']) : super(locale);

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
  String get repeatPassword => 'পাসওয়ার্ড আবার লিখো';

  @override
  String get notAnImage => 'ইমেজ ফাইল না।';

  @override
  String get remove => 'Remove';

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
  String get about => 'সম্পর্কে';

  @override
  String aboutHomeserver(String homeserver) {
    return 'About $homeserver';
  }

  @override
  String get accept => 'স্বীকার করি';

  @override
  String acceptedTheInvitation(String username) {
    return '$username আমন্ত্রণ গ্রহণ করেছে';
  }

  @override
  String get account => 'অ্যাকাউন্ট';

  @override
  String get accountsAndSettings => 'Accounts and settings';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username activated end to end encryption';
  }

  @override
  String get addEmail => 'Add email';

  @override
  String get confirmREChainId =>
      'Please confirm your REChain ID in order to delete your account.';

  @override
  String supposedMxid(String mxid) {
    return 'This should be $mxid';
  }

  @override
  String get addToSpace => 'Add to space';

  @override
  String get admin => 'অ্যাডমিস';

  @override
  String get alias => 'অ্যালিয়াস';

  @override
  String get all => 'All';

  @override
  String get commandHint_roomupgrade =>
      'Upgrade this room to the given room version';

  @override
  String get commandHint_googly => 'Send some googly eyes';

  @override
  String get commandHint_cuddle => 'Send a cuddle';

  @override
  String get commandHint_hug => 'Send a hug';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName sends you googly eyes';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName cuddles you';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName hugs you';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName answered the call';
  }

  @override
  String get anyoneCanJoin => 'Anyone can join';

  @override
  String get appLock => 'App lock';

  @override
  String get appLockDescription =>
      'Lock the app when not using with a pin code';

  @override
  String get archive => 'আর্কাইভ';

  @override
  String get areGuestsAllowedToJoin => 'Are guest users allowed to join?';

  @override
  String get areYouSure => 'Are you sure?';

  @override
  String get discardEdits => 'You have unsaved changes. Discard your edits?';

  @override
  String get areYouSureYouWantToLogout => 'Are you sure you want to log out?';

  @override
  String get askSSSSSign =>
      'To be able to sign the other person, please enter your secure store passphrase or recovery key.';

  @override
  String askVerificationRequest(String username) {
    return 'Accept this verification request from $username?';
  }

  @override
  String get autoplayImages =>
      'Automatically play animated stickers and emotes';

  @override
  String badServerLoginTypesException(
    String serverVersions,
    String supportedVersions,
    Object suportedVersions,
  ) {
    return 'The homeserver supports the login types:\n$serverVersions\nBut this app supports only:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Send typing notifications';

  @override
  String get swipeRightToLeftToReply => 'Swipe right to left to reply';

  @override
  String get sendOnEnter => 'Send on enter';

  @override
  String get noMoreChatsFound => 'No more chats found...';

  @override
  String get noChatsFoundHere =>
      'No chats found here yet. Start a new chat with someone by using the button below. ⤵️';

  @override
  String get unread => 'Unread';

  @override
  String get space => 'Space';

  @override
  String get banFromChat => 'Ban from chat';

  @override
  String get banned => 'ব্যানড';

  @override
  String bannedUser(String username, String targetName) {
    return '$username banned $targetName';
  }

  @override
  String get blockDevice => 'Block Device';

  @override
  String get blocked => 'Blocked';

  @override
  String get cancel => 'বাতিল';

  @override
  String cantOpenUri(String uri) {
    return 'Can\'t open the URI $uri';
  }

  @override
  String get changeDeviceName => 'Change device name';

  @override
  String changedTheChatAvatar(String username) {
    return '$username changed the chat avatar';
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
    return '$username changed the chat permissions';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username changed their displayname to: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username changed the guest access rules';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username changed the guest access rules to: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username changed the history visibility';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username changed the history visibility to: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username changed the join rules';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username changed the join rules to: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username changed their avatar';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username changed the room aliases';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username changed the invitation link';
  }

  @override
  String get changePassword => 'Change password';

  @override
  String get changeTheHomeserver => 'Change the homeserver';

  @override
  String get changeTheme => 'Change your style';

  @override
  String get changeTheNameOfTheGroup => 'Change the name of the group';

  @override
  String get changeYourAvatar => 'Change your avatar';

  @override
  String get channelCorruptedDecryptError =>
      'The encryption has been corrupted';

  @override
  String get chat => 'চ্যাট';

  @override
  String get chatBackup => 'Chat backup';

  @override
  String get chatDetails => 'Chat details';

  @override
  String get chats => 'Chats';

  @override
  String get chooseAStrongPassword => 'Choose a strong password';

  @override
  String get clearArchive => 'Clear archive';

  @override
  String get close => 'বন্ধ';

  @override
  String get commandHint_markasdm =>
      'Mark as direct message room for the giving REChain ID';

  @override
  String get commandHint_markasgroup => 'Mark as group';

  @override
  String get commandHint_ban => 'Ban the given user from this room';

  @override
  String get commandHint_clearcache => 'Clear cache';

  @override
  String get commandHint_create =>
      'Create an empty group chat\nUse --no-encryption to disable encryption';

  @override
  String get commandHint_discardsession => 'Discard session';

  @override
  String get commandHint_dm =>
      'Start a direct chat\nUse --no-encryption to disable encryption';

  @override
  String get commandHint_html => 'Send HTML-formatted text';

  @override
  String get commandHint_invite => 'Invite the given user to this room';

  @override
  String get commandHint_join => 'Join the given room';

  @override
  String get commandHint_kick => 'Remove the given user from this room';

  @override
  String get commandHint_leave => 'Leave this room';

  @override
  String get commandHint_me => 'Describe yourself';

  @override
  String get commandHint_myroomavatar =>
      'Set your picture for this room (by mxc-uri)';

  @override
  String get commandHint_myroomnick => 'Set your display name for this room';

  @override
  String get commandHint_op =>
      'Set the given user\'s power level (default: 50)';

  @override
  String get commandHint_plain => 'Send unformatted text';

  @override
  String get commandHint_react => 'Send reply as a reaction';

  @override
  String get commandHint_send => 'Send text';

  @override
  String get commandHint_unban => 'Unban the given user from this room';

  @override
  String get commandInvalid => 'Command invalid';

  @override
  String commandMissing(String command) {
    return '$command is not a command.';
  }

  @override
  String get compareEmojiMatch => 'Please compare the emojis';

  @override
  String get compareNumbersMatch => 'Please compare the numbers';

  @override
  String get configureChat => 'Configure chat';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Contact has been invited to the group';

  @override
  String get contentHasBeenReported =>
      'The content has been reported to the server admins';

  @override
  String get copiedToClipboard => 'Copied to clipboard';

  @override
  String get copy => 'অনুলিপি';

  @override
  String get copyToClipboard => 'Copy to clipboard';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Could not decrypt message: $error';
  }

  @override
  String get checkList => 'Check list';

  @override
  String countParticipants(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count participants',
      one: '1 participant',
    );
    return '$_temp0';
  }

  @override
  String countInvited(int count) {
    return '$count invited';
  }

  @override
  String get create => 'তৈরি';

  @override
  String createdTheChat(String username) {
    return '💬 $username created the chat';
  }

  @override
  String get createGroup => 'Create group';

  @override
  String get createNewSpace => 'New space';

  @override
  String get currentlyActive => 'Currently active';

  @override
  String get darkTheme => 'Dark';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String get deactivateAccountWarning =>
      'This will deactivate your user account. This can not be undone! Are you sure?';

  @override
  String get defaultPermissionLevel => 'Default permission level for new users';

  @override
  String get delete => 'অপসারণ';

  @override
  String get deleteAccount => 'Delete account';

  @override
  String get deleteMessage => 'Delete message';

  @override
  String get devices => 'ডিভাইস';

  @override
  String get directChats => 'Direct Chats';

  @override
  String get displaynameHasBeenChanged => 'Displayname has been changed';

  @override
  String get downloadFile => 'Download file';

  @override
  String get edit => 'সম্পাদন';

  @override
  String get editBlockedServers => 'Edit blocked servers';

  @override
  String get chatPermissions => 'Chat permissions';

  @override
  String get editDisplayname => 'Edit displayname';

  @override
  String get editRoomAliases => 'Edit room aliases';

  @override
  String get editRoomAvatar => 'Edit room avatar';

  @override
  String get emoteExists => 'Emote already exists!';

  @override
  String get emoteInvalid => 'Invalid emote shortcode!';

  @override
  String get emoteKeyboardNoRecents =>
      'Recently-used emotes will appear here...';

  @override
  String get globalChatId => 'Global chat ID';

  @override
  String get accessAndVisibility => 'Access and visibility';

  @override
  String get accessAndVisibilityDescription =>
      'Who is allowed to join this chat and how the chat can be discovered.';

  @override
  String get customEmojisAndStickers => 'Custom emojis and stickers';

  @override
  String get customEmojisAndStickersBody =>
      'Add or share custom emojis or stickers which can be used in any chat.';

  @override
  String get emoteShortcode => 'Emote shortcode';

  @override
  String get emptyChat => 'Empty chat';

  @override
  String get enableEmotesGlobally => 'Enable emote pack globally';

  @override
  String get enableEncryption => 'Enable encryption';

  @override
  String get enableEncryptionWarning =>
      'You won\'t be able to disable the encryption anymore. Are you sure?';

  @override
  String get encrypted => 'এনক্রিপ্টকৃত';

  @override
  String get encryption => 'এনক্রিপশন';

  @override
  String get encryptionNotEnabled => 'Encryption is not enabled';

  @override
  String endedTheCall(String senderName) {
    return '$senderName ended the call';
  }

  @override
  String get enterAnEmailAddress => 'Enter an email address';

  @override
  String errorObtainingLocation(String error) {
    return 'Error obtaining location: $error';
  }

  @override
  String get fontSize => 'Font size';

  @override
  String get forward => 'ফরওয়ার্ড';

  @override
  String get fromJoining => 'From joining';

  @override
  String get fromTheInvitation => 'From the invitation';

  @override
  String get group => 'গ্রুপ';

  @override
  String get chatDescription => 'Chat description';

  @override
  String get chatDescriptionHasBeenChanged => 'Chat description changed';

  @override
  String get groupIsPublic => 'Group is public';

  @override
  String get groups => 'Groups';

  @override
  String groupWith(String displayname) {
    return 'Group with $displayname';
  }

  @override
  String get guestsAreForbidden => 'Guests are forbidden';

  @override
  String get guestsCanJoin => 'Guests can join';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username has withdrawn the invitation for $targetName';
  }

  @override
  String get help => 'সাহায্য';

  @override
  String get hideRedactedMessages => 'Hide redacted messages';

  @override
  String get hideRedactedMessagesBody =>
      'If someone redacts a message, this message won\'t be visible in the chat anymore.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Hide invalid or unknown message formats';

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
  String get iHaveClickedOnLink => 'I have clicked on the link';

  @override
  String get incorrectPassphraseOrKey => 'Incorrect passphrase or recovery key';

  @override
  String get inviteContact => 'Invite contact';

  @override
  String inviteContactToGroup(String groupName) {
    return 'Invite contact to $groupName';
  }

  @override
  String get noChatDescriptionYet => 'No chat description created yet.';

  @override
  String get tryAgain => 'Try again';

  @override
  String get invalidServerName => 'Invalid server name';

  @override
  String get invited => 'আমন্ত্রিত';

  @override
  String get redactMessageDescription =>
      'The message will be redacted for all participants in this conversation. This cannot be undone.';

  @override
  String get optionalRedactReason =>
      '(Optional) Reason for redacting this message...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username invited $targetName';
  }

  @override
  String get invitedUsersOnly => 'Invited users only';

  @override
  String inviteText(String username, String link) {
    return '$username invited you to REChain.\n1. Visit https://github.com/sorydima/REChain- and install the app \n2. Sign up or sign in \n3. Open the invite link: \n $link';
  }

  @override
  String get isTyping => 'is typing';

  @override
  String joinedTheChat(String username) {
    return '👋 $username joined the chat';
  }

  @override
  String get joinRoom => 'Join room';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username kicked $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username kicked and banned $targetName';
  }

  @override
  String get kickFromChat => 'Kick from chat';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Last active: $localizedTimeShort';
  }

  @override
  String get leave => 'ছেড়ে যাও';

  @override
  String get leftTheChat => 'Left the chat';

  @override
  String get lightTheme => 'Light';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Load $count more participants';
  }

  @override
  String get dehydrate => 'Export session and wipe device';

  @override
  String get dehydrateWarning =>
      'This action cannot be undone. Ensure you safely store the backup file.';

  @override
  String get hydrate => 'Restore from backup file';

  @override
  String get loadingPleaseWait => 'Loading… Please wait.';

  @override
  String get loadMore => 'Load more…';

  @override
  String get locationDisabledNotice =>
      'Location services are disabled. Please enable them to be able to share your location.';

  @override
  String get locationPermissionDeniedNotice =>
      'Location permission denied. Please grant them to be able to share your location.';

  @override
  String get login => 'প্রবেশ';

  @override
  String logInTo(String homeserver) {
    return 'Log in to $homeserver';
  }

  @override
  String get logout => 'প্রস্থান';

  @override
  String get mention => 'Mention';

  @override
  String get messages => 'Messages';

  @override
  String get messagesStyle => 'Messages:';

  @override
  String get moderator => 'Moderator';

  @override
  String get muteChat => 'Mute chat';

  @override
  String get newChat => 'New chat';

  @override
  String get newMessageInrechainonline => '💬 New message in REChain';

  @override
  String get newVerificationRequest => 'New verification request!';

  @override
  String get next => 'Next';

  @override
  String get no => 'No';

  @override
  String get noConnectionToTheServer => 'No connection to the server';

  @override
  String get noEmotesFound => 'No emotes found. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'You can only activate encryption as soon as the room is no longer publicly accessible.';

  @override
  String get noGoogleServicesWarning =>
      'Firebase Cloud Messaging doesn\'t appear to be available on your device. To still receive push notifications, we recommend installing ntfy. With ntfy or another Unified Push provider you can receive push notifications in a data secure way. You can download ntfy from the PlayStore or from F-Droid.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 is no REChain server, use $server2 instead?';
  }

  @override
  String get shareInviteLink => 'Share invite link';

  @override
  String get scanQrCode => 'Scan QR code';

  @override
  String get noPasswordRecoveryDescription =>
      'You have not added a way to recover your password yet.';

  @override
  String get noPermission => 'No permission';

  @override
  String get noRoomsFound => 'No rooms found…';

  @override
  String get notifications => 'বিজ্ঞপ্তি';

  @override
  String numUsersTyping(int count) {
    return '$count users are typing…';
  }

  @override
  String get obtainingLocation => 'Obtaining location…';

  @override
  String get ok => 'Ok';

  @override
  String get onlineKeyBackupEnabled => 'Online Key Backup is enabled';

  @override
  String get oopsPushError =>
      'Oops! Unfortunately, an error occurred when setting up the push notifications.';

  @override
  String get oopsSomethingWentWrong => 'Oops, something went wrong…';

  @override
  String get openAppToReadMessages => 'Open app to read messages';

  @override
  String get openCamera => 'Open camera';

  @override
  String get oneClientLoggedOut => 'One of your clients has been logged out';

  @override
  String get addAccount => 'Add account';

  @override
  String get editBundlesForAccount => 'Edit bundles for this account';

  @override
  String get addToBundle => 'Add to bundle';

  @override
  String get removeFromBundle => 'Remove from this bundle';

  @override
  String get bundleName => 'Bundle name';

  @override
  String get openInMaps => 'Open in maps';

  @override
  String get link => 'Link';

  @override
  String get or => 'Or';

  @override
  String get participant => 'Participant';

  @override
  String get passphraseOrKey => 'passphrase or recovery key';

  @override
  String get password => 'Password';

  @override
  String get passwordForgotten => 'Password forgotten';

  @override
  String get passwordHasBeenChanged => 'Password has been changed';

  @override
  String get passwordRecoverySettings => 'Password recovery settings';

  @override
  String get passwordRecovery => 'Password recovery';

  @override
  String get pin => 'Pin';

  @override
  String get pleaseChooseAPasscode => 'Please choose a pass code';

  @override
  String get pleaseClickOnLink =>
      'Please click on the link in the email and then proceed.';

  @override
  String get pleaseEnterYourPassword => 'Please enter your password';

  @override
  String get pleaseEnterYourPin => 'Please enter your pin';

  @override
  String get pleaseEnterYourUsername => 'Please enter your username';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Please follow the instructions on the website and tap on next.';

  @override
  String get privacy => 'Privacy';

  @override
  String get publicRooms => 'Public Rooms';

  @override
  String get reason => 'Reason';

  @override
  String redactedBy(String username) {
    return 'Redacted by $username';
  }

  @override
  String redactedByBecause(String username, String reason) {
    return 'Redacted by $username because: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username redacted an event';
  }

  @override
  String get redactMessage => 'Redact message';

  @override
  String get reject => 'Reject';

  @override
  String rejectedTheInvitation(String username) {
    return '$username rejected the invitation';
  }

  @override
  String get removeAllOtherDevices => 'Remove all other devices';

  @override
  String get unbanFromChat => 'Unban from chat';

  @override
  String get removeYourAvatar => 'Remove your avatar';

  @override
  String get replaceRoomWithNewerVersion => 'Replace room with newer version';

  @override
  String get reply => 'Reply';

  @override
  String get reportMessage => 'Report message';

  @override
  String get roomHasBeenUpgraded => 'Room has been upgraded';

  @override
  String sendingFilesDoNotExit(int count) {
    return 'Sending $count files... Please do not exit!';
  }

  @override
  String get roomVersion => 'Room version';

  @override
  String get compressingVideo => 'Compressing video...';

  @override
  String get saveFile => 'Save file';

  @override
  String get search => 'Search';

  @override
  String get security => 'Security';

  @override
  String get send => 'Send';

  @override
  String get sendAMessage => 'Send a message';

  @override
  String get sendAsText => 'Send as text';

  @override
  String get sendAudio => 'Send audio';

  @override
  String get sendFile => 'Send file';

  @override
  String get sendImage => 'Send image';

  @override
  String sendImages(int count) {
    return 'Send $count image';
  }

  @override
  String get sendMessages => 'Send messages';

  @override
  String get sendVideo => 'Send video';

  @override
  String sentAFile(String username) {
    return '📁 $username sent a file';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username sent an audio';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username sent a picture';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username sent a sticker';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username sent a video';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName sent call information';
  }

  @override
  String get setAsCanonicalAlias => 'Set as main alias';

  @override
  String get setChatDescription => 'Set chat description';

  @override
  String get setStatus => 'Set status';

  @override
  String get settings => 'Settings';

  @override
  String get share => 'Share';

  @override
  String sharedTheLocation(String username) {
    return '$username shared their location';
  }

  @override
  String get shareLocation => 'Share location';

  @override
  String get skip => 'Skip';

  @override
  String get sourceCode => 'Source code';

  @override
  String get spaceIsPublic => 'Space is public';

  @override
  String get spaceName => 'Space name';

  @override
  String startedACall(String senderName) {
    return '$senderName started a call';
  }

  @override
  String get status => 'Status';

  @override
  String get statusExampleMessage => 'How are you today?';

  @override
  String get submit => 'Submit';

  @override
  String get synchronizingPleaseWait => 'Synchronizing… Please wait.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Synchronizing… ($percentage%)';
  }

  @override
  String get systemTheme => 'System';

  @override
  String get theyDontMatch => 'They Don\'t Match';

  @override
  String get theyMatch => 'They Match';

  @override
  String get tooManyRequestsWarning =>
      'Too many requests. Please try again later!';

  @override
  String get tryToSendAgain => 'Try to send again';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username unbanned $targetName';
  }

  @override
  String get unblockDevice => 'Unblock Device';

  @override
  String get unknownDevice => 'Unknown device';

  @override
  String get unknownEncryptionAlgorithm => 'Unknown encryption algorithm';

  @override
  String unknownEvent(String type) {
    return 'Unknown event \'$type\'';
  }

  @override
  String get unmuteChat => 'Unmute chat';

  @override
  String get unpin => 'Unpin';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username and $count others are typing…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username and $username2 are typing…';
  }

  @override
  String userIsTyping(String username) {
    return '$username is typing…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username left the chat';
  }

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username sent a $type event';
  }

  @override
  String get unverified => 'Unverified';

  @override
  String get verified => 'Verified';

  @override
  String get verifyStart => 'Start Verification';

  @override
  String get verifySuccess => 'You successfully verified!';

  @override
  String get verifyTitle => 'Verifying other account';

  @override
  String get visibilityOfTheChatHistory => 'Visibility of the chat history';

  @override
  String get visibleForAllParticipants => 'Visible for all participants';

  @override
  String get visibleForEveryone => 'Visible for everyone';

  @override
  String get voiceMessage => 'Voice message';

  @override
  String get waitingPartnerAcceptRequest =>
      'Waiting for partner to accept the request…';

  @override
  String get waitingPartnerEmoji => 'Waiting for partner to accept the emoji…';

  @override
  String get waitingPartnerNumbers =>
      'Waiting for partner to accept the numbers…';

  @override
  String get warning => 'Warning!';

  @override
  String get weSentYouAnEmail => 'We sent you an email';

  @override
  String get whoCanPerformWhichAction => 'Who can perform which action';

  @override
  String get whoIsAllowedToJoinThisGroup => 'Who is allowed to join this group';

  @override
  String get whyDoYouWantToReportThis => 'Why do you want to report this?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'With these addresses you can recover your password.';

  @override
  String get writeAMessage => 'Write a message…';

  @override
  String get yes => 'Yes';

  @override
  String get you => 'You';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'You are no longer participating in this chat';

  @override
  String get yourPublicKey => 'Your public key';

  @override
  String get messageInfo => 'Message info';

  @override
  String get time => 'Time';

  @override
  String get sender => 'Sender';

  @override
  String get openGallery => 'Open gallery';

  @override
  String get removeFromSpace => 'Remove from space';

  @override
  String get markAsRead => 'Mark as read';

  @override
  String get reportUser => 'Report user';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender reacted with $reaction';
  }

  @override
  String get pinMessage => 'Pin to room';

  @override
  String get confirmEventUnpin =>
      'Are you sure to permanently unpin the event?';

  @override
  String get emojis => 'Emojis';

  @override
  String get unsupportedAndroidVersion => 'Unsupported Android version';

  @override
  String get unsupportedAndroidVersionLong =>
      'This feature requires a newer Android version. Please check for updates or Mobile Katya OS support.';

  @override
  String get youRejectedTheInvitation => 'You rejected the invitation';

  @override
  String get youJoinedTheChat => 'You joined the chat';

  @override
  String get youAcceptedTheInvitation => '👍 You accepted the invitation';

  @override
  String youBannedUser(String user) {
    return 'You banned $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'You have withdrawn the invitation for $user';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 You have been invited by $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 You invited $user';
  }

  @override
  String youKicked(String user) {
    return '👞 You kicked $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 You kicked and banned $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'You unbanned $user';
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
  String get knock => 'Knock';

  @override
  String get users => 'Users';

  @override
  String get storeInAndroidKeystore => 'Store in Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Store in Apple KeyChain';

  @override
  String get storeSecurlyOnThisDevice => 'Store securely on this device';

  @override
  String countFiles(int count) {
    return '$count files';
  }

  @override
  String get user => 'User';

  @override
  String get custom => 'Custom';

  @override
  String get whyIsThisMessageEncrypted => 'Why is this message unreadable?';

  @override
  String get noKeyForThisMessage =>
      'This can happen if the message was sent before you have signed in to your account at this device.\n\nIt is also possible that the sender has blocked your device or something went wrong with the internet connection.\n\nAre you able to read the message on another session? Then you can transfer the message from it! Go to Settings > Devices and make sure that your devices have verified each other. When you open the room the next time and both sessions are in the foreground, the keys will be transmitted automatically.\n\nDo you not want to lose the keys when logging out or switching devices? Make sure that you have enabled the chat backup in the settings.';

  @override
  String get newSpace => 'New space';

  @override
  String get doNotShowAgain => 'Do not show again';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Empty chat (was $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Spaces allows you to consolidate your chats and build private or public communities.';

  @override
  String get encryptThisChat => 'Encrypt this chat';

  @override
  String get disableEncryptionWarning =>
      'For security reasons you can not disable encryption in a chat, where it has been enabled before.';

  @override
  String get sorryThatsNotPossible => 'Sorry... that is not possible';

  @override
  String get reopenChat => 'Reopen chat';

  @override
  String get noBackupWarning =>
      'Warning! Without enabling chat backup, you will lose access to your encrypted messages. It is highly recommended to enable the chat backup first before logging out.';

  @override
  String get noOtherDevicesFound => 'No other devices found';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Unable to send! The server only supports attachments up to $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'File has been saved at $path';
  }

  @override
  String get jumpToLastReadMessage => 'Jump to last read message';

  @override
  String get readUpToHere => 'Read up to here';

  @override
  String get jump => 'Jump';

  @override
  String get openLinkInBrowser => 'Open link in browser';

  @override
  String get reportErrorDescription =>
      '😭 Oh no. Something went wrong. If you want, you can report this bug to the developers.';

  @override
  String get report => 'report';

  @override
  String get setColorTheme => 'Set color theme:';

  @override
  String get invite => 'Invite';

  @override
  String get inviteGroupChat => '📨 Group chat invite';

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
      'The chat will then be recreated with the new room version. All participants will be notified that they need to switch to the new chat. You can find out more about room versions at https://spec.matrix.org/latest/rooms/';

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
  String get thisDevice => 'This device:';

  @override
  String get initAppError => 'An error occured while init the app';

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
  String sessionLostBody(String url, String error) {
    return 'Your session is lost. Please report this error to the developers at $url. The error message is: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'The app now tries to restore your session from the backup. Please report this error to the developers at $url. The error message is: $error';
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
  String updateAvailable(String version) {
    return 'Update $version available';
  }

  @override
  String get download => 'Download';

  @override
  String get sendCanceled => 'Sending canceled';

  @override
  String get loginWithREChainId => 'Login with REChain-ID';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Doesn\'t seem to be a compatible homeserver. Wrong URL?';

  @override
  String get calculatingFileSize => 'Calculating file size...';

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'One of your devices is not verified';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Note: When you connect all your devices to the chat backup, they are automatically verified.';

  @override
  String get continueText => 'Continue';

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
      'Video calls are a beta feature. There might be bugs or unexpected behavior. We would be happy to hear about your feedback.';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get incomingCall => 'Incoming call';

  @override
  String get videoCall => 'Video call';

  @override
  String get voiceCall => 'Voice call';

  @override
  String get missedCall => 'Missed call';

  @override
  String get callBack => 'Call back';

  @override
  String get hangUp => 'Hang up';

  @override
  String get waitingForParticipant => 'Waiting for participant...';

  @override
  String get decline => 'Decline';

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
