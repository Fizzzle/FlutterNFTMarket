import 'package:flutter/material.dart';
import 'package:nft_market/widgets/blur_container.dart';

import '../widgets/fade_animation.dart';

class NFTScreen extends StatelessWidget {
  const NFTScreen({super.key, required this.image, required this.number});

  final String image;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(
                tag: image,
                child: Image.asset(image),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: FadeAnimation(
                  intervalEnd: 0.1,
                  child: BlurContainer(
                    child: Container(
                      width: 160,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.1),
                      ),
                      child: Text(
                        "Digital NFT",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FadeAnimation(
              intervalStart: 0.3,
              child: Text(
                "Monkey #$number",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FadeAnimation(
              intervalStart: 0.35,
              child: Text(
                "Owned by Gennary",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FadeAnimation(
              intervalStart: 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _InfoTile(title: "3d 5h 23", subtitle: "Remaining Time"),
                  _InfoTile(title: "16.7 SOL", subtitle: "Highest Bid"),
                ],
              ),
            ),
          ),
          const Spacer(),
          FadeAnimation(
            intervalStart: 0.55,
            child: Container(
              width: double.infinity,
              height: 40,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff3000ff),
              ),
              child: FadeAnimation(
                intervalStart: 0.6,
                child: Text(
                  'Place Bid',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.white30,
          ),
        ),
      ],
    );
  }
}
