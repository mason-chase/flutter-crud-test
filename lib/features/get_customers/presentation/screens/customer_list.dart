import 'package:flutter/material.dart';

import '../../../../core/data/data_source/local/customer_entity.dart';
import '../widgets/customer_list.dart';

class AllCustomers extends StatelessWidget {
  const AllCustomers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customers"),
      ),
      body: CustomerList(customerList: [CustomerEntity(),CustomerEntity(),CustomerEntity(),CustomerEntity(),CustomerEntity()],),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
    );
  }
}
