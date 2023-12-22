//
//  CustomTableViewCell.swift
//  tableViewExercise
//
//  Created by White Flower on 22/12/23.
//

import UIKit
import Foundation

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: CheckBoxButton!
    
    private func setpUI() {
        NSLayoutConstraint.activate([
//            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            button.centerYAnchor.constraint(equalTo: self.view?.centerYAnchor ?? <#default value#>)
//            button.widthAnchor.constraint(equalTo: 20),
//            button.heightAnchor.constraint(equalTo: 20),
        ])
    }
    
    
}

class CheckBoxButton:  UIButton {
    let checkedImage = UIImage(named: "checkedbox")
    let uncheckedImage = UIImage(named: "uncheckedbox")


    var isChecked: Bool = false{
        didSet{
            if isChecked == true {
                self.setImage(uncheckedImage, for: .normal)
            } else {
                self.setImage(checkedImage, for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.isUserInteractionEnabled = true
        self.addTarget(self, action: #selector(CheckBoxButton.ButtonClicked), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
    
    @objc func ButtonClicked(sender: UIButton) {
        if sender == self {
            if isChecked == true {
                isChecked = false
            } else {
                isChecked = true
            }
        }
    }
}



class ButtonView:  UIButton {
    
    
    @IBOutlet weak var buttonNext: NextViewButton!
    

    
    
}

class NextViewButton:  UIButton {
    
    let nameButton = "Next View"
}
