import 'package:flutter/material.dart';


class MachineLearningScreen extends StatefulWidget {
  const MachineLearningScreen({Key? key}) : super(key: key);

  @override
  State<MachineLearningScreen> createState() => _MachineLearningState();
}

class _MachineLearningState extends State<MachineLearningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        children: [
          _buildTitle()
        ],
      )),
    );
  }
  Widget _buildTitle(){
    return const Text("Xin chào anh chị xinh đẹp đang xem!!!! ");
  }
}
