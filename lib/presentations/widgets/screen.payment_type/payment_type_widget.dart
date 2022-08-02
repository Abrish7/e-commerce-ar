import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PaymentTypeWidget extends StatelessWidget {
  const PaymentTypeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: 1,
          itemBuilder: ((context, index) {
            return RaisedButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, '/payment');
              },
              child: ListTile(
                leading: Container(
                  // decoration: ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Stripe_Logo%2C_revised_2016.svg/500px-Stripe_Logo%2C_revised_2016.svg.png'),
                ),
                minLeadingWidth: 30,
                title: Text(
                  'Strip',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
                subtitle: Text(
                  'currently available on our product',
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
            );
          })),
    );
  }
}
