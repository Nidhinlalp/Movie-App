import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final int miiliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({
    required this.miiliseconds,
  });

  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: miiliseconds), action);
  }
}
