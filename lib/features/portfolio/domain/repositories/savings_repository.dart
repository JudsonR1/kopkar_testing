import 'package:kopkar_testing/features/portfolio/domain/entities/savings_entity.dart';



abstract class SavingsRepository {
  Future<SavingsEntity> getSavingsData(String type);
}