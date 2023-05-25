import 'package:equatable/equatable.dart';

abstract class AdminState extends Equatable {
  const AdminState();

  @override
  List<Object> get props => [];
}

class AdminInitial extends AdminState {}

class AdminLoading extends AdminState {}

class AdminLoaded extends AdminState {}

class AdminError extends AdminState {
  final String error;
  const AdminError({required this.error});

  @override
  List<Object> get props => [error];
}

class AdminSuccess extends AdminState {
  final String message;

  const AdminSuccess({required this.message});

  @override
  List<Object> get props => [message];
}
