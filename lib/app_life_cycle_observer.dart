import 'dart:ui';

import 'package:flutter/material.dart';

class AppLifeCycleObserver extends StatefulWidget {
  const AppLifeCycleObserver({
    super.key,
    this.onDetach,
    this.onHide,
    this.onInactive,
    this.onPause,
    this.onRestart,
    this.onResume,
    this.onShow,
    required this.onStateChange,
    this.onExitRequested,
    required this.child,
  });

  final VoidCallback? onDetach;
  final VoidCallback? onHide;
  final VoidCallback? onInactive;
  final VoidCallback? onPause;
  final VoidCallback? onRestart;
  final VoidCallback? onResume;
  final VoidCallback? onShow;
  final Function(AppLifecycleState appLifecycleState) onStateChange;
  final Future<AppExitResponse> Function()? onExitRequested;
  final Widget child;

  @override
  State<AppLifeCycleObserver> createState() => _AppLifeCycleObserverState();
}

class _AppLifeCycleObserverState extends State<AppLifeCycleObserver> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();

    _listener = AppLifecycleListener(
      onDetach: widget.onDetach,
      onHide: widget.onHide,
      onInactive: widget.onInactive,
      onPause: widget.onPause,
      onRestart: widget.onRestart,
      onResume: widget.onResume,
      onShow: widget.onShow,
      onStateChange: widget.onStateChange,
      onExitRequested: widget.onExitRequested,
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
