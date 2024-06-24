import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/components/buttons.dart';
import 'package:reminder_app/components/textformfield.dart';
import 'package:reminder_app/cubit/user_cubit.dart';
import 'package:reminder_app/cubit/user_state.dart';
import 'package:reminder_app/screens/add_item.dart';
import 'package:reminder_app/screens/calender.dart';
import 'package:reminder_app/screens/dashboard.dart';
import 'package:reminder_app/screens/homepage.dart';
import 'package:reminder_app/screens/setting.dart';

class CreateAdmin extends StatefulWidget {
  const CreateAdmin({super.key});
static String id = 'CreateAdmin';
  @override
  State<CreateAdmin> createState() => _CreateAdminState();
}

class _CreateAdminState extends State<CreateAdmin> {
  @override
  int index = 0;

  // //Admin Sign in email
  // TextEditingController adminsignInEmail = TextEditingController();
  // //Admin Sign in password
  // TextEditingController adminsignInPassword = TextEditingController();

  //Sign in Form key
  GlobalKey<FormState> adminSignInFormKey = GlobalKey();

  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AdminSignInSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('success'),
            ),
          );
          Navigator.pushReplacementNamed(context, Dashboard.id);
        }else if(state is AdminSignInFailure){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errmessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 244, 243, 243),
            title: const Text(
              "Admin",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            leading: const BackButton(color: Color(0xFF5DADEC)),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: adminSignInFormKey,
              child: Column(
                children: [
                  const Center(
                    child: Image(
                      image: AssetImage("images/createAdmin.png"),
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomTextForm(
                      hinttext: 'Email',
                      controller: context.read<UserCubit>().adminSignInEmail,
                      label: 'Email',
                      myicon: const Icon(Icons.mail, color: Color(0xFF295c82)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomTextForm(
                      hinttext: 'Password',
                      controller: context.read<UserCubit>().adminSignInPassword,
                      label: 'Password',
                      isDense: true,
                      obscureText: true,
                      suffixIcon: true,
                      myicon: const Icon(Icons.lock, color: Color(0xFF295c82)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: state is AddItemLoading
                        ? const CircularProgressIndicator()
                        :CustomButton(
                      title: "Login",
                      onPressed: () {
                        context.read<UserCubit>().adminsignIn();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
