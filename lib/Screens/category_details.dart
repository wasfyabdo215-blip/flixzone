import 'package:flutter/material.dart';

class CategoryDetails extends StatelessWidget {
  final String title;

  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<String>> moviesData = {
      "Anime": [
        "assets/attack.jpg",
        "assets/naruto.jpg",
        "assets/vinland.jpg",
        "assets/jujutsukaisen.jpg",
        "assets/hunterxhunter.jpg",
      ],
      "Movies": [
        "assets/seven.jpg",
        "assets/interstellar.jpg",
        "assets/forrestgammp.jpg",
        "assets/dune.jpg",
        "assets/avatar2.jpg",
        "assets/inception.jpg",
        "assets/joker.jpg",
        "assets/parasite.jpg",
        "assets/spider.jpg",
        "assets/avengers.jpg",
      ],
      "Animation": [/*"assets/invincible.jpg"*/],
      "Series": [
        "assets/peaky.jpg",
        "assets/Walking.jpg",
        "assets/breakingbad.jpg",
        "assets/game.jpg",
        "assets/dark.jpg",
        // "assets/from.jpg",
      ],
    };

    List<String> currentMovies = moviesData[title] ?? [];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: currentMovies.isEmpty
          ? const Center(
              child: Text("No items", style: TextStyle(color: Colors.white)),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.7,
              ),
              itemCount: currentMovies.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[900],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      currentMovies[index],
                      fit: BoxFit.cover,

                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.broken_image,
                          color: Colors.white,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
