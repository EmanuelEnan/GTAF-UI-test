class GitCommitModel {
  int? totalCount;
  bool? incompleteResults;
  List<Items>? items;

  GitCommitModel({this.totalCount, this.incompleteResults, this.items});

  GitCommitModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    incompleteResults = json['incomplete_results'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    } else {}
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_count'] = totalCount;
    data['incomplete_results'] = incompleteResults;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? url;
  String? sha;
  String? nodeId;
  String? htmlUrl;
  String? commentsUrl;
  Commit? commit;
  Author? author;

  List<Parents>? parents;
  Repository? repository;
  int? score;

  Items(
      {this.url,
      this.sha,
      this.nodeId,
      this.htmlUrl,
      this.commentsUrl,
      this.commit,
      this.author,
      this.parents,
      this.repository,
      this.score});

  Items.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    sha = json['sha'];
    nodeId = json['node_id'];
    htmlUrl = json['html_url'];
    commentsUrl = json['comments_url'];
    commit = json['commit'] != null ? Commit.fromJson(json['commit']) : null;
    author = json['author'] != null ? Author.fromJson(json['author']) : null;

    if (json['parents'] != null) {
      parents = <Parents>[];
      json['parents'].forEach((v) {
        parents!.add(Parents.fromJson(v));
      });
    }
    repository = json['repository'] != null
        ? Repository.fromJson(json['repository'])
        : null;
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['sha'] = sha;
    data['node_id'] = nodeId;
    data['html_url'] = htmlUrl;
    data['comments_url'] = commentsUrl;
    if (commit != null) {
      data['commit'] = commit!.toJson();
    }
    if (author != null) {
      data['author'] = author!.toJson();
    }

    if (parents != null) {
      data['parents'] = parents!.map((v) => v.toJson()).toList();
    }
    if (repository != null) {
      data['repository'] = repository!.toJson();
    }
    data['score'] = score;
    return data;
  }
}

class Commit {
  String? url;
  AuthorInfo? authorInfo;
  Author? committer;
  String? message;
  Tree? tree;
  int? commentCount;

  Commit(
      {this.url,
      this.authorInfo,
      this.committer,
      this.message,
      this.tree,
      this.commentCount});

  Commit.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    authorInfo =
        json['author'] != null ? AuthorInfo.fromJson(json['author']) : null;
    committer =
        json['committer'] != null ? Author.fromJson(json['committer']) : null;
    message = json['message'] ?? '';
    tree = json['tree'] != null ? Tree.fromJson(json['tree']) : null;
    commentCount = json['comment_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    if (authorInfo != null) {
      data['author'] = authorInfo!.toJson();
    }
    if (committer != null) {
      data['committer'] = committer!.toJson();
    }
    data['message'] = message;
    if (tree != null) {
      data['tree'] = tree!.toJson();
    }
    data['comment_count'] = commentCount;
    return data;
  }
}

class AuthorInfo {
  String? date;
  String? name;
  String? email;

  AuthorInfo({this.date, this.name, this.email});

  AuthorInfo.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}

class Tree {
  String? url;
  String? sha;

  Tree({this.url, this.sha});

  Tree.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    sha = json['sha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['sha'] = sha;
    return data;
  }
}

class Author {
  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  bool? siteAdmin;

  Author(
      {this.login,
      this.id,
      this.nodeId,
      this.avatarUrl,
      this.gravatarId,
      this.url,
      this.htmlUrl,
      this.followersUrl,
      this.followingUrl,
      this.gistsUrl,
      this.starredUrl,
      this.subscriptionsUrl,
      this.organizationsUrl,
      this.reposUrl,
      this.eventsUrl,
      this.receivedEventsUrl,
      this.type,
      this.siteAdmin});

  Author.fromJson(Map<String, dynamic> json) {
    login = json['login'] ?? 'no data';
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'] ??
        'https://unsplash.com/photos/a-mountain-with-a-waterfall-in-front-of-it-hSVtj56lG9g';
    gravatarId = json['gravatar_id'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login;
    data['id'] = id;
    data['node_id'] = nodeId;
    data['avatar_url'] = avatarUrl;
    data['gravatar_id'] = gravatarId;
    data['url'] = url;
    data['html_url'] = htmlUrl;
    data['followers_url'] = followersUrl;
    data['following_url'] = followingUrl;
    data['gists_url'] = gistsUrl;
    data['starred_url'] = starredUrl;
    data['subscriptions_url'] = subscriptionsUrl;
    data['organizations_url'] = organizationsUrl;
    data['repos_url'] = reposUrl;
    data['events_url'] = eventsUrl;
    data['received_events_url'] = receivedEventsUrl;
    data['type'] = type;
    data['site_admin'] = siteAdmin;
    return data;
  }
}

class Parents {
  String? url;
  String? htmlUrl;
  String? sha;

  Parents({this.url, this.htmlUrl, this.sha});

  Parents.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    htmlUrl = json['html_url'];
    sha = json['sha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['html_url'] = htmlUrl;
    data['sha'] = sha;
    return data;
  }
}

class Repository {
  int? id;
  String? nodeId;
  String? name;
  String? fullName;
  bool? private;
  Author? owner;
  String? htmlUrl;
  String? description;
  bool? fork;
  String? url;
  String? forksUrl;
  String? keysUrl;
  String? collaboratorsUrl;
  String? teamsUrl;
  String? hooksUrl;
  String? issueEventsUrl;
  String? eventsUrl;
  String? assigneesUrl;
  String? branchesUrl;
  String? tagsUrl;
  String? blobsUrl;
  String? gitTagsUrl;
  String? gitRefsUrl;
  String? treesUrl;
  String? statusesUrl;
  String? languagesUrl;
  String? stargazersUrl;
  String? contributorsUrl;
  String? subscribersUrl;
  String? subscriptionUrl;
  String? commitsUrl;
  String? gitCommitsUrl;
  String? commentsUrl;
  String? issueCommentUrl;
  String? contentsUrl;
  String? compareUrl;
  String? mergesUrl;
  String? archiveUrl;
  String? downloadsUrl;
  String? issuesUrl;
  String? pullsUrl;
  String? milestonesUrl;
  String? notificationsUrl;
  String? labelsUrl;
  String? releasesUrl;
  String? deploymentsUrl;

