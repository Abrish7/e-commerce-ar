import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/sub_category/sub_category_cubit.dart';
import '../../common/screen_arguments.dart';

class CircularImg extends StatelessWidget {
  const CircularImg({Key? key, required this.img, required this.name})
      : super(key: key);
  final String img;
  final String name;
  @override
  Widget build(BuildContext context) {
    final image = NetworkImage(img);

    return Stack(
      children: [
        _profileImage(image, context),
      ],
    );
  }

  ClipOval _profileImage(NetworkImage image, context) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          width: 128,
          height: 128,
          image: image,
          child: InkWell(
            onTap: (() {
              BlocProvider.of<SubCategoryCubit>(context)
                  .setProductSubCategoryLoaded(subCategory: name.toString());
              Navigator.of(context).pushNamed('/subCategory',
                  arguments: Category(category: name, subCategory: "Shoes"));
            }),
          ),
        ),
      ),
    );
  }

  editButton(Color color) {
    return buildCircle(
      all: 3,
      color: Colors.white,
      child: buildCircle(
        color: color,
        all: 8.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  buildCircle(
      {required Color color, required double all, required Widget child}) {
    return ClipOval(
      child: Container(
        padding: EdgeInsets.all(all),
        color: color,
        child: child,
      ),
    );
  }
}
