


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
    image: "https://game.gtimg.cn/images/lol/act/img/skin/big22009.jpg",
    title: '寒冰射手-艾希',
  ),
  Hero(
    color: Color(0xFF7D6588),
    image: "https://game.gtimg.cn/images/lol/act/img/skin/big39006.jpg",
    title: '刀鋒舞者-艾瑞莉婭',
  ),
  Hero(
    color: Color(0xFF4C314D),
    image: "https://game.gtimg.cn/images/lol/act/img/skin/big103015.jpg",
    title: '九尾妖狐-阿狸',
  ),
];