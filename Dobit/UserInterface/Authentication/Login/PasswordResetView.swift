//
//  PasswordResetView.swift
//  Dobit
//
//  Created by 박현우 on 2022/07/10.
//

import UIKit

class PasswordResetView: UIViewController, BaseViewControllerProtocol, Storyboardable {
    static var storyboardName: String = "PasswordResetView"
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordCheckTextField: UITextField!
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        setupLayout()
        
        previousButton.addTarget(self, action: #selector(previousButtonDidTap), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc
    private func previousButtonDidTap() {
        // MARK: 이전 화면으로 이동한다.
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func nextButtonDidTap() {
        // MARK: 로그인 화면으로 이동한다.
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginView") as! LoginView
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Helpers
    private func setupAttribute() {
        view.backgroundColor = dobitBackgroundColor
    }
    
    private func setupLayout() {
        [passwordTextField, passwordCheckTextField].forEach {
            $0?.addBottomBorder()
        }
    }
}
