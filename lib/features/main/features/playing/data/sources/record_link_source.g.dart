// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_link_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _RecordLinkSource implements RecordLinkSource {
  _RecordLinkSource(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://mds.norn.su/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<RecordLink> getRecordLink(recordLinkBody) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(recordLinkBody.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RecordLink>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/get_records',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RecordLink.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
