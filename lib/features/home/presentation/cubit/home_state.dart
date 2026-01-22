import 'package:equatable/equatable.dart';
import 'package:kopkar_testing/features/home/domain/entities/transaction_entities.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
} 

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
final TransactionEntities data;

 const HomeLoaded(this.data);
  @override
 List<Object> get props => [data];
}

class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);
}
