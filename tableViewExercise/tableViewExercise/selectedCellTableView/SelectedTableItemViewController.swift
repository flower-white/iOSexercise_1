//
//  SelectedTableItemViewController.swift
//  tableViewExercise
//
//  Created by White Flower on 22/12/23.
//

import UIKit

class SelectedTableItemViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var cammera: UIImageView!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var birthDay: UITextField!
    @IBOutlet weak var gender: UIPickerView!
    @IBOutlet weak var color: UIButton!
    @IBOutlet var colors: [UIButton]!
    
    let datePicker = UIDatePicker()
    let dataPicker = ["Select Gender", "Female", "Male"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name?.delegate = self
        phoneNumber?.delegate = self
        DatePicker()
        gender?.delegate = self
        gender?.dataSource = self
        picture?.load(urlString: "https://http2.mlstatic.com/vegeta-tamano-real-para-armar-en-papercraft-D_NQ_NP_892880-MLA26232224460_102017-F.jpg" )
    }
    
    func DatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBtnTap))
        toolbar.setItems([doneBtn], animated: true)
        birthDay?.inputAccessoryView = toolbar
        birthDay?.inputView = datePicker
        doneBtn.isHidden = false
        
        datePicker.datePickerMode = .date
    }
    
    @IBAction func selectColorAction(_ sender: Any) {
        showButtonVisibiliti()
    }
    
    @IBAction func colorButtonAction(_ sender:  UIButton) {
        showButtonVisibiliti()
        switch sender.currentTitleColor{
        case .systemYellow:
            color.backgroundColor = .systemYellow
        case .systemGreen:
            color.backgroundColor = .systemGreen
        case .systemPurple:
            color.backgroundColor = .systemPurple
        case .systemIndigo:
            color.backgroundColor = .systemIndigo
        case .systemCyan:
            color.backgroundColor = .systemCyan
        case .systemBrown:
            color.backgroundColor = .systemBrown
        case .systemRed:
            color.backgroundColor = .systemRed
        default:
            color.backgroundColor = .systemGray6
        }
        
    }
    
    func showButtonVisibiliti() {
        colors.forEach { button in
            UIView.animate(withDuration: 0.3) {
                if button.isHidden == true { button.isHidden = false}
                else { button.isHidden = true}
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func doneBtnTap() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        birthDay.text = formatter.string(from: datePicker.date)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = formatter(mask: "XX XXXX-XXXX", phoneNumber: newString)
        return false
    }
    
    func formatter(mask: String, phoneNumber: String) -> String {
        let number = phoneNumber.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var  result: String = ""
        var index = number.startIndex
        
        for character in mask where index < number.endIndex{
            if character == "X" {
                result.append(number[index])
                index = number.index(after: index)
            } else {
                result.append(character)
            }
        }
        return result
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataPicker[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataPicker.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
}




    

