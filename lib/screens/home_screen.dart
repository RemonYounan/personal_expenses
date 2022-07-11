import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/screens/notifications_screen.dart';
import 'package:personal_expenses/widgets/all_transactions.dart';
import 'package:personal_expenses/widgets/credit_card_carouse.dart';
import 'package:personal_expenses/widgets/recent_transactions.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home-screen';
  final numFormat = NumberFormat.decimalPattern('en_us');

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: ListTile(
            leading: const CircleAvatar(
              radius: 30,
              child: Icon(Icons.account_circle),
            ),
            title: const Text(
              'Welcome person',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'SourceSansPro',
              ),
            ),
            trailing: IconButton(
              iconSize: 35,
              color: Colors.amber,
              onPressed: () {
                Navigator.pushNamed(context, NotificationsScreen.routeName);
              },
              icon: const Icon(Icons.notifications_sharp),
            ),
          ),
        ),
        const Text(
          'Total balance',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(5, 117, 230, 1),
            fontFamily: 'SourceSansPro',
          ),
        ),
        Text(
          '\$${numFormat.format(4000)}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontFamily: 'SourceSansPro',
          ),
        ),
        const CreditCardCarouse(),
        Card(
          child: ListView(
            primary: false,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Recent transactions',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllTransactions()));
                      },
                      child: const Text(
                        'View all',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              RecentTransactions(),
            ],
          ),
        ),
      ],
    );
  }
}
