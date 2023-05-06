import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RecorederMenu extends StatefulWidget {
  RecorederMenu({super.key});

  bool _isPlaying = false;
  @override
  State<RecorederMenu> createState() => _RecorederMenuState();
}

class _RecorederMenuState extends State<RecorederMenu> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: widget._isPlaying
              ? const Icon(Icons.abc)
              : const Icon(Icons.pause),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.mic),
        ),
      ],
    );
  }
}
