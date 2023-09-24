import 'package:flutter/material.dart';

import 'data/summary.dart';

// ignore: must_be_immutable
class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({required this.listData, super.key});

  final List<Map<String, Object>> listData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...listData
                .map((data) => Summary(
                      summaryData: data,
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}
