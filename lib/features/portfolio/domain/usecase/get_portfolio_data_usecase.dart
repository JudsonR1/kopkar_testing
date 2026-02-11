import 'package:kopkar_testing/features/loan/domain/entities/loan_entity.dart';
import 'package:kopkar_testing/features/loan/domain/repositories/loan_repository.dart';
import 'package:kopkar_testing/features/portfolio/domain/repositories/portoflio_repository.dart';

import '../../../home/domain/entities/account_entity.dart';

class GetPortfolioDataUseCase {
  final PortfolioRepository portfolioRepo;
  final LoanRepository loanRepo;
  GetPortfolioDataUseCase(this.portfolioRepo, this.loanRepo);

  Future<AccountEntity> call() async{
    final LoanEntity loans = await loanRepo.getLoanEntity();  
    final portfolioData = await portfolioRepo.getPortfolioData();

     return portfolioData.copyWith(
      loan: loans,
    );
  }
}
