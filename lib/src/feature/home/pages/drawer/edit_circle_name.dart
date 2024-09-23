import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/back_arrow.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_appbar.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/common/widgets/custom_textformfield.dart';

class EditCircleNamePage extends StatefulWidget {
  const EditCircleNamePage({super.key});

  @override
  State<EditCircleNamePage> createState() => _EditCircleNamePageState();
}

class _EditCircleNamePageState extends State<EditCircleNamePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.bdImage,),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.03),
              CustomBackButton(onTap: (){
                context.pop();
              }),
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
                      'Edit Circle Name',
                      style: textTheme(context)
                          .bodyLarge!
                          .copyWith(letterSpacing: 0, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: size.height * 0.01,),
                    const CustomTextFormField(
                      hint: 'Vicky Rock',
                    ),
                    const Spacer(),
                    CustomElevatedButton(
                        width: double.infinity,
                        text: 'Save', onPressed: (){})
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



// import 'package:flutter/material.dart';
// import 'package:teenage_safety/src/common/const/global_variable.dart';
// import 'package:teenage_safety/src/common/widgets/custom_appbar.dart';
//
// class EditCircleNamePage extends StatefulWidget {
//   const EditCircleNamePage({super.key});
//
//   @override
//   State<EditCircleNamePage> createState() => _EditCircleNamePageState();
// }
//
// class _EditCircleNamePageState extends State<EditCircleNamePage> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Container(
//         height: double.infinity,
//         padding: const EdgeInsets.all(16.0),
//         width: double.infinity,
//         decoration:  BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(AppImages.bdImage,),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(height: size.height * 0.03),
//               CustomRowWidget(
//                 onMenuTap: () {
//                   // Handle menu tap
//                 },
//                 onNotificationTap: () {
//                   // Handle notification tap
//                 },
//                 onArrowTap: () {
//                   // Handle arrow tap
//                 },
//                 imageUrl: 'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1726641286~exp=1726644886~hmac=03d7151562e433d0a5ecf762f2d1dfd8d0e21e35cba5b2d415b608081c19502e&w=740',
//                 text: 'John Family',
//                 isOpen: false,
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 width: double.infinity,
//                 height: size.height * 0.83,
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Circle Management',
//                       style: textTheme(context)
//                           .bodyLarge!
//                           .copyWith(letterSpacing: 0, fontWeight: FontWeight.w700),
//                     ),
//                     SizedBox(height: size.height * 0.01,),
//
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//
//       ),
//     );
//   }
// }
