import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_resturant_app/getuser.dart';
import 'package:task_resturant_app/login/cubit/login_cubit.dart';
import 'package:task_resturant_app/login/cubit/login_states.dart';
import 'package:task_resturant_app/register/register_screen.dart';
import 'package:task_resturant_app/reused_widget.dart';
import 'package:task_resturant_app/widthandheight.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatelessWidget {
  var phoneController = TextEditingController();
  var passWordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
          listener:(context, state) {},
        builder: (context, state) {
           var cubit =LoginCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: getheight(context) * 0.5,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/logo.jpg"), fit: BoxFit.fill),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: const EdgeInsets.only(top: 30.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          decoration: BoxDecoration(
                              color: Colors.black12.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(
                                15,
                              )),
                          child: Text(
                            "Sign in",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            child: defaultFormField(
                              controller: phoneController,
                              type: TextInputType.name,
                              label: "Phone name",
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return "please enter your Phone name!";
                                }
                              },
                            ),
                            height: 50,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            height: 50,
                            child: defaultFormField(

                              controller: passWordController,
                              type: TextInputType.visiblePassword,
                              label: "Password",
                              isPassword: cubit.isPassword,
                              suffix:cubit.suffix ,
                              suffixPressed:(){
                                cubit.changePasswordVisibility();
                              } ,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return "please enter your Password!";
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                "forget password?",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                      .copyWith(fontSize: 14),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ConditionalBuilder(
                            condition:state is! LoginLoadingState ,
                            builder:(context) =>
                                defaultButton(
                                  function: () {
                                    if (formKey.currentState.validate()) {
                                      cubit.userLogin(phone: phoneController.text, password:passWordController.text);
                                    }
                                    // navigateAndFinish(context,GetUserScreen());
                                  },
                                  text:"Log in",
                                  background: const Color(0xFFed492d),
                                  isUpperCase: false,
                                ),

                            fallback: (context) => Center(child: CircularProgressIndicator()),
                          ),

                          const SizedBox(
                            height: 15.0,
                          ),
                          InkWell(
                            onTap: (){
                              navigateTo(context, RegisterScreen());
                            },
                            child: Text("Don't have an account?   Sign up",style: Theme.of(context).textTheme.subtitle2,),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Text("Or",style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 18,fontWeight: FontWeight.bold),),
                          const SizedBox(
                            height: 10.0,
                          ),

                          defaultButton(
                            function: () {},
                            image: "assets/Apple.jpg",
                            text:"Sign in with Apple",
                            background: Colors.black,
                            isUpperCase: false,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),

                          defaultButton(
                            function: () {},
                            image: "assets/facebook.jpg",

                            text:"Continue with facebook",
                            background:const Color(0xFF4267b2),
                            isUpperCase: false,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
