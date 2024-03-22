part of 'platy_bloc_bloc.dart';

@immutable
sealed class PlatyBlocEvent {}

class CreateProfileEvent extends PlatyBlocEvent {
  final Map<String, dynamic> profileData;

  CreateProfileEvent(this.profileData);
}

class SignUpEvent extends PlatyBlocEvent {
  final Map<String, dynamic> signUpData;

  SignUpEvent(this.signUpData);
}

class LogInEvent extends PlatyBlocEvent {
  final Map<String, dynamic> logInData;

  LogInEvent(this.logInData);
}

class LogInWithGoogleEvent extends PlatyBlocEvent {
  LogInWithGoogleEvent();
}

class LogInWithFacebookEvent extends PlatyBlocEvent {
  LogInWithFacebookEvent();
}

class LogInWithAppleEvent extends PlatyBlocEvent {
  LogInWithAppleEvent();
}

class SignUpWithAppleEvent extends PlatyBlocEvent {
  SignUpWithAppleEvent();
}

class LogOutEvent extends PlatyBlocEvent {
  final Map<String, dynamic> logOutData;

  LogOutEvent(this.logOutData);
}

class DeleteAccountEvent extends PlatyBlocEvent {
  final Map<String, dynamic> deleteAccountData;

  DeleteAccountEvent(this.deleteAccountData);
}

class PasswordChangePutEvent extends PlatyBlocEvent {
  final Map<String, dynamic> passwordChangeData;

  PasswordChangePutEvent(this.passwordChangeData);
}

class PasswordChangePatchEvent extends PlatyBlocEvent {
  final Map<String, dynamic> passwordChangeData;

  PasswordChangePatchEvent(this.passwordChangeData);
}

class PasswordResetEvent extends PlatyBlocEvent {
  final Map<String, dynamic> passwordResetData;

  PasswordResetEvent(this.passwordResetData);
}

//jwt
class JwtCreateEvent extends PlatyBlocEvent {
  final Map<String, dynamic> jwtData;

  JwtCreateEvent(this.jwtData);
}

class JwtRefreshEvent extends PlatyBlocEvent {
  final Map<String, dynamic> jwtRefreshData;

  JwtRefreshEvent(this.jwtRefreshData);
}

class JwtVerifyEvent extends PlatyBlocEvent {
  final Map<String, dynamic> jwtVerifyData;

  JwtVerifyEvent(this.jwtVerifyData);
}

//notes
class NotesGetAllEvent extends PlatyBlocEvent {
  final Map<String, dynamic> notesData;

  NotesGetAllEvent(this.notesData);
}

class NotesCreateEvent extends PlatyBlocEvent {
  final Map<String, dynamic> notesData;

  NotesCreateEvent(this.notesData);
}

class NotesCreateJournalEvent extends PlatyBlocEvent {
  final Map<String, dynamic> notesData;

  NotesCreateJournalEvent(this.notesData);
}

class NotesDeleteEvent extends PlatyBlocEvent {
  final Map<String, dynamic> notesData;

  NotesDeleteEvent(this.notesData);
}

class NotesJournalGetByIdEvent extends PlatyBlocEvent {
  final Map<String, dynamic> notesData;

  NotesJournalGetByIdEvent(this.notesData);
}

class NotesUpdateByIdEvent extends PlatyBlocEvent {
  final Map<String, dynamic> notesData;

  NotesUpdateByIdEvent(this.notesData);
}

class NotesGetByIdEvent extends PlatyBlocEvent {
  final Map<String, dynamic> notesData;

  NotesGetByIdEvent(this.notesData);
}

//password-reset-user
/*class PasswordResetUserPutEvent extends PlatyBlocEvent {
  final Map<String, dynamic> data;

  PasswordResetUserPutEvent(this.data);
} */

//change-profile-image

class ProfileImagePostEvent extends PlatyBlocEvent {
  final XFile data;

  ProfileImagePostEvent(this.data);
}

//profile data

class ProfileDataEvent extends PlatyBlocEvent {
  final Map<String, dynamic> data;

  ProfileDataEvent(this.data);
}

//update profile

class UpdateProfileGetEvent extends PlatyBlocEvent {
  final Map<String, dynamic> data;

  UpdateProfileGetEvent(this.data);
}

class UpdateProfilePutEvent extends PlatyBlocEvent {
  final Map<String, dynamic> data;

  UpdateProfilePutEvent(this.data);
}

class UpdateProfilePatchEvent extends PlatyBlocEvent {
  final Map<String, dynamic> data;

  UpdateProfilePatchEvent(this.data);
}

// week meal plan

class MealPlanDataEvent extends PlatyBlocEvent {
  final Map<String, dynamic>  data;

  MealPlanDataEvent(this.data);
}
