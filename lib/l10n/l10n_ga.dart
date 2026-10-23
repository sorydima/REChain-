// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Irish (`ga`).
class L10nGa extends L10n {
  L10nGa([String locale = 'ga']) : super(locale);

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
  String get repeatPassword => 'Scríobh an pasfhocal arís';

  @override
  String get notAnImage => 'Ní comhad íomhá é.';

  @override
  String get remove => 'Bain';

  @override
  String get importNow => 'Iompórtáil anois';

  @override
  String get importEmojis => 'Iompórtáil Emoji';

  @override
  String get importFromZipFile => 'Iompórtáil ó chomhad .zip';

  @override
  String get exportEmotePack => 'Easpórtáil Emote pacáiste mar .zip';

  @override
  String get replace => 'Ionadaigh';

  @override
  String get about => 'Faoi';

  @override
  String aboutHomeserver(String homeserver) {
    return 'Maidir le $homeserver';
  }

  @override
  String get accept => 'Glac';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 Ghlac $username leis an gcuireadh';
  }

  @override
  String get account => 'Cuntas';

  @override
  String get accountsAndSettings => 'Accounts and settings';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username criptithe deireadh go deireadh gníomhachtaithe';
  }

  @override
  String get addEmail => 'Cuir ríomhphoist';

  @override
  String get confirmREChainId =>
      'Please confirm your REChain ID in order to delete your account.';

  @override
  String supposedMxid(String mxid) {
    return 'Ba cheart go mbeadh sé seo $mxid';
  }

  @override
  String get addToSpace => 'Cuir go spás';

  @override
  String get admin => 'Riarthóir';

  @override
  String get alias => 'ailias';

  @override
  String get all => 'Gach';

  @override
  String get commandHint_roomupgrade =>
      'Uasghrádaigh an seomra seo go dtí an leagan seomra a thugtar';

  @override
  String get commandHint_googly => 'Seol roinnt súile googly';

  @override
  String get commandHint_cuddle => 'Seol cuddle';

  @override
  String get commandHint_hug => 'Seol barróg';

  @override
  String googlyEyesContent(String senderName) {
    return 'Seolann $senderName súile googly chugat';
  }

  @override
  String cuddleContent(String senderName) {
    return 'Cuireann $senderName do chudacht';
  }

  @override
  String hugContent(String senderName) {
    return 'Tugann $senderName barróg duit';
  }

  @override
  String answeredTheCall(String senderName) {
    return 'D\'fhreagair $senderName an glao';
  }

  @override
  String get anyoneCanJoin => 'Is féidir le aon duine dul isteach';

  @override
  String get appLock => 'Bac aip';

  @override
  String get appLockDescription =>
      'Cuir glas ar an aip nuair nach bhfuil sé in úsáid le cód bioráin';

  @override
  String get archive => 'Cartlann';

  @override
  String get areGuestsAllowedToJoin =>
      'An bhfuil cead ag aoi-úsáideoirí a bheith páirteach';

  @override
  String get areYouSure => 'An bhfuil tú cinnte?';

  @override
  String get discardEdits => 'You have unsaved changes. Discard your edits?';

  @override
  String get areYouSureYouWantToLogout =>
      'An bhfuil tú cinnte gur mhaith leat logáil amach?';

  @override
  String get askSSSSSign =>
      'Chun a bheith in ann an duine eile a shíniú, cuir isteach do phasfhrása stóir sábháilte nó d\'eochair téarnaimh.';

  @override
  String askVerificationRequest(String username) {
    return 'Glac leis an iarratas fíoraithe seo ó $username?';
  }

  @override
  String get autoplayImages =>
      'Seinn greamáin agus straoiseog beoite go huathoibríoch';

  @override
  String badServerLoginTypesException(
    String serverVersions,
    String supportedVersions,
    Object suportedVersions,
  ) {
    return 'Tá na cineálacha logála isteach seo ar fáil faoin freastalaí baile:\n$serverVersions\nAch níl ach na ceann seo ar fáil faoin aip seo:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Seol fógraí clóscríofa';

  @override
  String get swipeRightToLeftToReply =>
      'Svaidhpeáil ar dheis ar chlé chun freagra a thabhairt';

  @override
  String get sendOnEnter => 'Seol ar iontráil';

  @override
  String get noMoreChatsFound => 'Níor aimsíodh a thuilleadh comhráite...';

  @override
  String get noChatsFoundHere =>
      'Níor aimsíodh aon chomhrá anseo fós. Cuir tús le comhrá nua le duine éigin tríd an gcnaipe thíos a úsáid. ⤵️';

  @override
  String get unread => 'Neamhléite';

  @override
  String get space => 'Spás';

  @override
  String get banFromChat => 'Toirmisc ón gcomhrá';

  @override
  String get banned => 'Coiscthe';

  @override
  String bannedUser(String username, String targetName) {
    return 'Chuir $username cosc ar $targetName';
  }

  @override
  String get blockDevice => 'Bac Gléas';

  @override
  String get blocked => 'Bactha';

  @override
  String get cancel => 'Cealaigh';

  @override
  String cantOpenUri(String uri) {
    return 'Ní féidir an URI $uri a oscailt';
  }

  @override
  String get changeDeviceName => 'Athraigh ainm an ghléis';

  @override
  String changedTheChatAvatar(String username) {
    return 'D\'athraigh $username abhatár an chomhrá';
  }

  @override
  String changedTheChatDescription(Object username) {
    return 'D\'athraigh $username cur síos an chomhrá';
  }

  @override
  String changedTheChatName(Object username) {
    return 'D\'athraigh $username ainm an chomhrá';
  }

  @override
  String changedTheChatPermissions(String username) {
    return 'D\'athraigh $username na ceadanna comhrá';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return 'D\'athraigh $username a n-ainm taispeána go: \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return 'D\'athraigh $username na rialacha rochtana aoi';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return 'D\'athraigh $username na rialacha maidir le rochtain aoi chuig: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return 'D\'athraigh $username infheictheacht na staire';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return 'D\'athraigh $username infheictheacht na staire go: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return 'D\'athraigh $username na rialacha ceangail';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return 'D\'athraigh $username na rialacha ceangail go: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return 'D\'athraigh $username a n-abhatár';
  }

  @override
  String changedTheRoomAliases(String username) {
    return 'D\'athraigh $username ailiasanna an tseomra';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return 'D\'athraigh $username nasc an chuiridh';
  }

  @override
  String get changePassword => 'Athraigh an pasfhocal';

  @override
  String get changeTheHomeserver => 'Athraigh an freastalaí baile';

  @override
  String get changeTheme => 'Athraigh do stíl';

  @override
  String get changeTheNameOfTheGroup => 'Athraigh ainm an ghrúpa';

  @override
  String get changeYourAvatar => 'Athraigh do abhatár';

  @override
  String get channelCorruptedDecryptError => 'Truaillíodh an criptiú';

  @override
  String get chat => 'Comhrá';

  @override
  String get chatBackup => 'Cúltaca comhrá';

  @override
  String get chatDetails => 'Sonraí comhrá';

  @override
  String get chats => 'Comhráite';

  @override
  String get chooseAStrongPassword => 'Roghnaigh pasfhocal láidir';

  @override
  String get clearArchive => 'Glan an cartlann';

  @override
  String get close => 'Dún';

  @override
  String get commandHint_markasdm =>
      'Marcáil mar sheomra teachtaireachta dírí don ID Maitrís tugtha';

  @override
  String get commandHint_markasgroup => 'Marcáil mar ghrúpa';

  @override
  String get commandHint_ban =>
      'Cuir cosc ar an úsáideoir áirithe ón seomra seo';

  @override
  String get commandHint_clearcache => 'Glan an taisce';

  @override
  String get commandHint_create =>
      'Cruthaigh comhrá grúpa folamh\nÚsáid --no-encryption chun criptiúchán a dhíchumasú';

  @override
  String get commandHint_discardsession => 'Scrios an seisiún';

  @override
  String get commandHint_dm =>
      'Cuir tús le comhrá díreach\nÚsáid --no-cription chun criptiúchán a dhíchumasú';

  @override
  String get commandHint_html => 'Seol téacs HTML-formáidithe';

  @override
  String get commandHint_invite =>
      'Cuir cosc ar an úsáideoir áirithe ón seomra seo';

  @override
  String get commandHint_join => 'Téigh isteach sa seomra áirithe';

  @override
  String get commandHint_kick => 'Bain an t-úsáideoir áirithe den seomra seo';

  @override
  String get commandHint_leave => 'Fág an seomra seo';

  @override
  String get commandHint_me => 'Déan cur síos ort féin';

  @override
  String get commandHint_myroomavatar =>
      'Cuir do phictiúr don seomra seo (le mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Socraigh d\'ainm taispeána don seomra seo';

  @override
  String get commandHint_op =>
      'Socraigh leibhéal cumhachta an úsáideora áirithe (réamhshocrú: 50)';

  @override
  String get commandHint_plain => 'Seol téacs neamhfhoirmithe';

  @override
  String get commandHint_react => 'Seol freagra mar fhreagairt';

  @override
  String get commandHint_send => 'Seol téacs';

  @override
  String get commandHint_unban =>
      'Cuir deireadh an cosc den úsáideoir áirithe ón seomra seo';

  @override
  String get commandInvalid => 'Ordú neamhbhailí';

  @override
  String commandMissing(String command) {
    return 'Ní ordú é $command.';
  }

  @override
  String get compareEmojiMatch => 'Cuir na emojis i gcomparáid le do thoil';

  @override
  String get compareNumbersMatch =>
      'Cuir na huimhreacha i gcomparáid le do thoil';

  @override
  String get configureChat => 'Cumraigh comhrá';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Tugadh cuireadh don theagmháil a thar isteach sa grúpa';

  @override
  String get contentHasBeenReported =>
      'Tuairiscíodh an t-ábhar do lucht riaracháin an fhreastalaí';

  @override
  String get copiedToClipboard => 'Cóipeáilte ar an ghearrthaisce';

  @override
  String get copy => 'Cóipeáil';

  @override
  String get copyToClipboard => 'Cóipeáil ar an ghearrthaisce';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Níorbh fhéidir teachtaireacht a dhíchriptiú: $error';
  }

  @override
  String get checkList => 'Liosta seiceála';

  @override
  String countParticipants(int count) {
    return '$count rannpháirtithe';
  }

  @override
  String countInvited(int count) {
    return 'cuireadh chuig $count';
  }

  @override
  String get create => 'Cruthaigh';

  @override
  String createdTheChat(String username) {
    return '💬 chruthaigh $username an comhrá';
  }

  @override
  String get createGroup => 'Cruthaigh grúpa';

  @override
  String get createNewSpace => 'Spás nua';

  @override
  String get currentlyActive => 'Gníomhach faoi láthair';

  @override
  String get darkTheme => 'Dorcha';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String get deactivateAccountWarning =>
      'Díghníomhachtaeoidh sé seo do chuntas úsáideora. Ní féidir é seo a chealú! An bhfuil tú cinnte?';

  @override
  String get defaultPermissionLevel =>
      'Leibhéal ceada réamhshocraithe d\'úsáideoirí nua';

  @override
  String get delete => 'Scrios';

  @override
  String get deleteAccount => 'Scrios an cuntas';

  @override
  String get deleteMessage => 'Scrios an teachtaireacht';

  @override
  String get devices => 'Gléasanna';

  @override
  String get directChats => 'Comhráite Díreacha';

  @override
  String get displaynameHasBeenChanged => 'Athraíodh an t-ainm taispeána';

  @override
  String get downloadFile => 'Íoslódáil comhad';

  @override
  String get edit => 'Cuir in eagar';

  @override
  String get editBlockedServers => 'Cuir freastalaí blocáilte in eagar';

  @override
  String get chatPermissions => 'Ceadanna comhrá';

  @override
  String get editDisplayname => 'Cuir ainm taispeána in eagar';

  @override
  String get editRoomAliases => 'Cuir ailiasanna an tseomra in eagar';

  @override
  String get editRoomAvatar => 'Cuir in eagar abhatár an tseomra';

  @override
  String get emoteExists => 'Tá iomaite ann cheana féin!';

  @override
  String get emoteInvalid => 'Gearrchód emote neamhbhailí!';

  @override
  String get emoteKeyboardNoRecents =>
      'Beidh mothúcháin a úsáideadh le déanaí le feiceáil anseo ...';

  @override
  String get globalChatId => 'Aitheantas comhrá domhanda';

  @override
  String get accessAndVisibility => 'Rochtain agus infheictheacht';

  @override
  String get accessAndVisibilityDescription =>
      'Cé a bhfuil cead aige páirt a ghlacadh sa chomhrá seo agus conas is féidir an comhrá a aimsiú.';

  @override
  String get customEmojisAndStickers => 'Emojis agus greamáin saincheaptha';

  @override
  String get customEmojisAndStickersBody =>
      'Cuir leis nó roinn emojis nó greamáin saincheaptha is féidir a úsáid in aon chomhrá.';

  @override
  String get emoteShortcode => 'Gearrchód straoiseoige';

  @override
  String get emptyChat => 'Comhrá folamh';

  @override
  String get enableEmotesGlobally =>
      'Cumasaigh pacáiste straoiseoige go huilíoch';

  @override
  String get enableEncryption => 'Tosaigh criptiú';

  @override
  String get enableEncryptionWarning =>
      'Ní bheidh in ann an criptiú a dhíchumasú níos mó. An bhfuil tú cinnte?';

  @override
  String get encrypted => 'Criptithe';

  @override
  String get encryption => 'Criptiúchán';

  @override
  String get encryptionNotEnabled => 'Ní chumasaítear criptiú';

  @override
  String endedTheCall(String senderName) {
    return 'Chuir $senderName deireadh leis an nglao';
  }

  @override
  String get enterAnEmailAddress => 'Cuir isteach seoladh ríomhphoist';

  @override
  String errorObtainingLocation(String error) {
    return 'Earráid maidir le suíomh a fháil: $error';
  }

  @override
  String get fontSize => 'Méid cló';

  @override
  String get forward => 'Seol ar aghaidh';

  @override
  String get fromJoining => 'Ó tar isteach';

  @override
  String get fromTheInvitation => 'Ón gcuireadh';

  @override
  String get group => 'Grúpa';

  @override
  String get chatDescription => 'Cur síos ar an gcomhrá';

  @override
  String get chatDescriptionHasBeenChanged =>
      'Athraíodh cur síos ar an gcomhrá';

  @override
  String get groupIsPublic => 'Tá an grúpa poiblí';

  @override
  String get groups => 'Grúpaí';

  @override
  String groupWith(String displayname) {
    return 'Grúpa le $displayname';
  }

  @override
  String get guestsAreForbidden => 'Tá cosc ar aíonna';

  @override
  String get guestsCanJoin => 'Is féidir le haíonna páirt a ghlacadh';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return 'Tharraing $username an cuireadh do $targetName siar';
  }

  @override
  String get help => 'Cabhair';

  @override
  String get hideRedactedMessages => 'Folaigh teachtaireachtaí curtha in eagar';

  @override
  String get hideRedactedMessagesBody =>
      'Má athghníomhaíonn duine éigin teachtaireacht, ní bheidh an teachtaireacht seo le feiceáil sa chomhrá a thuilleadh.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Folaigh formáidí teachtaireachta neamhbhailí nó anaithnid';

  @override
  String get block => 'Bloc';

  @override
  String get blockedUsers => 'Úsáideoirí bactha';

  @override
  String get blockListDescription =>
      'Is féidir leat bac a chur ar úsáideoirí atá ag cur isteach ort. Ní bheidh tú in ann teachtaireachtaí nó cuireadh seomra ar bith a fháil ó na húsáideoirí ar do liosta bloc pearsanta.';

  @override
  String get blockUsername => 'Déan neamhaird de ainm úsáideora';

  @override
  String get iHaveClickedOnLink => 'Chliceáil mé ar an nasc';

  @override
  String get incorrectPassphraseOrKey =>
      'Pasfhrása nó eochair téarnaimh mícheart';

  @override
  String get inviteContact => 'Tabhair cuireadh do theagmháil';

  @override
  String inviteContactToGroup(String groupName) {
    return 'Tabhair cuireadh do theagmháil chuig $groupName';
  }

  @override
  String get noChatDescriptionYet =>
      'Níl aon chur síos ar an gcomhrá cruthaithe fós.';

  @override
  String get tryAgain => 'Bain triail eile as';

  @override
  String get invalidServerName => 'Ainm freastalaí neamhbhailí';

  @override
  String get invited => 'Le cuireadh';

  @override
  String get redactMessageDescription =>
      'Athrófar an teachtaireacht do gach rannpháirtí sa chomhrá seo. Ní féidir é seo a chealú.';

  @override
  String get optionalRedactReason =>
      '(Roghnach) An chúis leis an teachtaireacht seo a chur in eagar...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 thug $username cuireadh do $targetName';
  }

  @override
  String get invitedUsersOnly => 'Úsáideoirí le cuireadh amháin';

  @override
  String inviteText(String username, String link) {
    return 'Thug $username cuireadh duit chuig REChain.\n1. Tabhair cuairt ar github.com/sorydima/REChain- agus a shuiteáil an app\n2. Cláraigh nó sínigh isteach\n3. Oscail an nasc cuirí:\n $link';
  }

  @override
  String get isTyping => 'ag clóscríobh…';

  @override
  String joinedTheChat(String username) {
    return 'Tháinig 👋 $username isteach sa chomhrá';
  }

  @override
  String get joinRoom => 'Téigh isteach sa seomra';

  @override
  String kicked(String username, String targetName) {
    return '👞 chiceáil $username $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 chiceáil $username agus chuir sé cosc ar $targetName';
  }

  @override
  String get kickFromChat => 'Caith é amach as an comhrá';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Gníomhach deireanach: $localizedTimeShort';
  }

  @override
  String get leave => 'Fág';

  @override
  String get leftTheChat => 'Fágadh an comhrá';

  @override
  String get lightTheme => 'Solas';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Lódáil $count níos mó rannpháirtithe';
  }

  @override
  String get dehydrate => 'Easpórtáil seisiún agus gléas wipe';

  @override
  String get dehydrateWarning =>
      'Ní féidir an gníomh seo a chealú. Cinntigh go stórálann tú an comhad cúltaca go sábháilte.';

  @override
  String get hydrate => 'Athchóirigh ó chomhad cúltaca';

  @override
  String get loadingPleaseWait => 'Ag lódáil… Fan, le do thoil.';

  @override
  String get loadMore => 'Lódáil níos mó…';

  @override
  String get locationDisabledNotice =>
      'Tá seirbhísí suímh díchumasaithe. Cuir ar a gcumas le do thoil a bheith in ann do shuíomh a roinnt.';

  @override
  String get locationPermissionDeniedNotice =>
      'Diúltaíodh cead suímh. Deonaigh dóibh le do thoil go mbeidh tú in ann do shuíomh a roinnt.';

  @override
  String get login => 'Logáil isteach';

  @override
  String logInTo(String homeserver) {
    return 'Logáil isteach chuig $homeserver';
  }

  @override
  String get logout => 'Logáil amach';

  @override
  String get mention => 'Luaigh';

  @override
  String get messages => 'Teachtaireachtaí';

  @override
  String get messagesStyle => 'Teachtaireachtaí:';

  @override
  String get moderator => 'Modhnóir';

  @override
  String get muteChat => 'Ciúnaigh comhrá';

  @override
  String get newChat => 'Comhrá nua';

  @override
  String get newMessageInrechainonline => '💬 Teachtaireacht nua in REChain';

  @override
  String get newVerificationRequest => 'Iarratas fíoraithe nua!';

  @override
  String get next => 'Ar Aghaidh';

  @override
  String get no => 'Níl';

  @override
  String get noConnectionToTheServer => 'Gan aon nasc leis an bhfreastalaí';

  @override
  String get noEmotesFound => 'Níor aimsíodh aon straoiseoga. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Ní féidir leat criptiú a ghníomhachtú ach a luaithe nach bhfuil an seomra inrochtana go poiblí a thuilleadh.';

  @override
  String get noGoogleServicesWarning =>
      'Is cosúil nach bhfuil Firebase Cloud Messaging ar fáil ar do ghléas. Chun fógraí brú a fháil fós, molaimid ntfy a shuiteáil. Le ntfy nó soláthraí Unified Push eile is féidir leat fógraí brú a fháil ar bhealach atá slán ó thaobh sonraí. Is féidir leat ntfy a íoslódáil ón PlayStore nó ó F-Droid.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return 'Níl $server1 freastalaí REChain. Úsáid $server2 ina áit sin?';
  }

  @override
  String get shareInviteLink => 'Roinn an nasc cuireadh';

  @override
  String get scanQrCode => 'Scan cód QR';

  @override
  String get noPasswordRecoveryDescription =>
      'Níor chuir tú bealach leis do phasfhocal a aisghabháil fós.';

  @override
  String get noPermission => 'Gan cead';

  @override
  String get noRoomsFound => 'Níor aimsíodh aon seomraí…';

  @override
  String get notifications => 'Fógraí';

  @override
  String numUsersTyping(int count) {
    return 'Tá $count úsáideoirí ag clóscríobh…';
  }

  @override
  String get obtainingLocation => 'ag Aimsiú an suíomh…';

  @override
  String get ok => 'Ceart go leor';

  @override
  String get onlineKeyBackupEnabled => 'Tá Cúltaca Eochair Ar Líne cumasaithe';

  @override
  String get oopsPushError =>
      'Hoips! Ar an drochuair, tharla earráid nuair a bhí na fógraí brú á mbunú.';

  @override
  String get oopsSomethingWentWrong => 'Úps, chuaigh rud éigin mícheart …';

  @override
  String get openAppToReadMessages =>
      'Oscail an aip chun teachtaireachtaí a léamh';

  @override
  String get openCamera => 'Oscail ceamara';

  @override
  String get oneClientLoggedOut => 'Tá duine de do chliaint logáilte amach';

  @override
  String get addAccount => 'Breisigh cuntas';

  @override
  String get editBundlesForAccount => 'Cuir cuachta in eagar don chuntas seo';

  @override
  String get addToBundle => 'Cuir le bundle';

  @override
  String get removeFromBundle => 'Bain as an mbeart seo';

  @override
  String get bundleName => 'Ainm an bheartáin';

  @override
  String get openInMaps => 'Oscail i léarscáileanna';

  @override
  String get link => 'Nasc';

  @override
  String get or => 'Nó';

  @override
  String get participant => 'Rannpháirtí';

  @override
  String get passphraseOrKey => 'pasfhrása nó eochair téarnaimh';

  @override
  String get password => 'Pasfhocal';

  @override
  String get passwordForgotten => 'Pasfhocal dearmadta';

  @override
  String get passwordHasBeenChanged => 'Athraíodh an pasfhocal';

  @override
  String get passwordRecoverySettings => 'Socruithe athshlánaithe pasfhocal';

  @override
  String get passwordRecovery => 'Aisfháil pasfhocail';

  @override
  String get pin => 'Biorán';

  @override
  String get pleaseChooseAPasscode => 'Roghnaigh paschód le do thoil';

  @override
  String get pleaseClickOnLink =>
      'Cliceáil ar an nasc sa ríomhphost agus ansin lean ar aghaidh.';

  @override
  String get pleaseEnterYourPassword => 'Iontráil do phasfhocal le do thoil';

  @override
  String get pleaseEnterYourPin => 'Cuir isteach d\'uimhir PIN le do thoil';

  @override
  String get pleaseEnterYourUsername =>
      'Cuir isteach d\'ainm úsáideora le do thoil';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Lean na treoracha ar an suíomh gréasáin agus tapáil \"ar aghaidh\".';

  @override
  String get privacy => 'Príobháideacht';

  @override
  String get publicRooms => 'Seomraí Poiblí';

  @override
  String get reason => 'Fáth';

  @override
  String redactedBy(String username) {
    return 'Arna chur in eagar ag $username';
  }

  @override
  String redactedByBecause(String username, String reason) {
    return 'Athbhreithnithe ag $username mar: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return 'Rinne $username cinsire imeacht';
  }

  @override
  String get redactMessage => 'Bain teachtaireacht amach';

  @override
  String get reject => 'Diúltaigh';

  @override
  String rejectedTheInvitation(String username) {
    return 'Dhiúltaigh $username don chuireadh';
  }

  @override
  String get removeAllOtherDevices => 'Bain gach gléas eile';

  @override
  String get unbanFromChat => 'Cuir deireadh an cosc ón gcomhrá';

  @override
  String get removeYourAvatar => 'Bain d\'abhatár';

  @override
  String get replaceRoomWithNewerVersion =>
      'Cuir leagan seomra níos nuaí in ionad an tseomra';

  @override
  String get reply => 'Freagair';

  @override
  String get reportMessage => 'Tuairiscigh teachtaireacht';

  @override
  String get roomHasBeenUpgraded => 'Uasghrádaíodh an seomra';

  @override
  String sendingFilesDoNotExit(int count) {
    return 'Sending $count files... Please do not exit!';
  }

  @override
  String get roomVersion => 'Leagan seomra';

  @override
  String get compressingVideo => 'Compressing video...';

  @override
  String get saveFile => 'Sábháil comhad';

  @override
  String get search => 'Cuardaigh';

  @override
  String get security => 'Slándáil';

  @override
  String get send => 'Seol';

  @override
  String get sendAMessage => 'Seol teachtaireacht';

  @override
  String get sendAsText => 'Seol mar théacs';

  @override
  String get sendAudio => 'Seol fuaim';

  @override
  String get sendFile => 'Seol comhad';

  @override
  String get sendImage => 'Seol íomhá';

  @override
  String sendImages(int count) {
    return 'Seol $count íomhá';
  }

  @override
  String get sendMessages => 'Seol teachtaireachtaí';

  @override
  String get sendVideo => 'Seol físeán';

  @override
  String sentAFile(String username) {
    return '📁 sheol $username comhad';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 sheol $username fuaim';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ sheol $username pictiúr';
  }

  @override
  String sentASticker(String username) {
    return '😊 sheol $username greamán';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 sheol $username físeán';
  }

  @override
  String sentCallInformations(String senderName) {
    return 'Sheol $senderName faisnéis maidir le glaonna';
  }

  @override
  String get setAsCanonicalAlias => 'Socraigh mar phríomh-ailias';

  @override
  String get setChatDescription => 'Socraigh cur síos ar an gcomhrá';

  @override
  String get setStatus => 'Cuir stádas';

  @override
  String get settings => 'Socruithe';

  @override
  String get share => 'Roinn';

  @override
  String sharedTheLocation(String username) {
    return 'Roinn $username a suíomh';
  }

  @override
  String get shareLocation => 'Roinn suíomh';

  @override
  String get skip => 'Léim';

  @override
  String get sourceCode => 'Cód foinseach';

  @override
  String get spaceIsPublic => 'Tá an spás poiblí';

  @override
  String get spaceName => 'Ainm an spáis';

  @override
  String startedACall(String senderName) {
    return 'Thosaigh $senderName glao';
  }

  @override
  String get status => 'Staid';

  @override
  String get statusExampleMessage => 'Conas atá tú inniu?';

  @override
  String get submit => 'Cuir isteach';

  @override
  String get synchronizingPleaseWait => 'Ag sioncrónú... Fan, le do thoil.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Ag sioncronú… ($percentage%)';
  }

  @override
  String get systemTheme => 'Córas';

  @override
  String get theyDontMatch => 'Níl siad céanna';

  @override
  String get theyMatch => 'Tá siad céanna';

  @override
  String get tooManyRequestsWarning =>
      'An iomarca iarratas. Bain triail eile as níos déanaí!';

  @override
  String get tryToSendAgain => 'Déan iarracht a sheoladh arís';

  @override
  String unbannedUser(String username, String targetName) {
    return 'Chuir $username deireadh an cosc $targetName';
  }

  @override
  String get unblockDevice => 'Díbhlocáil Gléas';

  @override
  String get unknownDevice => 'Gléas anaithnid';

  @override
  String get unknownEncryptionAlgorithm => 'Algartam criptithe anaithnid';

  @override
  String unknownEvent(String type) {
    return 'Imeacht anaithnid \'$type\'';
  }

  @override
  String get unmuteChat => 'Neamhciúnaigh comhrá';

  @override
  String get unpin => 'Bain biorán';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return 'tá $username agus $count daoine eile ag clóscríobh…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return 'Tá $username agus $username2 ag clóscríobh…';
  }

  @override
  String userIsTyping(String username) {
    return 'Tá $username ag clóscríobh…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 D\'fhág $username an comhrá';
  }

  @override
  String userSentUnknownEvent(String username, String type) {
    return 'Sheol $username imeacht $type';
  }

  @override
  String get unverified => 'Neamhfhíoraithe';

  @override
  String get verified => 'Deimhnithe';

  @override
  String get verifyStart => 'Tosaigh Fíorú';

  @override
  String get verifySuccess => 'D\'fhíoraigh tú go rathúil!';

  @override
  String get verifyTitle => 'Ag fíorú cuntas eile';

  @override
  String get visibilityOfTheChatHistory => 'Infheictheacht stair na comhrá';

  @override
  String get visibleForAllParticipants =>
      'Infheicthe do na rannpháirtithe go léir';

  @override
  String get visibleForEveryone => 'Infheicthe do gach duine';

  @override
  String get voiceMessage => 'Glórphost';

  @override
  String get waitingPartnerAcceptRequest =>
      'Ag fanacht le comhpháirtí glacadh leis an iarratas…';

  @override
  String get waitingPartnerEmoji =>
      'Ag fanacht le comhpháirtí glacadh leis na straoiseoga…';

  @override
  String get waitingPartnerNumbers =>
      'Ag fanacht le comhpháirtí glacadh leis na huimhreacha …';

  @override
  String get warning => 'Rabhadh!';

  @override
  String get weSentYouAnEmail => 'Sheolamar ríomhphost chugat';

  @override
  String get whoCanPerformWhichAction => 'Cé atá in ann an gníomh a dhéanamh';

  @override
  String get whoIsAllowedToJoinThisGroup =>
      'Cé a bhfuil cead aige/aici dul isteach sa ghrúpa seo';

  @override
  String get whyDoYouWantToReportThis =>
      'Cén fáth ar mhaith leat é seo a thuairisciú?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Leis na seoltaí seo is féidir leat do phasfhocal a athshlánú.';

  @override
  String get writeAMessage => 'Scríobh teachtaireacht…';

  @override
  String get yes => 'Tá';

  @override
  String get you => 'Tú';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Níl tú ag glacadh páirte sa chomhrá seo a thuilleadh';

  @override
  String get yourPublicKey => 'D\'eochair phoiblí';

  @override
  String get messageInfo => 'Eolas teachtaireachta';

  @override
  String get time => 'Am';

  @override
  String get sender => 'Seoltóir';

  @override
  String get openGallery => 'Oscail gailearaí';

  @override
  String get removeFromSpace => 'Bain as spás';

  @override
  String get markAsRead => 'Marcáil mar léite';

  @override
  String get reportUser => 'Déan tuairisc ar úsáideoir';

  @override
  String reactedWith(String sender, String reaction) {
    return 'D\'fhreagair $sender le $reaction';
  }

  @override
  String get pinMessage => 'PIN go seomra';

  @override
  String get confirmEventUnpin =>
      'An bhfuil tú cinnte an t-imeacht a dhíphionnáil go buan?';

  @override
  String get emojis => 'Emojis';

  @override
  String get unsupportedAndroidVersion => 'Leagan Android gan tacaíocht';

  @override
  String get unsupportedAndroidVersionLong =>
      'Éilíonn an ghné seo leagan Android níos nuaí. Seiceáil le haghaidh nuashonruithe nó tacaíocht Mobile Katya OS.';

  @override
  String get youRejectedTheInvitation => 'Dhiúltaigh tú don chuireadh';

  @override
  String get youJoinedTheChat => 'Chuaigh tú isteach sa chomhrá';

  @override
  String get youAcceptedTheInvitation => '👍 Ghlac tú leis an gcuireadh';

  @override
  String youBannedUser(String user) {
    return 'Chuir tú cosc ar $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Tharraing tú siar an cuireadh do $user';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 Thug $user cuireadh duit';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Thug tú cuireadh do $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Chiceáil tú $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Chiceáil tú agus chuir tú cosc ar $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Unbanned tú $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 Tá $user tar éis cnagadh';
  }

  @override
  String get usersMustKnock => 'Ní mór d\'úsáideoirí cnag a chur ar';

  @override
  String get noOneCanJoin => 'Ní féidir le duine ar bith páirt a ghlacadh';

  @override
  String get knock => 'Cnoc Mhuire';

  @override
  String get users => 'Úsáideoirí';

  @override
  String get storeInAndroidKeystore => 'Stóráil i Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Stóráil i Apple KeyChain';

  @override
  String get storeSecurlyOnThisDevice => 'Stóráil go daingean ar an ngléas seo';

  @override
  String countFiles(int count) {
    return 'Comhaid $count';
  }

  @override
  String get user => 'Úsáideoir';

  @override
  String get custom => 'Saincheaptha';

  @override
  String get whyIsThisMessageEncrypted =>
      'Cén fáth nach féidir an teachtaireacht seo a léamh?';

  @override
  String get noKeyForThisMessage =>
      'Féadfaidh sé seo tarlú má seoladh an teachtaireacht sular shínigh tú isteach ar do chuntas ag an ngléas seo.\n\nIs féidir freisin gur chuir an seoltóir bac ar do ghléas nó go ndeachaigh rud éigin mícheart leis an nasc idirlín.\n\nAn bhfuil tú in ann an teachtaireacht a léamh ar sheisiún eile? Ansin is féidir leat an teachtaireacht a aistriú uaidh! Téigh go Socruithe > Gléasanna agus cinntigh go bhfuil do ghléasanna fíoraithe a chéile. Nuair a osclaíonn tú an seomra an chéad uair eile agus an dá sheisiún sa tulra, déanfar na heochracha a tharchur go huathoibríoch.\n\nNár mhaith leat na heochracha a chailleadh agus tú ag logáil amach nó ag aistriú gléasanna? Déan cinnte go bhfuil an cúltaca comhrá cumasaithe agat sna socruithe.';

  @override
  String get newSpace => 'Spás nua';

  @override
  String get doNotShowAgain => 'Ná taispeáin arís';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Comhrá folamh (bhí $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Ligeann spásanna duit do chomhráite a chomhdhlúthú agus pobail phríobháideacha nó phoiblí a thógáil.';

  @override
  String get encryptThisChat => 'Criptigh an comhrá seo';

  @override
  String get disableEncryptionWarning =>
      'Ar chúiseanna slándála ní féidir leat criptiú a dhíchumasú i gcomhrá, áit ar cumasaíodh é roimhe seo.';

  @override
  String get sorryThatsNotPossible => 'Tá brón orm... nach féidir a dhéanamh';

  @override
  String get reopenChat => 'Comhrá a athoscailt';

  @override
  String get noBackupWarning =>
      'Rabhadh! Gan cúltaca comhrá a chumasú, caillfidh tú rochtain ar do theachtaireachtaí criptithe. Moltar go mór an cúltaca comhrá a chumasú ar dtús sula logálann tú amach.';

  @override
  String get noOtherDevicesFound => 'Níor aimsíodh aon ghléas eile';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Ní féidir seol! Ní thacaíonn an freastalaí ach le ceangaltáin suas le $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Sábháladh an comhad ag $path';
  }

  @override
  String get jumpToLastReadMessage =>
      'Léim go dtí an teachtaireacht léite is déanaí';

  @override
  String get readUpToHere => 'Léigh suas go dtí seo';

  @override
  String get jump => 'Léim';

  @override
  String get openLinkInBrowser => 'Oscail nasc sa bhrabhsálaí';

  @override
  String get reportErrorDescription =>
      '😭 Ó, a mhac go deo. Chuaigh rud éigin mícheart. Más mian leat, is féidir leat an fabht seo a thuairisciú do na forbróirí.';

  @override
  String get report => 'tuairisc';

  @override
  String get setColorTheme => 'Socraigh téama datha:';

  @override
  String get invite => 'Tabhair cuireadh';

  @override
  String get inviteGroupChat => '📨 Cuireadh chuig comhrá grúpa';

  @override
  String get invalidInput => 'Ionchur neamhbhailí!';

  @override
  String wrongPinEntered(int seconds) {
    return 'Tháinig biorán mícheart isteach! Bain triail eile as i $seconds soicind...';
  }

  @override
  String get pleaseEnterANumber => 'Iontráil uimhir níos mó ná 0';

  @override
  String get archiveRoomDescription =>
      'Bogfar an comhrá go dtí an chartlann. Beidh úsáideoirí eile in ann a fheiceáil gur fhág tú an comhrá.';

  @override
  String get roomUpgradeDescription =>
      'Déanfar an comhrá a athchruthú ansin leis an leagan seomra nua. Cuirfear in iúl do gach rannpháirtí go gcaithfidh siad aistriú chuig an gcomhrá nua. Is féidir leat tuilleadh eolais a fháil faoi leaganacha seomra ag https://github.com/sorydima/REChain-.git';

  @override
  String get removeDevicesDescription =>
      'Beidh tú logáilte amach as an ngléas seo agus ní bheidh tú in ann teachtaireachtaí a fháil a thuilleadh.';

  @override
  String get banUserDescription =>
      'Beidh cosc ar an úsáideoir ón gcomhrá agus ní bheidh sé in ann dul isteach sa chomhrá arís go dtí go mbeidh siad gan chosc.';

  @override
  String get unbanUserDescription =>
      'Beidh an t-úsáideoir in ann dul isteach sa chomhrá arís má dhéanann siad iarracht.';

  @override
  String get kickUserDescription =>
      'Ciceáiltear an t-úsáideoir as an gcomhrá ach níl cosc air. I gcomhráite poiblí, is féidir leis an úsáideoir teacht ar ais ag am ar bith.';

  @override
  String get makeAdminDescription =>
      'Nuair a dhéanann tú an riarachán úsáideora seo, b\'fhéidir nach mbeidh tú in ann é seo a chealú mar go mbeidh na ceadanna céanna acu agus atá agat.';

  @override
  String get pushNotificationsNotAvailable => 'Níl fógraí brú ar fáil';

  @override
  String get learnMore => 'Faigh tuilleadh eolais';

  @override
  String get yourGlobalUserIdIs => 'Is é d\'aitheantas úsáideora domhanda: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Ar an drochuair ní fhéadfaí aon úsáideoir a aimsiú le \"$query\". Seiceáil le do thoil an ndearna tú typo.';
  }

  @override
  String get knocking => 'Cnagadh';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Is féidir comhrá a aimsiú tríd an gcuardach ar $server';
  }

  @override
  String get searchChatsRooms => 'Cuardaigh #chats, @users...';

  @override
  String get nothingFound => 'Níor aimsíodh aon rud...';

  @override
  String get groupName => 'Ainm an ghrúpa';

  @override
  String get createGroupAndInviteUsers =>
      'Cruthaigh grúpa agus tabhair cuireadh d\'úsáideoirí';

  @override
  String get groupCanBeFoundViaSearch =>
      'Is féidir teacht ar ghrúpa trí chuardach';

  @override
  String get wrongRecoveryKey =>
      'Tá brón orm... Ní cosúil gurb é seo an eochair aisghabhála ceart.';

  @override
  String get commandHint_sendraw => 'Seol json amh';

  @override
  String get databaseMigrationTitle => 'Tá an bunachar sonraí optamaithe';

  @override
  String get databaseMigrationBody =>
      'Fan, le do thoil. B\'fhéidir go dtógfaidh sé seo nóiméad.';

  @override
  String get leaveEmptyToClearStatus => 'Fág folamh chun do stádas a ghlanadh.';

  @override
  String get select => 'Roghnaigh';

  @override
  String get searchForUsers => 'Cuardaigh @users...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Iontráil do phasfhocal reatha le do thoil';

  @override
  String get newPassword => 'Pasfhocal nua';

  @override
  String get pleaseChooseAStrongPassword => 'Roghnaigh pasfhocal láidir';

  @override
  String get passwordsDoNotMatch => 'Ní mheaitseálann pasfhocail';

  @override
  String get passwordIsWrong => 'Tá do phasfhocal iontrála mícheart';

  @override
  String get publicChatAddresses => 'Seoltaí comhrá poiblí';

  @override
  String get createNewAddress => 'Cruthaigh seoladh nua';

  @override
  String get joinSpace => 'Glac páirt sa spás';

  @override
  String get publicSpaces => 'Spásanna poiblí';

  @override
  String get addChatOrSubSpace => 'Cuir comhrá nó fo-spás leis';

  @override
  String get thisDevice => 'An gléas seo:';

  @override
  String get initAppError => 'Tharla earráid agus an feidhmchlár á thosú';

  @override
  String searchIn(String chat) {
    return 'Cuardaigh i gcomhrá \"$chat\"...';
  }

  @override
  String get searchMore => 'Cuardaigh tuilleadh...';

  @override
  String get gallery => 'Gailearaí';

  @override
  String get files => 'Comhaid';

  @override
  String sessionLostBody(String url, String error) {
    return 'Cailltear do sheisiún. Tuairiscigh an earráid seo do na forbróirí ag $url. Is í an teachtaireacht earráide: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Déanann an aip iarracht anois do sheisiún a chur ar ais ón gcúltaca. Tuairiscigh an earráid seo do na forbróirí ag $url. Is í an teachtaireacht earráide: $error';
  }

  @override
  String get sendReadReceipts => 'Seol admhálacha léite';

  @override
  String get sendTypingNotificationsDescription =>
      'Is féidir le rannpháirtithe eile i gcomhrá a fheiceáil nuair atá teachtaireacht nua á clóscríobh agat.';

  @override
  String get sendReadReceiptsDescription =>
      'Is féidir le rannpháirtithe eile i gcomhrá a fheiceáil nuair a bhíonn teachtaireacht léite agat.';

  @override
  String get formattedMessages => 'Teachtaireachtaí formáidithe';

  @override
  String get formattedMessagesDescription =>
      'Taispeáin ábhar saibhir teachtaireachta cosúil le téacs trom ag baint úsáide as marcáil síos.';

  @override
  String get verifyOtherUser => '🔐 Fíoraigh úsáideoir eile';

  @override
  String get verifyOtherUserDescription =>
      'Má fhíoraíonn tú úsáideoir eile, is féidir leat a bheith cinnte go bhfuil a fhios agat cé leis a bhfuil tú ag scríobh i ndáiríre. 💪\n\nNuair a thosaíonn tú fíorú, feicfidh tú féin agus an t-úsáideoir eile aníos san aip. Ansin feicfidh tú sraith emojis nó uimhreacha a chaithfidh tú a chur i gcomparáid lena chéile.\n\nIs é an bealach is fearr chun é seo a dhéanamh ná bualadh le chéile nó glao físe a thosú. 👭';

  @override
  String get verifyOtherDevice => '🔐 Fíoraigh gléas eile';

  @override
  String get verifyOtherDeviceDescription =>
      'Nuair a fhíoraíonn tú gléas eile, is féidir leis na gléasanna sin eochracha a mhalartú, do shlándáil fhoriomlán a mhéadú. 💪 Nuair a thosaíonn tú fíorú, beidh preabfhuinneog le feiceáil san aip ar an dá ghléas. Ansin feicfidh tú sraith emojis nó uimhreacha a chaithfidh tú a chur i gcomparáid lena chéile. Is fearr an dá ghléas a bheith áisiúil sula dtosaíonn tú ar an bhfíorú. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender glacadh le fíorú eochair';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender cealaithe fíorú eochrach';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender fíorú eochair críochnaithe';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return 'Tá $sender réidh le haghaidh fíorú eochair';
  }

  @override
  String requestedKeyVerification(String sender) {
    return 'D\'iarr $sender fíorú eochrach';
  }

  @override
  String startedKeyVerification(String sender) {
    return 'Thosaigh $sender fíorú eochrach';
  }

  @override
  String get incomingMessages => 'Teachtaireachtaí isteach';

  @override
  String get stickers => 'Greamáin';

  @override
  String get discover => 'Faigh amach';

  @override
  String get commandHint_ignore =>
      'Déan neamhaird d\'aitheantas na maitríse sonraithe';

  @override
  String get commandHint_unignore => 'Unignore an ID maitrís tugtha';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread comhráite gan léamh';
  }

  @override
  String get noDatabaseEncryption =>
      'Ní thacaítear le criptiú bunachar sonraí ar an ardán seo';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Faoi láthair tá bac curtha ar úsáideoirí $count.';
  }

  @override
  String goToSpace(Object space) {
    return 'Téigh go dtí an spás: $space';
  }

  @override
  String get markAsUnread => 'Marcáil mar gan léamh';

  @override
  String userLevel(int level) {
    return '$level - Úsáideoir';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Modhnóir';
  }

  @override
  String adminLevel(int level) {
    return '$level - Riarachán';
  }

  @override
  String get changeGeneralChatSettings =>
      'Athraigh socruithe ginearálta comhrá';

  @override
  String get inviteOtherUsers =>
      'Tabhair cuireadh d\'úsáideoirí eile chuig an gcomhrá seo';

  @override
  String get changeTheChatPermissions => 'Athraigh na ceadanna comhrá';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Athraigh infheictheacht stair an chomhrá';

  @override
  String get changeTheCanonicalRoomAlias =>
      'Athraigh an príomhsheoladh comhrá poiblí';

  @override
  String get sendRoomNotifications => 'Seol fógraí @room';

  @override
  String get changeTheDescriptionOfTheGroup =>
      'Athraigh an cur síos ar an gcomhrá';

  @override
  String get chatPermissionsDescription =>
      'Sainmhínigh cén leibhéal cumhachta is gá le haghaidh gníomhartha áirithe sa chomhrá seo. De ghnáth bíonn na leibhéil chumhachta 0, 50 agus 100 ag déanamh ionadaíochta d\'úsáideoirí, do mhodhnóirí agus do riarthóirí, ach is féidir aon ghrádú a dhéanamh.';

  @override
  String updateInstalled(String version) {
    return '🎉 Nuashonraigh $version suiteáilte!';
  }

  @override
  String get changelog => 'ChangelogName';

  @override
  String updateAvailable(String version) {
    return 'Update $version available';
  }

  @override
  String get download => 'Download';

  @override
  String get sendCanceled => 'Cealaíodh seoladh';

  @override
  String get loginWithREChainId => 'Login with REChain-ID';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Ní cosúil gur freastalaí baile comhoiriúnach é. URL mícheart?';

  @override
  String get calculatingFileSize => 'Méid an chomhaid á ríomh...';

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Ní fhíoraítear ceann de do ghléasanna';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Nóta: Nuair a nascann tú do ghléasanna go léir leis an gcúltaca comhrá, déantar iad a fhíorú go huathoibríoch.';

  @override
  String get continueText => 'Lean ar aghaidh';

  @override
  String get blur => 'Doiléirigh:';

  @override
  String get opacity => 'Teimhneacht:';

  @override
  String get setWallpaper => 'Socraigh cúlbhrat';

  @override
  String get manageAccount => 'Bainistigh cuntas';

  @override
  String get noContactInformationProvided =>
      'Ní sholáthraíonn an freastalaí aon fhaisnéis teagmhála bhailí';

  @override
  String get contactServerAdmin => 'Déan teagmháil le admin an fhreastalaí';

  @override
  String get contactServerSecurity =>
      'Déan teagmháil le slándáil an fhreastalaí';

  @override
  String get supportPage => 'Leathanach tacaíochta';

  @override
  String get serverInformation => 'Eolas freastalaí:';

  @override
  String get name => 'Ainm';

  @override
  String get version => 'Leagan';

  @override
  String get website => 'Suíomh Gréasáin';

  @override
  String get compress => 'Comhbhrúigh';

  @override
  String get boldText => 'Téacs trom';

  @override
  String get italicText => 'Téacs iodálach';

  @override
  String get strikeThrough => 'Stailc tríd';

  @override
  String get pleaseFillOut => 'Líon amach le do thoil';

  @override
  String get invalidUrl => 'URL neamhbhailí';

  @override
  String get addLink => 'Cuir nasc leis';

  @override
  String get unableToJoinChat =>
      'Ní féidir páirt a ghlacadh sa chomhrá. B’fhéidir go bhfuil an comhrá dúnta cheana féin ag an bpáirtí eile.';

  @override
  String get previous => 'Roimhe Seo';

  @override
  String get otherPartyNotLoggedIn =>
      'Níl an páirtí eile logáilte isteach faoi láthair agus mar sin ní féidir leo teachtaireachtaí a fháil!';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Úsáid \'$server\' chun logáil isteach';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Ligeann tú leis seo don aip agus don suíomh Gréasáin faisnéis a roinnt fút.';

  @override
  String get open => 'Oscail';

  @override
  String get waitingForServer => 'Ag fanacht leis an bhfreastalaí...';

  @override
  String get newChatRequest => '📩 Iarratas comhrá nua';

  @override
  String get contentNotificationSettings => 'Socruithe fógra inneachair';

  @override
  String get generalNotificationSettings => 'Socruithe ginearálta fógra';

  @override
  String get roomNotificationSettings => 'Socruithe fógra seomra';

  @override
  String get userSpecificNotificationSettings =>
      'Socruithe fógra sainiúla don úsáideoir';

  @override
  String get otherNotificationSettings => 'Socruithe fógra eile';

  @override
  String get notificationRuleContainsUserName => 'Tá Ainm Úsáideora ann';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Cuireann sé sin in iúl don úsáideoir nuair a bhíonn a ainm úsáideora i dteachtaireacht.';

  @override
  String get notificationRuleMaster => 'Balbhaigh gach fógra';

  @override
  String get notificationRuleMasterDescription =>
      'Sáraíonn sé gach riail eile agus díchumasaítear gach fógra.';

  @override
  String get notificationRuleSuppressNotices =>
      'Bain Teachtaireachtaí Uathoibrithe';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Sochtann sé fógraí ó chliaint uathoibrithe amhail róbónna.';

  @override
  String get notificationRuleInviteForMe => 'Tabhair cuireadh Do Mhise';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Cuireann sé seo ar an eolas don úsáideoir nuair a thugtar cuireadh dó/di go seomra.';

  @override
  String get notificationRuleMemberEvent => 'Imeacht Ball';

  @override
  String get notificationRuleMemberEventDescription =>
      'Sochtann fógraí le haghaidh imeachtaí ballraíochta.';

  @override
  String get notificationRuleIsUserMention => 'Luaigh Úsáideoir';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Cuireann sé sin in iúl don úsáideoir nuair a luaitear go díreach iad i dteachtaireacht.';

  @override
  String get notificationRuleContainsDisplayName => 'Tá Ainm Taispeána ann';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Cuireann sé sin in iúl don úsáideoir nuair a bhíonn a ainm taispeána i dteachtaireacht.';

  @override
  String get notificationRuleIsRoomMention => 'Luaigh Seomra';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Cuireann sé sin in iúl don úsáideoir nuair a luaitear seomra.';

  @override
  String get notificationRuleRoomnotif => 'Fógra Seomra';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Cuireann sé seo in iúl don úsáideoir nuair a bhíonn \'@room\' i dteachtaireacht.';

  @override
  String get notificationRuleTombstone => 'Leac uaighe';

  @override
  String get notificationRuleTombstoneDescription =>
      'Cuireann sé seo in iúl don úsáideoir faoi theachtaireachtaí díghníomhaithe seomra.';

  @override
  String get notificationRuleReaction => 'Imoibriú';

  @override
  String get notificationRuleReactionDescription =>
      'Sochtann fógraí le haghaidh frithghníomhartha.';

  @override
  String get notificationRuleRoomServerAcl => 'Freastalaí Seomra ACL';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Sochtann sé fógraí do liostaí rialaithe rochtana freastalaí seomra (ACL).';

  @override
  String get notificationRuleSuppressEdits => 'Cuir na hEagarthóirí ar ceal';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Sochtann fógraí le haghaidh teachtaireachtaí curtha in eagar.';

  @override
  String get notificationRuleCall => 'Glaoigh';

  @override
  String get notificationRuleCallDescription =>
      'Cuireann sé an t-úsáideoir ar an eolas faoi ghlaonna.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'Seomra Duine le Duine Criptithe';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Cuireann sé seo in iúl don úsáideoir faoi theachtaireachtaí i seomraí duine le duine criptithe.';

  @override
  String get notificationRuleRoomOneToOne => 'Seomra duine le duine';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Cuireann sé seo in iúl don úsáideoir faoi theachtaireachtaí i seomraí duine le duine.';

  @override
  String get notificationRuleMessage => 'Teachtaireacht';

  @override
  String get notificationRuleMessageDescription =>
      'Cuireann sé seo in iúl don úsáideoir faoi theachtaireachtaí ginearálta.';

  @override
  String get notificationRuleEncrypted => 'Criptithe';

  @override
  String get notificationRuleEncryptedDescription =>
      'Cuireann sé seo in iúl don úsáideoir faoi theachtaireachtaí i seomraí criptithe.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Cuireann sé seo in iúl don úsáideoir faoi imeachtaí giuirléidí Jitsi.';

  @override
  String get notificationRuleServerAcl => 'Seachtaigh Freastalaí ACL Imeachtaí';

  @override
  String get notificationRuleServerAclDescription =>
      'Sochtann fógraí le haghaidh imeachtaí Freastalaí ACL.';

  @override
  String unknownPushRule(String rule) {
    return 'Riail bhrú anaithnid \'$rule\'';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return '🎙️ $duration - Teachtaireacht ghutha ó $sender';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Má scriosann tú an socrú fógra seo, ní féidir é seo a chealú.';

  @override
  String get more => 'Tuilleadh';

  @override
  String get shareKeysWith => 'Roinn na heochracha le...';

  @override
  String get shareKeysWithDescription =>
      'Cad iad na gléasanna ar cheart muinín a chur iontu ionas gur féidir leo do chuid teachtaireachtaí a léamh i gcomhráite criptithe?';

  @override
  String get allDevices => 'Gach gléasanna';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Gléasanna trasfhíoraithe má tá siad cumasaithe';

  @override
  String get crossVerifiedDevices => 'Feistí trasfhíoraithe';

  @override
  String get verifiedDevicesOnly => 'Gléasanna fíoraithe amháin';

  @override
  String get takeAPhoto => 'Glac grianghraf';

  @override
  String get recordAVideo => 'Taifead físeán';

  @override
  String get optionalMessage => 'Teachtaireacht (Roghnach)…';

  @override
  String get notSupportedOnThisDevice => 'Ní thacaítear leis ar an ngléas seo';

  @override
  String get enterNewChat => 'Cuir isteach comhrá nua';

  @override
  String get approve => 'Ceadaigh';

  @override
  String get youHaveKnocked => 'Bhuail tú';

  @override
  String get pleaseWaitUntilInvited =>
      'Fan anois, le do thoil, go dtí go dtabharfaidh duine éigin ón seomra cuireadh duit.';

  @override
  String get commandHint_logout => 'Logáil amach as do ghléas reatha';

  @override
  String get commandHint_logoutall => 'Logáil amach gach gléas gníomhach';

  @override
  String get displayNavigationRail =>
      'Taispeáin ráille nascleanúna ar fhóin phóca';

  @override
  String get customReaction => 'Imoibriú saincheaptha';

  @override
  String get moreEvents => 'Tuilleadh imeachtaí';

  @override
  String get showMore => 'Show more';

  @override
  String get showLess => 'Show less';

  @override
  String get declineInvitation => 'Diúltaigh don chuireadh';

  @override
  String get noMessagesYet => 'Gan aon teachtaireachtaí fós';

  @override
  String get longPressToRecordVoiceMessage =>
      'Brúigh go fada chun teachtaireacht gutha a thaifeadadh.';

  @override
  String get pause => 'Sos';

  @override
  String get resume => 'Atosú';

  @override
  String get removeFromSpaceDescription =>
      'Bainfear an comhrá as an spás ach beidh sé fós le feiceáil i do liosta comhrá.';

  @override
  String countChats(int chats) {
    return 'comhráite $chats';
  }

  @override
  String spaceMemberOf(String spaces) {
    return 'Ball spáis de $spaces';
  }

  @override
  String spaceMemberOfCanKnock(String spaces) {
    return 'Is féidir le ball spáis de $spaces cnagadh';
  }

  @override
  String get startPoll => 'Tosaigh pobalbhreith';

  @override
  String get endPoll => 'Deireadh leis an pobalbhreith';

  @override
  String get answersVisible => 'Freagraí le feiceáil';

  @override
  String get pollQuestion => 'Ceist pobalbhreithe';

  @override
  String get answerOption => 'Rogha freagartha';

  @override
  String get addAnswerOption => 'Cuir rogha freagra leis';

  @override
  String get allowMultipleAnswers => 'Ceadaigh freagraí iolracha';

  @override
  String get pollHasBeenEnded => 'Tá deireadh leis an pobalbhreith';

  @override
  String countVotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vótaí',
      one: 'Vóta amháin',
    );
    return '$_temp0';
  }

  @override
  String get answersWillBeVisibleWhenPollHasEnded =>
      'Beidh freagraí le feiceáil nuair a bheidh an pobalbhreith thart';

  @override
  String get replyInThread => 'Freagra sa snáithe';

  @override
  String countReplies(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count freagraí',
      one: 'Freagra amháin',
    );
    return '$_temp0';
  }

  @override
  String get thread => 'Snáithe';

  @override
  String get backToMainChat => 'Ar ais chuig an bpríomhchomhrá';

  @override
  String get saveChanges => 'Sábháil athruithe';

  @override
  String get createSticker => 'Cruthaigh greamán nó emoji';

  @override
  String get useAsSticker => 'Úsáid mar ghreamán';

  @override
  String get useAsEmoji => 'Úsáid mar emoji';

  @override
  String get stickerPackNameAlreadyExists =>
      'Tá ainm an phacáiste greamán ann cheana féin';

  @override
  String get newStickerPack => 'Pacáiste greamán nua';

  @override
  String get stickerPackName => 'Ainm an phacáiste greamán';

  @override
  String get attribution => 'Atribution';

  @override
  String get skipChatBackup => 'Seachain cúltaca comhrá';

  @override
  String get skipChatBackupWarning =>
      'An bhfuil tú cinnte? Mura gcumasaíonn tú an cúltaca comhrá, d’fhéadfá rochtain ar do theachtaireachtaí a chailleadh má athraíonn tú do ghléas.';

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
  String get loadingMessages => 'Ag lódáil teachtaireachtaí';

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
      'Tabhair faoi deara go bhfuil físglaonna i béite. B\'fhéidir nach bhfeidhmíonn siad ar gach ardán chomh atá súil aige ná ar bith.';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get incomingCall => 'Incoming call';

  @override
  String get videoCall => 'Físghlao';

  @override
  String get voiceCall => 'Glao gutha';

  @override
  String get missedCall => 'Missed call';

  @override
  String get callBack => 'Call back';

  @override
  String get hangUp => 'Hang up';

  @override
  String get waitingForParticipant => 'Waiting for participant...';

  @override
  String get decline => 'Meath';

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
