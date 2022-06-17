//
//  CoinRequest.swift
//  PracticeApi
//
//  Created by 김준섭 on 2022/06/17.
//

import UIKit
import Alamofire

class PokemonRequest {
    
    func getPokemonData(name: String, completion: @escaping (PokemonResponse?) -> Void) {
        
        let url = "https://pokeapi.co/api/v2/pokemon/\(name)"
        
        // HTTP Method: GET
        AF.request(url,
                   method: .get,
                   headers: nil)
            .responseDecodable(of: PokemonResponse.self) { response in
                
                switch response.result {
                
                case .success(let response):
                    completion(response)
                    
                    
                case .failure(let error):
                    print("DEBUG>> Pokemon Get Error : \(error.localizedDescription)")
                    
                }
            }
    }
}
