import 'package:ecommerce_v3/presentations/widgets/screen.product/product_item.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.product/product_list.dart';
import 'package:flutter/material.dart';
import '../../../data/model/product_sub_category.dart';
import '../../../data/provider/product_category_api.dart';

class ProductCategoryWidget extends StatefulWidget {
  const ProductCategoryWidget({Key? key}) : super(key: key);
  @override
  State<ProductCategoryWidget> createState() => _ProductCategoryWidgetState();
}

class _ProductCategoryWidgetState extends State<ProductCategoryWidget> {
  late int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [headingTitle(), categoryBuilder(), const ProductList()],
    );
  }

  Padding headingTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
      child: Text(
        'Category',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding categoryBuilder() {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(height: 35, child: FutureForCategoryList()));
  }

  ListView FutureForCategoryList() {
    final List<String> filterBy = ["Selling", "Deals", "Category", "Saved"];

    return ListViewForCategoryList(filterBy);
  }

  ListView ListViewForCategoryList(List<String> data) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return builtCategory(index, context, data);
        });
  }

  Widget builtCategory(index, context, data) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: bindingDataForCategoryList(data, index),
      ),
    );
  }

  Column bindingDataForCategoryList(data, index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data[index].name,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: currentIndex == index ? Colors.black : Colors.grey),
        ),
        Container(
            margin: const EdgeInsets.only(top: 5),
            height: 2,
            width: 30,
            color: currentIndex == index ? Colors.black : Colors.transparent)
      ],
    );
  }
}
