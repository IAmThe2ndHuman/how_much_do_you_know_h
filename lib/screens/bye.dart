import 'dart:async';
import 'dart:math';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:how_much_do_you_know_h/util/constants.dart';

class CrashApp extends StatefulWidget {
  @override
  _CrashAppState createState() => _CrashAppState();
}

class _CrashAppState extends State<CrashApp> {
  final Random _random = Random();

  Future<void> cum() async {
    await Future.delayed(Duration(seconds: 3));
    window.location.href = byeRandomWebsites[_random.nextInt(byeRandomWebsites.length)];
  }

  @override
  void initState() {
    super.initState();
    cum();
    throw fartError;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Container(), onWillPop: () async => false);
  }
}

class FartException implements Exception {
  String cause;
  FartException(this.cause);
}