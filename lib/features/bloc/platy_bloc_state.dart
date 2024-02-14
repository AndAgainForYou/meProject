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

