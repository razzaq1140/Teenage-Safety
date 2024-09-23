import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:teenage_safety/src/common/const/app_colors.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/back_arrow.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_appbar.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/feature/safety/provider/safty_provider.dart';

class WatchOverMePage extends StatefulWidget {
  const WatchOverMePage({super.key});

  @override
  State<WatchOverMePage> createState() => _WatchOverMePageState();
}

class _WatchOverMePageState extends State<WatchOverMePage> {
  
  TextEditingController _messageController = TextEditingController();
  int _counterLength = 0;
  
  @override
  void initState() {
    super.initState();
    _messageController.addListener((){
      setState(() {
        _counterLength = _messageController.text.length;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppImages.bdImage,
            ),
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
                height: size.height,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Watch Over Me',
                      style: textTheme(context).bodyLarge!.copyWith(
                          letterSpacing: 0, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 48,
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon:  Icon(
                              Icons.location_on_outlined,
                                color: AppColors.appGrey
                            ),
                            hintText: '5g+39M, Houston Park House #3',
                            hintStyle: textTheme(context)
                                .bodyLarge!
                                .copyWith(letterSpacing: 0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: colorScheme(context).outline),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: colorScheme(context).outline),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: colorScheme(context).outline),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'The destination address you are heading towards.',
                      style: textTheme(context)
                          .bodySmall!
                          .copyWith(letterSpacing: 0, color: AppColors.appGrey),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 48,
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon:  Icon(
                              Icons.location_on_outlined,
                                color: AppColors.appGrey
                            ),
                            hintText: '5g+39M, Houston Park House #3',
                            hintStyle: textTheme(context)
                                .bodyLarge!
                                .copyWith(letterSpacing: 0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: colorScheme(context).outline),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: colorScheme(context).outline),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: colorScheme(context).outline),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'The destination address you are heading towards.',
                      style: textTheme(context).bodySmall!.copyWith(
                            letterSpacing: 0,
                            color: AppColors.appGrey,
                          ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: colorScheme(context).outline),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Padding(
                            padding: EdgeInsets.only(top: 15.0, left: 12,right: 12),
                            child: SvgPicture.asset(AppIcons.chatIcon),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _messageController,
                              maxLines: 9,
                              maxLength: 200,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: '''Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.''',
                                hintStyle: textTheme(context)
                                    .bodyLarge!
                                    .copyWith(letterSpacing: 0),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: colorScheme(context).onPrimary),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            '(Optional) If you have any message or note to send your family and emergency contacts.',
                            style: textTheme(context)
                                .bodySmall!
                                .copyWith(letterSpacing: 0, color: AppColors.appGrey),
                          ),
                        ),
                        // Text(
                        //   '$_counterLength/200',
                        //   style: textTheme(context)
                        //       .bodySmall!
                        //       .copyWith(letterSpacing: 0, color: AppColors.appGrey),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          '*Send SMS to emergency contacts and current circle member’s contact (standard charges apply) ',
                          style: textTheme(context).bodySmall!.copyWith(
                              letterSpacing: 0,
                              color: colorScheme(context).onSurface),
                        )),
                        Transform.scale(
                            scale: 0.6,
                            child: Consumer<WatchOverProvider>(
                              builder: (context, value, child) {
                                return Switch(
                                    value: value.watchOver,
                                    onChanged: (newValue) {
                                      value.onChangeWatch(newValue);
                                    });
                              },
                            ))
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    CustomElevatedButton(
                        width: double.infinity,
                        text: 'Send Now',
                        onPressed: () {}),
                    // SizedBox(height: size.height * 0.03,),
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
