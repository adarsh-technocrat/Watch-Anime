import 'package:flutter/material.dart';

import '../model/search_data_model.dart';

class SearchCard extends StatelessWidget {
  final List<Anime>? data;

  const SearchCard({Key? key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        alignment: WrapAlignment.start,
        children: List.generate(
          data?.length ?? 0,
          (index) => Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: Image.network(
                      data?[index].animeImage ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data![index].animeTitle.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
