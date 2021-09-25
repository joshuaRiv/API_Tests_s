// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:camera/camera.dart';
import 'package:camera_example/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CameraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PruebaFoto(),
    );
  }
}

//** INCLUIR PARA CAMARA */
List<CameraDescription> cameras = [];

Future<void> main() async {
  //**** INCLUIR PARA CAMARA: Fetch the available cameras before initializing the app. ****/
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
    print(cameras);
  } on CameraException catch (e) {
    logError(e.code, e.description);
  }
  runApp(CameraApp());
}

//** INCLUIR PARA CAMARA */
void logError(String code, String? message) {
  if (message != null) {
    print('Error: $code\nError Message: $message');
  } else {
    print('Error: $code');
  }
}
