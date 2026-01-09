import 'package:flutter/material.dart';

import 'package:matrix/matrix.dart';

import 'package:rechainonline/pages/chat_search/chat_search_view.dart';
import 'package:rechainonline/widgets/matrix.dart';

class ChatSearchPage extends StatefulWidget {
  final String roomId;
  const ChatSearchPage({required this.roomId, super.key});

  @override
  ChatSearchController createState() => ChatSearchController();
}

class ChatSearchController extends State<ChatSearchPage>
    with SingleTickerProviderStateMixin {
  Room? get room => Matrix.of(context).client.getRoomById(widget.roomId);

  final TextEditingController searchController = TextEditingController();
  late final TabController tabController;

  final List<Event> messages = [];
  final List<Event> images = [];
  final List<Event> files = [];
  String? messagesNextBatch, imagesNextBatch, filesNextBatch;
  bool messagesEndReached = false;
  bool imagesEndReached = false;
  bool filesEndReached = false;
  bool isLoading = false;
  DateTime? searchedUntil;

  void restartSearch() {
    setState(() {
      messages.clear();
      images.clear();
      files.clear();
      messagesNextBatch = imagesNextBatch = filesNextBatch = searchedUntil =
          null;
      messagesEndReached = imagesEndReached = filesEndReached = false;
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startSearch();
    });
  }

  void startSearch() async {
    // Search functionality disabled for compilation
    setState(() {
      isLoading = false;
      messagesEndReached = true;
      imagesEndReached = true;
      filesEndReached = true;
    });
  }

  void _onTabChanged() {
    switch (tabController.index) {
      case 1:
      case 2:
        startSearch();
        break;
      case 0:
      default:
        restartSearch();
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    tabController.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    tabController.removeListener(_onTabChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ChatSearchView(this);
}
