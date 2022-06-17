//
//  CoinRankingViewController.swift
//  PracticeApi
//
//  Created by 김준섭 on 2022/06/16.
//

import UIKit

class CoinRankingViewController: UIViewController {
    let coinNetwork = CoinRequest()
    var coinData: [CoinElement] = []
    @IBOutlet weak var coinTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinNetwork.getCoinData { response in
            print("성공------------------------")
            print(response!.data.coins)
            self.coinData = response!.data.coins
            self.setupCoinTableView()
            self.coinTableView.reloadData()
        }
    }
    
    private func setupCoinTableView() {
        self.coinTableView.delegate = self
        self.coinTableView.dataSource = self
        
        self.coinTableView.register(
            UINib(nibName: "CoinTableViewCell", bundle: nil),
            forCellReuseIdentifier: "coinCell"
        )
    }
}

// UITableView
extension CoinRankingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell
        = tableView.dequeueReusableCell(withIdentifier: "coinCell", for: indexPath) as! CoinTableViewCell
        cell.updateUI(cellData: coinData[indexPath.row])
        
        return cell
    }
    
}
