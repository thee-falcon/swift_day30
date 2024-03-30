//
//  ViewController.swift
//  Project2Update
//
//  Created by Omar Makran on 9/3/2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var start_button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleStartButton()
        
    }
    
    func    styleStartButton() {
        start_button.layer.cornerRadius = 10.0
        start_button.layer.borderWidth = 1.0
        start_button.layer.borderColor = UIColor.white.cgColor
        start_button.layer.shadowColor = UIColor.black.cgColor
        start_button.layer.shadowOffset = CGSize(width: 0, height: 20)
        start_button.layer.shadowOpacity = 3
        start_button.layer.shadowRadius = 4
        start_button.clipsToBounds = true
        start_button.layer.masksToBounds =  false
        start_button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
    }
    
    @IBAction func buttonStart(_ sender: UIButton) {
        if let ac = storyboard?.instantiateViewController(withIdentifier: "Flag") as? FlagsViewController {
            ac.navigationItem.leftBarButtonItem = nil
            navigationController?.pushViewController(ac, animated: true)
        }
    }
    
}

