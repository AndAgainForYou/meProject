part of 'platy_bloc_bloc.dart';

@immutable
sealed class PlatyBlocState {}

final class PlatyBlocInitial extends PlatyBlocState {}

//profile data

class ProfileCreatedState extends PlatyBlocState {
  final Map<String, dynamic> profileData;

  ProfileCreatedState(this.profileData);

  List<Object?> get props => [profileData];
}

class ProfileCreationErrorState extends PlatyBlocState {
  final String errorMessage;

  ProfileCreationErrorState(this.errorMessage);

  List<Object?> get props => [errorMessage];
}
