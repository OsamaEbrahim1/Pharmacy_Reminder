import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/cubit/user_cubit.dart';
import 'package:reminder_app/cubit/user_state.dart';
import 'package:reminder_app/models/all_products_model.dart';
import 'package:reminder_app/models/all_users_model.dart';
import 'package:reminder_app/models/latest_items_model.dart';
import 'package:reminder_app/models/usercount_model.dart';
import 'package:reminder_app/screens/admin.dart';
import 'package:reminder_app/screens/create_admin.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
    this.count, this.users, 
  });
  static String id = 'Dashboard';
  final UserCountModel? count;
  final AllUsersModel? users;

  @override
  State<Dashboard> createState() => _DashboardState();
}

int index = 0;

class _DashboardState extends State<Dashboard> {
  @override
void initState() {
  super.initState();
  // Fetch user count and all users concurrently when the dashboard is initialized
  final userCubit = BlocProvider.of<UserCubit>(context); // Start fetching user count
    //userCubit.allusers(); // Start fetching all users
    userCubit.latestItems();
}

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
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
        if (state is DeleteItemSuccess) {
          BlocProvider.of<UserCubit>(context).latestItems();
        }
        if (state is DeleteItemFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMessage)),
          );
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
                  icon: const Icon(Icons.logout),
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
                                    state is AllUsersSuccess ? state.users.length.toString() : "0",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(Admin.id);
                                },
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  color: const Color(0xFFececec),
                                  child:
                                      const Center(child: Text("Number of Uers")),
                                ),
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
                                color: const Color.fromARGB(255, 237, 113, 187),
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
                                color: const Color.fromARGB(255, 73, 179, 189),
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
                                color: const Color(0xFF79c519),
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
                                color: const Color.fromARGB(255, 32, 124, 194),
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
                    const Padding(
                      padding:
                          EdgeInsets.only(right: 220, top: 10, bottom: 5),
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
                            rows:state is AllUsersSuccess ? state.users.take(4).map<DataRow>((user) {
                  return DataRow(cells: [
                    DataCell(Text(user.name)),
                    DataCell(Text(user.email)),
                    DataCell(
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red, size: 24),
                        onPressed: () {
                          // Handle delete action
                        },
                      ),
                    ),
                  ]);
                }).toList() : [],
                          ),
                        ),
                      ),
                    ]),
                    const Padding(
                      padding:
                          EdgeInsets.only(right: 220, top: 10, bottom: 5),
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
                                      child: Center(child: Text('quantity')))),
                              DataColumn(
                                  label: Expanded(
                                      child: Center(child: Text('code')))),
                              DataColumn(
                                  label: Expanded(
                                      child: Center(child: Text('Delete')))),
                            ],
                            rows:state is LatestItemsSuccess ? state.items.map<DataRow>((item) {
                  return DataRow(cells: [
                    DataCell(Text(item.title)),
                    DataCell(Text(item.quantity.toString())),
                    DataCell(Text(item.code.toString())),
                    DataCell(
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red, size: 24),
                        onPressed: () {
                          // Handle delete action
                          context.read<UserCubit>().deleteItem(item.id);
                        },
                      ),
                    ),
                  ]);
                }).toList() : [],
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
