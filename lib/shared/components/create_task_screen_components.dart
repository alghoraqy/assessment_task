import 'package:assessment_task/shared/components/home_screen_components.dart';
import 'package:assessment_task/shared/theme/app_colors.dart';
import 'package:assessment_task/shared/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SecondAppBar extends StatelessWidget {
  const SecondAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyIconButton(
            icon: Icons.keyboard_arrow_left_rounded,
            onPressed: () {
              Navigator.pop(context);
            }),
        const Expanded(child: SizedBox()),
        MyIconButton(icon: Icons.short_text, onPressed: () {})
      ],
    );
  }
}

class CreateTaskRow extends StatelessWidget {
  const CreateTaskRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Create New Task',
          style: AppTextStyle.title.copyWith(fontSize: 29),
        ),
        const Spacer(),
        Icon(
          Icons.assignment_outlined,
          color: AppColors.mainColor,
          size: 70,
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class TaskNameForm extends StatelessWidget {
  TextEditingController taskNameController;
  TaskNameForm({Key? key, required this.taskNameController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Task Name', style: AppTextStyle.coloredTitle),
        const SizedBox(
          height: 5,
        ),
        MyFormField(
          text: 'Task Name',
          controller: taskNameController,
          textStyle: AppTextStyle.secondTitle.copyWith(fontSize: 25),
        ),
      ],
    );
  }
}

class CategoryRow extends StatelessWidget {
  const CategoryRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Select Category', style: AppTextStyle.coloredTitle),
        const Spacer(),
        TextButton(
            onPressed: () {},
            child: Text(
              'See all',
              style: AppTextStyle.date,
            ))
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Color backGroundColor;
  final String category;
  const CategoryItem(
      {Key? key, required this.category, required this.backGroundColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height / 75),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.mainColor),
          color: backGroundColor == Colors.white
              ? Colors.white
              : AppColors.mainColor),
      child: Text(
        category,
        style: AppTextStyle.coloredTitle.copyWith(
            color: backGroundColor == Colors.white
                ? AppColors.mainColor
                : Colors.white,
            fontSize: 20),
      ),
    );
  }
}

class CategoryListView extends StatelessWidget {
  final List<String> category;
  const CategoryListView({Key? key, required this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 17,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryItem(
                category: category[index],
                backGroundColor:
                    index == 0 ? AppColors.mainColor : Colors.white);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10,
            );
          },
          itemCount: category.length),
    );
  }
}

class DateForm extends StatelessWidget {
  final TextEditingController dateController;

  const DateForm({Key? key, required this.dateController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date',
          style: AppTextStyle.coloredTitle,
        ),
        Row(
          children: [
            MyFormField(
              text: 'Date',
              textStyle: AppTextStyle.selectDate,
              controller: dateController,
              width: MediaQuery.of(context).size.width / 2,
            ),
            const Expanded(child: SizedBox()),
            MaterialButton(
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2025))
                    .then((value) {
                  dateController.text =
                      DateFormat('EEEEEE, d MMMM').format(value!);
                });
              },
              padding: const EdgeInsets.all(10),
              color: AppColors.mainColor,
              shape: const CircleBorder(),
              child: const Icon(
                Icons.calendar_month_outlined,
                color: Colors.white,
                size: 35,
              ),
            )
          ],
        ),
      ],
    );
  }
}

class TimeForm extends StatelessWidget {
  final TextEditingController startTimeController;
  final TextEditingController endTimeController;

  const TimeForm({
    Key? key,
    required this.startTimeController,
    required this.endTimeController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TimePickItem(
          title: 'Start Time',
          formtext: 'Start Time',
          controller: startTimeController,
          onPressed: () {
            showTimePicker(context: context, initialTime: TimeOfDay.now())
                .then((value) {
              startTimeController.text = value!.format(context);
            });
          },
        ),
        TimePickItem(
          title: 'End Time',
          formtext: 'End Time',
          controller: endTimeController,
          onPressed: () {
            showTimePicker(context: context, initialTime: TimeOfDay.now())
                .then((value) {
              endTimeController.text = value!.format(context);
            });
          },
        )
      ],
    );
  }
}

class DiscriptionForm extends StatelessWidget {
  final TextEditingController discriptionController;
  const DiscriptionForm({Key? key, required this.discriptionController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Discription',
          style: AppTextStyle.coloredTitle,
        ),
        MyFormField(
            text: 'Discription',
            controller: discriptionController,
            textStyle: AppTextStyle.selectDate.copyWith(fontSize: 18)),
      ],
    );
  }
}

// ignore: must_be_immutable
class MyFormField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final TextStyle textStyle;
  double? width = double.infinity;
  bool? suffix = false;
  VoidCallback? onpressed;
  MyFormField({
    Key? key,
    required this.text,
    required this.controller,
    required this.textStyle,
    this.suffix,
    this.onpressed,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        style: textStyle,
        decoration: InputDecoration(
          hintText: text,
          suffixIcon: suffix == true
              ? IconButton(
                  onPressed: onpressed,
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 35,
                    color: AppColors.mainColor,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

class TimePickItem extends StatelessWidget {
  final String title;
  final String formtext;
  final TextEditingController controller;
  final VoidCallback onPressed;
  const TimePickItem(
      {Key? key,
      required this.title,
      required this.formtext,
      required this.controller,
      required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.coloredTitle,
        ),
        MyFormField(
          text: formtext,
          controller: controller,
          width: MediaQuery.of(context).size.width / 2.5,
          textStyle: AppTextStyle.selectDate,
          suffix: true,
          onpressed: onPressed,
        ),
      ],
    );
  }
}

class CreateButton extends StatelessWidget {
  const CreateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      width: MediaQuery.of(context).size.width / 1.7,
      child: MaterialButton(
        onPressed: () {},
        height: MediaQuery.of(context).size.height / 14,
        color: AppColors.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          'Create Task',
          style: AppTextStyle.title.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
