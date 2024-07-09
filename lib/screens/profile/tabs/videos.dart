import 'package:flutter/material.dart';

class VideosTab extends StatelessWidget {
  const VideosTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: 16,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/dummy/v1.png',
                    ),
                    fit: BoxFit.cover)),
            child: const Center(
              child: PlayButtonCustom(),
            ),
          ),
        ),
      ),
    );
  }
}

class PlayButtonCustom extends StatelessWidget {
  const PlayButtonCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.3,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white24,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white)),
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Image.asset(
            "assets/images/logo_white.png",
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
