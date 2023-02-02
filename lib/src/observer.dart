import 'package:bloc/bloc.dart';

class Observer extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print('$bloc.runtimeType, change');
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('$bloc.runtimeType, transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('$bloc.runtimeType, $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
