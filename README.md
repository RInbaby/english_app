## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Local storage flutter]
- [1, SharePreference]
"Ex sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString(key, value);
  sharedPreferences.get(key);
  sharedPreferences.remove(key);"

- [2, Local database]
"database = await openDatabase( join(await getDatabasesPath(), '$tableName.db') );
  await database.insert( tableName, json );
  await database.query(tableName);"
- [3, Local File]
"final directory = await getApplicationDocumentsDirectory();
  await file.readAsString();
  await file.writeAsString(data);"
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)


# english_app

##### Load data from SharePreFerence:
 " Future<void> _loadData() async {
  final prefs = await SharedPreferences.getInstance();
  // setState(() {
  //   _questionList = List.from(jsonDecode((prefs.get("question")).toString()));
  // });
  final json = jsonDecode(prefs.get(Constants.question)!.toString());
  _questionList = (json as List).map((e) => Question.fromJson(e as Map<String, dynamic>)).toList();

  prefs.setInt(Constants.questionLength, _questionList.length);
  } "
