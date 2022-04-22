class DatabaseService {
  static DatabaseService _databaseServices = DatabaseService._();

  static const String databaseName = "database_name.db";
  static const int version = 1;



 factory DatabaseService.getInstance() {
    return _databaseServices;
  }

  DatabaseService._();



}