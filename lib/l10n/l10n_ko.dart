// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class L10nKo extends L10n {
  L10nKo([String locale = 'ko']) : super(locale);

  @override
  String get alwaysUse24HourFormat => 'false';

  @override
  String get repeatPassword => '비밀번호 다시 입력';

  @override
  String get notAnImage => '이미지 파일이 아닙니다.';

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
  String get remove => '지우기';

  @override
  String get importNow => '지금 불러오기';

  @override
  String get importEmojis => '이모지 불러오기';

  @override
  String get importFromZipFile => '.zip 파일에서 불러오기';

  @override
  String get exportEmotePack => '.zip 파일로 이모트 내보내기';

  @override
  String get replace => '대체';

  @override
  String get about => '소개';

  @override
  String aboutHomeserver(String homeserver) {
    return '$homeserver의 대해서';
  }

  @override
  String get accept => '수락';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username님이 초대를 수락함';
  }

  @override
  String get account => '계정';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username님이 종단간 암호화를 활성화함';
  }

  @override
  String get addEmail => '이메일 추가';

  @override
  String get confirmREChainId => '계정을 삭제하려면 REChain ID를 입력해 주세요.';

  @override
  String supposedMxid(String mxid) {
    return '$mxid 이어야 함';
  }

  @override
  String get addChatDescription => '채팅 설명 추가하기...';

  @override
  String get addToSpace => '스페이스에 추가';

  @override
  String get admin => '운영자';

  @override
  String get alias => '별명';

  @override
  String get all => '모두';

  @override
  String get allChats => '모든 채팅';

  @override
  String get commandHint_roomupgrade =>
      'Upgrade this room to the given room version';

  @override
  String get commandHint_googly => '왕눈이 눈알 보내기';

  @override
  String get commandHint_cuddle => '미소 보내기';

  @override
  String get commandHint_hug => '허그 보내기';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName 님이 왕눈이 눈알을 보냈습니다';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName 님이 당신에게 미소짓습니다';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName님이 당신을 허그합니다';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName님이 전화에 응답했습니다';
  }

  @override
  String get anyoneCanJoin => '누구나 참가할 수 있음';

  @override
  String get appLock => '앱 잠금';

  @override
  String get appLockDescription => '앱을 사용하지 않을 때 pin으로 잠금';

  @override
  String get archive => '저장';

  @override
  String get areGuestsAllowedToJoin => '게스트 유저의 참가 여부';

  @override
  String get areYouSure => '확실한가요?';

  @override
  String get areYouSureYouWantToLogout => '로그아웃하고 싶은 것이 확실한가요?';

  @override
  String get askSSSSSign => '다른 사람을 서명하기 위해서, 저장 비밀번호나 복구 키를 입력해주세요.';

  @override
  String askVerificationRequest(String username) {
    return '$username님의 인증 요청을 수락할까요?';
  }

  @override
  String get autoplayImages => '자동으로 움직이는 스티커와 이모트 재생';

  @override
  String badServerLoginTypesException(String serverVersions,
      String supportedVersions, Object suportedVersions) {
    return '홈서버가 지원하는 로그인 유형:\n$serverVersions\n하지만 이 앱에서 지원하는 것은:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => '입력 알림 보내기';

  @override
  String get swipeRightToLeftToReply => '오른쪽에서 왼쪽으로 스와이프해서 답장';

  @override
  String get sendOnEnter => '엔터로 보내기';

  @override
  String badServerVersionsException(
      String serverVersions,
      String supportedVersions,
      Object serverVerions,
      Object supoortedVersions,
      Object suportedVersions) {
    return '이 홈서버가 지원하는 Spec 버전:\n$serverVersions\n하지만 이 앱은 $supportedVersions만 지원합니다';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats 채팅과 $participants 참여자';
  }

  @override
  String get noMoreChatsFound => '채팅을 찾을 수 없습니다...';

  @override
  String get noChatsFoundHere =>
      '대화가 발견되지 않았습니다. 아래 버튼을 사용하여 새 대화를 시작해 보세요. ⤵️';

  @override
  String get joinedChats => '참가한 채팅';

  @override
  String get unread => '읽지 않은';

  @override
  String get space => '스페이스';

  @override
  String get spaces => '스페이스';

  @override
  String get banFromChat => '채팅에서 영구 추방';

  @override
  String get banned => '영구 추방됨';

  @override
  String bannedUser(String username, String targetName) {
    return '$username님이 $targetName님을 영구 추방함';
  }

  @override
  String get blockDevice => '기기 차단';

  @override
  String get blocked => '차단됨';

  @override
  String get botMessages => '봇 메시지';

  @override
  String get cancel => '취소';

  @override
  String cantOpenUri(String uri) {
    return 'URI $uri를 열 수 없습니다';
  }

  @override
  String get changeDeviceName => '기기 이름 바꾸기';

  @override
  String changedTheChatAvatar(String username) {
    return '$username님이 채팅 아바타를 바꿈';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username님이 채팅 설명을 \'$description\' 으로 변경함';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username님이 채팅 이름을 \'$chatname\' 으로 바꿈';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username님이 채팅 권한을 바꿈';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username님이 닉네임을 \'$displayname\' 로 바꿈';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username님이 게스트 접근 규칙을 변경함';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username님이 게스트 접근 규칙을 $rules 로 변경함';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username님이 대화 기록 설정을 변경함';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username님이 대화 기록 설정을 $rules 로 바꿈';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username님이 참가 규칙을 바꿈';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username님이 참가 규칙을 $joinRules 로 바꿈';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username님이 자신의 아바타를 바꿈';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username님이 방 별명을 바꿈';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username님이 초대 링크를 바꿈';
  }

  @override
  String get changePassword => '비밀번호 바꾸기';

  @override
  String get changeTheHomeserver => '홈서버 바꾸기';

  @override
  String get changeTheme => '스타일 바꾸기';

  @override
  String get changeTheNameOfTheGroup => '채팅의 이름 바꾸기';

  @override
  String get changeYourAvatar => '아바타 바꾸기';

  @override
  String get channelCorruptedDecryptError => '암호화가 손상되었습니다';

  @override
  String get chat => '채팅';

  @override
  String get yourChatBackupHasBeenSetUp => '당신의 채팅 백업이 설정되었습니다.';

  @override
  String get chatBackup => '채팅 백업';

  @override
  String get chatBackupDescription =>
      '당신의 오래된 메시지는 보안 키로 보호됩니다. 이 키를 잃어버리지 마세요.';

  @override
  String get chatDetails => '채팅 정보';

  @override
  String get chatHasBeenAddedToThisSpace => '이 스페이스에 채팅이 추가되었습니다';

  @override
  String get chats => '채팅';

  @override
  String get chooseAStrongPassword => '안전한 비밀번호를 설정하세요';

  @override
  String get clearArchive => '저장 지우기';

  @override
  String get close => '닫기';

  @override
  String get commandHint_markasdm => 'REChain ID를 위한 다이렉트 메시지 방으로 표시';

  @override
  String get commandHint_markasgroup => '그룹 채팅으로 만들기';

  @override
  String get commandHint_ban => '이 방에서 주어진 유저 영구 추방하기';

  @override
  String get commandHint_clearcache => '캐시 지우기';

  @override
  String get commandHint_create =>
      '빈 그룹 채팅을 생성\n--no-encryption을 사용해 암호화를 비활성화';

  @override
  String get commandHint_discardsession => '세션 삭제';

  @override
  String get commandHint_dm => '다이렉트 채팅 시작\t\n--no-encryption을 사용해 암호화 비활성화';

  @override
  String get commandHint_html => 'HTML 형식의 문자 보내기';

  @override
  String get commandHint_invite => '주어진 유저 이 룸에 초대하기';

  @override
  String get commandHint_join => '주어진 방 참가하기';

  @override
  String get commandHint_kick => '주어진 유저 방에서 삭제하기';

  @override
  String get commandHint_leave => '이 룸 나가기';

  @override
  String get commandHint_me => '자신을 소개하세요';

  @override
  String get commandHint_myroomavatar => '이 방의 사진 설정하기 (by mxc-uri)';

  @override
  String get commandHint_myroomnick => '이 방의 표시 이름 설정하기';

  @override
  String get commandHint_op => '주어진 유저의 권한 레벨 설정 (기본:50)';

  @override
  String get commandHint_plain => '형식이 지정되지 않은 문자 보내기';

  @override
  String get commandHint_react => '답장 반응으로 보내기';

  @override
  String get commandHint_send => '문자 보내기';

  @override
  String get commandHint_unban => '주어진 유저를 이 방에서 영구추방 해제하기';

  @override
  String get commandInvalid => '잘못된 명령어';

  @override
  String commandMissing(String command) {
    return '$command 는 명령어가 아닙니다.';
  }

  @override
  String get compareEmojiMatch => '아래의 이모지가 일치하는지 비교하세요';

  @override
  String get compareNumbersMatch => '아래의 숫자가 일치하는지 비교하세요';

  @override
  String get configureChat => '채팅 설정';

  @override
  String get confirm => '확인';

  @override
  String get connect => '연결';

  @override
  String get contactHasBeenInvitedToTheGroup => '연락처가 채팅에 초대되었습니다';

  @override
  String get containsDisplayName => '내 닉네임 포함';

  @override
  String get containsUserName => '내 아이디 포함';

  @override
  String get contentHasBeenReported => '콘텐츠가 서버 운영자에게 신고되었습니다';

  @override
  String get copiedToClipboard => '클립보드에 복사됨';

  @override
  String get copy => '복사';

  @override
  String get copyToClipboard => '클립보드에 복사';

  @override
  String couldNotDecryptMessage(String error) {
    return '메시지 복호화할 수 없음: $error';
  }

  @override
  String get checkList => 'Check list';

  @override
  String countParticipants(int count) {
    return '$count 참여자';
  }

  @override
  String countInvited(int count) {
    return '$count invited';
  }

  @override
  String get create => '생성';

  @override
  String createdTheChat(String username) {
    return '💬 $username님이 채팅을 생성함';
  }

  @override
  String get createGroup => '새 그룹 채팅';

  @override
  String get createNewSpace => '새로운 스페이스';

  @override
  String get currentlyActive => '현재 활동 중';

  @override
  String get darkTheme => '다크';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
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
      '이것은 당신의 계정을 비활성화할 것입니다. 이것은 되돌릴 수 없습니다! 확실한가요?';

  @override
  String get defaultPermissionLevel => '새로 참가하는 유저들의 기본 권한 레벨';

  @override
  String get delete => '삭제';

  @override
  String get deleteAccount => '계정 삭제';

  @override
  String get deleteMessage => '메시지 삭제';

  @override
  String get device => '기기';

  @override
  String get deviceId => '기기 ID';

  @override
  String get devices => '기기';

  @override
  String get directChats => '다이렉트 채팅';

  @override
  String get allRooms => '모든 그룹 채팅';

  @override
  String get displaynameHasBeenChanged => '표시 이름이 변경되었습니다';

  @override
  String get downloadFile => '파일 다운로드';

  @override
  String get edit => '수정';

  @override
  String get editBlockedServers => '차단된 서버 수정';

  @override
  String get chatPermissions => '채팅 권한';

  @override
  String get editDisplayname => '표시 이름 수정';

  @override
  String get editRoomAliases => '방 별명 수정';

  @override
  String get editRoomAvatar => '방 아바타 수정';

  @override
  String get emoteExists => '이모트가 이미 존재합니다!';

  @override
  String get emoteInvalid => '올바르지 않은 이모트 단축키!';

  @override
  String get emoteKeyboardNoRecents => '최근 사용한 이모트가 여기 나타납니다...';

  @override
  String get emotePacks => '방을 위한 이모트 팩';

  @override
  String get emoteSettings => '이모트 설정';

  @override
  String get globalChatId => '글로벌 채팅 ID';

  @override
  String get accessAndVisibility => '채팅 가입과 대화 기록';

  @override
  String get accessAndVisibilityDescription =>
      '채팅에 참가 할 수 있는 사람과 채팅을 볼 수 있는 범위';

  @override
  String get calls => '전화';

  @override
  String get customEmojisAndStickers => '커스텀 이모지와 스티커';

  @override
  String get customEmojisAndStickersBody =>
      '모든 채팅에서 사용할 수있는 커스텀 이모지와 스티커를 추가하거나 공유합니다.';

  @override
  String get emoteShortcode => '이모트 단축키';

  @override
  String get emoteWarnNeedToPick => '이모트 단축키와 이미지를 골라야 합니다!';

  @override
  String get emptyChat => '빈 채팅';

  @override
  String get enableEmotesGlobally => '이모트 팩 항상 사용하기';

  @override
  String get enableEncryption => '암호화 사용';

  @override
  String get enableEncryptionWarning => '당신은 다시 암호화를 비활성화할 수 없습니다. 확실한가요?';

  @override
  String get encrypted => '암호화됨';

  @override
  String get encryption => '암호화';

  @override
  String get encryptionNotEnabled => '암호화가 비활성화됨';

  @override
  String endedTheCall(String senderName) {
    return '$senderName 이 통화를 종료했습니다';
  }

  @override
  String get enterAnEmailAddress => '이메일 주소 입력';

  @override
  String get homeserver => '홈서버';

  @override
  String get enterYourHomeserver => '당신의 홈서버를 입력하세요';

  @override
  String errorObtainingLocation(String error) {
    return '위치 얻는 중 오류: $error';
  }

  @override
  String get everythingReady => '모든 것이 준비됐어요!';

  @override
  String get extremeOffensive => '매우 공격적임';

  @override
  String get fileName => '파일 이름';

  @override
  String get rechainonline => 'REChain';

  @override
  String get fontSize => '폰트 크기';

  @override
  String get forward => '전달';

  @override
  String get fromJoining => '참가시점 이후로';

  @override
  String get fromTheInvitation => '초대받은 후부터';

  @override
  String get goToTheNewRoom => '새로운 방 가기';

  @override
  String get group => '그룹 채팅';

  @override
  String get chatDescription => '채팅 설명';

  @override
  String get chatDescriptionHasBeenChanged => '채팅 설명 변경됨';

  @override
  String get groupIsPublic => '그룹 채팅 공개';

  @override
  String get groups => '그룹 채팅';

  @override
  String groupWith(String displayname) {
    return '$displayname님과의 그룹';
  }

  @override
  String get guestsAreForbidden => '게스트가 들어올 수 없음';

  @override
  String get guestsCanJoin => '게스트가 참가할 수 있음';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username님이 $targetName님에 대한 초대를 철회함';
  }

  @override
  String get help => '도움';

  @override
  String get hideRedactedEvents => '지워진 이벤트 숨기기';

  @override
  String get hideRedactedMessages => '삭제된 메시지 숨기기';

  @override
  String get hideRedactedMessagesBody => '누군가가 메시지를 삭제하면 메시지를 더 이상 볼 수 없습니다.';

  @override
  String get hideInvalidOrUnknownMessageFormats => '잘못되거나 알 수 없는 메시지 형식 숨김';

  @override
  String get howOffensiveIsThisContent => '이 콘텐츠가 얼마나 모욕적인가요?';

  @override
  String get id => 'ID';

  @override
  String get identity => '신원';

  @override
  String get block => '차단';

  @override
  String get blockedUsers => '차단된 유저';

  @override
  String get blockListDescription =>
      '당신은 당신을 방해하는 유저들을 차단할 수 있습니다. 당신은 당신의 개인 차단 목록에 있는 어떠한 유저의 메시지와 방 초대도 받지 않을것 입니다.';

  @override
  String get blockUsername => '유저 이름 무시';

  @override
  String get iHaveClickedOnLink => '링크를 클릭했어요';

  @override
  String get incorrectPassphraseOrKey => '올바르지 않은 복구 키나 비밀번호';

  @override
  String get inoffensive => '모욕적이지 않음';

  @override
  String get inviteContact => '연락처 초대';

  @override
  String inviteContactToGroupQuestion(Object contact, Object groupName) {
    return '$contact 를 \"$groupName\"에 초대할까요?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return '연락처를 $groupName에 초대';
  }

  @override
  String get noChatDescriptionYet => '채팅 설명이 아직 추가되지 않음.';

  @override
  String get tryAgain => '다시 시도하기';

  @override
  String get invalidServerName => '잘못된 서버 이름';

  @override
  String get invited => '초대됨';

  @override
  String get redactMessageDescription =>
      '메시지는 이 대화의 모든 참여자에게 삭제될 것 입니다. 되돌릴 수 없습니다.';

  @override
  String get optionalRedactReason => '(선택) 이 메시지를 편집하는 이유...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username님이 $targetName님을 초대함';
  }

  @override
  String get invitedUsersOnly => '초대된 유저만';

  @override
  String get inviteForMe => '초대됨';

  @override
  String inviteText(String username, String link) {
    return '$username님이 당신을 REChain에 초대했습니다.\n1. REChain 설치: https://online.rechain.network \n2. 가입하거나 로그인 \n3. 초대 링크 열기: \n $link';
  }

  @override
  String get isTyping => '입력 중…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username님이 채팅에 참가함';
  }

  @override
  String get joinRoom => '방 참가하기';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username님이 $targetName님을 추방함';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username님이 $targetName님을 추방하고 차단함';
  }

  @override
  String get kickFromChat => '채팅에서 추방';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return '마지막 활동: $localizedTimeShort';
  }

  @override
  String get leave => '나가기';

  @override
  String get leftTheChat => '채팅을 나갔습니다';

  @override
  String get license => '라이선스';

  @override
  String get lightTheme => '라이트';

  @override
  String loadCountMoreParticipants(int count) {
    return '$count명의 참가자 더 표시';
  }

  @override
  String get dehydrate => '세션을 내보내고 기기 초기화 하기';

  @override
  String get dehydrateWarning => '이 동작은 되돌릴 수 없습니다. 백업 파일을 꼭 안전하게 보관하세요.';

  @override
  String get dehydrateTor => 'TOR 사용자: 세션 내보내기';

  @override
  String get dehydrateTorLong => 'TOR 사용자들은 창을 닫기 전에 세션을 내보내는것이 권장됩니다.';

  @override
  String get hydrateTor => 'TOR 사용자: 내보낸 세션 불러오기';

  @override
  String get hydrateTorLong => '지난 TOR 이용에서 세션을 내보내셨나요? 빠르게 불러오고 채팅을 계속하세요.';

  @override
  String get hydrate => '백업 파일로부터 가져오기';

  @override
  String get loadingPleaseWait => '로딩 중... 기다려 주세요.';

  @override
  String get loadMore => '더 불러오기…';

  @override
  String get locationDisabledNotice => '위치 서비스가 비활성화되었습니다. 위치를 공유하려면 활성화시켜주세요.';

  @override
  String get locationPermissionDeniedNotice =>
      '위치 권한이 거부되었습니다. 위치를 공유하기 위해서 허용해주세요.';

  @override
  String get login => '로그인';

  @override
  String logInTo(String homeserver) {
    return '$homeserver 에 로그인';
  }

  @override
  String get logout => '로그아웃';

  @override
  String get memberChanges => '참가자 변경';

  @override
  String get mention => '멘션';

  @override
  String get messages => '메시지';

  @override
  String get messagesStyle => '메세지:';

  @override
  String get moderator => '관리자';

  @override
  String get muteChat => '채팅 음소거';

  @override
  String get needPantalaimonWarning =>
      '지금 종단간 암호화를 사용하기 위해서는 Pantalaimon이 필요하다는 것을 알아주세요.';

  @override
  String get newChat => '새 채팅';

  @override
  String get newMessageInrechainonline => '💬 REChain에서 새로운 메시지';

  @override
  String get newVerificationRequest => '새로운 확인 요청!';

  @override
  String get next => '다음';

  @override
  String get no => '아니요';

  @override
  String get noConnectionToTheServer => '서버에 연결 없음';

  @override
  String get noEmotesFound => '이모트 발견되지 않음. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      '당신은 방이 공개적으로 접근 가능하지 않을 때만 암호화를 켤 수 있습니다.';

  @override
  String get noGoogleServicesWarning =>
      '이 휴대폰에 Firebase Cloud Messaging 서비스가 없는 것 같습니다. REChain에서 푸시 알림을 받으려면 ntfy 사용을 추천합니다. ntfy 혹은 다른 푸시 알림 제공자를 사용하면 알림을 보안적인 방법으로 받을 수 있습니다. ntfy는 PlayStore와 F-Droid에서 설치 가능합니다.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1은 Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node Network 서버가 아닙니다, $server2를 대신 사용할까요?';
  }

  @override
  String get shareInviteLink => '초대 링크 공유';

  @override
  String get scanQrCode => 'QR 코드 스캔';

  @override
  String get none => '없음';

  @override
  String get noPasswordRecoveryDescription => '당신은 비밀번호를 복구할 방법을 추가하지 않았습니다.';

  @override
  String get noPermission => '권한 없음';

  @override
  String get noRoomsFound => '아무 방도 발견되지 않았어요…';

  @override
  String get notifications => '알림';

  @override
  String get notificationsEnabledForThisAccount => '이 계정에서 알림이 활성화되었습니다';

  @override
  String numUsersTyping(int count) {
    return '$count명이 입력 중…';
  }

  @override
  String get obtainingLocation => '위치 얻는 중…';

  @override
  String get offensive => '모욕적임';

  @override
  String get offline => '오프라인';

  @override
  String get ok => '확인';

  @override
  String get online => '온라인';

  @override
  String get onlineKeyBackupEnabled => '온라인 키 백업이 활성화됨';

  @override
  String get oopsPushError => '앗! 안타깝게도, 푸시 알림을 설정하는 중 오류가 발생했습니다.';

  @override
  String get oopsSomethingWentWrong => '앗, 무언가가 잘못되었습니다…';

  @override
  String get openAppToReadMessages => '앱을 열어서 메시지를 읽으세요';

  @override
  String get openCamera => '카메라 열기';

  @override
  String get openVideoCamera => '영상용 카메라 열기';

  @override
  String get oneClientLoggedOut => '당신의 클라이언트 중 하나가 로그아웃 됨';

  @override
  String get addAccount => '계정 추가';

  @override
  String get editBundlesForAccount => '이 계정의 번들 수정';

  @override
  String get addToBundle => '번들에 추가';

  @override
  String get removeFromBundle => '이 번들에서 삭제';

  @override
  String get bundleName => '번들 이름';

  @override
  String get enableMultiAccounts => '(베타) 이 기기에서 다중 계정 활성화';

  @override
  String get openInMaps => '지도에서 열기';

  @override
  String get link => '링크';

  @override
  String get serverRequiresEmail => '이 서버는 가입을 위해 당신의 이메일을 확인해야 합니다.';

  @override
  String get or => '이나';

  @override
  String get participant => '참여자';

  @override
  String get passphraseOrKey => '비밀번호나 복구 키';

  @override
  String get password => '비밀번호';

  @override
  String get passwordForgotten => '비밀번호 까먹음';

  @override
  String get passwordHasBeenChanged => '비밀번호가 변경됨';

  @override
  String get hideMemberChangesInPublicChats => '공개 채팅에서의 참가자 변화 숨김';

  @override
  String get hideMemberChangesInPublicChatsBody =>
      '공개 채팅에 누군가가 참가하거나 떠날때 타임라인에 표시하지 않습니다.';

  @override
  String get overview => '개요';

  @override
  String get notifyMeFor => '나에게 알림';

  @override
  String get passwordRecoverySettings => '비밀번호 복구 설정';

  @override
  String get passwordRecovery => '비밀번호 복구';

  @override
  String get people => '사람들';

  @override
  String get pickImage => '이미지 고르기';

  @override
  String get pin => '고정';

  @override
  String play(String fileName) {
    return '$fileName 재생';
  }

  @override
  String get pleaseChoose => '선택해주세요';

  @override
  String get pleaseChooseAPasscode => '비밀번호를 골라주세요';

  @override
  String get pleaseClickOnLink => '이메일의 링크를 클릭하고 진행해주세요.';

  @override
  String get pleaseEnter4Digits => '4자리 숫자를 입력하거나 앱 잠금을 사용하지 않도록 하려면 비워두세요.';

  @override
  String get pleaseEnterRecoveryKey => '당신의 복구키를 입력하세요:';

  @override
  String get pleaseEnterYourPassword => '비밀번호를 입력해주세요';

  @override
  String get pleaseEnterYourPin => 'PIN을 입력해주세요';

  @override
  String get pleaseEnterYourUsername => '유저 이름을 입력해주세요';

  @override
  String get pleaseFollowInstructionsOnWeb => '웹사이트의 가이드를 따르고 다음 버튼을 눌러주세요.';

  @override
  String get privacy => '프라이버시';

  @override
  String get publicRooms => '공개 방';

  @override
  String get pushRules => '푸시 규칙';

  @override
  String get reason => '이유';

  @override
  String get recording => '녹음';

  @override
  String redactedBy(String username) {
    return '$username님이 삭제함';
  }

  @override
  String get directChat => '다이렉트 채팅';

  @override
  String redactedByBecause(String username, String reason) {
    return '$username님이 삭제함. 사유: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username님이 이벤트를 지움';
  }

  @override
  String get redactMessage => '메시지 지우기';

  @override
  String get register => '가입';

  @override
  String get reject => '거절';

  @override
  String rejectedTheInvitation(String username) {
    return '$username님이 초대를 거절함';
  }

  @override
  String get rejoin => '다시 참가';

  @override
  String get removeAllOtherDevices => '모든 다른 기기에서 지우기';

  @override
  String removedBy(String username) {
    return '$username에 의해 지워짐';
  }

  @override
  String get removeDevice => '기기 삭제';

  @override
  String get unbanFromChat => '채팅에서 영구추방 해제됨';

  @override
  String get removeYourAvatar => '아바타 지우기';

  @override
  String get replaceRoomWithNewerVersion => '방 새로운 버전으로 대체하기';

  @override
  String get reply => '답장';

  @override
  String get reportMessage => '메시지 신고';

  @override
  String get requestPermission => '권한 요청';

  @override
  String get roomHasBeenUpgraded => '방이 업그레이드되었습니다';

  @override
  String get roomVersion => '방 버전';

  @override
  String get saveFile => '파일 저장';

  @override
  String get search => '검색';

  @override
  String get security => '보안';

  @override
  String get recoveryKey => '복구키';

  @override
  String get recoveryKeyLost => '복구키를 분실하셨나요?';

  @override
  String seenByUser(String username) {
    return '$username님이 읽음';
  }

  @override
  String get send => '보내기';

  @override
  String get sendAMessage => '메시지 보내기';

  @override
  String get sendAsText => '텍스트로 보내기';

  @override
  String get sendAudio => '오디오 보내기';

  @override
  String get sendFile => '파일 보내기';

  @override
  String get sendImage => '이미지 보내기';

  @override
  String sendImages(int count) {
    return '이미지 $count개 보내기';
  }

  @override
  String get sendMessages => '메시지 보내기';

  @override
  String get sendOriginal => '원본 보내기';

  @override
  String get sendSticker => '스티커 보내기';

  @override
  String get sendVideo => '영상 보내기';

  @override
  String sentAFile(String username) {
    return '📁 $username님이 파일을 보냄';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username님이 오디오를 보냄';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username님이 사진을 보냄';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username님이 스티커를 보냄';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username님이 영상을 보냄';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName 이 통화 정보 보냄';
  }

  @override
  String get separateChatTypes => '다이렉트 채팅과 그룹 채팅 분리';

  @override
  String get setAsCanonicalAlias => '주 별명으로 설정';

  @override
  String get setCustomEmotes => '맞춤 이모트 설정';

  @override
  String get setChatDescription => '채팅 설명 설정';

  @override
  String get setInvitationLink => '초대 링크 설정';

  @override
  String get setPermissionsLevel => '권한 레벨 설정';

  @override
  String get setStatus => '상태 설정';

  @override
  String get settings => '설정';

  @override
  String get share => '공유';

  @override
  String sharedTheLocation(String username) {
    return '$username님이 위치를 공유함';
  }

  @override
  String get shareLocation => '위치 보내기';

  @override
  String get showPassword => '비밀번호 보이기';

  @override
  String get presenceStyle => '상태:';

  @override
  String get presencesToggle => '다른 유저의 상태 메시지 표시';

  @override
  String get singlesignon => '단일 계정 로그인(SSO)';

  @override
  String get skip => '스킵';

  @override
  String get sourceCode => '소스 코드';

  @override
  String get spaceIsPublic => '스페이스 공개';

  @override
  String get spaceName => '스페이스 이름';

  @override
  String startedACall(String senderName) {
    return '$senderName 가 통화 시작함';
  }

  @override
  String get startFirstChat => '첫 번째 채팅을 시작하기';

  @override
  String get status => '상태';

  @override
  String get statusExampleMessage => '오늘은 어떤 기분인가요?';

  @override
  String get submit => '제출';

  @override
  String get synchronizingPleaseWait => '동기화 중... 기다려주세요.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' 동기화중… ($percentage%)';
  }

  @override
  String get systemTheme => '시스템';

  @override
  String get theyDontMatch => '일치하지 않습니다';

  @override
  String get theyMatch => '일치합니다';

  @override
  String get title => 'REChain';

  @override
  String get toggleFavorite => '즐겨찾기 토글';

  @override
  String get toggleMuted => '음소거 토글';

  @override
  String get toggleUnread => '메시지 안/읽음 으로 표시';

  @override
  String get tooManyRequestsWarning => '너무 많은 요청. 잠시 후에 다시 시도해주세요!';

  @override
  String get transferFromAnotherDevice => '다른 기기에서 가져오기';

  @override
  String get tryToSendAgain => '다시 보내도록 시도';

  @override
  String get unavailable => '사용할 수 없음';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username님이 $targetName님에대한 영구추방을 해제함';
  }

  @override
  String get unblockDevice => '기기 차단 해제';

  @override
  String get unknownDevice => '알 수 없는 기기';

  @override
  String get unknownEncryptionAlgorithm => '알 수 없는 암호화 알고리즘';

  @override
  String unknownEvent(String type) {
    return '알 수 없는 이벤트 \'$type\'';
  }

  @override
  String get unmuteChat => '음소거 해제';

  @override
  String get unpin => '고정 해제';

  @override
  String unreadChats(int unreadCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount 개',
      one: '읽지 않은 채팅 1',
    );
    return '$_temp0';
  }

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username님 + $count명이 입력 중…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username님과 $username2님이 입력 중…';
  }

  @override
  String userIsTyping(String username) {
    return '$username님이 입력 중…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username님이 채팅을 나감';
  }

  @override
  String get username => '유저 이름';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username님이 $type 이벤트 보냄';
  }

  @override
  String get unverified => '확인되지 않음';

  @override
  String get verified => '확인됨';

  @override
  String get verify => '확인';

  @override
  String get verifyStart => '확인 시작';

  @override
  String get verifySuccess => '성공적으로 확인했어요!';

  @override
  String get verifyTitle => '다른 계정 확인 중';

  @override
  String get videoCall => '영상 통화';

  @override
  String get visibilityOfTheChatHistory => '대화 기록 설정';

  @override
  String get visibleForAllParticipants => '모든 참가자에게 보임';

  @override
  String get visibleForEveryone => '모두에게 보임';

  @override
  String get voiceMessage => '음성 메시지';

  @override
  String get waitingPartnerAcceptRequest => '상대가 요청을 수락하길 기다리는 중…';

  @override
  String get waitingPartnerEmoji => '상대가 이모지를 수락하길 기다리는 중…';

  @override
  String get waitingPartnerNumbers => '상대가 숫자를 수락하길 기다리는 중…';

  @override
  String get wallpaper => '배경:';

  @override
  String get warning => '경고!';

  @override
  String get weSentYouAnEmail => '우리가 당신에게 이메일을 보냈습니다';

  @override
  String get whoCanPerformWhichAction => '누가 어떤 행동을 할 수 있는지';

  @override
  String get whoIsAllowedToJoinThisGroup => '참가 제한 설정';

  @override
  String get whyDoYouWantToReportThis => '왜 이것을 신고하려고 하나요?';

  @override
  String get wipeChatBackup => '새로운 복구키를 생성하기 위해 채팅 백업을 초기화할까요?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      '이 주소로 당신의 비밀번호를 복구할 수 있습니다.';

  @override
  String get writeAMessage => '메시지 작성…';

  @override
  String get yes => '확인';

  @override
  String get you => '당신';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      '당신은 더 이상 이 채팅에 참여하지 않습니다';

  @override
  String get youHaveBeenBannedFromThisChat => '당신은 이 채팅에서 영구 추방되었습니다';

  @override
  String get yourPublicKey => '당신의 공개 키';

  @override
  String get messageInfo => '메시지 정보';

  @override
  String get time => '시간';

  @override
  String get messageType => '메시지 유형';

  @override
  String get sender => '발신자';

  @override
  String get openGallery => '갤러리 열기';

  @override
  String get removeFromSpace => '스페이스에서 삭제';

  @override
  String get addToSpaceDescription => '이 채팅을 추가할 스페이스를 선택하세요.';

  @override
  String get start => '시작';

  @override
  String get pleaseEnterRecoveryKeyDescription =>
      '오래된 메시지를 잠금 해제하려면, 이전 세션에서 생성된 복호화 키를 입력하세요. 복호화 키는 비밀번호가 아닙니다.';

  @override
  String get publish => '공개';

  @override
  String videoWithSize(String size) {
    return '영상 ($size)';
  }

  @override
  String get openChat => '채팅 열기';

  @override
  String get markAsRead => '읽음으로 표시하기';

  @override
  String get reportUser => '유저 신고';

  @override
  String get dismiss => '닫기';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender가 $reaction로 반응함';
  }

  @override
  String get pinMessage => '방에 고정';

  @override
  String get confirmEventUnpin => '이벤트를 영구적으로 고정 해제할 것이 확실한가요?';

  @override
  String get emojis => '이모지';

  @override
  String get placeCall => '전화 걸기';

  @override
  String get voiceCall => '음성 통화';

  @override
  String get unsupportedAndroidVersion => '지원되지 않는 안드로이드 버전';

  @override
  String get unsupportedAndroidVersionLong =>
      '이 기능은 새로운 안드로이드 버전을 요구합니다. Mobile Katya OS 지원이나 업데이트를 확인해주세요.';

  @override
  String get videoCallsBetaWarning =>
      '영상 통화는 베타임을 확인해주세요. 의도한 대로 작동하지 않거나 모든 플랫폼에서 작동하지 않을 수 있습니다.';

  @override
  String get experimentalVideoCalls => '실험적인 영상 통화';

  @override
  String get emailOrUsername => '이메일이나 유저 이름';

  @override
  String get indexedDbErrorTitle => '사생활 보호 모드의 문제';

  @override
  String get indexedDbErrorLong =>
      '메시지 저장은 기본적으로 사생활 보호 모드에서 사용할 수 없습니다.\n- about:config 로 이동\n- dom.indexedDB.privateBrowsing.enabled 를 true로 설정\n그렇지 않으면 REChain을 실행할 수 없습니다.';

  @override
  String switchToAccount(String number) {
    return '계정 $number로 전환';
  }

  @override
  String get nextAccount => '다음 계정';

  @override
  String get previousAccount => '이전 계정';

  @override
  String get addWidget => '위젯 추가';

  @override
  String get widgetVideo => '영상';

  @override
  String get widgetEtherpad => '텍스트 메모';

  @override
  String get widgetJitsi => 'Jitsi Meet';

  @override
  String get widgetCustom => '사용자 정의';

  @override
  String get widgetName => '이름';

  @override
  String get widgetUrlError => '유효한 URL이 아닙니다.';

  @override
  String get widgetNameError => '표시 이름을 입력하세요.';

  @override
  String get errorAddingWidget => '위젯 추가중 오류 발생.';

  @override
  String get youRejectedTheInvitation => '초대를 거부했습니다';

  @override
  String get youJoinedTheChat => '채팅에 참가하였습니다';

  @override
  String get youAcceptedTheInvitation => '👍 초대를 수락했습니다';

  @override
  String youBannedUser(String user) {
    return '$user님을 영구 추방함';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return '$user님에 대한 초대를 철회함';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 링크를 통해 초대되셨습니다:\n$alias';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 $user님에 의해 초대되었습니다';
  }

  @override
  String invitedBy(String user) {
    return '📩 $user님이 나를 초대함';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 $user님을 초대했습니다';
  }

  @override
  String youKicked(String user) {
    return '👞 $user님을 추방했습니다';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 $user님을 영구 추방했습니다';
  }

  @override
  String youUnbannedUser(String user) {
    return '$user님의 영구 추방을 해제했습니다';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user님이 참가를 요청했습니다';
  }

  @override
  String get usersMustKnock => '유저들이 참가를 허가받아야함';

  @override
  String get noOneCanJoin => '아무도 참가할 수 없음';

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user님이 참가를 희망합니다.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet => '공개 링크가 아직 생성되지 않았음';

  @override
  String get knock => '참가 요청';

  @override
  String get users => '유저';

  @override
  String get unlockOldMessages => '오래된 메시지 잠금 해제하기';

  @override
  String get storeInSecureStorageDescription => '이 기기의 보안 스토리지에 복구키를 저장합니다.';

  @override
  String get saveKeyManuallyDescription => '공유나 클립보드를 이용해 수동으로 키를 저장합니다.';

  @override
  String get storeInAndroidKeystore => 'Android KeyStore에 저장하기';

  @override
  String get storeInAppleKeyChain => 'Apple KeyChain에 저장하기';

  @override
  String get storeSecurlyOnThisDevice => '이 기기에 안전하게 저장';

  @override
  String countFiles(int count) {
    return '$count개의 파일';
  }

  @override
  String get user => '유저';

  @override
  String get custom => '커스텀';

  @override
  String get foregroundServiceRunning => '이 알림은 백그라운드 서비스가 실행중일때 표시됩니다.';

  @override
  String get screenSharingTitle => '화면 공유';

  @override
  String get screenSharingDetail => 'REChain에 당신의 화면을 공유하는중';

  @override
  String get callingPermissions => '통화 권한';

  @override
  String get callingAccount => '통화 계정';

  @override
  String get callingAccountDetails => 'REChain이 android 전화앱을 사용 할 수 있도록 허가.';

  @override
  String get appearOnTop => '상단에 표시';

  @override
  String get appearOnTopDetails =>
      '앱이 상단에 표시되도록 허용 (이미 REChain을 통화 계정으로 설정한 경우에는 필요하지 않음)';

  @override
  String get otherCallingPermissions => '마이크, 카메라 그리고 다름 REChain 권한';

  @override
  String get whyIsThisMessageEncrypted => '왜 이 메시지를 읽을 수 없나요?';

  @override
  String get noKeyForThisMessage =>
      '이것은 이 메시지가 당신이 이 기기를 서명하기 전에 발송되었기 때문에 일어났을 수 있습니다.\n\n이것은 또한 발송자가 당신의 기기를 차단하였거나 혹은 인터넷 연결이 잘못되었을 수 있습니다.\n\n다른 세션에서 이 메시지를 읽을 수 있나요? 그렇다면 그 메시지를 옮길 수 있습니다! 설정 > 기기로 가서 기기를 서로 증명하세요. 다음번에 방을 열었을 때 두 세션이 모두 작동중이라면, 키가 자동으로 옮겨질것입니다.\n\n로그아웃하거나 기기를 바꿀 때 키를 잃고싶지 않으신가요? 설정에서 채팅 백업을 사용중인지 확인하세요.';

  @override
  String get newGroup => '새 그룹 채팅';

  @override
  String get newSpace => '새 스페이스';

  @override
  String get enterSpace => '스페이스에 입장';

  @override
  String get enterRoom => '방에 입장';

  @override
  String get allSpaces => '모든 스페이스';

  @override
  String numChats(String number) {
    return '$number개의 채팅';
  }

  @override
  String get hideUnimportantStateEvents => '중요하지 않은 상태 이벤트 숨기기';

  @override
  String get hidePresences => '상태 목록을 숨길까요?';

  @override
  String get doNotShowAgain => '다시 보지 않기';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return '빈 채팅 (전 $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      '스페이스를 사용하면 채팅을 통합하고 비공개 또는 공개 커뮤니티를 구축할 수 있습니다.';

  @override
  String get encryptThisChat => '이 채팅을 암호화';

  @override
  String get disableEncryptionWarning =>
      '보안상의 이유로 암호화가 활성화된 채팅에서 암호화를 비활성화 할 수 없습니다.';

  @override
  String get sorryThatsNotPossible => '죄송합니다...그것은 불가능합니다';

  @override
  String get deviceKeys => '기기 키:';

  @override
  String get reopenChat => '채팅 다시 열기';

  @override
  String get noBackupWarning =>
      '경고! 채팅 백업을 켜지 않을경우, 당신은 암호화된 메시지에 대한 접근권한을 잃을것 입니다. 로그아웃 하기 전에 채팅을 백업하는것이 강력히 권장됩니다.';

  @override
  String get noOtherDevicesFound => '다른 기기 발견되지 않음';

  @override
  String fileIsTooBigForServer(String max) {
    return '전송에 실패했습니다. 서버는 $max가 넘는 파일을 지원하지 않습니다.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return '$path에 파일 저장됨';
  }

  @override
  String get jumpToLastReadMessage => '마지막으로 읽은 메시지로 이동';

  @override
  String get readUpToHere => '여기까지 읽음';

  @override
  String get jump => '점프';

  @override
  String get openLinkInBrowser => '브라우저에서 링크 열기';

  @override
  String get reportErrorDescription =>
      '😭 이런. 무언가 잘못되었습니다. 원한다면, 개발자에게 버그를 신고할 수 있습니다.';

  @override
  String get report => '신고';

  @override
  String get signInWithPassword => '비밀번호로 로그인';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer =>
      '나중에 다시 시도하거나 다른 서버를 선택하십시오.';

  @override
  String signInWith(String provider) {
    return '$provider로 로그인';
  }

  @override
  String get profileNotFound =>
      '유저를 서버에서 찾을 수 있습니다. 연결 문제가 있거나 유저가 존재하지 않을 수 있습니다.';

  @override
  String get setTheme => '테마 설정:';

  @override
  String get setColorTheme => '색상 테마 설정:';

  @override
  String get invite => '초대';

  @override
  String get inviteGroupChat => '📨 그룹 채팅에 초대';

  @override
  String get invitePrivateChat => '📨 비공개 채팅에 초대';

  @override
  String get invalidInput => '잘못된 입력!';

  @override
  String wrongPinEntered(int seconds) {
    return '잘못된 pin입니다! $seconds초 후에 다시 시도하세요...';
  }

  @override
  String get pleaseEnterANumber => '0보다 큰 숫자를 입력하세요';

  @override
  String get archiveRoomDescription =>
      '채팅이 보관함으로 이동합니다. 다른 유저들은 당신이 떠난다는것을 볼 수 있습니다.';

  @override
  String get roomUpgradeDescription =>
      '채팅이 새로운 방 버전으로 다시 생성됩니다. 모든 참가자는 새로운 채팅으로 전환해야합니다. https://spec.online.rechain.network/latest/rooms/ 에서 방 버전에 대해 자세히 알아볼 수 있습니다.';

  @override
  String get removeDevicesDescription => '이 기기에서 로그아웃되며 더 이상 메시지를 받을 수 없습니다.';

  @override
  String get banUserDescription =>
      '유저는 채팅에서 영구 추방되며 추방 해제 전까지 채팅을 다시 입력할 수 없습니다.';

  @override
  String get unbanUserDescription => '유저가 다시 채팅을 입력할 수 있습니다.';

  @override
  String get kickUserDescription =>
      '유저는 채팅에서 추방되지만 영구 추방되지 않습니다. 공개 채팅의 경우, 언제든 유저가 다시 참가할 수 있습니다.';

  @override
  String get makeAdminDescription =>
      '유저를 한 번 관리자로 만들면, 당신과 같은 권한을 가지기때문에 권한 회수가 불가능합니다.';

  @override
  String get pushNotificationsNotAvailable => '푸시 알림 사용 불가';

  @override
  String get learnMore => '더 알아보기';

  @override
  String get yourGlobalUserIdIs => '글로벌 유저 ID: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return '안타깝게도 \"$query\"로 유저를 찾을 수 없습니다. 오타가 없는지 확인하십시오.';
  }

  @override
  String get knocking => '참가 요청중';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return '채팅은 $server 에서 검색하여 찾을 수 있습니다.';
  }

  @override
  String get searchChatsRooms => '#chats, @users 검색...';

  @override
  String get nothingFound => '아무것도 찾지 못했습니다...';

  @override
  String get groupName => '그룹 채팅 이름';

  @override
  String get createGroupAndInviteUsers => '그룹 채팅을 생성하고 유저를 초대';

  @override
  String get groupCanBeFoundViaSearch => '검색으로 그룹 채팅을 찾을 수 있음';

  @override
  String get wrongRecoveryKey => '죄송합니다... 올바른 복구키가 아닌것 같습니다.';

  @override
  String get startConversation => '대화 시작';

  @override
  String get commandHint_sendraw => 'raw json 전송';

  @override
  String get databaseMigrationTitle => '데이터베이스가 최적화됨';

  @override
  String get databaseMigrationBody => '잠시만 기다리세요. 시간이 걸릴 수 있습니다.';

  @override
  String get leaveEmptyToClearStatus => '비워서 상태를 지우세요.';

  @override
  String get select => '선택';

  @override
  String get searchForUsers => '@users 검색...';

  @override
  String get pleaseEnterYourCurrentPassword => '현재 비밀번호 입력';

  @override
  String get newPassword => '새 비밀번호';

  @override
  String get pleaseChooseAStrongPassword => '강력한 비밀번호를 사용하세요';

  @override
  String get passwordsDoNotMatch => '비밀번호가 일치하지 않습니다';

  @override
  String get passwordIsWrong => '비밀번호가 틀립니다';

  @override
  String get publicLink => '공개 링크';

  @override
  String get publicChatAddresses => '공개 채팅 주소';

  @override
  String get createNewAddress => '새 주소 만들기';

  @override
  String get joinSpace => '스페이스 참가';

  @override
  String get publicSpaces => '공개 스페이스들';

  @override
  String get addChatOrSubSpace => '채팅 또는 하위 스페이스 추가';

  @override
  String get subspace => '하위 스페이스';

  @override
  String get decline => '거절';

  @override
  String get thisDevice => '이 기기:';

  @override
  String get initAppError => '앱 초기화중 오류 발생';

  @override
  String get userRole => '유저 역할';

  @override
  String minimumPowerLevel(String level) {
    return '$level은 최소 권한 레벨입니다.';
  }

  @override
  String searchIn(String chat) {
    return '$chat에서 검색...';
  }

  @override
  String get searchMore => '더 검색...';

  @override
  String get gallery => '갤러리';

  @override
  String get files => '파일';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return 'SQlite 데이터베이스를 구축할 수 없습니다. 현재 레거시 데이터베이스 사용을 시도중입니다. $url 에서 개발자에게 오류를 신고하세요. 오류 메시지는 다음과 같습니다: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return '세션을 잃었습니다. $url 에서 개발자에게 오류를 신고하세요. 오류 메시지는 다음과 같습니다: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return '앱이 백업에서 세션을 복원하려 시도중입니다. $url 에서 개발자에게 오류를 신고하세요. 오류 메시지는 다음과 같습니다: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return '$roomName에 메시지를 전달할까요?';
  }

  @override
  String get sendReadReceipts => '읽음 확인 보내기';

  @override
  String get sendTypingNotificationsDescription =>
      '채팅의 다른 참가자들이 당신이 새 메시지를 입력중인것을 볼 수 있습니다.';

  @override
  String get sendReadReceiptsDescription =>
      '채팅의 다른 참가자들이 당신이 메시지를 읽었는지 볼 수 있습니다.';

  @override
  String get formattedMessages => '형식이 지정된 메시지';

  @override
  String get formattedMessagesDescription => '마크다운을 이용한 볼드등의 서식이 있는 메시지를 봅니다.';

  @override
  String get verifyOtherUser => '🔐 다른 유저 확인';

  @override
  String get verifyOtherUserDescription =>
      '다른 유저를 확인하면, 당신은 당신이 누구에게 말하고있는지 알 수 있습니다. 💪\n\n확인을 시작할 때, 다른 유저는 앱에서 팝업을 볼 수 있습니다. 당신은 그런 다음 서로 비교해야 이모지 또는 숫자의 목록을 볼 수 있습니다.\n\n이 작업을 수행하는 가장 좋은 방법은 직접 만나거나 영상통화를 하는것입니다. 👭';

  @override
  String get verifyOtherDevice => '🔐 다른 기기를 확인';

  @override
  String get verifyOtherDeviceDescription =>
      '다른 장치를 확인하면, 장치와 키를 교환하고, 전반적인 보안을 증가시킵니다. 💪 확인을 시작하면 팝업은 두 장치에 나타납니다. 그런 다음 서로 비교해야 이모지 또는 숫자의 목록를 볼 수 있습니다. 확인을 시작하기 전에 모든 장치를 준비하세요. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender가 키 검증을 수락함';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender가 키 검증을 취소함';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender가 키 검증을 완료함';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender가 키 검증 준비를 완료함';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender가 키 검증을 요청함';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender가 키 검증을 시작함';
  }

  @override
  String get transparent => '투명';

  @override
  String get incomingMessages => '메시지 수신함';

  @override
  String get stickers => '스티커';

  @override
  String get discover => '탐색';

  @override
  String get commandHint_ignore => '주어진 REChain ID를 무시';

  @override
  String get commandHint_unignore => '주어진 REChain ID 무시 해제';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread개의 읽지 않은 채팅';
  }

  @override
  String get noDatabaseEncryption => '데이터베이스 암호화는 이 플랫폼에서 지원되지 않음';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return '$count명의 차단된 유저가 있습니다.';
  }

  @override
  String get restricted => '스페이스 멤버로 제한';

  @override
  String get knockRestricted => '스페이스 멤버만 참가 요청 가능';

  @override
  String goToSpace(Object space) {
    return '스페이스로: $space';
  }

  @override
  String get markAsUnread => '읽지 않음으로 표시';

  @override
  String userLevel(int level) {
    return '$level - 유저';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - 관리자';
  }

  @override
  String adminLevel(int level) {
    return '$level - 운영자';
  }

  @override
  String get changeGeneralChatSettings => '일반 채팅 설정 번경하기';

  @override
  String get inviteOtherUsers => '다른 사용자를 이 채팅에 초대하기';

  @override
  String get changeTheChatPermissions => '채팅 권한 바꾸기';

  @override
  String get changeTheVisibilityOfChatHistory => '채팅 기록 표시 여부 바꾸기';

  @override
  String get changeTheCanonicalRoomAlias => '메인 공개 채팅 주소 바꾸기';

  @override
  String get sendRoomNotifications => '@room 알림 보내기';

  @override
  String get changeTheDescriptionOfTheGroup => '채팅 설명 바꾸기';

  @override
  String get chatPermissionsDescription =>
      '이 채팅에서 특정 작업에 요구할 권한 레벨을 정의합니다. 권한 레벨 0, 50, 100은 일반적으로 유저, 관리자, 운영자를 나타내지만, 모든 숫자가 가능합니다.';

  @override
  String updateInstalled(String version) {
    return '🎉 $version 업데이트가 설치되었습니다!';
  }

  @override
  String get changelog => '변경 기록';

  @override
  String get sendCanceled => '전송 최소됨';

  @override
  String get loginWithREChainId => 'REChain ID로 로그인';

  @override
  String get discoverHomeservers => '홈서버 찾아보기';

  @override
  String get whatIsAHomeserver => '홈서버가 무엇인가요?';

  @override
  String get homeserverDescription =>
      '당신의 모든 데이터는 이메일과 흡사하게 당신의 홈서버에 저장됩니다. 당신이 소통하고 싶은 사람들과 다른 서버를 사용해도 무관하니 당신이 원하는 홈서버를 선택해도 됩니다. https://online.rechain.network에서 자세히 알아보세요.';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      '호환되는 홈서버가 아닌 것 같습니다. URL을 올바르게 입력됐나요?';

  @override
  String get calculatingFileSize => '파일 크기 계산 중...';

  @override
  String get prepareSendingAttachment => '첨부된 파일 전송 준비 중...';

  @override
  String get sendingAttachment => '첨부된 파일 전송 중...';

  @override
  String get generatingVideoThumbnail => '영상 썸네일 만드는 중...';

  @override
  String get compressVideo => '영상 압축 중...';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return '첨부파일 $length개중 $index번째 전송 중...';
  }

  @override
  String serverLimitReached(int seconds) {
    return '서버 한도에 도달했습니다! $seconds초 기다리는 중...';
  }

  @override
  String get oneOfYourDevicesIsNotVerified => '당신의 기기 중 하나가 인증되지 않았음';

  @override
  String get noticeChatBackupDeviceVerification =>
      '참고: 모든 기기에 채팅 백업을 설정하면 자동으로 서로 인증됩니다.';

  @override
  String get continueText => '계속하기';

  @override
  String get welcomeText =>
      '안녕하세요 👋 REChain이에요. 당신은 htpps://online.rechain.network와 호환되는 모든 홈서버를 사용할 수 있어요. 그리고 모두와 대화해보세요. 거대한 분산 대화망이니까요!';

  @override
  String get blur => '블러:';

  @override
  String get opacity => '불투명:';

  @override
  String get setWallpaper => '배경화면 설정하기';

  @override
  String get manageAccount => '계정 관리하기';

  @override
  String get noContactInformationProvided => '서버가 유효한 연락처 정보를 제공하지 않음';

  @override
  String get contactServerAdmin => '서버 관리자에게 연락하기';

  @override
  String get contactServerSecurity => '서버 보안 관리자에게 연락하기';

  @override
  String get supportPage => '지원 페이지';

  @override
  String get serverInformation => '서버 정보:';

  @override
  String get name => '이름';

  @override
  String get version => '버전';

  @override
  String get website => '웹사이트';

  @override
  String get compress => '압축';

  @override
  String get boldText => '두꺼운 글꼴';

  @override
  String get italicText => '기울어진 글꼴';

  @override
  String get strikeThrough => '취소선';

  @override
  String get pleaseFillOut => '작성해주세요';

  @override
  String get invalidUrl => '유효하지 않은 url';

  @override
  String get addLink => '링크 추가';

  @override
  String get unableToJoinChat => '채팅에 참가할 수 없습니다. 다른 구성원이 이미 대화를 종료했을 수 있습니다.';

  @override
  String get previous => '이전';

  @override
  String get otherPartyNotLoggedIn => '다른 구성원이 현재 로그인하지 않아 메시지를 수신하지 못합니다!';

  @override
  String appWantsToUseForLogin(String server) {
    return '\'$server\'로 로그인';
  }

  @override
  String get appWantsToUseForLoginDescription => '웹사이트와 당신에 대한 정보를 공유하게됩니다.';

  @override
  String get open => '열기';

  @override
  String get waitingForServer => '서버를 기다리는중...';

  @override
  String get appIntroduction =>
      'REChain는 다른 메신저들을 사용하는 친구들과도 채팅할 수 있습니다. https://online.rechain.network에 방문하거나 *계속*을 눌러 자세한 정보를 확인하세요.';

  @override
  String get newChatRequest => '📩 새 채팅 요청';

  @override
  String get contentNotificationSettings => '콘텐츠 알림 설정';

  @override
  String get generalNotificationSettings => '일반 알림 설정';

  @override
  String get roomNotificationSettings => '채팅방 알림 설정';

  @override
  String get userSpecificNotificationSettings =>
      'User specific notification settings';

  @override
  String get otherNotificationSettings => '기타 알림 설정';

  @override
  String get notificationRuleContainsUserName => '유저 이름을 포함함';

  @override
  String get notificationRuleContainsUserNameDescription =>
      '메시지가 유저의 이름을 포함할때 알림합니다.';

  @override
  String get notificationRuleMaster => '모든 알림 음소거';

  @override
  String get notificationRuleMasterDescription => '모든 규칙을 무시하고 모든 알림을 비활성화합니다.';

  @override
  String get notificationRuleSuppressNotices => '자동화된 메시지 무시';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      '봇을 비롯한 자동화된 메시지로부터 발생하는 알림을 무시합니다.';

  @override
  String get notificationRuleInviteForMe => '초대를 받음';

  @override
  String get notificationRuleInviteForMeDescription => '채팅방에 초대받았을 때 알림합니다.';

  @override
  String get notificationRuleMemberEvent => '멤버 이벤트';

  @override
  String get notificationRuleMemberEventDescription =>
      '멤버 이벤트로 발생하는 알림을 무시합니다.';

  @override
  String get notificationRuleIsUserMention => '유저가 멘션됨';

  @override
  String get notificationRuleIsUserMentionDescription =>
      '유저가 메시지에 멘션됐을 때 알림합니다.';

  @override
  String get notificationRuleContainsDisplayName => '표시 이름을 포함함';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      '메시지에 표시 이름이 포함되면 알림합니다.';

  @override
  String get notificationRuleIsRoomMention => '방 멘션';

  @override
  String get notificationRuleIsRoomMentionDescription => '방 멘션이 있을경우 알림합니다.';

  @override
  String get notificationRuleRoomnotif => '방 알림';

  @override
  String get notificationRuleRoomnotifDescription =>
      '메시지가 \'@room\'을 포함하면 알림합니다.';

  @override
  String get notificationRuleTombstone => '비활성화';

  @override
  String get notificationRuleTombstoneDescription => '채팅방 비활성화 메시지를 알림합니다.';

  @override
  String get notificationRuleReaction => '반응';

  @override
  String get notificationRuleReactionDescription => '반응으로 발생하는 알림을 무시합니다.';

  @override
  String get notificationRuleRoomServerAcl => '채팅방 서버 ACL';

  @override
  String get notificationRuleRoomServerAclDescription =>
      '채팅방 서버의 접근 권한(ACL)으로부터 오는 알림을 무시합니다.';

  @override
  String get notificationRuleSuppressEdits => '수정 음소거';

  @override
  String get notificationRuleSuppressEditsDescription =>
      '수정된 메시지로부터 오는 알림을 무시합니다.';

  @override
  String get notificationRuleCall => '전화';

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
  String get declineInvitation => 'Decline invitation';
}
