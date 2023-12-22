//
//  ViewController.swift
//  tableViewExercise
//
//  Created by White Flower on 21/12/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var checkedRow = [NSIndexPath]()
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var button: UIButton!
    
    struct Row {
        let name: String
    }
    
    let data: [Row] = [
        Row(name: "Camera"),
        Row(name: "Picture"),
        Row(name: "Full name"),
        Row(name: "Phone number"),
        Row(name: "Birth Day"),
        Row(name: "Gender"),
        Row(name: "Color")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        table.allowsMultipleSelection = true
        
        self.button.addTarget(self, action: #selector(didTapButton), for: enableButton())
    }
    
    @objc func didTapButton() {
        let selectedTableItemViewController = SelectedTableItemViewController()
        selectedTableItemViewController.modalPresentationStyle = .fullScreen
        
            self.present(selectedTableItemViewController, animated: true, completion: nil)
        
        print("tap")
    }
    

    
    func enableButton() -> UIControl.Event {
//        Code to validate is selected at least one row
        return .touchUpInside
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let labeltext = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        cell.label.text = labeltext.name
        
        let isRowchecked = checkedRow.contains(indexPath as NSIndexPath)
        if (isRowchecked == true){
            cell.button.isChecked = true
            cell.button.ButtonClicked(sender: cell.button)
        } else {
            cell.button.isChecked = false
            cell.button.ButtonClicked(sender: cell.button)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath as IndexPath) as! CustomTableViewCell
        
        if (checkedRow.contains(indexPath as NSIndexPath) == false) {
            cell.button.isChecked = true
            cell.button.ButtonClicked(sender: cell.button)
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath as IndexPath) as! CustomTableViewCell
        
        cell.button.ButtonClicked(sender: cell.button)
        if let checkedItemIndex = checkedRow.firstIndex(of: indexPath as NSIndexPath) {
            checkedRow.remove(at: checkedItemIndex)
        }
    }
    
    


}

