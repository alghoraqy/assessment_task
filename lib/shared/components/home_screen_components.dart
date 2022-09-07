import 'package:assessment_task/models/task_model.dart';
import 'package:assessment_task/modules/create_task_screen.dart';
import 'package:assessment_task/shared/shared_functions.dart';
import 'package:assessment_task/shared/theme/app_colors.dart';
import 'package:assessment_task/shared/theme/app_text_style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  Color? color = AppColors.black;

  MyIconButton(
      {Key? key, required this.icon, required this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: 40,
        ));
  }
}

class MyAppbar extends StatelessWidget {
  const MyAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 10,
              color: AppColors.mainColor,
              child: Container(
                // width: MediaQuery.of(context).size.width / 1.5,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              children: [
                MyIconButton(icon: Icons.short_text_outlined, onPressed: () {}),
                Stack(
                  children: [
                    MyIconButton(
                      icon: Icons.notifications_none_outlined,
                      onPressed: () {},
                      color: AppColors.notificationsColor,
                    ),
                    const Positioned(
                      bottom: 10,
                      left: 17,
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.red,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height / 10,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.only(bottomLeft: Radius.circular(34)),
              color: AppColors.mainColor,
            ),
            child: const Center(
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.black,
                backgroundImage: AssetImage('assets/images/female.png'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TopContainer extends StatefulWidget {
  const TopContainer({Key? key}) : super(key: key);

  @override
  State<TopContainer> createState() => _TopContainerState();
}

int calenderIndex = 0;

class _TopContainerState extends State<TopContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3.22,
          color: AppColors.mainColor,
        ),
        Container(
          height: MediaQuery.of(context).size.height / 3.22,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(60)),
              color: Colors.white),
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: MediaQuery.of(context).size.width / 12,
              top: MediaQuery.of(context).size.height / 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 13),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'My Task',
                            style: AppTextStyle.title,
                          ),
                          const Expanded(child: SizedBox()),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 6.2,
                            child: MaterialButton(
                              padding: EdgeInsets.zero,
                              height: MediaQuery.of(context).size.height / 13,
                              color: AppColors.mainColor,
                              onPressed: () {
                                navigato(context, screen: CreateTaskScreen());
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Icon(
                                Icons.add,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Today',
                            style: AppTextStyle.secondTitle,
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            'Monday, 1 June',
                            style: AppTextStyle.date,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 11.5,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CalenderIcon(
                          backgroundcolor: calenderIndex == index
                              ? AppColors.mainColor
                              : Colors.white,
                          daynum: '${index < 9 ? '0${index + 1}' : index + 1}',
                          dayString: getDayString(index),
                          onPressed: () {
                            setState(() {
                              calenderIndex = index;
                            }); ////  I don't always use SetState , it just for that exapmle.
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 7,
                        );
                      },
                      itemCount: 31),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class SecondContainer extends StatelessWidget {
  final List<TaskModel> tasks;
  const SecondContainer({
    Key? key,
    required this.tasks,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(60),
            ),
            color: AppColors.mainColor),
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 25,
          ),
          child: listViewWidget(context, task: tasks),
        ),
      ),
    );
  }
}

Widget listViewWidget(context, {required List<TaskModel> task}) {
  return Padding(
    padding: EdgeInsets.only(
      left: MediaQuery.of(context).size.width / 25,
    ),
    child: RawScrollbar(
      trackVisibility: true,
      thumbVisibility: true,
      scrollbarOrientation: ScrollbarOrientation.left,
      thickness: 5,
      radius: const Radius.circular(10),
      thumbColor: Colors.white,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width / 20,
          ),
          itemBuilder: (context, index) {
            return TaskDetailsContainer(
              image: task[index].image,
              title: task[index].title,
              discription: task[index].discription,
              time: task[index].time,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 15,
            );
          },
          itemCount: task.length),
    ),
  );
}

class CalenderIcon extends StatelessWidget {
  final Color backgroundcolor;
  final String daynum;
  final String dayString;
  final VoidCallback onPressed;
  const CalenderIcon({
    Key? key,
    required this.backgroundcolor,
    required this.daynum,
    required this.dayString,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5.5,
      child: MaterialButton(
        elevation: 1,
        padding: EdgeInsets.zero,
        height: MediaQuery.of(context).size.height / 11.5,
        onPressed: onPressed,
        color: backgroundcolor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: AppColors.mainColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              daynum,
              style: AppTextStyle.title.copyWith(
                  color: backgroundcolor == Colors.white
                      ? Colors.black
                      : Colors.white,
                  fontSize: 25),
            ),
            Text(
              dayString,
              style: AppTextStyle.secondTitle.copyWith(
                  fontWeight: FontWeight.w400,
                  color: backgroundcolor == Colors.white
                      ? AppColors.mainColor
                      : Colors.white,
                  fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}

class TaskDetailsContainer extends StatelessWidget {
  final String image;
  final String title;
  final String discription;
  final String time;

  const TaskDetailsContainer({
    Key? key,
    required this.image,
    required this.title,
    required this.discription,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height / 60,
            right: MediaQuery.of(context).size.width / 40,
          ),
          height: MediaQuery.of(context).size.height / 5.5,
          width: MediaQuery.of(context).size.width / 1.25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 50,
              right: MediaQuery.of(context).size.width / 50,
            ),
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  clipBehavior: Clip.antiAlias,
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/images/loading.jpeg'),
                    image: NetworkImage(image),
                    placeholderFit: BoxFit.cover,
                    fit: BoxFit.cover,
                    fadeInCurve: Curves.easeInCubic,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.secondTitle.copyWith(fontSize: 25),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        discription,
                        textAlign: TextAlign.end,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.date.copyWith(fontSize: 15),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        PositionedDirectional(
          bottom: 0,
          top: MediaQuery.of(context).size.height / 6.5,
          end: 0,
          start: MediaQuery.of(context).size.width / 1.67,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                color: Colors.black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  time,
                  style: AppTextStyle.secondTitle.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
