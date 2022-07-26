import 'package:ecommerce_v3/presentations/widgets/screen.home/filter_type.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.home/item.dart';
import 'package:ecommerce_v3/presentations/common/skeloton.dart';
import 'package:flutter/material.dart';
import '../../common/theme_helper.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // _searchField(),
          const FilterType(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Most viewed item ->',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(2),
                    child: RaisedButton(
                      elevation: 0.5,
                      child: const ListItem(),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed('/product_detail', arguments: index);
                      },
                      color: Colors.white,
                    ),
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Most viewed item ->',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(2),
                    child: RaisedButton(
                      elevation: 0.5,
                      child: const ListItem(),
                      onPressed: () {},
                      color: Colors.white,
                    ),
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: Text(
                  'My Cart',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(2.0),
                    child: RaisedButton(
                      elevation: .5,
                      color: Colors.white,
                      child: cartSkeleton(),
                      onPressed: () => null,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
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
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            child: Skeleton(height: 10, width: 120),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            child: Skeleton(height: 10, width: 100),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Skeleton(height: 10, width: 50),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Skeleton(height: 10, width: 80),
          ),
        ],
      ),
    );
  }

  Widget _searchField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: false,
        decoration: ThemeHelper().searchInputDecoration(
            'Search', '', '', false, const Icon(Icons.search)),
        onChanged: (value) {},
      ),
    );
  }
}
