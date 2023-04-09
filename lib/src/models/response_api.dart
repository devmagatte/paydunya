import 'package:equatable/equatable.dart';

class ResponseApi extends Equatable {
  final String reponseCode;
  final String responseText;

  const ResponseApi({
    required this.reponseCode,
    required this.responseText,
  });

  @override
  List<Object?> get props => [
        reponseCode,
        responseText,
      ];
}
