import 'package:ecommerce_v3/presentations/widgets/screen.product/product_item.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.product/product_list.dart';
import 'package:flutter/material.dart';
import '../../../data/model/product_sub_category.dart';
import '../../../data/provider/product_category_api.dart';

class FilterType extends StatefulWidget {
  const FilterType({Key? key}) : super(key: key);
  @override
  State<FilterType> createState() => _FilterTypeState();
}

class _FilterTypeState extends State<FilterType> {
  late int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        categoryBuilder(),
      ],
    );
  }

  Padding categoryBuilder() {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: SizedBox(height: 50, child: FutureForCategoryList()));
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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: bindingDataForCategoryList(data, index),
      ),
    );
  }

  Column bindingDataForCategoryList(data, index) {
    Icon iconType = const Icon(Icons.sell);
    if (data[index] == "Selling") {
      iconType = const Icon(Icons.sell);
    }
    if (data[index] == "Deals") {
      iconType = const Icon(Icons.handshake);
    }
    if (data[index] == "Category") {
      iconType = const Icon(Icons.category);
    }
    if (data[index] == "Saved") {
      iconType = const Icon(Icons.favorite);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RaisedButton.icon(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          elevation: 0,
          onPressed: () {
            if (data[index] == "Category") {
              Navigator.of(context).pushNamed("/category");
            }
          },
          icon: (iconType),
          label: Text(
            data[index],
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
