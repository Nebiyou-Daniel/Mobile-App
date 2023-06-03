import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/serviceLocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../notification.dart';
import '../data_providor/api_providor.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    final ApiDataProvidor apiDataProvidor = ApiDataProvidor();
    SharedPreferences preferences = ServiceLocator().preferences;

    on<NotificationEvent>((event, emit) {
      emit(NotificationsLoading());
    });

    on<NotificationLoadEvent>((event, emit) async {
      try {
        // get role from sharedPreference
        final String accessToken = preferences.getString("access_token")!;
        final String role = preferences.getString("role")!;
        final notifications = await apiDataProvidor.getNotifications(
            accessToken: accessToken, role: role);
        emit(NotificationsLoadedSuccess(notifications: notifications));
      } catch (e) {
        emit(NotificationsLoadedError(message: e.toString()));
      }
    });

    on<NotificationMarkAsSeenEvent>((event, emit) async {
      try {
        final String accessToken = preferences.getString("access_token")!;
        await apiDataProvidor.markNotificationAsSeen(
            event.notification, accessToken);
      } catch (e) {
        emit(NotificationsLoadedError(message: e.toString()));
      }
    });
  }
}
