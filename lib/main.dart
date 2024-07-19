// import 'package:clay_containers/clay_containers.dart';
import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

// 开始加载
void main() => runApp(
      // MaterialApp 类
      const MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );

// 主页
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // 有状态组件
  @override
  State<HomePage> createState() => _HomePageState();
}

// 主页状态
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      // 背景
      Positioned.fill(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage('assets/img/wallpaper/puregirl1.png'), // 你的背景图片路径
              fit: BoxFit.cover, // 使背景图片覆盖全屏
            ),
          ),
        ),
      ),
      // 内容
      SafeArea(
        //安全区
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 8,
            ),
            HomeCard(text: "Hi!"),
            HomeCard(text: "Hi!"),
            HomeCard(
              text: "您好！",
              big: true,
            ),
          ],
        ),
      )
    ]);
  }
}

// 主页卡片
class HomeCard extends StatelessWidget {
  String text;
  bool? big;
  double cardRadius = 16;
  HomeCard({
    super.key,
    required this.text,
    this.big,
  });

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.9;
    double cardHeight = big == true ? cardWidth * 1.23 : 100;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {},
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
              child: Card(
                color: Colors.white.withOpacity(0.5),
                elevation: 0,
                shape: ContinuousRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(cardRadius), // 设置圆角半径为cardRadius
                ),
                shadowColor: Colors.black.withOpacity(1),
                child: SizedBox(
                  width: cardWidth,
                  height: cardHeight,
                  child: Center(
                    child: Text(
                      text,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
