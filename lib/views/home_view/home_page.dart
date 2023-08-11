import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_issue_tracker/data/repositories/github_repo.dart';
import 'package:github_issue_tracker/utils/constants.dart';

import 'package:github_issue_tracker/views/user_profile_view/user_profile_page.dart';
import 'package:github_issue_tracker/widgets/showing_time.dart';
import 'package:github_issue_tracker/widgets/text_style.dart';

import '../../data/models/git_commit_model.dart';

final gitCommitFutureProvider =
    FutureProvider.autoDispose<GitCommitModel>((ref) async {
  final apiService = ref.watch(gitCommitProvider);
  return apiService.getGithubCommit();
});

var indexProvider = StateProvider<int>((ref) => 0);

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commitRef = ref.watch(
      gitCommitFutureProvider,
    );

    final selectedIndex = ref.watch(indexProvider);
    return Scaffold(
      backgroundColor: baseColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black54,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.lightBlue.withOpacity(.4),
        onTap: (index) {
          ref.read(indexProvider.notifier).state = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree),
            label: 'Commit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'User Profile',
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const Text(
                      'Flutter Commit List',
                      style: TextStyle(color: textColor),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white24),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          'master',
                          style: TextStyle(color: textColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              commitRef.when(
                data: (data) {
                  return Expanded(
                    child: ListView.separated(
                      itemCount: data.items!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  titleText(
                                      data.items![index].repository!.name!),
                                  dateText(
                                    ShowingTime.extractClockTime(data
                                        .items![index]
                                        .commit!
                                        .authorInfo!
                                        .date!),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.pushNamed(context, '/settings');

                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => UserProfilePage(
                                          name: data.items![index].author!.login!),
                                    ),
                                  );
                                  ref.read(indexProvider.notifier).state = 1;
                                },
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        data.items![index].repository!.owner!
                                            .avatarUrl!,
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    subTitleText(data.items![index].commit!
                                        .authorInfo!.name!),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                    ),
                  );
                },
                error: (error, _) {
                  return const Center(
                    child: Text('Please hold on..'),
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
    );
  }
}
