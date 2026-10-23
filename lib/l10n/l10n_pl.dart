// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class L10nPl extends L10n {
  L10nPl([String locale = 'pl']) : super(locale);

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
  String get repeatPassword => 'Powtórz hasło';

  @override
  String get notAnImage => 'To nie jest plik obrazu.';

  @override
  String get remove => 'Usuń';

  @override
  String get importNow => 'Zaimportuj';

  @override
  String get importEmojis => 'Zaimportuj emotikony';

  @override
  String get importFromZipFile => 'Zaimportuj z pliku .zip';

  @override
  String get exportEmotePack => 'Eksportuj pakiet emotikonów jako .zip';

  @override
  String get replace => 'Zastąp';

  @override
  String get about => 'O aplikacji';

  @override
  String aboutHomeserver(String homeserver) {
    return 'O $homeserver';
  }

  @override
  String get accept => 'Akceptuj';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username zaakceptował/-a zaproszenie';
  }

  @override
  String get account => 'Konto';

  @override
  String get accountsAndSettings => 'Accounts and settings';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username aktywował/-a szyfrowanie od końca do końca';
  }

  @override
  String get addEmail => 'Dodaj adres email';

  @override
  String get confirmREChainId =>
      'Please confirm your REChain ID in order to delete your account.';

  @override
  String supposedMxid(String mxid) {
    return 'To powinno być $mxid';
  }

  @override
  String get addToSpace => 'Dodaj do przestrzeni';

  @override
  String get admin => 'Administrator';

  @override
  String get alias => 'alias';

  @override
  String get all => 'Wszystkie';

  @override
  String get commandHint_roomupgrade =>
      'Zaktualizuj ten pokój do podanej wersji';

  @override
  String get commandHint_googly => 'Wyślij kręcące się oczka';

  @override
  String get commandHint_cuddle => 'Wyślij przytulenie';

  @override
  String get commandHint_hug => 'Wyślij uścisk';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName wysyła ci kręcące się oczka';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName przytula cię';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName uściska cię';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName odebrał/-a połączenie';
  }

  @override
  String get anyoneCanJoin => 'Każdy może dołączyć';

  @override
  String get appLock => 'Blokada aplikacji';

  @override
  String get appLockDescription =>
      'Zablokuj aplikację pinem kiedy nie jest używana';

  @override
  String get archive => 'Archiwum';

  @override
  String get areGuestsAllowedToJoin => 'Czy użytkownicy-goście mogą dołączyć';

  @override
  String get areYouSure => 'Czy na pewno?';

  @override
  String get discardEdits => 'You have unsaved changes. Discard your edits?';

  @override
  String get areYouSureYouWantToLogout => 'Czy na pewno chcesz się wylogować?';

  @override
  String get askSSSSSign =>
      'Aby zalogować inną osobę, proszę wpisać hasło przechowywania lub klucz odzyskiwania.';

  @override
  String askVerificationRequest(String username) {
    return 'Zaakceptować tą prośbę weryfikacji od $username?';
  }

  @override
  String get autoplayImages =>
      'Automatycznie odtwarzaj animowane naklejki i emotikony';

  @override
  String badServerLoginTypesException(
    String serverVersions,
    String supportedVersions,
    Object suportedVersions,
  ) {
    return 'Serwer obsługuje typy logowania:\n$serverVersions\nAle ta aplikacja obsługuje tylko:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'Wysyłaj powiadomienie o pisaniu';

  @override
  String get swipeRightToLeftToReply => 'Przeciągnij w lewo, by odpowiedzieć';

  @override
  String get sendOnEnter => 'Wyślij enterem';

  @override
  String get noMoreChatsFound => 'Nie znaleziono więcej czatów...';

  @override
  String get noChatsFoundHere =>
      'Nie jeszcze ma żadnych czatów. Wciśnij poniższy przycisk, aby rozpocząć nowy czat. ⤵️';

  @override
  String get unread => 'Nieprzeczytane';

  @override
  String get space => 'Przestrzeń';

  @override
  String get banFromChat => 'Ban w czacie';

  @override
  String get banned => 'Zbanowany/-a';

  @override
  String bannedUser(String username, String targetName) {
    return '$username zbanował/-a $targetName';
  }

  @override
  String get blockDevice => 'Zablokuj urządzenie';

  @override
  String get blocked => 'Zablokowane';

  @override
  String get cancel => 'Anuluj';

  @override
  String cantOpenUri(String uri) {
    return 'Nie można otworzyć linku $uri';
  }

  @override
  String get changeDeviceName => 'Zmień nazwę urządzenia';

  @override
  String changedTheChatAvatar(String username) {
    return '$username zmienił/-a zdjęcie profilowe';
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
    return '$username zmienił/-a uprawnienia w czacie';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username zmienił/-a swoją nazwę wyświetlaną na \'$displayname\'';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username zmienił/-a zasady dostępu dla gości';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username zmienił/-a zasady dostępu dla gości na $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username zmienił/-a widoczność historii';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username zmienił/-a widoczność historii na $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username zmienił/-a zasady wejścia';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username zmienił/-a zasady wejścia na $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username zmienił/-a zdjęcie profilowe';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username zmienił/-a alias pokoju';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username zmienił/-a link z zaproszeniem do pokoju';
  }

  @override
  String get changePassword => 'Zmień hasło';

  @override
  String get changeTheHomeserver => 'Zmień serwer domyślny';

  @override
  String get changeTheme => 'Zmień swój styl';

  @override
  String get changeTheNameOfTheGroup => 'Zmień nazwę grupy';

  @override
  String get changeYourAvatar => 'Zmień swoje zdjęcie';

  @override
  String get channelCorruptedDecryptError => 'Szyfrowanie zostało uszkodzone';

  @override
  String get chat => 'Czat';

  @override
  String get chatBackup => 'Kopia zapasowa czatów';

  @override
  String get chatDetails => 'Szczegóły czatu';

  @override
  String get chats => 'Czaty';

  @override
  String get chooseAStrongPassword => 'Wybierz silne hasło';

  @override
  String get clearArchive => 'Wyczyść archiwum';

  @override
  String get close => 'Zamknij';

  @override
  String get commandHint_markasdm =>
      'Oznacz jako pokój wiadomości bezpośrednich dla podanego REChain ID';

  @override
  String get commandHint_markasgroup => 'Oznacz jako grupę';

  @override
  String get commandHint_ban => 'Zbanuj użytkownika w tym pokoju';

  @override
  String get commandHint_clearcache => 'Wyczyść pamięć podręczną';

  @override
  String get commandHint_create =>
      'Stwórz pusty czat\nUżyj --no-encryption by wyłączyć szyfrowanie';

  @override
  String get commandHint_discardsession => 'Odrzuć sesję';

  @override
  String get commandHint_dm =>
      'Rozpocznij czat bezpośredni\nUżyj --no-encryption by wyłączyć szyfrowanie';

  @override
  String get commandHint_html => 'Wyślij tekst sformatowany w HTML';

  @override
  String get commandHint_invite => 'Zaproś użytkownika do pokoju';

  @override
  String get commandHint_join => 'Dołącz do podanego pokoju';

  @override
  String get commandHint_kick => 'Usuń tego użytkownika z tego pokoju';

  @override
  String get commandHint_leave => 'Opuść ten pokój';

  @override
  String get commandHint_me => 'Opisz siebie';

  @override
  String get commandHint_myroomavatar =>
      'Ustaw swoje zdjęcie w tym pokoju (przez mxc-uri)';

  @override
  String get commandHint_myroomnick =>
      'Ustaw swoją nazwę wyświetlaną w tym pokoju';

  @override
  String get commandHint_op =>
      'Ustaw poziom uprawnień tego użytkownika (domyślnie: 50)';

  @override
  String get commandHint_plain => 'Wyślij niesformatowany tekst';

  @override
  String get commandHint_react => 'Wyślij odpowiedź jako reakcję';

  @override
  String get commandHint_send => 'Wyślij wiadomość';

  @override
  String get commandHint_unban => 'Odbanuj użytkownika w tym pokoju';

  @override
  String get commandInvalid => 'Nieprawidłowe polecenie';

  @override
  String commandMissing(String command) {
    return '$command nie jest poleceniem.';
  }

  @override
  String get compareEmojiMatch => 'Porównaj emoji';

  @override
  String get compareNumbersMatch => 'Porównaj cyfry';

  @override
  String get configureChat => 'Konfiguruj czat';

  @override
  String get contactHasBeenInvitedToTheGroup =>
      'Kontakt został zaproszony do grupy';

  @override
  String get contentHasBeenReported =>
      'Treść została zgłoszona administratorom serwera';

  @override
  String get copiedToClipboard => 'Skopiowano do schowka';

  @override
  String get copy => 'Kopiuj';

  @override
  String get copyToClipboard => 'Skopiuj do schowka';

  @override
  String couldNotDecryptMessage(String error) {
    return 'Nie można odszyfrować wiadomości: $error';
  }

  @override
  String get checkList => 'Lista kontrolna';

  @override
  String countParticipants(int count) {
    return '$count uczestników';
  }

  @override
  String countInvited(int count) {
    return '$count zaproszonych';
  }

  @override
  String get create => 'Stwórz';

  @override
  String createdTheChat(String username) {
    return '💬 $username utworzył/-a czat';
  }

  @override
  String get createGroup => 'Utwórz grupę';

  @override
  String get createNewSpace => 'Nowa przestrzeń';

  @override
  String get currentlyActive => 'Obecnie aktywny/-a';

  @override
  String get darkTheme => 'Ciemny';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date $timeOfDay';
  }

  @override
  String get deactivateAccountWarning =>
      'To zdezaktywuje twoje konto. To jest nieodwracalne! Na pewno chcesz to zrobić?';

  @override
  String get defaultPermissionLevel =>
      'Domyślny poziom uprawnień dla nowych użytkowników';

  @override
  String get delete => 'Usuń';

  @override
  String get deleteAccount => 'Usuń konto';

  @override
  String get deleteMessage => 'Usuń wiadomość';

  @override
  String get devices => 'Urządzenia';

  @override
  String get directChats => 'Czaty bezpośrednie';

  @override
  String get displaynameHasBeenChanged => 'Nazwa wyświetlana została zmieniona';

  @override
  String get downloadFile => 'Pobierz plik';

  @override
  String get edit => 'Edytuj';

  @override
  String get editBlockedServers => 'Edytuj zablokowane serwery';

  @override
  String get chatPermissions => 'Uprawnienia w czacie';

  @override
  String get editDisplayname => 'Edytuj nazwę wyświetlaną';

  @override
  String get editRoomAliases => 'Zmień aliasy pokoju';

  @override
  String get editRoomAvatar => 'Edytuj zdjęcie pokoju';

  @override
  String get emoteExists => 'Emotikon już istnieje!';

  @override
  String get emoteInvalid => 'Nieprawidłowy kod emotikonu!';

  @override
  String get emoteKeyboardNoRecents =>
      'Tutaj pojawiają się ostatnio używane emotikony...';

  @override
  String get globalChatId => 'Globalny identyfikator czatu';

  @override
  String get accessAndVisibility => 'Dostęp i widoczność';

  @override
  String get accessAndVisibilityDescription =>
      'Kto może dołączyć do tego czatu i w jaki sposób można ten czat znaleźć.';

  @override
  String get customEmojisAndStickers => 'Własne emotikony i naklejki';

  @override
  String get customEmojisAndStickersBody =>
      'Dodaj lub podziel się własnymi emotikonami i naklejkami, które będą mogły być użyte w dowolnym czacie.';

  @override
  String get emoteShortcode => 'Skrócony kod emotikonu';

  @override
  String get emptyChat => 'Pusty czat';

  @override
  String get enableEmotesGlobally => 'Włącz paczkę emotikonów globalnie';

  @override
  String get enableEncryption => 'Włącz szyfowanie';

  @override
  String get enableEncryptionWarning =>
      'Nie będziesz już mógł wyłączyć szyfrowania. Jesteś pewny?';

  @override
  String get encrypted => 'Szyfrowane';

  @override
  String get encryption => 'Szyfrowanie';

  @override
  String get encryptionNotEnabled => 'Szyfrowanie nie jest włączone';

  @override
  String endedTheCall(String senderName) {
    return '$senderName zakończył/-a połączenie';
  }

  @override
  String get enterAnEmailAddress => 'Wpisz adres e-mail';

  @override
  String errorObtainingLocation(String error) {
    return 'Błąd w ustalaniu lokalizacji: $error';
  }

  @override
  String get fontSize => 'Rozmiar fontu';

  @override
  String get forward => 'Przekaż';

  @override
  String get fromJoining => 'Od dołączenia';

  @override
  String get fromTheInvitation => 'Od zaproszenia';

  @override
  String get group => 'Grupa';

  @override
  String get chatDescription => 'Opis czatu';

  @override
  String get chatDescriptionHasBeenChanged => 'Zmieniono opis czatu';

  @override
  String get groupIsPublic => 'Grupa jest publiczna';

  @override
  String get groups => 'Grupy';

  @override
  String groupWith(String displayname) {
    return 'Grupa z $displayname';
  }

  @override
  String get guestsAreForbidden => 'Goście są zakazani';

  @override
  String get guestsCanJoin => 'Goście mogą dołączyć';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username wycofał/-a zaproszenie dla $targetName';
  }

  @override
  String get help => 'Pomoc';

  @override
  String get hideRedactedMessages => 'Nie pokazuj usuniętych wiadomości';

  @override
  String get hideRedactedMessagesBody =>
      'Usunięte wiadomości nie będą widoczne w czacie.';

  @override
  String get hideInvalidOrUnknownMessageFormats =>
      'Ukryj niepoprawne lub nieznane typy wiadomości';

  @override
  String get block => 'Zablokuj';

  @override
  String get blockedUsers => 'Zablokowani użytkownicy';

  @override
  String get blockListDescription =>
      'Możesz zablokować uciążliwych użytkowników. Nie będziesz widzieć ani otrzymywać wiadomości oraz zaproszeń od nich.';

  @override
  String get blockUsername => 'Ignoruj użytkownika';

  @override
  String get iHaveClickedOnLink => 'Nacisnąłem na link';

  @override
  String get incorrectPassphraseOrKey =>
      'Złe hasło bezpieczeństwa lub klucz odzyskiwania';

  @override
  String get inviteContact => 'Zaproś kontakt';

  @override
  String inviteContactToGroup(String groupName) {
    return 'Zaproś kontakty do $groupName';
  }

  @override
  String get noChatDescriptionYet => 'Nie utworzono jeszcze opisu czatu.';

  @override
  String get tryAgain => 'Spróbuj ponownie';

  @override
  String get invalidServerName => 'Nieprawidłowa nazwa serwera';

  @override
  String get invited => 'Zaproszono';

  @override
  String get redactMessageDescription =>
      'Wiadomość zostanie usunięta u wszystkich uczestników tej rozmowy. Tego nie można cofnąć.';

  @override
  String get optionalRedactReason =>
      '(Opcjonalnie) Powód usunięcia tej wiadomości...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username zaprosił/-a $targetName';
  }

  @override
  String get invitedUsersOnly => 'Tylko zaproszeni użytkownicy';

  @override
  String inviteText(String username, String link) {
    return '$username zaprosił/-a Cię do REChain.\n1. Odwiedź github.com/sorydima/REChain- i zainstaluj aplikację\n2. Zarejestuj się lub zaloguj\n3. Otwórz link zaproszenia:\n$link';
  }

  @override
  String get isTyping => 'pisze…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username dołączył/-a do czatu';
  }

  @override
  String get joinRoom => 'Dołącz do pokoju';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username wyrzucił/-a $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username wyrzucił/-a i zbanował/-a $targetName';
  }

  @override
  String get kickFromChat => 'Wyrzuć z czatu';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Ostatnio widziano $localizedTimeShort';
  }

  @override
  String get leave => 'Opuść';

  @override
  String get leftTheChat => 'Opuścił/-a czat';

  @override
  String get lightTheme => 'Jasny';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Załaduj jeszcze $count uczestników';
  }

  @override
  String get dehydrate => 'Eksportuj sesję i wymaż urządzenie';

  @override
  String get dehydrateWarning =>
      'Tego nie można cofnąć. Upewnij się, że plik kopii zapasowej jest bezpiecznie przechowywany.';

  @override
  String get hydrate => 'Przywracanie z pliku kopii zapasowej';

  @override
  String get loadingPleaseWait => 'Ładowanie… Proszę czekać.';

  @override
  String get loadMore => 'Załaduj więcej…';

  @override
  String get locationDisabledNotice =>
      'Usługi lokalizacji są wyłączone. Proszę włącz je aby móc udostępnić swoją lokalizację.';

  @override
  String get locationPermissionDeniedNotice =>
      'Brak uprawnień. Proszę zezwól aplikacji na dostęp do lokalizacji aby móc ją udostępnić.';

  @override
  String get login => 'Zaloguj się';

  @override
  String logInTo(String homeserver) {
    return 'Zaloguj się do $homeserver';
  }

  @override
  String get logout => 'Wyloguj się';

  @override
  String get mention => 'Wzmianka';

  @override
  String get messages => 'Wiadomości';

  @override
  String get messagesStyle => 'Wiadomości:';

  @override
  String get moderator => 'Moderator';

  @override
  String get muteChat => 'Wycisz czat';

  @override
  String get newChat => 'Nowa rozmowa';

  @override
  String get newMessageInrechainonline => '💬 Nowa wiadomość we REChain';

  @override
  String get newVerificationRequest => 'Nowa prośba o weryfikację!';

  @override
  String get next => 'Dalej';

  @override
  String get no => 'Nie';

  @override
  String get noConnectionToTheServer => 'Brak połączenia z serwerem';

  @override
  String get noEmotesFound => 'Nie znaleziono żadnych emotikonów. 😕';

  @override
  String get noEncryptionForPublicRooms =>
      'Możesz aktywować szyfrowanie dopiero kiedy pokój nie będzie publicznie dostępny.';

  @override
  String get noGoogleServicesWarning =>
      'Wygląda na to, że Twoje urządzenie nie obsługuje Firebase Cloud Messaging. Aby wciąż otrzymywać powiadomienia push, zalecamy istalację ntfy. Używając ntfy lub inengo zunifikowanego dostawcy powiadomień push, możesz bezpiecznie otrzymywać takowe powiadomienia. Ntfy można pobrać ze sklepu Google Play Store lub z F-Droid.';

  @override
  String norechainonlineServer(String server1, String server2) {
    return '$server1 nie jest serwerem Matriksa, czy chcesz zamiast niego użyć $server2?';
  }

  @override
  String get shareInviteLink => 'Udostępnij link z zaproszeniem';

  @override
  String get scanQrCode => 'Skanuj kod QR';

  @override
  String get noPasswordRecoveryDescription =>
      'Nie dodałeś/-aś jeszcze sposobu odzyskiwania swojego hasła.';

  @override
  String get noPermission => 'Brak uprawnień';

  @override
  String get noRoomsFound => 'Nie znaleziono pokojów…';

  @override
  String get notifications => 'Powiadomienia';

  @override
  String numUsersTyping(int count) {
    return '$count użytkowników pisze…';
  }

  @override
  String get obtainingLocation => 'Uzyskiwanie lokalizacji…';

  @override
  String get ok => 'Ok';

  @override
  String get onlineKeyBackupEnabled =>
      'Kopia zapasowa kluczy online jest włączona';

  @override
  String get oopsPushError =>
      'Ojej! Wystąpił błąd podczas ustawiania powiadomień push.';

  @override
  String get oopsSomethingWentWrong => 'Ojej! Coś poszło nie tak…';

  @override
  String get openAppToReadMessages => 'Otwórz aplikację by odczytać wiadomości';

  @override
  String get openCamera => 'Otwórz aparat';

  @override
  String get oneClientLoggedOut => 'Jedno z twoich urządzeń zostało wylogowane';

  @override
  String get addAccount => 'Dodaj konto';

  @override
  String get editBundlesForAccount => 'Edytuj pakiety dla tego konta';

  @override
  String get addToBundle => 'Dodaj do pakietu';

  @override
  String get removeFromBundle => 'Usuń z tego pakietu';

  @override
  String get bundleName => 'Nazwa pakietu';

  @override
  String get openInMaps => 'Otwórz w mapach';

  @override
  String get link => 'Link';

  @override
  String get or => 'Lub';

  @override
  String get participant => 'Uczestnik';

  @override
  String get passphraseOrKey => 'fraza dostępu lub klucz odzyskiwania';

  @override
  String get password => 'Hasło';

  @override
  String get passwordForgotten => 'Nie pamiętam hasła';

  @override
  String get passwordHasBeenChanged => 'Hasło zostało zmienione';

  @override
  String get passwordRecoverySettings => 'Ustawienia odzyskiwania hasła';

  @override
  String get passwordRecovery => 'Odzyskiwanie hasła';

  @override
  String get pin => 'Przypnij';

  @override
  String get pleaseChooseAPasscode => 'Wybierz kod dostępu';

  @override
  String get pleaseClickOnLink =>
      'Proszę kliknij w odnośnik wysłany w wiadomości e-mail, aby kontynuować.';

  @override
  String get pleaseEnterYourPassword => 'Wprowadź swoje hasło';

  @override
  String get pleaseEnterYourPin => 'Podaj swój PIN';

  @override
  String get pleaseEnterYourUsername => 'Wpisz swoją nazwę użytkownika';

  @override
  String get pleaseFollowInstructionsOnWeb =>
      'Wykonaj instrukcje na stronie internetowej i naciśnij „dalej”.';

  @override
  String get privacy => 'Prywatność';

  @override
  String get publicRooms => 'Publiczne pokoje';

  @override
  String get reason => 'Powód';

  @override
  String redactedBy(String username) {
    return 'Usunięte przez $username';
  }

  @override
  String redactedByBecause(String username, String reason) {
    return 'Usunięte przez $username z powodu „$reason”';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username usunął/-ęła zdarzenie';
  }

  @override
  String get redactMessage => 'Usuń wiadomość';

  @override
  String get reject => 'Odrzuć';

  @override
  String rejectedTheInvitation(String username) {
    return '$username odrzucił/-a zaproszenie';
  }

  @override
  String get removeAllOtherDevices => 'Usuń wszystkie inne urządzenia';

  @override
  String get unbanFromChat => 'Odbanuj w czacie';

  @override
  String get removeYourAvatar => 'Usuń swoje zdjęcie';

  @override
  String get replaceRoomWithNewerVersion => 'Zamień pokój na nowszą wersję';

  @override
  String get reply => 'Odpowiedz';

  @override
  String get reportMessage => 'Zgłoś wiadomość';

  @override
  String get roomHasBeenUpgraded => 'Pokój został zaktualizowany';

  @override
  String sendingFilesDoNotExit(int count) {
    return 'Sending $count files... Please do not exit!';
  }

  @override
  String get roomVersion => 'Wersja pokoju';

  @override
  String get compressingVideo => 'Compressing video...';

  @override
  String get saveFile => 'Zapisz plik';

  @override
  String get search => 'Szukaj';

  @override
  String get security => 'Bezpieczeństwo';

  @override
  String get send => 'Wyślij';

  @override
  String get sendAMessage => 'Wyślij wiadomość';

  @override
  String get sendAsText => 'Wyślij jako tekst';

  @override
  String get sendAudio => 'Wyślij dźwięk';

  @override
  String get sendFile => 'Wyślij plik';

  @override
  String get sendImage => 'Wyślij obraz';

  @override
  String sendImages(int count) {
    return 'Wyślij $count obrazów';
  }

  @override
  String get sendMessages => 'Wyślij wiadomości';

  @override
  String get sendVideo => 'Wyślij film';

  @override
  String sentAFile(String username) {
    return '📁 $username wysłał/-a plik';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username wysłał/-a plik dżwiękowy';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username wysłał/-a zdjęcie';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username wysłał/-a naklejkę';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username wysłał/-a film';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName wysłał/-a informacje o połączeniu';
  }

  @override
  String get setAsCanonicalAlias => 'Ustaw jako główny alias';

  @override
  String get setChatDescription => 'Ustaw opis czatu';

  @override
  String get setStatus => 'Ustaw status';

  @override
  String get settings => 'Ustawienia';

  @override
  String get share => 'Udostępnij';

  @override
  String sharedTheLocation(String username) {
    return '$username udostępnił/-a swoją lokalizację';
  }

  @override
  String get shareLocation => 'Udostępnij lokalizację';

  @override
  String get skip => 'Pomiń';

  @override
  String get sourceCode => 'Kod żródłowy';

  @override
  String get spaceIsPublic => 'Ustaw jako publiczną';

  @override
  String get spaceName => 'Nazwa przestrzeni';

  @override
  String startedACall(String senderName) {
    return '$senderName rozpoczął/-ęła rozmowę';
  }

  @override
  String get status => 'Status';

  @override
  String get statusExampleMessage => 'Jak się masz dziś?';

  @override
  String get submit => 'Odeślij';

  @override
  String get synchronizingPleaseWait => 'Synchronizowanie… Proszę czekać.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Synchronizowanie… ($percentage%)';
  }

  @override
  String get systemTheme => 'System';

  @override
  String get theyDontMatch => 'Nie zgadzają się';

  @override
  String get theyMatch => 'Zgadzają się';

  @override
  String get tooManyRequestsWarning =>
      'Zbyt wiele żądań. Proszę spróbować później.';

  @override
  String get tryToSendAgain => 'Spróbuj wysłać ponownie';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username odbanował/-a $targetName';
  }

  @override
  String get unblockDevice => 'Odblokuj urządzenie';

  @override
  String get unknownDevice => 'Nieznane urządzenie';

  @override
  String get unknownEncryptionAlgorithm => 'Nieznany algorytm szyfrowania';

  @override
  String unknownEvent(String type) {
    return 'Nieznane zdarzenie \'$type\'';
  }

  @override
  String get unmuteChat => 'Wyłącz wyciszenie';

  @override
  String get unpin => 'Odepnij';

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username oraz $count pozostałych pisze…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username i $username2 piszą…';
  }

  @override
  String userIsTyping(String username) {
    return '$username pisze…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username opuścił/-a czat';
  }

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username wysłał/-a zdarzenie $type';
  }

  @override
  String get unverified => 'Niezweryfikowane';

  @override
  String get verified => 'Zweryfikowane';

  @override
  String get verifyStart => 'Rozpocznij weryfikację';

  @override
  String get verifySuccess => 'Pomyślnie zweryfikowano!';

  @override
  String get verifyTitle => 'Weryfikowanie innego konta';

  @override
  String get visibilityOfTheChatHistory => 'Widoczność historii czatu';

  @override
  String get visibleForAllParticipants =>
      'Widoczny dla wszystkich użytkowników';

  @override
  String get visibleForEveryone => 'Widoczne dla każdego';

  @override
  String get voiceMessage => 'Wiadomość głosowa';

  @override
  String get waitingPartnerAcceptRequest =>
      'Oczekiwanie na zaakceptowanie prośby przez drugą osobę…';

  @override
  String get waitingPartnerEmoji =>
      'Oczekiwanie na zaakceptowanie emoji przez drugą osobę…';

  @override
  String get waitingPartnerNumbers =>
      'Oczekiwanie na zaakceptowanie numerów przez drugą osobę…';

  @override
  String get warning => 'Uwaga!';

  @override
  String get weSentYouAnEmail => 'Wysłaliśmy Ci wiadomość e-mail';

  @override
  String get whoCanPerformWhichAction => 'Kto może wykonywać jakie czynności';

  @override
  String get whoIsAllowedToJoinThisGroup => 'Kto może dołączyć do tej grupy';

  @override
  String get whyDoYouWantToReportThis => 'Dlaczego chcesz to zgłosić?';

  @override
  String get withTheseAddressesRecoveryDescription =>
      'Dzięki tym adresom możesz odzyskać swoje hasło.';

  @override
  String get writeAMessage => 'Napisz wiadomość…';

  @override
  String get yes => 'Tak';

  @override
  String get you => 'Ty';

  @override
  String get youAreNoLongerParticipatingInThisChat =>
      'Nie uczestniczysz już w tym czacie';

  @override
  String get yourPublicKey => 'Twój klucz publiczny';

  @override
  String get messageInfo => 'Informacje o wiadomości';

  @override
  String get time => 'Czas';

  @override
  String get sender => 'Nadawca';

  @override
  String get openGallery => 'Otwórz galerię';

  @override
  String get removeFromSpace => 'Usuń z przestrzeni';

  @override
  String get markAsRead => 'Oznacz jako przeczytane';

  @override
  String get reportUser => 'Zgłoś użytkownika';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender zareagował/-a z $reaction';
  }

  @override
  String get pinMessage => 'Przypnij do pokoju';

  @override
  String get confirmEventUnpin =>
      'Czy na pewno chcesz trwale odpiąć wydarzenie?';

  @override
  String get emojis => 'Emoji';

  @override
  String get unsupportedAndroidVersion =>
      'Nieobsługiwana wersja systemu Android';

  @override
  String get unsupportedAndroidVersionLong =>
      'Ta funkcja wymaga nowszej wersji systemu Android. Sprawdź aktualizacje lub wsparcie Mobile Katya OS.';

  @override
  String get youRejectedTheInvitation => 'Odrzucono zaproszenie';

  @override
  String get youJoinedTheChat => 'Dołączono do czatu';

  @override
  String get youAcceptedTheInvitation => '👍 Zaakceptowałeś/-aś zaproszenie';

  @override
  String youBannedUser(String user) {
    return 'Zbanowałeś/-aś $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'Wycofano zaproszenie dla $user';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 Zostałeś/-aś zaproszony/-a przez $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 Zaprosiłeś/-aś $user';
  }

  @override
  String youKicked(String user) {
    return '👞 Wyrzuciłeś/-aś $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 Wyrzuciłeś/-aś i zbanowałeś/-aś $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'Odbanowałeś/-aś $user';
  }

  @override
  String hasKnocked(String user) {
    return '$user zapukał-/a';
  }

  @override
  String get usersMustKnock => 'Użytkownicy muszą zapukać';

  @override
  String get noOneCanJoin => 'Nikt nie może dołączyć';

  @override
  String get knock => 'Zapukaj';

  @override
  String get users => 'Użytkownicy';

  @override
  String get storeInAndroidKeystore => 'Przechowaj w Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Przechowaj w pęku kluczy Apple';

  @override
  String get storeSecurlyOnThisDevice =>
      'Przechowaj bezpiecznie na tym urządzeniu';

  @override
  String countFiles(int count) {
    return '$count plików';
  }

  @override
  String get user => 'Użytkownik';

  @override
  String get custom => 'Własne';

  @override
  String get whyIsThisMessageEncrypted =>
      'Dlaczego nie można odczytać tej wiadomości?';

  @override
  String get noKeyForThisMessage =>
      'Może się to zdarzyć, jeśli wiadomość została wysłana przed zalogowaniem się na to konto na tym urządzeniu.\n\nMożliwe jest również, że nadawca zablokował Twoje urządzenie lub coś poszło nie tak z połączeniem internetowym.\n\nJesteś w stanie odczytać wiadomość na innej sesji? W takim razie możesz przenieść z niej wiadomość! Wejdź w Ustawienia > Urządzenia i upewnij się, że Twoje urządzenia zweryfikowały się wzajemnie. Gdy następnym razem otworzysz pokój i obie sesje będą włączone, klucze zostaną przekazane automatycznie.\n\nNie chcesz stracić kluczy podczas wylogowania lub przełączania urządzeń? Upewnij się, że w ustawieniach masz włączoną kopię zapasową czatu.';

  @override
  String get newSpace => 'Nowa przestrzeń';

  @override
  String get doNotShowAgain => 'Nie pokazuj ponownie';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Pusty czat (wcześniej $oldDisplayName)';
  }

  @override
  String get newSpaceDescription =>
      'Przestrzenie pozwalają na konsolidację czatów i budowanie prywatnych lub publicznych społeczności.';

  @override
  String get encryptThisChat => 'Zaszyfruj ten czat';

  @override
  String get disableEncryptionWarning =>
      'Ze względów bezpieczeństwa nie można wyłączyć szyfrowania w czacie, w którym zostało ono wcześniej włączone.';

  @override
  String get sorryThatsNotPossible => 'Przepraszamy... to nie jest możliwe';

  @override
  String get reopenChat => 'Otwórz ponownie czat';

  @override
  String get noBackupWarning =>
      'Uwaga! Bez włączenia kopii zapasowej czatu, stracisz dostęp do swoich zaszyfrowanych wiadomości. Zaleca się włączenie kopii zapasowej czatu przed wylogowaniem.';

  @override
  String get noOtherDevicesFound => 'Nie znaleziono innych urządzeń';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Nie udało się wysłać! Ten serwer obsługuje załączniki o maksymalnej wielkości $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'Plik został zapisany w ścieżce $path';
  }

  @override
  String get jumpToLastReadMessage =>
      'Przejdź do ostatnio przeczytanej wiadomości';

  @override
  String get readUpToHere => 'Czytaj do tego miejsca';

  @override
  String get jump => 'Przejdź';

  @override
  String get openLinkInBrowser => 'Otwórz link w przeglądarce';

  @override
  String get reportErrorDescription =>
      '😭 O nie! Coś poszło nie tak. Spróbuj ponownie później. Jeśli chcesz, możesz zgłosić ten błąd autorom programu.';

  @override
  String get report => 'zgłoś';

  @override
  String get setColorTheme => 'Ustal styl kolorów:';

  @override
  String get invite => 'Zaproszenie';

  @override
  String get inviteGroupChat => '📨 Zaproszenie do rozmowy grupowej';

  @override
  String get invalidInput => 'Nieprawidłowe dane!';

  @override
  String wrongPinEntered(int seconds) {
    return 'Wprowadzono nieprawidłowy kod PIN! Spróbuj ponownie za $seconds sekund...';
  }

  @override
  String get pleaseEnterANumber => 'Proszę podać liczbę większą od 0';

  @override
  String get archiveRoomDescription =>
      'Czat zostanie przeniesiony do archiwum. Pozostali użytkownicy będą mogli zobaczyć, że opuściłeś/-aś czat.';

  @override
  String get roomUpgradeDescription =>
      'Czat zostanie przeniesiony do pokoju w nowej wersji. Wszyscy użytkownicy zostaną powiadomieni o konieczności dołączenia do nowego czatu. Możesz dowiedzieć się więcej o wersjach pokojów na https://github.com/sorydima/REChain-.git';

  @override
  String get removeDevicesDescription =>
      'Nastąpi wylogowanie z tego urządzenia. Nie będziesz w stanie odbierać na nim wiadomości.';

  @override
  String get banUserDescription =>
      'Użytkownik zostanie zbanowany w czacie i nie będzie w stanie dołączyć do czatu do momentu odbanowania.';

  @override
  String get unbanUserDescription =>
      'Użytkownik będzie w stanie dołączyć do czatu ponownie.';

  @override
  String get kickUserDescription =>
      'Użytkownik jest wyrzucony z czatu, ale nie zbanowany. Do czatu publicznego może dołączyć ponownie.';

  @override
  String get makeAdminDescription =>
      'Kiedy użytkownik zostanie adminem, nie będziesz móc tego cofnąć, bo nabierze takich samych uprawnień, jak Ty.';

  @override
  String get pushNotificationsNotAvailable =>
      'Powiadomienia push nie są dostępne';

  @override
  String get learnMore => 'Dowiedz się więcej';

  @override
  String get yourGlobalUserIdIs => 'Twój globalny identyfikator to: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Niestety nie udało się nikogo znaleźć poprzez \"$query\". Proszę sprawdzić, czy w zapytaniu nie ma literówek.';
  }

  @override
  String get knocking => 'Pukanie';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Czat będzie można znaleźć, szukając na $server';
  }

  @override
  String get searchChatsRooms => 'Szukaj #czatów, @użytkowników...';

  @override
  String get nothingFound => 'Nic nie odnaleziono...';

  @override
  String get groupName => 'Nazwa grupy';

  @override
  String get createGroupAndInviteUsers => 'Utwórz grupę i zaproś użytkowników';

  @override
  String get groupCanBeFoundViaSearch =>
      'Grupa może być znaleziona poprzez wyszukiwanie';

  @override
  String get wrongRecoveryKey =>
      'Niestety to nie wygląda na poprawny klucz odzyskiwania.';

  @override
  String get commandHint_sendraw => 'Wyślij zwykły JSON';

  @override
  String get databaseMigrationTitle => 'Baza danych jest zoptymalizowana';

  @override
  String get databaseMigrationBody => 'Proszę czekać. Może to potrwać chwilę.';

  @override
  String get leaveEmptyToClearStatus =>
      'Pozostaw puste, aby wyczyścić swój status.';

  @override
  String get select => 'Zaznacz';

  @override
  String get searchForUsers => 'Szukaj @użytkowników...';

  @override
  String get pleaseEnterYourCurrentPassword =>
      'Proszę podać swoje obecne hasło';

  @override
  String get newPassword => 'Nowe hasło';

  @override
  String get pleaseChooseAStrongPassword => 'Proszę wybrać silne hasło';

  @override
  String get passwordsDoNotMatch => 'Hasła się nie zgadzają';

  @override
  String get passwordIsWrong => 'Podano niepoprawne hasło';

  @override
  String get publicChatAddresses => 'Adresy publicznych czatów';

  @override
  String get createNewAddress => 'Utwórz nowy adres';

  @override
  String get joinSpace => 'Dołącz do przestrzeni';

  @override
  String get publicSpaces => 'Przestrzenie publiczne';

  @override
  String get addChatOrSubSpace => 'Dodaj czat lub podprzestrzeń';

  @override
  String get thisDevice => 'To urządzenie:';

  @override
  String get initAppError => 'Wystąpił błąd podczas inicjalizacji aplikacji';

  @override
  String searchIn(String chat) {
    return 'Szukaj w czacie \"$chat\"...';
  }

  @override
  String get searchMore => 'Szukaj dalej...';

  @override
  String get gallery => 'Galeria';

  @override
  String get files => 'Pliki';

  @override
  String sessionLostBody(String url, String error) {
    return 'Twoja sesja została utracona. Prosimy zgłosić ten błąd autorom aplikacji na $url. Treść błędu to: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'Aplikacja spróbuje teraz odzyskać Twoją sesję z kopii zapasowej. Prosimy zgłosić ten błąd autorom aplikacji na $url. Treść błędu to: $error';
  }

  @override
  String get sendReadReceipts =>
      'Wysyłaj powiadomienia o przeczytaniu wiadomości';

  @override
  String get sendTypingNotificationsDescription =>
      'Pozostali uczestnicy czatu mogą widzieć kiedy piszesz nową wiadomość.';

  @override
  String get sendReadReceiptsDescription =>
      'Pozostali uczestnicy czatu mogą widzieć zobaczyć kiedy przeczytasz wiadomość.';

  @override
  String get formattedMessages => 'Sformatowane wiadomości';

  @override
  String get formattedMessagesDescription =>
      'Używaj Markdown do wyświetlania dodatkowego formatowania w wiadomościach, jak np. pogrubienie tekstu.';

  @override
  String get verifyOtherUser => '🔐 Zweryfikuj innego użytkownika';

  @override
  String get verifyOtherUserDescription =>
      'Jeśli zweryfikujesz innego użytkownika, możesz być pewien/-na z kim naprawdę piszesz. 💪\n\nKiedy rozpoczniesz weryfikację, Ty i ta druga osoba zobaczycie okienko dialogowe. Zobaczycie w nim serię emotikonów lub numery do porównania.\n\nNajlepiej potwierdzić ich zgodność osobiście lub przez wideorozmowę. 👭';

  @override
  String get verifyOtherDevice => '🔐 Zweryfikuj inne urządzenie';

  @override
  String get verifyOtherDeviceDescription =>
      'Jeśli zweryfikujesz inne urządzenie, będzie mogło ono wymienić klucze z dotychczasowym, zwiększając ogólne bezpieczeństwo. 💪 Kiedy rozpoczniesz weryfikację, na obu urządzeniach wyświetli się okno dialogowe. Zobaczysz w nim serię emotikonów lub numery do porównania. Najlepiej mieć oba urządzenia pod ręką przed rozpoczęciem weryfikacji. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender zaakceptował/-a weryfikację kluczy';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender anulował/-a weryfikację kluczy';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender zakończył/-a weryfikację kluczy';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender jest gotowy/-a do weryfikacji kluczy';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender poprosił/-a o weryfikację kluczy';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender rozpoczął/-ęła weryfikację kluczy';
  }

  @override
  String get incomingMessages => 'Wiadomości przychodzące';

  @override
  String get stickers => 'Naklejki';

  @override
  String get discover => 'Odkrywaj';

  @override
  String get commandHint_ignore => 'Ignoruj podany identyfikator REChain';

  @override
  String get commandHint_unignore =>
      'Przestań ignorować podany identyfikator REChain';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread nieprzeczytanych czatów';
  }

  @override
  String get noDatabaseEncryption =>
      'Szyfrowanie bazy danych nie jest obsługiwane na tej platformie';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Obecnie jest $count zablokowanych użytkowników.';
  }

  @override
  String goToSpace(Object space) {
    return 'Przejdź do przestrzeni $space';
  }

  @override
  String get markAsUnread => 'Oznacz jako nieprzeczytane';

  @override
  String userLevel(int level) {
    return '$level - Użytkownik';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Moderator';
  }

  @override
  String adminLevel(int level) {
    return '$level - Administrator';
  }

  @override
  String get changeGeneralChatSettings => 'Zmień ogólne ustawienia czatu';

  @override
  String get inviteOtherUsers => 'Zaproś innych użytkowników do tego czatu';

  @override
  String get changeTheChatPermissions => 'Zmień uprawnienia w czacie';

  @override
  String get changeTheVisibilityOfChatHistory =>
      'Zmień widoczność historii czatu';

  @override
  String get changeTheCanonicalRoomAlias => 'Zmień główny publiczny czatu';

  @override
  String get sendRoomNotifications => 'Wysyłaj powiadomienia @room';

  @override
  String get changeTheDescriptionOfTheGroup => 'Zmień opis czatu';

  @override
  String get chatPermissionsDescription =>
      'Ustal jaki poziom uprawnień jest wymagany dla określonych czynności w czacie. Poziomy uprawnień 0, 50 i 100 zwykle dotyczą odpowiednio użytkowników, moderatorów i administratorów, ale możliwa jest dowolna gradacja.';

  @override
  String updateInstalled(String version) {
    return '🎉 Zainstalowano aktualizację do wersji $version!';
  }

  @override
  String get changelog => 'Lista zmian';

  @override
  String updateAvailable(String version) {
    return 'Update $version available';
  }

  @override
  String get download => 'Download';

  @override
  String get sendCanceled => 'Anulowano wysyłanie';

  @override
  String get loginWithREChainId => 'Login with REChain-ID';

  @override
  String get doesNotSeemToBeAValidHomeserver =>
      'Wydaje się nie być kompatybilnym serwerem domowym. Niepoprawny adres URL?';

  @override
  String get calculatingFileSize => 'Obliczanie rozmiaru pliku...';

  @override
  String get oneOfYourDevicesIsNotVerified =>
      'Jedno z Twoich urządzeń nie jest zweryfikowane';

  @override
  String get noticeChatBackupDeviceVerification =>
      'Uwaga: Urządzenia dodane do kopii zapasowej czatu automatycznie zostają zweryfikowane.';

  @override
  String get continueText => 'Kontynuuj';

  @override
  String get blur => 'Rozmazanie:';

  @override
  String get opacity => 'Przezroczystość:';

  @override
  String get setWallpaper => 'Ustaw tapetę';

  @override
  String get manageAccount => 'Zarządzaj kontem';

  @override
  String get noContactInformationProvided =>
      'Serwer nie dostarcza żadnych poprawnych danych kontaktowych';

  @override
  String get contactServerAdmin => 'Skontaktuj się z administratorem serwera';

  @override
  String get contactServerSecurity =>
      'Skontaktuj się z działem bezpieczeństwa serwera';

  @override
  String get supportPage => 'Strona obsługi użytkownika';

  @override
  String get serverInformation => 'Informacje o serwerze:';

  @override
  String get name => 'Nazwa';

  @override
  String get version => 'Wersja';

  @override
  String get website => 'Strona internetowa';

  @override
  String get compress => 'Skompresuj';

  @override
  String get boldText => 'Pogrubienie';

  @override
  String get italicText => 'Kursywa';

  @override
  String get strikeThrough => 'Przekreślenie';

  @override
  String get pleaseFillOut => 'Proszę wypełnić';

  @override
  String get invalidUrl => 'Niepoprawny adres URL';

  @override
  String get addLink => 'Dodaj link';

  @override
  String get unableToJoinChat =>
      'Nie udało się dołączyć do czatu. Może druga strona zakończyła już rozmowę?';

  @override
  String get previous => 'Poprzedni';

  @override
  String get otherPartyNotLoggedIn =>
      'Druga strona nie jest obecnie zalogowana i dlatego nie może odbierać wiadomości!';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Użyj serwera \'$server\' do zalogowania się';
  }

  @override
  String get appWantsToUseForLoginDescription =>
      'Niniejszym zezwalasz aplikacji i witrynie na udostępnianie informacji o sobie.';

  @override
  String get open => 'Otwórz';

  @override
  String get waitingForServer => 'Oczekiwanie na serwer...';

  @override
  String get newChatRequest => '📩 Nowa prośba o czat';

  @override
  String get contentNotificationSettings => 'Ustawienia powiadomień o treści';

  @override
  String get generalNotificationSettings => 'Ogólne ustawienia powiadomień';

  @override
  String get roomNotificationSettings => 'Ustawienia powiadomień w pokoju';

  @override
  String get userSpecificNotificationSettings =>
      'Ustawienia powiadomień dla użytkownika';

  @override
  String get otherNotificationSettings => 'Inne ustawienia powiadomień';

  @override
  String get notificationRuleContainsUserName =>
      'Włącz dla wiadomości z nazwą użytkownika';

  @override
  String get notificationRuleContainsUserNameDescription =>
      'Włącza powiadomienia kiedy wiadomość zawiera Twoją nazwę użytkownika.';

  @override
  String get notificationRuleMaster => 'Wyłącz wszystkie powiadomienia';

  @override
  String get notificationRuleMasterDescription =>
      'Zastępuje inne reguły i wyłącza wszystkie powiadomienia.';

  @override
  String get notificationRuleSuppressNotices =>
      'Wyłącz dla automatycznych wiadomości';

  @override
  String get notificationRuleSuppressNoticesDescription =>
      'Wyłącza powiadomienia z automatycznych klientów, takich jak boty.';

  @override
  String get notificationRuleInviteForMe => 'Włącz dla zaproszeń';

  @override
  String get notificationRuleInviteForMeDescription =>
      'Włącza powiadomienia o zaproszeniach do pokoju.';

  @override
  String get notificationRuleMemberEvent => 'Wyłącz dla zmian członkostwa';

  @override
  String get notificationRuleMemberEventDescription =>
      'Wyłącza powiadomienia o zmianach członkostwa w pokoju.';

  @override
  String get notificationRuleIsUserMention => 'Włącz dla wzmianek';

  @override
  String get notificationRuleIsUserMentionDescription =>
      'Włącza powiadomienia o byciu wzmiankowanym w wiadomości.';

  @override
  String get notificationRuleContainsDisplayName =>
      'Włącz dla wiadomości z nazwą wyświetlaną';

  @override
  String get notificationRuleContainsDisplayNameDescription =>
      'Włącza powiadomienia o wiadomościach zawierających Twoją nazwę wyświetlaną.';

  @override
  String get notificationRuleIsRoomMention => 'Włącz dla wzmianek pokoju';

  @override
  String get notificationRuleIsRoomMentionDescription =>
      'Włącza powiadomienia o wzmiankowaniu całego pokoju.';

  @override
  String get notificationRuleRoomnotif => 'Włącz dla powiadomień w pokoju';

  @override
  String get notificationRuleRoomnotifDescription =>
      'Włącza powiadomienia o wiadomościach zawierających „@room”.';

  @override
  String get notificationRuleTombstone => 'Włącz dla „nagrobków”';

  @override
  String get notificationRuleTombstoneDescription =>
      'Włącza powiadomienia o komunikatach dezaktywacji pokojów.';

  @override
  String get notificationRuleReaction => 'Wyłącz dla reakcji';

  @override
  String get notificationRuleReactionDescription =>
      'Wyłącza powiadomienia o reakcjach.';

  @override
  String get notificationRuleRoomServerAcl =>
      'Wyłącz dla list kontroli dostępu serwera';

  @override
  String get notificationRuleRoomServerAclDescription =>
      'Wyłącza powiadomienia dla list kontroli dostępu (ACL) serwera.';

  @override
  String get notificationRuleSuppressEdits => 'Wyłącz dla edycji';

  @override
  String get notificationRuleSuppressEditsDescription =>
      'Wyłącza powiadomienia o edycjach wiadomości.';

  @override
  String get notificationRuleCall => 'Włącz dla połączeń';

  @override
  String get notificationRuleCallDescription =>
      'Włącza powiadomienia o przychodzących połączeniach.';

  @override
  String get notificationRuleEncryptedRoomOneToOne =>
      'Włącz dla szyfrowanych pokojów „jeden na jeden”';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription =>
      'Włącza powiadomienia o wiadomościach w szyfrowanych pokojach „jeden na jeden” (one-to-one).';

  @override
  String get notificationRuleRoomOneToOne =>
      'Włącz dla pokojów „jeden na jeden”';

  @override
  String get notificationRuleRoomOneToOneDescription =>
      'Włącza powiadomienia o wiadomościach w pokojach „jeden na jeden” (one-to-one).';

  @override
  String get notificationRuleMessage => 'Włącz dla wiadomości';

  @override
  String get notificationRuleMessageDescription =>
      'Włącza powiadomienia o ogólnych wiadomościach.';

  @override
  String get notificationRuleEncrypted => 'Włącz dla zaszyfrowanych pokojów';

  @override
  String get notificationRuleEncryptedDescription =>
      'Włącza powiadomienia o wiadomościach w zaszyfrowanych pokojach.';

  @override
  String get notificationRuleJitsi => 'Włącz dla Jitsi';

  @override
  String get notificationRuleJitsiDescription =>
      'Włącza powiadomienia o komunikatach widżetów Jitsi.';

  @override
  String get notificationRuleServerAcl =>
      'Wyłącz dla komunikatów o listach kontroli dostępu serwera';

  @override
  String get notificationRuleServerAclDescription =>
      'Wyłącza powiadomienia o komunikatach o listach kontroli dostępu (ACL) serwera.';

  @override
  String unknownPushRule(String rule) {
    return 'Nieznana reguła: \'$rule\'';
  }

  @override
  String sentVoiceMessage(String sender, String duration) {
    return '🎙️ $duration - Wiadomość głosowa od: $sender';
  }

  @override
  String get deletePushRuleCanNotBeUndone =>
      'Jeśli skasujesz to ustawienie powiadomień, nie będzie się dało tego cofnąć.';

  @override
  String get more => 'Więcej';

  @override
  String get shareKeysWith => 'Udostępnij klucze...';

  @override
  String get shareKeysWithDescription =>
      'Które urządzenia powinny być zaufane, aby mogły odczytywać Twoje wiadomości w zaszyfrowanych czatach?';

  @override
  String get allDevices => 'Wszystkie urządzenia';

  @override
  String get crossVerifiedDevicesIfEnabled =>
      'Urządzenia zweryfikowane krzyżowo, jeśli włączone';

  @override
  String get crossVerifiedDevices => 'Urządzenia zweryfikowane krzyżowo';

  @override
  String get verifiedDevicesOnly => 'Tylko zweryfikowane urządzenia';

  @override
  String get takeAPhoto => 'Zrób zdjęcie';

  @override
  String get recordAVideo => 'Nagraj film';

  @override
  String get optionalMessage => '(Opcjonalna) wiadomość...';

  @override
  String get notSupportedOnThisDevice => 'Niewspierane na tym urządzeniu';

  @override
  String get enterNewChat => 'Dołącz do nowego czatu';

  @override
  String get approve => 'Zaakceptuj';

  @override
  String get youHaveKnocked => 'Zapukałeś/-aś';

  @override
  String get pleaseWaitUntilInvited =>
      'Proszę zaczekać na zaproszenie przez kogoś z pokoju.';

  @override
  String get commandHint_logout => 'Wyloguj bieżące urządzenie';

  @override
  String get commandHint_logoutall => 'Wyloguj wszystkie aktywne urządzenia';

  @override
  String get displayNavigationRail =>
      'Pokazuj pasek nawigacyjny na urządzeniach mobilnych';

  @override
  String get customReaction => 'Własna reakcja';

  @override
  String get moreEvents => 'Więcej zdarzeń';

  @override
  String get showMore => 'Show more';

  @override
  String get showLess => 'Show less';

  @override
  String get declineInvitation => 'Odrzuć zaproszenie';

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
      'Należy pamiętać, że połączenia wideo są obecnie w fazie beta. Mogą nie działać zgodnie z oczekiwaniami lub nie działać w ogóle na wszystkich platformach.';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get incomingCall => 'Incoming call';

  @override
  String get videoCall => 'Rozmowa wideo';

  @override
  String get voiceCall => 'Połączenie głosowe';

  @override
  String get missedCall => 'Missed call';

  @override
  String get callBack => 'Call back';

  @override
  String get hangUp => 'Hang up';

  @override
  String get waitingForParticipant => 'Waiting for participant...';

  @override
  String get decline => 'Odmów';

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
