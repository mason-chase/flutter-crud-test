import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/core/customer/domain/entity/customer_entity.dart';
import 'package:mc_crud_test/feature/customer/bloc/customer_bloc.dart';
import 'package:mc_crud_test/feature/customer/page/customer_add_page.dart';
import 'package:mc_crud_test/feature/customer/page/customer_detail_page.dart';
import 'package:mc_crud_test/feature/customer/widget/customer_button_widget.dart';
import 'package:mc_crud_test/feature/customer/widget/customer_info_widget.dart';

class CustomersListPage extends StatefulWidget {
  const CustomersListPage({Key? key}) : super(key: key);

  @override
  State<CustomersListPage> createState() => _CustomersListPageState();
}

class _CustomersListPageState extends State<CustomersListPage> {
  late ScrollController _controller = ScrollController();
  CustomerBloc? _bloc;

  @override
  void initState() {
    context.read<CustomerBloc>().add(
          GetCustomers(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      builder: MaterialIndicatorDelegate(
        builder: (context, controller) {
          return Icon(
            Icons.refresh,
            color: Colors.purple,
            size: 30,
          );
        },
      ),
      onRefresh: () {
        context.read<CustomerBloc>().add(GetCustomers());
        return Future.delayed(const Duration(seconds: 2));
      },
      completeStateDuration: const Duration(seconds: 2),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("Customers crud app"),
          actions: [
            InkWell(
              child: IconButton(
                onPressed: () {
                  //(context, MaterialPageRoute(
                  //   builder: (context) {
                  //     return CustomerAddPage();
                  //   },
                  // ));
                  Navigator.pushNamed(this.context, "/add");
                },
                icon: Icon(Icons.add),
              ),
            )
          ],
        ),
        body:
            BlocBuilder<CustomerBloc, CustomerState>(builder: (context, state) {
          switch (state.status) {
            case CustomerStatus.initial:
              return Center(child: CircularProgressIndicator());
            case CustomerStatus.success:
              return _mainWidget(
                controller: _controller,
                customers: state.customers,
              );
            case CustomerStatus.loading:
              return Center(
                child: CircularProgressIndicator(),
              );
            case CustomerStatus.error:
              return Center(
                child: Text(
                  "Error Loading Customers!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 18.0),
                ),
              );
            default:
              return Center(
                child: CircularProgressIndicator(),
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
    required ScrollController controller,
    required this.customers,
  })  : _controller = controller,
        super(key: key);

  final ScrollController _controller;
  final List<CustomerEntity> customers;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 2,
          child: ListView.builder(
            controller: _controller,
            itemCount: customers.length,
            padding: EdgeInsets.all(8.0),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  context
                      .read<CustomerBloc>()
                      .add(SelectCustomer(selectedCustomerIndex: index));
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return CustomerDetailPage(
                        customerData: customers[index],
                        index: index,
                      );
                    },
                  ));
                },
                child: Card(
                  elevation: 8.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      CustomerInfoWidget(
                              firstText: "First Name :",
                              infoText: customers[index].firstName)
                          .info(),
                      SizedBox(
                        height: 8.0,
                      ),
                      CustomerInfoWidget(
                              firstText: "Last Name :",
                              infoText: customers[index].lastName)
                          .info(),
                      SizedBox(
                        height: 8.0,
                      ),
                      CustomerInfoWidget(
                              firstText: "Date Of Birth :",
                              infoText: customers[index].dateOfBirth)
                          .info(),
                      SizedBox(
                        height: 8.0,
                      ),
                      CustomerInfoWidget(
                              firstText: "Phone Number :",
                              infoText: customers[index].phoneNumber)
                          .info(),
                      SizedBox(
                        height: 8.0,
                      ),
                      CustomerInfoWidget(
                              firstText: "Email Address :",
                              infoText: customers[index].email)
                          .info(),
                      SizedBox(
                        height: 8.0,
                      ),
                      CustomerInfoWidget(
                              firstText: "Bank Acount Number :",
                              infoText: customers[index].bankAcountNumber)
                          .info(),
                    ]),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
