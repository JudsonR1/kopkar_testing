import 'package:kopkar_testing/features/portfolio/domain/entities/savings_entity.dart';
import 'package:kopkar_testing/features/portfolio/domain/repositories/savings_repository.dart';

class GetSavingsDetailsUsecase {
  final SavingsRepository repository;
    GetSavingsDetailsUsecase(this.repository);
  
   Future<SavingsEntity> call(String type) async {
    return await repository.getSavingsData(type);
  }
  
}