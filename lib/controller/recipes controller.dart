import 'package:audify/model/recipes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

 // Replace with the actual file where Recipes and Recipe classes are defined

class RecipesController extends GetxController {
  // Observables
  var recipesList = <Recipe>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // Pagination values
  var total = 0.obs;
  var skip = 0.obs;
  var limit = 10.obs; // default limit

  // Replace this with your actual API endpoint
  final String apiUrl = "https://yourapi.com/recipes";

  @override
  void onInit() {
    super.onInit();
    fetchRecipes(); // Fetch data when controller is initialized
  }

  Future<void> fetchRecipes({int skipValue = 0, int limitValue = 10}) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/recipes'));

      if (response.statusCode == 200) {
        final data = recipesFromJson(response.body);
        recipesList.value = data.recipes ?? [];
        total.value = data.total ?? 0;
        skip.value = data.skip ?? 0;
        limit.value = data.limit ?? 10;
      } else {
        errorMessage.value = 'Error: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Exception: $e';
    } finally {
      isLoading.value = false;
    }
  }

  void refreshRecipes() {
    fetchRecipes(skipValue: 0, limitValue: limit.value);
  }

  void loadMoreRecipes() {
    if ((skip.value + limit.value) < total.value) {
      fetchRecipes(skipValue: skip.value + limit.value, limitValue: limit.value);
    }
  }
}
