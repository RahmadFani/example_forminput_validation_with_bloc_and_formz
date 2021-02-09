import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopme/models/signup/signup.dart';
import 'package:stream_transform/stream_transform.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState.init()) {
    subscription?.cancel();
    subscription = streamController.stream.debounce(Duration(milliseconds: 600)).listen((event) {
      verificationEmail(event);
    });
  }

  StreamController<String> streamController = StreamController();
  StreamSubscription subscription;

  void onEmailChanged(String text) {
    emit(state.copyWith(email: EmailInput.dirty(value: text).setLoading( true)));
    streamController.add(text);
  }

  void verificationEmail(String streamText) async {
    await Future.delayed(Duration(milliseconds: 1000));
    if (streamText == 'rahmadfani46@gmail.com') {
      emit(state.copyWith(
      email: state.email.setLoading(false).setCustomError(EmailInputError.alreadyInUse)
    ));
    } else {
       emit(state.copyWith(
      email: state.email.setLoading(false)
    ));
    }
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
