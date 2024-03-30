//
//  ViewController.swift
//  Project6b
//
//  Created by Omar Makran on 29/3/2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new instance of UILable Class.
        let label1 = UILabel()
        
        // controls wehtere autoresizing masks are translated into Auto Layout constrains.
        /*
         By setting translatesAutoresizingMaskIntoConstraints to false, you are telling the system not to automatically translate the view's autoresizingMask into constraints.
            This gives you more control over the layout by allowing you to define your own constraints or use Auto Layout without conflicts.
         */
        label1.translatesAutoresizingMaskIntoConstraints = false
        // set the backgraound color.
        label1.backgroundColor = .red
        // this text will be display inside the label.
        label1.text = "THESE"
        // resize the label to fit its content.
        label1.sizeToFit()
        
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.backgroundColor = .cyan
        label2.text = "ARE"
        label2.sizeToFit()
        
        let label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.backgroundColor = .yellow
        label3.text = "SOME"
        label3.sizeToFit()
        
        let label4 = UILabel()
        label4.translatesAutoresizingMaskIntoConstraints = false
        label4.backgroundColor = .green
        label4.text = "AWESOME"
        label4.sizeToFit()
        
        let label5 = UILabel()
        label5.translatesAutoresizingMaskIntoConstraints = false
        label5.backgroundColor = .orange
        label5.text = "LABLES"
        label5.sizeToFit()
        
        // label1 is add as a subview, wich is referenced by the variable view.
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        
        // dectionary of labels.
        let viewDictionary = ["label1": label1, "label2": label2, "label3": label3, "label4": label4, "label5": label5]
        
        for label in viewDictionary.keys {
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", options: [], metrics: nil, views: viewDictionary))
        }
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1]-[label2]-[label3]-[label4]-[label5]", options: [], metrics: nil, views: viewDictionary))
    }


}

