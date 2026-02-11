import 'package:kopkar_testing/features/loan/domain/entities/loan_entity.dart';

import '../../../home/domain/entities/account_entity.dart';

abstract class PortfolioRepository {
  Future<AccountEntity> getPortfolioData();
}
