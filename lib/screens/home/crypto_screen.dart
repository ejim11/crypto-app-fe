import 'package:crypto_app/data/crypto_list.dart';
import 'package:crypto_app/models/crypto_item.dart';
import 'package:crypto_app/widgets/crypto/crypto_card.dart';
import 'package:crypto_app/widgets/home/header.dart';
import 'package:flutter/material.dart';

class CryptoScreen extends StatefulWidget {
  const CryptoScreen({super.key});

  @override
  State<CryptoScreen> createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  String searchQuery = '';
  List<CryptoItem> get filteredCryptoList {
    if (searchQuery.isEmpty) {
      return cryptoList;
    }
    return cryptoList.where((crypto) {
      return crypto.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          crypto.symbol.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 251, 255, 1),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Header(headerText: 'Cryptocurrency'),
                      const SizedBox(height: 16),

                      // Search Bar
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Search for a card',
                          hintStyle: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onTertiary,
                                fontSize: 16,
                              ),
                          prefixIcon: Image.asset(
                            'assets/images/search_icon.png',
                          ),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(213, 215, 218, 1),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(213, 215, 218, 1),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Crypto List
                      ...filteredCryptoList.map((crypto) {
                        return CryptoCard(crypto: crypto);
                      }),

                      // Show message if no results
                      if (filteredCryptoList.isEmpty)
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Text(
                              'No cryptocurrencies found',
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    fontSize: 16,
                                  ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
