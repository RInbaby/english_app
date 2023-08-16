import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home_widget.dart';

class MenuChooseWidget extends StatefulWidget {
  const MenuChooseWidget({Key? key}) : super(key: key);

  @override
  State<MenuChooseWidget> createState() => _MenuChooseWidgetState();
}

class _MenuChooseWidgetState extends State<MenuChooseWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildItem(label: 'Gói 1'),
            _buildItem(label: 'Gói 2'),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({required String label}) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeWidget()));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child:  Text(
          label,
        ),
      ),
    );
  }
}
