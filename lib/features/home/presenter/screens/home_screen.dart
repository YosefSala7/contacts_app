import 'package:contacts/core/app_colors.dart';
import 'package:contacts/core/gen/assets.gen.dart';
import 'package:contacts/features/home/data/models/contact_model.dart';
import 'package:contacts/features/home/presenter/components/bottom_sheet.dart';
import 'package:contacts/features/home/presenter/components/custom_card.dart';
import 'package:contacts/features/home/presenter/components/empty_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String homeRouteName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          contacts.isEmpty
              ? const SizedBox.shrink()
              : FloatingActionButton(
                  backgroundColor: AppColors.error,
                  onPressed: () {
                    contacts.removeLast();
                    setState(() {});
                  },
                  child: Assets.icons.delete.svg(),
                ),
          SizedBox(height: 8),
          contacts.length == 6
              ? const SizedBox.shrink()
              : FloatingActionButton(
                  backgroundColor: AppColors.primary,
                  onPressed: () {
                    CustomBottomSheet.show(
                      context: context,
                      onClose: () {
                        setState(() {});
                      },
                    );
                  },
                  child: Assets.icons.icon.svg(),
                ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 30,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Assets.imgs.routeLogo.svg(),
              ),
              contacts.isEmpty
                  ? EmptyScreen()
                  : Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          mainAxisExtent: 290,
                        ),
                        itemCount: contacts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomCard(contact: contacts[index],onTap:() {
                            setState(() {
                              contacts.removeAt(index);
                            });
                          },);
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}