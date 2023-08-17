enum SettingQuestion { defaultList, randomList }

extension SettingQuestionExt on SettingQuestion {
  String get nameDisplay {
    switch (this) {
      case SettingQuestion.defaultList:
        return "Mặc định";
      case SettingQuestion.randomList:
        return "Sắp xếp theo độ khó";
    }
  }
  int get getId{
    switch (this) {
      case SettingQuestion.defaultList:
        return 0;
      case SettingQuestion.randomList:
        return 1;
    }
  }

}
