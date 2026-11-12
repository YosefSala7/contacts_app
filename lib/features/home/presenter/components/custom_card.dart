import 'package:contacts/core/app_colors.dart';
import 'package:contacts/core/gen/assets.gen.dart';
import 'package:contacts/features/home/data/models/contact_model.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  new({super.key, required this.contact,required this.onTap});
  ContactModel contact;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Stack(
            children: [Container(
              width: 177,
              clipBehavior: .hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Image.file(contact.img, fit: .cover),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all( Radius.circular(8)),
                  color: AppColors.primary
                ),
                child: Text(contact.name,style: Theme.of(context).textTheme.labelLarge,),
              ),
            ),
            ]
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.all(8),
            width: .infinity,
            clipBehavior: .hardEdge,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
            ),
            child: Column(
              spacing: 5,

              children: [
                Spacer(),
                Row(
                  spacing: 8,
                  children: [
                    Assets.icons.email.svg(width: 20),
                    Text(
                      contact.gmail,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: [
                    Assets.icons.phoneCall.svg(width: 20),
                    Text(
                      contact.phone,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),

                ElevatedButton(
                  onPressed: () {
                    onTap();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    backgroundColor: AppColors.error,
                    minimumSize: Size(.infinity, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    spacing: 8,
                    mainAxisAlignment: .center,
                    children: [
                      Assets.icons.delete.svg(width: 10),
                      Text(
                        "Delete",
                        style: Theme.of(context).textTheme.labelSmall!
                            .copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