  Repository(
      {this.id,
      this.nodeId,
      this.name,
      this.fullName,
      this.private,
      this.owner,
      this.htmlUrl,
      this.description,
      this.fork,
      this.url,
      this.forksUrl,
      this.keysUrl,
      this.collaboratorsUrl,
      this.teamsUrl,
      this.hooksUrl,
      this.issueEventsUrl,
      this.eventsUrl,
      this.assigneesUrl,
      this.branchesUrl,
      this.tagsUrl,
      this.blobsUrl,
      this.gitTagsUrl,
      this.gitRefsUrl,
      this.treesUrl,
      this.statusesUrl,
      this.languagesUrl,
      this.stargazersUrl,
      this.contributorsUrl,
      this.subscribersUrl,
      this.subscriptionUrl,
      this.commitsUrl,
      this.gitCommitsUrl,
      this.commentsUrl,
      this.issueCommentUrl,
      this.contentsUrl,
      this.compareUrl,
      this.mergesUrl,
      this.archiveUrl,
      this.downloadsUrl,
      this.issuesUrl,
      this.pullsUrl,
      this.milestonesUrl,
      this.notificationsUrl,
      this.labelsUrl,
      this.releasesUrl,
      this.deploymentsUrl});

  Repository.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    name = json['name'];
    fullName = json['full_name'];
    private = json['private'];
    owner = json['owner'] != null ? Author.fromJson(json['owner']) : null;
    htmlUrl = json['html_url'];
    description = json['description'] ?? '';
    fork = json['fork'];
    url = json['url'];
    forksUrl = json['forks_url'];
    keysUrl = json['keys_url'];
    collaboratorsUrl = json['collaborators_url'];
    teamsUrl = json['teams_url'];
    hooksUrl = json['hooks_url'];
    issueEventsUrl = json['issue_events_url'];
    eventsUrl = json['events_url'];
    assigneesUrl = json['assignees_url'];
    branchesUrl = json['branches_url'];
    tagsUrl = json['tags_url'];
    blobsUrl = json['blobs_url'];
    gitTagsUrl = json['git_tags_url'];
    gitRefsUrl = json['git_refs_url'];
    treesUrl = json['trees_url'];
    statusesUrl = json['statuses_url'];
    languagesUrl = json['languages_url'];
    stargazersUrl = json['stargazers_url'];
    contributorsUrl = json['contributors_url'];
    subscribersUrl = json['subscribers_url'];
    subscriptionUrl = json['subscription_url'];
    commitsUrl = json['commits_url'];
    gitCommitsUrl = json['git_commits_url'];
    commentsUrl = json['comments_url'];
    issueCommentUrl = json['issue_comment_url'];
    contentsUrl = json['contents_url'];
    compareUrl = json['compare_url'];
    mergesUrl = json['merges_url'];
    archiveUrl = json['archive_url'];
    downloadsUrl = json['downloads_url'];
    issuesUrl = json['issues_url'];
    pullsUrl = json['pulls_url'];
    milestonesUrl = json['milestones_url'];
    notificationsUrl = json['notifications_url'];
    labelsUrl = json['labels_url'];
    releasesUrl = json['releases_url'];
    deploymentsUrl = json['deployments_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['node_id'] = nodeId;
    data['name'] = name;
    data['full_name'] = fullName;
    data['private'] = private;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    data['html_url'] = htmlUrl;
    data['description'] = description;
    data['fork'] = fork;
    data['url'] = url;
    data['forks_url'] = forksUrl;
    data['keys_url'] = keysUrl;
    data['collaborators_url'] = collaboratorsUrl;
    data['teams_url'] = teamsUrl;
    data['hooks_url'] = hooksUrl;
    data['issue_events_url'] = issueEventsUrl;
    data['events_url'] = eventsUrl;
    data['assignees_url'] = assigneesUrl;
    data['branches_url'] = branchesUrl;
    data['tags_url'] = tagsUrl;
    data['blobs_url'] = blobsUrl;
    data['git_tags_url'] = gitTagsUrl;
    data['git_refs_url'] = gitRefsUrl;
    data['trees_url'] = treesUrl;
    data['statuses_url'] = statusesUrl;
    data['languages_url'] = languagesUrl;
    data['stargazers_url'] = stargazersUrl;
    data['contributors_url'] = contributorsUrl;
    data['subscribers_url'] = subscribersUrl;
    data['subscription_url'] = subscriptionUrl;
    data['commits_url'] = commitsUrl;
    data['git_commits_url'] = gitCommitsUrl;
    data['comments_url'] = commentsUrl;
    data['issue_comment_url'] = issueCommentUrl;
    data['contents_url'] = contentsUrl;
    data['compare_url'] = compareUrl;
    data['merges_url'] = mergesUrl;
    data['archive_url'] = archiveUrl;
    data['downloads_url'] = downloadsUrl;
    data['issues_url'] = issuesUrl;
    data['pulls_url'] = pullsUrl;
    data['milestones_url'] = milestonesUrl;
    data['notifications_url'] = notificationsUrl;
    data['labels_url'] = labelsUrl;
    data['releases_url'] = releasesUrl;
    data['deployments_url'] = deploymentsUrl;
    return data;
  }
}
