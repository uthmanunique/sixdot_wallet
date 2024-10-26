import 'package:flutter/material.dart';
import 'package:sixdot/screens/home_screen.dart';
import 'package:sixdot/screens/send_crypto_screen.dart';
import 'package:sixdot/widgets/cta_button.dart';
import 'package:sixdot/widgets/confirm_beneficiary_card.dart';

class SwapCryptoScreen extends StatelessWidget {
  const SwapCryptoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: const Color(0xFF03000A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF03000A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Swap",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {
              // Handle info button action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              'Total Balance',
              style: theme.bodySmall?.copyWith(color: Colors.white),
            ),
            Text(
              '\$0.00',
              style: theme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'You send',
              style: theme.titleMedium?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8),
            // You Send section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.white54),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white54,
                    child: const Icon(Icons.circle, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  Text(
                      'BTC',
                      style: theme.bodyMedium?.copyWith(color: Colors.white)
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '0.00',
                        border: InputBorder.none,
                        hintStyle: theme.bodyMedium?.copyWith(color: Colors.white54),
                      ),
                      style: theme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: IconButton(
                icon: const Icon(Icons.swap_vert, size: 32, color: Colors.white),
                onPressed: () {
                  // Handle swap action
                },
              ),
            ),
            const SizedBox(height: 0),
            Text(
              'You get',
              style: theme.titleMedium?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.white54),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white54,
                    child: const Icon(Icons.circle, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  Text(
                      'ETH',
                      style: theme.bodyMedium?.copyWith(color: Colors.white)
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: '0.00',
                        border: InputBorder.none,
                        hintStyle: theme.bodyMedium?.copyWith(color: Colors.white54),
                      ),
                      style: theme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Swap Button
            CtaButton(
              text: 'Swap',
              onPressed: () {
                // Show the ConfirmBeneficiaryCard dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      child: ConfirmBeneficiaryCard(
                        cryptocurrency: 'BTC', // Pass actual cryptocurrency
                        walletAddress: 'N/A for swap', // Modify if needed
                        amount: '0.00', // Retrieve from input
                        beneficiary: 'You will receive ETH', // Modify for swap
                        onConfirm: () {
                          Navigator.pop(context); // Close ConfirmBeneficiaryCard
                          // Show the PIN entry dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                child: PinEntryDialog(
                                  onPinEntered: (pin) {
                                    Navigator.pop(context); // Close PIN dialog
                                    // Show success card after entering PIN
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          backgroundColor: Colors.transparent,
                                          child: TransactionSuccessDialog(
                                            transactionId: '0001293039',
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                        onCancel: () {
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
