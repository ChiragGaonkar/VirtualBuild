import 'package:flutter/material.dart';

import '../../models/models3d_model.dart';

class ModelFeatures extends StatefulWidget {
  final Models3D modelData;
  const ModelFeatures({super.key, required this.modelData});

  @override
  State<ModelFeatures> createState() => _ModelFeaturesState();
}

class _ModelFeaturesState extends State<ModelFeatures> {
  Widget _descriptionHeading(BuildContext context, String heading) {
    return Row(
      //This row is used to left justify the container.
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
      ],
    );
  }

  Widget _descriptionData(
    BuildContext context,
    String heading,
    String value,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }

  bool isMore = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "By ${widget.modelData.modelArchitectname}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "₹${widget.modelData.modelPrice.toString()}",
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        Divider(
          color: Theme.of(context).primaryColor,
        ),
        Row(
          //This row is used to left justify the container.
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Design Elements",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        //Exterior
        _descriptionHeading(context, "Exterior Space"),
        _descriptionData(context, "Color Scheme",
            widget.modelData.modelColorScheme.toString()),
        _descriptionData(
            context, "Floor/s", widget.modelData.modelFloors.toString()),
        _descriptionData(context, "Total Square Footage",
            "${widget.modelData.modelTotalSquareFootage.toString()}sq.ft"),
        _descriptionData(
            context, "Roof Style", widget.modelData.modelRoofStyle.toString()),
        SizedBox(height: size.height * 0.05),

        // Interior
        _descriptionHeading(context, "Interior Space"),
        _descriptionData(context, "Common Room/s",
            widget.modelData.modelNumberOfCommonRooms.toString()),
        _descriptionData(context, "Bedroom/s",
            widget.modelData.modelNumberOfBedrooms.toString()),
        _descriptionData(context, "Bathroom/s",
            widget.modelData.modelNumberOfBaths.toString()),
        _descriptionData(context, "Flooring",
            widget.modelData.modelFlooringOfRooms.toString()),
        _descriptionData(context, "Lighting",
            widget.modelData.modelLightingOfRooms.toString()),
        _descriptionData(context, "Ceiling Height",
            widget.modelData.modelCeilingHeight.toString()),
        SizedBox(height: size.height * 0.05),

        // Technology and smart features
        _descriptionHeading(context, "Technology and smart features"),
        _descriptionData(context, "Smart Tech",
            widget.modelData.modelTechnologyAndSmartFeatures.toString()),
        SizedBox(height: size.height * 0.05),

        // Kitchen
        if (isMore)
          Column(
            children: [
              _descriptionHeading(context, "Kitchen Space"),
              _descriptionData(context, "Countertops",
                  widget.modelData.modelKitchenCountertops.toString()),
              _descriptionData(context, "Cabinetry",
                  widget.modelData.modelKitchenCabinetry.toString()),
              _descriptionData(context, "Flooring",
                  widget.modelData.modelFlooringOfKitchen.toString()),
              SizedBox(height: size.height * 0.05),
            ],
          ),

        // Bathrooms
        if (isMore)
          Column(
            children: [
              _descriptionHeading(context, "Bathroom Space"),
              _descriptionData(context, "Vanity",
                  widget.modelData.modelBathroomVanity.toString()),
              SizedBox(height: size.height * 0.05),
            ],
          ),

        // Outdoor
        if (isMore)
          Column(
            children: [
              _descriptionHeading(context, "Outdoor Space"),
              _descriptionData(
                  context, "Yard", widget.modelData.modelYard ? "Yes" : "No"),
              _descriptionData(
                  context, "Deck", widget.modelData.modelDeck ? "Yes" : "No"),
              _descriptionData(
                  context, "Patio", widget.modelData.modelPatio ? "Yes" : "No"),
              _descriptionData(context, "Parkings",
                  widget.modelData.modelParkings ? "Yes" : "No"),
              _descriptionData(context, "Swimming Pool",
                  widget.modelData.modelPool ? "Yes" : "No"),
              SizedBox(height: size.height * 0.05),
            ],
          ),

        // EnergyEfficiency
        if (isMore)
          Column(
            children: [
              _descriptionHeading(context, "Energy Efficiency"),
              _descriptionData(context, "Energy Efficiency",
                  widget.modelData.modelTechnologyAndSmartFeatures.toString()),
              SizedBox(height: size.height * 0.05),
            ],
          ),

        TextButton(
          onPressed: () {
            setState(() {
              isMore = !isMore;
            });
          },
          child: Text(
            isMore ? "show less" : "show more",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ),
      ],
    );
  }
}
