part of 'platy_bloc_bloc.dart';

@immutable
sealed class PlatyBlocEvent {}

class CreateProfileEvent extends PlatyBlocEvent {
  final Map<String, dynamic> profileData;

  CreateProfileEvent(this.profileData);
}


