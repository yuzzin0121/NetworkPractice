//
//  TranslateViewController.swift
//  NetworkPractice
//
//  Created by 조유진 on 1/17/24.
//

import UIKit
import Alamofire

class TranslateViewController: UIViewController {
    @IBOutlet weak var sourceLangButton: UIButton!
    @IBOutlet weak var targetLangButton: UIButton!
    @IBOutlet weak var contraryButton: UIButton!
    @IBOutlet weak var sourceTextView: UITextView!
    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var translatedLabel: UILabel!
    @IBOutlet weak var translateButton: UIButton!
    
    let languages = Language.LanguageList

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        designImageView(arrowImageView)
        designButton(contraryButton, image: UIImage(systemName: "arrow.left.arrow.right"))
        designButton(translateButton, image: nil, backgroundColor: .systemIndigo, titleColor: .white, cornerRadius: 12)
        
        sourceLangButton.setTitle(languages["ko"], for: .normal)
        targetLangButton.setTitle(languages["en"], for: .normal)
        
        sourceLangButton.addTarget(self, action: #selector(pushSourceLangeVC), for: .touchUpInside)
        targetLangButton.addTarget(self, action: #selector(pushTargetLangeVC), for: .touchUpInside)
        
        contraryButton.addTarget(self, action: #selector(contraryButtonClicked), for: .touchUpInside)
        translateButton.addTarget(self, action: #selector(callRequest), for: .touchUpInside)
    }
    
    @objc func pushSourceLangeVC() {
        let langVC = storyboard?.instantiateViewController(withIdentifier: LanguageViewController.identifier) as! LanguageViewController
        
        langVC.selectedLang = sourceLangButton.currentTitle!
        
        navigationController?.pushViewController(langVC, animated: true)
    }
    @objc func pushTargetLangeVC() {
        let langVC = storyboard?.instantiateViewController(withIdentifier: LanguageViewController.identifier) as! LanguageViewController
        
        langVC.selectedLang = targetLangButton.currentTitle!
        
        navigationController?.pushViewController(langVC, animated: true)
    }
    
    // Request
    @objc func callRequest() {
        let url = "https://openapi.naver.com/v1/papago/n2mt"
        
        guard let sourceLang = getLang(string: sourceLangButton.currentTitle!) else { return }
        guard let targetLang = getLang(string: targetLangButton.currentTitle!) else { return }
        let parameters: Parameters = [
            "text": sourceTextView.text!,
            "source": sourceLang,
            "target": targetLang
        ]
        
        // 인증key는 소중하게 보관해야 된다.
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": APIKey.clientID,
            "X-Naver-Client-Secret": APIKey.clientSecret
        ]
        
        // body값에 들어가는 부분을 parameters에 작성한다.
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   headers: headers)
        .responseDecodable(of: Papago.self) { response in
            switch response.result {
            case .success(let success):
                print(success)
                self.translatedLabel.text = success.message.result.translatedText
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func getLang(string: String) -> String? {
        for (key, value) in languages {
            if value == string {
                return key
            }
        }
        return nil
    }
    
    @objc func contraryButtonClicked() {
        reverseLang()
    }
    
    // 언어 바꾸기
    func reverseLang() {
        var temp = ""
        temp = sourceLangButton.currentTitle!
        sourceLangButton.setTitle(targetLangButton.currentTitle, for: .normal)
        targetLangButton.setTitle(temp, for: .normal)
    }
    
    
    func configureView() {
        navigationItem.title = "번역"
        sourceLangButton.tintColor = .black
        targetLangButton.tintColor = .black
        sourceTextView.text = ""
        sourceTextView.backgroundColor = .systemGray6
        sourceTextView.layer.cornerRadius = 12
        translatedLabel.text = ""
        translatedLabel.backgroundColor = .systemGray6
        translatedLabel.layer.cornerRadius = 12
        translateButton.setTitle("번역하기", for: .normal)
    }
    
    func designImageView(_ imageView: UIImageView) {
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .darkGray
    }
    
    func designButton(_ button: UIButton, image: UIImage?, backgroundColor: UIColor = .white, titleColor: UIColor = .black, cornerRadius: CGFloat=0) {
        button.backgroundColor = backgroundColor
        button.setTitleColor(titleColor, for: .normal)
        
        button.clipsToBounds = true
        button.layer.cornerRadius = cornerRadius
        
        button.setImage(image, for: .normal)
        button.tintColor = .black
    }
}
