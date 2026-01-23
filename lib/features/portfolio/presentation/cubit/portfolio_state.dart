
import 'package:equatable/equatable.dart';
import '../../../home/domain/entities/transaction_entities.dart'; 

abstract class PortfolioState extends Equatable {
  const PortfolioState();
  @override
  List<Object> get props => [];
}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  final TransactionEntities data;
  const PortfolioLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class PortfolioError extends PortfolioState {
  final String message;
  const PortfolioError(this.message);
  @override
  List<Object> get props => [message];
}