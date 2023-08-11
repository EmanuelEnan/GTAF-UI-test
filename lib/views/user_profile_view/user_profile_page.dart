import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:github_issue_tracker/data/repositories/user_profile_repo.dart';
import 'package:github_issue_tracker/utils/constants.dart';

import 'package:github_issue_tracker/widgets/text_style.dart';

import '../../data/models/github_user_model.dart';

final userProfileFutureProvider =
    FutureProvider.autoDispose.family<GithubUserModel, String>((ref, id) async {
  final apiService = ref.watch(userProfileProvider);
  return apiService.getUser(id);
});

class UserProfilePage extends ConsumerWidget {
  final String name;
  const UserProfilePage({super.key, required this.name});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commitRef = ref.watch(
      userProfileFutureProvider(name),
    );
    return Scaffold(
      backgroundColor: baseColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                commitRef.when(
                  data: (data) {
                    return Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Image.network(
                              data.avatarUrl!,
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 15),
                          titleText(data.name!),
                          subTitleText('@+${data.login!}'),
                          const SizedBox(height: 15),
                          Text(
                            'Bio: ${data.bio!}',
                            style: const TextStyle(color: textColor),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Public Repos: ${data.publicRepos!}',
                            style: const TextStyle(color: textColor),
                          ),
                          Text(
                            'Public Gists: ${data.publicGists}',
                            style: const TextStyle(color: textColor),
                          ),
                        ],
                      ),
                    ));
                  },
                  error: (error, _) {
                    return const Center(
                      child: Text(
                        'Please hold on..',
                        style: TextStyle(color: textColor),
                      ),
                    );
                  },
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
