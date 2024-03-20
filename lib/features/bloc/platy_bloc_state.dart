part of 'platy_bloc_bloc.dart';

@immutable
sealed class PlatyBlocState {}

final class PlatyBlocInitial extends PlatyBlocState {}

//login
class LoginSuccessState extends PlatyBlocState {
  final dynamic successMessage;

  LoginSuccessState(this.successMessage);

  List<dynamic> get props => [successMessage];
}

class LoginErrorState extends PlatyBlocState {
  final dynamic errorMessage;

  LoginErrorState(this.errorMessage);

  List<dynamic> get props => [errorMessage];
}

//signup
class SignUpSuccessState extends PlatyBlocState {
  final dynamic successMessage;

  SignUpSuccessState(this.successMessage);

  List<dynamic> get props => [successMessage];
}

class SignUpErrorState extends PlatyBlocState {
  final dynamic errorMessage;

  SignUpErrorState(this.errorMessage);

  List<dynamic> get props => [errorMessage];
}

//password reset

class PasswordResetSuccessState extends PlatyBlocState {
  final dynamic successMessage;

  PasswordResetSuccessState(this.successMessage);

  List<dynamic> get props => [successMessage];
}

class PasswordResetErrorState extends PlatyBlocState {
  final dynamic errorMessage;

  PasswordResetErrorState(this.errorMessage);

  List<dynamic> get props => [errorMessage];
}

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

class ProfileIncludesDataState extends PlatyBlocState {
  final Map<String, dynamic> profilePageData;

  ProfileIncludesDataState(this.profilePageData);

  List<Object?> get props => [profilePageData];
}

class ProfileNotIncludesDataState extends PlatyBlocState {
  final Map<String, dynamic> profileData;

  ProfileNotIncludesDataState(this.profileData);

  List<Object?> get props => [profileData];
}

//notes state
class NotesAllState extends PlatyBlocState {
  final Map<String, dynamic> notesData;

  NotesAllState(this.notesData);

  List<Object?> get props => [notesData];
}

class NotesByIdState extends PlatyBlocState {
  final Map<String, dynamic> noteData;

  NotesByIdState(this.noteData);

  List<Object?> get props => [noteData];
}

class NotesCreateSuccessState extends PlatyBlocState {
  final dynamic successMessage;

  NotesCreateSuccessState(this.successMessage);

  List<dynamic> get props => [successMessage];
}

class NotesDeleteSuccessState extends PlatyBlocState {
  final dynamic successMessage;

  NotesDeleteSuccessState(this.successMessage);

  List<dynamic> get props => [successMessage];
}

class NotesUpdateByIdSuccessState extends PlatyBlocState {
  final dynamic successMessage;

  NotesUpdateByIdSuccessState(this.successMessage);

  List<dynamic> get props => [successMessage];
}

class MealPlanDataState extends PlatyBlocState {
  final dynamic successMessage;

  MealPlanDataState(this.successMessage);

  List<dynamic> get props => [successMessage];
}
