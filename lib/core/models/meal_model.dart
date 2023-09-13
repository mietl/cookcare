List<String> complexeMap = ["简单", "中等", "复杂"];


class MealModel {
  final String id;
  final List<String> categories;
  final String title;
  final int affordability;
  final int complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  final String complexityText;

  MealModel({
    required this.id,
    required this.categories,
    required this.title,
    required this.affordability,
    required this.complexity,
    required this.complexityText,
    required this.imageUrl,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json['id'],
      categories: List<String>.from(json['categories']),
      title: json['title'],
      affordability: json['affordability'],
      complexity: json['complexity'],
      complexityText: complexeMap[json['complexity']],
      imageUrl: json['imageUrl'],
      duration: json['duration'],
      ingredients: List<String>.from(json['ingredients']),
      steps: List<String>.from(json['steps']),
      isGlutenFree: json['isGlutenFree'],
      isVegan: json['isVegan'],
      isVegetarian: json['isVegetarian'],
      isLactoseFree: json['isLactoseFree'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categories': categories,
      'title': title,
      'affordability': affordability,
      'complexity': complexity,
      'imageUrl': imageUrl,
      'duration': duration,
      'ingredients': ingredients,
      'steps': steps,
      'isGlutenFree': isGlutenFree,
      'isVegan': isVegan,
      'isVegetarian': isVegetarian,
      'isLactoseFree': isLactoseFree,
    };
  }
}


// class MealModel {
//   String? id;
//   List<dynamic>? categories;
//   String? title;
//   int? affordability;
//   int? complexity;
//   String? imageUrl;
//   int? duration;
//   List<String>? ingredients;
//   List<String>? steps;
//   bool? isGlutenFree;
//   bool? isVegan;
//   bool? isVegetarian;
//   bool? isLactoseFree;
//
//   String? complexityText;
//
//   MealModel(
//       {this.id,
//       this.categories,
//       this.title,
//       this.affordability,
//       this.complexity,
//       this.complexityText,
//       this.imageUrl,
//       this.duration,
//       this.ingredients,
//       this.steps,
//       this.isGlutenFree,
//       this.isVegan,
//       this.isVegetarian,
//       this.isLactoseFree});
//
//   MealModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     categories = json['categories'].cast<String>();
//     title = json['title'];
//     affordability = json['affordability'];
//     complexity = json['complexity'];
//     complexityText = complexeMap[json['complexity']];
//     imageUrl = json['imageUrl'];
//     duration = json['duration'];
//     ingredients = json['ingredients'].cast<String>();
//     steps = json['steps'].cast<String>();
//     isGlutenFree = json['isGlutenFree'];
//     isVegan = json['isVegan'];
//     isVegetarian = json['isVegetarian'];
//     isLactoseFree = json['isLactoseFree'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = id;
//     data['categories'] = categories;
//     data['title'] = title;
//     data['affordability'] = affordability;
//     data['complexity'] = complexity;
//     data['complexityText'] = complexityText;
//     data['imageUrl'] = imageUrl;
//     data['duration'] = duration;
//     data['ingredients'] = ingredients;
//     data['steps'] = steps;
//     data['isGlutenFree'] = isGlutenFree;
//     data['isVegan'] = isVegan;
//     data['isVegetarian'] = isVegetarian;
//     data['isLactoseFree'] = isLactoseFree;
//     return data;
//   }
// }
