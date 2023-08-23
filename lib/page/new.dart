import 'package:flutter/material.dart';
import 'package:vehicle_details/http/cat_api.dart';
import 'package:vehicle_details/http/vehicle_api.dart';
import 'package:vehicle_details/responses/cat_api_response.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vehicle_details/responses/vehicle_details_response.dart';
import 'package:vehicle_details/reusable/flexible_space_bar.dart';

import '../reusable/card_container.dart';

class NewPage extends StatefulWidget {
  NewPage(this.vehicleNumber, {super.key});
  final vehicleNumber;

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> with SingleTickerProviderStateMixin {
  late TabController _controller;
  String vehicleData = '';
  String ownerName = '';
  bool isLoading = true;
  CatApiResponse res = CatApiResponse(
      seatingCapacity: '',
      registrationDate: '',
      registeredPlace: '',
      manufacturerModel: '',
      manufacturer: '',
      isFinanced: false,
      insuranceValidity: '',
      insurancePolicyNo: '',
      insuranceName: '',
      fuelType: '',
      fitnessUpTo: '',
      financier: '',
      colour: '',
      registrationNumber: '',
      chassisNumber: '',
      engineNumber: '',
      fatherName: '',
      address: '',
      ownerName: '');

  void _getVehicleDetail(String vehicleNumber) async {
    setState(() {
      isLoading = true;
    });
    CatApiResponse? apiResponse = await CatApi.getVehicleDetail(vehicleNumber);
    setState(() {
      isLoading = false;
      res = apiResponse!;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
    _getVehicleDetail(widget.vehicleNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              expandedHeight: 300,
              backgroundColor: Colors.black,
              pinned: true,
              floating: false,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(48.0 + 16.0),
                child: TabBar(controller: _controller, tabs: [
                  const Tab(text: 'RC details'),
                  // const Tab(text: 'Owner '),
                  Container(),
                  Container(),
                  Container()
                ]),
              ),
              flexibleSpace: isLoading
                  ? const SpinKitSpinningLines(
                      color: Colors.white,
                      size: 50.0,
                    )
                  : ReuseFlexibleSpaceBar(res: res),
              actions: [
                IconButton(icon: const Icon(Icons.more_vert), onPressed: () {})
              ]),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Container(
                height: 1600,
                color: Colors.transparent,
                child: Column(
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30, top: 30),
                          child: Text(
                            'RC details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 25),
                          ),
                        ),
                      ],
                    ),

                    // Container(
                    //   height: 300,
                    //   margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(15),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.grey.withOpacity(0.5),
                    //         blurRadius: 7,
                    //         spreadRadius: 5,
                    //       )
                    //     ],
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(18.0),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.stretch,
                    //       children: [
                    //         TextHeading(
                    //           text: 'Owner name',
                    //         ),
                    //         TextValue(
                    //           text: res.ownerName,
                    //         ),
                    //         Divider(color: Colors.grey),
                    //         TextHeading(
                    //           text: 'Address',
                    //         ),
                    //         TextValue(
                    //           text: res.address,
                    //         ),
                    //         Divider(
                    //           color: Colors.grey,
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // )
                    CardContainer(res),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
