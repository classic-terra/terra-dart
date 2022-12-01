import 'package:http/http.dart';

import 'terraHttpClientHandler.dart';
import 'terraRestfulResponse.dart';

class TerraRestfulService {
  final TerraHttpClientHandler clientService;

  TerraRestfulService(this.clientService);

  /// Runs a GET operation via HttpClient to retrieve information.
  Future<TerraRestfulResponse<TResult>> getAsync<TResult>(String uri) async {
    var response = await clientService.getAsync(uri);
    if (response.statusCode != 200) {
      throw Exception(
          "Status Code: ${response.statusCode}, Reason: ${response.reasonPhrase}");
    }

    return await deserializeResponse<TResult>(response);
  }

  /// Runs a POST operation via HttpClient to send information.
  Future<TerraRestfulResponse<TReceive>> postAsync<TSend, TReceive>(
      String endpoint, TSend data) async {
    var response = await clientService.postAsync(endpoint, data: data);
    if (response.statusCode != 200) {
      throw Exception(
          "Status Code: ${response.statusCode}, Reason: ${response.reasonPhrase}");
    }

    return await deserializeResponse<TReceive>(response);
  }

  /// Runs a PUT operation via HttpClient to send and update information.
  Future<TerraRestfulResponse<TReceive>> putAsync<TSend, TReceive>(
      String endpoint, TSend data) async {
    var response = await clientService.postAsync(endpoint, data: data);
    if (response.statusCode != 200) {
      throw Exception(
          "Status Code: ${response.statusCode}, Reason: ${response.reasonPhrase}");
    }

    return await deserializeResponse<TReceive>(response);
  }

  /// <summary>
  /// Runs a DELETE operation via HttpClient to delete information.
  /// </summary>
  /// <param name="uri">Uri to make request to.</param>
  /// <returns>Returns result.</returns>
  Future<bool> deleteAsync(String uri) async {
    var response = await clientService.deleteAsync(uri);
    return response.statusCode == 200;
  }

  Future<TerraRestfulResponse<TResult>> deserializeResponse<TResult>(
      Response responseMessage) async {
    // try
    // {
    //     var message = jsonDecode( responseMessage.body);

    //     TResult result = JsonConvert.DeserializeObject<TResult>(message);
    //     return new TerraRestfulResponse<TResult>
    //     {
    //         Successful = true,
    //         Result = result,
    //     };
    // }
    // catch (JsonReaderException e)
    // {
    //     // If we are unable to deserialize, notify of failed attempt
    //     return new TerraRestfulResponse<TResult>
    //     {
    //         Successful = false,
    //         Message = e.Message,
    //     };
    // }
    throw Exception();
  }

  void forceDisconnectHttpClient() {
    clientService.forceDisconnectAllClients();
  }
}
