class GitHubUser {
  final String login;
  final int id;
  final String avatarUrl;
  final String name;
  final String bio;
  final String? location;
  final String? email;
  final int followers;
  final int following;
  final int publicRepos;

  const GitHubUser({
    required this.login,
    required this.id,
    required this.avatarUrl,
    required this.name,
    required this.bio,
    this.location,
    this.email,
    required this.followers,
    required this.following,
    required this.publicRepos,
  });

  factory GitHubUser.fromJson(Map<String, dynamic> json) {
    return GitHubUser(
      login: json['login'] ?? '',
      id: json['id'] ?? 0,
      avatarUrl: json['avatar_url'] ?? '',
      name: json['name'] ?? '',
      bio: json['bio'] ?? '',
      location: json['location'],
      email: json['email'],
      followers: json['followers'] ?? 0,
      following: json['following'] ?? 0,
      publicRepos: json['public_repos'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'id': id,
      'avatar_url': avatarUrl,
      'name': name,
      'bio': bio,
      'location': location,
      'email': email,
      'followers': followers,
      'following': following,
      'public_repos': publicRepos,
    };
  }
} 