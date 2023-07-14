import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            padding: EdgeInsets.all(8.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
                SizedBox(height: 8.w),
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
