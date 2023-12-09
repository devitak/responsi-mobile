import 'package:flutter/material.dart';
import 'package:responsi_mobile/models/model_beef.dart';
import 'package:responsi_mobile/models/model_chicken.dart';
import 'package:responsi_mobile/models/model_dessert.dart';
import '../services/api_data_source.dart';

class ListPage extends StatefulWidget {
  final String strMeal;

  const ListPage({super.key, required this.strMeal});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    var endpoint = widget.strMeal == 'beef' ? 'articles' : widget.strMeal;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${widget.strMeal.toUpperCase()} LIST'),
      ),
      body: FutureBuilder(
        future: ApiDataSource.instance.loadList(endpoint),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (widget.strMeal == 'beef') {
              BeefModel beef = BeefModel.fromJson(snapshot.data!);
              return _buildBeef(beef);
            } else if (widget.strMeal == 'chicken') {
              ChickenModel chicken = ChickenModel.fromJson(snapshot.data!);
              return _buildChicken(chicken);
            } else {
              DessertModel dessert = DessertModel.fromJson(snapshot.data!);
              return _buildDessert(dessert);
            }
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something Went Wrong'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildBeef(BeefModel beef) {
    return ListView.builder(
      itemCount: beef.meals!.length,
      itemBuilder: (context, index) {
        var item = beef.meals![index];
        return _buildItemList(
          item.strMealThumb!,
          item.strMeal!,
        );
      },
    );
  }

  Widget _buildChicken(ChickenModel chicken) {
    return ListView.builder(
      itemCount: chicken.meals!.length,
      itemBuilder: (context, index) {
        var item = chicken.meals![index];
        return _buildItemList(
          item.strMealThumb!,
          item.strMeal!,
        );
      },
    );
  }

  Widget _buildDessert(DessertModel dessert) {
    return ListView.builder(
      itemCount: dessert.meals!.length,
      itemBuilder: (context, index) {
        var item = dessert.meals![index];
        return _buildItemList(
          item.strMealThumb!,
          item.strMeal!,
        );
      },
    );
  }

  Widget _buildItemList(
      String strMealThumb, String strMeal) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailPage(
              type: widget.strMeal,
              strMeal: strMeal,
              strMealThumb: strMealThumb,
            ),
          ),
        );
      },
      child: Card(
        child: SizedBox(
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                strMealThumb,
                width: 150,
                height: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(strMeal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
