import Axios, { AxiosInstance } from 'axios';
import { OrderBy as OrderBy_pb } from '@terra-rebels/terra.proto/cosmos/tx/v1beta1/service';

typedef APIParams = Record<string, string | number | null | undefined>;

abstract class Pagination {
  String? next_key ;
  late double total;
}

 const OrderBy = OrderBy_pb;
 typedef OrderBy = OrderBy_pb;

export interface PaginationOptions {
  'pagination.limit': string;
  'pagination.offset': string;
  'pagination.key': string;
  'pagination.count_total': 'true' | 'false';
  'pagination.reverse': 'true' | 'false';
  order_by: keyof typeof OrderBy;
}

//  class APIRequester {
//    axios: AxiosInstance;
//   constructor(baseURL: string) {
//     this.axios = Axios.create({
//       baseURL,
//       headers: {
//         Accept: 'application/json',
//       },
//       timeout: 30000,
//     });
//   }

   Future getRaw<T>(
    endpoint: string,
    params: URLSearchParams | APIParams = {}
  )async {
    return this.axios.get(endpoint, { params }).then(d => d.data);
  }

   async get<T>(
    endpoint: string,
    params: URLSearchParams | APIParams = {}
  ): Promise<T> {
    return this.axios.get(endpoint, { params }).then(d => d.data);
  }

   async postRaw<T>(endpoint: string, data?: any): Promise<T> {
    return this.axios.post(endpoint, data).then(d => d.data);
  }

   async post<T>(endpoint: string, data?: any) async {
    return this.axios.post(endpoint, data).then(d => d.data);
  }

