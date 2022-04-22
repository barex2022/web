
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _sharedPreferencesService = SharedPreferencesService._();
  SharedPreferences? _sharedPreferences;

  SharedPreferences? get sharedPreferences => _sharedPreferences;

  static SharedPreferencesService getInstance(){
    return _sharedPreferencesService;
  }
  SharedPreferencesService._(){
    checkIfInitialized();
  }

  Future<void> checkIfInitialized() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }


}
