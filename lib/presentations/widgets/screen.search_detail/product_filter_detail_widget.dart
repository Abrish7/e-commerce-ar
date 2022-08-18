import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_v3/logic/product/product_cubit.dart';
import 'package:ecommerce_v3/logic/tag/tag_product_cubit.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.product_detail/product_add_to_cart_ar_btn.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.product_detail/product_description.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.product_detail/product_quantity_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductFilterDetailsWidget extends StatefulWidget {
  const ProductFilterDetailsWidget({Key? key, required this.index})
      : super(key: key);
  final int index;

  @override
  State<ProductFilterDetailsWidget> createState() =>
      _ProductFilterDetailsWidgetState();
}

class _ProductFilterDetailsWidgetState
    extends State<ProductFilterDetailsWidget> {
  int activeIndex = 0;
  int imageSize = 0;
  @override
  Widget build(BuildContext context) {
    // final images = ['assets/images/shoe.png', 'assets/images/shoe.png'];
    return BlocBuilder<TagProductCubit, TagProductState>(
      builder: (context, state) {
        if (state is TagProductLoaded) {
          imageSize = state.product[this.widget.index].images.length;
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          CarouselSlider.builder(
                              itemCount:
                                  state.product[widget.index].images.length,
                              itemBuilder: (context, index, relIndex) {
                                final urlImage = state
                                    .product[this.widget.index].images[index];
                                return _buildImage(urlImage, index);
                              },
                              options: CarouselOptions(
                                  enlargeCenterPage: true,
                                  enlargeStrategy:
                                      CenterPageEnlargeStrategy.height,
                                  enableInfiniteScroll: false,
                                  // viewportFraction: 1,
                                  height: 250,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 10),
                                  onPageChanged: (index, reason) =>
                                      setState(() => activeIndex = index))),
                          SizedBox(
                            height: 10,
                          ),
                          _buildImageIndicator(),
                          SizedBox(
                            height: 20,
                          ),
                          _buildDetailDescription(),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  _buildImage(String image, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      child: Image.network(image),
    );
  }

  Widget _buildImageIndicator() => AnimatedSmoothIndicator(
        activeIndex: this.activeIndex,
        curve: Curves.easeInOut,
        count: imageSize,
        effect: JumpingDotEffect(
            dotWidth: 10,
            dotHeight: 10,
            activeDotColor: Color.fromARGB(255, 252, 113, 103),
            dotColor: Colors.black12),
      );

  Widget _buildDetailDescription() => Container(
        height: 500,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            // boxShadow: 10,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), //color of shadow
                spreadRadius: 3, //spread radius
                blurRadius: .5, // blur radius
                offset: Offset(0, 2), // changes position of shadow
                //first paramerter of offset is left-right
                //second parameter is top to down
              )
              //you can set more BoxShadow() here
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            BlocBuilder<ProductCubit, ProductState>(builder: ((context, state) {
              if (state is ProductLoaded) {
                return Container(
                    width: 200,
                    child: Text(
                      state.product[this.widget.index].name,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })),
            SizedBox(
              height: 20,
            ),
            ProductDescription(index: this.widget.index),
            // product quantity
            ProductQuantityCounter(index: this.widget.index),
            // Add to cart and ar-try-on button
            ProductAddToCartAndARBtn(
              index: this.widget.index,
            )
          ],
        ),
      );
}
