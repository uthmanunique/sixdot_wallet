import 'package:flutter/material.dart';

class ReceiveCryptoScreen extends StatelessWidget {
  const ReceiveCryptoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: const Color(0xFF03000A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF03000A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Receive",
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
            const SizedBox(height: 24),
            Text(
              'Cryptocurrency',
              style: theme.titleMedium?.copyWith(color: Colors.white54),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.white, width: 1), // Stroked outline
                ),
                filled: false, // No fill color for stroked effect
              ),
              hint: Text(
                'Select cryptocurrency you are expecting',
                style: theme.bodyMedium?.copyWith(color: Colors.grey),
              ),
              items: ['Bitcoin', 'Ethereum', 'Algorand']
                  .map((crypto) => DropdownMenuItem(
                value: crypto,
                child: Text(crypto),
              ))
                  .toList(),
              onChanged: (value) {
                // Handle cryptocurrency selection
              },
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade800,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your wallet address',
                          style: theme.bodySmall?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '6576 •••• •••• 6497',
                          style: theme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.share_outlined, color: Colors.white),
                              onPressed: () {
                                // Handle share button action
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.copy, color: Colors.white),
                              onPressed: () {
                                // Handle copy button action
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade800,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.qr_code,
                          size: 80,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Scan QR Code',
                          style: theme.bodySmall?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
