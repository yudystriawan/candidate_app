import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/detail_candidate_loader/detail_candidate_loader_bloc.dart';

class CandidateAddressWidget extends StatelessWidget {
  const CandidateAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailCandidateLoaderBloc, DetailCandidateLoaderState>(
      buildWhen: (p, c) => p.address != c.address,
      builder: (context, state) {
        return Card(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Address',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  state.address.formattedAddress,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
