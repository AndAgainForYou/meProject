import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:platy/features/api/api_service.dart';

part 'platy_bloc_event.dart';
part 'platy_bloc_state.dart';

class PlatyBloc extends Bloc<PlatyBlocEvent, PlatyBlocState> {
  final ApiService apiService = ApiService();
  final TokenManager tokenManager = TokenManager();
  PlatyBloc() : super(PlatyBlocInitial()) {
    on<CreateProfileEvent>((event, emit) async {
      final response =
          await apiService.postData('/create-profile/', event.profileData);
      // Update the state based on the API response or other logic
      emit(ProfileCreatedState(response));
    });

    //jwt
    //needs username/enail and password
    on<JwtCreateEvent>((event, emit) async {
      final response = await apiService.postData('/jwt/create/', event.jwtData);

      print(response);
    });

    //needs refresh token
    on<JwtRefreshEvent>((event, emit) async {
      final response =
          await apiService.postData('/jwt/refresh/', event.jwtRefreshData);

      //TokenManager.updateTokensValue('refresh', 'response');
      print(response);
    });

    //needs access token
    on<JwtVerifyEvent>((event, emit) async {
      final response =
          await apiService.postData('/jwt/verify/', event.jwtVerifyData);

      print(response);
    });

    //account and authorization
    on<SignUpEvent>((event, emit) async {
      final response = await apiService.postData('/signup/', event.signUpData);

      if (response['user_id'] != null) {
        TokenManager.saveUserId(response['user_id']);
      }

      if (response['tokens'] != null) {
        TokenManager.saveTokensData(response['tokens']);
        emit(SignUpSuccessState(response['user_id']));
      } else {
        //print('bad request ${response['status']}');
        emit(SignUpErrorState(response));
      }

      print(response);
      print(TokenManager.getUserId());
      print(TokenManager.getTokensData());
    });

    on<LogInEvent>((event, emit) async {
      final response = await apiService.postData('/login/', event.logInData);

      if (response['user_id'] != null) {
        TokenManager.saveUserId(response['user_id']);
      }

      if (response['tokens'] != null) {
        TokenManager.saveTokensData(response['tokens']);
        emit(LoginSuccessState(response['user_id']));
      } else {
        print('bad request ${response['status']}');
        emit(LoginErrorState(response['status']));
      }

      print("access: ${TokenManager.getTokensData()?['access']}");
    });

    on<LogInWithGoogleEvent>((event, emit) async {
      final response = await apiService.postData(
          '/login/google-oauth2/', event.logInWithGoogleData);

      if (response['user_id'] != null) {
        TokenManager.saveUserId(response['user_id']);
      }

      if (response['tokens'] != null) {
        TokenManager.saveTokensData(response['tokens']);
      }

      print(TokenManager.getUserId());
      print("access: ${TokenManager.getTokensData()?['access']}");
    });

    on<LogInWithFacebookEvent>((event, emit) async {
      final response = await apiService.postData(
          '/login/facebook/', event.logInWithFacebookData);

      if (response['user_id'] != null) {
        TokenManager.saveUserId(response['user_id']);
      }

      if (response['tokens'] != null) {
        TokenManager.saveTokensData(response['tokens']);
      }

      print(TokenManager.getUserId());
      print("access: ${TokenManager.getTokensData()?['access']}");
    });

    on<LogOutEvent>((event, emit) async {
      final response = await apiService.postData('/logout/', event.logOutData);
      print(response);
    });

    on<DeleteAccountEvent>((event, emit) async {
      final response = await apiService.deleteData(
          '/delete-account/', event.deleteAccountData);
      print(response);
    });

    //password
    on<PasswordResetPutEvent>((event, emit) async {
      final response =
          await apiService.putData('/password-reset/', event.passwordResetData);
      print(response);
    });

    on<PasswordResetPatchEvent>((event, emit) async {
      final response = await apiService.patchData(
          '/password-reset/', event.passwordResetData);
      print(response);
    });

    on<PasswordChangePutEvent>((event, emit) async {
      final response = await apiService.putData(
          '/change-password/', event.passwordChangeData);
      print(response);
    });

    on<PasswordChangePatchEvent>((event, emit) async {
      final response = await apiService.patchData(
          '/change-password/', event.passwordChangeData);
      print(response);
    });

    //notes
    on<NotesGetAllEvent>((event, emit) async {
      final response =
          await apiService.fetchData('/notes/all/', event.notesData);

      emit(NotesAllState(response));
      print(response);
    });

    on<NotesCreateEvent>((event, emit) async {
      final response =
          await apiService.postData('/notes/create/', event.notesData);
      print(response);
    });

    on<NotesDeleteEvent>((event, emit) async {
      final response = await apiService.deleteData(
          '/notes/delete/${event.notesData['id']}/', event.notesData);
      print(response);
    });

    on<NotesGetByIdEvent>((event, emit) async {
      final response = await apiService.fetchData(
          '/notes/${event.notesData['id']}/', event.notesData);
      emit(NotesByIdState(response));
      print(response);
    });

    //password-reset-user
    //new_password1 new_password2
    /*on<PasswordResetUserPutEvent>((event, emit) async {
      final response = await apiService.putData(
          '/password-reset-user/${'uidb64?'}/${TokenManager.getTokensData()?['access']}/', event.data);
      print(response);
    }); */

    //profile-image
    on<ProfileImagePostEvent>((event, emit) async {
      final response = await apiService.postData('/profile-image/', event.data);
      print(response);
    });

    //profile
    on<ProfileDataEvent>((event, emit) async {
      final response = await apiService.fetchData('/profile/', event.data);
      print(response);
    });

    //update-profile
    on<UpdateProfileGetEvent>((event, emit) async {
      final response =
          await apiService.fetchData('/update-profile/', event.data);
      print(response);
    });

    on<UpdateProfilePutEvent>((event, emit) async {
      //update with full data
      final response = await apiService.putData('/update-profile/', event.data);
      print(response);
    });

    on<UpdateProfilePatchEvent>((event, emit) async {
      //partical update
      final response =
          await apiService.patchData('/update-profile/', event.data);
      print(response);
    });
  }
}
