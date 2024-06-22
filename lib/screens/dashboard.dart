import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/cubit/user_cubit.dart';
import 'package:reminder_app/cubit/user_state.dart';
import 'package:reminder_app/models/usercount_model.dart';
import 'package:reminder_app/screens/add_item.dart';
import 'package:reminder_app/screens/calender.dart';
import 'package:reminder_app/screens/create_admin.dart';
import 'package:reminder_app/screens/homepage.dart';
import 'package:reminder_app/screens/log_in.dart';
import 'package:reminder_app/screens/setting.dart';
import 'package:reminder_app/widgets/categories_list_view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
    this.count,
  });
  static String id = 'Dashboard';
  final UserCountModel? count;
  @override
  State<Dashboard> createState() => _DashboardState();
}

int index = 0;

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    // Fetch user count when the dashboard is initialized
    context.read<UserCubit>().userCount();
  }
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AdminLogOutSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Logged out success'),
            ),
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) {
              return const CreateAdmin();
            }),
          );
        } else if (state is AdminLogOutFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errmessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 244, 243, 243),
              title: const Text(
                "Dashboard",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              centerTitle: true,
              leading: const BackButton(color: Color(0xFF295c82)),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    // ضع هنا الكود الخاص بتسجيل الخروج
                    // على سبيل المثال: يمكن أن تستخدم Navigator لتوجيه المستخدم إلى صفحة تسجيل الدخول
                    context.read<UserCubit>().adminlogOut();
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                color: const Color(0xFFee8524),
                                child: Center(
                                  child: Text(
                                    state is UserCountSuccess ? state.count.user_count.toString() : "0",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 150,
                                color: const Color(0xFFececec),
                                child:
                                    const Center(child: Text("Number of Uers")),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                color: Color.fromARGB(255, 237, 113, 187),
                                child: const Center(
                                    child: Text(
                                  "1",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                )),
                              ),
                              Container(
                                height: 50,
                                width: 100,
                                color: const Color(0xFFececec),
                                child: const Center(child: Text("Pills")),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                color: const Color.fromARGB(255, 169, 26, 160),
                                child: const Center(
                                    child: Text(
                                  "10",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                )),
                              ),
                              Container(
                                height: 50,
                                width: 100,
                                color: const Color(0xFFececec),
                                child: const Center(child: Text("Syrup")),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                color: Color.fromARGB(255, 73, 179, 189),
                                child: const Center(
                                    child: Text(
                                  "20",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                )),
                              ),
                              Container(
                                height: 50,
                                width: 100,
                                color: const Color(0xFFececec),
                                child: const Center(child: Text("Injections")),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                color: const Color(0xFFdc0d0d),
                                child: const Center(
                                    child: Text(
                                  "12",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                )),
                              ),
                              Container(
                                height: 50,
                                width: 100,
                                color: const Color(0xFFececec),
                                child: const Center(child: Text("Body Care")),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                color: Color(0xFF79c519),
                                child: const Center(
                                    child: Text(
                                  "42",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                )),
                              ),
                              Container(
                                height: 50,
                                width: 100,
                                color: const Color(0xFFececec),
                                child: const Center(child: Text("Skin Care")),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                color: Color.fromARGB(255, 32, 124, 194),
                                child: const Center(
                                    child: Text(
                                  "30",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                )),
                              ),
                              Container(
                                height: 50,
                                width: 100,
                                color: const Color(0xFFececec),
                                child: const Center(child: Text("Hair Care")),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 220, top: 10, bottom: 5),
                      child: Text(
                        "last 4 Users :",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Column(children: [
                      Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columnSpacing: 20.0,
                            columns: const [
                              DataColumn(
                                  label: Expanded(
                                      child: Center(child: Text('Name')))),
                              DataColumn(
                                  label: Expanded(
                                      child: Center(child: Text('Email')))),
                              DataColumn(
                                  label: Expanded(
                                      child: Center(child: Text('Delete')))),
                            ],
                            rows: const [
                              DataRow(cells: [
                                DataCell(Text('sama')),
                                DataCell(Text('sama@gmail.com')),
                                DataCell(
                                  Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 24,
                                  ),
                                ),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('osama')),
                                DataCell(Text('osama@gmail.com')),
                                DataCell(
                                  Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 24,
                                  ),
                                ),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('ahmed')),
                                DataCell(Text('ahmed@gmail.com')),
                                DataCell(
                                  Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 24,
                                  ),
                                ),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('mohamed')),
                                DataCell(Text('mohamed@gmail.com')),
                                DataCell(
                                  Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 24,
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ),
                    ]),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 220, top: 10, bottom: 5),
                      child: Text(
                        "last 4 Items :",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Center(
                            child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columnSpacing: 20.0,
                            columns: const [
                              DataColumn(
                                  label: Expanded(
                                      child: Center(child: Text('Name')))),
                              DataColumn(
                                  label: Expanded(
                                      child: Center(child: Text('Image')))),
                              DataColumn(
                                  label: Expanded(
                                      child: Center(child: Text('Type')))),
                              DataColumn(
                                  label: Expanded(
                                      child: Center(child: Text('Delete')))),
                            ],
                            rows: const [
                              DataRow(cells: [
                                DataCell(Text('panadol')),
                                DataCell(Text('image')),
                                DataCell(Text('Pills')),
                                DataCell(
                                  Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 24,
                                  ),
                                ),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Cogestal')),
                                DataCell(Text('image')),
                                DataCell(Text('syrup')),
                                DataCell(
                                  Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 24,
                                  ),
                                ),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Cogestal')),
                                DataCell(Text('image')),
                                DataCell(Text('syrup')),
                                DataCell(
                                  Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 24,
                                  ),
                                ),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Cogestal')),
                                DataCell(Text('image')),
                                DataCell(Text('Pills')),
                                DataCell(
                                  Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 24,
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ))
                      ],
                    )
                  ])),
            ));
      },
    );
  }
}
