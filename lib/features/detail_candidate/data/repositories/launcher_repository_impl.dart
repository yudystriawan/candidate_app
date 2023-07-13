import 'package:candidate_app/core/error/failures.dart';
import 'package:candidate_app/features/detail_candidate/domain/repositories/launcher_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

@Injectable(as: LauncherRepository)
class LauncherRepositoryImpl implements LauncherRepository {
  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  String _getBodyMessage(String? prefixMessage, String? message) {
    String body = '';
    if (prefixMessage != null && prefixMessage.isNotEmpty) {
      body += prefixMessage;
    }
    if (message != null && message.isNotEmpty) {
      if (body.isEmpty) {
        body += message;
      } else {
        body += ' $message';
      }
    }
    return body;
  }

  @override
  Future<Either<Failure, Unit>> launchEmail({
    required String email,
    String? prefixMessage,
    String? message,
  }) async {
    try {
      String body = _getBodyMessage(prefixMessage, message);

      final emailUri = Uri(
        scheme: 'mailto',
        path: email,
        query: _encodeQueryParameters({
          'subject': 'Introduction',
          'body': body,
        }),
      );

      await launchUrl(emailUri);
      return right(unit);
    } catch (e) {
      return left(const Failure.unexpectedError());
    }
  }

  @override
  Future<Either<Failure, Unit>> launchWhatsappApp({
    required String phoneNumber,
    String? prefixMessage,
    String? message,
  }) async {
    try {
      String body = _getBodyMessage(prefixMessage, message);

      final uri = Uri.parse('whatsapp://send?text=$body&phone=$phoneNumber');

      await launchUrl(uri);

      return right(unit);
    } catch (e) {
      return left(const Failure.unexpectedError());
    }
  }
}
