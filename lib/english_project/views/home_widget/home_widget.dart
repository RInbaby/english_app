import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learnning_model_project/english_project/data/constants.dart';
import 'package:learnning_model_project/english_project/data/models/questions.dart';
import 'package:learnning_model_project/english_project/views/home_widget/setting_list_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'create_question_widget.dart';
import 'detail_question_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeScreenScreenState();
}

class _HomeScreenScreenState extends State<HomeWidget> {
  // List _questionList = [];
  List<Question> _questionList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    // setState(() {
    //   _questionList = List.from(jsonDecode((prefs.get("question")).toString()));
    // });
    final json = jsonDecode(prefs.get(Constants.question)!.toString());
    _questionList = (json as List).map((e) => Question.fromJson(e as Map<String, dynamic>)).toList();

    prefs.setInt(Constants.questionLength, _questionList.length);

  }

  @override
  Widget build(BuildContext context) {
    num listDisable = 0;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("HomePager"),
          actions: [
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const CreateQuestionWidget();
                  }));
                },
                child: const Icon(Icons.add_circle_outline)),
          ],
          leading: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SettingListItems();
                })).then((value) {
                  if (value != null) {
                    setState(() {
                      listDisable = value;
                    });
                  }
                });
              },
              child: const Icon(Icons.settings)),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              _loadData();
            });
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Questions ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                  _questionList.isNotEmpty
                      ? Column(
                          children: [
                            Text("Số lượng câu hỏi ${_questionList.length}"),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _questionList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: _itemQuestion(
                                      _questionList[listDisable == 1 ? Random().nextInt(_questionList.length) : index],
                                      index),
                                  // child: _itemQuestion(_questionList[Random().nextInt(_questionList.length)], index),
                                );
                              },
                            ),
                          ],
                        )
                      : const SizedBox(
                          child: Text("Không có dữ liệu nào, vui lòng thêm mới để hiển thị!"),
                        ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _itemQuestion(Question questionItem, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailQuestionWidget(
            indexQuestion: index,
            questionItem: questionItem,
          );
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.black, spreadRadius: 1),
          ],
        ),
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            const Icon(
              Icons.question_answer,
              color: Color(0xFF52AB78),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Câu hỏi số ${index + 1}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Text(questionItem.question ?? ''),
              ],
            ),
            const Spacer(),
            const Icon(Icons.navigate_next_outlined),
          ],
        ),
      ),
    );
  }
}
