part of 'login_imports.dart';

@RoutePage()
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late LoginViewModel loginViewModel;

  @override
  void initState() {
    loginViewModel = LoginViewModel(repository: context.read<Repository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: SafeArea(
        child: FadedScaleAnimation(
          child: ListView(
            children: [
              Image.asset(
                MyAssets.assetsImagesLogo,
                height: 42.h,
                width: 139.w,
              ).centered(),
              93.h.heightBox,
              Form(
                key: loginViewModel.formKey,
                child: Container(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36.r),
                      topRight: Radius.circular(36.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        87.h.heightBox,
                        "Login"
                            .text
                            .size(18)
                            .color(MyColors.primaryColor)
                            .fontWeight(FontWeight.w700)
                            .makeCentered(),
                        48.h.heightBox,
                        "Email".text.make(),
                        8.h.heightBox,
                        VxTextField(
                          fillColor: Colors.transparent,
                          borderColor: MyColors.primaryColor,
                          borderType: VxTextFieldBorderType.roundLine,
                          borderRadius: 10,
                          prefixIcon: const Icon(Icons.email),
                          controller: loginViewModel.emailController,
                          validator: (email) {
                            if (email!.isEmpty) {
                              return "Email is empty";
                            } else if (!email.isValidEmail) {
                              return "Invalid Email";
                            }
                            return null;
                          },
                        ),
                        20.h.heightBox,
                        "Password".text.make(),
                        8.h.heightBox,
                        VxTextField(
                          isPassword: true,
                          obscureText: true,
                          fillColor: Colors.transparent,
                          borderColor: MyColors.primaryColor,
                          borderType: VxTextFieldBorderType.roundLine,
                          borderRadius: 10.r,
                          prefixIcon: const Icon(Icons.lock),
                          controller: loginViewModel.passwordController,
                          validator: (password) {
                            if (password!.isEmpty) {
                              return "Password is empty";
                            }
                            //  else if (!password.isValidPassword) {
                            //   return "Invalid Password";
                            // }
                            return null;
                          },
                        ),
                        40.h.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 200.w,
                              child: CheckboxListTile(
                                value: false,
                                onChanged: (value) {},
                                contentPadding: EdgeInsets.zero,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: "Remember Me".text.size(14.sp).make(),
                              ),
                            ),
                            "Forgot Password".text.size(14.sp).make(),
                          ],
                        ),
                        40.h.heightBox,
                        BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                            bloc: loginViewModel.isLoadingBloc,
                            builder: (context, state) {
                              return PrimaryButton(
                                isLoading: state.data,
                                title: "Login",
                                onPressed: () {
                                  if (loginViewModel.formKey.currentState!
                                      .validate()) {
                                    loginViewModel.login(context);
                                  }
                                },
                              );
                            }),
                        20.h.heightBox,
                        "Don't have an account"
                            .richText
                            .size(14.sp)
                            .color(MyColors.primaryColor)
                            .withTextSpanChildren(
                          [
                            TextSpan(
                                text: " Sign up",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => AutoRouter.of(context)
                                      .push(const RegisterRoute())),
                          ],
                        ).makeCentered(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
