import 'package:flutter/material.dart';

import 'model.dart';

class Day17 extends StatefulWidget {
  const Day17({super.key, required this.title});

  final String title;

  @override
  State<Day17> createState() => _Day17State();
}

class _Day17State extends State<Day17> {
  int _pageIndex = 1;

  final PageController _pageController = PageController(
    initialPage: 1,
    // 顯示其他頁面
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
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                const Radius.circular(12.0),
              ),
              child: Image.network(
                heroes[index].image,
                fit: BoxFit.cover,
              ),
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
