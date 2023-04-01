import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mc_crud_test/feature/customer/page/customer_add_page.dart';
import 'package:mc_crud_test/feature/customer/page/customer_detail_page.dart';
import 'package:mc_crud_test/feature/customer/widget/customer_button_widget.dart';
import 'package:mc_crud_test/feature/customer/widget/customer_info_widget.dart';

class CustomerListPage extends StatelessWidget {
  CustomerListPage({Key? key}) : super(key: key);
  late ScrollController _controller = ScrollController();

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
      onRefresh: () => Future.delayed(const Duration(seconds: 2)),
      completeStateDuration: const Duration(seconds: 2),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("Customers crud app"),
          actions: [
            InkWell(
              child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return CustomerAddPage();
                    },
                  ));
                },
                icon: Icon(Icons.add),
              ),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: ListView.builder(
                controller: _controller,
                itemCount: 10,
                padding: EdgeInsets.all(8.0),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return CustomerDetailPage();
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
                                  infoText: "mohammad")
                              .info(),
                          SizedBox(
                            height: 8.0,
                          ),
                          CustomerInfoWidget(
                                  firstText: "Last Name :",
                                  infoText: "mohammad")
                              .info(),
                          SizedBox(
                            height: 8.0,
                          ),
                          CustomerInfoWidget(
                                  firstText: "Date Of Birth :",
                                  infoText: "11110001")
                              .info(),
                          SizedBox(
                            height: 8.0,
                          ),
                          CustomerInfoWidget(
                                  firstText: "Phone Number :",
                                  infoText: "11110001")
                              .info(),
                          SizedBox(
                            height: 8.0,
                          ),
                          CustomerInfoWidget(
                                  firstText: "Email Address :",
                                  infoText: "test@a.com")
                              .info(),
                          SizedBox(
                            height: 8.0,
                          ),
                          CustomerInfoWidget(
                                  firstText: "Bank Acount Number :",
                                  infoText: "11110001")
                              .info(),
                        ]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
