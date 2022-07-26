import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../common/skeloton.dart';

class SubCategorySkeleton extends StatelessWidget {
  const SubCategorySkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cartSkeleton();
  }

  cartSkeleton() {
    return Container(
      color: Colors.grey[150],
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Skeleton(
            height: 150,
            width: 150,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Skeleton(height: 10, width: 50),
          ),
        ],
      ),
    );
  }
}
