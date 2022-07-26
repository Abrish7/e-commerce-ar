import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final images = ['assets/images/shoe.png', 'assets/images/shoe.png'];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .4,
              child: CarouselSlider.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index, relIndex) {
                    final urlImage = images[index];
                    return _buildImage(urlImage, index);
                  },
                  options: CarouselOptions(height: 400)),
            )
          ],
        ),
      ],
    );
  }

  _buildImage(String image, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.grey,
    );
  }
}
