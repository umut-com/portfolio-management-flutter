

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String apiURL = "http://localhost:8080/api/api";

//Sabit Renklerimiz

const Color kThirdColor = Color.fromRGBO(0, 39, 78, 1); // Koyu Mavi
const Color kSuccessColor = Color.fromRGBO(76, 175, 80, 1); // Yeşil
const Color kBackgroundColor =
    Color.fromARGB(189, 250, 183, 183); // Beyaz veya Açık Gri
const Color kEnergyColor = Color.fromRGBO(255, 165, 0, 1); // Turuncu
const Color kButtonColor =
    Color.fromRGBO(0, 188, 212, 1); // Açık Mavi veya Turkuaz
const Color kTextColor = Color.fromRGBO(117, 117, 117, 1); // Gümüş veya Gri
const Color kHighlightColor = Color.fromRGBO(255, 0, 0, 1); // Kırmızı
const Color kBackgroundColorV2 = Color.fromRGBO(230, 230, 230, 1); // Kırmızı

const Color kPrimaryColor = Color.fromRGBO(158, 158, 158, 50);
const Color kSecondaryColor = Color.fromARGB(255, 97, 97, 97);

const Color kDarkGreenColor = Color.fromRGBO(60, 164, 92, 50);
const Color kLightGreenColor = Color.fromRGBO(132, 172, 76, 50);

const Color kOrangeColor = Color.fromARGB(238, 255, 142, 50);
const Color kLightBlueColor = Color.fromARGB(255, 28, 196, 226);

const Color kBrownColor = Color.fromRGBO(172, 116, 76, 50);
const Color kBlueColor = Color.fromARGB(255, 41, 182, 221);

const Color kGreyColor = Color.fromRGBO(242, 241, 236, 1);
const Color kDarkGreyColor = Color.fromARGB(255, 138, 138, 138);
const Color kDarkGreyColor2 = Color.fromARGB(255, 98, 98, 98);
const Color kLightGrey = Color.fromARGB(184, 155, 152, 152);

const Color kRedColor = Color.fromRGBO(209, 50, 39, 1);
const Color kRedColor2 = Color.fromARGB(255, 222, 46, 33);
const Color kDarkBlueColor = Color.fromRGBO(0, 71, 145, 1.000);
const Color kBlackColor = Color.fromRGBO(0, 0, 0, 1);
const Color kSilverColor = Color(0xFFC0C0C0);
const Color kSilverF5Color = Color(0xFFF5F5F5);
const Color kWhiteColor = Color.fromARGB(255, 250, 250, 250);

const Color kDarkBlueColorV2 = Color(0xff00A7FF);
const Color kTransparentColor = Colors.transparent;

const Color kSnackbarBGColor = Color.fromRGBO(0, 37, 76, 0.392);
const Color kSnackbarOKColor = Color.fromRGBO(28, 140, 61, 1);

const Color kDarkGreenTransparentColor = Color.fromARGB(94, 76, 175, 79);
const Color kRedTransparentColor = Color.fromRGBO(209, 50, 39, 0.337);

const Color dataTable_cell_RedColor =
    Color.fromRGBO(255, 17, 0, 1); // dikkat çeken kırmızı, örn. acil
const Color appBarColor = Color(0xFF5E6828);
const Color orduYesili2 = Color(0xFF5E6828);
const Color orduYesili = Color(0xFF4B5320);
const Color kamuflajYesili = Color(0xFf3D9970);
const Color askeriGri = Color(0xFF808080);
const Color askeriKahverengi = Color(0xFF5B3A29);
const Color askeriYesil = Color(0xFF4d784e);
const Color backgroundColor = Color(0xFF333333);
const Color cardColor = Color(0xFF424756);
const Color cardBlue = Color(0xFF001F3F);
const Color cardColorV2 = Color.fromARGB(255, 98, 102, 114);

const double kBorderRadiusCircularValue = 10;

const Color grayCard = Color(0xFF484848);
const Color blueCard = Color(0xFF001F3F);
const Color greenCard = Color(0xFF4B5320);
BorderRadius cardBorderRadius = BorderRadius.circular(12.0);

//Sabit TextStyle'lar
TextStyle blackFormTitleStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.bold, fontSize: 24, color: kBlackColor);
TextStyle blackFormTitleStyleV2 = GoogleFonts.montserrat(
    fontWeight: FontWeight.bold, fontSize: 36, color: kBlackColor);
TextStyle whiteTextOnBackgroundStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w400, fontSize: 12, color: kWhiteColor);

TextStyle whiteHeadOnCard = GoogleFonts.montserrat(
    fontWeight: FontWeight.w700, fontSize: 16, color: kWhiteColor);

TextStyle whiteText24 = GoogleFonts.montserrat(
    fontWeight: FontWeight.w400, fontSize: 24, color: kWhiteColor);

TextStyle whiteHead24Bold = GoogleFonts.montserrat(
    fontWeight: FontWeight.w700, fontSize: 24, color: kWhiteColor);
TextStyle blackFormTitleStyleQuestion = GoogleFonts.montserrat(
    fontWeight: FontWeight.bold, fontSize: 15, color: kBlackColor);
