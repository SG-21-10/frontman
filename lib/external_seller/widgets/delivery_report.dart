import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../controllers/delivery_report.dart';

class DeliveryReportForm extends StatelessWidget {
  final ExternalSellerDeliveryReportController controller;
  final VoidCallback onSubmit;
  final bool isLoading;
  final ValueChanged<bool> onQrRequestedChanged;

  const DeliveryReportForm({
    super.key,
    required this.controller,
    required this.onSubmit,
    required this.onQrRequestedChanged,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
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
            child: TextFormField(
              controller: controller.sellerIdController,
              decoration: const InputDecoration(labelText: 'Seller ID:', border: InputBorder.none),
            ),
          ),
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
            child: TextFormField(
              controller: controller.productController,
              decoration: const InputDecoration(labelText: 'Product:', border: InputBorder.none),
            ),
          ),
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
            child: TextFormField(
              controller: controller.quantityController,
              decoration: const InputDecoration(labelText: 'Quantity:', border: InputBorder.none),
              keyboardType: TextInputType.number,
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: controller.qrRequested,
                onChanged: isLoading
                    ? null
                    : (value) {
                        if (value != null) onQrRequestedChanged(value);
                      },
              ),
              const Text('QR Requested'),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonPrimary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: isLoading ? null : onSubmit,
            child: isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text('Submit'),
          ),
        ],
      ),
    );
  }
} 