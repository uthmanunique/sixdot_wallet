import 'package:flutter/material.dart';

class ConfirmBeneficiaryCard extends StatelessWidget {
  final String cryptocurrency;
  final String walletAddress;
  final String amount;
  final String beneficiary;
  final Function onConfirm;
  final Function onCancel;

  const ConfirmBeneficiaryCard({
    Key? key,
    this.cryptocurrency = 'Bitcoin',           // Dummy data
    this.walletAddress = '1A1zP1...kKzWnQ',    // Dummy wallet address
    this.amount = '0.05 BTC',                  // Dummy amount
    this.beneficiary = 'John Doe',             // Dummy beneficiary name
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: const Color(0xFF1A1A2E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Cancel Icon at Top Right
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.cancel, color: Colors.white),
                    onPressed: () => onCancel(),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Summary of Transaction Details
              Text(
                'Confirm Transaction',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Cryptocurrency
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Cryptocurrency:', style: TextStyle(color: Colors.white70)),
                  Text(cryptocurrency, style: const TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 8),

              // Wallet Address
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Wallet Address:', style: TextStyle(color: Colors.white70)),
                  Text(walletAddress, style: const TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 8),

              // Amount
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Amount:', style: TextStyle(color: Colors.white70)),
                  Text(amount, style: const TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 8),

              // Frequent Beneficiary
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Beneficiary:', style: TextStyle(color: Colors.white70)),
                  Text(beneficiary, style: const TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 16),

              // Confirm Button
              ElevatedButton(
                onPressed: () => onConfirm(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Confirm', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
