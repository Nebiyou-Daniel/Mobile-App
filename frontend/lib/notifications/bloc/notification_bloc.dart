import 'package:flutter_bloc/flutter_bloc.dart';
import '../notification.dart';
import '../data_providor/api_providor.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    
    final ApiDataProvidor apiDataProvidor = ApiDataProvidor();

    on<NotificationEvent>((event, emit) {
      emit(NotificationsLoading());
    });

    on<NotificationLoadEvent>((event, emit) async {
      try {
        final notifications = await apiDataProvidor.getNotifications();
        emit(NotificationsLoadedSuccess(notifications: notifications));
      } catch (e) {
        emit(NotificationsLoadedError(message: e.toString()));
      }
    });

    on<NotificationMarkAsDoneEvent>((event, emit) async {
      try {
        await apiDataProvidor.markNotificationAsDone(event.notification);
        // emit(NotificationsLoading());
        final notifications = await apiDataProvidor.getNotifications();
        // emit(NotificationsLoadedSuccess(notifications: notifications));
      } catch (e) {
        // emit(NotificationsLoadedError(message: e.toString()));
      }
    });
  }
}
