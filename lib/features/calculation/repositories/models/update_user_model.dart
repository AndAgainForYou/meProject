class UpdateUserModel {
  UpdateUserModel(
      this.alergies,
      this.tpds,
      this.chronic_diseases,
      this.activities,
      this.most_important_goals,
      this.health_goals,
      this.supplements,
      this.outside_eating_days,
      this.eco_friendly_eating,
      this.cooking_preferences,
      this.habits,
      this.medicaments,
      this.outside_eating_cuisine,
      this.delivery_cuisine,
      this.sport_nutritions,
      this.first_name,
      this.last_name,
      this.gender,
      this.birthday_date,
      this.height,
      this.weight,
      this.activities_frequency,
      this.is_competitions,
      this.weight_loss_goal,
      this.is_diet,
      this.current_diet,
      this.is_cooking_preference,
      this.cholesterol_level,
      this.blood_glucose_level,
      this.hemoglobin_level,
      this.triglycerides_level,
      this.iron_level,
      this.ph_level,
      this.electrolyte_balance,
      this.vitamin_D_status,
      this.vitamin_B12_status,
      this.calcium_status,
      this.is_supplements,
      this.is_medicaments,
      this.is_outside_eating,
      this.is_delivery,
      this.season,
      this.region,
      this.is_sport_nutrition,
      this.diversity,
      this.tpd_count);

  final List<String>? alergies;
  final List<String>? tpds;
  final List<String>? chronic_diseases;
  final List<String>? activities;
  final List<String>? most_important_goals;
  final List<String>? health_goals;
  final List<String>? supplements;
  final List<String>? outside_eating_days;
  final List<String>? eco_friendly_eating;
  final List<String>? cooking_preferences;
  final List<String>? habits;
  final List<String>? medicaments;
  final List<String>? outside_eating_cuisine;
  final List<String>? delivery_cuisine;
  final List<String>? sport_nutritions;
  final String first_name;
  final String? last_name;
  final String gender;
  final String birthday_date;
  final int height;
  final int weight;
  final String activities_frequency;
  final bool? is_competitions;
  final int? weight_loss_goal;
  final bool? is_diet;
  final String? current_diet;
  final bool? is_cooking_preference;
  final String cholesterol_level;
  final String blood_glucose_level;
  final String hemoglobin_level;
  final String triglycerides_level;
  final String iron_level;
  final String ph_level;
  final String electrolyte_balance;
  final String vitamin_D_status;
  final String vitamin_B12_status;
  final String calcium_status;
  final bool? is_supplements;
  final bool? is_medicaments;
  final bool? is_outside_eating;
  final bool? is_delivery;
  final String? season;
  final String? region;
  final bool? is_sport_nutrition;
  final String diversity;
  final String tpd_count;

  Map<String, dynamic> toJson() => {
        if (alergies != null) 'alergies': alergies,
        if (tpds != null) 'tpds': tpds,
        if (chronic_diseases != null) 'chronic_diseases': chronic_diseases,
        if (activities != null) 'activities': activities,
        if (most_important_goals != null)
          'most_important_goals': most_important_goals,
        if (health_goals != null) 'health_goals': health_goals,
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
          'outside_eating_cuisine': outside_eating_cuisine,
        if (delivery_cuisine != null) 'delivery_cuisine': delivery_cuisine,
        if (sport_nutritions != null) 'sport_nutritions': sport_nutritions,
        'first_name': first_name,
        if (last_name != null) 'last_name': last_name,
        'gender': gender,
        'birthday_date': birthday_date,
        'height': height,
        'weight': weight,
        'activities_frequency': activities_frequency,
        if (is_competitions != null) 'is_competitions': is_competitions,
        if (weight_loss_goal != null) 'weight_loss_goal': weight_loss_goal,
        if (is_diet != null) 'is_diet': is_diet,
        if (current_diet != null) 'current_diet': current_diet,
        if (is_cooking_preference != null)
          'is_cooking_preference': is_cooking_preference,
        'cholesterol_level': cholesterol_level,
        'blood_glucose_level': blood_glucose_level,
        'hemoglobin_level': hemoglobin_level,
        'triglycerides_level': triglycerides_level,
        'iron_level': iron_level,
        'ph_level': ph_level,
        'electrolyte_balance': electrolyte_balance,
        'vitamin_D_status': vitamin_D_status,
        'vitamin_B12_status': vitamin_B12_status,
        'calcium_status': calcium_status,
        if (is_supplements != null) 'is_supplements': is_supplements,
        if (is_medicaments != null) 'is_medicaments': is_medicaments,
        if (is_outside_eating != null) 'is_outside_eating': is_outside_eating,
        if (is_delivery != null) 'is_delivery': is_delivery,
        if (season != null) 'season': season,
        if (region != null) 'region': region,
        if (is_sport_nutrition != null)
          'is_sport_nutrition': is_sport_nutrition,
        'diversity': diversity,
        'tpd_count': tpd_count
      };

  UpdateUserModel._builder(UpdateUserModelBuilder builder)
      : alergies = builder.alergies,
        tpds = builder.tpds,
        chronic_diseases = builder.chronic_diseases,
        activities = builder.activities,
        most_important_goals = builder.most_important_goals,
        health_goals = builder.health_goals,
        supplements = builder.supplements,
        outside_eating_days = builder.outside_eating_days,
        eco_friendly_eating = builder.eco_friendly_eating,
        cooking_preferences = builder.cooking_preferences,
        habits = builder.habits,
        medicaments = builder.medicaments,
        outside_eating_cuisine = builder.outside_eating_cuisine,
        delivery_cuisine = builder.delivery_cuisine,
        sport_nutritions = builder.sport_nutritions,
        first_name = builder.first_name!,
        last_name = builder.last_name, //TODO make not NULL
        gender = builder.gender!,
        birthday_date = builder.birthday_date!,
        height = builder.height!,
        weight = builder.weight!,
        activities_frequency = builder.activities_frequency!,
        is_competitions = builder.is_competitions,
        weight_loss_goal = builder.weight_loss_goal,
        is_diet = builder.is_diet,
        current_diet = builder.current_diet,
        is_cooking_preference = builder.is_cooking_preference,
        cholesterol_level = builder.cholesterol_level!,
        blood_glucose_level = builder.blood_glucose_level!,
        hemoglobin_level = builder.hemoglobin_level!,
        triglycerides_level = builder.triglycerides_level!,
        iron_level = builder.iron_level!,
        ph_level = builder.ph_level!,
        electrolyte_balance = builder.electrolyte_balance!,
        vitamin_D_status = builder.vitamin_D_status!,
        vitamin_B12_status = builder.vitamin_B12_status!,
        calcium_status = builder.calcium_status!,
        is_supplements = builder.is_supplements,
        is_medicaments = builder.is_medicaments,
        is_outside_eating = builder.is_outside_eating,
        is_delivery = builder.is_delivery,
        season = builder.season,
        region = builder.region,
        is_sport_nutrition = builder.is_sport_nutrition,
        diversity = builder.diversity!,
        tpd_count = builder.tpd_count!;
}

