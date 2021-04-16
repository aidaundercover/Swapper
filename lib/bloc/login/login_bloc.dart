import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:swapper/reposotories/userRepository.dart';
import 'package:swapper/views/validators.dart';
import 'package:meta/meta.dart';
import './bloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;

  LoginBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository, super(null);

  LoginState get initialState => LoginState.empty();

  // TransitionFunction<PostsEvent, PostsState> transitionFn) {
  // return super.transformEvents(
  //   events.debounceTime(const Duration(milliseconds: 300)),
  //   transitionFn,
  // );

  @override
  Stream<Transition<LoginEvent,LoginState>> transformEvents(
    Stream<LoginEvent> events,
    TransitionFunction<LoginEvent,LoginState> next,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! EmailChanged || event is! PasswordChanged);
    });

    final debounceStream = events.where((event) {
      return (event is EmailChanged || event is PasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      next,
    );
  }

  Function newMethod(Stream<LoginState> next(LoginEvent event)) => next;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialsPressedToState(
          email: event.email, password: event.password);
    }
  }

  Stream<LoginState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<LoginState> _mapPasswordChangedToState(String password) async* {
    yield state.update(isEmailValid: Validators.isValidPassword(password));
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({
    String email,
    String password,
  }) async* {
    yield LoginState.loading();

    try {
      await _userRepository.signInWithEmail(email, password);

      yield LoginState.success();
    } catch (_) {
      LoginState.failure();
    }
  }
}
