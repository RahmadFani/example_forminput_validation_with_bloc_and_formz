part of 'signup.dart';

class InputEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) =>
          previous.email.value != current.email.value || previous.email.loading != current.email.loading,
      builder: (_, state) {
        return TextField(
          style: TextStyle(color: Colors.white),
          onChanged: (text) => context.read<SignupCubit>().onEmailChanged(text),
          decoration: InputDecoration(
            suffixIcon: state.email.loading ? Padding(
              padding: const EdgeInsets.all(15.0),
              child: CircularProgressIndicator(),
            ): null,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            focusedErrorBorder: outlineErrorInputBorder,
            errorBorder: outlineErrorInputBorder,
            errorText: state.email.errorMsg
          ),
        );
      },
    );
  }
}

const outlineInputBorder =
    OutlineInputBorder(borderSide: BorderSide(color: Colors.white));

const outlineErrorInputBorder =
    OutlineInputBorder(borderSide: BorderSide(color: Colors.red));
