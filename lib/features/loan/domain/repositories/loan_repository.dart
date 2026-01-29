import 'package:kopkar_testing/features/loan/domain/entities/loan_entity.dart';

import '../entities/loan_payment.dart';

abstract class LoanRepository {
  Future<LoanEntity> getLoanEntity();
}