import 'package:ecommerce_v3/presentations/widgets/screen.profile/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/auth/cubit/user_cubit.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileImage(),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          _buildName()
        ],
      ),
    );
  }

  _buildName() {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '${state.user.firstname} ${state.user.lastname}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text(
              '${state.user.email}',
              style: TextStyle(color: Colors.grey),
            )
          ],
        );
      },
    );
  }
}
