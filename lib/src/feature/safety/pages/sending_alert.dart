import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:circular_seek_bar/circular_seek_bar.dart'; // Import the CircularSeekBar package
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/back_arrow.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_appbar.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/feature/safety/provider/safty_provider.dart';

class SendingAlertPage extends StatefulWidget {
  const SendingAlertPage({super.key});

  @override
  State<SendingAlertPage> createState() => _SendingAlertPageState();
}

class _SendingAlertPageState extends State<SendingAlertPage> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier<double>(10.0); // Starting from 50%
  final value = 6;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.bdImage),
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
                height: size.height * 0.88,
                padding:  EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: colorScheme(context).onPrimary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sending Alert in',
                      style: textTheme(context).bodyLarge!.copyWith(
                          letterSpacing: 0, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onPanUpdate: (details) {
                        // Update the notifier based on the gesture movement
                        setState(() {
                          double newValue = _valueNotifier.value +
                              details.localPosition.dy * 0.1;
                          _valueNotifier.value = newValue.clamp(0, 10);
                        });
                      },
                      child: SizedBox(
                        height: size.height *
                            0.3, // Ensure this is big enough for interaction
                        child: ValueListenableBuilder<double>(
                          valueListenable: _valueNotifier,
                          builder: (context, progress, child) {
                            return CircularSeekBar(
                              width: double.infinity,
                              height: 250,
                              progress: progress, // Update progress value
                              barWidth: 8,
                              startAngle: 90,
                              sweepAngle: 360,
                              trackColor: colorScheme(context).outline,
                              strokeCap: StrokeCap.butt,
                              progressColor: colorScheme(context).primary,
                              innerThumbRadius: 5,
                              innerThumbStrokeWidth: 3,
                              innerThumbColor: colorScheme(context).onPrimary,
                              outerThumbRadius: 5,
                              outerThumbStrokeWidth: 10,
                              outerThumbColor: colorScheme(context).primary,
                              valueNotifier: _valueNotifier,
                              animation:
                                  false,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${value}',
                                      // '${progress.round()}',
                                      style: textTheme(context).displayLarge!.copyWith(letterSpacing: 0,color: colorScheme(context).primary,fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ), // Disable default animation for smooth interaction
                            );
                          },
                        ),
                      ),
                    ),
                    Text(
                      'An *SMS and a high priority notification will be sent to your Circle members & Emergency Contacts.',
                      style: textTheme(context).bodyLarge!.copyWith(
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Center(
                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                          color: colorScheme(context).primary.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text('Cancel'),
                      ),
                    ),
                    SizedBox(height: size.height * 0.07),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '*Send SMS to emergency contacts and current circle member’s contact (standard charges apply)',
                            style: textTheme(context).bodySmall!.copyWith(
                                  letterSpacing: 0,
                                  color: colorScheme(context).onSurface,
                                ),
                          ),
                        ),
                        Transform.scale(
                          scale: 0.6,
                          child: Consumer<WatchOverProvider>(
                            builder: (context, value, child) {
                              return Switch(
                                value: value.sendingAlert,
                                onChanged: (newValue) {
                                  value.onChangeSending(newValue);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.056),
                    CustomElevatedButton(
                      width: double.infinity,
                      text: 'Send Alert',
                      onPressed: () {},
                    ),
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
