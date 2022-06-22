import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/constant/image_const.dart';
import 'package:lawma_app/data/providers/add_driver_provider.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/domain/states/add_data_state.dart';
import 'package:lawma_app/domain/states/create_driver_state.dart';
import 'package:lawma_app/presentation/widgets/text_field.dart';

import '../../data/providers/auth_loader_provider.dart';
import '../widgets/custom_button.dart';

class HomeScreeenAdmin extends ConsumerStatefulWidget {
  const HomeScreeenAdmin({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreeenAdmin> createState() => _HomeScreeenAdminState();
}

class _HomeScreeenAdminState extends ConsumerState<HomeScreeenAdmin> {
  TextEditingController? fullNameController;
  TextEditingController? emailController;
  TextEditingController? truckPlateNumber;

  String? selectedCity;

  final ImagePicker imagePicker = ImagePicker();
  XFile? imageFileDriver;
  XFile? imageFileTruck;

  File? driverImage;
  File? truckImage;

  @override
  void initState() {
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    truckPlateNumber = TextEditingController();
    Future.delayed(Duration.zero, () {
      ref.watch(lgaProvider.notifier).getLga();
    });
    super.initState();
  }

  @override
  void dispose() {
    emailController!.clear();
    fullNameController!.clear();
    truckPlateNumber!.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      bottom: false,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Add New Drivers",
                    style: CustomTheme.semiLargeText(context).copyWith(
                      color: ColorConst.dark,
                      fontWeight: FontWeight.w600,

                      // fontSize: 28.0.sp,
                    ),
                  ),
                  IconButton(
                    onPressed: (){

                    }, 
                    icon: SvgPicture.asset(ImageConst.logOutIcon),)
                ],
              ),
            ),
            SizedBox(
              height: 30.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.0.w),
              child: Container(
                height: 231.h,
                width: size.width,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    DottedBorder(
                      strokeCap: StrokeCap.square,
                      strokeWidth: 2,
                      color: ColorConst.lightGreyColor3,
                      padding: EdgeInsets.zero,
                      dashPattern: const [5, 6],
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(12),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          height: 161.h,
                          width: size.width,
                          color: ColorConst.whiteColor,
                          child: Material(
                            type: MaterialType.transparency,
                            child: InkWell(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                onTap: () async {
                                  imageFileTruck = await imagePicker.pickImage(
                                      source: ImageSource.gallery);

                                  setState(() {
                                    truckImage = File(imageFileTruck!.path);
                                  });
                                },
                                child: truckImage == null
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 30.0.h,
                                          ),
                                          Text(
                                            "Add a truck Image",
                                            style:
                                                CustomTheme.mediumText(context),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            "Optimal dimensions  327 X 177px",
                                            style:
                                                CustomTheme.smallText(context),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      )
                                    : Image.file(
                                        truckImage!,
                                        fit: BoxFit.cover,
                                      ),),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 150.w,
                        height: 117.h,
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                width: 115.w,
                                height: 117.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorConst.primaryColor,
                                  border: Border.all(
                                      color: ColorConst.lightGreyColor3,
                                      width: 5.0),
                                  image: driverImage != null
                                      ? DecorationImage(
                                          image: FileImage(driverImage!),
                                          fit: BoxFit.cover)
                                      : null,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10.h,
                              right: 15.0.w,
                              //alignment: Alignment.bottomRight,
                              child: cameraButtonIcon(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                onPressed: () async {
                                  imageFileDriver = await imagePicker.pickImage(
                                      source: ImageSource.gallery);

                                  setState(() {
                                    driverImage = File(imageFileDriver!.path);
                                  });
                                },
                                svg: ImageConst.camerIcon,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.0.w),
              child: CustomTextField(
                controller: emailController,
                hintText: "Enter e-mail address",
                keyboardType: TextInputType.emailAddress,
                prefixIcon: ImageConst.emailIcon,
              ),
            ),
            SizedBox(
              height: 18.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.0.w),
              child: CustomTextField(
                controller: fullNameController,
                hintText: "Enter Driver's full name",
                keyboardType: TextInputType.name,
                prefixIcon: ImageConst.userIcon,
              ),
            ),
            SizedBox(
              height: 18.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.0.w),
              child: CustomTextField(
                controller: truckPlateNumber,
                hintText: "Enter Truck plate number",
                keyboardType: TextInputType.name,
                prefixIcon: ImageConst.userIcon,
              ),
            ),
            SizedBox(
              height: 18.0.h,
            ),
            Consumer(builder: (context, ref, child) {
              return ref.watch(lgaProvider).when(
                initial: () {
                  return Center(
                    child: Platform.isIOS
                        ? const CircularProgressIndicator.adaptive(
                            backgroundColor: ColorConst.primaryColor,
                          )
                        : const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              ColorConst.primaryColor,
                            ),
                          ),
                  );
                },
                loading: () {
                  return Center(
                    child: Platform.isIOS
                        ? const CircularProgressIndicator.adaptive(
                            backgroundColor: ColorConst.primaryColor,
                          )
                        : const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              ColorConst.primaryColor,
                            ),
                          ),
                  );
                },
                error: (string) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200.0.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                        child: Text(
                          string,
                          textAlign: TextAlign.center,
                          style: CustomTheme.normalText(context),
                        ),
                      ),
                      SizedBox(
                        height: 200.0.h,
                      ),
                    ],
                  );
                },
                data: (stateLga) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27.0.w),
                    child: Container(
                      height: 59.h,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: ColorConst.whiteColor,
                        borderRadius: BorderRadius.circular(36),
                        border: Border.all(
                          width: 1,
                          color: ColorConst.lightGreyColor2,
                        ),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(children: [
                        SvgPicture.asset(ImageConst.location),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              icon: SvgPicture.asset(ImageConst.circlearrow),
                              hint: Text(
                                "City",
                                style: CustomTheme.normalText(context).copyWith(
                                  fontSize: 12.sp,
                                  color: const Color(0xff4B4B4B),
                                ),
                              ),
                              items: stateLga.data!
                                  .map<DropdownMenuItem<String>>(
                                    (e) => DropdownMenuItem<String>(
                                      value: e.abbreviation,
                                      child: Text(
                                        e.name!,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              value: selectedCity,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedCity = value;
                                });
                                debugPrint(value);
                              },
                              buttonHeight: 40.h,
                              buttonWidth: 140.w,
                              itemHeight: 40.h,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  );
                },
              );
            }),
            SizedBox(
              height: 25.0.h,
            ),
            Consumer(builder: (context, ref, child) {
              if (ref.watch(createDriverProvider).isLoading || ref.watch(addDriverProvider).isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.0.w),
                  child: CustomButton(
                    onTap: () {
                      ref.read(createDriverProvider.notifier).createDriver(
                          emailController!.text,
                          fullNameController!.text,
                          emailController!.text,
                          driverImage!.path,
                          truckImage!.path,
                          selectedCity,
                          truckPlateNumber!.text
                        );
                    },
                    text: 'Sign up',
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}

Widget cameraButtonIcon(
    {required Color? color,
    required VoidCallback? onPressed,
    required String? svg}) {
  return Container(
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    ),
    child: Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: SvgPicture.asset(
              svg!,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    ),
  );
}