class UpdateUserModelBuilder {
  UpdateUserModelBuilder();
  List<String>? alergies;
  List<String>? tpds;
  List<String>? chronic_diseases;
  List<String>? activities;
  List<String>? most_important_goals;
  List<String>? health_goals;
  List<String>? supplements;
  List<String>? outside_eating_days;
  List<String>? eco_friendly_eating;
  List<String>? cooking_preferences;
  List<String>? habits;
  List<String>? medicaments;
  List<String>? outside_eating_cuisine;
  List<String>? delivery_cuisine;
  List<String>? sport_nutritions;
  String? first_name; //
  String? last_name; //
  String? gender;
  String? birthday_date;
  int? height;
  int? weight;
  String? activities_frequency;
  bool? is_competitions;
  int? weight_loss_goal;
  bool? is_diet;
  String? current_diet;
  bool? is_cooking_preference;
  String? cholesterol_level;
  String? blood_glucose_level;
  String? hemoglobin_level;
  String? triglycerides_level;
  String? iron_level;
  String? ph_level;
  String? electrolyte_balance;
  String? vitamin_D_status;
  String? vitamin_B12_status;
  String? calcium_status;
  bool? is_supplements;
  bool? is_medicaments;
  bool? is_outside_eating;
  bool? is_delivery;
  String? season;
  String? region;
  bool? is_sport_nutrition;
  String? diversity;
  String? tpd_count;

  UpdateUserModel build() {
    return UpdateUserModel._builder(this);
  }
}
