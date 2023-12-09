import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsi_mobile/models/model_categories.dart';

import 'list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Meal Categories'),
      ),
      body: ListView.builder(
        itemCount: categoriesItems.length,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        itemBuilder: (context, index) {
          var item = categoriesItems[index];
          return _buildMenuItem(item);
        },
      ),
    );
  }

  Widget _buildMenuItem(CategoriesModel item) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ListPage(strMeal: item.strMeal),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 200,
                  child: SvgPicture.asset(item.strCategoryThumb),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                item.strMeal.toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(item.strCategoryDescription),
            ],
          ),
        ),
      ),
    );
  }
}
