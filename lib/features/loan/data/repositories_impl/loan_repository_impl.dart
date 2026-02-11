import '../../domain/entities/loan_entity.dart';
import '../../domain/repositories/loan_repository.dart';
import '../datasource/loan_datasource.dart';

class LoanRepositoryImpl implements LoanRepository {
  final LoanDataSource dataSource;

  LoanRepositoryImpl({required this.dataSource});

  @override
  Future<LoanEntity> getLoanEntity() {
    return dataSource.getLoanData();
  }
}
