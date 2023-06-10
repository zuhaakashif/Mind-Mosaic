import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:mind_mosaic1/view_models/app_view_model.dart';
import 'package:mind_mosaic1/views/bottom_sheets/delete_bottom_sheet_view.dart';
import 'package:mind_mosaic1/views/bottom_sheets/settings_bottom_sheet_view.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Row(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  //color: Colors.white,
                  margin: const EdgeInsets.only(left: 15),
                  child: Column(children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text("Welcome back,",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 27, 18, 36),
                              )),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(viewModel.username,
                              style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 27, 18, 36),
                              )),
                        ),
                      ),
                    )
                  ]),
                )),
            // Trash Icon
            Expanded(
                flex: 1,
                child: InkWell(
                    onTap: () {
                      HapticFeedback.mediumImpact();
                      viewModel.bottomSheetBuilder(
                          const DeleteBottomSheetView(), context);
                    },
                    child: Icon(Icons.delete,
                        color: viewModel.clrLvl3, size: 40))),
            // Settings Icon
            Expanded(
                flex: 1,
                child: InkWell(
                    onTap: () {
                      HapticFeedback.mediumImpact();
                      viewModel.bottomSheetBuilder(
                          const SettingsBottomSheetView(), context);
                    },
                    child: Icon(Icons.settings,
                        color: viewModel.clrLvl3, size: 40))),
          ],
        );
      },
    );
  }
}
