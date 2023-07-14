import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/detail_candidate_loader/detail_candidate_loader_bloc.dart';
import '../bloc/launch_actor/launch_actor_bloc.dart';

class CandidateContactWidget extends StatelessWidget {
  const CandidateContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailCandidateLoaderBloc, DetailCandidateLoaderState>(
      buildWhen: (p, c) => p.contact != c.contact,
      builder: (context, state) {
        final contact = state.contact;
        final status = state.experience;

        return Card(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(8.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
                SizedBox(height: 12.w),
                ContactRowItem(
                  leading: Icon(
                    Icons.email,
                    size: 16.w,
                  ),
                  label: state.contact.email,
                  onTap: () => context
                      .read<LaunchActorBloc>()
                      .add(LaunchActorEvent.emailLaunched(
                        email: contact.email,
                        prefixMessage: 'Hi i am ${status.companyName} company',
                      )),
                ),
                SizedBox(height: 8.w),
                ContactRowItem(
                  leading: Icon(
                    Icons.phone,
                    size: 16.w,
                  ),
                  label: state.contact.phone,
                  onTap: () => context
                      .read<LaunchActorBloc>()
                      .add(LaunchActorEvent.whatsappLaunched(
                        phoneNumber: contact.phone,
                        prefixMessage: 'Hi i am ${status.companyName} company',
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ContactRowItem extends StatelessWidget {
  const ContactRowItem({
    Key? key,
    required this.leading,
    required this.label,
    this.onTap,
  }) : super(key: key);

  final Widget leading;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leading,
        const SizedBox(width: 8),
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: Text(
              label,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
