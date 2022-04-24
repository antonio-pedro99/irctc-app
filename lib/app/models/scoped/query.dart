import 'package:flutter/cupertino.dart';
import 'package:irctc_dbms/app/models/scoped/user.dart';
import 'package:irctc_dbms/app/models/search_query.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';

class QueryModel extends Model {
  UserModel? userModel;
  Query? currentQuery;
  
  static QueryModel of(BuildContext context) =>
      ScopedModel.of<QueryModel>(context);

  QueryModel({this.userModel, this.currentQuery});

  void setQuery(Query query) {
    currentQuery = query;

    notifyListeners();
  }

  Query? get query => currentQuery;
}
