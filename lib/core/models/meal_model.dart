List<String> complexeMap = ["简单", "中等", "复杂"];

class MealModel {
  String? id;
  List<dynamic>? categories;
  String? title;
  int? affordability;
  int? complexity;
  String? imageUrl;
  int? duration;
  List<String>? ingredients;
  List<String>? steps;
  bool? isGlutenFree;
  bool? isVegan;
  bool? isVegetarian;
  bool? isLactoseFree;

  String? complexityText;

  MealModel(
      {this.id,
      this.categories,
      this.title,
      this.affordability,
      this.complexity,
      this.complexityText,
      this.imageUrl,
      this.duration,
      this.ingredients,
      this.steps,
      this.isGlutenFree,
      this.isVegan,
      this.isVegetarian,
      this.isLactoseFree});

  MealModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categories = json['categories'].cast<String>();
    title = json['title'];
    affordability = json['affordability'];
    complexity = json['complexity'];
    complexityText = complexeMap[json['complexity']];
    imageUrl = json['imageUrl'];
    duration = json['duration'];
    ingredients = json['ingredients'].cast<String>();
    steps = json['steps'].cast<String>();
    isGlutenFree = json['isGlutenFree'];
    isVegan = json['isVegan'];
    isVegetarian = json['isVegetarian'];
    isLactoseFree = json['isLactoseFree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['categories'] = categories;
    data['title'] = title;
    data['affordability'] = affordability;
    data['complexity'] = complexity;
    data['complexityText'] = complexityText;
    data['imageUrl'] = imageUrl;
    data['duration'] = duration;
    data['ingredients'] = ingredients;
    data['steps'] = steps;
    data['isGlutenFree'] = isGlutenFree;
    data['isVegan'] = isVegan;
    data['isVegetarian'] = isVegetarian;
    data['isLactoseFree'] = isLactoseFree;
    return data;
  }
}
