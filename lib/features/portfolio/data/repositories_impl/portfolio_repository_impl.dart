import 'package:kopkar_testing/features/loan/domain/entities/loan_entity.dart';
import 'package:kopkar_testing/features/loan/domain/repositories/loan_repository.dart';
import 'package:kopkar_testing/features/portfolio/data/datasource/portfolio_datasource.dart';
import 'package:kopkar_testing/features/portfolio/domain/repositories/portoflio_repository.dart';
import '../../../home/domain/entities/account_entity.dart';


class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioDataSource dataSource;

  PortfolioRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<AccountEntity> getPortfolioData() async {
    return dataSource.getPortfolioData();
  }
}
