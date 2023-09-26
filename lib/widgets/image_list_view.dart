import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nft_market/pages/nft_screen.dart';

class ImageListView extends StatefulWidget {
  const ImageListView(
      {super.key, required this.startIndex, this.durection = 30});

  final int startIndex;

  final int durection;

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      // detect if is  at the end of list view
      if (_scrollController.position.atEdge) {
        _autoScroll();
      }
    });

    //add this to make sure that controller has been attacted to List View
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _autoScroll();
    });
  }

  _autoScroll() {
    final _currentScrollPosition = _scrollController.offset;
    final _scrollEndPosition = _scrollController.position.maxScrollExtent;

    scheduleMicrotask(() {
      _scrollController.animateTo(
        _currentScrollPosition == _scrollEndPosition ? 0 : _scrollEndPosition,
        duration: Duration(seconds: widget.durection),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 1.96 * pi,
      child: SizedBox(
        height: 130,
        child: ListView.builder(
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return _ImageTile(
                image: 'lib/assets/nfts/${widget.startIndex + index}.png');
          },
          scrollDirection: Axis.horizontal,
          itemCount: 10,
        ),
      ),
    );
  }
}

class _ImageTile extends StatelessWidget {
  const _ImageTile({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NFTScreen(
              image: image,
              number: Random().nextInt(55).toString(),
            ),
          ),
        );
      },
      child: Hero(
        tag: image,
        child: Image.asset(
          image,
          width: 130,
        ),
      ),
    );
  }
}
