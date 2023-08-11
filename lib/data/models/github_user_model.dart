import 'dart:convert';

class GithubUserModel {
  final String? login;
  final String? avatarUrl;
  final String? location;
  final String? name;
  final String? bio;
  final String? email;
  final int? followers;
  final int? publicRepos;
  final int? publicGists;

  GithubUserModel({
    this.login,
    this.avatarUrl,
    this.location,
    this.name,
    this.bio,
    this.email,
    this.followers,
    this.publicRepos,
    this.publicGists,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'avatar_url': avatarUrl,
      'location': location,
      'name': name,
      'bio': bio,
      'email': email,
      'followers': followers,
      'public_repos': publicRepos,
      'public_gists': publicGists,
    };
  }

  factory GithubUserModel.fromMap(Map<String, dynamic> map) {
    return GithubUserModel(
      login: map['login'] ?? 'not provided!',
      avatarUrl: map['avatar_url'] ?? 'not provided!',
      location: map['location'],
      name: map['name'] ?? 'not provided!',
      bio: map['bio'] ?? 'not provided!',
      email: map['email'],
      followers: map['followers'],
      publicRepos: map['public_repos'],
      publicGists: map['public_gists'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GithubUserModel.fromJson(String source) =>
      GithubUserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
