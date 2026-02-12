import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopkar_testing/dependency_injection.dart';
import 'package:kopkar_testing/features/forms/presentation/cubit/form_list_cubit.dart';
import 'package:kopkar_testing/features/forms/presentation/cubit/form_list_state.dart';

import '../widgets/form_list_item.dart';

class FormsScreen extends StatelessWidget {
  const FormsScreen({super.key});

  @override
   Widget build(BuildContext context) {
   final sl = DependencyInjection.getInstance.getIt;

    return BlocProvider(
      create: (_) => sl<FormListCubit>()..loadForms(),
      child: const FormsView(),
    );
  }
}

class FormsView extends StatelessWidget {
  const FormsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder <FormListCubit,FormListState>(
        builder: (context,state){
            if (state is FormListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FormListLoaded) {
            
           
  final forms = state.forms;

  return ListView.separated(
    padding: const EdgeInsets.only(top: 40),
    itemCount: forms.length + 1,
    separatorBuilder: (context, index) {
      if (index == 0) {
                  return const SizedBox.shrink();
                }
                return const Divider();
    },
    itemBuilder: (context, index) {
      // Header
      if (index == 0) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(
            "Formulir",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        );
      }

      final form = forms[index - 1];

      return FormListItem(
        title: form['title']!,
        subtitle: form['subtitle']!,
        type: form['type']!,
        url: form['url']!,
      );
    },
  );
          } else if (state is FormListError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
  }
      ),


    );
  }
}