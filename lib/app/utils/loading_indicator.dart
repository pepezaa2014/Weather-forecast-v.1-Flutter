import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    required this.loading,
  });

  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: loading,
      child: Positioned.fill(
        child: Container(
          color: Colors.white70,
          child: Center(
            child: Platform.isAndroid
                ? Container(
                    width: 100,
                    height: 80,
                    color: Colors.grey,
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Loading...',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SpinKitCircle(
                          color: Colors.amberAccent,
                          size: 36,
                        ),
                      ],
                    ),
                  )
                : const CupertinoActivityIndicator(radius: 16),
          ),
        ),
      ),
    );
  }
}
