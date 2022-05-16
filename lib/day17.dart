import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'model.dart';

class Day17 extends StatefulWidget {
  const Day17({super.key, required this.title});

  final String title;

  @override
  State<Day17> createState() => _Day17State();
}

class _Day17State extends State<Day17> {
  int _pageIndex = 0;

  final PageController _pageController = PageController(
    initialPage: 0,
    // viewportFraction: 是否撐滿 (default: 1.0)
    viewportFraction: 0.8,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 580.0,
            child: PageView.builder(
              itemCount: 3,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _pageIndex = index;
                });
              },
              itemBuilder: (BuildContext ctx, int index) {
                return _buildItem(_pageIndex, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  _buildItem(activeIndex, index) {
    return Center(
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
        height: activeIndex == index ? 500.0 : 450.0,
        margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: heroes[index].color,
          borderRadius: const BorderRadius.all(const Radius.circular(12.0)),
        ),
        // Stack 堆疊
        // 技巧用 Stack 把 圖片跟文字區塊堆疊
        // 文字區塊用 Align 定位在下方
        // 用 Expanded 撐滿 Row
        // stack
        // |- image
        // |- Align
        //    |- Row
        //       |- Expanded
        //          |- Text
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                const Radius.circular(12.0),
              ),
              child: CachedNetworkImage(
                imageUrl: heroes[index].image,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              ),
              // child: Image.network(
              //   heroes[index].image,
              //   fit: BoxFit.cover,
              // ),
            ),
            // Align 相對定位
            //
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: <Widget>[
                  // 用 Expanded 把 Row 撐滿
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: const BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12.0),
                          bottomLeft: Radius.circular(12.0),
                        ),
                      ),
                      child: Text(
                        heroes[index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
