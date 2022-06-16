//
//  ViewController.swift
//  PracticeApi
//
//  Created by 김준섭 on 2022/06/14.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class ViewController: UIViewController {

    @IBAction func loginBtnDidTapped(_ sender: UIButton) {
        // 카카오톡 설치 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    // 에러처리
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") else { return }
                    self.navigationController?.pushViewController(homeVC, animated: true)
                    //do something
                    _ = oauthToken
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

