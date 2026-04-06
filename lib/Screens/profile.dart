import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as pro;
import 'package:flixzone/provider/UserProvide.dart';

import '../model/model.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {

    final favoriteList = context.watch<Userprovide>().favoriteMovies;


    String userName = "User";

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // اللوجو
            const Icon(Icons.play_circle_fill, color: Colors.redAccent, size: 60),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: ' Flix', style: TextStyle(color: Colors.redAccent, fontSize: 40, fontWeight: FontWeight.bold)),
                  TextSpan(text: 'Zone', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            const SizedBox(height: 30),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Welcome, ",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                      Text(
                        userName,
                        style: const TextStyle(
                          color: Colors.redAccent,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  Container(
                    height: 1.5,
                    width: double.infinity,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),


            const Text(
              "My Favorites",
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),


            Expanded(
              child: favoriteList.isEmpty
                  ? const Center(
                child: Text("No favorites added yet", style: TextStyle(color: Colors.grey)),
              )
                  : GridView.builder(
                padding: const EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: favoriteList.length,
                itemBuilder: (context, index) {
                  final movie = favoriteList[index];
                  return _buildFavoriteCard(context, movie);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteCard(BuildContext context, Movie movie) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            movie.imageUrl,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: () => context.read<Userprovide>().toggleFavorite(movie),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
              child: const Icon(Icons.close, color: Colors.white, size: 18),
            ),
          ),
        ),
      ],
    );
  }
}