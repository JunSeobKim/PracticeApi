//
//  ProfileViewController.swift
//  PracticeApi
//
//  Created by 김준섭 on 2022/06/16.
//

import UIKit
import KakaoSDKUser

class ProfileViewController: UIViewController {

    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                self.userIdLabel.text = "\(user!.id!)"
                self.nicknameLabel.text = "\(user?.kakaoAccount?.profile?.nickname ?? "") 님"
                self.genderLabel.text = "\(user!.kakaoAccount!.gender!)"
                self.birthLabel.text = "\(user?.kakaoAccount?.birthday ?? "")"

                self.profileImage.load(url: (user?.kakaoAccount?.profile?.profileImageUrl)!)
                self.profileImage.layer.cornerRadius = 20
            }
        }
    }
}
