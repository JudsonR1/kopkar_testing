import 'package:equatable/equatable.dart';
import 'package:kopkar_testing/features/loan/domain/entities/loan_entity.dart';
import '../../domain/entities/loan_payment.dart';

abstract class LoanDetailState extends Equatable {
  const LoanDetailState();

  @override
  List<Object> get props => [];
}

class LoanDetailInitial extends LoanDetailState {}

class LoanDetailLoading extends LoanDetailState {}

class LoanDetailLoaded extends LoanDetailState {
  final LoanEntity history;

  const LoanDetailLoaded(this.history);

  @override
  List<Object> get props => [history];
}

class LoanDetailError extends LoanDetailState {
  final String message;

  const LoanDetailError(this.message);

  @override
  List<Object> get props => [message];
}