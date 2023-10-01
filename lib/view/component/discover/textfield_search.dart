import 'package:flutter/material.dart';

class DiscoverSerach extends StatelessWidget {
  final  void Function(String)? onSearchChanged;
  final TextEditingController searchController;
  final void Function()? onPressedSearch;
  const DiscoverSerach({Key? key, this.onSearchChanged, required this.searchController, this.onPressedSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24,bottom: 70),
      child: TextFormField(
        onChanged:onSearchChanged ,
        controller:searchController,

        decoration: InputDecoration(
          fillColor:const Color(0xff211F30),
          filled: true,
          hintText:"Find Your Series",
            suffixIcon: IconButton(
              onPressed:onPressedSearch,
              icon: const Icon(Icons.search),
              color: Colors.white,
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(24.1))),
      ),
    );
  }
}
