import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
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
    //needs username/email and password
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
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;
        String? accessToken = googleAuth?.accessToken;
        print("AccsesToken Google: $accessToken");
        final response = await apiService
            .postData('/google-login/', {'accessToken': accessToken});
        if (response['user_id'] != null) {
          TokenManager.saveUserId(response['user_id']);
        }

        if (response['tokens'] != null) {
          TokenManager.saveTokensData(response['tokens']);
          emit(LoginSuccessState(response['user_id']));
          await secureStorage.saveCredentials(
              email: googleUser!.email, password: "");
        } else {
          print('bad request ${response['status']}');
          emit(LoginErrorState(response['status']));
        }
        print("access: ${TokenManager.getTokensData()?['access']}");
        print("refresh: ${TokenManager.getTokensData()?['refresh']}");
      } catch (e) {
        print('Error: $e');
      }
    });

    on<LogInWithFacebookEvent>((event, emit) async {
      try {
        final result = await FacebookAuth.instance.login();
        await FacebookAuth.instance.logOut();
        if (result.status == LoginStatus.success) {
          final AccessToken accessToken = result.accessToken!;
          print('Успішно увійшли: ${accessToken.token}');
          print("AccsesToken Facebook: $accessToken.token");
          final response = await apiService
              .postData('/facebook-login/', {'accessToken': accessToken.token});
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
        } else {
          print('Не вдалося увійти: ${result.message}');
        }
      } catch (e) {
        print('Помилка при автентифікації: $e');
      }
    });

    on<LogInWithAppleEvent>((event, emit) async {
      try {
        final result = await FacebookAuth.instance.login();
        await FacebookAuth.instance.logOut();
        if (result.status == LoginStatus.success) {
          final AccessToken accessToken = result.accessToken!;
          print('Успішно увійшли: ${accessToken.token}');
          print("AccsesToken Facebook: $accessToken.token");
          final response = await apiService
              .postData('/facebook-login/', {'accessToken': accessToken.token});
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
        } else {
          print('Не вдалося увійти: ${result.message}');
        }
      } catch (e) {
        print('Помилка при автентифікації: $e');
      }
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
      print('Response: $response');
      emit(NotesAllState(response));
    });

    on<NotesCreateEvent>((event, emit) async {
      final response =
          await apiService.postData('/notes/create/', event.notesData);
      print(response);
      emit(NotesCreateSuccessState(response));
    });

    on<NotesCreateJournalEvent>((event, emit) async {
      final response =
          await apiService.postData('/notes/create/journal', event.notesData);
      print(response);
    });

    on<NotesDeleteEvent>((event, emit) async {
      final response = await apiService.deleteData(
          '/notes/delete/${event.notesData['id']}/', {}); //, event.notesData);
      emit(NotesDeleteSuccessState(event.notesData['id']));
      print(response);
    });

    on<NotesJournalGetByIdEvent>((event, emit) async {
      final response = await apiService.fetchData(
          '/notes/journal/${event.notesData['id']}/', event.notesData);
      //emit(NotesByIdState(response));
      print(response);
    });

    on<NotesUpdateByIdEvent>((event, emit) async {
      final response = await apiService.patchData(
          '/notes/update/${event.notesData['id']}/', event.notesData);
      emit(NotesUpdateByIdSuccessState(response));
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
      final response =
          await apiService.postImage('/profile-image/', event.data);
      final responseData = await apiService.fetchData('/update-profile/', {});
      print(responseData);
      emit(ProfileIncludesDataState(responseData));
    });

    //profile
    on<ProfileDataEvent>((event, emit) async {
      final response = await apiService.fetchData('/profile/', event.data);
      //emit(ProfileIncludesDataState(response));
      print(response);
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
