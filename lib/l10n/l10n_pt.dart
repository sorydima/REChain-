// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class L10nPt extends L10n {
  L10nPt([String locale = 'pt']) : super(locale);

  @override
  String get alwaysUse24HourFormat => 'false';

  @override
  String get repeatPassword => 'Repeat password';

  @override
  String get notAnImage => 'Not an image file.';

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
  String get about => 'Sobre';

  @override
  String aboutHomeserver(String homeserver) {
    return 'About $homeserver';
  }

  @override
  String get accept => 'Accept';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username accepted the invitation';
  }

  @override
  String get account => 'Conta';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username activated end to end encryption';
  }

  @override
  String get addEmail => 'Add email';

  @override
  String get confirmrechainonlineId =>
      'Please confirm your rechain ID in order to delete your account.';

  @override
  String supposedMxid(String mxid) {
    return 'This should be $mxid';
  }

  @override
  String get addChatDescription => 'Add a chat description...';

  @override
  String get addToSpace => 'Add to space';

  @override
  String get admin => 'Admin';

  @override
  String get alias => 'alias';

  @override
  String get all => 'All';

  @override
  String get allChats => 'All chats';

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
  String get archive => 'Archive';

  @override
  String get areGuestsAllowedToJoin => 'Are guest users allowed to join';

  @override
  String get areYouSure => 'Tens a certeza?';

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
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'The homeserver supports the login types:\n$serverVersions\nBut this app supports only:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Send typing notifications';

  @override
  String get swipeRightToLeftToReply => 'Swipe right to left to reply';

  @override
  String get sendOnEnter => 'Send on enter';

  @override
  String badServerVersionsException(
      String serverVersions,
      String supportedVersions,
      Object serverVerions,
      Object supoortedVersions,
      Object suportedVersions) {
    return 'The homeserver supports the Spec versions:\n$serverVersions\nBut this app supports only $supportedVersions';
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
  String get banFromChat => 'Ban from chat';

  @override
  String get banned => 'Banned';

  @override
  String bannedUser(String username, String targetName) {
    return '$username banned $targetName';
  }

  @override
  String get blockDevice => 'Block Device';

  @override
  String get blocked => 'Blocked';

  @override
  String get botMessages => 'Bot messages';

  @override
  String get cancel => 'Cancelar';

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
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username changed the chat description to: \'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username changed the chat name to: \'$chatname\'';
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
  String get chat => 'Chat';

  @override
  String get yourChatBackupHasBeenSetUp => 'Your chat backup has been set up.';

  @override
  String get chatBackup => 'Chat backup';

  @override
  String get chatBackupDescription =>
      'Your old messages are secured with a recovery key. Please make sure you don\'t lose it.';

  @override
  String get chatDetails => 'Chat details';

  @override
  String get chatHasBeenAddedToThisSpace => 'Chat has been added to this space';

  @override
  String get chats => 'Chats';

  @override
  String get chooseAStrongPassword => 'Choose a strong password';

  @override
  String get clearArchive => 'Clear archive';

  @override
  String get close => 'Fechar';

  @override
  String get commandHint_markasdm =>
      'Mark as direct message room for the giving rechain ID';

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
  String get confirm => 'Confirm';

  @override
  String get connect => 'Connect';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Contact has been invited to the group';

  @override
  String get containsDisplayName => 'Contains display name';

  @override
  String get containsUserName => 'Contains username';

  @override
  String get contentHasBeenReported =>
      'The content has been reported to the server admins';

  @override
  String get copiedToClipboard => 'Copiada para a área de transferência';

  @override
  String get copy => 'Copy';

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
    return '$count participants';
  }

  @override
  String countInvited(int count) {
    return '$count invited';
  }

  @override
  String get create => 'Create';

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
  String dateWithoutYear(String month, String day) {
    return '$day-$month';
  }

  @override
  String dateWithYear(String year, String month, String day) {
    return '$day-$month-$year';
  }

  @override
  String get deactivateAccountWarning =>
      'This will deactivate your user account. This can not be undone! Are you sure?';

  @override
  String get defaultPermissionLevel => 'Default permission level for new users';

  @override
  String get delete => 'Eliminar';

  @override
  String get deleteAccount => 'Delete account';

  @override
  String get deleteMessage => 'Delete message';

  @override
  String get device => 'Device';

  @override
  String get deviceId => 'Device ID';

  @override
  String get devices => 'Devices';

  @override
  String get directChats => 'Direct Chats';

  @override
  String get allRooms => 'All Group Chats';

  @override
  String get displaynameHasBeenChanged => 'Displayname has been changed';

  @override
  String get downloadFile => 'Download file';

  @override
  String get edit => 'Edit';

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
  String get emotePacks => 'Emote packs for room';

  @override
  String get emoteSettings => 'Emote Settings';

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
  String get emoteShortcode => 'Emote shortcode';

  @override
  String get emoteWarnNeedToPick =>
      'You need to pick an emote shortcode and an image!';

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
  String get encrypted => 'Encrypted';

  @override
  String get encryption => 'Encryption';

  @override
  String get encryptionNotEnabled => 'Encryption is not enabled';

  @override
  String endedTheCall(String senderName) {
    return '$senderName ended the call';
  }

  @override
  String get enterAnEmailAddress => 'Enter an email address';

  @override
  String get homeserver => 'Homeserver';

  @override
  String get enterYourHomeserver => 'Enter your homeserver';

  @override
  String errorObtainingLocation(String error) {
    return 'Error obtaining location: $error';
  }

  @override
  String get everythingReady => 'Everything ready!';

  @override
  String get extremeOffensive => 'Extremely offensive';

  @override
  String get fileName => 'File name';

  @override
  String get rechain => 'rechain';

  @override
  String get fontSize => 'Font size';

  @override
  String get forward => 'Forward';

  @override
  String get fromJoining => 'From joining';

  @override
  String get fromTheInvitation => 'From the invitation';

  @override
  String get goToTheNewRoom => 'Go to the new room';

  @override
  String get group => 'Group';

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
  String get help => 'Ajuda';

  @override
  String get hideRedactedEvents => 'Hide redacted events';

  @override
  String get hideRedactedMessages => 'Hide redacted messages';

  @override
  String get hideRedactedMessagesBody =>
      'If someone redacts a message, this message won\'t be visible in the chat anymore.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Hide invalid or unknown message formats';

  @override
  String get howOffensiveIsThisContent => 'How offensive is this content?';

  @override
  String get id => 'ID';

  @override
  String get identity => 'Identity';

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
  String get inoffensive => 'Inoffensive';

  @override
  String get inviteContact => 'Invite contact';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return 'Do you want to invite $contact to the chat \"$groupName\"?';
  }

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
  String get invited => 'Invited';

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
  String get inviteForMe => 'Invite for me';

  @override
  String inviteText(String username, String link) {
    return '$username invited you to rechain.\n1. Visit https://online.rechain.network and install the app \n2. Sign up or sign in \n3. Open the invite link: \n $link';
  }

  @override
  String get isTyping => 'is typing…';

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
  String get leave => 'Leave';

  @override
  String get leftTheChat => 'Left the chat';

  @override
  String get license => 'License';

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
  String get dehydrateTor => 'TOR Users: Export session';

  @override
  String get dehydrateTorLong =>
      'For TOR users, it is recommended to export the session before closing the window.';

  @override
  String get hydrateTor => 'TOR Users: Import session export';

  @override
  String get hydrateTorLong =>
      'Did you export your session last time on TOR? Quickly import it and continue chatting.';

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
  String get login => 'Iniciar sessão';

  @override
  String logInTo(String homeserver) {
    return 'Log in to $homeserver';
  }

  @override
  String get logout => 'Terminar sessão';

  @override
  String get memberChanges => 'Member changes';

  @override
  String get mention => 'Mention';

  @override
  String get messages => 'Mensagens';

  @override
  String get messagesStyle => 'Messages:';

  @override
  String get moderator => 'Moderator';

  @override
  String get muteChat => 'Mute chat';

  @override
  String get needPantalaimonWarning =>
      'Please be aware that you need Pantalaimon to use end-to-end encryption for now.';

  @override
  String get newChat => 'New chat';

  @override
  String get newMessageInrechainonline => '💬 New message in rechain';

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
    return '$server1 is no rechain server, use $server2 instead?';
  }

  @override
  String get shareInviteLink => 'Share invite link';

  @override
  String get scanQrCode => 'Scan QR code';

  @override
  String get none => 'None';

  @override
  String get noPasswordRecoveryDescription =>
      'You have not added a way to recover your password yet.';

  @override
  String get noPermission => 'No permission';

  @override
  String get noRoomsFound => 'No rooms found…';

  @override
  String get notifications => 'Notificações';

  @override
  String get notificationsEnabledForThisAccount =>
      'Notifications enabled for this account';

  @override
  String numUsersTyping(int count) {
    return '$count users are typing…';
  }

  @override
  String get obtainingLocation => 'Obtaining location…';

  @override
  String get offensive => 'Offensive';

  @override
  String get offline => 'Offline';

  @override
  String get ok => 'Ok';

  @override
  String get online => 'Online';

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
  String get openCamera => 'Abrir câmara';

  @override
  String get openVideoCamera => 'Open camera for a video';

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
  String get enableMultiAccounts =>
      '(BETA) Enable multi accounts on this device';

  @override
  String get openInMaps => 'Open in maps';

  @override
  String get link => 'Link';

  @override
  String get serverRequiresEmail =>
      'This server needs to validate your email address for registration.';

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
  String get passwordRecovery => 'Password recovery';

  @override
  String get people => 'People';

  @override
  String get pickImage => 'Pick an image';

  @override
  String get pin => 'Pin';

  @override
  String play(String fileName) {
    return 'Play $fileName';
  }

  @override
  String get pleaseChoose => 'Please choose';

  @override
  String get pleaseChooseAPasscode => 'Please choose a pass code';

  @override
  String get pleaseClickOnLink =>
      'Please click on the link in the email and then proceed.';

  @override
  String get pleaseEnter4Digits =>
      'Please enter 4 digits or leave empty to disable app lock.';

  @override
  String get pleaseEnterRecoveryKey => 'Please enter your recovery key:';

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
  String get privacy => 'Privacidade';

  @override
  String get publicRooms => 'Public Rooms';

  @override
  String get pushRules => 'Push rules';

  @override
  String get reason => 'Razão';

  @override
  String get recording => 'Recording';

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
    return '$username redacted an event';
  }

  @override
  String get redactMessage => 'Redact message';

  @override
  String get register => 'Register';

  @override
  String get reject => 'Reject';

  @override
  String rejectedTheInvitation(String username) {
    return '$username rejected the invitation';
  }

  @override
  String get rejoin => 'Rejoin';

  @override
  String get removeAllOtherDevices => 'Remove all other devices';

  @override
  String removedBy(String username) {
    return 'Removed by $username';
  }

  @override
  String get removeDevice => 'Remove device';

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
  String get requestPermission => 'Request permission';

  @override
  String get roomHasBeenUpgraded => 'Room has been upgraded';

  @override
  String get roomVersion => 'Room version';

  @override
  String get saveFile => 'Save file';

  @override
  String get search => 'Pesquisar';

  @override
  String get security => 'Security';

  @override
  String get recoveryKey => 'Recovery key';

  @override
  String get recoveryKeyLost => 'Recovery key lost?';

  @override
  String seenByUser(String username) {
    return 'Seen by $username';
  }

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
  String get sendOriginal => 'Send original';

  @override
  String get sendSticker => 'Send sticker';

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
  String get separateChatTypes => 'Separate Direct Chats and Groups';

  @override
  String get setAsCanonicalAlias => 'Set as main alias';

  @override
  String get setCustomEmotes => 'Set custom emotes';

  @override
  String get setChatDescription => 'Set chat description';

  @override
  String get setInvitationLink => 'Set invitation link';

  @override
  String get setPermissionsLevel => 'Set permissions level';

  @override
  String get setStatus => 'Set status';

  @override
  String get settings => 'Configurações';

  @override
  String get share => 'Share';

  @override
  String sharedTheLocation(String username) {
    return '$username shared their location';
  }

  @override
  String get shareLocation => 'Share location';

  @override
  String get showPassword => 'Show password';

  @override
  String get presenceStyle => 'Presence:';

  @override
  String get presencesToggle => 'Show status messages from other users';

  @override
  String get singlesignon => 'Single Sign on';

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
  String get startFirstChat => 'Start your first chat';

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
  String get title => 'rechain';

  @override
  String get toggleFavorite => 'Toggle Favorite';

  @override
  String get toggleMuted => 'Toggle Muted';

  @override
  String get toggleUnread => 'Mark Read/Unread';

  @override
  String get tooManyRequestsWarning =>
      'Too many requests. Please try again later!';

  @override
  String get transferFromAnotherDevice => 'Transfer from another device';

  @override
  String get tryToSendAgain => 'Try to send again';

  @override
  String get unavailable => 'Unavailable';

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
  String unreadChats(int unreadCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount unread chats',
      one: '1 unread chat',
    );
    return '$_temp0';
  }

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
  String get username => 'Username';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username sent a $type event';
  }

  @override
  String get unverified => 'Unverified';

  @override
  String get verified => 'Verified';

  @override
  String get verify => 'Verify';

  @override
  String get verifyStart => 'Start Verification';

  @override
  String get verifySuccess => 'You successfully verified!';

  @override
  String get verifyTitle => 'Verifying other account';

  @override
  String get videoCall => 'Video call';

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
  String get wallpaper => 'Wallpaper:';

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
  String get wipeChatBackup =>
      'Wipe your chat backup to create a new recovery key?';

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
  String get youHaveBeenBannedFromThisChat =>
      'You have been banned from this chat';

  @override
  String get yourPublicKey => 'Your public key';

  @override
  String get messageInfo => 'Message info';

  @override
  String get time => 'Time';

  @override
  String get messageType => 'Message Type';

  @override
  String get sender => 'Sender';

  @override
  String get openGallery => 'Open gallery';

  @override
  String get removeFromSpace => 'Remove from space';

  @override
  String get addToSpaceDescription => 'Select a space to add this chat to it.';

  @override
  String get start => 'Start';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'To unlock your old messages, please enter your recovery key that has been generated in a previous session. Your recovery key is NOT your password.';

  @override
  String get publish => 'Publish';

  @override
  String videoWithSize(String size) {
    return 'Video ($size)';
  }

  @override
  String get openChat => 'Open Chat';

  @override
  String get markAsRead => 'Mark as read';

  @override
  String get reportUser => 'Report user';

  @override
  String get dismiss => 'Dismiss';

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
  String get placeCall => 'Place call';

  @override
  String get voiceCall => 'Voice call';

  @override
  String get unsupportedAndroidVersion => 'Unsupported Android version';

  @override
  String get unsupportedAndroidVersionLong =>
      'This feature requires a newer Android version. Please check for updates or Katya ® 👽 OS support.';

  @override
  String get videoCallsBetaWarning =>
      'Please note that video calls are currently in beta. They might not work as expected or work at all on all platforms.';

  @override
  String get experimentalVideoCalls => 'Experimental video calls';

  @override
  String get emailOrUsername => 'Email or username';

  @override
  String get indexedDbErrorTitle => 'Private mode issues';

  @override
  String get indexedDbErrorLong =>
      'The message storage is unfortunately not enabled in private mode by default.\nPlease visit\n - about:config\n - set dom.indexedDB.privateBrowsing.enabled to true\nOtherwise, it is not possible to run rechain.';

  @override
  String switchToAccount(String number) {
    return 'Switch to account $number';
  }

  @override
  String get nextAccount => 'Next account';

  @override
  String get previousAccount => 'Previous account';

  @override
  String get addWidget => 'Add widget';

  @override
  String get widgetVideo => 'Video';

  @override
  String get widgetEtherpad => 'Text note';

  @override
  String get widgetJitsi => 'Jitsi Meet';

  @override
  String get widgetCustom => 'Custom';

  @override
  String get widgetName => 'Name';

  @override
  String get widgetUrlError => 'This is not a valid URL.';

  @override
  String get widgetNameError => 'Please provide a display name.';

  @override
  String get errorAddingWidget => 'Error adding the widget.';

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
  String youInvitedToBy(String alias) {
    return '📩 You have been invited via link to:\n$alias';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 You have been invited by $user';
  }

  @override
  String invitedBy(String user) {
    return '📩 Invited by $user';
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
  String userWouldLikeToChangeTheChat(String user) {
    return '$user would like to join the chat.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'No public link has been created yet';

  @override
  String get knock => 'Knock';

  @override
  String get users => 'Utilizadores';

  @override
  String get unlockOldMessages => 'Unlock old messages';

  @override
  String get storeInSecureStorageDescription =>
      'Store the recovery key in the secure storage of this device.';

  @override
  String get saveKeyManuallyDescription =>
      'Save this key manually by triggering the system share dialog or clipboard.';

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
  String get foregroundServiceRunning =>
      'This notification appears when the foreground service is running.';

  @override
  String get screenSharingTitle => 'screen sharing';

  @override
  String get screenSharingDetail => 'You are sharing your screen in FuffyChat';

  @override
  String get callingPermissions => 'Calling permissions';

  @override
  String get callingAccount => 'Calling account';

  @override
  String get callingAccountDetails =>
      'Allows rechain to use the native android dialer app.';

  @override
  String get appearOnTop => 'Appear on top';

  @override
  String get appearOnTopDetails =>
      'Allows the app to appear on top (not needed if you already have rechain setup as a calling account)';

  @override
  String get otherCallingPermissions =>
      'Microphone, camera and other rechain permissions';

  @override
  String get whyIsThisMessageEncrypted => 'Why is this message unreadable?';

  @override
  String get noKeyForThisMessage =>
      'This can happen if the message was sent before you have signed in to your account at this device.\n\nIt is also possible that the sender has blocked your device or something went wrong with the internet connection.\n\nAre you able to read the message on another session? Then you can transfer the message from it! Go to Settings > Devices and make sure that your devices have verified each other. When you open the room the next time and both sessions are in the foreground, the keys will be transmitted automatically.\n\nDo you not want to lose the keys when logging out or switching devices? Make sure that you have enabled the chat backup in the settings.';

  @override
  String get newGroup => 'New group';

  @override
  String get newSpace => 'New space';

  @override
  String get enterSpace => 'Enter space';

  @override
  String get enterRoom => 'Enter room';

  @override
  String get allSpaces => 'All spaces';

  @override
  String numChats(String number) {
    return '$number chats';
  }

  @override
  String get hideUnimportantStateEvents => 'Hide unimportant state events';

  @override
  String get hidePresences => 'Hide Status List?';

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
  String get deviceKeys => 'Device keys:';

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
  String get signInWithPassword => 'Sign in with password';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Please try again later or choose a different server.';

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
      'The chat will then be recreated with the new room version. All participants will be notified that they need to switch to the new chat. You can find out more about room versions at https://online.rechain.network';

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
  String get commandHint_ignore => 'Ignore the given rechain ID';

  @override
  String get commandHint_unignore => 'Unignore the given rechain ID';

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
  String get loginWithrechainonlineId => 'Login with rechain ID';

  @override
  String get discoverHomeservers => 'Discover homeservers';

  @override
  String get whatIsAHomeserver => 'What is a homeserver?';

  @override
  String get homeserverDescription =>
      'All your data is stored on the homeserver, just like an email provider. You can choose which homeserver you want to use, while you can still communicate with everyone. Learn more at at https://online.rechain.network.';

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
      'Hey Hey 👋 This is rechain. You can sign in to any homeserver, which is compatible with https://online.rechain.network. And then chat with anyone. It\'s a huge decentralized messaging network!';

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
      'rechain lets you chat with your friends across different messengers. Learn more at https://online.rechain.network or just tap *Continue*.';

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
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class L10nPtBr extends L10nPt {
  L10nPtBr() : super('pt_BR');

  @override
  String get alwaysUse24HourFormat => 'Falso';

  @override
  String get repeatPassword => 'Repita a senha';

  @override
  String get notAnImage => 'Não é uma imagem.';

  @override
  String get setCustomPermissionLevel =>
      'Definir nível de permissão personalizado';

  @override
  String get setPermissionsLevelDescription =>
      'Por favor, escolha uma função predefinida abaixo ou insira um nível de permissão personalizado entre 0 e 100.';

  @override
  String get ignoreUser => 'Ignorar usuário';

  @override
  String get remove => 'Remover';

  @override
  String get importNow => 'Importar agora';

  @override
  String get importEmojis => 'Importar Emojis';

  @override
  String get importFromZipFile => 'Importar de arquivo .zip';

  @override
  String get exportEmotePack => 'Exportar pacote de Emotes como .zip';

  @override
  String get replace => 'Substituir';

  @override
  String get about => 'Sobre';

  @override
  String get accept => 'Aceitar';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username aceitou o convite';
  }

  @override
  String get account => 'Conta';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username ativou a criptografia ponta-a-ponta';
  }

  @override
  String get addEmail => 'Adicionar email';

  @override
  String get confirmrechainonlineId =>
      'Por favor, confirme seu ID rechain para apagar sua conta.';

  @override
  String supposedMxid(String mxid) {
    return 'Isto deveria ser $mxid';
  }

  @override
  String get addChatDescription => 'Inserir descrição da conversa...';

  @override
  String get addToSpace => 'Adicionar ao espaço';

  @override
  String get admin => 'Admin';

  @override
  String get alias => 'cognome';

  @override
  String get all => 'Todas';

  @override
  String get allChats => 'Todas as conversas';

  @override
  String get commandHint_googly => 'Enviar olhos arregalados';

  @override
  String get commandHint_cuddle => 'Enviar um afago';

  @override
  String get commandHint_hug => 'Enviar um abraço';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName enviou olhos arregalados';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName afagou você';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName abraçou você';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName atendeu à chamada';
  }

  @override
  String get anyoneCanJoin => 'Qualquer pessoa pode participar';

  @override
  String get appLock => 'Trava do aplicativo';

  @override
  String get appLockDescription =>
      'Bloquear o app com um código PIN quando não estiver usando';

  @override
  String get archive => 'Arquivo';

  @override
  String get areGuestsAllowedToJoin => 'Usuários convidados podem participar';

  @override
  String get areYouSure => 'Tem certeza?';

  @override
  String get areYouSureYouWantToLogout =>
      'Tem certeza que deseja encerrar a sessão?';

  @override
  String get askSSSSSign =>
      'Para poder validar a outra pessoa, por favor, insira sua frase secreta ou chave de recuperação.';

  @override
  String askVerificationRequest(String username) {
    return 'Aceitar esta solicitação de verificação de $username?';
  }

  @override
  String get autoplayImages =>
      'Reproduzir automaticamente figurinhas animadas e emojis';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'O servidor matriz suporta os tipos de login:\n$serverVersions\nMas este app suporta apenas:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Enviar notificações de digitação';

  @override
  String get sendOnEnter => 'Enviar ao pressionar enter';

  @override
  String badServerVersionsException(
      String serverVersions,
      String supportedVersions,
      Object serverVerions,
      Object supoortedVersions,
      Object suportedVersions) {
    return 'O servidor matriz suporta as versões Spec:\n$serverVersions\nMas este app suporta apenas $supportedVersions';
  }

  @override
  String get banFromChat => 'Banir da conversa';

  @override
  String get banned => 'Banido';

  @override
  String bannedUser(String username, String targetName) {
    return '$username baniu $targetName';
  }

  @override
  String get blockDevice => 'Bloquear dispositivo';

  @override
  String get blocked => 'Bloqueado';

  @override
  String get botMessages => 'Mensagens de robôs';

  @override
  String get cancel => 'Cancelar';

  @override
  String cantOpenUri(String uri) {
    return 'Não foi possível abrir a URI $uri';
  }

  @override
  String get changeDeviceName => 'Alterar o nome do dispositivo';

  @override
  String changedTheChatAvatar(String username) {
    return '$username alterou o avatar da conversa';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username alterou a descrição da conversa para: \'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username alterou o nome da conversa para: \'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username alterou as permissões na conversa';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username mudou o seu nome de exibição para: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username alterou as regras de acesso dos convidados';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username alterou as regras de acesso dos convidados para: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username alterou a visibilidade do histórico';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username alterou a visibilidade do histórico para: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username alterou as regras para participação';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username alterou as regras para participação para: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username alterou seu avatar';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username alterou os cognomes da sala';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username alterou o link de convite';
  }

  @override
  String get changePassword => 'Alterar a senha';

  @override
  String get changeTheHomeserver => 'Alterar o servidor matriz';

  @override
  String get changeTheme => 'Alterar o tema';

  @override
  String get changeTheNameOfTheGroup => 'Alterar o nome do grupo';

  @override
  String get changeYourAvatar => 'Alterar seu avatar';

  @override
  String get channelCorruptedDecryptError => 'A criptografia foi corrompida';

  @override
  String get chat => 'Conversas';

  @override
  String get yourChatBackupHasBeenSetUp =>
      'Seu backup de conversas foi configurado.';

  @override
  String get chatBackup => 'Backup da conversa';

  @override
  String get chatBackupDescription =>
      'Suas mensagens antigas são protegidas com sua chave de recuperação. Por favor, evite perdê-la.';

  @override
  String get chatDetails => 'Detalhes da conversa';

  @override
  String get chatHasBeenAddedToThisSpace =>
      'A conversa foi adicionada a este espaço';

  @override
  String get chats => 'Conversas';

  @override
  String get chooseAStrongPassword => 'Escolha uma senha forte';

  @override
  String get clearArchive => 'Limpar arquivo';

  @override
  String get close => 'Fechar';

  @override
  String get commandHint_markasdm =>
      'Marcar como conversa direta para o ID rechain dado';

  @override
  String get commandHint_markasgroup => 'Marcar como grupo';

  @override
  String get commandHint_ban => 'Banir um(a) usuário(a) desta sala';

  @override
  String get commandHint_clearcache => 'Limpar dados temporários';

  @override
  String get commandHint_create =>
      'Criar uma sala vazia.\nUse --no-encryption para desabilitar a criptografia';

  @override
  String get commandHint_discardsession => 'Descartar sessão';

  @override
  String get commandHint_dm =>
      'Iniciar uma conversa direta\nUse --no-encryption para desabilitar a criptografia';

  @override
  String get commandHint_html => 'Enviar mensagem formatada em HTML';

  @override
  String get commandHint_invite => 'Convidar um(a) usuário(a) para esta sala';

  @override
  String get commandHint_join => 'Entrar numa sala';

  @override
  String get commandHint_kick => 'Remover um(a) usuário(a) desta sala';

  @override
  String get commandHint_leave => 'Sair desta sala';

  @override
  String get commandHint_me => 'Descrever você mesmo';

  @override
  String get commandHint_myroomavatar =>
      'Determinar sua imagem para esta sala (via mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Determinar seu nome de exibição para esta sala';

  @override
  String get commandHint_op =>
      'Determinar o grau de poderes de um(a) usuário(a) (padrão: 50)';

  @override
  String get commandHint_plain => 'Enviar mensagem sem formatação';

  @override
  String get commandHint_react => 'Enviar uma resposta como reação';

  @override
  String get commandHint_send => 'Enviar mensagem';

  @override
  String get commandHint_unban =>
      'Revogar o banimento de um(a) usuário(a) desta sala';

  @override
  String get commandInvalid => 'Comando inválido';

  @override
  String commandMissing(String command) {
    return '$command não é um comando.';
  }

  @override
  String get compareEmojiMatch => 'Por favor compare os emojis';

  @override
  String get compareNumbersMatch => 'Por favor compare os números';

  @override
  String get configureChat => 'Configurar conversa';

  @override
  String get confirm => 'Confirma';

  @override
  String get connect => 'Conectar';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'O contato foi convidado ao grupo';

  @override
  String get containsDisplayName => 'Contém nome de exibição';

  @override
  String get containsUserName => 'Contém nome de usuário';

  @override
  String get contentHasBeenReported =>
      'O conteúdo foi denunciado para quem administra o servidor';

  @override
  String get copiedToClipboard => 'Copiado para área de transferência';

  @override
  String get copy => 'Copiar';

  @override
  String get copyToClipboard => 'Copiar para a área de transferência';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Não foi possível decriptar a mensagem: $error';
  }

  @override
  String countParticipants(int count) {
    return '$count participantes';
  }

  @override
  String get create => 'Criar';

  @override
  String createdTheChat(String username) {
    return '💬 $username criou a conversa';
  }

  @override
  String get createGroup => 'Criar grupo';

  @override
  String get createNewSpace => 'Novo espaço';

  @override
  String get currentlyActive => 'Ativo';

  @override
  String get darkTheme => 'Escuro';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String dateWithoutYear(String month, String day) {
    return '$day/$month';
  }

  @override
  String dateWithYear(String year, String month, String day) {
    return '$day/$month/$year';
  }

  @override
  String get deactivateAccountWarning =>
      'Isto desativará a conta do usuário. É irreversível! Tem certeza?';

  @override
  String get defaultPermissionLevel => 'Nível de permissão padrão';

  @override
  String get delete => 'Apagar';

  @override
  String get deleteAccount => 'Apagar conta';

  @override
  String get deleteMessage => 'Apagar mensagem';

  @override
  String get device => 'Dispositivo';

  @override
  String get deviceId => 'ID do dispositivo';

  @override
  String get devices => 'Dispositivos';

  @override
  String get directChats => 'Conversas diretas';

  @override
  String get allRooms => 'Todos os Chats em Grupo';

  @override
  String get displaynameHasBeenChanged => 'O nome de exibição foi alterado';

  @override
  String get downloadFile => 'Baixar arquivo';

  @override
  String get edit => 'Editar';

  @override
  String get editBlockedServers => 'Editar servidores bloqueados';

  @override
  String get chatPermissions => 'Permissões da conversa';

  @override
  String get editDisplayname => 'Editar nome de exibição';

  @override
  String get editRoomAliases => 'Editar cognome da sala';

  @override
  String get editRoomAvatar => 'Editar o avatar da sala';

  @override
  String get emoteExists => 'Emoji já existe!';

  @override
  String get emoteInvalid => 'Código emoji inválido!';

  @override
  String get emoteKeyboardNoRecents => 'Emotes recentes aparecem aqui...';

  @override
  String get emotePacks => 'Pacote de emoji para a sala';

  @override
  String get emoteSettings => 'Configuração dos Emoji';

  @override
  String get globalChatId => 'ID de chat global';

  @override
  String get accessAndVisibility => 'Acesso e visibilidade';

  @override
  String get accessAndVisibilityDescription =>
      'Quem é permitido entrar nesse chat e como pode ser descoberto.';

  @override
  String get calls => 'Chamadas';

  @override
  String get customEmojisAndStickers => 'Emojis e stickers customizados';

  @override
  String get customEmojisAndStickersBody =>
      'Adicionar ou compartilhar emojis ou stickers customizados que podem ser usados em qualquer chat.';

  @override
  String get emoteShortcode => 'Código Emoji';

  @override
  String get emoteWarnNeedToPick =>
      'Você tem que escolher um código emoji e uma imagem!';

  @override
  String get emptyChat => 'Conversa vazia';

  @override
  String get enableEmotesGlobally => 'Habilitar globalmente o pacote de emoji';

  @override
  String get enableEncryption => 'Habilitar criptografia';

  @override
  String get enableEncryptionWarning =>
      'Você não poderá desabilitar a criptografia posteriormente. Tem certeza?';

  @override
  String get encrypted => 'Criptografado';

  @override
  String get encryption => 'Criptografia';

  @override
  String get encryptionNotEnabled => 'A criptografia não está habilitada';

  @override
  String endedTheCall(String senderName) {
    return '$senderName finalizou a chamada';
  }

  @override
  String get enterAnEmailAddress => 'Inserir endereço de e-mail';

  @override
  String get homeserver => 'Servidor matriz';

  @override
  String get enterYourHomeserver => 'Insira um servidor matriz';

  @override
  String errorObtainingLocation(String error) {
    return 'Erro ao obter local: $error';
  }

  @override
  String get everythingReady => 'Tudo pronto!';

  @override
  String get extremeOffensive => 'Extremamente ofensivo';

  @override
  String get fileName => 'Nome do arquivo';

  @override
  String get rechain => 'rechain';

  @override
  String get fontSize => 'Tamanho da fonte';

  @override
  String get forward => 'Encaminhar';

  @override
  String get fromJoining => 'Desde que entrou';

  @override
  String get fromTheInvitation => 'Desde o convite';

  @override
  String get goToTheNewRoom => 'Ir para a sala nova';

  @override
  String get group => 'Grupo';

  @override
  String get chatDescription => 'Descrição da conversa';

  @override
  String get chatDescriptionHasBeenChanged => 'Descrição da conversa alterada';

  @override
  String get groupIsPublic => 'Grupo público';

  @override
  String get groups => 'Grupos';

  @override
  String groupWith(String displayname) {
    return 'Grupo com $displayname';
  }

  @override
  String get guestsAreForbidden => 'Convidados estão proibidos';

  @override
  String get guestsCanJoin => 'Convidados podem participar';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username revogou o convite para $targetName';
  }

  @override
  String get help => 'Ajuda';

  @override
  String get hideRedactedEvents => 'Ocultar eventos removidos';

  @override
  String get hideRedactedMessages => 'Esconder mensagens excluídas';

  @override
  String get hideRedactedMessagesBody =>
      'Se alguém excluir uma mensagem, esta mensagem não será mais visível no chat.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Esconder formatos de mensagem inválidos ou desconhecidos';

  @override
  String get howOffensiveIsThisContent => 'O quão ofensivo é este conteúdo?';

  @override
  String get id => 'ID';

  @override
  String get identity => 'Identidade';

  @override
  String get block => 'Bloquear';

  @override
  String get blockedUsers => 'Usuários bloqueados';

  @override
  String get blockListDescription =>
      'Você pode bloquear usuários que estejam perturbando. Você não receberá mensagens ou convites de usuários na sua lista pessoal de bloqueios.';

  @override
  String get blockUsername => 'Ignore usuário';

  @override
  String get iHaveClickedOnLink => 'Eu cliquei no link';

  @override
  String get incorrectPassphraseOrKey =>
      'Frase secreta ou chave de recuperação incorreta';

  @override
  String get inoffensive => 'Inofensivo';

  @override
  String get inviteContact => 'Convidar contato';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return 'Você quer convidar $contact para a conversa \"$groupName\"?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Convidar contato para $groupName';
  }

  @override
  String get noChatDescriptionYet =>
      'Nenhuma descrição da conversa disponível.';

  @override
  String get tryAgain => 'Tente novamente';

  @override
  String get invalidServerName => 'Nome de usuário inválido';

  @override
  String get invited => 'Foi convidado';

  @override
  String get redactMessageDescription =>
      'A mensagem será removida para todos participantes desta conversa. Isto não poderá ser desfeito.';

  @override
  String get optionalRedactReason =>
      '(Opcional) Motivo para remover esta mensagem.';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username convidou $targetName';
  }

  @override
  String get invitedUsersOnly => 'Apenas usuários convidados';

  @override
  String get inviteForMe => 'Convite para mim';

  @override
  String inviteText(String username, String link) {
    return '$username convidou você para o rechain. \n1. Visite https://online.rechain.network e instale o aplicativo\n2. Entre ou crie uma conta \n3. Abra o link do convite:\n $link';
  }

  @override
  String get isTyping => 'está escrevendo…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username entrou na conversa';
  }

  @override
  String get joinRoom => 'Entrar na sala';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username enxotou $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username expulsou e baniu $targetName';
  }

  @override
  String get kickFromChat => 'Expulso da conversa';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Última vez ativo: $localizedTimeShort';
  }

  @override
  String get leave => 'Sair';

  @override
  String get leftTheChat => 'Sair da conversa';

  @override
  String get license => 'Licença';

  @override
  String get lightTheme => 'Claro';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Carregue $count mais participantes';
  }

  @override
  String get dehydrate => 'Exportar sessão e limpar dispositivo';

  @override
  String get dehydrateWarning =>
      'Esta ação não pode ser desfeita. Certifique-se de que o arquivo backup está guardado e seguro.';

  @override
  String get dehydrateTor => 'Usuários TOR: Exportar sessão';

  @override
  String get dehydrateTorLong =>
      'Para usuários TOR, é recomendado exportar a sessão antes de fechar a janela.';

  @override
  String get hydrateTor => 'Usuários TOR: Importar sessão';

  @override
  String get hydrateTorLong =>
      'Você exportou sua última sessão no TOR? Importe ela rapidamente e continue conversando.';

  @override
  String get hydrate => 'Restaurar a partir de arquivo backup';

  @override
  String get loadingPleaseWait => 'Carregando... Aguarde.';

  @override
  String get loadMore => 'Carregando mais…';

  @override
  String get locationDisabledNotice =>
      'O serviço de localização está desabilitado. Por favor, habilite-o para compartilhar sua localização.';

  @override
  String get locationPermissionDeniedNotice =>
      'Permissão de localização negada. Conceda as permissões para habilitar o compartilhamento de localização.';

  @override
  String get login => 'Iniciar sessão';

  @override
  String logInTo(String homeserver) {
    return 'Conectar a $homeserver';
  }

  @override
  String get logout => 'Encerrar sessão';

  @override
  String get memberChanges => 'Alterações de membros';

  @override
  String get mention => 'Mencionar';

  @override
  String get messages => 'Mensagens';

  @override
  String get messagesStyle => 'Mensagens:';

  @override
  String get moderator => 'Moderador';

  @override
  String get muteChat => 'Silenciar';

  @override
  String get needPantalaimonWarning =>
      'Por favor, observe que, por enquanto, você precisa do Pantalaimon para usar criptografia ponta-a-ponta.';

  @override
  String get newChat => 'Nova conversa';

  @override
  String get newMessageInrechainonline => '💬 Nova mensagem no rechain';

  @override
  String get newVerificationRequest => 'Nova solicitação de verificação!';

  @override
  String get next => 'Próximo';

  @override
  String get no => 'Não';

  @override
  String get noConnectionToTheServer => 'Sem conexão com o servidor';

  @override
  String get noEmotesFound => 'Nenhum emoji encontrado. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Você só pode ativar criptografia quando a sala não for mais publicamente acessível.';

  @override
  String get noGoogleServicesWarning =>
      'Aparentemente você não tem serviços Google no seu celular. Para receber notificações no rechain, recomendamos instalar ntfy.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 não é um servidor rechain, usar $server2 talvez?';
  }

  @override
  String get shareInviteLink => 'Compartilhar convite';

  @override
  String get scanQrCode => 'Escanear o código QR';

  @override
  String get none => 'Nenhum';

  @override
  String get noPasswordRecoveryDescription =>
      'Você ainda não adicionou uma forma de recuparar sua senha.';

  @override
  String get noPermission => 'Sem permissão';

  @override
  String get noRoomsFound => 'Nenhuma sala encontrada…';

  @override
  String get notifications => 'Notificações';

  @override
  String get notificationsEnabledForThisAccount =>
      'Notificações habilitadas para esta conta';

  @override
  String numUsersTyping(int count) {
    return '$count usuários estão digitando…';
  }

  @override
  String get obtainingLocation => 'Obtendo localização…';

  @override
  String get offensive => 'Ofensivo';

  @override
  String get offline => 'Desconectado';

  @override
  String get ok => 'Ok';

  @override
  String get online => 'Disponível';

  @override
  String get onlineKeyBackupEnabled => 'Backup de chaves está ativado';

  @override
  String get oopsPushError =>
      'Opa! Infelizmente, um erro ocorreu ao configurar as notificações.';

  @override
  String get oopsSomethingWentWrong => 'Opa, algo deu errado…';

  @override
  String get openAppToReadMessages => 'Abra o app para ler as mensagens';

  @override
  String get openCamera => 'Abra a câmera';

  @override
  String get openVideoCamera => 'Abra a câmera para um vídeo';

  @override
  String get oneClientLoggedOut => 'Um dos seus clientes foi desvinculado';

  @override
  String get addAccount => 'Adicionar conta';

  @override
  String get editBundlesForAccount => 'Editar coleções para esta conta';

  @override
  String get addToBundle => 'Adicionar à coleção';

  @override
  String get removeFromBundle => 'Remover desta coleção';

  @override
  String get bundleName => 'Nome da coleção';

  @override
  String get enableMultiAccounts =>
      '(BETA) Habilitar múltiplas contas neste dispositivo';

  @override
  String get openInMaps => 'Abrir no mapas';

  @override
  String get link => 'Link';

  @override
  String get serverRequiresEmail =>
      'Este servidor precisa validar seu email para efetuar o registro.';

  @override
  String get or => 'Ou';

  @override
  String get participant => 'Participante';

  @override
  String get passphraseOrKey => 'frase secreta ou chave de recuperação';

  @override
  String get password => 'Senha';

  @override
  String get passwordForgotten => 'Esqueci a senha';

  @override
  String get passwordHasBeenChanged => 'Senha foi alterada';

  @override
  String get hideMemberChangesInPublicChats =>
      'Esconder mudanças de membro em chats públicos';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      'Não mostre se alguém entrou ou saiu no chat para melhorar a legibilidade.';

  @override
  String get overview => 'Visão geral';

  @override
  String get notifyMeFor => 'Notificar me para';

  @override
  String get passwordRecoverySettings =>
      'Configurações de recuperação de senha';

  @override
  String get passwordRecovery => 'Recuperação de senha';

  @override
  String get people => 'Pessoas';

  @override
  String get pickImage => 'Escolha uma imagem';

  @override
  String get pin => 'Alfinetar';

  @override
  String play(String fileName) {
    return 'Tocar $fileName';
  }

  @override
  String get pleaseChoose => 'Por favor, selecione';

  @override
  String get pleaseChooseAPasscode => 'Por favor, escolha um código';

  @override
  String get pleaseClickOnLink =>
      'Por favor, clique a ligação no e-mail para prosseguir.';

  @override
  String get pleaseEnter4Digits =>
      'Por favor, insira 4 dígitos ou deixe em branco para desativar a trava do aplicativo.';

  @override
  String get pleaseEnterRecoveryKey =>
      'Por favor, insira sua chave de recuperação:';

  @override
  String get pleaseEnterYourPassword => 'Por favor, insira sua senha';

  @override
  String get pleaseEnterYourPin => 'Por favor, insira seu PIN';

  @override
  String get pleaseEnterYourUsername => 'Por favor, insira seu nome de usuário';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Por favor, siga as instruções no site e toque em próximo.';

  @override
  String get privacy => 'Privacidade';

  @override
  String get publicRooms => 'Salas públicas';

  @override
  String get pushRules => 'Regras de notificação';

  @override
  String get reason => 'Motivo';

  @override
  String get recording => 'Gravando';

  @override
  String redactedBy(String username) {
    return 'Removido por $username';
  }

  @override
  String get directChat => 'Conversa direta';

  @override
  String redactedByBecause(String username, String reason) {
    return 'Removido por $username, pois: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username removeu um evento';
  }

  @override
  String get redactMessage => 'Retratar mensagem';

  @override
  String get register => 'Registrar';

  @override
  String get reject => 'Recusar';

  @override
  String rejectedTheInvitation(String username) {
    return '$username recusou o convite';
  }

  @override
  String get rejoin => 'Retornar';

  @override
  String get removeAllOtherDevices => 'Remover todos os outros dispositivos';

  @override
  String removedBy(String username) {
    return 'Removido por $username';
  }

  @override
  String get removeDevice => 'Remover dispositivo';

  @override
  String get unbanFromChat => 'Revogar banimento';

  @override
  String get removeYourAvatar => 'Remover seu avatar';

  @override
  String get replaceRoomWithNewerVersion =>
      'Substituir sala por uma nova versão';

  @override
  String get reply => 'Responder';

  @override
  String get reportMessage => 'Denunciar mensagem';

  @override
  String get requestPermission => 'Solicitar permissão';

  @override
  String get roomHasBeenUpgraded => 'Sala foi atualizada';

  @override
  String get roomVersion => 'Versão da sala';

  @override
  String get saveFile => 'Salvar arquivo';

  @override
  String get search => 'Buscar';

  @override
  String get security => 'Segurança';

  @override
  String get recoveryKey => 'Chave de recuperação';

  @override
  String get recoveryKeyLost => 'Perdeu a chave de recuperação?';

  @override
  String seenByUser(String username) {
    return 'Visto por $username';
  }

  @override
  String get send => 'Enviar';

  @override
  String get sendAMessage => 'Enviar mensagem';

  @override
  String get sendAsText => 'Enviar como texto';

  @override
  String get sendAudio => 'Enviar audio';

  @override
  String get sendFile => 'Enviar arquivo';

  @override
  String get sendImage => 'Enviar imagem';

  @override
  String get sendMessages => 'Enviar mensagens';

  @override
  String get sendOriginal => 'Enviar original';

  @override
  String get sendSticker => 'Enviar figurinha';

  @override
  String get sendVideo => 'Enviar vídeo';

  @override
  String sentAFile(String username) {
    return '📁 $username enviou um arquivo';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username enviou um audio';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username enviou uma imagem';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username enviou uma figurinha';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username enviou um vídeo';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName enviou informações de chamada';
  }

  @override
  String get separateChatTypes => 'Separar Conversas Diretas e Grupos';

  @override
  String get setAsCanonicalAlias => 'Fixar como cognome principal';

  @override
  String get setCustomEmotes => 'Implantar emojis personalizados';

  @override
  String get setChatDescription => 'Inserir descrição da conversa';

  @override
  String get setInvitationLink => 'Enviar link de convite';

  @override
  String get setPermissionsLevel => 'Determinar níveis de permissão';

  @override
  String get setStatus => 'Alterar o status';

  @override
  String get settings => 'Configurações';

  @override
  String get share => 'Compartilhar';

  @override
  String sharedTheLocation(String username) {
    return '$username compartilhou sua localização';
  }

  @override
  String get shareLocation => 'Compartilhar localização';

  @override
  String get showPassword => 'Mostrar senha';

  @override
  String get presenceStyle => 'Presença:';

  @override
  String get presencesToggle =>
      'Mostrar o status das mensagens de outros usuários';

  @override
  String get singlesignon => 'Identidade Única';

  @override
  String get skip => 'Pular';

  @override
  String get sourceCode => 'Código fonte';

  @override
  String get spaceIsPublic => 'Espaço é público';

  @override
  String get spaceName => 'Nome do espaço';

  @override
  String startedACall(String senderName) {
    return '$senderName iniciou uma chamada';
  }

  @override
  String get startFirstChat => 'Comece seu primeiro chat';

  @override
  String get status => 'Status';

  @override
  String get statusExampleMessage => 'Como vai você?';

  @override
  String get submit => 'Submeter';

  @override
  String get synchronizingPleaseWait => 'Sincronizando… Por favor, aguarde.';

  @override
  String get systemTheme => 'Sistema';

  @override
  String get theyDontMatch => 'Não correspondem';

  @override
  String get theyMatch => 'Correspondem';

  @override
  String get title => 'rechain';

  @override
  String get toggleFavorite => 'Alternar favorito';

  @override
  String get toggleMuted => 'Alternar Silenciado';

  @override
  String get toggleUnread => 'Marcar lido/não lido';

  @override
  String get tooManyRequestsWarning =>
      'Demasiadas requisições. Por favor, tente novamente mais tarde!';

  @override
  String get transferFromAnotherDevice => 'Transferir de outro dispositivo';

  @override
  String get tryToSendAgain => 'Tente enviar novamente';

  @override
  String get unavailable => 'Indisponível';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username revogou o banimento de $targetName';
  }

  @override
  String get unblockDevice => 'Desbloquear dispositivo';

  @override
  String get unknownDevice => 'Dispositivo desconhecido';

  @override
  String get unknownEncryptionAlgorithm =>
      'Algoritmo de criptografia desconhecido';

  @override
  String unknownEvent(String type) {
    return 'Evento desconhecido \'$type\'';
  }

  @override
  String get unmuteChat => 'Cancelar silenciamento';

  @override
  String get unpin => 'Desalfinetar';

  @override
  String unreadChats(int unreadCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount conversas não lidas',
      one: '1 conversa não lida',
    );
    return '$_temp0';
  }

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username e mais $count pessoas estão digitando…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username e $username2 estão digitando…';
  }

  @override
  String userIsTyping(String username) {
    return '$username está digitando…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username saiu da conversa';
  }

  @override
  String get username => 'Nome de usuário';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username enviou um evento $type';
  }

  @override
  String get unverified => 'Não verificado';

  @override
  String get verified => 'Verificado';

  @override
  String get verify => 'Verificar';

  @override
  String get verifyStart => 'Iniciar verificação';

  @override
  String get verifySuccess => 'Verificação efetivada!';

  @override
  String get verifyTitle => 'Verificando outra conta';

  @override
  String get videoCall => 'Vídeochamada';

  @override
  String get visibilityOfTheChatHistory =>
      'Visibilidade do histórico da conversa';

  @override
  String get visibleForAllParticipants => 'Visível aos participantes';

  @override
  String get visibleForEveryone => 'Visível a qualquer pessoa';

  @override
  String get voiceMessage => 'Mensagem de voz';

  @override
  String get waitingPartnerAcceptRequest =>
      'Esperando que a outra pessoa aceite a solicitação…';

  @override
  String get waitingPartnerEmoji =>
      'Esperando que a outra pessoa aceite os emoji…';

  @override
  String get waitingPartnerNumbers =>
      'Aguardando a outra pessoa aceitar os números…';

  @override
  String get wallpaper => 'Pano de fundo:';

  @override
  String get warning => 'Atenção!';

  @override
  String get weSentYouAnEmail => 'Enviamos um e-mail para você';

  @override
  String get whoCanPerformWhichAction => 'Quem pode desempenhar quais ações';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'Quais pessoas são permitidas participar deste grupo';

  @override
  String get whyDoYouWantToReportThis => 'Por que você quer denunciar isto?';

  @override
  String get wipeChatBackup =>
      'Limpar o backup da conversa para criar uma nova chave de recuperação?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Você pode recuperar a sua senha com estes endereços.';

  @override
  String get writeAMessage => 'Escreva uma mensagem…';

  @override
  String get yes => 'Sim';

  @override
  String get you => 'Você';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Você não está mais participando desta conversa';

  @override
  String get youHaveBeenBannedFromThisChat => 'Você foi banido desta conversa';

  @override
  String get yourPublicKey => 'Sua chave pública';

  @override
  String get messageInfo => 'Informações da mensagem';

  @override
  String get time => 'Hora';

  @override
  String get messageType => 'Tipo da mensagem';

  @override
  String get sender => 'Remetente';

  @override
  String get openGallery => 'Abrir galeria';

  @override
  String get removeFromSpace => 'Remover do espaço';

  @override
  String get addToSpaceDescription =>
      'Selecione um espaço para adicionar esta conversa.';

  @override
  String get start => 'Começar';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      'Para destrancar suas mensagens antigas, por favor, insira sua chave de recuperação gerada numa sessão prévia. Suas chave de recuperação NÃO é sua senha.';

  @override
  String get publish => 'Publicar';

  @override
  String videoWithSize(String size) {
    return 'Vídeo ($size)';
  }

  @override
  String get openChat => 'Abrir conversa';

  @override
  String get markAsRead => 'Marcar como lido';

  @override
  String get reportUser => 'Delatar usuário';

  @override
  String get dismiss => 'Descartar';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender reagiu com $reaction';
  }

  @override
  String get pinMessage => 'Afixar à sala';

  @override
  String get confirmEventUnpin =>
      'Tem certeza que quer desafixar o evento permanentemente?';

  @override
  String get emojis => 'Emojis';

  @override
  String get placeCall => 'Chamar';

  @override
  String get voiceCall => 'Chamada de voz';

  @override
  String get unsupportedAndroidVersion => 'Versão Android não suportada';

  @override
  String get unsupportedAndroidVersionLong =>
      'Esta funcionalidade requer uma versão mais nova do Android. Por favor, busque atualizações ou suporte ao Katya ® 👽 OS.';

  @override
  String get videoCallsBetaWarning =>
      'Por favor, note que chamadas de vídeo estão atualmente em teste. Podem não funcionar como esperado ou sequer funcionar em algumas plataformas.';

  @override
  String get experimentalVideoCalls => 'Vídeo chamadas experimentais';

  @override
  String get emailOrUsername => 'Email ou nome de usuário';

  @override
  String get indexedDbErrorTitle => 'Problemas no modo privado';

  @override
  String get indexedDbErrorLong =>
      'Infelizmente, o armazenamento de mensagens não é habilitado por padrão no modo privado.\nPor favor, visite\n- about:config\n- atribua \"true\" a \"dom.indexedDB.privateBrowsing.enabled\"\nDe outro modo, não será possível executar o rechain.';

  @override
  String switchToAccount(String number) {
    return 'Alternar para a conta $number';
  }

  @override
  String get nextAccount => 'Próxima conta';

  @override
  String get previousAccount => 'Conta anterior';

  @override
  String get addWidget => 'Adicionar ferramenta';

  @override
  String get widgetVideo => 'Vídeo';

  @override
  String get widgetEtherpad => 'Anotação';

  @override
  String get widgetJitsi => 'Jitsi Meet';

  @override
  String get widgetCustom => 'Personalizado';

  @override
  String get widgetName => 'Nome';

  @override
  String get widgetUrlError => 'Isto não é uma URL válida.';

  @override
  String get widgetNameError => 'Por favor, forneça um nome de exibição.';

  @override
  String get errorAddingWidget => 'Erro ao adicionar a ferramenta.';

  @override
  String get youRejectedTheInvitation => 'Você rejeitou o convite';

  @override
  String get youJoinedTheChat => 'Você entrou na conversa';

  @override
  String get youAcceptedTheInvitation => '👍 Você aceitou o convite';

  @override
  String youBannedUser(String user) {
    return 'Você baniu $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Você revogou o convite para $user';
  }

  @override
  String youInvitedToBy(String alias) {
    return 'Você foi convidado através do link para:\n$alias';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 Você foi convidado por $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Você convidou $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Você expulsou $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Você expulsou e baniu $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Você revogou o banimento de $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user bateu na porta';
  }

  @override
  String get usersMustKnock => 'Usuários devem bater na porta';

  @override
  String get noOneCanJoin => 'Ninguém pode entrar';

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user gostaria de entrar no chat.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet =>
      'Nenhum link público foi criado ainda';

  @override
  String get knock => 'Bater na porta';

  @override
  String get users => 'Usuários';

  @override
  String get unlockOldMessages => 'Destrancar mensagens antigas';

  @override
  String get storeInSecureStorageDescription =>
      'Guardar a chave de recuperação no armazenamento seguro deste dispositivo.';

  @override
  String get saveKeyManuallyDescription =>
      'Salvar esta chave manualmente via compartilhamento do sistema ou área de transferência.';

  @override
  String get storeInAndroidKeystore => 'Guardar no cofre do Android';

  @override
  String get storeInAppleKeyChain => 'Guardar no chaveiro da Apple';

  @override
  String get storeSecurlyOnThisDevice =>
      'Guardar de modo seguro neste dispositivo';

  @override
  String countFiles(int count) {
    return '$count arquivos';
  }

  @override
  String get user => 'Usuário';

  @override
  String get custom => 'Personalizado';

  @override
  String get foregroundServiceRunning =>
      'Esta notificação aparece quando um serviço está executando.';

  @override
  String get screenSharingTitle => 'Compartilhar tela';

  @override
  String get screenSharingDetail =>
      'Você está compartilhando sua tela no rechain';

  @override
  String get callingPermissions => 'Permissões de chamada';

  @override
  String get callingAccount => 'Conta para chamadas';

  @override
  String get callingAccountDetails =>
      'Permitir que o rechain use o app de chamadas nativo do Android.';

  @override
  String get appearOnTop => 'Aparecer no topo';

  @override
  String get appearOnTopDetails =>
      'Permitir que o app apareça no topo (desnecessário caso rechain já esteja configurado como conta para chamadas)';

  @override
  String get otherCallingPermissions =>
      'Microfone, câmera e outras permissões do rechain';

  @override
  String get whyIsThisMessageEncrypted =>
      'Por que esta mensagem está ilegível?';

  @override
  String get noKeyForThisMessage =>
      'Isto pode ocorrer caso a mensagem tenha sido enviada antes da entrada na sua conta com este dispositivo.\n\nTambém é possível que o remetente tenha bloqueado o seu dispositivo ou ocorreu algum problema com a conexão.\n\nVocê consegue ler as mensagens em outra sessão? Então, pode transferir as mensagens de lá! Vá em Configurações > Dispositivos e confira se os dispositivos verificaram um ao outro. Quando abrir a sala da próxima vez e ambas as sessões estiverem abertas, as chaves serão transmitidas automaticamente.\n\nNão gostaria de perder suas chaves quando sair ou trocar de dispositivos? Certifique-se que o backup de conversas esteja habilitado nas configurações.';

  @override
  String get newGroup => 'Novo grupo';

  @override
  String get newSpace => 'Novo espaço';

  @override
  String get enterSpace => 'Entrar no espaço';

  @override
  String get enterRoom => 'Entrar na conversa';

  @override
  String get allSpaces => 'Todos espaços';

  @override
  String numChats(String number) {
    return '$number conversas';
  }

  @override
  String get hideUnimportantStateEvents => 'Ocultar eventos desimportantes';

  @override
  String get hidePresences => 'Esconder lista de status?';

  @override
  String get doNotShowAgain => 'Não mostrar novamente';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Conversa vazia (era $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Espaços permitem que você consolide suas conversas e construa comunidades públicas ou privadas.';

  @override
  String get encryptThisChat => 'Encriptar esta conversa';

  @override
  String get disableEncryptionWarning =>
      'Por razões de segurança, não possível desabilitar a encriptação uma vez habilitada.';

  @override
  String get sorryThatsNotPossible => 'Desculpe... isto não é possível';

  @override
  String get deviceKeys => 'Chaves de dispositivo:';

  @override
  String get reopenChat => 'Reabrir conversa';

  @override
  String get noBackupWarning =>
      'Atenção! Sem habilitar o backup de conversa, você perderá acesso a suas mensagens encriptadas. É altamente recomendável habilitar o backup antes de encerrar a sessão.';

  @override
  String get noOtherDevicesFound => 'Nenhum outro dispositivo encontrado';

  @override
  String fileIsTooBigForServer(String max) {
    return 'O servidor avisa que o arquivo é grande demais para ser enviado.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Arquivo salvo em $path';
  }

  @override
  String get jumpToLastReadMessage => 'Pular para a última mensagem lida';

  @override
  String get readUpToHere => 'Marcar como lido até aqui';

  @override
  String get jump => 'Pular';

  @override
  String get openLinkInBrowser => 'Abrir no navegador';

  @override
  String get reportErrorDescription =>
      '😭 Ah, não. Algo deu errado. Se quiser, pode relatar isto aos desenvolvedores.';

  @override
  String get report => 'Relatar';

  @override
  String get signInWithPassword => 'Autenticar com senha';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      'Por favor, tente novamente mais tarde ou escolha um servidor diferente.';

  @override
  String signInWith(String provider) {
    return 'Autenticar com $provider';
  }

  @override
  String get profileNotFound =>
      'O usuário não foi encontrado neste servidor. Talvez um problema de conexão ou o usuário não existe.';

  @override
  String get setTheme => 'Aplicar tema:';

  @override
  String get setColorTheme => 'Aplicar paleta de cor:';

  @override
  String get invite => 'Convidar';

  @override
  String get inviteGroupChat => '📨 Convidar para o grupo';

  @override
  String get invitePrivateChat => '📨 Convidar para uma conversa privada';

  @override
  String get invalidInput => 'Inserção inválida!';

  @override
  String wrongPinEntered(int seconds) {
    return 'PIN incorreto! Tente novamente em $seconds segundos...';
  }

  @override
  String get pleaseEnterANumber => 'Por favor, insira um número maior que 0';

  @override
  String get archiveRoomDescription =>
      'A conversa será movida para o arquivo. Outros usuários verão que você deixou a conversa.';

  @override
  String get roomUpgradeDescription =>
      'A conversa será recriada com a nova versão de sala. Todos participantes será notificados e terão que migrar para a nova sala. Você pode encontrar mais informações sobre versões de sala em https://spec.rechain.org/latest/room/';

  @override
  String get removeDevicesDescription =>
      'Você encerrará a sessão neste dispositivo e não poderá mais receber mensagens.';

  @override
  String get banUserDescription =>
      'O usuário será banido da conversa e não poderá participar novamente até que isto seja revogado.';

  @override
  String get unbanUserDescription =>
      'O usuário poderá ingressar novamente na conversa, caso tente.';

  @override
  String get kickUserDescription =>
      'O usuário foi enxotado da conversa, mas não banido. Em conversas públicas, o usuário pode reingressar a qualquer momento.';

  @override
  String get makeAdminDescription =>
      'Assim que promover este usuário a administrador, não poderá desfazê-lo e ele terá as mesmas permissões que você.';

  @override
  String get pushNotificationsNotAvailable =>
      'Notificações não estão  disponíveis';

  @override
  String get learnMore => 'Saiba mais';

  @override
  String get yourGlobalUserIdIs => 'Seu ID global é: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Infelizmente, não foi encontrado usuário via \"$query\". Por favor, verifique se digitou corretamente.';
  }

  @override
  String get knocking => 'Batendo na porta';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'O chat pode ser descoberto pela pesquisa em $server';
  }

  @override
  String get searchChatsRooms => 'Buscar por #conversas, @usuários...';

  @override
  String get nothingFound => 'Nada foi encontrado...';

  @override
  String get groupName => 'Nome do grupo';

  @override
  String get createGroupAndInviteUsers => 'Criar um grupo e convidar pessoas';

  @override
  String get groupCanBeFoundViaSearch =>
      'Grupos podem ser encontrados via busca';

  @override
  String get wrongRecoveryKey =>
      'Desculpe... esta não parece ser a chave de recuperação correta.';

  @override
  String get startConversation => 'Começar uma conversa';

  @override
  String get commandHint_sendraw => 'Enviar JSON puro';

  @override
  String get databaseMigrationTitle => 'Banco de dados otimizado';

  @override
  String get databaseMigrationBody =>
      'Por favor, espere. Isto pode demorar um pouco.';

  @override
  String get leaveEmptyToClearStatus =>
      'Deixe em branco para limpar seu Status.';

  @override
  String get select => 'Selecionar';

  @override
  String get searchForUsers => 'Buscar por @usuários...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Por favor, insira sua senha atual';

  @override
  String get newPassword => 'Nova senha';

  @override
  String get pleaseChooseAStrongPassword =>
      'Por favor, escolha uma senha forte';

  @override
  String get passwordsDoNotMatch => 'Senhas não batem';

  @override
  String get passwordIsWrong => 'A senha inserida está incorreta';

  @override
  String get publicLink => 'Link público';

  @override
  String get publicChatAddresses => 'Endereços de chat públicos';

  @override
  String get createNewAddress => 'Criar um novo endereço';

  @override
  String get joinSpace => 'Ingressar no espaço';

  @override
  String get publicSpaces => 'Espaços públicos';

  @override
  String get addChatOrSubSpace => 'Adicionar conversa ou subespaço';

  @override
  String get subspace => 'Subespaço';

  @override
  String get decline => 'Rejeitar';

  @override
  String get thisDevice => 'Este dispositivo:';

  @override
  String get initAppError =>
      'Ocorreu um erro enquanto o aplicativo era iniciado';

  @override
  String get userRole => 'Cargo do usuário';

  @override
  String minimumPowerLevel(String level) {
    return '$level é o nível mínimo de poder.';
  }

  @override
  String searchIn(String chat) {
    return 'Pesquisar em $chat...';
  }

  @override
  String get searchMore => 'Pesquisar mais...';

  @override
  String get gallery => 'Galeria';

  @override
  String get files => 'Arquivos';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return 'Não foi possível construir o banco de dados SQLite. O aplicativo tentará utilizar o banco de dados legado por enquanto. Por favor, reporte este erro aos desenvolvedores em $url. A mensagem de erro é: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'Sua sessão foi desconectada. Por favor, reporte este ao desenvolvedor em $url. A mensagem de erro é: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'O aplicativo tentará agora restaurar sua sessão a partir do backup. Por favor, reporte este ao desenvolvedor em $url. A mensagem de erro é: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'Encaminhar mensagem para $roomName?';
  }

  @override
  String get sendReadReceipts => 'Enviar recibos de leitura';

  @override
  String get sendTypingNotificationsDescription =>
      'Outros participantes neste chat podem ver quando você está digitando uma nova mensagem.';

  @override
  String get sendReadReceiptsDescription =>
      'Outros participantes neste chat podem ver quando você tiver lido uma mensagem.';

  @override
  String get formattedMessages => 'Mensagens formatadas';

  @override
  String get formattedMessagesDescription =>
      'Mostrar mensagens ricas com conteúdos tipo negrito usando markdown.';

  @override
  String get verifyOtherUser => '🔐 Verificar outro usuário';

  @override
  String get verifyOtherUserDescription =>
      'Se você verificar outro usuário, você terá certeza que você conhece com quem está conversando. 💪\n\nQuando iniciar uma verificação, você e o outro usuário receberão um popup no aplicativo. Então vocês receberão uma série de emojis ou números para comparar um com o outro.\n\nA melhor maneira de fazer este procedimento é encontrar pessoalmente ou através de um vídeochamada. 👭';

  @override
  String get verifyOtherDevice => '🔐 Verificar outro aparelho';

  @override
  String get verifyOtherDeviceDescription =>
      'Quando você verifica outro aparelho, estes aparelhos poderão trocar chaves, aumentando sua segurança. 💪\n\nQuando iniciar a verificação, um popup aparecerá no aplicativo em ambos os aparelhos. Então você verá uma série de emojis ou números que você terá que comparar um com o outro.\n\nÉ melhor fazer esse procedimento com ambos os aparelhos em mãos antes de começar a verificação. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender aceitou sua chave de verificação';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender cancelou sua chave de verificação';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender completou a chave de verificação';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender está pronto para a chave de verificação';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender enviou uma chave de verificação';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender iniciou a chave de verificação';
  }

  @override
  String get transparent => 'Transparente';

  @override
  String get incomingMessages => 'Mensagens recebidas';

  @override
  String get stickers => 'Stickers';

  @override
  String get discover => 'Descubra';

  @override
  String get commandHint_ignore => 'Ignorar o seguinte ID rechain';

  @override
  String get commandHint_unignore => 'Designorar o seguinte ID rechain';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread mensagens não lidas';
  }

  @override
  String get noDatabaseEncryption =>
      'A criptografia do banco de dados não é suportada nesta plataforma';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Nesse momento, há $count usuários bloqueados.';
  }

  @override
  String get restricted => 'Restrito';

  @override
  String get knockRestricted => 'Bater na porta restrito';

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Se você excluir esta configuração de notificação, isso não pode ser desfeito.';

  @override
  String get more => 'Mais';

  @override
  String get shareKeysWith => 'Compartilhar chaves com...';
}

