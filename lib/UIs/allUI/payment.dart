
import 'package:flutter/material.dart';
import 'package:flutter_rave/flutter_rave.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  // Payments pay = Payments();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Payment'),
        centerTitle: true,
      ),
      body: Center(
        child: Builder(
          builder: (context) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: InkWell(
                onTap: () => _pay(context),
                child: Card(
                  color: Colors.pinkAccent,
                  elevation: 15,
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Card Payment",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.payment,
                            color: Colors.black,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  _pay(BuildContext context){
  final snackBaronFailure = SnackBar(content: Text('Transaction Failed :('), backgroundColor: Colors.red,);
  final snackBaronClosed = SnackBar(content: Text('Transaction Closed !'), backgroundColor: Colors.amber,);
  final _rave = RaveCardPayment(
    isDemo: false,
    encKey:"75bbce79a9ac2fd0c035865e",
    publicKey: "FLWPUBK-1bb46cacbb720bb232c0d36ff0af566b-X",
    transactionRef: "hvHPvKYaRuJLlJWSPWGGKUyaAfWeZKnm",
    amount: 10,
    email: 'chiagozieani145@gmail.com',
    onSuccess: (response){
      print('$response');
      print('Transaction Successful');
      if (mounted){
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Transaction Successful'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 5),
          ),
        );
      }
    },
    onFailure: (err){
      print('$err');
      print('Transaction Failed');
      Scaffold.of(context).showSnackBar(snackBaronFailure);
    },
    onClosed: (){
      print('Transaction Closed!');
      Scaffold.of(context).showSnackBar(snackBaronClosed);
    },
    context: context,
  );
  _rave.process();
}
}