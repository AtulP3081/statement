import 'package:shared_preferences/shared_preferences.dart';
import 'package:statement/Statement.dart';

void saveStatement(Statement statement) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> statements = prefs.getStringList('statements') ?? [];
  // Serialize and save your statement data here
  prefs.setStringList('statements', statements);
}

void loadStatements() async {
  final prefs = await SharedPreferences.getInstance();
  List<String> statements = prefs.getStringList('statements') ?? [];
  // Deserialize and load your statement data here
}
