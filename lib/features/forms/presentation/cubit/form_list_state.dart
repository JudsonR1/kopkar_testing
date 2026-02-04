import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class FormListState extends Equatable{
  const FormListState ();

  @override
  List<Object> get props => [];
}

class FormListInitial extends FormListState {}

class FormListLoading extends FormListState {}

class FormListLoaded extends FormListState {
    final List<Map<String, String>> forms;

    const FormListLoaded(this.forms);
}
class FormListEmpty extends FormListState {}

class FormListError extends FormListState {
  final String message;
  const FormListError(this.message);
}
