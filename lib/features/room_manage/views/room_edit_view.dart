import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hostel_management/models/room_availability_model.dart';

import '../../../common/app_bar.dart';
import '../../../utils/utils.dart';
import '../widgets/user_input_row.dart';

class RoomEditView extends ConsumerStatefulWidget {
  const RoomEditView({
    this.selectedCourse,
    Key? key,
  }) : super(key: key);

  final Result? selectedCourse;

  @override
  ConsumerState createState() => _RoomEditViewState();
}

class _RoomEditViewState extends ConsumerState<RoomEditView> {
  final numberTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final priceTextController = TextEditingController();
  final salaryBaseTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _updateController(widget.selectedCourse);
  }

  bool get isEdit => widget.selectedCourse != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        isEdit ? '编辑宿舍信息' : '添加宿舍',
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(100, 30, 100, 0),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  UserInputRow(
                    controller: numberTextController,
                    title: "名称",
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly, // 数字のみを許可するフィルタ
                    ],
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 30),
                  UserInputRow(
                    controller: nameTextController,
                    title: "可住人数",
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 30),
                  UserInputRow(
                    inputLimit: 10,
                    controller: priceTextController,
                    title: "目前水费¥",
                    textInputType: TextInputType.number,
                    onChanged: (value) {
                      // .setTextAndMoveCursorToEnd(newValue);
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[^0].*')),
                      FilteringTextInputFormatter.deny(RegExp(r" ")),
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[\d\uFF10-\uFF19]')),
                    ],
                  ),
                  const SizedBox(height: 30),
                  UserInputRow(
                    controller: salaryBaseTextController,
                    title: "目前电费¥",
                    textInputType: TextInputType.number,
                    onChanged: (value) {
                      // .setTextAndMoveCursorToEnd(newValue)
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[^0].*')),
                      FilteringTextInputFormatter.deny(RegExp(r" ")),
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[\d\uFF10-\uFF19]')),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const Expanded(
                        child: Text('コース種類'),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.black,
                                elevation: 0,
                                side: const BorderSide(
                                  width: 1.0,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () async {
                                bool result = await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    // final selectedCategoryId =
                                    //     course.categoryId ?? '';
                                    // return CourseCategorySelectDialog(
                                    //     selectedCourseCategoryId:
                                    //         selectedCategoryId);
                                    return Container(color: Colors.red);
                                  },
                                );
                              },
                              child: const Text("選択してください"),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 5,
                              runSpacing: 10,
                              children: [
                                Chip(
                                  backgroundColor: Colors.grey[350],
                                  label: const Text('test'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const Expanded(
                        child: Text('専用店舗'),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.black,
                                elevation: 0,
                                side: const BorderSide(
                                  width: 1.0,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () async {
                                bool result = await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    // final storeIds = course.storeIds ?? [];
                                    // return StoreMultiSelectDialog(
                                    //     selectedStoreIds: storeIds.toSet());
                                    return Container(
                                      color: Colors.green,
                                    );
                                  },
                                );
                                if (result) {
                                  // courseEditNotifier.updateStoreIds(
                                  //     ref.read(selectedStoreIdsProvider));
                                }
                              },
                              child: const Text("選択してください"),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 5,
                              runSpacing: 10,
                              children: showSelectedStore(
                                ['123', '456'],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  ElevatedButton(
                    onPressed: () {
                      logger.i('点击事件');
                    },
                    // courseEditNotifier.canSubmit
                    //     ? () {
                    //         if (isEdit) {
                    //           courseEditNotifier.editCourse().then(
                    //                 (value) => {
                    //                   ref.invalidate(
                    //                       availableCourseListProvider),
                    //                   Navigator.of(context).pop(),
                    //                 },
                    //               );
                    //         } else {
                    //           courseEditNotifier.addCourse().then(
                    //                 (value) => {
                    //                   ref.invalidate(
                    //                       availableCourseListProvider),
                    //                   ref.invalidate(allCourseListProvider),
                    //                   Navigator.of(context).pop(),
                    //                 },
                    //               );
                    //         }
                    //       }
                    //     : null,
                    child: Container(
                      width: 200,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        isEdit ? '変更' : '追加',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              FullScreenLoader(isLoading: false),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> showSelectedStore(List<String> selectedStoreList) {
    return selectedStoreList
        .map(
          (store) => Chip(
            backgroundColor: Colors.grey[350],
            label: Text(store),
          ),
        )
        .toList();
  }

  _updateController(Result? course) {
    logger.d('course: $course');
    nameTextController.text = course?.roomStatus ?? '';
    numberTextController.text = course?.roomNumber.toString() ?? '';
    priceTextController.text = course?.roomCurrentCapacity.toString() ?? '';
    salaryBaseTextController.text = course?.blockId.blockId.toString() ?? '';
  }
}
