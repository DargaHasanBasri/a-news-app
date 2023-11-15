import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../base/base_stateful_state.dart';
import '../../../utils/custom_colors.dart';
import '../../widgets/custom_widgets/custom_text_form_field.dart';
import 'components/ proposal_item.dart';
import 'components/topics_item.dart';
import 'search_view_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends BaseStatefulState<SearchPage> {
  late final SearchViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<SearchViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _customAppBar(),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: vm.searchController,
                borderRadius: 8,
                contentPadding: 24,
                hintFontSize: 16,
                imageAddress: "images/ic_active_search.png",
                hintText: "Haber, Mecra, Konu ara",
                inputType: TextInputType.text,
                textFieldBgColor: CustomColors.whiteSmoke,
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Text(
                    "Konular",
                    style: TextStyle(
                      color: CustomColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: Ink(
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Row(
                              children: [
                                Text(
                                  "Tümü",
                                  style: TextStyle(
                                    color: CustomColors.coolBlue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                Image.asset("images/ic_arrow_right.png", width: 20, height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 200,
                  child: ListView.separated(
                    controller: vm.pageScrollController,
                    separatorBuilder: (context, index) => const SizedBox(width: 16),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    padding: const EdgeInsets.only(right: 10),
                    itemBuilder: (context, index) {
                      return TopicsItem(
                        newsImageAddress: "images/img_news_1.png",
                        onPress: () {},
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Önerilerimiz",
                style: TextStyle(
                  color: CustomColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.92,
                ),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ProposalItem(
                    newsImageAddress: "images/img_news_1.png",
                    onPress: () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customAppBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Text(
              "İÇERİK MAĞAZASI",
              style: TextStyle(
                color: CustomColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "TR",
                style: TextStyle(
                  color: CustomColors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 4),
              Image.asset(
                "images/ic_location_pin.png",
                height: 18,
                width: 18,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
