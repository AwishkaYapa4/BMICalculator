import 'package:flutter/material.dart';

const kTileColor = const Color.fromARGB(255, 35, 48, 54);
const kSelectedTileColor = Color.fromARGB(255, 117, 77, 77);
const kUnselectedTileColor = Color.fromARGB(255, 88, 78, 78);
const kTileBorderColor = Color(0xFF9E9E9E);

var kTileBorderDecoration = BoxDecoration(
  color: kTileColor,
  borderRadius: BorderRadius.circular(10),
);

var kSelectedTileBorderDecoration = BoxDecoration(
  color: kSelectedTileColor,
  borderRadius: BorderRadius.circular(10),
);
