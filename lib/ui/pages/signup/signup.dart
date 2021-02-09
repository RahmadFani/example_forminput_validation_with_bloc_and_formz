import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopme/blocs/signup/signup_cubit.dart';

part 'page_one.dart';
part 'input_email.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupCubit(),
      child: Scaffold(
        backgroundColor: Color(0xFF3d444f),
        body: PageView(
          children: [PageOne()],
        ),
      ),
    );
  }
}

const signupHeadline =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50);
