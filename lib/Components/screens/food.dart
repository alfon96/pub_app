import 'package:app/Components/food/food_card.dart';
import 'package:app/data/food_data.dart';
import 'package:app/providers/food.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

// Assicurati che il widget sia uno StatefulWidget se vuoi utilizzare initState.
class Food extends ConsumerStatefulWidget {
  const Food({super.key});

  @override
  ConsumerState<Food> createState() => _FoodState();
}

class _FoodState extends ConsumerState<Food> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      fetchMeals();
    });
    // Esegui la tua funzione di inizializzazione qui
  }

  Future<void> fetchMeals() async {
    try {
      final response =
          await http.get(Uri.parse("https://jsonplaceholder.typicode.com"));

      if (response.statusCode >= 400) {
        throw Exception('Failed to contact google.');
      }

      ref.read(foodProvider.notifier).loadFood(menuItems);
    } catch (e) {
      // print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    List filters = [];
    final menu = ref.watch(foodProvider);
    double screenWidth = MediaQuery.of(context).size.width;
    int colNumber = screenWidth > 1000
        ? 5
        : screenWidth > 800
            ? 4
            : screenWidth > 590
                ? 3
                : screenWidth > 315
                    ? 2
                    : 1;
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height -
            kToolbarHeight -
            (size.height - kToolbarHeight) * 1 / 5 -
            8 +
            2 * 10) *
        3 /
        5;

    print(itemHeight);

    final double itemWidth = (size.width - 16) / colNumber;

    double aspectRatio = screenWidth > 1000
        ? (itemWidth / itemHeight)
        : screenWidth > 730
            ? (itemWidth / itemHeight)
            : screenWidth > 590
                ? (itemWidth / itemHeight)
                : (itemWidth / itemHeight);
    void handleFilters(bool? filter) {
      if (filter != null) {
        setState(() {
          if (filters.contains(filter)) {
            filters.remove(filter);
          } else {
            filters.add(filter);
          }
        });
      }
    }

    // double screenheight = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Column(
              children: [
                const Text(
                  'Food',
                  style: TextStyle(
                      fontSize: 24.0, color: Color.fromARGB(255, 56, 42, 1)),
                ),
                const Text(
                    'You can use the following filters to match your favourite diet.'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: isChecked,
                        semanticLabel: 'Vegan',
                        onChanged: handleFilters)
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: aspectRatio,

                crossAxisCount: colNumber, // Numero di colonne
                crossAxisSpacing: 10, // Spaziatura orizzontale tra le cards
                mainAxisSpacing: 10, // Spaziatura verticale tra le cards
              ),
              itemCount: menu.length,
              itemBuilder: (BuildContext context, int index) {
                return FoodCard(
                  foodData: menu[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
