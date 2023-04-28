import 'package:flutter/material.dart';
import 'package:weather_pepe/app/constant/colors.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BlurryContainer(
        blur: 5,
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }
}
