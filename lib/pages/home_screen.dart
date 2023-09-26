import 'package:flutter/material.dart';
import 'package:nft_market/widgets/image_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff010101),
      body: Stack(
        children: [
          Positioned.fill(
              child: ShaderMask(
            blendMode: BlendMode.dstOut,
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.9),
                  Colors.black,
                ],
                stops: const [0, 0.62, 0.67, 0.85, 1],
              ).createShader(rect);
            },
            child: SingleChildScrollView(
              child: Column(
                children: const <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  ImageListView(
                    startIndex: 1,
                    durection: 25,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ImageListView(
                    startIndex: 11,
                    durection: 45,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ImageListView(
                    startIndex: 21,
                    durection: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ImageListView(
                    startIndex: 31,
                    durection: 60,
                  ),
                ],
              ),
            ),
          )),
          Positioned(
            bottom: 19,
            left: 24,
            right: 24,
            child: Container(
              height: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'NFT Market',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Buy Your Dream',
                    style: TextStyle(
                        color: Colors.white70, height: 1.2, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Spacer(),
                  Container(
                    width: 140,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xff3000ff),
                    ),
                    child: const Text(
                      "Туту",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
