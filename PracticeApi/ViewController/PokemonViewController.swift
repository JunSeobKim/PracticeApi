//
//  PokemonViewController.swift
//  PracticeApi
//
//  Created by 김준섭 on 2022/06/17.
//

import UIKit

class PokemonViewController: UIViewController {
    let pokemonNetWork = PokemonRequest()

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonNum: UILabel!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonHeight: UILabel!
    @IBOutlet weak var pokemonWeight: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokemonExp: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
    }
    
}

extension PokemonViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        print(searchText)
        pokemonNetWork.getPokemonData(name: searchText) { response in
            self.pokemonImage.load(url: (URL(string: (response?.sprites.frontDefault)!)!))
            self.pokemonImage.layer.cornerRadius = 20
            self.pokemonNum.text = "NO.\(response!.id)"
            self.pokemonName.text = response?.name
            self.pokemonHeight.text = "키: \(response!.height)"
            self.pokemonWeight.text = "몸무게: \(response!.weight)"
            self.pokemonType.text = "타입: \(response!.types[0].type.name)"
            self.pokemonExp.text = "경험치: \(response!.baseExperience)"
        }
        self.view.endEditing(true)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("cancel")
    }
    
    // 빈 곳 터치하여 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){      self.view.endEditing(true)}
}
