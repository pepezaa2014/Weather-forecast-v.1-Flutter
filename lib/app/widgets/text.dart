import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_pepe/app/constant/colors.dart';

class SearchText extends StatelessWidget {
  const SearchText({
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
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

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

class TitleTextDay extends StatelessWidget {
  const TitleTextDay({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

class TitleTextNight extends StatelessWidget {
  const TitleTextNight({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

class MainInformation extends StatelessWidget {
  const MainInformation({
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

class HeadInformation extends StatelessWidget {
  const HeadInformation({
    super.key,
    required this.text,
    required this.img,
  });

  final String text;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset(
                img,
                width: 20,
                height: 20,
                color: Colors.white,
              ),
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: WidgetColor.mainText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsInformation extends StatelessWidget {
  const DetailsInformation({
    super.key,
    required this.text,
    required this.unit,
  });

  final String text;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        textAlign: TextAlign.center,
        text + ' ' + unit,
        style: const TextStyle(
          fontSize: 16,
          color: WidgetColor.mainText,
        ),
      ),
    );
  }
}

class DateTime extends StatelessWidget {
  const DateTime({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: const TextStyle(
          fontSize: 16,
          color: WidgetColor.mainText,
        ),
      ),
    );
  }
}

class CountryDay extends StatelessWidget {
  const CountryDay({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

class CountryNight extends StatelessWidget {
  const CountryNight({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
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

class TempTextDay extends StatelessWidget {
  const TempTextDay({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: Text(
        text + '°',
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

class TempTextNight extends StatelessWidget {
  const TempTextNight({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: Text(
        text + '°',
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: WidgetColor.mainText,
        ),
      ),
    );
  }
}

class HighLowTempTextDay extends StatelessWidget {
  const HighLowTempTextDay({
    super.key,
    required this.high,
    required this.low,
  });

  final String high;
  final String low;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        'H:' + high + '°  L:' + low + '°',
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

class HighLowTempTextNight extends StatelessWidget {
  const HighLowTempTextNight({
    super.key,
    required this.high,
    required this.low,
  });

  final String high;
  final String low;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        'H:' + high + '°  L:' + low + '°',
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: WidgetColor.mainText,
        ),
      ),
    );
  }
}

class StatusTextDay extends StatelessWidget {
  const StatusTextDay({
    super.key,
    required this.text,
    // required this.img,
  });

  final String text;
  // final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(right: 8),
            //   child: Image.asset(
            //     img,
            //     width: 20,
            //     height: 20,
            //     color: Colors.white,
            //   ),
            // ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: WidgetColor.mainText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// child: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(right: 8),
//               child: Image.asset(
//                 img,
//                 width: 20,
//                 height: 20,
//                 color: Colors.white,
//               ),
//             ),
//             Text(
//               text,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: WidgetColor.mainText,
//               ),
//             ),
//           ],
//         ),
//       ),

class StatusTextNight extends StatelessWidget {
  const StatusTextNight({
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
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: WidgetColor.secondaryText,
        ),
      ),
    );
  }
}

class LatLonTextDay extends StatelessWidget {
  const LatLonTextDay({
    super.key,
    required this.lat,
    required this.lon,
  });

  final String lat;
  final String lon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        'Lat:' + lat + '  Lon:' + lon,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

class LatLonTextNight extends StatelessWidget {
  const LatLonTextNight({
    super.key,
    required this.lat,
    required this.lon,
  });

  final String lat;
  final String lon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        'Lat:' + lat + '  Lon:' + lon,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: WidgetColor.mainText,
        ),
      ),
    );
  }
}

class SearchLatLonText extends StatelessWidget {
  const SearchLatLonText({
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
