import 'package:ecommerce_v3/logic/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is SearchLoaded) {
          return ListView.builder(
              itemCount: state.products.docs.length,
              // itemCount: 5,
              itemBuilder: ((context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: InkWell(
                    splashColor: Colors.blue,
                    overlayColor: MaterialStateProperty.all(Colors.blue),
                    highlightColor: Colors.red,
                    hoverColor: Colors.grey,
                    onTap: () {
                      Navigator.of(context).pushNamed('/search_detail');
                    },
                    // color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildImage(
                            state.products.docs[index].images[0].toString()),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 300,
                              padding: EdgeInsets.only(top: 5, left: 10),
                              child: Text(
                                state.products.docs[index].name.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 18),
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5, left: 10),
                              child: Text(
                                state.products.docs[index].tags[0].toString(),
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }));
        }
        return Container();
      },
    );
  }

  _buildImage(String image) {
    return Container(
      width: 60,
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      child: Image.network(image),
    );
  }
}
