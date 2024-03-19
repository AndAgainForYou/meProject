class UpdateUserModel {
  UpdateUserModel(
      this.alergies,
      this.tpds,
      this.chronic_diseases,
      this.most_important_goals,
      this.supplements,
      this.outside_eating_days,
      this.eco_friendly_eating,
      this.cooking_preferences,
      this.habits,
      this.medicaments,
      this.outside_eating_cuisine,
      this.delivery_cuisine,
      this.sport_nutritions,
      this.name,
      this.age,
      this.height,
      this.weight,
      this.activities_frequency,
      this.weight_loss_goal,
      this.is_diet,
      this.current_diet,
      this.is_cooking_preference,
      this.is_supplements,
      this.is_medicaments,
      this.is_outside_eating,
      this.is_delivery,
      this.season,
      this.region,
      this.is_sport_nutrition,
      this.diversity,
      this.tpd_count,
      this.mental_health_goals,
      this.beauty_goals,
      this.fasting_days,
      this.health_test,
      this.blood_check_up,
      this.bone_check_up,
      this.digestive_health,
      this.emotional_wellbeing,
      this.water_consumption,
      this.closer_statements,
      this.sugar_statements,
      this.current_symptoms,
      this.current_goals,
      this.refrigerator_food);

  final List<String>? alergies;
  final List<String>? tpds;
  final List<String>? chronic_diseases;
  final List<String>? most_important_goals;
  final List<String>? supplements;
  final List<String>? outside_eating_days;
  final List<String>? eco_friendly_eating;
  final List<String>? cooking_preferences;
  final List<String>? habits;
  final List<String>? medicaments;
  final List<String>? outside_eating_cuisine;
  final List<String>? delivery_cuisine;
  final List<String>? sport_nutritions;
  final String name;
  final int age;
  final String height;
  final String weight;
  final String activities_frequency;
  final String? weight_loss_goal;
  final bool? is_diet;
  final List<String>? current_diet;
  final bool? is_cooking_preference;
  final bool? is_supplements;
  final bool? is_medicaments;
  final bool? is_outside_eating;
  final bool? is_delivery;
  final String? season;
  final String? region;
  final bool? is_sport_nutrition;
  final String diversity;
  final String tpd_count;
  final List<String>? mental_health_goals;
  final List<String>? beauty_goals;
  final List<String>? fasting_days;
  final bool health_test;
  final Map<String, dynamic>? blood_check_up;
  final Map<String, dynamic> bone_check_up;
  final Map<String, dynamic> digestive_health;
  final String emotional_wellbeing;
  final String water_consumption;
  final String closer_statements;
  final String sugar_statements;
  final List<String> current_symptoms;
  final List<String> current_goals;
  final List<String>? refrigerator_food;

  Map<String, dynamic> toJson() => {
        if (alergies != null) 'alergies': alergies,
        if (tpds != null) 'tpds': tpds,
        if (chronic_diseases != null) 'chronic_diseases': chronic_diseases,
        if (most_important_goals != null)
          'most_important_goals': most_important_goals,
        if (supplements != null) 'supplements': supplements,
        if (outside_eating_days != null)
          'outside_eating_days': outside_eating_days,
        if (eco_friendly_eating != null)
          'eco_friendly_eating': eco_friendly_eating,
        if (cooking_preferences != null)
          'cooking_preferences': cooking_preferences,
        if (habits != null) 'habits': habits,
        if (medicaments != null) 'medicaments': medicaments,
        if (outside_eating_cuisine != null)
          'outside_eating_cousin': outside_eating_cuisine,
        if (delivery_cuisine != null) 'delivery_cousin': delivery_cuisine,
        if (sport_nutritions != null) 'sport_nutritions': sport_nutritions,
        'name': name,
        'age': age,
        'height': height,
        'weight': weight,
        'activities_frequency': activities_frequency,
        if (weight_loss_goal != null) 'weight_loss_goal': weight_loss_goal,
        if (is_diet != null) 'is_diet': is_diet,
        if (current_diet != null) 'current_diet': current_diet,
        if (is_cooking_preference != null)
          'is_cooking_preference': is_cooking_preference,
        if (is_supplements != null) 'is_supplements': is_supplements,
        if (is_medicaments != null) 'is_medicaments': is_medicaments,
        if (is_outside_eating != null) 'is_outside_eating': is_outside_eating,
        if (is_delivery != null) 'is_delivery': is_delivery,
        if (season != null) 'season': season,
        if (region != null) 'region': region,
        if (is_sport_nutrition != null)
          'is_sport_nutrition': is_sport_nutrition,
        'diversity': diversity,
        'tpd_count': tpd_count,
        if (mental_health_goals != null)
          'mental_health_goals': mental_health_goals,
        if (beauty_goals != null) 'beauty_goals': beauty_goals,
        if (fasting_days != null) 'fasting_days': fasting_days,
        'health_test': health_test,
        'blood_check_up': blood_check_up,
        'bone_check_up': bone_check_up,
        'digestive_health': digestive_health,
        'emotional_wellbeing': emotional_wellbeing,
        'closer_statements': closer_statements,
        'water_consumption': water_consumption,
        'sugar_statements': sugar_statements,
        'current_symptoms': current_symptoms,
        'current_goals': current_goals,
        if (refrigerator_food != null) 'refrigerator_food': refrigerator_food,
      };

  UpdateUserModel._builder(UpdateUserModelBuilder builder)
      : alergies = builder.alergies,
        tpds = builder.tpds,
        chronic_diseases = builder.chronic_diseases,
        most_important_goals = builder.most_important_goals,
        supplements = builder.supplements,
        outside_eating_days = builder.outside_eating_days,
        eco_friendly_eating = builder.eco_friendly_eating,
        cooking_preferences = builder.cooking_preferences,
        habits = builder.habits,
        medicaments = builder.medicaments,
        outside_eating_cuisine = builder.outside_eating_cuisine,
        delivery_cuisine = builder.delivery_cuisine,
        sport_nutritions = builder.sport_nutritions,
        name = builder.name!,
        age = builder.age!,
        height = builder.height!,
        weight = builder.weight!,
        activities_frequency = builder.activities_frequency!,
        weight_loss_goal = builder.weight_loss_goal,
        is_diet = builder.is_diet,
        current_diet = builder.current_diet,
        is_cooking_preference = builder.is_cooking_preference,
        is_supplements = builder.is_supplements,
        is_medicaments = builder.is_medicaments,
        is_outside_eating = builder.is_outside_eating,
        is_delivery = builder.is_delivery,
        season = builder.season,
        region = builder.region,
        is_sport_nutrition = builder.is_sport_nutrition,
        diversity = builder.diversity!,
        tpd_count = builder.tpd_count!,
        mental_health_goals = builder.mental_health_goals,
        beauty_goals = builder.beauty_goals,
        fasting_days = builder.fasting_days,
        health_test = builder.health_test!,
        blood_check_up = builder.blood_check_up,
        bone_check_up = builder.bone_check_up!,
        digestive_health = builder.digestive_health!,
        emotional_wellbeing = builder.emotional_wellbeing!,
        water_consumption = builder.water_consumption!,
        closer_statements = builder.closer_statements!,
        sugar_statements = builder.sugar_statements!,
        current_symptoms = builder.current_symptoms!,
        current_goals = builder.current_goals!,
        refrigerator_food = builder.refrigerator_food;
}

