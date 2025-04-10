import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:techilatask/features/github_user/domain/models/github_user_model.dart';

class GithubProfilePage extends StatelessWidget {
  GitHubUser user;
  GithubProfilePage({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.black,
        leading: const BackButton(color: Colors.white),
        actions: const [
          Icon(Icons.more_horiz, color: Colors.white),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Row(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundImage: NetworkImage(user.avatarUrl),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      user.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text("octocat", style: TextStyle(color: Colors.grey)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),

            // Info
            Row(children:  [
              const Icon(Icons.apartment, color: Colors.grey, size: 16),
              SizedBox(width: 4),
              const Text("@github", style: TextStyle(color: Colors.white,fontSize: 16)),
              SizedBox(width: 12),
              Icon(Icons.location_on, color: Colors.grey, size: 16),
              SizedBox(width: 4),
              Text(user.location??"San Francisco", style: TextStyle(color: Colors.white,fontSize: 16)),
            ]),
            const SizedBox(height: 6),
            Row(children:  [
              Icon(Icons.link, color: Colors.grey, size: 16),
              SizedBox(width: 4),
              Text("github.blog", style: TextStyle(color: Colors.blue,fontSize: 16)),
              SizedBox(width: 12),
              Icon(Icons.email, color: Colors.grey, size: 16),
              SizedBox(width: 4),
              Text(user.email??"", style: TextStyle(color: Colors.white,fontSize: 16)),
            ]),
            const SizedBox(height: 6),
            Row(children:  [
              Icon(Icons.group, color: Colors.grey, size: 16),
              SizedBox(width: 4),
              Text(user.followers.toString()??"", style: TextStyle(color: Colors.white,fontSize: 16)),
              Text(" followers · ", style: TextStyle(color: Colors.grey,fontSize: 16)),
              Text(user.following.toString()??"", style: TextStyle(color: Colors.white,fontSize: 16)),
              Text(" following", style: TextStyle(color: Colors.grey,fontSize: 16)),
            ]),
            const SizedBox(height: 12),

            // Achievements
            Row(
              children: List.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.emoji_events, color: Colors.black),
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),

            // Follow Button
            followButton(),
            const SizedBox(height: 16),

            // Repo Stats
            _buildTile("Repositories", "8", Icons.storage, const Color(0xFF3A3A3C)),
            _buildTile("Starred", "3", Icons.star, Colors.amber),
            _buildTile("Organizations", "0", Icons.apartment, Colors.deepOrange),

            const SizedBox(height: 16),
            const Text("Popular", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),

            // Horizontal Scroll for Popular Repos
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: _repoCard(
                      "Spoon-Knife",
                      "This repo is for demonstration purposes only.",
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(String title, String count, IconData icon, Color iconBgColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0.5),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(1),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        leading: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(count, style: const TextStyle(color: Colors.white)),
            const SizedBox(width: 4),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _repoCard(String title, String subtitle) {
    return Container(
      width: 250,
      child: Card(
        color: const Color(0xFF1F1F1F),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/octocat.png'),
          ),
          title: Text(title,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
        ),
      ),
    );
  }

  Widget followButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.add, color: Colors.white70),
                SizedBox(width: 6),
                Text(
                  "Follow",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
