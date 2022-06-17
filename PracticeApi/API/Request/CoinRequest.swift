//
//  CoinRequest.swift
//  PracticeApi
//
//  Created by 김준섭 on 2022/06/17.
//

import UIKit
import Alamofire

class CoinRequest {
    
    func getCoinData(completion: @escaping (CoinResponse?) -> Void) {
        
        let url = "https://api.coinranking.com/v2/coins?x-access-token=coinrankingfcaa97a54d92f843ab7bdbb61960295ac43c8202caff9250"
        
        // HTTP Method: GET
        AF.request(url,
                   method: .get,
                   headers: nil)
            .responseDecodable(of: CoinResponse.self) { response in
                
                switch response.result {
                
                case .success(let response):
//                    print("DEBUG>> OpenWeather Response \(response.data.coins) ")
                    completion(response)
                    
                    
                case .failure(let error):
                    print("DEBUG>> OpenWeather Get Error : \(error.localizedDescription)")
                    
                }
            }
    }
}
