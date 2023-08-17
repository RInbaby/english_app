import 'package:flutter/material.dart';

import '../../data/setting_ext.dart';

class SettingListItems extends StatefulWidget {
  const SettingListItems({Key? key}) : super(key: key);

  @override
  State<SettingListItems> createState() => _SettingListItemsState();
}

class _SettingListItemsState extends State<SettingListItems> {
  num chooseIndex = -1;

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
        child: _buildBody(),
      ),
    );
  }
  Widget _buildBody(){
    return  Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            ListView.builder(
                itemCount: SettingQuestion.values.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      setState(() {
                        chooseIndex = index;
                      });
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
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Text(SettingQuestion.values[index].nameDisplay,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                          const Spacer(),
                          if (chooseIndex == index)
                            const Icon(
                              Icons.check,
                              color: Color(0xFF5eaa02),
                            ),
                        ],
                      ),
                    ),
                  );
                }),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                color: Color(0xFF5eaa02),
              ),
              child: InkWell(
                onTap: () {
                  if (chooseIndex != -1) {
                    Navigator.pop(context, chooseIndex);
                  } else {
                    Navigator.pop(context, 0);
                  }
                },
                child: const Text(
                  "Lưu",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
