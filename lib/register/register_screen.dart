import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_resturant_app/register/cubit/register_cubit.dart';
import 'package:task_resturant_app/register/cubit/register_states.dart';
import 'package:task_resturant_app/reused_widget.dart';
import 'package:task_resturant_app/widthandheight.dart';

// ignore: use_key_in_widget_constructors
class RegisterScreen extends StatelessWidget {
  var userNameController = TextEditingController();
  var phoneController = TextEditingController();
  var passWordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
          listener:(context, state) {},
        builder: (context, state) {
            var cubit = RegisterCubit.get(context);
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
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(top: 30.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.chevron_left_outlined,size: 35,),
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
                            "Sign up",
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
                              controller: userNameController,
                              type: TextInputType.name,
                              label: "User name",
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return "please enter your User name!";
                                }
                              },
                            ),
                            height: 50,
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            height: 50,
                            child: defaultFormField(
                              controller: phoneController,
                              type: TextInputType.phone,
                              label: "Your phone",
                              // suffix: ,
                              //suffixPressed: ,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return "please enter your phone!";
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            height: 50,
                            child: defaultFormField(
                              controller: passWordController,
                              type: TextInputType.visiblePassword,
                              label: "Password",
                              isPassword: cubit.isPassword,
                              suffix:cubit.suffix ,
                              suffixPressed: ()
                              {
                                cubit.changePasswordVisibility();
                              },
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return "please enter your Password!";
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),

                          ConditionalBuilder(
                            condition: state is !RegisterLoadingState,
                            builder:(context) =>  defaultButton(
                              function: () {
                               //  if(formKey.currentState.validate())
                               // { cubit.userRegister(phone: phoneController.text, password: passWordController.text, username: userNameController.text);
                               //  state !=RegisterLoadingState?print(state.toString()):print(state);
                               // }
                              },
                              text:"Sign up",
                              background: const Color(0xFFed492d),
                              isUpperCase: false,
                            ),
                            fallback:(context) => Center(child: CircularProgressIndicator(),) ,
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
