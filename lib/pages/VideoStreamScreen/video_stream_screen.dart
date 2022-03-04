import 'package:flutter/material.dart';

class VideoStreamScreen extends StatefulWidget {
  final String episodeId;

  const VideoStreamScreen({Key? key, required this.episodeId})
      : super(key: key);

  @override
  State<VideoStreamScreen> createState() => _VideoStreamScreenState();
}

class _VideoStreamScreenState extends State<VideoStreamScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [AppBar()],
      ),
    );
  }
}
