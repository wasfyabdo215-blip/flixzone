import 'package:flutter/material.dart';
import 'category_details.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),


              Center(
                child: Column(
                  children: [
                    const Icon(Icons.category, color: Colors.red, size: 50),
                    const SizedBox(height: 10),
                    const Text(
                      "Categories",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),


              Expanded(
                child: ListView(
                  children: [
                    _buildCategoryItem(context, "Movies"),
                    _buildCategoryItem(context, "Anime"),
                    _buildCategoryItem(context, "Animation"),
                    _buildCategoryItem(context, "Series"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryDetails(title: title),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 90,
        margin: const EdgeInsets.only(bottom: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(45),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}