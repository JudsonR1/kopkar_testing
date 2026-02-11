import 'package:kopkar_testing/features/loan/domain/entities/loan_entity.dart';
import 'package:kopkar_testing/features/loan/domain/repositories/loan_repository.dart';

class GetLoanDetailsUsecase {
  final LoanRepository repository;
GetLoanDetailsUsecase(this.repository);
Future<LoanEntity> call() async {
    return await repository.getLoanEntity();
  }
}