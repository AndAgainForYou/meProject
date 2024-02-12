import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:platy/features/api/api_service.dart';

part 'platy_bloc_event.dart';
part 'platy_bloc_state.dart';

class PlatyBloc extends Bloc<PlatyBlocEvent, PlatyBlocState> {
  final ApiService apiService = ApiService();
  PlatyBloc() : super(PlatyBlocInitial()) {
    on<CreateProfileEvent>((event, emit) async {
      try {
        // Assuming you have an API service accessible from your Bloc
        final response =
            await apiService.postData('/create-profile/', event.profileData);

        // Update the state based on the API response or other logic
        if (response['success'] == true) {
          emit(ProfileCreatedState(response['data'] as Map<String, dynamic>));
        } else {
          emit(ProfileCreationErrorState(response['error'] as String));
        }
      } catch (error) {
        emit(ProfileCreationErrorState('Failed to create profile: $error'));
      }
    });
    //more Api events for data here:
  }
}
