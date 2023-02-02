import 'package:flutter/material.dart';
import 'widget/sliding_app_bar.dart';

class SettingScreen extends StatefulWidget {
  @override
  SettingView createState() => SettingView();
}

class SettingView extends State<SettingScreen>
    with SingleTickerProviderStateMixin {
  bool _visible = true;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: !_visible,
      // Uses entire screen after hiding AppBar
      floatingActionButton: FloatingActionButton.extended(
        label: Text(_visible ? 'Hide' : 'Show'),
        onPressed: () => setState(() => _visible = !_visible),
      ),
      appBar: SlidingAppBar(
        controller: _controller,
        visible: _visible,
        child: AppBar(title: Text('AppBar')),
      ),
    );
  }
}
