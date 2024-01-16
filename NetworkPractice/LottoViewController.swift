//
//  ViewController.swift
//  NetworkPractice
//
//  Created by 조유진 on 1/16/24.
//

import UIKit

class LottoViewController: UIViewController {
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var numberPickerView: UIPickerView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var no1Label: UILabel!
    @IBOutlet weak var no2Label: UILabel!
    @IBOutlet weak var no3Label: UILabel!
    @IBOutlet weak var no4Label: UILabel!
    @IBOutlet weak var no5Label: UILabel!
    @IBOutlet weak var no6Label: UILabel!
    @IBOutlet weak var bonusNoLabel: UILabel!
    
    lazy var drwtNos: [UILabel] = [no1Label, no2Label, no3Label, no4Label, no5Label, no6Label, bonusNoLabel]
    var colors: [UIColor] = [.systemIndigo, .systemIndigo, .orange, .orange, .gray, .gray, .systemIndigo]
    
    let manager = LottoAPIManager()
    
    let numbers = Array(1...1102)   // 1 ~ 1102 배열
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel.design(font: .boldSystemFont(ofSize: 20), textAlignment: .center)
        numberPickerView.isHidden = true
        numberPickerView.delegate = self
        numberPickerView.dataSource = self
        designLabels()
        
        // 처음 실행 시 1102회차 로또 정보 조회
        manager.callRequest(number: "1102") { value in
            self.dateLabel.text = self.formatString(value.drwNoDate)
            self.drwtNos[0].text = String(value.drwtNo1)
            self.drwtNos[1].text = String(value.drwtNo2)
            self.drwtNos[2].text = String(value.drwtNo3)
            self.drwtNos[3].text = String(value.drwtNo4)
            self.drwtNos[4].text = String(value.drwtNo5)
            self.drwtNos[5].text = String(value.drwtNo6)
            self.drwtNos[6].text = String(value.bnusNo)
        }
    }
    
    func designLabels() {
        for index in 0...drwtNos.count - 1 {
            drwtNos[index].design(textColor: .white, font: .boldSystemFont(ofSize: 18), textAlignment: .center)
            drwtNos[index].backgroundColor = colors[index]
            drwtNos[index].clipsToBounds = true
            drwtNos[index].layer.cornerRadius = drwtNos[index].frame.height/2
        }
    }

    // 뷰를 클릭했을 때 키보드 내리기
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // 텍스트필드를 클릭했을 때
    @IBAction func textFieldClicked(_ sender: UITextField) {
        numberPickerView.isHidden = false
    }
    
    func formatString(_ text: String) -> String {
        return text.replacingOccurrences(of: "-", with: ".")
    }
    
}

// PickerView 설정
extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    // 몇개의 요소를 보여줄지
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // 몇개를 보여줄지
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        numbers.count
    }
    
    // 타이틀로 보여줄 요소
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(numbers[row])
    }
    
    // 선택됐을 때
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 네트워킹을 통해 로또 정보 불러오기
        manager.callRequest(number: String(numbers[row])) { value in
            self.dateLabel.text = self.formatString(value.drwNoDate)
            self.drwtNos[0].text = String(value.drwtNo1)
            self.drwtNos[1].text = String(value.drwtNo2)
            self.drwtNos[2].text = String(value.drwtNo3)
            self.drwtNos[3].text = String(value.drwtNo4)
            self.drwtNos[4].text = String(value.drwtNo5)
            self.drwtNos[5].text = String(value.drwtNo6)
            self.drwtNos[6].text = String(value.bnusNo)
        }
    }
}
