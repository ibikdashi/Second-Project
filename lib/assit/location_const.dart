
import 'package:google_maps_flutter/google_maps_flutter.dart';

final List<LatLng> markerLocations = [
  LatLng(33.803054, 35.866430),
  LatLng(33.874052, 35.496465),
  LatLng(33.561212, 35.372805),
  LatLng(33.271395, 35.201171),
  LatLng(34.434935, 35.836171),
  LatLng(34.545647, 36.074033),
];
final List<String> branchname=[
  'Chtoura ranch',
  'Beirut Branch',
  'Siada Branch',
  'TYR Branch',
  'Tripoli Branch',
  'Halba Branch',];
final List<String>snippet=[
  'Taanayel, Al-Masnaa Main Road - Chatura, Lebanon Telephone: 00961 8 541 950 00961 8 542 950 00961 8 543 950',
  'Iskandarani Bldg., 2nd floor Arab University Street - Beirut, Lebanon Telephone: 00961 1 703 103 00961 1 704 304 00961 1 705 205',
  'Chehab Bldg., 2nd floor Riyad el Solh Street - Sidon, Lebanon Telephone: 00961 7 753 693 00961 7 753 694',
  'Tajeddine Bldg., 2nd floor Banque du Liban Street - Tyre, Lebanon Telephone: 00961 07 742 741 00961 07 741 841',
  'Mohamad Harba Bldg., 1st floor Al-Nour Roundabout, Boulevard Street - Tripoli, Lebanon Telephone: 00961 6 428 870 00961 6 428 871 00961 6 428 872',
  'محافظة عكار,حلبا, شارع النجدة الشعبيه, قرب مركز وزارة التربية والتعليم (دار المعلمين) , مبنى شركة امكان الماليه,الطابق الاول. Halba, Akkar,Lebanon  Telephone: 00961 6 691 690 00961 6 691 692 00961 6 691 591‎‎‎‎ ‎‎',
];