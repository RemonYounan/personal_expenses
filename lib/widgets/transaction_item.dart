import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/others/transaction_icon.dart';
import 'package:personal_expenses/providers/transactions.dart';

class TransactionItem extends StatelessWidget {
  TransactionItem(
    this.transactions,
    this.index, {
    Key? key,
  }) : super(key: key);
  Transactions transactions;
  int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      leading: CircleAvatar(
        radius: 30,
        child: Icon(
          TransactionIcon.getIcon(transactions.transactions[index].category!),
          color: Colors.amber,
          size: 30,
        ),
      ),
      title: Text(
        '${transactions.transactions[index].title}',
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      subtitle: Text(
        DateFormat.yMEd().format(transactions.transactions[index].date!),
        // '${DateTime.now().difference(transactions.transactions[index].date!).inHours} hours ago',
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '\$${transactions.transactions[index].amount!.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.lightGreen,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
          ),
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert_rounded,
              color: Theme.of(context).colorScheme.secondary,
            ),
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            itemBuilder: (context) => [
              // PopupMenuItem(
              //   onTap: () => print('edit pressed from onTap'),
              //   value: 0,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: const [
              //       Icon(
              //         Icons.edit,
              //         color: Colors.white,
              //         size: 28,
              //       ),
              //       Expanded(child: Text('Edit')),
              //     ],
              //   ),
              // ),
              PopupMenuItem(
                value: 1,
                onTap: () =>
                    transactions.deleteTx(transactions.transactions[index].id!),
                padding: const EdgeInsets.all(6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                      size: 30,
                    ),
                    Text(
                      'Delete',
                      style: TextStyle(color: Theme.of(context).errorColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
