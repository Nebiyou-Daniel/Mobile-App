import 'package:flutter_test/flutter_test.dart';
import '../../lib/notifications/bloc/notification_state.dart';
import 'package:frontend/notifications/Model/notification_model.dart';
void main(){
  group("NotificationState",(){
    Notification createNSubject()=>Notification(id:0,recipientId:0,
    message:'message',seen:false);
    group ("NotificationState, initial",(){
      test("Supports value equality",(){
        expect(NotificationInitial(),equals(NotificationInitial()));
      });
      test("props are correct",(){
        expect(NotificationInitial().props,equals([]));
      });

    });

    group ("NotificationState, loading",(){
      test("Supports value equality",(){
        expect(NotificationsLoading(),equals(NotificationsLoading()));
      });
      
      
      test("props are correct",(){
        expect(NotificationsLoading().props,equals([]));
      });
    });

    group ("NotificationState, loaded success",(){
      List<Notification> notifications=[createNSubject()];
      test("Supports value equality",(){
        expect(NotificationsLoadedSuccess(notifications:notifications ),
        equals(NotificationsLoadedSuccess(notifications:notifications)));
      });
      test("props are correct",(){
        expect(NotificationsLoadedSuccess(notifications:notifications).props,
        equals([notifications])
        );
      });

      
    });

    group ("NotificationState, loaded error",(){
      test("Supports value equality",(){
        expect(const NotificationsLoadedError(message:'error'),
        equals(const NotificationsLoadedError(message:'error'))
        );
      });
      test("props are correct",(){
        expect(const NotificationsLoadedError(message:'error').props,
        equals(['error'])
        );
      });
      

      
    });

  });
}