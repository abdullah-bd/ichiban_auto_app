import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:ichiban_auto/app/models/user_model.dart';
import 'package:ichiban_auto/theme/dashboard_appbar.dart';

import '../../../../theme/Colors.dart';
import '../../../../theme/text_widgets.dart';
import '../controllers/create_booking_controller.dart';

class CreateBookingView extends GetView<CreateBookingController> {
  const CreateBookingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbarDetailsWidget("Add A Booking"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  cursorColor: primaryColor,
                  controller: controller.titleController,
                  textInputAction: TextInputAction.next,
                  enableInteractiveSelection: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please add a booking title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.receipt,
                      color: primaryDarkColor,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    hintText: "Booking Title",
                    hintStyle: TextStyle(color: primaryColor),
                  ),
                ),

                const SizedBox(height: 8),
                text14("FROM"),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            controller.pickStartDate(pickedDate);
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please add a valid date';
                          }
                          return null;
                        },
                        readOnly: true,
                        cursorColor: primaryColor,
                        controller: controller.startDateController,
                        enableInteractiveSelection: false,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.calendar_month,
                            color: primaryDarkColor,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          hintText: "Date",
                          hintStyle: TextStyle(color: primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: TextFormField(
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (pickedTime != null) {
                            controller.pickStartTime(pickedTime);
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please add a valid time';
                          }
                          return null;
                        },
                        readOnly: true,
                        cursorColor: primaryColor,
                        controller: controller.startTimeController,
                        enableInteractiveSelection: false,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.watch_later,
                            color: primaryDarkColor,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          hintText: "Time",
                          hintStyle: TextStyle(color: primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                text14("TO"),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            controller.pickEndDate(pickedDate);
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please add a valid date';
                          }
                          return null;
                        },
                        readOnly: true,
                        cursorColor: primaryColor,
                        controller: controller.endDateController,
                        enableInteractiveSelection: false,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.calendar_month,
                            color: primaryDarkColor,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          hintText: "Date",
                          hintStyle: TextStyle(color: primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: TextFormField(
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (pickedTime != null) {
                            controller.pickEndTime(pickedTime);
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please add a valid time';
                          }
                          return null;
                        },
                        readOnly: true,
                        cursorColor: primaryColor,
                        controller: controller.endTimeController,
                        enableInteractiveSelection: false,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.watch_later,
                            color: primaryDarkColor,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          hintText: "Time",
                          hintStyle: TextStyle(color: primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                text14("CAR DETAILS"),
                const SizedBox(height: 2),
                TextFormField(
                  cursorColor: primaryColor,
                  controller: controller.carRegistrationController,
                  enableInteractiveSelection: false,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a valid registration number";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.local_play,
                      color: primaryDarkColor,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    hintText: "Registration Number",
                    hintStyle: TextStyle(color: primaryColor),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  cursorColor: primaryColor,
                  controller: controller.carMakeController,
                  enableInteractiveSelection: false,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a brand name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.time_to_leave,
                      color: primaryDarkColor,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    hintText: "Brand Name",
                    hintStyle: TextStyle(color: primaryColor),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  cursorColor: primaryColor,
                  controller: controller.carModelController,
                  enableInteractiveSelection: false,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a model name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.time_to_leave,
                      color: primaryDarkColor,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    hintText: "Model Name",
                    hintStyle: TextStyle(color: primaryColor),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  cursorColor: primaryColor,
                  controller: controller.carYearController,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  ],
                  enableInteractiveSelection: false,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.length != 4) {
                      return "Please enter a valid year";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.time_to_leave,
                      color: primaryDarkColor,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    hintText: "Model Year",
                    hintStyle: TextStyle(color: primaryColor),
                  ),
                ),
                const SizedBox(height: 16),
                text14("CUSTOMER DETAILS"),
                const SizedBox(height: 2),
                TextFormField(
                  cursorColor: primaryColor,
                  controller: controller.customerNameController,
                  enableInteractiveSelection: false,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter cutomer name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.person,
                      color: primaryDarkColor,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    hintText: "Customer Name",
                    hintStyle: TextStyle(color: primaryColor),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  cursorColor: primaryColor,
                  controller: controller.customerPhoneController,
                  keyboardType: TextInputType.phone,
                  enableInteractiveSelection: false,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter customer phone number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.phone_android_rounded,
                      color: primaryDarkColor,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    hintText: "Customer Phone Number",
                    hintStyle: TextStyle(color: primaryColor),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  cursorColor: primaryColor,
                  controller: controller.customerEmailController,
                  keyboardType: TextInputType.emailAddress,
                  enableInteractiveSelection: false,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter customer email address';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.email,
                      color: primaryDarkColor,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    hintText: "Customer Email",
                    hintStyle: TextStyle(color: primaryColor),
                  ),
                ),
                const SizedBox(height: 16),
                text14("ASSIGN MECHANIC"),
                const SizedBox(height: 8),
                Obx(() =>  DropdownSearch<UserModel>(
                    popupProps: PopupProps.menu(
                      showSelectedItems: false,
                      showSearchBox: true,
                      // disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    items: controller.arrayOfMechanic.value,
                    itemAsString: (UserModel? u) => u?.name ?? "",
                    compareFn: (UserModel? i, UserModel? s) => i == s,
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.settings,
                          color: primaryDarkColor,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        hintText: "Assign To...",
                        hintStyle: TextStyle(color: primaryColor),
                      ),
                    ),
                    onChanged: (value) {
                      controller.selectedMechanic = value;
                    },
                  ),
                ),
                const SizedBox(height: 20),


                GestureDetector(
                  onTap: () {
                      controller.submitBooking();

                  },
                  child: Container(
                    decoration: gradientShapeDecorator,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: text14('Submit', color: whitish, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}