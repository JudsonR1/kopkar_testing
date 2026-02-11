import 'package:kopkar_testing/features/portfolio/data/datasource/savings_datasource.dart';
import 'package:kopkar_testing/features/portfolio/domain/entities/savings_entity.dart';
import 'package:kopkar_testing/features/portfolio/domain/repositories/savings_repository.dart';

class SavingsRepositoryImpl implements SavingsRepository {
  final SavingsDataSource dataSource;

  SavingsRepositoryImpl({required this.dataSource});

  @override
  Future<SavingsEntity> getSavingsData(String type) {
    return dataSource.getSavingsData(type);
  }
}