class UpdateUserModelBuilder {
  UpdateUserModelBuilder();
  List<String>? alergies;
  List<String>? tpds;
  List<String>? chronic_diseases;
  List<String>? most_important_goals;
  List<String>? supplements;
  List<String>? outside_eating_days;
  List<String>? eco_friendly_eating;
  List<String>? cooking_preferences;
  List<String>? habits;
  List<String>? medicaments;
  List<String>? outside_eating_cuisine;
  List<String>? delivery_cuisine;
  List<String>? sport_nutritions;
  String? name;
  int? age;
  String? height;
  String? weight;
  String? activities_frequency;
  String? weight_loss_goal;
  bool? is_diet;
  List<String>? current_diet;
  bool? is_cooking_preference;
  bool? is_supplements;
  bool? is_medicaments;
  bool? is_outside_eating;
  bool? is_delivery;
  String? season;
  String? region;
  bool? is_sport_nutrition;
  String? diversity;
  String? tpd_count;
  List<String>? mental_health_goals;
  List<String>? beauty_goals;
  List<String>? fasting_days;
  bool? health_test;
  Map<String, dynamic>? blood_check_up;
  Map<String, dynamic>? bone_check_up;
  Map<String, dynamic>? digestive_health;
  String? emotional_wellbeing;
  String? water_consumption;
  String? closer_statements;
  String? sugar_statements;
  List<String>? current_symptoms;
  List<String>? current_goals;
  List<String>? refrigerator_food;
  UpdateUserModel build() {
    return UpdateUserModel._builder(this);
  }
}
