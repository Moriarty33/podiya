import 'package:flutter/material.dart';

///colors
const Color primaryColor = Color.fromARGB(255, 40, 75, 150);

const TextStyle EventNameMainPageStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    shadows: [
      Shadow(
        blurRadius: 16,
        color: Colors.white70,
        offset: Offset(1.0, 1.0),
      ),
    ]);
const TextStyle EventDateMainPageStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.normal,
    fontSize: 11,
    shadows: [
      Shadow(
        blurRadius: 16,
        color: Colors.white,
        offset: Offset(0.0, 0.0),
      ),
    ]);

const TextStyle HeaderStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 22,
    letterSpacing: 0.35);
const TextStyle AgentTabStyle =
    TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 13);
const TextStyle AgentTabSelectedStyle =
    TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18);
