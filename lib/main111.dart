// import 'package:flutter/material.dart';
// import 'package:purchases_flutter/purchases_flutter.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // RevenueCatの初期化
//   await Purchases.configure(
//     PurchasesConfiguration("appl_BFdGjdAkcbonHIhlWHxigrpSnQW"), // ここにAPIキーを入力
//   );

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(title: 'RevenueCat Demo', home: SubscriptionPage());
//   }
// }

// class SubscriptionPage extends StatefulWidget {
//   @override
//   _SubscriptionPageState createState() => _SubscriptionPageState();
// }

// class _SubscriptionPageState extends State<SubscriptionPage> {
//   List<Package> packages = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchPackages();
//   }

//   Future<void> fetchPackages() async {
//     try {
//       // RevenueCatから製品情報を取得
//       Offerings offerings = await Purchases.getOfferings();
//       if (offerings.current != null) {
//         setState(() {
//           packages = offerings.current!.availablePackages;
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       print("Error fetching packages: $e");
//     }
//   }

//   Future<void> purchase(Package package) async {
//     try {
//       // 製品を購入
//       await Purchases.purchasePackage(package);
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text("Purchase Successful!")));
//     } catch (e) {
//       print("Error during purchase: $e");
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text("Purchase Failed.")));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Subscription")),
//       body:
//           isLoading
//               ? Center(child: CircularProgressIndicator())
//               : ListView.builder(
//                 itemCount: packages.length,
//                 itemBuilder: (context, index) {
//                   Package package = packages[index];
//                   return ListTile(
//                     title: Text(package.storeProduct.title),
//                     subtitle: Text(package.storeProduct.priceString),
//                     trailing: ElevatedButton(
//                       onPressed: () => purchase(package),
//                       child: Text("Buy"),
//                     ),
//                   );
//                 },
//               ),
//     );
//   }
// }
