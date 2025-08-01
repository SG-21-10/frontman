import './seller_drawer.dart';
import 'package:flutter/material.dart';
import '../controllers/incentives.dart';
import '../widgets/incentives.dart';
import '../../../constants/colors.dart';

class ExternalSellerIncentivesScreen extends StatefulWidget {
  const ExternalSellerIncentivesScreen({super.key});

  @override
  State<ExternalSellerIncentivesScreen> createState() => ExternalSellerIncentivesScreenState();
}

class ExternalSellerIncentivesScreenState extends State<ExternalSellerIncentivesScreen> {
  final controller = ExternalSellerIncentivesController();
  final sellerIdController = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    sellerIdController.dispose();
    super.dispose();
  }

  void handleFetch() {
    setState(() {
      controller.fetchIncentives(sellerIdController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Incentives'),
        backgroundColor: AppColors.primaryBlue,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: SellerDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: TextField(
                    controller: sellerIdController,
                    decoration: const InputDecoration(
                      labelText: 'Seller ID:',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonPrimary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: controller.isLoading ? null : handleFetch,
                  child: controller.isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Fetch Incentives'),
                ),
                const SizedBox(height: 24),
                if (controller.error != null)
                  Text(controller.error!, style: const TextStyle(color: Colors.red)),
                Expanded(
                  child: IncentivesList(incentives: controller.incentives ?? []),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
} 