import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../common/theme_helper.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _productImage(),
          Container(
            padding: const EdgeInsets.only(left: 10.0, top: 5),
            child: const Text(
              'Nike Shoe',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10.0),
            child: const Text(
              'Nike air force low \ntravis scott cactus jack.\n(CN2433-900)mens. ',
              style: TextStyle(),
              maxLines: 3,
              overflow: TextOverflow.visible,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10.0, top: 5),
            child: const Text(
              'ET \$599.00BR',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          RatingBar.builder(
            itemSize: 20,
            glowRadius: 5,
            initialRating: 1,
            minRating: 2,
            glow: true,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding:
                const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
              size: 5,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          )
        ],
      ),
    );
  }

  _productImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
      child: Container(
        height: 150,
        width: 150,
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Image.asset('assets/images/shoe.png'),
      ),
    );
  }
}
