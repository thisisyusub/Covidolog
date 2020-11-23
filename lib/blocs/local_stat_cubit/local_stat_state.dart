part of 'local_stat_cubit.dart';

@immutable
abstract class LocalStatState extends Equatable {
  const LocalStatState();

  @override
  List<Object> get props => [];
}

class LocalStatInitial extends LocalStatState {}

class LocalStatInProgress extends LocalStatState {}

class LocalStatSuccess extends LocalStatState {
  const LocalStatSuccess({@required this.azerbaijanStat})
      : assert(azerbaijanStat != null);

  final AzerbaijanStat azerbaijanStat;

  @override
  List<Object> get props => [azerbaijanStat];
}

class LocalStatFailure extends LocalStatState {
  const LocalStatFailure({@required this.errorMessage})
      : assert(errorMessage != null);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
