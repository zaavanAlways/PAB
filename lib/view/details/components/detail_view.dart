import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nakama_shoes/data/dummy_data.dart';
import 'package:nakama_shoes/models/models.dart';
import 'package:nakama_shoes/theme/custom_app_theme.dart';
import 'package:nakama_shoes/utils/app_methods.dart';

import 'package:nakama_shoes/utils/constants.dart';
import 'package:nakama_shoes/view/details/components/app_bar.dart';

class DetailsView extends StatefulWidget {
  const DetailsView(
      {Key? key, required this.model, required this.isComeFromMoreSection})
      : super(key: key);
  final ShoeModel model;
  final bool isComeFromMoreSection;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  bool _isCountrySelected = false;
  int? _isSizeSelected;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: const CustomDetailsViewAppBar(),
        body: SizedBox(
          width: size.width,
          height: size.height * 1.1,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ///
                _topProductImageAndBg(size),
                _morePicOfProduct(size),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _productNameAndPrice(),
                      _productInfo(size.width, size.height),
                      _moreDetailsText(size.width, size.height),
                      _sizeAndCountrySelectionSection(size),
                      _bottomSizeSelection(size),
                      _addToBagButton(size)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Align _addToBagButton(Size size) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: MaterialButton(
          minWidth: size.width / 1.2,
          height: size.height / 15,
          color: widget.model.modelColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            AppMethod.addToCart(widget.model, context);
          },
          child: const Text(
            "Masukkan Ke Keranjang",
            style: TextStyle(color: AppConstantsColor.lightTextColor),
          ),
        ),
      ),
    );
  }

  Widget _bottomSizeSelection(Size size) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      width: size.width,
      height: size.height * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width / 4.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.purple, width: 1)),
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Try It",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  RotatedBox(
                      quarterTurns: -1,
                      child: FaIcon(FontAwesomeIcons.shoePrints))
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.7,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSizeSelected = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 5),
                    width: size.width * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: _isSizeSelected == index
                              ? Colors.black
                              : Colors.grey,
                          width: 1.5),
                      color: _isSizeSelected == index
                          ? Colors.black
                          : AppConstantsColor.backgroundColor,
                    ),
                    child: Center(
                      child: Text(
                        sizes[index].toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: _isSizeSelected == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _sizeAndCountrySelectionSection(Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Size",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppConstantsColor.darkTextColor,
              fontSize: 22,
            ),
          ),
          SizedBox(
            width: size.width * 0.35,
            height: size.height * 0.05,
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    _isCountrySelected = false;
                  },
                  child: Text(
                    "UK",
                    style: TextStyle(
                        fontWeight: _isCountrySelected
                            ? FontWeight.w400
                            : FontWeight.bold,
                        color: _isCountrySelected
                            ? Colors.grey
                            : AppConstantsColor.darkTextColor,
                        fontSize: 19),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isCountrySelected = true;
                    });
                  },
                  child: Text(
                    "USA",
                    style: TextStyle(
                        fontWeight: !_isCountrySelected
                            ? FontWeight.w400
                            : FontWeight.bold,
                        color: !_isCountrySelected
                            ? Colors.grey
                            : AppConstantsColor.darkTextColor,
                        fontSize: 19),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _moreDetailsText(width, height) {
    return const Padding(
      padding: EdgeInsets.only(top: 4),
      child: Text('MORE DETAILS', style: AppTheme.detailsMoreText),
    );
  }

  Widget _productInfo(Width, height) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: Width,
        height: height / 9,
        child: Text(
            "Sepatu adalah salah satu jenis alas kaki(footwear) yang biasanya terdiri dari atas bagian bagian sol, hak, kap, tali, dan lidah. Biasanya juga terbuat dari kanvas atau kulit yang menutupi semua bagian mulaid dari jari jemari, punggung kaki hingga bagian tumit yang difungsikan untuk melindungi kaki dari kotoran berupa debu, kerikil, atau, bahkan lumpur dan puing. Pengelompokkan sepatu biasanya dilakukan berdasarkan fungsi atau tipenya, seperti sepatu resmi (pesta), sepatu santai(kasual), sepatu dansa, sepatu olahraga, sepatu kerja, sepatu ortopedik, dan sepatu minimalis.",
            style: AppTheme.detailsProductDescriptions),
      ),
    );
  }

  Widget _productNameAndPrice() {
    return Row(
      children: [
        Text(
          widget.model.name,
          style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: AppConstantsColor.darkTextColor),
        ),
        Expanded(child: Container()),
        Text('\$${widget.model.price.toStringAsFixed(2)}',
            style: AppTheme.detailsProductPrice),
      ],
    );
  }

  Widget _morePicOfProduct(Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.1,
      color: Colors.deepPurple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            4,
            (index) => index == 3
                ? Container(
                    padding: const EdgeInsets.all(2),
                    width: size.width / 5,
                    height: size.height / 14,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      image: DecorationImage(
                        image: AssetImage(widget.model.imgAddress),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.grey.withOpacity(1), BlendMode.darken),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.play_circle_fill,
                        color: AppConstantsColor.lightTextColor,
                        size: 30,
                      ),
                    ),
                  )
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    child: roundedImage(size.width, size.height),
                  )),
      ),
    );
  }

  Widget _topProductImageAndBg(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height / 2.3,
      child: Stack(
        children: [
          Positioned(
            left: 60,
            bottom: 20,
            child: Container(
              width: size.width,
              height: size.height / 2.2,
              decoration: BoxDecoration(
                color: widget.model.modelColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(1500),
                  bottomRight: Radius.circular(100),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 30,
            child: Hero(
              tag: widget.isComeFromMoreSection
                  ? widget.model.model
                  : widget.model.imgAddress,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-25 / 360),
                child: SizedBox(
                  width: size.width / 1.3,
                  height: size.height / 4.3,
                  child: Image(image: AssetImage(widget.model.imgAddress)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  roundedImage(width, height) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: width / 5,
      height: height / 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Image(image: AssetImage(widget.model.imgAddress)),
    );
  }
}