/// The translations for Portuguese, as used in Portugal (`pt_PT`).
class L10nPtPt extends L10nPt {
  L10nPtPt() : super('pt_PT');

  @override
  String get repeatPassword => 'Repete a palavra-passe';

  @override
  String get remove => 'Remover';

  @override
  String get about => 'Acerca de';

  @override
  String get accept => 'Aceitar';

  @override
  String acceptedTheInvitation(String username) {
    return '$username aceitou o convite';
  }

  @override
  String get account => 'Conta';

  @override
  String activatedEndToEndEncryption(String username) {
    return '$username ativou encriptação ponta-a-ponta';
  }

  @override
  String get addEmail => 'Adicionar correio eletrónico';

  @override
  String get addToSpace => 'Adicionar ao espaço';

  @override
  String get admin => 'Admin';

  @override
  String get alias => 'alcunha';

  @override
  String get all => 'Todos(as)';

  @override
  String get allChats => 'Todas as conversas';

  @override
  String answeredTheCall(String senderName) {
    return '$senderName atendeu a chamada';
  }

  @override
  String get anyoneCanJoin => 'Qualquer pessoa pode entrar';

  @override
  String get appLock => 'Bloqueio da aplicação';

  @override
  String get archive => 'Arquivo';

  @override
  String get areGuestsAllowedToJoin => 'Todos os visitantes podem entrar';