TextStyle blackFormTextStyleQuestion = GoogleFonts.montserrat(
    fontWeight: FontWeight.w500, fontSize: 13, color: kBlackColor);
TextStyle blackFormTextStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w500, fontSize: 15, color: kBlackColor);
TextStyle silverFormTitleStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.bold, fontSize: 20, color: kSilverColor);
TextStyle silverFormTitleStyleUser = GoogleFonts.montserrat(
    fontWeight: FontWeight.bold, fontSize: 12, color: kSilverColor);
TextStyle silverFormTextStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w500, fontSize: 15, color: kSilverColor);
TextStyle silverFormTextStyleBold = GoogleFonts.montserrat(
    fontWeight: FontWeight.bold, fontSize: 24, color: kSilverColor);
TextStyle greyFormTitleStyleV2 = GoogleFonts.montserrat(
    fontWeight: FontWeight.bold, fontSize: 20, color: kSilverColor);
TextStyle greyFormTextStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w500, fontSize: 15, color: kGreyColor);
TextStyle bottomNavigatorStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.bold, fontSize: 20, color: kBlackColor);

TextStyle kDataTableCellTextStyle = GoogleFonts.montserrat(
    color: kBlackColor, fontWeight: FontWeight.w400, fontSize: 13);
TextStyle kBodyWhiteTextStyle = GoogleFonts.montserrat(color: kWhiteColor);

TextStyle appBarTitleStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w400, fontSize: 25, color: kBlackColor);
TextStyle instructionStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.normal, fontSize: 16, color: kDarkGreyColor);
TextStyle blackStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w400, fontSize: 14, color: kBlackColor);
TextStyle greyStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w400, fontSize: 14, color: kDarkGreyColor);
TextStyle blueStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w400, fontSize: 14, color: kDarkBlueColor);
TextStyle blue16Style = GoogleFonts.montserrat(
    fontWeight: FontWeight.w400, fontSize: 16, color: kDarkBlueColor);
TextStyle subtitleStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600, fontSize: 16, color: kBlackColor);
TextStyle buttonStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600, fontSize: 16, color: kDarkGreyColor);
TextStyle orangeFormTitleStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w400, fontSize: 12, color: kOrangeColor);
TextStyle greyFormTitleStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w500, fontSize: 12.5, color: kDarkGreyColor);

TextStyle blackLargeFormTitleStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w500, fontSize: 16, color: kBlackColor);
TextStyle appbarTitleStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600, fontSize: 18, color: kBlackColor);

TextStyle kDataTableHeaderTextStyle = GoogleFonts.montserrat(
    color: kBlackColor, fontWeight: FontWeight.w600, fontSize: 13);

TextStyle cardBUttonStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w400, color: const Color(0xff648AEC), fontSize: 14);
TextStyle cardTitleStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600, fontSize: 16, color: kBlackColor);
TextStyle cardSubtitleStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w400, fontSize: 14, color: kDarkGreyColor);

TextStyle kTitleTextStyle = const TextStyle(
    color: kBlackColor, fontWeight: FontWeight.w500, fontSize: 18);
const double kIconSize = 20;
const double kIconSizeSnackbar = 40;

// datatable standard settings..
const double dataTable_ColumnWidth_dataRowHeight_Web = 56;
const double dataTable_ColumnWidth_dataRowHeight_MobileTablet = 65;
const double dataTable_ColumnWidth_dataRowHeight = 64;

const double dataTable_ColumnWidth_ID = 50;
const double dataTable_ColumnWidth_Enum =
    75; //öncelik, durum gibi, fieldlar için
const double dataTable_ColumnWidth_Date = 120; // tarih alanları için
const double dataTable_ColumnWidth_DateWithHour =
    150; // saatli tarih alanları içim
const double dataTable_ColumnWidth_CellButton =
    100; // cell içinde butonlar için, örn "edit"
const double dataTable_ColumnWidth_headingRowHeight = 48; // default
const double dataTable_ColumnWidth_columnSpacing = 12;
const double dataTable_ColumnWidth_horizontalMargin = 8;
const double dataTable_ColumnWidth_minWidth =
    800; //yana kaydığı ölçek, her sayfa bunu kullanıcak, farklı bi durum varsa onu da ekleyelim.
const double dataTable_ColumnWidth_Score = 135;
const double dataTable_ColumnWidth_Email = 180; // for loginnames
const double dataTable_ColumnWidth_LongEmail = 250;
const double dataTable_ColumnWidth_LongName = 300;

Widget dataTableEmptyWidget = const Center(
  child: Text("Henüz bir veri yok"),
);
ScrollbarThemeData scrollbarTheme = ScrollbarThemeData(
  thickness: MaterialStateProperty.all(6.5),
  thumbColor: MaterialStateProperty.all<Color>(kLightGrey),

  //Scrollbar'ı kanal içine alarak diğer ögelerle çakışma görüntüsü engelleniyor.

  trackVisibility: const MaterialStatePropertyAll(false),
  trackColor: MaterialStateProperty.all<Color>(kGreyColor),
  minThumbLength: 5,
  radius: const Radius.circular(16),
  crossAxisMargin: 1,
  mainAxisMargin: 4,
  thumbVisibility: const MaterialStatePropertyAll(true),
);