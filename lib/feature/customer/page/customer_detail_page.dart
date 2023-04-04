import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/core/customer/data/dto/customer_dto.dart';
import 'package:mc_crud_test/core/customer/domain/entity/customer_entity.dart';
import 'package:mc_crud_test/feature/customer/bloc/customer_bloc.dart';
import 'package:mc_crud_test/feature/customer/widget/customer_button_widget.dart';

class CustomerDetailPage extends StatelessWidget {
  CustomerDetailPage({Key? key, this.customerData, this.index})
      : super(key: key);
  CustomerEntity? customerData;
  int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Detail"),
        backgroundColor: Colors.purple,
        leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: BlocBuilder<CustomerBloc, CustomerState>(
        builder: ((context, state) {
          switch (state.status) {
            case CustomerStatus.initial:
              return _mainWidget(
                customerData: customerData,
                index: index,
              );
            case CustomerStatus.deleted:
              Future.delayed(Duration(microseconds: 500), () {
                context.read<CustomerBloc>().add(GetCustomers());
                Navigator.of(context).pop();
              });
              return _mainWidget(
                customerData: customerData,
                index: index,
              );
            case CustomerStatus.error:
              Future.delayed(Duration(microseconds: 500), () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.purple,
                  content: Text('Customer not deleted'),
                ));
              });
              return _mainWidget(
                customerData: customerData,
                index: index,
              );
            default:
              return _mainWidget(
                customerData: customerData,
                index: index,
              );
          }
        }),
      ),
    );
  }
}

class _mainWidget extends StatelessWidget {
  const _mainWidget({
    Key? key,
    required this.customerData,
    required this.index,
  }) : super(key: key);

  final CustomerEntity? customerData;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          _labelWidget(
            text: "First Name",
          ),
          SizedBox(
            height: 8.0,
          ),
          _infoWidget(
            text: customerData?.firstName ?? "",
          ),
          _labelWidget(
            text: "Last Name",
          ),
          SizedBox(
            height: 8.0,
          ),
          _infoWidget(
            text: customerData?.lastName ?? "",
          ),
          _labelWidget(
            text: "Date Of Birth",
          ),
          SizedBox(
            height: 8.0,
          ),
          _infoWidget(
            text: customerData?.dateOfBirth ?? "",
          ),
          _labelWidget(
            text: "Phone Number",
          ),
          SizedBox(
            height: 8.0,
          ),
          _infoWidget(
            text: customerData?.phoneNumber ?? "",
          ),
          _labelWidget(
            text: "Email Address",
          ),
          SizedBox(
            height: 8.0,
          ),
          _infoWidget(
            text: customerData?.email ?? "",
          ),
          _labelWidget(
            text: "Bank Acount Number",
          ),
          SizedBox(
            height: 8.0,
          ),
          _infoWidget(
            text: customerData?.bankAcountNumber ?? "",
          ),
          SizedBox(
            height: 16.0,
          ),
          Container(
              height: 60.0,
              child: CustomerButtonWidget(
                      onPressed: () {
                        context
                            .read<CustomerBloc>()
                            .add(IsUpdatingCustomer(isUpdatingCustomer: true));
                        context.read<CustomerBloc>().add(
                            UpdatingCustomer(updatingCustomer: customerData!));
                      },
                      text: "UPDATE")
                  .button()),
          SizedBox(
            height: 12.0,
          ),
          Container(
              height: 60.0,
              child: CustomerButtonWidget(
                      onPressed: () {
                        context.read<CustomerBloc>().add(DeleteCustomer(
                            selectedCustomerIndex: context
                                .read<CustomerBloc>()
                                .state
                                .selectedCustomerIndex));
                      },
                      text: "DELETE")
                  .button()),
        ]),
      ),
    );
  }
}

class _infoWidget extends StatelessWidget {
  _infoWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      ),
    );
  }
}

class _labelWidget extends StatelessWidget {
  _labelWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    );
  }
}