  @override
  String get areYouSure => 'Tens a certeza?';

  @override
  String get areYouSureYouWantToLogout => 'Tens a certeza que queres sair?';

  @override
  String get askSSSSSign =>
      'Para poderes assinar a outra pessoa, por favor, insere a tua senha de armazenamento seguro ou a chave de recuperação.';

  @override
  String askVerificationRequest(String username) {
    return 'Aceitar este pedido de verificação de $username?';
  }

  @override
  String get autoplayImages =>
      'Automaticamente reproduzir autocolantes e emotes animados';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return 'O servidor suporta os tipos de início de sessão:\n$serverVersions\nMas esta aplicação apenas suporta:\n$suportedVersions';
  }

  @override
  String get sendOnEnter => 'Enviar com Enter';

  @override
  String badServerVersionsException(
      String serverVersions,
      String supportedVersions,
      Object serverVerions,
      Object supoortedVersions,
      Object suportedVersions) {
    return 'O servidor suporta as versões Spec:\n$serverVersions\nMas esta aplicação apenas suporta $suportedVersions';
  }

  @override
  String get banFromChat => 'Banir da conversa';

  @override
  String get banned => 'Banido(a)';

  @override
  String bannedUser(String username, String targetName) {
    return '$username baniu $targetName';
  }

  @override
  String get blockDevice => 'Bloquear dispositivo';

  @override
  String get blocked => 'Bloqueado';

  @override
  String get botMessages => 'Mensagens de robôs';

  @override
  String get cancel => 'Cancelar';

  @override
  String cantOpenUri(String uri) {
    return 'Não é possível abrir o URI $uri';
  }

  @override
  String get changeDeviceName => 'Alterar nome do dispositivo';

  @override
  String changedTheChatAvatar(String username) {
    return '$username alterou o avatar da conversa';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username alterou a descrição da conversa para: \'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username alterou o nome da conversa para: \'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username alterou as permissões da conversa';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username alterou o seu nome para: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username alterou as regras de acesso de visitantes';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username alterou as regras de acesso de visitantes para: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username alterou a visibilidade do histórico';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username alterou a visibilidade do histórico para: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username alterou as regras de entrada';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username alterou as regras de entrada para: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username alterou o seu avatar';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username alterou as alcunhas da sala';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username alterou a ligação de convite';
  }

  @override
  String get changePassword => 'Alterar palavra-passe';

  @override
  String get changeTheHomeserver => 'Alterar o servidor';

  @override
  String get changeTheme => 'Alterar o teu estilo';

  @override
  String get changeTheNameOfTheGroup => 'Alterar o nome do grupo';

  @override
  String get changeYourAvatar => 'Alterar o teu avatar';

  @override
  String get channelCorruptedDecryptError => 'A encriptação foi corrompida';

  @override
  String get chat => 'Conversa';

  @override
  String get yourChatBackupHasBeenSetUp =>
      'A cópia de segurança foi configurada.';

  @override
  String get chatBackup => 'Cópia de segurança de conversas';

  @override
  String get chatBackupDescription =>
      'A tuas mensagens antigas estão protegidas com uma chave de recuperação. Por favor, certifica-te que não a perdes.';

  @override
  String get chatDetails => 'Detalhes de conversa';

  @override
  String get chatHasBeenAddedToThisSpace =>
      'A conversa foi adicionada a este espaço';

  @override
  String get chats => 'Conversas';

  @override
  String get chooseAStrongPassword => 'Escolhe uma palavra-passe forte';

  @override
  String get clearArchive => 'Limpar arquivo';

  @override
  String get close => 'Fechar';

  @override
  String get commandHint_ban => 'Banir o utilizador dado desta sala';

  @override
  String get commandHint_clearcache => 'Limpar cache';

  @override
  String get commandHint_create =>
      'Criar uma conversa de grupo vazia\nUsa --no-encryption para desativar a encriptação';

  @override
  String get commandHint_discardsession => 'Descartar sessão';

  @override
  String get commandHint_dm =>
      'Iniciar uma conversa direta\nUsa --no-encryption para desativar a encriptação';

  @override
  String get commandHint_html => 'Enviar texto formatado com HTML';

  @override
  String get commandHint_invite => 'Convidar o utilizador dado a esta sala';

  @override
  String get commandHint_join => 'Entrar na sala dada';

  @override
  String get commandHint_kick => 'Remover o utilizador dado desta sala';

  @override
  String get commandHint_leave => 'Sair desta sala';

  @override
  String get commandHint_me => 'Descreve-te';

  @override
  String get commandHint_myroomavatar =>
      'Definir a tua imagem para esta sala (por mxc-uri)';

  @override
  String get commandHint_myroomnick => 'Definir o teu nome para esta sala';

  @override
  String get commandHint_op =>
      'Definir o nível de poder do utilizador dado (por omissão: 50)';

  @override
  String get commandHint_plain => 'Enviar texto não formatado';

  @override
  String get commandHint_react => 'Enviar respostas como reações';

  @override
  String get commandHint_send => 'Enviar texto';

  @override
  String get commandHint_unban => 'Perdoar o utilizador dado';

  @override
  String get commandInvalid => 'Comando inválido';

  @override
  String commandMissing(String command) {
    return '$command não é um comando.';
  }

  @override
  String get compareEmojiMatch =>
      'Compara e certifica-te que os emojis que se seguem correspondem aos do outro dispositivo:';

  @override
  String get compareNumbersMatch =>
      'Compara e certifica-te que os números que se seguem correspondem aos do outro dispositivo:';

  @override
  String get configureChat => 'Configurar conversa';

  @override
  String get confirm => 'Confirmar';

  @override
  String get connect => 'Ligar';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'O contacto foi convidado para o grupo';

  @override
  String get containsDisplayName => 'Contém nome de exibição';

  @override
  String get containsUserName => 'Contém nome de utilizador';

  @override
  String get contentHasBeenReported =>
      'O conteúdo foi denunciado aos admins do servidor';

  @override
  String get copiedToClipboard => 'Copiado para a área de transferência';

  @override
  String get copy => 'Copiar';

  @override
  String get copyToClipboard => 'Copiar para a área de transferência';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Não foi possível desencriptar mensagem: $error';
  }

  @override
  String countParticipants(int count) {
    return '$count participantes';
  }

  @override
  String get create => 'Criar';

  @override
  String createdTheChat(String username) {
    return '$username criou a conversa';
  }

  @override
  String get createNewSpace => 'Novo espaço';

  @override
  String get currentlyActive => 'Ativo(a) agora';

  @override
  String get darkTheme => 'Escuro';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date às $timeOfDay';
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
      'Isto irá desativar a tua conta. Não é reversível! Tens a certeza?';

  @override
  String get defaultPermissionLevel => 'Nível de permissão normal';

  @override
  String get delete => 'Eliminar';

  @override
  String get deleteAccount => 'Eliminar conta';

  @override
  String get deleteMessage => 'Eliminar mensagem';

  @override
  String get device => 'Dispositivo';

  @override
  String get deviceId => 'ID de dispositivo';

  @override
  String get devices => 'Dispositivos';

  @override
  String get directChats => 'Conversas diretas';

  @override
  String get displaynameHasBeenChanged => 'Nome de exibição alterado';

  @override
  String get downloadFile => 'Descarregar ficheiro';

  @override
  String get edit => 'Editar';

  @override
  String get editBlockedServers => 'Editar servidores bloqueados';

  @override
  String get editDisplayname => 'Editar nome de exibição';

  @override
  String get editRoomAliases => 'Editar alcunhas da sala';

  @override
  String get editRoomAvatar => 'Editar avatar da sala';

  @override
  String get emoteExists => 'Emote já existente!';

  @override
  String get emoteInvalid => 'Código de emote inválido!';

  @override
  String get emotePacks => 'Pacotes de emotes da sala';

  @override
  String get emoteSettings => 'Configurações de emotes';

  @override
  String get emoteShortcode => 'Código do emote';

  @override
  String get emoteWarnNeedToPick =>
      'Precisas de escolher um código de emote e uma imagem!';

  @override
  String get emptyChat => 'Conversa vazia';

  @override
  String get enableEmotesGlobally => 'Ativar pacote de emotes globalmente';

  @override
  String get enableEncryption => 'Ativar encriptação';

  @override
  String get enableEncryptionWarning =>
      'Nunca mais poderás desativar a encriptação. Tens a certeza?';

  @override
  String get encrypted => 'Encriptada';

  @override
  String get encryption => 'Encriptação';

  @override
  String get encryptionNotEnabled => 'A encriptação não está ativada';

  @override
  String endedTheCall(String senderName) {
    return '$senderName terminou a chamada';
  }

  @override
  String get enterAnEmailAddress => 'Insere um endereço de correio eletrónico';

  @override
  String get homeserver => 'Servidor';

  @override
  String get enterYourHomeserver => 'Insere o teu servidor';

  @override
  String errorObtainingLocation(String error) {
    return 'Erro ao obter localização: $error';
  }

  @override
  String get everythingReady => 'Tudo a postos!';

  @override
  String get extremeOffensive => 'Extremamente ofensivo';

  @override
  String get fileName => 'Nome do ficheiro';

  @override
  String get rechain => 'rechain';

  @override
  String get fontSize => 'Tamanho da letra';

  @override
  String get forward => 'Reencaminhar';

  @override
  String get goToTheNewRoom => 'Ir para a nova sala';

  @override
  String get group => 'Grupo';

  @override
  String get groupIsPublic => 'O grupo é público';

  @override
  String get groups => 'Grupos';

  @override
  String groupWith(String displayname) {
    return 'Grupo com $displayname';
  }

  @override
  String get guestsAreForbidden => 'São proibidos visitantes';

  @override
  String get guestsCanJoin => 'Podem entrar visitantes';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username revogou o convite para $targetName';
  }

  @override
  String get help => 'Ajuda';

  @override
  String get hideRedactedEvents => 'Esconder eventos eliminados';

  @override
  String get howOffensiveIsThisContent => 'Quão ofensivo é este conteúdo?';

  @override
  String get id => 'ID';

  @override
  String get identity => 'Identidade';

  @override
  String get iHaveClickedOnLink => 'Eu cliquei na ligação';

  @override
  String get incorrectPassphraseOrKey =>
      'Senha ou chave de recuperação incorretos';

  @override
  String get inoffensive => 'Inofensivo';

  @override
  String get inviteContact => 'Convidar contacto';

  @override
  String inviteContactToGroup(String groupName) {
    return 'Convidar contacto para $groupName';
  }

  @override
  String get invited => 'Convidado(a)';

  @override
  String invitedUser(String username, String targetName) {
    return '$username convidou $targetName';
  }

  @override
  String get invitedUsersOnly => 'Utilizadores(as) convidados(as) apenas';

  @override
  String get inviteForMe => 'Convite para mim';

  @override
  String inviteText(String username, String link) {
    return '$username convidou-te para o rechain.\n1. Instala o rechain: https://https://online.rechain.network\n2. Regista-te ou inicia sessão.\n3. Abre a ligação de convite: $link';
  }

  @override
  String get isTyping => 'está a escrever…';

  @override
  String joinedTheChat(String username) {
    return '$username entrou na conversa';
  }

  @override
  String get joinRoom => 'Entrar na sala';

  @override
  String kicked(String username, String targetName) {
    return '$username expulsou $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '$username expulsou e baniu $targetName';
  }

  @override
  String get kickFromChat => 'Expulsar da conversa';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Ativo(a) pela última vez: $localizedTimeShort';
  }

  @override
  String get leave => 'Sair';

  @override
  String get leftTheChat => 'Saiu da conversa';

  @override
  String get license => 'Licença';

  @override
  String get lightTheme => 'Claro';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Carregar mais $count participantes';
  }

  @override
  String get dehydrate => 'Exportar sessão e limpar dispositivo';

  @override
  String get dehydrateWarning =>
      'Esta ação não pode ser revertida. Assegura-te que guardas bem a cópia de segurança.';

  @override
  String get dehydrateTor => 'Utilizadores do TOR: Exportar sessão';

  @override
  String get dehydrateTorLong =>
      'Para utilizadores do TOR, é recomendado exportar a sessão antes de fechar a janela.';

  @override
  String get hydrateTor => 'Utilizadores do TOR: Importar sessão';

  @override
  String get hydrateTorLong =>
      'Exportaste a tua sessão na última vez que estiveste no TOR? Importa-a rapidamente e continua a conversar.';

  @override
  String get hydrate => 'Restaurar a partir de cópia de segurança';

  @override
  String get loadingPleaseWait => 'A carregar... Por favor aguarde.';

  @override
  String get loadMore => 'Carregar mais…';

  @override
  String get locationDisabledNotice =>
      'Os serviços de localização estão desativados. Por favor, ativa-os para poder partilhar a sua localização.';

  @override
  String get locationPermissionDeniedNotice =>
      'Permissão de localização recusada. Por favor, concede permissão para poderes partilhar a tua posição.';

  @override
  String get login => 'Entrar';

  @override
  String logInTo(String homeserver) {
    return 'Entrar em $homeserver';
  }

  @override
  String get logout => 'Sair';

  @override
  String get memberChanges => 'Alterações de membros';

  @override
  String get mention => 'Mencionar';

  @override
  String get messages => 'Mensagens';

  @override
  String get moderator => 'Moderador';

  @override
  String get muteChat => 'Silenciar conversa';

  @override
  String get needPantalaimonWarning => 'Por favor,';

  @override
  String get newChat => 'Nova conversa';

  @override
  String get newMessageInrechainonline => 'Nova mensagem no rechain';

  @override
  String get newVerificationRequest => 'Novo pedido de verificação!';

  @override
  String get next => 'Próximo';

  @override
  String get no => 'Não';

  @override
  String get noConnectionToTheServer => 'Nenhuma ligação ao servidor';

  @override
  String get noEmotesFound => 'Nenhuns emotes encontrados. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Só podes ativar a encriptação quando a sala não for publicamente acessível.';

  @override
  String get noGoogleServicesWarning =>
      'Parece que não tens nenhuns serviços da Google no seu telemóvel. É uma boa decisão para a sua privacidade! Para receber notificações instantâneas no rechain, recomendamos que uses https://microg.org/ ou https://unifiedpush.org/.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 não é um servidor rechain, usar $server2?';
  }

  @override
  String get none => 'Nenhum';

  @override
  String get noPasswordRecoveryDescription =>
      'Ainda não adicionaste uma forma de recuperar a tua palavra-passe.';

  @override
  String get noPermission => 'Sem permissão';

  @override
  String get noRoomsFound => 'Não foram encontradas nenhumas salas…';

  @override
  String get notifications => 'Notificações';

  @override
  String get notificationsEnabledForThisAccount =>
      'Notificações ativadas para esta conta';

  @override
  String numUsersTyping(int count) {
    return 'Estão $count utilizadores(as) a escrever…';
  }

  @override
  String get obtainingLocation => 'A obter localização…';

  @override
  String get offensive => 'Offensivo';

  @override
  String get offline => 'Offline';

  @override
  String get ok => 'ok';

  @override
  String get online => 'Online';

  @override
  String get onlineKeyBackupEnabled =>
      'A cópia de segurança online de chaves está ativada';

  @override
  String get oopsPushError =>
      'Ups! Infelizmente, ocorreu um erro ao configurar as notificações instantâneas.';

  @override
  String get oopsSomethingWentWrong => 'Ups, algo correu mal…';

  @override
  String get openAppToReadMessages => 'Abrir aplicação para ler mensagens';

  @override
  String get openCamera => 'Abrir câmara';

  @override
  String get oneClientLoggedOut => 'Um dos teus clientes terminou sessão';

  @override
  String get addAccount => 'Adicionar conta';

  @override
  String get editBundlesForAccount => 'Editar pacotes para esta conta';

  @override
  String get addToBundle => 'Adicionar ao pacote';

  @override
  String get removeFromBundle => 'Remover deste pacote';

  @override
  String get bundleName => 'Nome do pacote';

  @override
  String get enableMultiAccounts =>
      '(BETA) Ativar múltiplas contas neste dispositivo';

  @override
  String get openInMaps => 'Abrir nos mapas';

  @override
  String get link => 'Ligação';

  @override
  String get serverRequiresEmail =>
      'Este servidor precisa de validar o teu endereço de correio eletrónico para o registo.';

  @override
  String get or => 'Ou';

  @override
  String get participant => 'Participante';

  @override
  String get passphraseOrKey => 'senha ou chave de recuperação';

  @override
  String get password => 'Palavra-passe';

  @override
  String get passwordForgotten => 'Palavra-passe esquecida';

  @override
  String get passwordHasBeenChanged => 'A palavra-passe foi alterada';

  @override
  String get passwordRecovery => 'Recuperação de palavra-passe';

  @override
  String get people => 'Pessoas';

  @override
  String get pickImage => 'Escolher uma imagem';

  @override
  String get pin => 'Afixar';

  @override
  String play(String fileName) {
    return 'Reproduzir $fileName';
  }

  @override
  String get pleaseChoose => 'Por favor, escolhe';

  @override
  String get pleaseChooseAPasscode => 'Por favor, escolhe um código-passe';

  @override
  String get pleaseClickOnLink =>
      'Por favor, clica na ligação no correio eletrónico e depois continua.';

  @override
  String get pleaseEnter4Digits =>
      'Por favor, insere 4 dígitos ou deixa vazio para desativar o bloqueio da aplicação.';

  @override
  String get pleaseEnterYourPassword => 'Por favor, insere a tua palavra-passe';

  @override
  String get pleaseEnterYourPin => 'Por favor, insere o teu código';

  @override
  String get pleaseEnterYourUsername =>
      'Por favor, insere o teu nome de utilizador';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Por favor, segue as instruções no website e clica em \"Seguinte\".';

  @override
  String get privacy => 'Privacidade';

  @override
  String get publicRooms => 'Salas públicas';

  @override
  String get reason => 'Razão';

  @override
  String get recording => 'A gravar';

  @override
  String redactedAnEvent(String username) {
    return '$username eliminou um evento';
  }

  @override
  String get redactMessage => 'Eliminar mensagem';

  @override
  String get register => 'Registar';

  @override
  String get reject => 'Rejeitar';

  @override
  String rejectedTheInvitation(String username) {
    return '$username rejeitou o convite';
  }

  @override
  String get rejoin => 'Reentrar';

  @override
  String get removeAllOtherDevices => 'Remover todos os outros dispositivos';

  @override
  String removedBy(String username) {
    return 'Removido por $username';
  }

  @override
  String get removeDevice => 'Remover dispositivo';

  @override
  String get unbanFromChat => 'Perdoar nesta conversa';

  @override
  String get removeYourAvatar => 'Remover o teu avatar';

  @override
  String get replaceRoomWithNewerVersion =>
      'Substituir sala com versão mais recente';

  @override
  String get reply => 'Responder';

  @override
  String get reportMessage => 'Reportar mensagem';

  @override
  String get requestPermission => 'Pedir permissão';

  @override
  String get roomHasBeenUpgraded => 'A sala foi atualizada';

  @override
  String get roomVersion => 'Versão da sala';

  @override
  String get saveFile => 'Guardar ficheiro';

  @override
  String get search => 'Procurar';

  @override
  String get security => 'Segurança';

  @override
  String seenByUser(String username) {
    return 'Visto por $username';
  }

  @override
  String get send => 'Enviar';

  @override
  String get sendAMessage => 'Enviar a mensagem';

  @override
  String get sendAsText => 'Enviar como texto';

  @override
  String get sendAudio => 'Enviar áudio';

  @override
  String get sendFile => 'Enviar ficheiro';

  @override
  String get sendImage => 'Enviar imagem';

  @override
  String get sendMessages => 'Enviar mensagens';

  @override
  String get sendOriginal => 'Enviar original';

  @override
  String get sendSticker => 'Enviar autocolante';

  @override
  String get sendVideo => 'Enviar vídeo';

  @override
  String sentAFile(String username) {
    return '$username enviar um ficheiro';
  }

  @override
  String sentAnAudio(String username) {
    return '$username enviar um áudio';
  }

  @override
  String sentAPicture(String username) {
    return '$username enviar uma imagem';
  }

  @override
  String sentASticker(String username) {
    return '$username enviou um autocolante';
  }

  @override
  String sentAVideo(String username) {
    return '$username enviou um vídeo';
  }
}
