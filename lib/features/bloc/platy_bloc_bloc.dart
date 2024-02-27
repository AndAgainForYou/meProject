import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:platy/features/api/api_service.dart';
import 'package:platy/features/secureStorage/secure_storage.dart';

part 'platy_bloc_event.dart';
part 'platy_bloc_state.dart';

class PlatyBloc extends Bloc<PlatyBlocEvent, PlatyBlocState> {
  final ApiService apiService = ApiService();
  final TokenManager tokenManager = TokenManager();
  final SecureStorageService secureStorage = SecureStorageService();

  PlatyBloc() : super(PlatyBlocInitial()) {
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
        await secureStorage.saveCredentials(
            email: event.signUpData['email'],
            password: event.signUpData['password1']);
      } else {
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
        await secureStorage.saveCredentials(
            email: event.logInData['email'],
            password: event.logInData['password']);
      } else {
        print('bad request ${response['status']}');
        emit(LoginErrorState(response['status']));
      }

      print("access: ${TokenManager.getTokensData()?['access']}");
    });

    on<LogInWithGoogleEvent>((event, emit) async {
      try {
        // Trigger the authentication flow
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        // Obtain the auth details from the request
        GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;
        print(googleAuth);

        // final result = await FlutterWebAuth2.authenticate(
        //   url: 'http://16.171.1.90/api/v1/login/google-oauth2/',
        //   callbackUrlScheme: 'platy',
        // );
        // final String? token = Uri.parse(result).queryParameters['token'];
      } catch (e) {
        print('Error: $e');
      }
      // final response = await apiService.fetchData(
      //     '/login/google-oauth2/', event.logInWithGoogleData);

      // if (response['user_id'] != null) {
      //   TokenManager.saveUserId(response['user_id']);
      // }

      // if (response['tokens'] != null) {
      //   TokenManager.saveTokensData(response['tokens']);
      // }

      // print(TokenManager.getUserId());
      // print("access: ${TokenManager.getTokensData()?['access']}");
    });

    on<LogInWithFacebookEvent>((event, emit) async {
      final response = await apiService.fetchData(
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
      await secureStorage.clearAllData();
      TokenManager.clearTokens();      
    });

    on<DeleteAccountEvent>((event, emit) async {
      final response = await apiService.deleteData(
          '/delete-account/', event.deleteAccountData);
          print(response);
      await secureStorage.clearAllData();
    });

    //password

    on<PasswordResetEvent>((event, emit) async {
      final response = await apiService.postData(
          '/password-reset/', event.passwordResetData);
      if (response['message'] == null) {
        emit(PasswordResetErrorState(response['email']));
      } else {
        emit(PasswordResetSuccessState(response['message']));
      }
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

    on<NotesCreateJournalEvent>((event, emit) async {
      final response =
          await apiService.postData('/notes/create/journal', event.notesData);
      print(response);
    });

    on<NotesDeleteEvent>((event, emit) async {
      final response = await apiService.deleteData(
          '/notes/delete/${event.notesData['id']}/', event.notesData);
      print(response);
    });

    on<NotesJournalGetByIdEvent>((event, emit) async {
      final response = await apiService.fetchData(
          '/notes/journal/${event.notesData['id']}/', event.notesData);
      //emit(NotesByIdState(response));
      print(response);
    });

    on<NotesUpdateByIdEvent>((event, emit) async {
      final response = await apiService.postData(
          '/notes/update/${event.notesData['id']}/', event.notesData);
      //emit(NotesByIdState(response));
      print(response);
    });

    on<NotesGetByIdEvent>((event, emit) async {
      final response = await apiService.fetchData(
          '/notes/${event.notesData['id']}/', event.notesData);
      emit(NotesByIdState(response));
      print(response);
    });

    on<CreateProfileEvent>((event, emit) async {
      final response =
          await apiService.postData('/create-profile/', event.profileData);
      // Update the state based on the API response or other logic
      //emit(ProfileCreatedState(response));
      print('response: ${response}');
    });

    //profile-image
    on<ProfileImagePostEvent>((event, emit) async {
      final response = await apiService.postData('/profile-image/', event.data);
      print(response);
    });

    //profile
    on<ProfileDataEvent>((event, emit) async {
      final response = await apiService.fetchData('/profile/', event.data);

      //emit(ProfileIncludesDataState(response));

      if (response['detail'] != null) {
        emit(ProfileNotIncludesDataState(response));
        print('not included data');
        print(response['tpds']);
      }
      if (response['detail'] == null) {
        emit(ProfileIncludesDataState(response));
        print(response['tpds']);
        print('included data');
      }

      print(response);
    });

    //update-profile
    on<UpdateProfileGetEvent>((event, emit) async {
      final response =
          await apiService.fetchData('/update-profile/', event.data);
      emit(ProfileIncludesDataState(response));
      print('update-profile request');
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
          final responseData =
          await apiService.fetchData('/update-profile/', event.data);
      print(responseData);
      emit(ProfileIncludesDataState(responseData));
    });
  }
}
