import 'package:flutter/material.dart';
import 'package:vehicle_details/constants/constants.dart';
import 'package:vehicle_details/responses/cat_api_response.dart';
import 'package:vehicle_details/responses/vehicle_details_response.dart';
import 'package:vehicle_details/reusable/reusableText.dart';
import 'package:vehicle_details/reusable/reusable_expansion_tile.dart';

class CardContainer extends StatelessWidget {
  CardContainer(this.res, {super.key});
  CatApiResponse res;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 7,
            spreadRadius: 5,
          )
        ],
      ),
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          ReusableExpansionTile(
            init: true,
            title: 'Ownership Details',
            children: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextHeading(text: 'Owner name'),
                  TextValue(text: res.ownerName),
                  kDivider,
                  TextHeading(text: 'Address'),
                  TextValue(text: res.address),
                  kDivider,
                  TextHeading(text: 'Father Name'),
                  TextValue(text: res.fatherName),
                ]),
          ),
          ReusableExpansionTile(
            init: false,
            title: 'Vehicle Details',
            children: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextHeading(text: 'Vehicle Name'),
                  TextValue(text: res.manufacturerModel),
                  kDivider,
                  TextHeading(text: 'Manufacturer'),
                  TextValue(text: res.manufacturer),
                  kDivider,
                  TextHeading(text: 'Colour'),
                  TextValue(text: res.colour),
                  kDivider,
                  TextHeading(text: 'Fuel Type'),
                  TextValue(text: res.fuelType),
                ]),
          ),
        ],
      ),
    );
  }
}
