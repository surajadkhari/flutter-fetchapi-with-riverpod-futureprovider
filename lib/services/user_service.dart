import 'dart:convert';
import 'dart:io';

import 'package:api_future/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class ApiService {
  String endpoint = 'https://reqres.in/api/users?page=2';

  Future<List<UserModel>> getUser() async {
    try {
      Response response = await get(Uri.parse(endpoint));
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body)['data'];
        return result.map(((e) => UserModel.fromJson(e))).toList();
      } else {
        throw Exception(response.reasonPhrase);
      }
    } on SocketException catch (errs) {
      throw Exception('No  internet connection');
    }
  }
}

//API SERVICE Provider
final apiProvider = Provider<ApiService>((ref) => ApiService());
