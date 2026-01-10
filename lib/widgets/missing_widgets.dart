import 'package:flutter/material.dart';

// Stub implementations for missing widgets

class TeleAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double? top;

  const TeleAppbar({super.key, required this.title, this.top});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      toolbarHeight: kToolbarHeight + (top ?? 0),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (top ?? 0));
}

class ListButton extends StatelessWidget {
  final String label;
  final VoidCallback onPress;

  const ListButton(this.label, {super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(label),
    );
  }
}

class InfoExpandableTile extends StatelessWidget {
  final String title;
  final String content;

  const InfoExpandableTile(this.title, this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      children: [Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(content),
      )],
    );
  }
}

class ThemeParamsWidget extends StatelessWidget {
  final dynamic themeParams;

  const ThemeParamsWidget(this.themeParams, {super.key});

  @override
  Widget build(BuildContext context) {
    // Stub: just display themeParams as string
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Theme Params: $themeParams'),
    );
  }
}

class OneColorExpandableTile extends StatelessWidget {
  final String title;
  final Color? color;

  const OneColorExpandableTile(this.title, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      children: [
        Container(
          height: 50,
          color: color ?? Colors.transparent,
        ),
      ],
    );
  }
}
