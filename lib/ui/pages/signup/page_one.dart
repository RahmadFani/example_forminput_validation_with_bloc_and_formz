
part of 'signup.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('New', style: signupHeadline,),
          Text('Account', style: signupHeadline),
          SizedBox(
            height: 20,
          ),
          InputEmail(),
        ],
      ),
    );
  }
}