import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/detail_candidate_loader/detail_candidate_loader_bloc.dart';

class CandidateContactWidget extends StatelessWidget {
  const CandidateContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailCandidateLoaderBloc, DetailCandidateLoaderState>(
      buildWhen: (p, c) => p.contact != c.contact,
      builder: (context, state) {
        return Card(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Contact',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(
                      Icons.email,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(state.contact.email),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(state.contact.phone),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
