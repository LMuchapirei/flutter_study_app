import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:easy_separator/easy_separator.dart';

class QuestionScreenHolder extends StatelessWidget {
  const QuestionScreenHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var line = Container(
      width: double.infinity,
      height: 12.0,
      color: Theme.of(context).scaffoldBackgroundColor,
    );

    var answer = Container(
      width: double.infinity,
      height: 50.0,
      color: Theme.of(context).scaffoldBackgroundColor,
    );
    return Shimmer.fromColors(
        child: EasySeparatedColumn(
            children: [
              EasySeparatedColumn(
                children: [line, line, line, line],
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
              ),
              answer,
              answer,
              answer
            ],
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 20,
              );
            }),
        baseColor: Colors.white,
        highlightColor: Colors.blueGrey.withOpacity(0.5));
  }
}
