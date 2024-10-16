part of 'register_imports.dart';

class RegisterViewModel {
  final Repository repository;
  RegisterViewModel({required this.repository});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);

  final formKey = GlobalKey<FormState>();

  register(context) async {
    isLoadingBloc.onUpdateData(true);

    var registerData = await repository.authRepo.userRegister(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
    if (registerData.accessToken != null) {
      Utils.saveToken(registerData.accessToken.toString());
      AutoRouter.of(context).replace(const GeneralRoute());
    }
    isLoadingBloc.onUpdateData(false);
  }
}
