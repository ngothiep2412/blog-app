part of 'register_imports.dart';

@RoutePage()
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late RegisterViewModel registerViewModel;

  @override
  void initState() {
    registerViewModel =
        RegisterViewModel(repository: context.read<Repository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: FadedScaleAnimation(
            child: Column(
              children: [
                Image.asset(
                  MyAssets.assetsImagesLogo,
                  height: 42.h,
                  width: 139.w,
                ).centered(),
                93.h.heightBox,
                Form(
                  key: registerViewModel.formKey,
                  child: Container(
                    // height: MediaQuery.sizeOf(context).height,
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
                          "Register"
                              .text
                              .size(18)
                              .color(MyColors.primaryColor)
                              .fontWeight(FontWeight.w700)
                              .makeCentered(),
                          48.h.heightBox,
                          "Name".text.make(),
                          8.h.heightBox,
                          VxTextField(
                            fillColor: Colors.transparent,
                            borderColor: MyColors.primaryColor,
                            borderType: VxTextFieldBorderType.roundLine,
                            borderRadius: 10,
                            controller: registerViewModel.nameController,
                            validator: (name) {
                              if (name!.isEmpty) {
                                return "Empty Name";
                              }
                              return null;
                            },
                          ),
                          20.h.heightBox,
                          "Email".text.make(),
                          8.h.heightBox,
                          VxTextField(
                            fillColor: Colors.transparent,
                            borderColor: MyColors.primaryColor,
                            borderType: VxTextFieldBorderType.roundLine,
                            borderRadius: 10,
                            prefixIcon: const Icon(Icons.email),
                            controller: registerViewModel.emailController,
                            validator: (email) {
                              if (email!.isEmpty) {
                                return "Empty Email";
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
                            controller: registerViewModel.passwordController,
                            validator: (password) {
                              // if (!password!.isValidPassword) {
                              //   return "Invalid Password";
                              // } else

                              if (password !=
                                  registerViewModel
                                      .confirmPasswordController.text) {
                                return "Password and confirm password does not match";
                              }
                              return null;
                            },
                          ),
                          20.h.heightBox,
                          "Confirm Password".text.make(),
                          8.h.heightBox,
                          VxTextField(
                            isPassword: true,
                            obscureText: true,
                            fillColor: Colors.transparent,
                            borderColor: MyColors.primaryColor,
                            borderType: VxTextFieldBorderType.roundLine,
                            borderRadius: 10.r,
                            prefixIcon: const Icon(Icons.lock),
                            controller:
                                registerViewModel.confirmPasswordController,
                            validator: (confirmPassword) {
                              // if (!confirmPassword!.isValidPassword) {
                              //   return "Invalid Confirm Password";
                              // } else
                              if (confirmPassword !=
                                  registerViewModel.passwordController.text) {
                                return "Password and confirm password does not match";
                              }
                              return null;
                            },
                          ),
                          24.h.heightBox,
                          SizedBox(
                            width: 200.w,
                            child: CheckboxListTile(
                              value: false,
                              onChanged: (value) {},
                              contentPadding: EdgeInsets.zero,
                              controlAffinity: ListTileControlAffinity.leading,
                              title: "Remember Me".text.size(14.sp).make(),
                            ),
                          ),
                          48.h.heightBox,
                          BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                              bloc: registerViewModel.isLoadingBloc,
                              builder: (context, state) {
                                return PrimaryButton(
                                  isLoading: state.data,
                                  title: "Register",
                                  onPressed: () {
                                    if (registerViewModel.formKey.currentState!
                                        .validate()) {
                                      registerViewModel.register(context);
                                    }
                                  },
                                );
                              }),
                          20.h.heightBox,
                          "Already Have an account ?"
                              .richText
                              .size(14.sp)
                              .color(MyColors.primaryColor)
                              .withTextSpanChildren(
                            [
                              TextSpan(
                                text: " Login",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => AutoRouter.of(context).push(
                                        const LoginRoute(),
                                      ),
                              ),
                            ],
                          ).makeCentered(),
                          24.h.heightBox,
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
