import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'admin_event.dart';
import 'admin_state.dart';


class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc() : super(AdminInitial()) {
    on<AdminEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
