import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learnning_model_project/english_project/data/models/questions.dart';

class DetailQuestionWidget extends StatefulWidget {
  const DetailQuestionWidget({Key? key, required this.indexQuestion, required this.questionItem}) : super(key: key);

  final int indexQuestion;
  final Question questionItem;

  @override
  State<DetailQuestionWidget> createState() => _DetailQuestionWidgetState();
}

class _DetailQuestionWidgetState extends State<DetailQuestionWidget> {
  bool isCheckKey = false;
  num indexCheck = 0;
  List<Icon> iconList = [
    const Icon(Icons.account_balance, size: 50, color: Colors.white),
    const Icon(Icons.adb, size: 50, color: Colors.white),
    const Icon(Icons.add_chart, size: 50, color: Colors.white),
    const Icon(Icons.pedal_bike_rounded, size: 50, color: Colors.white),
  ];
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About this Question"),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_sharp)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF007AFF),
                boxShadow: const [
                  BoxShadow(color: Colors.blueAccent, spreadRadius: 1),
                ],
              ),
              child: Column(
                children: [
                  iconList[random.nextInt(iconList.length)],
                  Text(
                    '\n \n Câu hỏi số ${(widget.indexQuestion + 1)}: \n',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Text(
                    ' ${widget.questionItem.question}\n ',
                    style: const TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
            ListView.builder(
              itemCount: widget.questionItem.answers.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                num correctKey = widget.questionItem.correctIndex;
                return InkWell(
                  onTap: () async {
                    setState(() {
                      indexCheck = 1;
                    });
                    if (correctKey == index) {
                      setState(() {
                        isCheckKey = true;
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: _buildAnswer(index),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 12,
            ),
            indexCheck == 1 && !isCheckKey ? _buildResultInCorrect() : const SizedBox(),
            isCheckKey ? _buildResultCorrect() : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswer(int index) {
    return Container(
      width: (MediaQuery.of(context).size.width * 0.8) / 2,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFF26371),
        boxShadow: const [
          BoxShadow(color: Colors.redAccent, spreadRadius: 1),
        ],
      ),
      child: Align(alignment: Alignment.center, child: Text(widget.questionItem.answers[index])),
    );
  }

  Widget _buildResultCorrect() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.check,
          color: Color(0xFF52AB78),
        ),
        // isCheckResult?
        Text("  DONE"),
      ],
    );
  }

  Widget _buildResultInCorrect() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.cancel,
          color: Color(0xFFbf302a),
        ),
        // isCheckResult?
        Text("  Failed"),
      ],
    );
  }
}
