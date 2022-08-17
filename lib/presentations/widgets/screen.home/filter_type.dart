import 'package:ecommerce_v3/logic/tag/tag_cubit.dart';
import 'package:ecommerce_v3/logic/tag/tag_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        child: SizedBox(height: 50, child: ListViewForCategoryList()));
  }

  // ListView FutureForCategoryList() {
  //   final List<String> filterBy = ["Selling", "Deals", "Category", "Saved"];

  //   return ListViewForCategoryList(filterBy);
  // }

  BlocBuilder<TagCubit, TagState> ListViewForCategoryList() {
    return BlocBuilder<TagCubit, TagState>(
      builder: (context, state) {
        if (state is TagLoaded) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.tags.length,
              itemBuilder: (context, index) {
                return builtCategory(index, context, state.tags[index].tagName);
              });
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: deprecated_member_use
        RaisedButton.icon(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          elevation: 0,
          onPressed: () {
            BlocProvider.of<TagProductCubit>(context)
                .getTagProduct(tagName: data);
            Navigator.of(context).pushNamed("/product_filter_by_tag");
          },
          icon: (iconType),
          label: Text(
            data,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
