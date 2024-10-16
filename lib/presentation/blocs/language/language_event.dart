part of 'language_bloc.dart';

@immutable
sealed class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object?> get props => [];
}

class ChooseLanguageEvent extends LanguageEvent {
  const ChooseLanguageEvent(this.locale);

  final Locale locale;

  @override
  List<Object?> get props => [locale];
}
