abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}
class RegisterIsPasswordVisibilityState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{}
class RegisterErrorState extends RegisterStates{
  String error;
  RegisterErrorState(this.error);
}