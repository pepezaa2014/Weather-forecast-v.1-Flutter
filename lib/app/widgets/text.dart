import 'package:flutter/cupertino.dart';
import 'package:weather_pepe/app/constant/colors.dart';

class AppbarText extends StatelessWidget {
  const AppbarText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: WidgetColor.mainText,
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: WidgetColor.mainText,
        ),
      ),
    );
  }
}

class TempText extends StatelessWidget {
  const TempText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: WidgetColor.mainText,
        ),
      ),
    );
  }
}

class StatusText extends StatelessWidget {
  const StatusText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: WidgetColor.secondaryText,
        ),
      ),
    );
  }
}

class LatLonText extends StatelessWidget {
  const LatLonText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: WidgetColor.mainText,
        ),
      ),
    );
  }
}
