import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/application/notifications/bloc/notification_bloc.dart';
import 'package:frontend/application/notifications/bloc/notification_state.dart';
import 'package:frontend/application/notifications/bloc/notification_event.dart';
import 'package:frontend/domain/notifications/Model/notification_model.dart';
import 'package:bloc_test/bloc_test.dart';
void main(){
  group('Notification bloc',(){
    Notification mockN=Notification(id: 0, recipientId: 1,
    message: 'message', seen: false);
    NotificationBloc buildBloc()=>NotificationBloc();
    group('constructor',(){
      test('returns normally',(){
        expect(buildBloc(),returnsNormally);
      });
      test('has correct initial state',(){
        expect(buildBloc().state,equals(NotificationInitial()));
      });
    });
    group('NotificationEvent', () {
      // blocTest('emits NotificationLoading state', 
      // build: ()=>NotificationBloc(),
      // act:(bloc){bloc.add(NotificationEvent());}
      // );
     });
    group('NotificationLoadEvent',(){
      blocTest('emits [success] or [error]', 
      build:()=>NotificationBloc(),
      act:(bloc)=>bloc.add(NotificationLoadEvent()),
      expect: ()=>[isA<NotificationsLoadedSuccess>(),
                  isA<NotificationsLoadedError>()]
      
      );
    });
    group('Notification mark as done',(){
      blocTest('Emits [success]',build:()=>NotificationBloc());
    }); 
  });
}