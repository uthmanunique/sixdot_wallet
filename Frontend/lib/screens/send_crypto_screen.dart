import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:sixdot/widgets/confirm_beneficiary_card.dart';
import 'package:sixdot/widgets/cta_button.dart'; // Import the CTA button widget
import 'home_screen.dart'; // Import HomeScreen for navigation

class SendCryptoScreen extends StatelessWidget {
  // Add TextEditingController instances for wallet address and amount
  final TextEditingController walletAddressController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  // Add variables for selected beneficiary and cryptocurrency
  String selectedBeneficiary = '';
  String selectedCrypto = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF03000A),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Send',
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width * 0.07,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF03000A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {
              // Information icon functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Balance Display
            Text(
              'Total Balance',
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              '\$0.00',
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
              const SizedBox(height: 20),

              // Frequent Beneficiaries Dropdown
              DropdownButtonFormField<String>(
                items: <String>['Alice', 'Bob', 'Charlie'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedBeneficiary = value ?? '';
                },
                decoration: InputDecoration(
                  hintText: 'Frequent Beneficiaries',
                  hintStyle: const TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),

              // Cryptocurrency Dropdown
              DropdownButtonFormField<String>(
                items: <String>['Bitcoin', 'Ethereum', 'Litecoin'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedCrypto = value ?? '';
                },
                decoration: InputDecoration(
                  hintText: 'Cryptocurrency',
                  hintStyle: const TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 16),

              // Wallet Address Input with Scan Icon on Right
              TextField(
                controller: walletAddressController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Wallet Address',
                  hintStyle: const TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(FontAwesome.qrcode, color: Colors.white),
                    onPressed: () {
                      // Implement scan functionality
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Amount Input
              TextField(
                controller: amountController,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Amount',
                  hintStyle: const TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 80),

              // Checkbox for saving account details
              Row(
                children: [
                  Checkbox(
                    value: false, // Change this value based on actual state
                    onChanged: (bool? value) {
                      // Handle checkbox state change
                    },
                    activeColor: Colors.white,
                    checkColor: Colors.black,
                  ),
                  Expanded(
                    child: Text(
                      'By checking this box, you save account details',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 0),

              // CTAs at the bottom
              Column(
                children: [
                  CtaButton(
                    text: 'Send',
                    onPressed: () {
                      // Show the ConfirmBeneficiaryCard dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            child: ConfirmBeneficiaryCard(
                              cryptocurrency: selectedCrypto,
                              walletAddress: walletAddressController.text,
                              amount: amountController.text,
                              beneficiary: selectedBeneficiary,
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
                  const SizedBox(height: 4), // Space between buttons
                  CtaButton(
                    text: 'Cancel',
                    isFilled: false,
                    onPressed: () {
                      Navigator.pop(context); // Go back to the previous screen
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }

// Widget for PIN entry dialog
class PinEntryDialog extends StatelessWidget {
  final Function(String) onPinEntered;

  PinEntryDialog({required this.onPinEntered});

  @override
  Widget build(BuildContext context) {
    final TextEditingController pinController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Enter PIN',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: pinController,
            obscureText: true,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Enter your PIN',
              hintStyle: const TextStyle(color: Colors.white54),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 16),
          CtaButton(
            text: 'Submit',
            onPressed: () {
              onPinEntered(pinController.text);
            },
          ),
        ],
      ),
    );
  }
}

// Widget for Success Transaction dialog
class TransactionSuccessDialog extends StatelessWidget {
  final String transactionId;

  TransactionSuccessDialog({required this.transactionId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 60),
          const SizedBox(height: 8),
          const Text(
            'Successful',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Transaction ID: $transactionId',
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
              IconButton(
                icon: const Icon(Icons.copy, color: Colors.white70),
                onPressed: () {
                  // Add functionality to copy transaction ID
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          CtaButton(
            text: 'Share',
            onPressed: () {
              // Add functionality to share transaction
            },
          ),
          const SizedBox(height: 8),
          IconButton(
            icon: const Icon(Icons.cancel, color: Colors.white),
            onPressed: () {
              Navigator.pop(context); // Close dialog
            },
          ),
        ],
      ),
    );
  }
}
