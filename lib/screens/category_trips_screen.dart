import 'package:flutter/material.dart';
import '../models/trip.dart';
//import '../widgets/trip_item.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const screenRoute = '/category-trips'; // تم تصحيح الخطأ في اسم المسار

  final List<Trip> availableTrips;

  CategoryTripsScreen(this.availableTrips);

  @override
  _CategoryTripsScreenState createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  String? categoryTitle; // جعلت المتغير nullable للتوافق مع null safety
  List<Trip> displayTrips = []; // تهيئة القائمة لتكون فارغة افتراضيًا

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    if (routeArguments != null) {
      final categoryId = routeArguments['id'];
      categoryTitle = routeArguments['title'];
      displayTrips = widget.availableTrips.where((trip) {
        return trip.categories.contains(categoryId);
      }).toList();
    }
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle ??
            'الرحلات'), // التعامل مع null في حالة عدم تعيين title
      ),
      body: ListView.builder(
        itemCount: displayTrips.length,
        itemBuilder: (ctx, index) {
          return TripItem(
            id: displayTrips[index].id,
            title: displayTrips[index].title,
            imageUrl: displayTrips[index].imageUrl,
            duration: displayTrips[index].duration,
            tripType: displayTrips[index].tripType,
            season: displayTrips[index].season,
            // removeItem: _removeTrip, // لو أردت تفعيل حذف الرحلات
          );
        },
      ),
    );
  }
}
