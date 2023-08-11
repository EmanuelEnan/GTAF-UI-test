import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/constants.dart';
import '../models/git_commit_model.dart';

final gitCommitProvider = Provider<GithubRepo>(
  (ref) => GithubRepo(),
);

class GithubRepo {
  Future<GitCommitModel> getGithubCommit() async {
    final result = await Dio().get('$apiBaseUrl/search/commits?q=flutter');

    late GitCommitModel githubUser;

    if (result.statusCode == 200) {
      print(result.data);
      // final resp = result.data;
      // List service = (jsonDecode(resp) as List<dynamic>);
      // githubUser =
      //     service.map((json) => GitCommitModel.fromJson(json)).toList();
      githubUser = GitCommitModel.fromJson(result.data);
    }
    return githubUser;
  }
}
