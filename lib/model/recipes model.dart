import 'package:audify/controller/products%20controller.dart';
import 'package:audify/controller/recipes%20controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductRecipe extends StatefulWidget {
  @override
  State<ProductRecipe> createState() => _ProductRecipeState();
}

class _ProductRecipeState extends State<ProductRecipe> {
  final RecipesController recipesController = Get.put(RecipesController());
  @override
  void initState() {
    recipesController.fetchRecipes();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body:Obx(() {
  if (recipesController.isLoading.value) {
    return Center(child: CircularProgressIndicator());
  } else if (recipesController.errorMessage.isNotEmpty) {
    return Center(child: Text(recipesController.errorMessage.value));
  } else {
    return ListView.builder(
      itemCount: recipesController.recipesList.length,
      itemBuilder: (context, index) {
        final recipe = recipesController.recipesList[index];
        return ListTile(
          title: Text(recipe.name ?? "Unnamed"),
          subtitle: Text("Cuisine: ${recipe.cuisine}"),
        );
      },
    );
  }
}));
  }}