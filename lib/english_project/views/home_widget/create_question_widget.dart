import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/constants.dart';
import '../../data/models/questions.dart';

class CreateQuestionWidget extends StatefulWidget {
  const CreateQuestionWidget({Key? key}) : super(key: key);

  @override
  State<CreateQuestionWidget> createState() => _CreateQuestionWidgetState();
}

class _CreateQuestionWidgetState extends State<CreateQuestionWidget> {
  List<Question> _questionList = [];
  late int lengthListQuestion;

  @override
  void initState() {
    _loadData();
    lengthListQuestion = 1;
    super.initState();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final json = jsonDecode(prefs.get("question")!.toString());

    _questionList = (json as List).map((e) => Question.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController question = TextEditingController();
    TextEditingController answer1 = TextEditingController();
    TextEditingController answer2 = TextEditingController();
    TextEditingController correct = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Create Question"),
        actions: [
          InkWell(
              onTap: () async {
                final _sharedPreferences = await SharedPreferences.getInstance();

                Question _questionObject = Question(
                    question: question.text,
                    answers: [answer1.text, answer2.text],
                    correctIndex: int.parse(correct.text),
                    id: Random().nextInt(99999));
                _questionList.add(_questionObject);
                String questionEncode = jsonEncode(_questionList);

                _sharedPreferences.setString(Constants.question, questionEncode);
              },
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  "Lưu  ",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
                ),
              )),
        ],
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_sharp)),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: _buildBodyView(question, answer1, answer2, correct),
      ),
    );
  }

  Widget _buildBodyView(TextEditingController question, answer1, answer2, correct) {
    return Column(
      children: [
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: lengthListQuestion,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              // @TODO: check controller cac cau hoi khac nhau
              return _buildBodyQuestion(question, answer1, answer2, correct);
            }),
        InkWell(
            onTap: () {
              setState(() {
                lengthListQuestion++;
              });
            },
            child: const Icon(Icons.add_circle)),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }

  Widget _buildBodyQuestion(TextEditingController question, answer1, answer2, correct) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
        boxShadow: const [
          BoxShadow(color: Colors.black, spreadRadius: 1),
        ],
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: question,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your question',
            ),
            maxLines: 6,
          ),
          const SizedBox(
            height: 50,
          ),
          ListView(
            cacheExtent: 40,
            shrinkWrap: true,
            children: [
              TextFormField(
                controller: answer1,
                decoration: const InputDecoration(
                  hintText: "Your Answer",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
                maxLines: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: answer2,
                decoration: const InputDecoration(
                  hintText: "Your Answer",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
                maxLines: 1,
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: correct,
            decoration: const InputDecoration(
              hintText: "Correct Key",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.lightGreen),
              ),
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
