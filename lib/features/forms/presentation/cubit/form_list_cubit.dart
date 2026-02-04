import 'package:flutter_bloc/flutter_bloc.dart';

import 'form_list_state.dart';

class FormListCubit extends Cubit<FormListState> {
  FormListCubit() : super(FormListInitial());

  Future<void> loadForms() async {
    emit(FormListLoading());

    try {
 
       await Future.delayed(const Duration(seconds: 1));
       final List<Map<String, String>> mockForms = [
  {
    'title': 'Form pengajuan member baru',
    'subtitle': '5 May 2024',
    'url': 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
    'type': 'pdf'
  },
  {
    'title': 'Form pinjaman',
    'subtitle': 'Last updated at 6 May 2024',
    'url': 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
    'type': 'pdf'
  },
    {
    'title': 'Form top up pinjaman',
    'subtitle': 'Last updated at 6 May 2024',
    'url': 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
    'type': 'pdf'
  },
    {
    'title': 'Form pengambilan pinjaman sukarela',
    'subtitle': 'Last updated at 6 May 2024',
    'url': 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
    'type': 'pdf'
  },
  {
    'title': 'Form pengajuan member baru',
    'subtitle': '5 May 2024',
    'url': 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
    'type': 'pdf'
  },
  {
    'title': 'Form pinjaman',
    'subtitle': 'Last updated at 6 May 2024',
    'url': 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
    'type': 'pdf'
  },
    {
    'title': 'Form top up pinjaman',
    'subtitle': 'Last updated at 6 May 2024',
    'url': 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
    'type': 'pdf'
  },
    {
    'title': 'Form pengambilan pinjaman sukarela',
    'subtitle': 'Last updated at 6 May 2024',
    'url': 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
    'type': 'pdf'
  }
];
       emit(FormListLoaded(mockForms));
    } catch (e) {
      emit(FormListError('Failed to load Forms'));
    }
  }
}
