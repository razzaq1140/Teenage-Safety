import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_appbar.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/common/widgets/custom_textformfield.dart';

import '../../../common/const/back_arrow.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
      height: double.infinity,
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/safe-bg.png',),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.03),
            Row(
              children: [
                CustomBackButton(onTap: (){
                    context.pop();
                  }),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: size.height * 0.83,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment',
                    style: textTheme(context)
                        .bodyLarge!
                        .copyWith(letterSpacing: 0, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: size.height * 0.01,),
                  Center(child: Image.asset('assets/payment.png',height: size.height * 0.2,)),
                  SizedBox(height: size.height * 0.07,),
                  Divider(color: colorScheme(context).outline,),
                  SizedBox(height: size.height * 0.03,),
                  CustomTextFormField(
                    // controller: widget.nameController,
                    hint: '5487 8547 8547 6845',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.4,
                        child: CustomTextFormField(
                          // controller: widget.nameController,
                          hint: '09/29',
                        ),
                      ),
                      SizedBox(height: size.height * 0.12,),
                      SizedBox(
                        width: size.width * 0.4,
                        child: CustomTextFormField(
                          // controller: widget.nameController,
                          hint: '846',
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  CustomElevatedButton(
                      height: size.height * 0.055,
                      width: double.infinity,
                      text: 'Pay now',
                      textStyle: textTheme(context).labelLarge!.copyWith(letterSpacing: 0,fontSize: size.height * 0.02,color: colorScheme(context).onPrimary),
                      onPressed: (){
                      }),
                  SizedBox(height: size.height * 0.02,)
                ],
              ),
            ),
          ],
        ),
      ),

    ),
    );
  }
}
