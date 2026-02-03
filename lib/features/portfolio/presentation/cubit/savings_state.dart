import 'package:equatable/equatable.dart';
import '../../domain/entities/savings_entity.dart';

abstract class SavingsState extends Equatable {
  const SavingsState();

  @override
  List<Object> get props => [];
}

class SavingsDetailInitial extends SavingsState {}

class SavingsDetailLoading extends SavingsState {}

class SavingsDetailLoaded extends SavingsState {
  final SavingsEntity data;

  const SavingsDetailLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class SavingsDetailError extends SavingsState {
  final String message;

  const SavingsDetailError(this.message);

  @override
  List<Object> get props => [message];
}