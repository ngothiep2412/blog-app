import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:i18n_extension/i18n_extension.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitialState(I18n.locale)) {
    on<ChooseLanguageEvent>((event, emit) {
      emit(LanguageUpdateState(event.locale));
    });
  }
}
