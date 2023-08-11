import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_issue_tracker/data/models/github_user_model.dart';

import '../../utils/constants.dart';

final userProfileProvider = Provider<UserProfileRepo>(
  (ref) => UserProfileRepo(),
);

class UserProfileRepo {
  Future<GithubUserModel> getUser(String name) async {
    final result = await Dio().get('$apiBaseUrl/users/$name');

    late GithubUserModel githubUser;

    if (result.statusCode == 200) {
      print(result.data);
      githubUser = GithubUserModel.fromMap(result.data);
    }

    return githubUser;
  }
}
