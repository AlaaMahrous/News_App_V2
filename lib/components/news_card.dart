import 'package:flutter/material.dart';
import 'package:try_your_self/components/custom_text.dart';
import 'package:try_your_self/models/news_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:try_your_self/pages/web_page.dart';


class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.model});
  final NewsModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return WebPage(url: model.url);
          }));
        },
        child: Card(
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: model.urlToImage?? 'https://i.pinimg.com/enabled_hi/564x/53/ac/a0/53aca088a670813e84cc3b51ed5969e7.jpg',
                  width: 200,
                  height: 150,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error){
                    return CachedNetworkImage(
                    imageUrl:  'https://i.pinimg.com/enabled_hi/564x/53/ac/a0/53aca088a670813e84cc3b51ed5969e7.jpg',
                    errorWidget: (context, url, error) {
                      return Image.asset('assets/business.jpeg');
                    },
                    width: 200,
                    height: 150,
                    fit: BoxFit.fill,
                  );
                  }
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 13),
                    CustomText(text: model.title, weight: FontWeight.bold),
                    const SizedBox(height: 6),
                    CustomText(text: model.description?? 'Removed', size: 13, color: Colors.grey),
                    //const CustomText(text: '')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
