import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_ar.dart' deferred as l10n_ar;
import 'l10n_be.dart' deferred as l10n_be;
import 'l10n_bn.dart' deferred as l10n_bn;
import 'l10n_bo.dart' deferred as l10n_bo;
import 'l10n_ca.dart' deferred as l10n_ca;
import 'l10n_cs.dart' deferred as l10n_cs;
import 'l10n_da.dart' deferred as l10n_da;
import 'l10n_de.dart' deferred as l10n_de;
import 'l10n_el.dart' deferred as l10n_el;
import 'l10n_en.dart' deferred as l10n_en;
import 'l10n_eo.dart' deferred as l10n_eo;
import 'l10n_es.dart' deferred as l10n_es;
import 'l10n_et.dart' deferred as l10n_et;
import 'l10n_eu.dart' deferred as l10n_eu;
import 'l10n_fa.dart' deferred as l10n_fa;
import 'l10n_fi.dart' deferred as l10n_fi;
import 'l10n_fil.dart' deferred as l10n_fil;
import 'l10n_fr.dart' deferred as l10n_fr;
import 'l10n_ga.dart' deferred as l10n_ga;
import 'l10n_gl.dart' deferred as l10n_gl;
import 'l10n_he.dart' deferred as l10n_he;
import 'l10n_hi.dart' deferred as l10n_hi;
import 'l10n_hr.dart' deferred as l10n_hr;
import 'l10n_hu.dart' deferred as l10n_hu;
import 'l10n_ia.dart' deferred as l10n_ia;
import 'l10n_id.dart' deferred as l10n_id;
import 'l10n_ie.dart' deferred as l10n_ie;
import 'l10n_it.dart' deferred as l10n_it;
import 'l10n_ja.dart' deferred as l10n_ja;
import 'l10n_ka.dart' deferred as l10n_ka;
import 'l10n_ko.dart' deferred as l10n_ko;
import 'l10n_lt.dart' deferred as l10n_lt;
import 'l10n_lv.dart' deferred as l10n_lv;
import 'l10n_nb.dart' deferred as l10n_nb;
import 'l10n_nl.dart' deferred as l10n_nl;
import 'l10n_pl.dart' deferred as l10n_pl;
import 'l10n_pt.dart' deferred as l10n_pt;
import 'l10n_ro.dart' deferred as l10n_ro;
import 'l10n_ru.dart' deferred as l10n_ru;
import 'l10n_sk.dart' deferred as l10n_sk;
import 'l10n_sl.dart' deferred as l10n_sl;
import 'l10n_sr.dart' deferred as l10n_sr;
import 'l10n_sv.dart' deferred as l10n_sv;
import 'l10n_ta.dart' deferred as l10n_ta;
import 'l10n_te.dart' deferred as l10n_te;
import 'l10n_th.dart' deferred as l10n_th;
import 'l10n_tr.dart' deferred as l10n_tr;
import 'l10n_uk.dart' deferred as l10n_uk;
import 'l10n_vi.dart' deferred as l10n_vi;
import 'l10n_yue.dart' deferred as l10n_yue;
import 'l10n_zh.dart' deferred as l10n_zh;

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n)!;
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ar'),
    Locale('be'),
    Locale('bn'),
    Locale('bo'),
    Locale('ca'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('eo'),
    Locale('es'),
    Locale('et'),
    Locale('eu'),
    Locale('fa'),
    Locale('fi'),
    Locale('fil'),
    Locale('fr'),
    Locale('ga'),
    Locale('gl'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('ia'),
    Locale('id'),
    Locale('ie'),
    Locale('it'),
    Locale('ja'),
    Locale('ka'),
    Locale('ko'),
    Locale('lt'),
    Locale('lv'),
    Locale('nb'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('pt', 'PT'),
    Locale('ro'),
    Locale('ru'),
    Locale('sk'),
    Locale('sl'),
    Locale('sr'),
    Locale('sv'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('vi'),
    Locale('yue'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant')
  ];

  /// Set to true to always display time of day in 24 hour format.
  ///
  /// In en, this message translates to:
  /// **'false'**
  String get alwaysUse24HourFormat;

  /// No description provided for @repeatPassword.
  ///
  /// In en, this message translates to:
  /// **'Repeat password'**
  String get repeatPassword;

  /// No description provided for @notAnImage.
  ///
  /// In en, this message translates to:
  /// **'Not an image file.'**
  String get notAnImage;

  /// No description provided for @setCustomPermissionLevel.
  ///
  /// In en, this message translates to:
  /// **'Set custom permission level'**
  String get setCustomPermissionLevel;

  /// No description provided for @setPermissionsLevelDescription.
  ///
  /// In en, this message translates to:
  /// **'Please choose a predefined role below or enter a custom permission level between 0 and 100.'**
  String get setPermissionsLevelDescription;

  /// No description provided for @ignoreUser.
  ///
  /// In en, this message translates to:
  /// **'Ignore user'**
  String get ignoreUser;

  /// No description provided for @normalUser.
  ///
  /// In en, this message translates to:
  /// **'Normal user'**
  String get normalUser;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @importNow.
  ///
  /// In en, this message translates to:
  /// **'Import now'**
  String get importNow;

  /// No description provided for @importEmojis.
  ///
  /// In en, this message translates to:
  /// **'Import Emojis'**
  String get importEmojis;

  /// No description provided for @importFromZipFile.
  ///
  /// In en, this message translates to:
  /// **'Import from .zip file'**
  String get importFromZipFile;

  /// No description provided for @exportEmotePack.
  ///
  /// In en, this message translates to:
  /// **'Export Emote pack as .zip'**
  String get exportEmotePack;

  /// No description provided for @replace.
  ///
  /// In en, this message translates to:
  /// **'Replace'**
  String get replace;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @aboutHomeserver.
  ///
  /// In en, this message translates to:
  /// **'About {homeserver}'**
  String aboutHomeserver(String homeserver);

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @acceptedTheInvitation.
  ///
  /// In en, this message translates to:
  /// **'👍 {username} accepted the invitation'**
  String acceptedTheInvitation(String username);

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @activatedEndToEndEncryption.
  ///
  /// In en, this message translates to:
  /// **'🔐 {username} activated end to end encryption'**
  String activatedEndToEndEncryption(String username);

  /// No description provided for @addEmail.
  ///
  /// In en, this message translates to:
  /// **'Add email'**
  String get addEmail;

  /// No description provided for @confirmREChainId.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your REChain ID in order to delete your account.'**
  String get confirmREChainId;

  /// No description provided for @supposedMxid.
  ///
  /// In en, this message translates to:
  /// **'This should be {mxid}'**
  String supposedMxid(String mxid);

  /// No description provided for @addChatDescription.
  ///
  /// In en, this message translates to:
  /// **'Add a chat description...'**
  String get addChatDescription;

  /// No description provided for @addToSpace.
  ///
  /// In en, this message translates to:
  /// **'Add to space'**
  String get addToSpace;

  /// No description provided for @admin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get admin;

  /// No description provided for @alias.
  ///
  /// In en, this message translates to:
  /// **'alias'**
  String get alias;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @allChats.
  ///
  /// In en, this message translates to:
  /// **'All chats'**
  String get allChats;

  /// No description provided for @commandHint_roomupgrade.
  ///
  /// In en, this message translates to:
  /// **'Upgrade this room to the given room version'**
  String get commandHint_roomupgrade;

  /// No description provided for @commandHint_googly.
  ///
  /// In en, this message translates to:
  /// **'Send some googly eyes'**
  String get commandHint_googly;

  /// No description provided for @commandHint_cuddle.
  ///
  /// In en, this message translates to:
  /// **'Send a cuddle'**
  String get commandHint_cuddle;

  /// No description provided for @commandHint_hug.
  ///
  /// In en, this message translates to:
  /// **'Send a hug'**
  String get commandHint_hug;

  /// No description provided for @googlyEyesContent.
  ///
  /// In en, this message translates to:
  /// **'{senderName} sends you googly eyes'**
  String googlyEyesContent(String senderName);

  /// No description provided for @cuddleContent.
  ///
  /// In en, this message translates to:
  /// **'{senderName} cuddles you'**
  String cuddleContent(String senderName);

  /// No description provided for @hugContent.
  ///
  /// In en, this message translates to:
  /// **'{senderName} hugs you'**
  String hugContent(String senderName);

  /// No description provided for @answeredTheCall.
  ///
  /// In en, this message translates to:
  /// **'{senderName} answered the call'**
  String answeredTheCall(String senderName);

  /// No description provided for @anyoneCanJoin.
  ///
  /// In en, this message translates to:
  /// **'Anyone can join'**
  String get anyoneCanJoin;

  /// No description provided for @appLock.
  ///
  /// In en, this message translates to:
  /// **'App lock'**
  String get appLock;

  /// No description provided for @appLockDescription.
  ///
  /// In en, this message translates to:
  /// **'Lock the app when not using with a pin code'**
  String get appLockDescription;

  /// No description provided for @archive.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get archive;

  /// No description provided for @areGuestsAllowedToJoin.
  ///
  /// In en, this message translates to:
  /// **'Are guest users allowed to join'**
  String get areGuestsAllowedToJoin;

  /// No description provided for @areYouSure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get areYouSure;

  /// No description provided for @areYouSureYouWantToLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get areYouSureYouWantToLogout;

  /// No description provided for @askSSSSSign.
  ///
  /// In en, this message translates to:
  /// **'To be able to sign the other person, please enter your secure store passphrase or recovery key.'**
  String get askSSSSSign;

  /// No description provided for @askVerificationRequest.
  ///
  /// In en, this message translates to:
  /// **'Accept this verification request from {username}?'**
  String askVerificationRequest(String username);

  /// No description provided for @autoplayImages.
  ///
  /// In en, this message translates to:
  /// **'Automatically play animated stickers and emotes'**
  String get autoplayImages;

  /// No description provided for @badServerLoginTypesException.
  ///
  /// In en, this message translates to:
  /// **'The homeserver supports the login types:\n{serverVersions}\nBut this app supports only:\n{supportedVersions}'**
  String badServerLoginTypesException(
      String serverVersions, String supportedVersions, Object suportedVersions);

  /// No description provided for @sendTypingNotifications.
  ///
  /// In en, this message translates to:
  /// **'Send typing notifications'**
  String get sendTypingNotifications;

  /// No description provided for @swipeRightToLeftToReply.
  ///
  /// In en, this message translates to:
  /// **'Swipe right to left to reply'**
  String get swipeRightToLeftToReply;

  /// No description provided for @sendOnEnter.
  ///
  /// In en, this message translates to:
  /// **'Send on enter'**
  String get sendOnEnter;

  /// No description provided for @badServerVersionsException.
  ///
  /// In en, this message translates to:
  /// **'The homeserver supports the Spec versions:\n{serverVersions}\nBut this app supports only {supportedVersions}'**
  String badServerVersionsException(
      String serverVersions,
      String supportedVersions,
      Object serverVerions,
      Object supoortedVersions,
      Object suportedVersions);

  /// No description provided for @countChatsAndCountParticipants.
  ///
  /// In en, this message translates to:
  /// **'{chats} chats and {participants} participants'**
  String countChatsAndCountParticipants(int chats, int participants);

  /// No description provided for @noMoreChatsFound.
  ///
  /// In en, this message translates to:
  /// **'No more chats found...'**
  String get noMoreChatsFound;

  /// No description provided for @noChatsFoundHere.
  ///
  /// In en, this message translates to:
  /// **'No chats found here yet. Start a new chat with someone by using the button below. ⤵️'**
  String get noChatsFoundHere;

  /// No description provided for @joinedChats.
  ///
  /// In en, this message translates to:
  /// **'Joined chats'**
  String get joinedChats;

  /// No description provided for @unread.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get unread;

  /// No description provided for @space.
  ///
  /// In en, this message translates to:
  /// **'Space'**
  String get space;

  /// No description provided for @spaces.
  ///
  /// In en, this message translates to:
  /// **'Spaces'**
  String get spaces;

  /// No description provided for @banFromChat.
  ///
  /// In en, this message translates to:
  /// **'Ban from chat'**
  String get banFromChat;

  /// No description provided for @banned.
  ///
  /// In en, this message translates to:
  /// **'Banned'**
  String get banned;

  /// No description provided for @bannedUser.
  ///
  /// In en, this message translates to:
  /// **'{username} banned {targetName}'**
  String bannedUser(String username, String targetName);

  /// No description provided for @blockDevice.
  ///
  /// In en, this message translates to:
  /// **'Block Device'**
  String get blockDevice;

  /// No description provided for @blocked.
  ///
  /// In en, this message translates to:
  /// **'Blocked'**
  String get blocked;

  /// No description provided for @botMessages.
  ///
  /// In en, this message translates to:
  /// **'Bot messages'**
  String get botMessages;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @cantOpenUri.
  ///
  /// In en, this message translates to:
  /// **'Can\'t open the URI {uri}'**
  String cantOpenUri(String uri);

  /// No description provided for @changeDeviceName.
  ///
  /// In en, this message translates to:
  /// **'Change device name'**
  String get changeDeviceName;

  /// No description provided for @changedTheChatAvatar.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the chat avatar'**
  String changedTheChatAvatar(String username);

  /// No description provided for @changedTheChatDescriptionTo.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the chat description to: \'{description}\''**
  String changedTheChatDescriptionTo(String username, String description);

  /// No description provided for @changedTheChatNameTo.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the chat name to: \'{chatname}\''**
  String changedTheChatNameTo(String username, String chatname);

  /// No description provided for @changedTheChatPermissions.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the chat permissions'**
  String changedTheChatPermissions(String username);

  /// No description provided for @changedTheDisplaynameTo.
  ///
  /// In en, this message translates to:
  /// **'{username} changed their displayname to: \'{displayname}\''**
  String changedTheDisplaynameTo(String username, String displayname);

  /// No description provided for @changedTheGuestAccessRules.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the guest access rules'**
  String changedTheGuestAccessRules(String username);

  /// No description provided for @changedTheGuestAccessRulesTo.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the guest access rules to: {rules}'**
  String changedTheGuestAccessRulesTo(String username, String rules);

  /// No description provided for @changedTheHistoryVisibility.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the history visibility'**
  String changedTheHistoryVisibility(String username);

  /// No description provided for @changedTheHistoryVisibilityTo.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the history visibility to: {rules}'**
  String changedTheHistoryVisibilityTo(String username, String rules);

  /// No description provided for @changedTheJoinRules.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the join rules'**
  String changedTheJoinRules(String username);

  /// No description provided for @changedTheJoinRulesTo.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the join rules to: {joinRules}'**
  String changedTheJoinRulesTo(String username, String joinRules);

  /// No description provided for @changedTheProfileAvatar.
  ///
  /// In en, this message translates to:
  /// **'{username} changed their avatar'**
  String changedTheProfileAvatar(String username);

  /// No description provided for @changedTheRoomAliases.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the room aliases'**
  String changedTheRoomAliases(String username);

  /// No description provided for @changedTheRoomInvitationLink.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the invitation link'**
  String changedTheRoomInvitationLink(String username);

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePassword;

  /// No description provided for @changeTheHomeserver.
  ///
  /// In en, this message translates to:
  /// **'Change the homeserver'**
  String get changeTheHomeserver;

  /// No description provided for @changeTheme.
  ///
  /// In en, this message translates to:
  /// **'Change your style'**
  String get changeTheme;

  /// No description provided for @changeTheNameOfTheGroup.
  ///
  /// In en, this message translates to:
  /// **'Change the name of the group'**
  String get changeTheNameOfTheGroup;

  /// No description provided for @changeYourAvatar.
  ///
  /// In en, this message translates to:
  /// **'Change your avatar'**
  String get changeYourAvatar;

  /// No description provided for @channelCorruptedDecryptError.
  ///
  /// In en, this message translates to:
  /// **'The encryption has been corrupted'**
  String get channelCorruptedDecryptError;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @yourChatBackupHasBeenSetUp.
  ///
  /// In en, this message translates to:
  /// **'Your chat backup has been set up.'**
  String get yourChatBackupHasBeenSetUp;

  /// No description provided for @chatBackup.
  ///
  /// In en, this message translates to:
  /// **'Chat backup'**
  String get chatBackup;

  /// No description provided for @chatBackupDescription.
  ///
  /// In en, this message translates to:
  /// **'Your old messages are secured with a recovery key. Please make sure you don\'t lose it.'**
  String get chatBackupDescription;

  /// No description provided for @chatDetails.
  ///
  /// In en, this message translates to:
  /// **'Chat details'**
  String get chatDetails;

  /// No description provided for @chatHasBeenAddedToThisSpace.
  ///
  /// In en, this message translates to:
  /// **'Chat has been added to this space'**
  String get chatHasBeenAddedToThisSpace;

  /// No description provided for @chats.
  ///
  /// In en, this message translates to:
  /// **'Chats'**
  String get chats;

  /// No description provided for @chooseAStrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Choose a strong password'**
  String get chooseAStrongPassword;

  /// No description provided for @clearArchive.
  ///
  /// In en, this message translates to:
  /// **'Clear archive'**
  String get clearArchive;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @commandHint_markasdm.
  ///
  /// In en, this message translates to:
  /// **'Mark as direct message room for the giving REChain ID'**
  String get commandHint_markasdm;

  /// No description provided for @commandHint_markasgroup.
  ///
  /// In en, this message translates to:
  /// **'Mark as group'**
  String get commandHint_markasgroup;

  /// Usage hint for the command /ban
  ///
  /// In en, this message translates to:
  /// **'Ban the given user from this room'**
  String get commandHint_ban;

  /// Usage hint for the command /clearcache
  ///
  /// In en, this message translates to:
  /// **'Clear cache'**
  String get commandHint_clearcache;

  /// Usage hint for the command /create
  ///
  /// In en, this message translates to:
  /// **'Create an empty group chat\nUse --no-encryption to disable encryption'**
  String get commandHint_create;

  /// Usage hint for the command /discardsession
  ///
  /// In en, this message translates to:
  /// **'Discard session'**
  String get commandHint_discardsession;

  /// Usage hint for the command /dm
  ///
  /// In en, this message translates to:
  /// **'Start a direct chat\nUse --no-encryption to disable encryption'**
  String get commandHint_dm;

  /// Usage hint for the command /html
  ///
  /// In en, this message translates to:
  /// **'Send HTML-formatted text'**
  String get commandHint_html;

  /// Usage hint for the command /invite
  ///
  /// In en, this message translates to:
  /// **'Invite the given user to this room'**
  String get commandHint_invite;

  /// Usage hint for the command /join
  ///
  /// In en, this message translates to:
  /// **'Join the given room'**
  String get commandHint_join;

  /// Usage hint for the command /kick
  ///
  /// In en, this message translates to:
  /// **'Remove the given user from this room'**
  String get commandHint_kick;

  /// Usage hint for the command /leave
  ///
  /// In en, this message translates to:
  /// **'Leave this room'**
  String get commandHint_leave;

  /// Usage hint for the command /me
  ///
  /// In en, this message translates to:
  /// **'Describe yourself'**
  String get commandHint_me;

  /// Usage hint for the command /myroomavatar
  ///
  /// In en, this message translates to:
  /// **'Set your picture for this room (by mxc-uri)'**
  String get commandHint_myroomavatar;

  /// Usage hint for the command /myroomnick
  ///
  /// In en, this message translates to:
  /// **'Set your display name for this room'**
  String get commandHint_myroomnick;

  /// Usage hint for the command /op
  ///
  /// In en, this message translates to:
  /// **'Set the given user\'s power level (default: 50)'**
  String get commandHint_op;

  /// Usage hint for the command /plain
  ///
  /// In en, this message translates to:
  /// **'Send unformatted text'**
  String get commandHint_plain;

  /// Usage hint for the command /react
  ///
  /// In en, this message translates to:
  /// **'Send reply as a reaction'**
  String get commandHint_react;

  /// Usage hint for the command /send
  ///
  /// In en, this message translates to:
  /// **'Send text'**
  String get commandHint_send;

  /// Usage hint for the command /unban
  ///
  /// In en, this message translates to:
  /// **'Unban the given user from this room'**
  String get commandHint_unban;

  /// No description provided for @commandInvalid.
  ///
  /// In en, this message translates to:
  /// **'Command invalid'**
  String get commandInvalid;

  /// State that {command} is not a valid /command.
  ///
  /// In en, this message translates to:
  /// **'{command} is not a command.'**
  String commandMissing(String command);

  /// No description provided for @compareEmojiMatch.
  ///
  /// In en, this message translates to:
  /// **'Please compare the emojis'**
  String get compareEmojiMatch;

  /// No description provided for @compareNumbersMatch.
  ///
  /// In en, this message translates to:
  /// **'Please compare the numbers'**
  String get compareNumbersMatch;

  /// No description provided for @configureChat.
  ///
  /// In en, this message translates to:
  /// **'Configure chat'**
  String get configureChat;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @connect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connect;

  /// No description provided for @contactHasBeenInvitedToTheGroup.
  ///
  /// In en, this message translates to:
  /// **'Contact has been invited to the group'**
  String get contactHasBeenInvitedToTheGroup;

  /// No description provided for @containsDisplayName.
  ///
  /// In en, this message translates to:
  /// **'Contains display name'**
  String get containsDisplayName;

  /// No description provided for @containsUserName.
  ///
  /// In en, this message translates to:
  /// **'Contains username'**
  String get containsUserName;

  /// No description provided for @contentHasBeenReported.
  ///
  /// In en, this message translates to:
  /// **'The content has been reported to the server admins'**
  String get contentHasBeenReported;

  /// No description provided for @copiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get copiedToClipboard;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @copyToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copy to clipboard'**
  String get copyToClipboard;

  /// No description provided for @couldNotDecryptMessage.
  ///
  /// In en, this message translates to:
  /// **'Could not decrypt message: {error}'**
  String couldNotDecryptMessage(String error);

  /// No description provided for @checkList.
  ///
  /// In en, this message translates to:
  /// **'Check list'**
  String get checkList;

  /// No description provided for @countParticipants.
  ///
  /// In en, this message translates to:
  /// **'{count} participants'**
  String countParticipants(int count);

  /// No description provided for @countInvited.
  ///
  /// In en, this message translates to:
  /// **'{count} invited'**
  String countInvited(int count);

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @createdTheChat.
  ///
  /// In en, this message translates to:
  /// **'💬 {username} created the chat'**
  String createdTheChat(String username);

  /// No description provided for @createGroup.
  ///
  /// In en, this message translates to:
  /// **'Create group'**
  String get createGroup;

  /// No description provided for @createNewSpace.
  ///
  /// In en, this message translates to:
  /// **'New space'**
  String get createNewSpace;

  /// No description provided for @currentlyActive.
  ///
  /// In en, this message translates to:
  /// **'Currently active'**
  String get currentlyActive;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkTheme;

  /// No description provided for @dateAndTimeOfDay.
  ///
  /// In en, this message translates to:
  /// **'{date}, {timeOfDay}'**
  String dateAndTimeOfDay(String date, String timeOfDay);

  /// No description provided for @dateWithoutYear.
  ///
  /// In en, this message translates to:
  /// **'{month}-{day}'**
  String dateWithoutYear(String month, String day);

  /// No description provided for @dateWithYear.
  ///
  /// In en, this message translates to:
  /// **'{year}-{month}-{day}'**
  String dateWithYear(String year, String month, String day);

  /// No description provided for @deactivateAccountWarning.
  ///
  /// In en, this message translates to:
  /// **'This will deactivate your user account. This can not be undone! Are you sure?'**
  String get deactivateAccountWarning;

  /// No description provided for @defaultPermissionLevel.
  ///
  /// In en, this message translates to:
  /// **'Default permission level for new users'**
  String get defaultPermissionLevel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccount;

  /// No description provided for @deleteMessage.
  ///
  /// In en, this message translates to:
  /// **'Delete message'**
  String get deleteMessage;

  /// No description provided for @device.
  ///
  /// In en, this message translates to:
  /// **'Device'**
  String get device;

  /// No description provided for @deviceId.
  ///
  /// In en, this message translates to:
  /// **'Device ID'**
  String get deviceId;

  /// No description provided for @devices.
  ///
  /// In en, this message translates to:
  /// **'Devices'**
  String get devices;

  /// No description provided for @directChats.
  ///
  /// In en, this message translates to:
  /// **'Direct Chats'**
  String get directChats;

  /// No description provided for @allRooms.
  ///
  /// In en, this message translates to:
  /// **'All Group Chats'**
  String get allRooms;

  /// No description provided for @displaynameHasBeenChanged.
  ///
  /// In en, this message translates to:
  /// **'Displayname has been changed'**
  String get displaynameHasBeenChanged;

  /// No description provided for @downloadFile.
  ///
  /// In en, this message translates to:
  /// **'Download file'**
  String get downloadFile;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @editBlockedServers.
  ///
  /// In en, this message translates to:
  /// **'Edit blocked servers'**
  String get editBlockedServers;

  /// No description provided for @chatPermissions.
  ///
  /// In en, this message translates to:
  /// **'Chat permissions'**
  String get chatPermissions;

  /// No description provided for @editDisplayname.
  ///
  /// In en, this message translates to:
  /// **'Edit displayname'**
  String get editDisplayname;

  /// No description provided for @editRoomAliases.
  ///
  /// In en, this message translates to:
  /// **'Edit room aliases'**
  String get editRoomAliases;

  /// No description provided for @editRoomAvatar.
  ///
  /// In en, this message translates to:
  /// **'Edit room avatar'**
  String get editRoomAvatar;

  /// No description provided for @emoteExists.
  ///
  /// In en, this message translates to:
  /// **'Emote already exists!'**
  String get emoteExists;

  /// No description provided for @emoteInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid emote shortcode!'**
  String get emoteInvalid;

  /// No description provided for @emoteKeyboardNoRecents.
  ///
  /// In en, this message translates to:
  /// **'Recently-used emotes will appear here...'**
  String get emoteKeyboardNoRecents;

  /// No description provided for @emotePacks.
  ///
  /// In en, this message translates to:
  /// **'Emote packs for room'**
  String get emotePacks;

  /// No description provided for @emoteSettings.
  ///
  /// In en, this message translates to:
  /// **'Emote Settings'**
  String get emoteSettings;

  /// No description provided for @globalChatId.
  ///
  /// In en, this message translates to:
  /// **'Global chat ID'**
  String get globalChatId;

  /// No description provided for @accessAndVisibility.
  ///
  /// In en, this message translates to:
  /// **'Access and visibility'**
  String get accessAndVisibility;

  /// No description provided for @accessAndVisibilityDescription.
  ///
  /// In en, this message translates to:
  /// **'Who is allowed to join this chat and how the chat can be discovered.'**
  String get accessAndVisibilityDescription;

  /// No description provided for @calls.
  ///
  /// In en, this message translates to:
  /// **'Calls'**
  String get calls;

  /// No description provided for @customEmojisAndStickers.
  ///
  /// In en, this message translates to:
  /// **'Custom emojis and stickers'**
  String get customEmojisAndStickers;

  /// No description provided for @customEmojisAndStickersBody.
  ///
  /// In en, this message translates to:
  /// **'Add or share custom emojis or stickers which can be used in any chat.'**
  String get customEmojisAndStickersBody;

  /// No description provided for @emoteShortcode.
  ///
  /// In en, this message translates to:
  /// **'Emote shortcode'**
  String get emoteShortcode;

  /// No description provided for @emoteWarnNeedToPick.
  ///
  /// In en, this message translates to:
  /// **'You need to pick an emote shortcode and an image!'**
  String get emoteWarnNeedToPick;

  /// No description provided for @emptyChat.
  ///
  /// In en, this message translates to:
  /// **'Empty chat'**
  String get emptyChat;

  /// No description provided for @enableEmotesGlobally.
  ///
  /// In en, this message translates to:
  /// **'Enable emote pack globally'**
  String get enableEmotesGlobally;

  /// No description provided for @enableEncryption.
  ///
  /// In en, this message translates to:
  /// **'Enable encryption'**
  String get enableEncryption;

  /// No description provided for @enableEncryptionWarning.
  ///
  /// In en, this message translates to:
  /// **'You won\'t be able to disable the encryption anymore. Are you sure?'**
  String get enableEncryptionWarning;

  /// No description provided for @encrypted.
  ///
  /// In en, this message translates to:
  /// **'Encrypted'**
  String get encrypted;

  /// No description provided for @encryption.
  ///
  /// In en, this message translates to:
  /// **'Encryption'**
  String get encryption;

  /// No description provided for @encryptionNotEnabled.
  ///
  /// In en, this message translates to:
  /// **'Encryption is not enabled'**
  String get encryptionNotEnabled;

  /// No description provided for @endedTheCall.
  ///
  /// In en, this message translates to:
  /// **'{senderName} ended the call'**
  String endedTheCall(String senderName);

  /// No description provided for @enterAnEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter an email address'**
  String get enterAnEmailAddress;

  /// No description provided for @homeserver.
  ///
  /// In en, this message translates to:
  /// **'Homeserver'**
  String get homeserver;

  /// No description provided for @enterYourHomeserver.
  ///
  /// In en, this message translates to:
  /// **'Enter your homeserver'**
  String get enterYourHomeserver;

  /// No description provided for @errorObtainingLocation.
  ///
  /// In en, this message translates to:
  /// **'Error obtaining location: {error}'**
  String errorObtainingLocation(String error);

  /// No description provided for @everythingReady.
  ///
  /// In en, this message translates to:
  /// **'Everything ready!'**
  String get everythingReady;

  /// No description provided for @extremeOffensive.
  ///
  /// In en, this message translates to:
  /// **'Extremely offensive'**
  String get extremeOffensive;

  /// No description provided for @fileName.
  ///
  /// In en, this message translates to:
  /// **'File name'**
  String get fileName;

  /// No description provided for @rechainonline.
  ///
  /// In en, this message translates to:
  /// **'REChain'**
  String get rechainonline;

  /// No description provided for @fontSize.
  ///
  /// In en, this message translates to:
  /// **'Font size'**
  String get fontSize;

  /// No description provided for @forward.
  ///
  /// In en, this message translates to:
  /// **'Forward'**
  String get forward;

  /// No description provided for @fromJoining.
  ///
  /// In en, this message translates to:
  /// **'From joining'**
  String get fromJoining;

  /// No description provided for @fromTheInvitation.
  ///
  /// In en, this message translates to:
  /// **'From the invitation'**
  String get fromTheInvitation;

  /// No description provided for @goToTheNewRoom.
  ///
  /// In en, this message translates to:
  /// **'Go to the new room'**
  String get goToTheNewRoom;

  /// No description provided for @group.
  ///
  /// In en, this message translates to:
  /// **'Group'**
  String get group;

  /// No description provided for @chatDescription.
  ///
  /// In en, this message translates to:
  /// **'Chat description'**
  String get chatDescription;

  /// No description provided for @chatDescriptionHasBeenChanged.
  ///
  /// In en, this message translates to:
  /// **'Chat description changed'**
  String get chatDescriptionHasBeenChanged;

  /// No description provided for @groupIsPublic.
  ///
  /// In en, this message translates to:
  /// **'Group is public'**
  String get groupIsPublic;

  /// No description provided for @groups.
  ///
  /// In en, this message translates to:
  /// **'Groups'**
  String get groups;

  /// No description provided for @groupWith.
  ///
  /// In en, this message translates to:
  /// **'Group with {displayname}'**
  String groupWith(String displayname);

  /// No description provided for @guestsAreForbidden.
  ///
  /// In en, this message translates to:
  /// **'Guests are forbidden'**
  String get guestsAreForbidden;

  /// No description provided for @guestsCanJoin.
  ///
  /// In en, this message translates to:
  /// **'Guests can join'**
  String get guestsCanJoin;

  /// No description provided for @hasWithdrawnTheInvitationFor.
  ///
  /// In en, this message translates to:
  /// **'{username} has withdrawn the invitation for {targetName}'**
  String hasWithdrawnTheInvitationFor(String username, String targetName);

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @hideRedactedEvents.
  ///
  /// In en, this message translates to:
  /// **'Hide redacted events'**
  String get hideRedactedEvents;

  /// No description provided for @hideRedactedMessages.
  ///
  /// In en, this message translates to:
  /// **'Hide redacted messages'**
  String get hideRedactedMessages;

  /// No description provided for @hideRedactedMessagesBody.
  ///
  /// In en, this message translates to:
  /// **'If someone redacts a message, this message won\'t be visible in the chat anymore.'**
  String get hideRedactedMessagesBody;

  /// No description provided for @hideInvalidOrUnknownMessageFormats.
  ///
  /// In en, this message translates to:
  /// **'Hide invalid or unknown message formats'**
  String get hideInvalidOrUnknownMessageFormats;

  /// No description provided for @howOffensiveIsThisContent.
  ///
  /// In en, this message translates to:
  /// **'How offensive is this content?'**
  String get howOffensiveIsThisContent;

  /// No description provided for @id.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get id;

  /// No description provided for @identity.
  ///
  /// In en, this message translates to:
  /// **'Identity'**
  String get identity;

  /// No description provided for @block.
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get block;

  /// No description provided for @blockedUsers.
  ///
  /// In en, this message translates to:
  /// **'Blocked users'**
  String get blockedUsers;

  /// No description provided for @blockListDescription.
  ///
  /// In en, this message translates to:
  /// **'You can block users who are disturbing you. You won\'t be able to receive any messages or room invites from the users on your personal block list.'**
  String get blockListDescription;

  /// No description provided for @blockUsername.
  ///
  /// In en, this message translates to:
  /// **'Ignore username'**
  String get blockUsername;

  /// No description provided for @iHaveClickedOnLink.
  ///
  /// In en, this message translates to:
  /// **'I have clicked on the link'**
  String get iHaveClickedOnLink;

  /// No description provided for @incorrectPassphraseOrKey.
  ///
  /// In en, this message translates to:
  /// **'Incorrect passphrase or recovery key'**
  String get incorrectPassphraseOrKey;

  /// No description provided for @inoffensive.
  ///
  /// In en, this message translates to:
  /// **'Inoffensive'**
  String get inoffensive;

  /// No description provided for @inviteContact.
  ///
  /// In en, this message translates to:
  /// **'Invite contact'**
  String get inviteContact;

  /// No description provided for @inviteContactToGroupQuestion.
  ///
  /// In en, this message translates to:
  /// **'Do you want to invite {contact} to the chat \"{groupName}\"?'**
  String inviteContactToGroupQuestion(Object contact, Object groupName);

  /// No description provided for @inviteContactToGroup.
  ///
  /// In en, this message translates to:
  /// **'Invite contact to {groupName}'**
  String inviteContactToGroup(String groupName);

  /// No description provided for @noChatDescriptionYet.
  ///
  /// In en, this message translates to:
  /// **'No chat description created yet.'**
  String get noChatDescriptionYet;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @invalidServerName.
  ///
  /// In en, this message translates to:
  /// **'Invalid server name'**
  String get invalidServerName;

  /// No description provided for @invited.
  ///
  /// In en, this message translates to:
  /// **'Invited'**
  String get invited;

  /// No description provided for @redactMessageDescription.
  ///
  /// In en, this message translates to:
  /// **'The message will be redacted for all participants in this conversation. This cannot be undone.'**
  String get redactMessageDescription;

  /// No description provided for @optionalRedactReason.
  ///
  /// In en, this message translates to:
  /// **'(Optional) Reason for redacting this message...'**
  String get optionalRedactReason;

  /// No description provided for @invitedUser.
  ///
  /// In en, this message translates to:
  /// **'📩 {username} invited {targetName}'**
  String invitedUser(String username, String targetName);

  /// No description provided for @invitedUsersOnly.
  ///
  /// In en, this message translates to:
  /// **'Invited users only'**
  String get invitedUsersOnly;

  /// No description provided for @inviteForMe.
  ///
  /// In en, this message translates to:
  /// **'Invite for me'**
  String get inviteForMe;

  /// No description provided for @inviteText.
  ///
  /// In en, this message translates to:
  /// **'{username} invited you to REChain.\n1. Visit online.rechain.network and install the app \n2. Sign up or sign in \n3. Open the invite link: \n {link}'**
  String inviteText(String username, String link);

  /// No description provided for @isTyping.
  ///
  /// In en, this message translates to:
  /// **'is typing…'**
  String get isTyping;

  /// No description provided for @joinedTheChat.
  ///
  /// In en, this message translates to:
  /// **'👋 {username} joined the chat'**
  String joinedTheChat(String username);

  /// No description provided for @joinRoom.
  ///
  /// In en, this message translates to:
  /// **'Join room'**
  String get joinRoom;

  /// No description provided for @kicked.
  ///
  /// In en, this message translates to:
  /// **'👞 {username} kicked {targetName}'**
  String kicked(String username, String targetName);

  /// No description provided for @kickedAndBanned.
  ///
  /// In en, this message translates to:
  /// **'🙅 {username} kicked and banned {targetName}'**
  String kickedAndBanned(String username, String targetName);

  /// No description provided for @kickFromChat.
  ///
  /// In en, this message translates to:
  /// **'Kick from chat'**
  String get kickFromChat;

  /// No description provided for @lastActiveAgo.
  ///
  /// In en, this message translates to:
  /// **'Last active: {localizedTimeShort}'**
  String lastActiveAgo(String localizedTimeShort);

  /// No description provided for @leave.
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get leave;

  /// No description provided for @leftTheChat.
  ///
  /// In en, this message translates to:
  /// **'Left the chat'**
  String get leftTheChat;

  /// No description provided for @license.
  ///
  /// In en, this message translates to:
  /// **'License'**
  String get license;

  /// No description provided for @lightTheme.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightTheme;

  /// No description provided for @loadCountMoreParticipants.
  ///
  /// In en, this message translates to:
  /// **'Load {count} more participants'**
  String loadCountMoreParticipants(int count);

  /// No description provided for @dehydrate.
  ///
  /// In en, this message translates to:
  /// **'Export session and wipe device'**
  String get dehydrate;

  /// No description provided for @dehydrateWarning.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone. Ensure you safely store the backup file.'**
  String get dehydrateWarning;

  /// No description provided for @dehydrateTor.
  ///
  /// In en, this message translates to:
  /// **'TOR Users: Export session'**
  String get dehydrateTor;

  /// No description provided for @dehydrateTorLong.
  ///
  /// In en, this message translates to:
  /// **'For TOR users, it is recommended to export the session before closing the window.'**
  String get dehydrateTorLong;

  /// No description provided for @hydrateTor.
  ///
  /// In en, this message translates to:
  /// **'TOR Users: Import session export'**
  String get hydrateTor;

  /// No description provided for @hydrateTorLong.
  ///
  /// In en, this message translates to:
  /// **'Did you export your session last time on TOR? Quickly import it and continue chatting.'**
  String get hydrateTorLong;

  /// No description provided for @hydrate.
  ///
  /// In en, this message translates to:
  /// **'Restore from backup file'**
  String get hydrate;

  /// No description provided for @loadingPleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Loading… Please wait.'**
  String get loadingPleaseWait;

  /// No description provided for @loadMore.
  ///
  /// In en, this message translates to:
  /// **'Load more…'**
  String get loadMore;

  /// No description provided for @locationDisabledNotice.
  ///
  /// In en, this message translates to:
  /// **'Location services are disabled. Please enable them to be able to share your location.'**
  String get locationDisabledNotice;

  /// No description provided for @locationPermissionDeniedNotice.
  ///
  /// In en, this message translates to:
  /// **'Location permission denied. Please grant them to be able to share your location.'**
  String get locationPermissionDeniedNotice;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logInTo.
  ///
  /// In en, this message translates to:
  /// **'Log in to {homeserver}'**
  String logInTo(String homeserver);

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @memberChanges.
  ///
  /// In en, this message translates to:
  /// **'Member changes'**
  String get memberChanges;

  /// No description provided for @mention.
  ///
  /// In en, this message translates to:
  /// **'Mention'**
  String get mention;

  /// No description provided for @messages.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messages;

  /// No description provided for @messagesStyle.
  ///
  /// In en, this message translates to:
  /// **'Messages:'**
  String get messagesStyle;

  /// No description provided for @moderator.
  ///
  /// In en, this message translates to:
  /// **'Moderator'**
  String get moderator;

  /// No description provided for @muteChat.
  ///
  /// In en, this message translates to:
  /// **'Mute chat'**
  String get muteChat;

  /// No description provided for @needPantalaimonWarning.
  ///
  /// In en, this message translates to:
  /// **'Please be aware that you need Pantalaimon to use end-to-end encryption for now.'**
  String get needPantalaimonWarning;

  /// No description provided for @newChat.
  ///
  /// In en, this message translates to:
  /// **'New chat'**
  String get newChat;

  /// No description provided for @newMessageInrechainonline.
  ///
  /// In en, this message translates to:
  /// **'💬 New message in REChain'**
  String get newMessageInrechainonline;

  /// No description provided for @newVerificationRequest.
  ///
  /// In en, this message translates to:
  /// **'New verification request!'**
  String get newVerificationRequest;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @noConnectionToTheServer.
  ///
  /// In en, this message translates to:
  /// **'No connection to the server'**
  String get noConnectionToTheServer;

  /// No description provided for @noEmotesFound.
  ///
  /// In en, this message translates to:
  /// **'No emotes found. 😕'**
  String get noEmotesFound;

  /// No description provided for @noEncryptionForPublicRooms.
  ///
  /// In en, this message translates to:
  /// **'You can only activate encryption as soon as the room is no longer publicly accessible.'**
  String get noEncryptionForPublicRooms;

  /// No description provided for @noGoogleServicesWarning.
  ///
  /// In en, this message translates to:
  /// **'Firebase Cloud Messaging doesn\'t appear to be available on your device. To still receive push notifications, we recommend installing ntfy. With ntfy or another Unified Push provider you can receive push notifications in a data secure way. You can download ntfy from the PlayStore or from F-Droid.'**
  String get noGoogleServicesWarning;

  /// No description provided for @norechainonlineServer.
  ///
  /// In en, this message translates to:
  /// **'{server1} is no Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node Network server, use {server2} instead?'**
  String norechainonlineServer(String server1, String server2);

  /// No description provided for @shareInviteLink.
  ///
  /// In en, this message translates to:
  /// **'Share invite link'**
  String get shareInviteLink;

  /// No description provided for @scanQrCode.
  ///
  /// In en, this message translates to:
  /// **'Scan QR code'**
  String get scanQrCode;

  /// No description provided for @none.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// No description provided for @noPasswordRecoveryDescription.
  ///
  /// In en, this message translates to:
  /// **'You have not added a way to recover your password yet.'**
  String get noPasswordRecoveryDescription;

  /// No description provided for @noPermission.
  ///
  /// In en, this message translates to:
  /// **'No permission'**
  String get noPermission;

  /// No description provided for @noRoomsFound.
  ///
  /// In en, this message translates to:
  /// **'No rooms found…'**
  String get noRoomsFound;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @notificationsEnabledForThisAccount.
  ///
  /// In en, this message translates to:
  /// **'Notifications enabled for this account'**
  String get notificationsEnabledForThisAccount;

  /// No description provided for @numUsersTyping.
  ///
  /// In en, this message translates to:
  /// **'{count} users are typing…'**
  String numUsersTyping(int count);

  /// No description provided for @obtainingLocation.
  ///
  /// In en, this message translates to:
  /// **'Obtaining location…'**
  String get obtainingLocation;

  /// No description provided for @offensive.
  ///
  /// In en, this message translates to:
  /// **'Offensive'**
  String get offensive;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// No description provided for @onlineKeyBackupEnabled.
  ///
  /// In en, this message translates to:
  /// **'Online Key Backup is enabled'**
  String get onlineKeyBackupEnabled;

  /// No description provided for @oopsPushError.
  ///
  /// In en, this message translates to:
  /// **'Oops! Unfortunately, an error occurred when setting up the push notifications.'**
  String get oopsPushError;

  /// No description provided for @oopsSomethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Oops, something went wrong…'**
  String get oopsSomethingWentWrong;

  /// No description provided for @openAppToReadMessages.
  ///
  /// In en, this message translates to:
  /// **'Open app to read messages'**
  String get openAppToReadMessages;

  /// No description provided for @openCamera.
  ///
  /// In en, this message translates to:
  /// **'Open camera'**
  String get openCamera;

  /// No description provided for @openVideoCamera.
  ///
  /// In en, this message translates to:
  /// **'Open camera for a video'**
  String get openVideoCamera;

  /// No description provided for @oneClientLoggedOut.
  ///
  /// In en, this message translates to:
  /// **'One of your clients has been logged out'**
  String get oneClientLoggedOut;

  /// No description provided for @addAccount.
  ///
  /// In en, this message translates to:
  /// **'Add account'**
  String get addAccount;

  /// No description provided for @editBundlesForAccount.
  ///
  /// In en, this message translates to:
  /// **'Edit bundles for this account'**
  String get editBundlesForAccount;

  /// No description provided for @addToBundle.
  ///
  /// In en, this message translates to:
  /// **'Add to bundle'**
  String get addToBundle;

  /// No description provided for @removeFromBundle.
  ///
  /// In en, this message translates to:
  /// **'Remove from this bundle'**
  String get removeFromBundle;

  /// No description provided for @bundleName.
  ///
  /// In en, this message translates to:
  /// **'Bundle name'**
  String get bundleName;

  /// No description provided for @enableMultiAccounts.
  ///
  /// In en, this message translates to:
  /// **'(BETA) Enable multi accounts on this device'**
  String get enableMultiAccounts;

  /// No description provided for @openInMaps.
  ///
  /// In en, this message translates to:
  /// **'Open in maps'**
  String get openInMaps;

  /// No description provided for @link.
  ///
  /// In en, this message translates to:
  /// **'Link'**
  String get link;

  /// No description provided for @serverRequiresEmail.
  ///
  /// In en, this message translates to:
  /// **'This server needs to validate your email address for registration.'**
  String get serverRequiresEmail;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @participant.
  ///
  /// In en, this message translates to:
  /// **'Participant'**
  String get participant;

  /// No description provided for @passphraseOrKey.
  ///
  /// In en, this message translates to:
  /// **'passphrase or recovery key'**
  String get passphraseOrKey;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordForgotten.
  ///
  /// In en, this message translates to:
  /// **'Password forgotten'**
  String get passwordForgotten;

  /// No description provided for @passwordHasBeenChanged.
  ///
  /// In en, this message translates to:
  /// **'Password has been changed'**
  String get passwordHasBeenChanged;

  /// No description provided for @hideMemberChangesInPublicChats.
  ///
  /// In en, this message translates to:
  /// **'Hide member changes in public chats'**
  String get hideMemberChangesInPublicChats;

  /// No description provided for @hideMemberChangesInPublicChatsBody.
  ///
  /// In en, this message translates to:
  /// **'Do not show in the chat timeline if someone joins or leaves a public chat to improve readability.'**
  String get hideMemberChangesInPublicChatsBody;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @notifyMeFor.
  ///
  /// In en, this message translates to:
  /// **'Notify me for'**
  String get notifyMeFor;

  /// No description provided for @passwordRecoverySettings.
  ///
  /// In en, this message translates to:
  /// **'Password recovery settings'**
  String get passwordRecoverySettings;

  /// No description provided for @passwordRecovery.
  ///
  /// In en, this message translates to:
  /// **'Password recovery'**
  String get passwordRecovery;

  /// No description provided for @people.
  ///
  /// In en, this message translates to:
  /// **'People'**
  String get people;

  /// No description provided for @pickImage.
  ///
  /// In en, this message translates to:
  /// **'Pick an image'**
  String get pickImage;

  /// No description provided for @pin.
  ///
  /// In en, this message translates to:
  /// **'Pin'**
  String get pin;

  /// No description provided for @play.
  ///
  /// In en, this message translates to:
  /// **'Play {fileName}'**
  String play(String fileName);

  /// No description provided for @pleaseChoose.
  ///
  /// In en, this message translates to:
  /// **'Please choose'**
  String get pleaseChoose;

  /// No description provided for @pleaseChooseAPasscode.
  ///
  /// In en, this message translates to:
  /// **'Please choose a pass code'**
  String get pleaseChooseAPasscode;

  /// No description provided for @pleaseClickOnLink.
  ///
  /// In en, this message translates to:
  /// **'Please click on the link in the email and then proceed.'**
  String get pleaseClickOnLink;

  /// No description provided for @pleaseEnter4Digits.
  ///
  /// In en, this message translates to:
  /// **'Please enter 4 digits or leave empty to disable app lock.'**
  String get pleaseEnter4Digits;

  /// No description provided for @pleaseEnterRecoveryKey.
  ///
  /// In en, this message translates to:
  /// **'Please enter your recovery key:'**
  String get pleaseEnterRecoveryKey;

  /// No description provided for @pleaseEnterYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get pleaseEnterYourPassword;

  /// No description provided for @pleaseEnterYourPin.
  ///
  /// In en, this message translates to:
  /// **'Please enter your pin'**
  String get pleaseEnterYourPin;

  /// No description provided for @pleaseEnterYourUsername.
  ///
  /// In en, this message translates to:
  /// **'Please enter your username'**
  String get pleaseEnterYourUsername;

  /// No description provided for @pleaseFollowInstructionsOnWeb.
  ///
  /// In en, this message translates to:
  /// **'Please follow the instructions on the website and tap on next.'**
  String get pleaseFollowInstructionsOnWeb;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// No description provided for @publicRooms.
  ///
  /// In en, this message translates to:
  /// **'Public Rooms'**
  String get publicRooms;

  /// No description provided for @pushRules.
  ///
  /// In en, this message translates to:
  /// **'Push rules'**
  String get pushRules;

  /// No description provided for @reason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get reason;

  /// No description provided for @recording.
  ///
  /// In en, this message translates to:
  /// **'Recording'**
  String get recording;

  /// No description provided for @redactedBy.
  ///
  /// In en, this message translates to:
  /// **'Redacted by {username}'**
  String redactedBy(String username);

  /// No description provided for @directChat.
  ///
  /// In en, this message translates to:
  /// **'Direct chat'**
  String get directChat;

  /// No description provided for @redactedByBecause.
  ///
  /// In en, this message translates to:
  /// **'Redacted by {username} because: \"{reason}\"'**
  String redactedByBecause(String username, String reason);

  /// No description provided for @redactedAnEvent.
  ///
  /// In en, this message translates to:
  /// **'{username} redacted an event'**
  String redactedAnEvent(String username);

  /// No description provided for @redactMessage.
  ///
  /// In en, this message translates to:
  /// **'Redact message'**
  String get redactMessage;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// No description provided for @rejectedTheInvitation.
  ///
  /// In en, this message translates to:
  /// **'{username} rejected the invitation'**
  String rejectedTheInvitation(String username);

  /// No description provided for @rejoin.
  ///
  /// In en, this message translates to:
  /// **'Rejoin'**
  String get rejoin;

  /// No description provided for @removeAllOtherDevices.
  ///
  /// In en, this message translates to:
  /// **'Remove all other devices'**
  String get removeAllOtherDevices;

  /// No description provided for @removedBy.
  ///
  /// In en, this message translates to:
  /// **'Removed by {username}'**
  String removedBy(String username);

  /// No description provided for @removeDevice.
  ///
  /// In en, this message translates to:
  /// **'Remove device'**
  String get removeDevice;

  /// No description provided for @unbanFromChat.
  ///
  /// In en, this message translates to:
  /// **'Unban from chat'**
  String get unbanFromChat;

  /// No description provided for @removeYourAvatar.
  ///
  /// In en, this message translates to:
  /// **'Remove your avatar'**
  String get removeYourAvatar;

  /// No description provided for @replaceRoomWithNewerVersion.
  ///
  /// In en, this message translates to:
  /// **'Replace room with newer version'**
  String get replaceRoomWithNewerVersion;

  /// No description provided for @reply.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get reply;

  /// No description provided for @reportMessage.
  ///
  /// In en, this message translates to:
  /// **'Report message'**
  String get reportMessage;

  /// No description provided for @requestPermission.
  ///
  /// In en, this message translates to:
  /// **'Request permission'**
  String get requestPermission;

  /// No description provided for @roomHasBeenUpgraded.
  ///
  /// In en, this message translates to:
  /// **'Room has been upgraded'**
  String get roomHasBeenUpgraded;

  /// No description provided for @roomVersion.
  ///
  /// In en, this message translates to:
  /// **'Room version'**
  String get roomVersion;

  /// No description provided for @saveFile.
  ///
  /// In en, this message translates to:
  /// **'Save file'**
  String get saveFile;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @recoveryKey.
  ///
  /// In en, this message translates to:
  /// **'Recovery key'**
  String get recoveryKey;

  /// No description provided for @recoveryKeyLost.
  ///
  /// In en, this message translates to:
  /// **'Recovery key lost?'**
  String get recoveryKeyLost;

  /// No description provided for @seenByUser.
  ///
  /// In en, this message translates to:
  /// **'Seen by {username}'**
  String seenByUser(String username);

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @sendAMessage.
  ///
  /// In en, this message translates to:
  /// **'Send a message'**
  String get sendAMessage;

  /// No description provided for @sendAsText.
  ///
  /// In en, this message translates to:
  /// **'Send as text'**
  String get sendAsText;

  /// No description provided for @sendAudio.
  ///
  /// In en, this message translates to:
  /// **'Send audio'**
  String get sendAudio;

  /// No description provided for @sendFile.
  ///
  /// In en, this message translates to:
  /// **'Send file'**
  String get sendFile;

  /// No description provided for @sendImage.
  ///
  /// In en, this message translates to:
  /// **'Send image'**
  String get sendImage;

  /// No description provided for @sendImages.
  ///
  /// In en, this message translates to:
  /// **'Send {count} image'**
  String sendImages(int count);

  /// No description provided for @sendMessages.
  ///
  /// In en, this message translates to:
  /// **'Send messages'**
  String get sendMessages;

  /// No description provided for @sendOriginal.
  ///
  /// In en, this message translates to:
  /// **'Send original'**
  String get sendOriginal;

  /// No description provided for @sendSticker.
  ///
  /// In en, this message translates to:
  /// **'Send sticker'**
  String get sendSticker;

  /// No description provided for @sendVideo.
  ///
  /// In en, this message translates to:
  /// **'Send video'**
  String get sendVideo;

  /// No description provided for @sentAFile.
  ///
  /// In en, this message translates to:
  /// **'📁 {username} sent a file'**
  String sentAFile(String username);

  /// No description provided for @sentAnAudio.
  ///
  /// In en, this message translates to:
  /// **'🎤 {username} sent an audio'**
  String sentAnAudio(String username);

  /// No description provided for @sentAPicture.
  ///
  /// In en, this message translates to:
  /// **'🖼️ {username} sent a picture'**
  String sentAPicture(String username);

  /// No description provided for @sentASticker.
  ///
  /// In en, this message translates to:
  /// **'😊 {username} sent a sticker'**
  String sentASticker(String username);

  /// No description provided for @sentAVideo.
  ///
  /// In en, this message translates to:
  /// **'🎥 {username} sent a video'**
  String sentAVideo(String username);

  /// No description provided for @sentCallInformations.
  ///
  /// In en, this message translates to:
  /// **'{senderName} sent call information'**
  String sentCallInformations(String senderName);

  /// No description provided for @separateChatTypes.
  ///
  /// In en, this message translates to:
  /// **'Separate Direct Chats and Groups'**
  String get separateChatTypes;

  /// No description provided for @setAsCanonicalAlias.
  ///
  /// In en, this message translates to:
  /// **'Set as main alias'**
  String get setAsCanonicalAlias;

  /// No description provided for @setCustomEmotes.
  ///
  /// In en, this message translates to:
  /// **'Set custom emotes'**
  String get setCustomEmotes;

  /// No description provided for @setChatDescription.
  ///
  /// In en, this message translates to:
  /// **'Set chat description'**
  String get setChatDescription;

  /// No description provided for @setInvitationLink.
  ///
  /// In en, this message translates to:
  /// **'Set invitation link'**
  String get setInvitationLink;

  /// No description provided for @setPermissionsLevel.
  ///
  /// In en, this message translates to:
  /// **'Set permissions level'**
  String get setPermissionsLevel;

  /// No description provided for @setStatus.
  ///
  /// In en, this message translates to:
  /// **'Set status'**
  String get setStatus;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @sharedTheLocation.
  ///
  /// In en, this message translates to:
  /// **'{username} shared their location'**
  String sharedTheLocation(String username);

  /// No description provided for @shareLocation.
  ///
  /// In en, this message translates to:
  /// **'Share location'**
  String get shareLocation;

  /// No description provided for @showPassword.
  ///
  /// In en, this message translates to:
  /// **'Show password'**
  String get showPassword;

  /// No description provided for @presenceStyle.
  ///
  /// In en, this message translates to:
  /// **'Presence:'**
  String get presenceStyle;

  /// No description provided for @presencesToggle.
  ///
  /// In en, this message translates to:
  /// **'Show status messages from other users'**
  String get presencesToggle;

  /// No description provided for @singlesignon.
  ///
  /// In en, this message translates to:
  /// **'Single Sign on'**
  String get singlesignon;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @sourceCode.
  ///
  /// In en, this message translates to:
  /// **'Source code'**
  String get sourceCode;

  /// No description provided for @spaceIsPublic.
  ///
  /// In en, this message translates to:
  /// **'Space is public'**
  String get spaceIsPublic;

  /// No description provided for @spaceName.
  ///
  /// In en, this message translates to:
  /// **'Space name'**
  String get spaceName;

  /// No description provided for @startedACall.
  ///
  /// In en, this message translates to:
  /// **'{senderName} started a call'**
  String startedACall(String senderName);

  /// No description provided for @startFirstChat.
  ///
  /// In en, this message translates to:
  /// **'Start your first chat'**
  String get startFirstChat;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @statusExampleMessage.
  ///
  /// In en, this message translates to:
  /// **'How are you today?'**
  String get statusExampleMessage;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @synchronizingPleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Synchronizing… Please wait.'**
  String get synchronizingPleaseWait;

  /// No description provided for @synchronizingPleaseWaitCounter.
  ///
  /// In en, this message translates to:
  /// **' Synchronizing… ({percentage}%)'**
  String synchronizingPleaseWaitCounter(String percentage);

  /// No description provided for @systemTheme.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemTheme;

  /// No description provided for @theyDontMatch.
  ///
  /// In en, this message translates to:
  /// **'They Don\'t Match'**
  String get theyDontMatch;

  /// No description provided for @theyMatch.
  ///
  /// In en, this message translates to:
  /// **'They Match'**
  String get theyMatch;

  /// Title for the application
  ///
  /// In en, this message translates to:
  /// **'REChain'**
  String get title;

  /// No description provided for @toggleFavorite.
  ///
  /// In en, this message translates to:
  /// **'Toggle Favorite'**
  String get toggleFavorite;

  /// No description provided for @toggleMuted.
  ///
  /// In en, this message translates to:
  /// **'Toggle Muted'**
  String get toggleMuted;

  /// No description provided for @toggleUnread.
  ///
  /// In en, this message translates to:
  /// **'Mark Read/Unread'**
  String get toggleUnread;

  /// No description provided for @tooManyRequestsWarning.
  ///
  /// In en, this message translates to:
  /// **'Too many requests. Please try again later!'**
  String get tooManyRequestsWarning;

  /// No description provided for @transferFromAnotherDevice.
  ///
  /// In en, this message translates to:
  /// **'Transfer from another device'**
  String get transferFromAnotherDevice;

  /// No description provided for @tryToSendAgain.
  ///
  /// In en, this message translates to:
  /// **'Try to send again'**
  String get tryToSendAgain;

  /// No description provided for @unavailable.
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get unavailable;

  /// No description provided for @unbannedUser.
  ///
  /// In en, this message translates to:
  /// **'{username} unbanned {targetName}'**
  String unbannedUser(String username, String targetName);

  /// No description provided for @unblockDevice.
  ///
  /// In en, this message translates to:
  /// **'Unblock Device'**
  String get unblockDevice;

  /// No description provided for @unknownDevice.
  ///
  /// In en, this message translates to:
  /// **'Unknown device'**
  String get unknownDevice;

  /// No description provided for @unknownEncryptionAlgorithm.
  ///
  /// In en, this message translates to:
  /// **'Unknown encryption algorithm'**
  String get unknownEncryptionAlgorithm;

  /// No description provided for @unknownEvent.
  ///
  /// In en, this message translates to:
  /// **'Unknown event \'{type}\''**
  String unknownEvent(String type);

  /// No description provided for @unmuteChat.
  ///
  /// In en, this message translates to:
  /// **'Unmute chat'**
  String get unmuteChat;

  /// No description provided for @unpin.
  ///
  /// In en, this message translates to:
  /// **'Unpin'**
  String get unpin;

  /// No description provided for @unreadChats.
  ///
  /// In en, this message translates to:
  /// **'{unreadCount, plural, =1{1 unread chat} other{{unreadCount} unread chats}}'**
  String unreadChats(int unreadCount);

  /// No description provided for @userAndOthersAreTyping.
  ///
  /// In en, this message translates to:
  /// **'{username} and {count} others are typing…'**
  String userAndOthersAreTyping(String username, int count);

  /// No description provided for @userAndUserAreTyping.
  ///
  /// In en, this message translates to:
  /// **'{username} and {username2} are typing…'**
  String userAndUserAreTyping(String username, String username2);

  /// No description provided for @userIsTyping.
  ///
  /// In en, this message translates to:
  /// **'{username} is typing…'**
  String userIsTyping(String username);

  /// No description provided for @userLeftTheChat.
  ///
  /// In en, this message translates to:
  /// **'🚪 {username} left the chat'**
  String userLeftTheChat(String username);

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @userSentUnknownEvent.
  ///
  /// In en, this message translates to:
  /// **'{username} sent a {type} event'**
  String userSentUnknownEvent(String username, String type);

  /// No description provided for @unverified.
  ///
  /// In en, this message translates to:
  /// **'Unverified'**
  String get unverified;

  /// No description provided for @verified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get verified;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @verifyStart.
  ///
  /// In en, this message translates to:
  /// **'Start Verification'**
  String get verifyStart;

  /// No description provided for @verifySuccess.
  ///
  /// In en, this message translates to:
  /// **'You successfully verified!'**
  String get verifySuccess;

  /// No description provided for @verifyTitle.
  ///
  /// In en, this message translates to:
  /// **'Verifying other account'**
  String get verifyTitle;

  /// No description provided for @videoCall.
  ///
  /// In en, this message translates to:
  /// **'Video call'**
  String get videoCall;

  /// No description provided for @visibilityOfTheChatHistory.
  ///
  /// In en, this message translates to:
  /// **'Visibility of the chat history'**
  String get visibilityOfTheChatHistory;

  /// No description provided for @visibleForAllParticipants.
  ///
  /// In en, this message translates to:
  /// **'Visible for all participants'**
  String get visibleForAllParticipants;

  /// No description provided for @visibleForEveryone.
  ///
  /// In en, this message translates to:
  /// **'Visible for everyone'**
  String get visibleForEveryone;

  /// No description provided for @voiceMessage.
  ///
  /// In en, this message translates to:
  /// **'Voice message'**
  String get voiceMessage;

  /// No description provided for @waitingPartnerAcceptRequest.
  ///
  /// In en, this message translates to:
  /// **'Waiting for partner to accept the request…'**
  String get waitingPartnerAcceptRequest;

  /// No description provided for @waitingPartnerEmoji.
  ///
  /// In en, this message translates to:
  /// **'Waiting for partner to accept the emoji…'**
  String get waitingPartnerEmoji;

  /// No description provided for @waitingPartnerNumbers.
  ///
  /// In en, this message translates to:
  /// **'Waiting for partner to accept the numbers…'**
  String get waitingPartnerNumbers;

  /// No description provided for @wallpaper.
  ///
  /// In en, this message translates to:
  /// **'Wallpaper:'**
  String get wallpaper;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'Warning!'**
  String get warning;

  /// No description provided for @weSentYouAnEmail.
  ///
  /// In en, this message translates to:
  /// **'We sent you an email'**
  String get weSentYouAnEmail;

  /// No description provided for @whoCanPerformWhichAction.
  ///
  /// In en, this message translates to:
  /// **'Who can perform which action'**
  String get whoCanPerformWhichAction;

  /// No description provided for @whoIsAllowedToJoinThisGroup.
  ///
  /// In en, this message translates to:
  /// **'Who is allowed to join this group'**
  String get whoIsAllowedToJoinThisGroup;

  /// No description provided for @whyDoYouWantToReportThis.
  ///
  /// In en, this message translates to:
  /// **'Why do you want to report this?'**
  String get whyDoYouWantToReportThis;

  /// No description provided for @wipeChatBackup.
  ///
  /// In en, this message translates to:
  /// **'Wipe your chat backup to create a new recovery key?'**
  String get wipeChatBackup;

  /// No description provided for @withTheseAddressesRecoveryDescription.
  ///
  /// In en, this message translates to:
  /// **'With these addresses you can recover your password.'**
  String get withTheseAddressesRecoveryDescription;

  /// No description provided for @writeAMessage.
  ///
  /// In en, this message translates to:
  /// **'Write a message…'**
  String get writeAMessage;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @you.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get you;

  /// No description provided for @youAreNoLongerParticipatingInThisChat.
  ///
  /// In en, this message translates to:
  /// **'You are no longer participating in this chat'**
  String get youAreNoLongerParticipatingInThisChat;

  /// No description provided for @youHaveBeenBannedFromThisChat.
  ///
  /// In en, this message translates to:
  /// **'You have been banned from this chat'**
  String get youHaveBeenBannedFromThisChat;

  /// No description provided for @yourPublicKey.
  ///
  /// In en, this message translates to:
  /// **'Your public key'**
  String get yourPublicKey;

  /// No description provided for @messageInfo.
  ///
  /// In en, this message translates to:
  /// **'Message info'**
  String get messageInfo;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @messageType.
  ///
  /// In en, this message translates to:
  /// **'Message Type'**
  String get messageType;

  /// No description provided for @sender.
  ///
  /// In en, this message translates to:
  /// **'Sender'**
  String get sender;

  /// No description provided for @openGallery.
  ///
  /// In en, this message translates to:
  /// **'Open gallery'**
  String get openGallery;

  /// No description provided for @removeFromSpace.
  ///
  /// In en, this message translates to:
  /// **'Remove from space'**
  String get removeFromSpace;

  /// No description provided for @addToSpaceDescription.
  ///
  /// In en, this message translates to:
  /// **'Select a space to add this chat to it.'**
  String get addToSpaceDescription;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @pleaseEnterRecoveryKeyDescription.
  ///
  /// In en, this message translates to:
  /// **'To unlock your old messages, please enter your recovery key that has been generated in a previous session. Your recovery key is NOT your password.'**
  String get pleaseEnterRecoveryKeyDescription;

  /// No description provided for @publish.
  ///
  /// In en, this message translates to:
  /// **'Publish'**
  String get publish;

  /// No description provided for @videoWithSize.
  ///
  /// In en, this message translates to:
  /// **'Video ({size})'**
  String videoWithSize(String size);

  /// No description provided for @openChat.
  ///
  /// In en, this message translates to:
  /// **'Open Chat'**
  String get openChat;

  /// No description provided for @markAsRead.
  ///
  /// In en, this message translates to:
  /// **'Mark as read'**
  String get markAsRead;

  /// No description provided for @reportUser.
  ///
  /// In en, this message translates to:
  /// **'Report user'**
  String get reportUser;

  /// No description provided for @dismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get dismiss;

  /// No description provided for @reactedWith.
  ///
  /// In en, this message translates to:
  /// **'{sender} reacted with {reaction}'**
  String reactedWith(String sender, String reaction);

  /// No description provided for @pinMessage.
  ///
  /// In en, this message translates to:
  /// **'Pin to room'**
  String get pinMessage;

  /// No description provided for @confirmEventUnpin.
  ///
  /// In en, this message translates to:
  /// **'Are you sure to permanently unpin the event?'**
  String get confirmEventUnpin;

  /// No description provided for @emojis.
  ///
  /// In en, this message translates to:
  /// **'Emojis'**
  String get emojis;

  /// No description provided for @placeCall.
  ///
  /// In en, this message translates to:
  /// **'Place call'**
  String get placeCall;

  /// No description provided for @voiceCall.
  ///
  /// In en, this message translates to:
  /// **'Voice call'**
  String get voiceCall;

  /// No description provided for @unsupportedAndroidVersion.
  ///
  /// In en, this message translates to:
  /// **'Unsupported Android version'**
  String get unsupportedAndroidVersion;

  /// No description provided for @unsupportedAndroidVersionLong.
  ///
  /// In en, this message translates to:
  /// **'This feature requires a newer Android version. Please check for updates or Mobile Katya OS support.'**
  String get unsupportedAndroidVersionLong;

  /// No description provided for @videoCallsBetaWarning.
  ///
  /// In en, this message translates to:
  /// **'Please note that video calls are currently in beta. They might not work as expected or work at all on all platforms.'**
  String get videoCallsBetaWarning;

  /// No description provided for @experimentalVideoCalls.
  ///
  /// In en, this message translates to:
  /// **'Experimental video calls'**
  String get experimentalVideoCalls;

  /// No description provided for @emailOrUsername.
  ///
  /// In en, this message translates to:
  /// **'Email or username'**
  String get emailOrUsername;

  /// No description provided for @indexedDbErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Private mode issues'**
  String get indexedDbErrorTitle;

  /// No description provided for @indexedDbErrorLong.
  ///
  /// In en, this message translates to:
  /// **'The message storage is unfortunately not enabled in private mode by default.\nPlease visit\n - about:config\n - set dom.indexedDB.privateBrowsing.enabled to true\nOtherwise, it is not possible to run REChain.'**
  String get indexedDbErrorLong;

  /// No description provided for @switchToAccount.
  ///
  /// In en, this message translates to:
  /// **'Switch to account {number}'**
  String switchToAccount(String number);

  /// No description provided for @nextAccount.
  ///
  /// In en, this message translates to:
  /// **'Next account'**
  String get nextAccount;

  /// No description provided for @previousAccount.
  ///
  /// In en, this message translates to:
  /// **'Previous account'**
  String get previousAccount;

  /// No description provided for @addWidget.
  ///
  /// In en, this message translates to:
  /// **'Add widget'**
  String get addWidget;

  /// No description provided for @widgetVideo.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get widgetVideo;

  /// No description provided for @widgetEtherpad.
  ///
  /// In en, this message translates to:
  /// **'Text note'**
  String get widgetEtherpad;

  /// No description provided for @widgetJitsi.
  ///
  /// In en, this message translates to:
  /// **'Jitsi Meet'**
  String get widgetJitsi;

  /// No description provided for @widgetCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get widgetCustom;

  /// No description provided for @widgetName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get widgetName;

  /// No description provided for @widgetUrlError.
  ///
  /// In en, this message translates to:
  /// **'This is not a valid URL.'**
  String get widgetUrlError;

  /// No description provided for @widgetNameError.
  ///
  /// In en, this message translates to:
  /// **'Please provide a display name.'**
  String get widgetNameError;

  /// No description provided for @errorAddingWidget.
  ///
  /// In en, this message translates to:
  /// **'Error adding the widget.'**
  String get errorAddingWidget;

  /// No description provided for @youRejectedTheInvitation.
  ///
  /// In en, this message translates to:
  /// **'You rejected the invitation'**
  String get youRejectedTheInvitation;

  /// No description provided for @youJoinedTheChat.
  ///
  /// In en, this message translates to:
  /// **'You joined the chat'**
  String get youJoinedTheChat;

  /// No description provided for @youAcceptedTheInvitation.
  ///
  /// In en, this message translates to:
  /// **'👍 You accepted the invitation'**
  String get youAcceptedTheInvitation;

  /// No description provided for @youBannedUser.
  ///
  /// In en, this message translates to:
  /// **'You banned {user}'**
  String youBannedUser(String user);

  /// No description provided for @youHaveWithdrawnTheInvitationFor.
  ///
  /// In en, this message translates to:
  /// **'You have withdrawn the invitation for {user}'**
  String youHaveWithdrawnTheInvitationFor(String user);

  /// No description provided for @youInvitedToBy.
  ///
  /// In en, this message translates to:
  /// **'📩 You have been invited via link to:\n{alias}'**
  String youInvitedToBy(String alias);

  /// No description provided for @youInvitedBy.
  ///
  /// In en, this message translates to:
  /// **'📩 You have been invited by {user}'**
  String youInvitedBy(String user);

  /// No description provided for @invitedBy.
  ///
  /// In en, this message translates to:
  /// **'📩 Invited by {user}'**
  String invitedBy(String user);

  /// No description provided for @youInvitedUser.
  ///
  /// In en, this message translates to:
  /// **'📩 You invited {user}'**
  String youInvitedUser(String user);

  /// No description provided for @youKicked.
  ///
  /// In en, this message translates to:
  /// **'👞 You kicked {user}'**
  String youKicked(String user);

  /// No description provided for @youKickedAndBanned.
  ///
  /// In en, this message translates to:
  /// **'🙅 You kicked and banned {user}'**
  String youKickedAndBanned(String user);

  /// No description provided for @youUnbannedUser.
  ///
  /// In en, this message translates to:
  /// **'You unbanned {user}'**
  String youUnbannedUser(String user);

  /// No description provided for @hasKnocked.
  ///
  /// In en, this message translates to:
  /// **'🚪 {user} has knocked'**
  String hasKnocked(String user);

  /// No description provided for @usersMustKnock.
  ///
  /// In en, this message translates to:
  /// **'Users must knock'**
  String get usersMustKnock;

  /// No description provided for @noOneCanJoin.
  ///
  /// In en, this message translates to:
  /// **'No one can join'**
  String get noOneCanJoin;

  /// No description provided for @userWouldLikeToChangeTheChat.
  ///
  /// In en, this message translates to:
  /// **'{user} would like to join the chat.'**
  String userWouldLikeToChangeTheChat(String user);

  /// No description provided for @noPublicLinkHasBeenCreatedYet.
  ///
  /// In en, this message translates to:
  /// **'No public link has been created yet'**
  String get noPublicLinkHasBeenCreatedYet;

  /// No description provided for @knock.
  ///
  /// In en, this message translates to:
  /// **'Knock'**
  String get knock;

  /// No description provided for @users.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get users;

  /// No description provided for @unlockOldMessages.
  ///
  /// In en, this message translates to:
  /// **'Unlock old messages'**
  String get unlockOldMessages;

  /// No description provided for @storeInSecureStorageDescription.
  ///
  /// In en, this message translates to:
  /// **'Store the recovery key in the secure storage of this device.'**
  String get storeInSecureStorageDescription;

  /// No description provided for @saveKeyManuallyDescription.
  ///
  /// In en, this message translates to:
  /// **'Save this key manually by triggering the system share dialog or clipboard.'**
  String get saveKeyManuallyDescription;

  /// No description provided for @storeInAndroidKeystore.
  ///
  /// In en, this message translates to:
  /// **'Store in Android KeyStore'**
  String get storeInAndroidKeystore;

  /// No description provided for @storeInAppleKeyChain.
  ///
  /// In en, this message translates to:
  /// **'Store in Apple KeyChain'**
  String get storeInAppleKeyChain;

  /// No description provided for @storeSecurlyOnThisDevice.
  ///
  /// In en, this message translates to:
  /// **'Store securely on this device'**
  String get storeSecurlyOnThisDevice;

  /// No description provided for @countFiles.
  ///
  /// In en, this message translates to:
  /// **'{count} files'**
  String countFiles(int count);

  /// No description provided for @user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// No description provided for @custom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get custom;

  /// No description provided for @foregroundServiceRunning.
  ///
  /// In en, this message translates to:
  /// **'This notification appears when the foreground service is running.'**
  String get foregroundServiceRunning;

  /// No description provided for @screenSharingTitle.
  ///
  /// In en, this message translates to:
  /// **'screen sharing'**
  String get screenSharingTitle;

  /// No description provided for @screenSharingDetail.
  ///
  /// In en, this message translates to:
  /// **'You are sharing your screen in FuffyChat'**
  String get screenSharingDetail;

  /// No description provided for @callingPermissions.
  ///
  /// In en, this message translates to:
  /// **'Calling permissions'**
  String get callingPermissions;

  /// No description provided for @callingAccount.
  ///
  /// In en, this message translates to:
  /// **'Calling account'**
  String get callingAccount;

  /// No description provided for @callingAccountDetails.
  ///
  /// In en, this message translates to:
  /// **'Allows REChain to use the native android dialer app.'**
  String get callingAccountDetails;

  /// No description provided for @appearOnTop.
  ///
  /// In en, this message translates to:
  /// **'Appear on top'**
  String get appearOnTop;

  /// No description provided for @appearOnTopDetails.
  ///
  /// In en, this message translates to:
  /// **'Allows the app to appear on top (not needed if you already have REChain setup as a calling account)'**
  String get appearOnTopDetails;

  /// No description provided for @otherCallingPermissions.
  ///
  /// In en, this message translates to:
  /// **'Microphone, camera and other REChain permissions'**
  String get otherCallingPermissions;

  /// No description provided for @whyIsThisMessageEncrypted.
  ///
  /// In en, this message translates to:
  /// **'Why is this message unreadable?'**
  String get whyIsThisMessageEncrypted;

  /// No description provided for @noKeyForThisMessage.
  ///
  /// In en, this message translates to:
  /// **'This can happen if the message was sent before you have signed in to your account at this device.\n\nIt is also possible that the sender has blocked your device or something went wrong with the internet connection.\n\nAre you able to read the message on another session? Then you can transfer the message from it! Go to Settings > Devices and make sure that your devices have verified each other. When you open the room the next time and both sessions are in the foreground, the keys will be transmitted automatically.\n\nDo you not want to lose the keys when logging out or switching devices? Make sure that you have enabled the chat backup in the settings.'**
  String get noKeyForThisMessage;

  /// No description provided for @newGroup.
  ///
  /// In en, this message translates to:
  /// **'New group'**
  String get newGroup;

  /// No description provided for @newSpace.
  ///
  /// In en, this message translates to:
  /// **'New space'**
  String get newSpace;

  /// No description provided for @enterSpace.
  ///
  /// In en, this message translates to:
  /// **'Enter space'**
  String get enterSpace;

  /// No description provided for @enterRoom.
  ///
  /// In en, this message translates to:
  /// **'Enter room'**
  String get enterRoom;

  /// No description provided for @allSpaces.
  ///
  /// In en, this message translates to:
  /// **'All spaces'**
  String get allSpaces;

  /// No description provided for @numChats.
  ///
  /// In en, this message translates to:
  /// **'{number} chats'**
  String numChats(String number);

  /// No description provided for @hideUnimportantStateEvents.
  ///
  /// In en, this message translates to:
  /// **'Hide unimportant state events'**
  String get hideUnimportantStateEvents;

  /// No description provided for @hidePresences.
  ///
  /// In en, this message translates to:
  /// **'Hide Status List?'**
  String get hidePresences;

  /// No description provided for @doNotShowAgain.
  ///
  /// In en, this message translates to:
  /// **'Do not show again'**
  String get doNotShowAgain;

  /// No description provided for @wasDirectChatDisplayName.
  ///
  /// In en, this message translates to:
  /// **'Empty chat (was {oldDisplayName})'**
  String wasDirectChatDisplayName(String oldDisplayName);

  /// No description provided for @newSpaceDescription.
  ///
  /// In en, this message translates to:
  /// **'Spaces allows you to consolidate your chats and build private or public communities.'**
  String get newSpaceDescription;

  /// No description provided for @encryptThisChat.
  ///
  /// In en, this message translates to:
  /// **'Encrypt this chat'**
  String get encryptThisChat;

  /// No description provided for @disableEncryptionWarning.
  ///
  /// In en, this message translates to:
  /// **'For security reasons you can not disable encryption in a chat, where it has been enabled before.'**
  String get disableEncryptionWarning;

  /// No description provided for @sorryThatsNotPossible.
  ///
  /// In en, this message translates to:
  /// **'Sorry... that is not possible'**
  String get sorryThatsNotPossible;

  /// No description provided for @deviceKeys.
  ///
  /// In en, this message translates to:
  /// **'Device keys:'**
  String get deviceKeys;

  /// No description provided for @reopenChat.
  ///
  /// In en, this message translates to:
  /// **'Reopen chat'**
  String get reopenChat;

  /// No description provided for @noBackupWarning.
  ///
  /// In en, this message translates to:
  /// **'Warning! Without enabling chat backup, you will lose access to your encrypted messages. It is highly recommended to enable the chat backup first before logging out.'**
  String get noBackupWarning;

  /// No description provided for @noOtherDevicesFound.
  ///
  /// In en, this message translates to:
  /// **'No other devices found'**
  String get noOtherDevicesFound;

  /// No description provided for @fileIsTooBigForServer.
  ///
  /// In en, this message translates to:
  /// **'Unable to send! The server only supports attachments up to {max}.'**
  String fileIsTooBigForServer(String max);

  /// No description provided for @fileHasBeenSavedAt.
  ///
  /// In en, this message translates to:
  /// **'File has been saved at {path}'**
  String fileHasBeenSavedAt(String path);

  /// No description provided for @jumpToLastReadMessage.
  ///
  /// In en, this message translates to:
  /// **'Jump to last read message'**
  String get jumpToLastReadMessage;

  /// No description provided for @readUpToHere.
  ///
  /// In en, this message translates to:
  /// **'Read up to here'**
  String get readUpToHere;

  /// No description provided for @jump.
  ///
  /// In en, this message translates to:
  /// **'Jump'**
  String get jump;

  /// No description provided for @openLinkInBrowser.
  ///
  /// In en, this message translates to:
  /// **'Open link in browser'**
  String get openLinkInBrowser;

  /// No description provided for @reportErrorDescription.
  ///
  /// In en, this message translates to:
  /// **'😭 Oh no. Something went wrong. If you want, you can report this bug to the developers.'**
  String get reportErrorDescription;

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'report'**
  String get report;

  /// No description provided for @signInWithPassword.
  ///
  /// In en, this message translates to:
  /// **'Sign in with password'**
  String get signInWithPassword;

  /// No description provided for @pleaseTryAgainLaterOrChooseDifferentServer.
  ///
  /// In en, this message translates to:
  /// **'Please try again later or choose a different server.'**
  String get pleaseTryAgainLaterOrChooseDifferentServer;

  /// No description provided for @signInWith.
  ///
  /// In en, this message translates to:
  /// **'Sign in with {provider}'**
  String signInWith(String provider);

  /// No description provided for @profileNotFound.
  ///
  /// In en, this message translates to:
  /// **'The user could not be found on the server. Maybe there is a connection problem or the user doesn\'t exist.'**
  String get profileNotFound;

  /// No description provided for @setTheme.
  ///
  /// In en, this message translates to:
  /// **'Set theme:'**
  String get setTheme;

  /// No description provided for @setColorTheme.
  ///
  /// In en, this message translates to:
  /// **'Set color theme:'**
  String get setColorTheme;

  /// No description provided for @invite.
  ///
  /// In en, this message translates to:
  /// **'Invite'**
  String get invite;

  /// No description provided for @inviteGroupChat.
  ///
  /// In en, this message translates to:
  /// **'📨 Group chat invite'**
  String get inviteGroupChat;

  /// No description provided for @invitePrivateChat.
  ///
  /// In en, this message translates to:
  /// **'📨 Private chat invite'**
  String get invitePrivateChat;

  /// No description provided for @invalidInput.
  ///
  /// In en, this message translates to:
  /// **'Invalid input!'**
  String get invalidInput;

  /// No description provided for @wrongPinEntered.
  ///
  /// In en, this message translates to:
  /// **'Wrong pin entered! Try again in {seconds} seconds...'**
  String wrongPinEntered(int seconds);

  /// No description provided for @pleaseEnterANumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a number greater than 0'**
  String get pleaseEnterANumber;

  /// No description provided for @archiveRoomDescription.
  ///
  /// In en, this message translates to:
  /// **'The chat will be moved to the archive. Other users will be able to see that you have left the chat.'**
  String get archiveRoomDescription;

  /// No description provided for @roomUpgradeDescription.
  ///
  /// In en, this message translates to:
  /// **'The chat will then be recreated with the new room version. All participants will be notified that they need to switch to the new chat. You can find out more about room versions at https://spec.online.rechain.network/latest/rooms/'**
  String get roomUpgradeDescription;

  /// No description provided for @removeDevicesDescription.
  ///
  /// In en, this message translates to:
  /// **'You will be logged out of this device and will no longer be able to receive messages.'**
  String get removeDevicesDescription;

  /// No description provided for @banUserDescription.
  ///
  /// In en, this message translates to:
  /// **'The user will be banned from the chat and will not be able to enter the chat again until they are unbanned.'**
  String get banUserDescription;

  /// No description provided for @unbanUserDescription.
  ///
  /// In en, this message translates to:
  /// **'The user will be able to enter the chat again if they try.'**
  String get unbanUserDescription;

  /// No description provided for @kickUserDescription.
  ///
  /// In en, this message translates to:
  /// **'The user is kicked out of the chat but not banned. In public chats, the user can rejoin at any time.'**
  String get kickUserDescription;

  /// No description provided for @makeAdminDescription.
  ///
  /// In en, this message translates to:
  /// **'Once you make this user admin, you may not be able to undo this as they will then have the same permissions as you.'**
  String get makeAdminDescription;

  /// No description provided for @pushNotificationsNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Push notifications not available'**
  String get pushNotificationsNotAvailable;

  /// No description provided for @learnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn more'**
  String get learnMore;

  /// No description provided for @yourGlobalUserIdIs.
  ///
  /// In en, this message translates to:
  /// **'Your global user-ID is: '**
  String get yourGlobalUserIdIs;

  /// No description provided for @noUsersFoundWithQuery.
  ///
  /// In en, this message translates to:
  /// **'Unfortunately no user could be found with \"{query}\". Please check whether you made a typo.'**
  String noUsersFoundWithQuery(String query);

  /// No description provided for @knocking.
  ///
  /// In en, this message translates to:
  /// **'Knocking'**
  String get knocking;

  /// No description provided for @chatCanBeDiscoveredViaSearchOnServer.
  ///
  /// In en, this message translates to:
  /// **'Chat can be discovered via the search on {server}'**
  String chatCanBeDiscoveredViaSearchOnServer(String server);

  /// No description provided for @searchChatsRooms.
  ///
  /// In en, this message translates to:
  /// **'Search for #chats, @users...'**
  String get searchChatsRooms;

  /// No description provided for @nothingFound.
  ///
  /// In en, this message translates to:
  /// **'Nothing found...'**
  String get nothingFound;

  /// No description provided for @groupName.
  ///
  /// In en, this message translates to:
  /// **'Group name'**
  String get groupName;

  /// No description provided for @createGroupAndInviteUsers.
  ///
  /// In en, this message translates to:
  /// **'Create a group and invite users'**
  String get createGroupAndInviteUsers;

  /// No description provided for @groupCanBeFoundViaSearch.
  ///
  /// In en, this message translates to:
  /// **'Group can be found via search'**
  String get groupCanBeFoundViaSearch;

  /// No description provided for @wrongRecoveryKey.
  ///
  /// In en, this message translates to:
  /// **'Sorry... this does not seem to be the correct recovery key.'**
  String get wrongRecoveryKey;

  /// No description provided for @startConversation.
  ///
  /// In en, this message translates to:
  /// **'Start conversation'**
  String get startConversation;

  /// No description provided for @commandHint_sendraw.
  ///
  /// In en, this message translates to:
  /// **'Send raw json'**
  String get commandHint_sendraw;

  /// No description provided for @databaseMigrationTitle.
  ///
  /// In en, this message translates to:
  /// **'Database is optimized'**
  String get databaseMigrationTitle;

  /// No description provided for @databaseMigrationBody.
  ///
  /// In en, this message translates to:
  /// **'Please wait. This may take a moment.'**
  String get databaseMigrationBody;

  /// No description provided for @leaveEmptyToClearStatus.
  ///
  /// In en, this message translates to:
  /// **'Leave empty to clear your status.'**
  String get leaveEmptyToClearStatus;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @searchForUsers.
  ///
  /// In en, this message translates to:
  /// **'Search for @users...'**
  String get searchForUsers;

  /// No description provided for @pleaseEnterYourCurrentPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your current password'**
  String get pleaseEnterYourCurrentPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPassword;

  /// No description provided for @pleaseChooseAStrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Please choose a strong password'**
  String get pleaseChooseAStrongPassword;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @passwordIsWrong.
  ///
  /// In en, this message translates to:
  /// **'Your entered password is wrong'**
  String get passwordIsWrong;

  /// No description provided for @publicLink.
  ///
  /// In en, this message translates to:
  /// **'Public link'**
  String get publicLink;

  /// No description provided for @publicChatAddresses.
  ///
  /// In en, this message translates to:
  /// **'Public chat addresses'**
  String get publicChatAddresses;

  /// No description provided for @createNewAddress.
  ///
  /// In en, this message translates to:
  /// **'Create new address'**
  String get createNewAddress;

  /// No description provided for @joinSpace.
  ///
  /// In en, this message translates to:
  /// **'Join space'**
  String get joinSpace;

  /// No description provided for @publicSpaces.
  ///
  /// In en, this message translates to:
  /// **'Public spaces'**
  String get publicSpaces;

  /// No description provided for @addChatOrSubSpace.
  ///
  /// In en, this message translates to:
  /// **'Add chat or sub space'**
  String get addChatOrSubSpace;

  /// No description provided for @subspace.
  ///
  /// In en, this message translates to:
  /// **'Subspace'**
  String get subspace;

  /// No description provided for @decline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get decline;

  /// No description provided for @thisDevice.
  ///
  /// In en, this message translates to:
  /// **'This device:'**
  String get thisDevice;

  /// No description provided for @initAppError.
  ///
  /// In en, this message translates to:
  /// **'An error occured while init the app'**
  String get initAppError;

  /// No description provided for @userRole.
  ///
  /// In en, this message translates to:
  /// **'User role'**
  String get userRole;

  /// No description provided for @minimumPowerLevel.
  ///
  /// In en, this message translates to:
  /// **'{level} is the minimum power level.'**
  String minimumPowerLevel(String level);

  /// No description provided for @searchIn.
  ///
  /// In en, this message translates to:
  /// **'Search in chat \"{chat}\"...'**
  String searchIn(String chat);

  /// No description provided for @searchMore.
  ///
  /// In en, this message translates to:
  /// **'Search more...'**
  String get searchMore;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @files.
  ///
  /// In en, this message translates to:
  /// **'Files'**
  String get files;

  /// No description provided for @databaseBuildErrorBody.
  ///
  /// In en, this message translates to:
  /// **'Unable to build the SQlite database. The app tries to use the legacy database for now. Please report this error to the developers at {url}. The error message is: {error}'**
  String databaseBuildErrorBody(String url, String error);

  /// No description provided for @sessionLostBody.
  ///
  /// In en, this message translates to:
  /// **'Your session is lost. Please report this error to the developers at {url}. The error message is: {error}'**
  String sessionLostBody(String url, String error);

  /// No description provided for @restoreSessionBody.
  ///
  /// In en, this message translates to:
  /// **'The app now tries to restore your session from the backup. Please report this error to the developers at {url}. The error message is: {error}'**
  String restoreSessionBody(String url, String error);

  /// No description provided for @forwardMessageTo.
  ///
  /// In en, this message translates to:
  /// **'Forward message to {roomName}?'**
  String forwardMessageTo(String roomName);

  /// No description provided for @sendReadReceipts.
  ///
  /// In en, this message translates to:
  /// **'Send read receipts'**
  String get sendReadReceipts;

  /// No description provided for @sendTypingNotificationsDescription.
  ///
  /// In en, this message translates to:
  /// **'Other participants in a chat can see when you are typing a new message.'**
  String get sendTypingNotificationsDescription;

  /// No description provided for @sendReadReceiptsDescription.
  ///
  /// In en, this message translates to:
  /// **'Other participants in a chat can see when you have read a message.'**
  String get sendReadReceiptsDescription;

  /// No description provided for @formattedMessages.
  ///
  /// In en, this message translates to:
  /// **'Formatted messages'**
  String get formattedMessages;

  /// No description provided for @formattedMessagesDescription.
  ///
  /// In en, this message translates to:
  /// **'Display rich message content like bold text using markdown.'**
  String get formattedMessagesDescription;

  /// No description provided for @verifyOtherUser.
  ///
  /// In en, this message translates to:
  /// **'🔐 Verify other user'**
  String get verifyOtherUser;

  /// No description provided for @verifyOtherUserDescription.
  ///
  /// In en, this message translates to:
  /// **'If you verify another user, you can be sure that you know who you are really writing to. 💪\n\nWhen you start a verification, you and the other user will see a popup in the app. There you will then see a series of emojis or numbers that you have to compare with each other.\n\nThe best way to do this is to meet up or start a video call. 👭'**
  String get verifyOtherUserDescription;

  /// No description provided for @verifyOtherDevice.
  ///
  /// In en, this message translates to:
  /// **'🔐 Verify other device'**
  String get verifyOtherDevice;

  /// No description provided for @verifyOtherDeviceDescription.
  ///
  /// In en, this message translates to:
  /// **'When you verify another device, those devices can exchange keys, increasing your overall security. 💪 When you start a verification, a popup will appear in the app on both devices. There you will then see a series of emojis or numbers that you have to compare with each other. It\'s best to have both devices handy before you start the verification. 🤳'**
  String get verifyOtherDeviceDescription;

  /// No description provided for @acceptedKeyVerification.
  ///
  /// In en, this message translates to:
  /// **'{sender} accepted key verification'**
  String acceptedKeyVerification(String sender);

  /// No description provided for @canceledKeyVerification.
  ///
  /// In en, this message translates to:
  /// **'{sender} canceled key verification'**
  String canceledKeyVerification(String sender);

  /// No description provided for @completedKeyVerification.
  ///
  /// In en, this message translates to:
  /// **'{sender} completed key verification'**
  String completedKeyVerification(String sender);

  /// No description provided for @isReadyForKeyVerification.
  ///
  /// In en, this message translates to:
  /// **'{sender} is ready for key verification'**
  String isReadyForKeyVerification(String sender);

  /// No description provided for @requestedKeyVerification.
  ///
  /// In en, this message translates to:
  /// **'{sender} requested key verification'**
  String requestedKeyVerification(String sender);

  /// No description provided for @startedKeyVerification.
  ///
  /// In en, this message translates to:
  /// **'{sender} started key verification'**
  String startedKeyVerification(String sender);

  /// No description provided for @transparent.
  ///
  /// In en, this message translates to:
  /// **'Transparent'**
  String get transparent;

  /// No description provided for @incomingMessages.
  ///
  /// In en, this message translates to:
  /// **'Incoming messages'**
  String get incomingMessages;

  /// No description provided for @stickers.
  ///
  /// In en, this message translates to:
  /// **'Stickers'**
  String get stickers;

  /// No description provided for @discover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get discover;

  /// No description provided for @commandHint_ignore.
  ///
  /// In en, this message translates to:
  /// **'Ignore the given REChain ID'**
  String get commandHint_ignore;

  /// No description provided for @commandHint_unignore.
  ///
  /// In en, this message translates to:
  /// **'Unignore the given REChain ID'**
  String get commandHint_unignore;

  /// No description provided for @unreadChatsInApp.
  ///
  /// In en, this message translates to:
  /// **'{appname}: {unread} unread chats'**
  String unreadChatsInApp(String appname, String unread);

  /// No description provided for @noDatabaseEncryption.
  ///
  /// In en, this message translates to:
  /// **'Database encryption is not supported on this platform'**
  String get noDatabaseEncryption;

  /// No description provided for @thereAreCountUsersBlocked.
  ///
  /// In en, this message translates to:
  /// **'Right now there are {count} users blocked.'**
  String thereAreCountUsersBlocked(Object count);

  /// No description provided for @restricted.
  ///
  /// In en, this message translates to:
  /// **'Restricted'**
  String get restricted;

  /// No description provided for @knockRestricted.
  ///
  /// In en, this message translates to:
  /// **'Knock restricted'**
  String get knockRestricted;

  /// No description provided for @goToSpace.
  ///
  /// In en, this message translates to:
  /// **'Go to space: {space}'**
  String goToSpace(Object space);

  /// No description provided for @markAsUnread.
  ///
  /// In en, this message translates to:
  /// **'Mark as unread'**
  String get markAsUnread;

  /// No description provided for @userLevel.
  ///
  /// In en, this message translates to:
  /// **'{level} - User'**
  String userLevel(int level);

  /// No description provided for @moderatorLevel.
  ///
  /// In en, this message translates to:
  /// **'{level} - Moderator'**
  String moderatorLevel(int level);

  /// No description provided for @adminLevel.
  ///
  /// In en, this message translates to:
  /// **'{level} - Admin'**
  String adminLevel(int level);

  /// No description provided for @changeGeneralChatSettings.
  ///
  /// In en, this message translates to:
  /// **'Change general chat settings'**
  String get changeGeneralChatSettings;

  /// No description provided for @inviteOtherUsers.
  ///
  /// In en, this message translates to:
  /// **'Invite other users to this chat'**
  String get inviteOtherUsers;

  /// No description provided for @changeTheChatPermissions.
  ///
  /// In en, this message translates to:
  /// **'Change the chat permissions'**
  String get changeTheChatPermissions;

  /// No description provided for @changeTheVisibilityOfChatHistory.
  ///
  /// In en, this message translates to:
  /// **'Change the visibility of the chat history'**
  String get changeTheVisibilityOfChatHistory;

  /// No description provided for @changeTheCanonicalRoomAlias.
  ///
  /// In en, this message translates to:
  /// **'Change the main public chat address'**
  String get changeTheCanonicalRoomAlias;

  /// No description provided for @sendRoomNotifications.
  ///
  /// In en, this message translates to:
  /// **'Send a @room notifications'**
  String get sendRoomNotifications;

  /// No description provided for @changeTheDescriptionOfTheGroup.
  ///
  /// In en, this message translates to:
  /// **'Change the description of the chat'**
  String get changeTheDescriptionOfTheGroup;

  /// No description provided for @chatPermissionsDescription.
  ///
  /// In en, this message translates to:
  /// **'Define which power level is necessary for certain actions in this chat. The power levels 0, 50 and 100 are usually representing users, moderators and admins, but any gradation is possible.'**
  String get chatPermissionsDescription;

  /// No description provided for @updateInstalled.
  ///
  /// In en, this message translates to:
  /// **'🎉 Update {version} installed!'**
  String updateInstalled(String version);

  /// No description provided for @changelog.
  ///
  /// In en, this message translates to:
  /// **'Changelog'**
  String get changelog;

  /// No description provided for @sendCanceled.
  ///
  /// In en, this message translates to:
  /// **'Sending canceled'**
  String get sendCanceled;

  /// No description provided for @loginWithREChainId.
  ///
  /// In en, this message translates to:
  /// **'Login with REChain ID'**
  String get loginWithREChainId;

  /// No description provided for @discoverHomeservers.
  ///
  /// In en, this message translates to:
  /// **'Discover homeservers'**
  String get discoverHomeservers;

  /// No description provided for @whatIsAHomeserver.
  ///
  /// In en, this message translates to:
  /// **'What is a homeserver?'**
  String get whatIsAHomeserver;

  /// No description provided for @homeserverDescription.
  ///
  /// In en, this message translates to:
  /// **'All your data is stored on the homeserver, just like an email provider. You can choose which homeserver you want to use, while you can still communicate with everyone. Learn more at at https://online.rechain.network.'**
  String get homeserverDescription;

  /// No description provided for @doesNotSeemToBeAValidHomeserver.
  ///
  /// In en, this message translates to:
  /// **'Doesn\'t seem to be a compatible homeserver. Wrong URL?'**
  String get doesNotSeemToBeAValidHomeserver;

  /// No description provided for @calculatingFileSize.
  ///
  /// In en, this message translates to:
  /// **'Calculating file size...'**
  String get calculatingFileSize;

  /// No description provided for @prepareSendingAttachment.
  ///
  /// In en, this message translates to:
  /// **'Prepare sending attachment...'**
  String get prepareSendingAttachment;

  /// No description provided for @sendingAttachment.
  ///
  /// In en, this message translates to:
  /// **'Sending attachment...'**
  String get sendingAttachment;

  /// No description provided for @generatingVideoThumbnail.
  ///
  /// In en, this message translates to:
  /// **'Generating video thumbnail...'**
  String get generatingVideoThumbnail;

  /// No description provided for @compressVideo.
  ///
  /// In en, this message translates to:
  /// **'Compressing video...'**
  String get compressVideo;

  /// No description provided for @sendingAttachmentCountOfCount.
  ///
  /// In en, this message translates to:
  /// **'Sending attachment {index} of {length}...'**
  String sendingAttachmentCountOfCount(int index, int length);

  /// No description provided for @serverLimitReached.
  ///
  /// In en, this message translates to:
  /// **'Server limit reached! Waiting {seconds} seconds...'**
  String serverLimitReached(int seconds);

  /// No description provided for @oneOfYourDevicesIsNotVerified.
  ///
  /// In en, this message translates to:
  /// **'One of your devices is not verified'**
  String get oneOfYourDevicesIsNotVerified;

  /// No description provided for @noticeChatBackupDeviceVerification.
  ///
  /// In en, this message translates to:
  /// **'Note: When you connect all your devices to the chat backup, they are automatically verified.'**
  String get noticeChatBackupDeviceVerification;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @welcomeText.
  ///
  /// In en, this message translates to:
  /// **'Hey Hey 👋 This is REChain. You can sign in to any homeserver, which is compatible with https://online.rechain.network. And then chat with anyone. It\'s a huge decentralized messaging network!'**
  String get welcomeText;

  /// No description provided for @blur.
  ///
  /// In en, this message translates to:
  /// **'Blur:'**
  String get blur;

  /// No description provided for @opacity.
  ///
  /// In en, this message translates to:
  /// **'Opacity:'**
  String get opacity;

  /// No description provided for @setWallpaper.
  ///
  /// In en, this message translates to:
  /// **'Set wallpaper'**
  String get setWallpaper;

  /// No description provided for @manageAccount.
  ///
  /// In en, this message translates to:
  /// **'Manage account'**
  String get manageAccount;

  /// No description provided for @noContactInformationProvided.
  ///
  /// In en, this message translates to:
  /// **'Server does not provide any valid contact information'**
  String get noContactInformationProvided;

  /// No description provided for @contactServerAdmin.
  ///
  /// In en, this message translates to:
  /// **'Contact server admin'**
  String get contactServerAdmin;

  /// No description provided for @contactServerSecurity.
  ///
  /// In en, this message translates to:
  /// **'Contact server security'**
  String get contactServerSecurity;

  /// No description provided for @supportPage.
  ///
  /// In en, this message translates to:
  /// **'Support page'**
  String get supportPage;

  /// No description provided for @serverInformation.
  ///
  /// In en, this message translates to:
  /// **'Server information:'**
  String get serverInformation;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @website.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// No description provided for @compress.
  ///
  /// In en, this message translates to:
  /// **'Compress'**
  String get compress;

  /// No description provided for @boldText.
  ///
  /// In en, this message translates to:
  /// **'Bold text'**
  String get boldText;

  /// No description provided for @italicText.
  ///
  /// In en, this message translates to:
  /// **'Italic text'**
  String get italicText;

  /// No description provided for @strikeThrough.
  ///
  /// In en, this message translates to:
  /// **'Strikethrough'**
  String get strikeThrough;

  /// No description provided for @pleaseFillOut.
  ///
  /// In en, this message translates to:
  /// **'Please fill out'**
  String get pleaseFillOut;

  /// No description provided for @invalidUrl.
  ///
  /// In en, this message translates to:
  /// **'Invalid url'**
  String get invalidUrl;

  /// No description provided for @addLink.
  ///
  /// In en, this message translates to:
  /// **'Add link'**
  String get addLink;

  /// No description provided for @unableToJoinChat.
  ///
  /// In en, this message translates to:
  /// **'Unable to join chat. Maybe the other party has already closed the conversation.'**
  String get unableToJoinChat;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @otherPartyNotLoggedIn.
  ///
  /// In en, this message translates to:
  /// **'The other party is currently not logged in and therefore cannot receive messages!'**
  String get otherPartyNotLoggedIn;

  /// No description provided for @appWantsToUseForLogin.
  ///
  /// In en, this message translates to:
  /// **'Use \'{server}\' to log in'**
  String appWantsToUseForLogin(String server);

  /// No description provided for @appWantsToUseForLoginDescription.
  ///
  /// In en, this message translates to:
  /// **'You hereby allow the app and website to share information about you.'**
  String get appWantsToUseForLoginDescription;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @waitingForServer.
  ///
  /// In en, this message translates to:
  /// **'Waiting for server...'**
  String get waitingForServer;

  /// No description provided for @appIntroduction.
  ///
  /// In en, this message translates to:
  /// **'REChain lets you chat with your friends across different messengers. Learn more at https://online.rechain.network or just tap *Continue*.'**
  String get appIntroduction;

  /// No description provided for @newChatRequest.
  ///
  /// In en, this message translates to:
  /// **'📩 New chat request'**
  String get newChatRequest;

  /// No description provided for @contentNotificationSettings.
  ///
  /// In en, this message translates to:
  /// **'Content notification settings'**
  String get contentNotificationSettings;

  /// No description provided for @generalNotificationSettings.
  ///
  /// In en, this message translates to:
  /// **'General notification settings'**
  String get generalNotificationSettings;

  /// No description provided for @roomNotificationSettings.
  ///
  /// In en, this message translates to:
  /// **'Room notification settings'**
  String get roomNotificationSettings;

  /// No description provided for @userSpecificNotificationSettings.
  ///
  /// In en, this message translates to:
  /// **'User specific notification settings'**
  String get userSpecificNotificationSettings;

  /// No description provided for @otherNotificationSettings.
  ///
  /// In en, this message translates to:
  /// **'Other notification settings'**
  String get otherNotificationSettings;

  /// No description provided for @notificationRuleContainsUserName.
  ///
  /// In en, this message translates to:
  /// **'Contains User Name'**
  String get notificationRuleContainsUserName;

  /// No description provided for @notificationRuleContainsUserNameDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user when a message contains their username.'**
  String get notificationRuleContainsUserNameDescription;

  /// No description provided for @notificationRuleMaster.
  ///
  /// In en, this message translates to:
  /// **'Mute all notifications'**
  String get notificationRuleMaster;

  /// No description provided for @notificationRuleMasterDescription.
  ///
  /// In en, this message translates to:
  /// **'Overrides all other rules and disables all notifications.'**
  String get notificationRuleMasterDescription;

  /// No description provided for @notificationRuleSuppressNotices.
  ///
  /// In en, this message translates to:
  /// **'Suppress Automated Messages'**
  String get notificationRuleSuppressNotices;

  /// No description provided for @notificationRuleSuppressNoticesDescription.
  ///
  /// In en, this message translates to:
  /// **'Suppresses notifications from automated clients like bots.'**
  String get notificationRuleSuppressNoticesDescription;

  /// No description provided for @notificationRuleInviteForMe.
  ///
  /// In en, this message translates to:
  /// **'Invite for Me'**
  String get notificationRuleInviteForMe;

  /// No description provided for @notificationRuleInviteForMeDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user when they are invited to a room.'**
  String get notificationRuleInviteForMeDescription;

  /// No description provided for @notificationRuleMemberEvent.
  ///
  /// In en, this message translates to:
  /// **'Member Event'**
  String get notificationRuleMemberEvent;

  /// No description provided for @notificationRuleMemberEventDescription.
  ///
  /// In en, this message translates to:
  /// **'Suppresses notifications for membership events.'**
  String get notificationRuleMemberEventDescription;

  /// No description provided for @notificationRuleIsUserMention.
  ///
  /// In en, this message translates to:
  /// **'User Mention'**
  String get notificationRuleIsUserMention;

  /// No description provided for @notificationRuleIsUserMentionDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user when they are directly mentioned in a message.'**
  String get notificationRuleIsUserMentionDescription;

  /// No description provided for @notificationRuleContainsDisplayName.
  ///
  /// In en, this message translates to:
  /// **'Contains Display Name'**
  String get notificationRuleContainsDisplayName;

  /// No description provided for @notificationRuleContainsDisplayNameDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user when a message contains their display name.'**
  String get notificationRuleContainsDisplayNameDescription;

  /// No description provided for @notificationRuleIsRoomMention.
  ///
  /// In en, this message translates to:
  /// **'Room Mention'**
  String get notificationRuleIsRoomMention;

  /// No description provided for @notificationRuleIsRoomMentionDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user when there is a room mention.'**
  String get notificationRuleIsRoomMentionDescription;

  /// No description provided for @notificationRuleRoomnotif.
  ///
  /// In en, this message translates to:
  /// **'Room Notification'**
  String get notificationRuleRoomnotif;

  /// No description provided for @notificationRuleRoomnotifDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user when a message contains \'@room\'.'**
  String get notificationRuleRoomnotifDescription;

  /// No description provided for @notificationRuleTombstone.
  ///
  /// In en, this message translates to:
  /// **'Tombstone'**
  String get notificationRuleTombstone;

  /// No description provided for @notificationRuleTombstoneDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user about room deactivation messages.'**
  String get notificationRuleTombstoneDescription;

  /// No description provided for @notificationRuleReaction.
  ///
  /// In en, this message translates to:
  /// **'Reaction'**
  String get notificationRuleReaction;

  /// No description provided for @notificationRuleReactionDescription.
  ///
  /// In en, this message translates to:
  /// **'Suppresses notifications for reactions.'**
  String get notificationRuleReactionDescription;

  /// No description provided for @notificationRuleRoomServerAcl.
  ///
  /// In en, this message translates to:
  /// **'Room Server ACL'**
  String get notificationRuleRoomServerAcl;

  /// No description provided for @notificationRuleRoomServerAclDescription.
  ///
  /// In en, this message translates to:
  /// **'Suppresses notifications for room server access control lists (ACL).'**
  String get notificationRuleRoomServerAclDescription;

  /// No description provided for @notificationRuleSuppressEdits.
  ///
  /// In en, this message translates to:
  /// **'Suppress Edits'**
  String get notificationRuleSuppressEdits;

  /// No description provided for @notificationRuleSuppressEditsDescription.
  ///
  /// In en, this message translates to:
  /// **'Suppresses notifications for edited messages.'**
  String get notificationRuleSuppressEditsDescription;

  /// No description provided for @notificationRuleCall.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get notificationRuleCall;

  /// No description provided for @notificationRuleCallDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user about calls.'**
  String get notificationRuleCallDescription;

  /// No description provided for @notificationRuleEncryptedRoomOneToOne.
  ///
  /// In en, this message translates to:
  /// **'Encrypted Room One-to-One'**
  String get notificationRuleEncryptedRoomOneToOne;

  /// No description provided for @notificationRuleEncryptedRoomOneToOneDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user about messages in encrypted one-to-one rooms.'**
  String get notificationRuleEncryptedRoomOneToOneDescription;

  /// No description provided for @notificationRuleRoomOneToOne.
  ///
  /// In en, this message translates to:
  /// **'Room One-to-One'**
  String get notificationRuleRoomOneToOne;

  /// No description provided for @notificationRuleRoomOneToOneDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user about messages in one-to-one rooms.'**
  String get notificationRuleRoomOneToOneDescription;

  /// No description provided for @notificationRuleMessage.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get notificationRuleMessage;

  /// No description provided for @notificationRuleMessageDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user about general messages.'**
  String get notificationRuleMessageDescription;

  /// No description provided for @notificationRuleEncrypted.
  ///
  /// In en, this message translates to:
  /// **'Encrypted'**
  String get notificationRuleEncrypted;

  /// No description provided for @notificationRuleEncryptedDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user about messages in encrypted rooms.'**
  String get notificationRuleEncryptedDescription;

  /// No description provided for @notificationRuleJitsi.
  ///
  /// In en, this message translates to:
  /// **'Jitsi'**
  String get notificationRuleJitsi;

  /// No description provided for @notificationRuleJitsiDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifies the user about Jitsi widget events.'**
  String get notificationRuleJitsiDescription;

  /// No description provided for @notificationRuleServerAcl.
  ///
  /// In en, this message translates to:
  /// **'Suppress Server ACL Events'**
  String get notificationRuleServerAcl;

  /// No description provided for @notificationRuleServerAclDescription.
  ///
  /// In en, this message translates to:
  /// **'Suppresses notifications for Server ACL events.'**
  String get notificationRuleServerAclDescription;

  /// No description provided for @unknownPushRule.
  ///
  /// In en, this message translates to:
  /// **'Unknown push rule \'{rule}\''**
  String unknownPushRule(String rule);

  /// No description provided for @sentVoiceMessage.
  ///
  /// In en, this message translates to:
  /// **'🎙️ {duration} - Voice message from {sender}'**
  String sentVoiceMessage(String sender, String duration);

  /// No description provided for @deletePushRuleCanNotBeUndone.
  ///
  /// In en, this message translates to:
  /// **'If you delete this notification setting, this can not be undone.'**
  String get deletePushRuleCanNotBeUndone;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @shareKeysWith.
  ///
  /// In en, this message translates to:
  /// **'Share keys with...'**
  String get shareKeysWith;

  /// No description provided for @shareKeysWithDescription.
  ///
  /// In en, this message translates to:
  /// **'Which devices should be trusted so that they can read along your messages in encrypted chats?'**
  String get shareKeysWithDescription;

  /// No description provided for @allDevices.
  ///
  /// In en, this message translates to:
  /// **'All devices'**
  String get allDevices;

  /// No description provided for @crossVerifiedDevicesIfEnabled.
  ///
  /// In en, this message translates to:
  /// **'Cross verified devices if enabled'**
  String get crossVerifiedDevicesIfEnabled;

  /// No description provided for @crossVerifiedDevices.
  ///
  /// In en, this message translates to:
  /// **'Cross verified devices'**
  String get crossVerifiedDevices;

  /// No description provided for @verifiedDevicesOnly.
  ///
  /// In en, this message translates to:
  /// **'Verified devices only'**
  String get verifiedDevicesOnly;

  /// No description provided for @takeAPhoto.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get takeAPhoto;

  /// No description provided for @recordAVideo.
  ///
  /// In en, this message translates to:
  /// **'Record a video'**
  String get recordAVideo;

  /// No description provided for @optionalMessage.
  ///
  /// In en, this message translates to:
  /// **'(Optional) message...'**
  String get optionalMessage;

  /// No description provided for @notSupportedOnThisDevice.
  ///
  /// In en, this message translates to:
  /// **'Not supported on this device'**
  String get notSupportedOnThisDevice;

  /// No description provided for @enterNewChat.
  ///
  /// In en, this message translates to:
  /// **'Enter new chat'**
  String get enterNewChat;

  /// No description provided for @approve.
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get approve;

  /// No description provided for @youHaveKnocked.
  ///
  /// In en, this message translates to:
  /// **'You have knocked'**
  String get youHaveKnocked;

  /// No description provided for @pleaseWaitUntilInvited.
  ///
  /// In en, this message translates to:
  /// **'Please wait now, until someone from the room invites you.'**
  String get pleaseWaitUntilInvited;

  /// No description provided for @commandHint_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout your current device'**
  String get commandHint_logout;

  /// No description provided for @commandHint_logoutall.
  ///
  /// In en, this message translates to:
  /// **'Logout all active devices'**
  String get commandHint_logoutall;

  /// No description provided for @displayNavigationRail.
  ///
  /// In en, this message translates to:
  /// **'Show navigation rail on mobile'**
  String get displayNavigationRail;

  /// No description provided for @customReaction.
  ///
  /// In en, this message translates to:
  /// **'Custom reaction'**
  String get customReaction;

  /// No description provided for @moreEvents.
  ///
  /// In en, this message translates to:
  /// **'More events'**
  String get moreEvents;

  /// No description provided for @declineInvitation.
  ///
  /// In en, this message translates to:
  /// **'Decline invitation'**
  String get declineInvitation;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return lookupL10n(locale);
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'be',
        'bn',
        'bo',
        'ca',
        'cs',
        'da',
        'de',
        'el',
        'en',
        'eo',
        'es',
        'et',
        'eu',
        'fa',
        'fi',
        'fil',
        'fr',
        'ga',
        'gl',
        'he',
        'hi',
        'hr',
        'hu',
        'ia',
        'id',
        'ie',
        'it',
        'ja',
        'ka',
        'ko',
        'lt',
        'lv',
        'nb',
        'nl',
        'pl',
        'pt',
        'ro',
        'ru',
        'sk',
        'sl',
        'sr',
        'sv',
        'ta',
        'te',
        'th',
        'tr',
        'uk',
        'vi',
        'yue',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

Future<L10n> lookupL10n(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hant':
            return l10n_zh
                .loadLibrary()
                .then((dynamic _) => l10n_zh.L10nZhHant());
        }
        break;
      }
  }

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return l10n_pt
                .loadLibrary()
                .then((dynamic _) => l10n_pt.L10nPtBr());
          case 'PT':
            return l10n_pt
                .loadLibrary()
                .then((dynamic _) => l10n_pt.L10nPtPt());
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return l10n_ar.loadLibrary().then((dynamic _) => l10n_ar.L10nAr());
    case 'be':
      return l10n_be.loadLibrary().then((dynamic _) => l10n_be.L10nBe());
    case 'bn':
      return l10n_bn.loadLibrary().then((dynamic _) => l10n_bn.L10nBn());
    case 'bo':
      return l10n_bo.loadLibrary().then((dynamic _) => l10n_bo.L10nBo());
    case 'ca':
      return l10n_ca.loadLibrary().then((dynamic _) => l10n_ca.L10nCa());
    case 'cs':
      return l10n_cs.loadLibrary().then((dynamic _) => l10n_cs.L10nCs());
    case 'da':
      return l10n_da.loadLibrary().then((dynamic _) => l10n_da.L10nDa());
    case 'de':
      return l10n_de.loadLibrary().then((dynamic _) => l10n_de.L10nDe());
    case 'el':
      return l10n_el.loadLibrary().then((dynamic _) => l10n_el.L10nEl());
    case 'en':
      return l10n_en.loadLibrary().then((dynamic _) => l10n_en.L10nEn());
    case 'eo':
      return l10n_eo.loadLibrary().then((dynamic _) => l10n_eo.L10nEo());
    case 'es':
      return l10n_es.loadLibrary().then((dynamic _) => l10n_es.L10nEs());
    case 'et':
      return l10n_et.loadLibrary().then((dynamic _) => l10n_et.L10nEt());
    case 'eu':
      return l10n_eu.loadLibrary().then((dynamic _) => l10n_eu.L10nEu());
    case 'fa':
      return l10n_fa.loadLibrary().then((dynamic _) => l10n_fa.L10nFa());
    case 'fi':
      return l10n_fi.loadLibrary().then((dynamic _) => l10n_fi.L10nFi());
    case 'fil':
      return l10n_fil.loadLibrary().then((dynamic _) => l10n_fil.L10nFil());
    case 'fr':
      return l10n_fr.loadLibrary().then((dynamic _) => l10n_fr.L10nFr());
    case 'ga':
      return l10n_ga.loadLibrary().then((dynamic _) => l10n_ga.L10nGa());
    case 'gl':
      return l10n_gl.loadLibrary().then((dynamic _) => l10n_gl.L10nGl());
    case 'he':
      return l10n_he.loadLibrary().then((dynamic _) => l10n_he.L10nHe());
    case 'hi':
      return l10n_hi.loadLibrary().then((dynamic _) => l10n_hi.L10nHi());
    case 'hr':
      return l10n_hr.loadLibrary().then((dynamic _) => l10n_hr.L10nHr());
    case 'hu':
      return l10n_hu.loadLibrary().then((dynamic _) => l10n_hu.L10nHu());
    case 'ia':
      return l10n_ia.loadLibrary().then((dynamic _) => l10n_ia.L10nIa());
    case 'id':
      return l10n_id.loadLibrary().then((dynamic _) => l10n_id.L10nId());
    case 'ie':
      return l10n_ie.loadLibrary().then((dynamic _) => l10n_ie.L10nIe());
    case 'it':
      return l10n_it.loadLibrary().then((dynamic _) => l10n_it.L10nIt());
    case 'ja':
      return l10n_ja.loadLibrary().then((dynamic _) => l10n_ja.L10nJa());
    case 'ka':
      return l10n_ka.loadLibrary().then((dynamic _) => l10n_ka.L10nKa());
    case 'ko':
      return l10n_ko.loadLibrary().then((dynamic _) => l10n_ko.L10nKo());
    case 'lt':
      return l10n_lt.loadLibrary().then((dynamic _) => l10n_lt.L10nLt());
    case 'lv':
      return l10n_lv.loadLibrary().then((dynamic _) => l10n_lv.L10nLv());
    case 'nb':
      return l10n_nb.loadLibrary().then((dynamic _) => l10n_nb.L10nNb());
    case 'nl':
      return l10n_nl.loadLibrary().then((dynamic _) => l10n_nl.L10nNl());
    case 'pl':
      return l10n_pl.loadLibrary().then((dynamic _) => l10n_pl.L10nPl());
    case 'pt':
      return l10n_pt.loadLibrary().then((dynamic _) => l10n_pt.L10nPt());
    case 'ro':
      return l10n_ro.loadLibrary().then((dynamic _) => l10n_ro.L10nRo());
    case 'ru':
      return l10n_ru.loadLibrary().then((dynamic _) => l10n_ru.L10nRu());
    case 'sk':
      return l10n_sk.loadLibrary().then((dynamic _) => l10n_sk.L10nSk());
    case 'sl':
      return l10n_sl.loadLibrary().then((dynamic _) => l10n_sl.L10nSl());
    case 'sr':
      return l10n_sr.loadLibrary().then((dynamic _) => l10n_sr.L10nSr());
    case 'sv':
      return l10n_sv.loadLibrary().then((dynamic _) => l10n_sv.L10nSv());
    case 'ta':
      return l10n_ta.loadLibrary().then((dynamic _) => l10n_ta.L10nTa());
    case 'te':
      return l10n_te.loadLibrary().then((dynamic _) => l10n_te.L10nTe());
    case 'th':
      return l10n_th.loadLibrary().then((dynamic _) => l10n_th.L10nTh());
    case 'tr':
      return l10n_tr.loadLibrary().then((dynamic _) => l10n_tr.L10nTr());
    case 'uk':
      return l10n_uk.loadLibrary().then((dynamic _) => l10n_uk.L10nUk());
    case 'vi':
      return l10n_vi.loadLibrary().then((dynamic _) => l10n_vi.L10nVi());
    case 'yue':
      return l10n_yue.loadLibrary().then((dynamic _) => l10n_yue.L10nYue());
    case 'zh':
      return l10n_zh.loadLibrary().then((dynamic _) => l10n_zh.L10nZh());
  }

  throw FlutterError(
      'L10n.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
