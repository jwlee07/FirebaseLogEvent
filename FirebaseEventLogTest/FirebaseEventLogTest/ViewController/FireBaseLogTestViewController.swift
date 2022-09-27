//
//  FireBaseLogTestFireBaseLogTestViewController.swift
//  FirebaseEventLogTest
//
//  Created by 이진욱 on 2022/09/27.
//

import UIKit
import FirebaseAnalytics
import SnapKit

class FireBaseLogTestViewController: BaseViewController {
    
    // MARK: - Properties
    let firstTestButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("테스트1", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 15
        btn.tag = 1
        return btn
    }()
    
    let secondTestButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("테스트2", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = .systemRed
        btn.layer.cornerRadius = 15
        btn.tag = 2
        return btn
    }()
}
// MARK: - View LifeCycle
extension FireBaseLogTestViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAddTarget()
        setAnalytics()
    }
}
// MARK: - Set Analytics
extension FireBaseLogTestViewController {
    private func setAnalytics() {
        Log.debug(message: "\(#function)")
        Analytics.setUserID("userID = kkuummingFirebaseTest")
        Analytics.setUserProperty("ko", forName: "country")
        Analytics.logEvent(AnalyticsEventSelectItem, parameters: nil) // select_item으로 분류
    }
}
// MARK: - Selector
extension FireBaseLogTestViewController {
    @objc func didTapButton(_ sender: UIButton) {
        Log.debug(message: "\(#function) 테스트 버튼 \(sender.tag)번 클릭 했습니다.")
        
        let event = "testButton"
        let parameters = [
            "function": #function,
            "buttonTag": "\(sender.tag)"
        ]
        
        Analytics.logEvent(event, parameters: parameters)
        Analytics.logEvent(event, parameters: parameters)
        
    }
    
    private func setAddTarget() {
        [firstTestButton, secondTestButton].forEach {
            $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        }
    }
}
// MARK: - UI
extension FireBaseLogTestViewController {
    private func setUI() {
        view.addSubview(firstTestButton)
        view.addSubview(secondTestButton)
        
        firstTestButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        
        secondTestButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-30)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(100)
        }
    }
}
