import 'package:crypto_app/data/gift_cards.dart';
import 'package:crypto_app/models/gift_card_item.dart';
import 'package:crypto_app/widgets/gift_card/gift_card.dart';
import 'package:crypto_app/widgets/home/header.dart';
import 'package:flutter/material.dart';

class GiftCardScreen extends StatefulWidget {
  const GiftCardScreen({super.key});

  @override
  State<GiftCardScreen> createState() => _GiftCardScreenState();
}

class _GiftCardScreenState extends State<GiftCardScreen> {
  String searchQuery = '';

  List<GiftCardItem> get filteredGiftCards {
    if (searchQuery.isEmpty) {
      return giftCards;
    }
    return giftCards.where((card) {
      return card.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 251, 255, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Header(headerText: 'Gift Cards'),
              const SizedBox(height: 16),

              // Search Field
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search for a card',
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onTertiary,
                    fontSize: 16,
                  ),
                  prefixIcon: Image.asset('assets/images/search_icon.png'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(213, 215, 218, 1),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
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
              const SizedBox(height: 24),

              // Gift Cards Grid
              Expanded(
                child: filteredGiftCards.isEmpty
                    ? Center(
                        child: Text(
                          'No gift cards found',
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 16,
                              ),
                        ),
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.85,
                            ),
                        itemCount: filteredGiftCards.length,
                        itemBuilder: (context, index) {
                          return GiftCardWidget(
                            giftCard: filteredGiftCards[index],
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
