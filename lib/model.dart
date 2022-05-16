


import 'package:flutter/material.dart';

class Hero {
  final Color color;
  final String image;
  final String title;

  Hero({
    required this.color,
    required this.image,
    required this.title,
  });
}

List heroes = [
  Hero(
    color: Color(0xFF86F3FB),
    image: "https://images.unsplash.com/photo-1652636373308-31e97c10f6ac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1615&q=80",
    title: '圖一',
  ),
  Hero(
    color: Color(0xFF7D6588),
    image: "https://images.unsplash.com/photo-1652529629322-a0019cc0907e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    title: '圖二',
  ),
  Hero(
    color: Color(0xFF4C314D),
    image: "https://images.unsplash.com/photo-1652631631001-78de1939bee8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    title: '圖三',
  ),
];