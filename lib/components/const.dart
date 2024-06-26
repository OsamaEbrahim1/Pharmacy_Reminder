// Column(
//             children: [
//               const Padding(
//                 padding: EdgeInsets.all(12),
//                 child: SearchField(),
//               ),
//               Expanded(
//                 child: state is AllProductsLoading || state is SearchLoading
//                     ? const Center(child: CircularProgressIndicator())
//                     : state is AllProductsSuccess
//                         ? CustomScrollView(
//                             slivers: [
//                               SliverToBoxAdapter(
//                                 child: Column(
//                                   children: state.products.map((product) {
//                                     return CustomContainer(product: product);
//                                   }).toList(),
//                                 ),
//                               )
//                             ],
//                           )
//                         : state is SearchSuccess
//                             ? CustomScrollView(
//                                 slivers: [
//                                   SliverToBoxAdapter(
//                                     child: Column(
//                                       children: state.data.map((searchs) {
//                                         return SearchContainer(search: searchs);
//                                       }).toList(),
//                                     ),
//                                   )
//                                 ],
//                               )
//                             : Container(),
//               ),
//             ],
//           ),