import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/core/api/api_services.dart';
import 'package:movies_app/core/di/service_locator.dart';
import 'package:movies_app/features/home/cubits/search_cubit/search_cubit.dart';
import 'package:movies_app/features/home/widgets/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/widgets/movie_item.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(ServiceLocator.getIt<ApiServices>()),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(height: 24.0),
                  CustomTextField(),
                  if (state is SearchInitial) ...[
                    Expanded(
                      child: Column(
                        children: [
                          Spacer(),
                          AspectRatio(
                            aspectRatio: 1496 / 1067,
                            child: SvgPicture.asset('assets/search.svg'),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ] else if (state is SearchLoading) ...[
                    Expanded(
                      child: Center(
                        child: LottieBuilder.asset(
                          'assets/loading.json',
                          width: 100,
                        ),
                      ),
                    ),
                  ] else if (state is SearchSuccess) ...[
                    SizedBox(height: 16.0),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.movies.length,
                        itemBuilder: (context, index) {
                          final movie = state.movies[index];
                          return MovieItem(movie: movie);
                        },
                      ),
                    ),
                  ] else ...[
                    Expanded(
                      child: Center(
                        child: Text((state as SearchFailure).error),
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
