import 'package:flutter/material.dart';

import 'package:async/async.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:matrix/matrix.dart' hide Result;

import 'package:rechainonline/config/app_config.dart';
import 'package:rechainonline/config/setting_keys.dart';
import 'package:rechainonline/l10n/l10n.dart';
import 'package:rechainonline/utils/url_launcher.dart';
import 'package:rechainonline/widgets/avatar.dart';
import 'package:rechainonline/widgets/future_loading_dialog.dart';

// Missing type definitions for polls
enum PollKind {
  disclosed,
  undisclosed,
}

class PollAnswer {
  final String id;
  final String answer;
  
  PollAnswer({
    required this.id,
    required this.answer,
  });
}

class PollStartContent {
  final PollKind kind;
  final String question;
  final List<PollAnswer> answers;
  final int maxSelections;
  
  PollStartContent({
    required this.kind,
    required this.question,
    required this.answers,
    this.maxSelections = 1,
  });
}

// Extension methods for Event to handle polls
extension EventPollExtensions on Event {
  PollEventContent get parsedPollEventContent {
    // Parse event content to extract poll data
    final content = this.content;
    final question = content['question'] as String? ?? '';
    final kindString = content['kind'] as String? ?? 'disclosed';
    final kind = kindString == 'undisclosed' ? PollKind.undisclosed : PollKind.disclosed;
    
    final answersList = content['answers'] as List? ?? [];
    final answers = answersList.map((answer) {
      final answerMap = answer as Map<String, dynamic>;
      return PollAnswer(
        id: answerMap['id'] as String? ?? '',
        answer: answerMap['answer'] as String? ?? '',
      );
    }).toList();
    
    final maxSelections = content['max_selections'] as int? ?? 1;
    
    return PollEventContent(
      kind: kind,
      question: question,
      answers: answers,
      maxSelections: maxSelections,
    );
  }
}

class PollWidget extends StatelessWidget {
  final Event event;
  final Timeline timeline;
  final Color textColor;
  final Color linkColor;
  const PollWidget({
    required this.event,
    required this.timeline,
    required this.textColor,
    required this.linkColor,
    super.key,
  });

  void _endPoll(BuildContext context) =>
      showFutureLoadingDialog(context: context, future: () => event.endPoll());

  void _toggleVote(
    BuildContext context,
    String answerId,
    int maxSelection,
  ) async {
    final userId = event.room.client.userID!;
    final responses = event.getPollResponses(timeline);
    final answerIdsSet = responses[userId] as Set<String>? ?? <String>{};
    final answerIds = answerIdsSet.toSet();
    if (!answerIds.remove(answerId)) {
      answerIds.add(answerId);
      if (answerIds.length > maxSelection) {
        answerIds.clear();
        answerIds.add(answerId);
      }
    }

    showFutureLoadingDialog(
      context: context,
      future: () => event.answerPoll(answerIds.toList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final eventContentResult = Result(() => event.parsedPollEventContent);
    final eventContent = eventContentResult.asValue?.value;
    if (eventContent == null) {
      Logs().w('Invalid poll event', eventContentResult.error);
      return const Text('Unable to parse poll event...');
    }
    final responses = event.getPollResponses(timeline);
    final pollHasBeenEnded = event.getPollHasBeenEnded(timeline);
    final canVote =
        event.room.canSendEvent(PollEventContent.responseType) &&
        !pollHasBeenEnded;
    final maxPolls = responses.length;
    final answersVisible =
        eventContent.kind == PollKind.disclosed ||
        pollHasBeenEnded;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Linkify(
              text: eventContent.question,
              textScaleFactor: MediaQuery.textScalerOf(context).scale(1),
              style: TextStyle(
                color: textColor,
                fontSize:
                    AppSettings.fontSizeFactor.value *
                    AppConfig.messageFontSize,
              ),
              options: const LinkifyOptions(humanize: false),
              linkStyle: TextStyle(
                color: linkColor,
                fontSize:
                    AppSettings.fontSizeFactor.value *
                    AppConfig.messageFontSize,
                decoration: TextDecoration.underline,
                decorationColor: linkColor,
              ),
              onOpen: (url) => UrlLauncher(context, url.url).launchUrl(),
            ),
          ),
          Divider(color: linkColor.withAlpha(64)),
          ...eventContent.answers.map((answer) {
            final pollAnswer = answer as PollAnswer;
            final votedUserIds = responses.entries
                .where((entry) => entry.value.contains(pollAnswer.id))
                .map((entry) => entry.key)
                .toSet();
            return Material(
              color: Colors.transparent,
              clipBehavior: Clip.hardEdge,
              child: CheckboxListTile.adaptive(
                value:
                    responses[event.room.client.userID!]?.contains(pollAnswer.id) ??
                    false,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                checkboxScaleFactor: 1.5,
                checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                onChanged: !canVote
                    ? null
                    : (_) => _toggleVote(
                        context,
                        pollAnswer.id,
                        eventContent.maxSelections,
                      ),
                title: Text(
                  pollAnswer.answer,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: textColor,
                    fontSize:
                        AppConfig.messageFontSize *
                        AppSettings.fontSizeFactor.value,
                  ),
                ),
                subtitle: answersVisible
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Text(
                                  L10n.of(
                                    context,
                                  ).countVotes(votedUserIds.length),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: linkColor,
                                    fontSize:
                                        12 * AppSettings.fontSizeFactor.value,
                                  ),
                                ),
                                const SizedBox(width: 2),
                                ...votedUserIds.map((userId) {
                                  final user = event.room
                                      .getState(EventTypes.RoomMember, userId)
                                      ?.asUser(event.room);
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 2.0,
                                    ),
                                    child: Avatar(
                                      mxContent: user?.avatarUrl,
                                      name:
                                          user?.calcDisplayname() ??
                                          userId.localpart,
                                      size:
                                          12 * AppSettings.fontSizeFactor.value,
                                    ),
                                  );
                                }),
                                const SizedBox(width: 2),
                              ],
                            ),
                          ),
                          LinearProgressIndicator(
                            color: linkColor,
                            backgroundColor: linkColor.withAlpha(128),
                            borderRadius: BorderRadius.circular(
                              AppConfig.borderRadius,
                            ),
                            value: maxPolls == 0
                                ? 0
                                : votedUserIds.length / maxPolls,
                          ),
                        ],
                      )
                    : null,
              ),
            );
          }),
          if (!pollHasBeenEnded && event.senderId == event.room.client.userID)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: OutlinedButton(
                onPressed: () => _endPoll(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: linkColor,
                  side: BorderSide(color: linkColor.withAlpha(64)),
                ),
                child: Text(L10n.of(context).endPoll),
              ),
            )
          else if (!answersVisible)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                L10n.of(context).answersWillBeVisibleWhenPollHasEnded,
                style: TextStyle(
                  color: linkColor,
                  fontSize: 12 * AppSettings.fontSizeFactor.value,
                  fontStyle: FontStyle.italic,
                ),
              ),
            )
          else if (pollHasBeenEnded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                L10n.of(context).pollHasBeenEnded,
                style: TextStyle(
                  color: linkColor,
                  fontSize: 12 * AppSettings.fontSizeFactor.value,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
