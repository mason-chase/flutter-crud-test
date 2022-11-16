import 'package:flutter/material.dart';
import 'package:mc_crud_test/core/data/data_source/local/customer_entity.dart';

class CustomerList extends StatelessWidget {
  List<CustomerEntity> customerList;

  CustomerList({required this.customerList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: false,
        scrollDirection: Axis.vertical,
        itemCount: 5, //customerList.length,
        itemBuilder: (context, index) {
      return Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                      child: IconButton(icon: Icon(Icons.person), color: Theme.of(context).iconTheme.color, onPressed: () {  },
              ))),
              Expanded(child: Container(
                      child: IconButton(icon: Icon(Icons.person), color: Theme.of(context).iconTheme.color, onPressed: () {  },
              ))),
              Expanded(
                flex: 6,
                child: Container(
                  width: double.infinity,
                  child: Text(
                    customerList[index].firstName!,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
        },
      ),
    );
  }
}
