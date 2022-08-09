import 'package:flutter/material.dart';

class PaymentTypeWidget extends StatelessWidget {
  const PaymentTypeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> link = [
      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Stripe_Logo%2C_revised_2016.svg/500px-Stripe_Logo%2C_revised_2016.svg.png",
      "https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/jhtoyctrmft0hpkxhtl7",
    ];
    final List<String> payment = ["Stripe", "Chapa"];
    return Container(
      padding: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: 2,
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
                  child: Image.network(link[index]),
                ),
                minLeadingWidth: 30,
                title: Text(
                  payment[index],
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
