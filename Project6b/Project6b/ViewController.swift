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
        // set the backgraound color of the label.
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
        
//        // dectionary of labels.
//        let viewDictionary = ["label1": label1, "label2": label2, "label3": label3, "label4": label4, "label5": label5]
//        
//        for label in viewDictionary.keys {
//            /*
//             NSLayoutConstraint.constraints: A Class Method of NSLayoutConstraint, used to creat an array of constraints based on a visual format.
//             "H:":                           Specifies that the constraints being defined are horizontal.
//             "|":                            Represents the leading (left) and trailing (right) edges of the superview.
//             [\(label)]:                     Substitutes the label identifier from the visual format dictionary (viewDictionary) into the format string.
//             options: []                     An empty set of options, meaning no special options are set for these constraints.
//             */
//            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", options: [], metrics: nil, views: viewDictionary))
//        }
//        
//        // (==88): set a specific height constraint for each of the labels, but we can do it in another way, using "metrics".
//        // "-" a default spacing.
//        // -(>=10)-|: Represents a minimum spacing of 10 points to the bottom edge of the superview.
//
//        /*
//         The @999 attached to the label1 height constraint indicates its priority level. In Auto Layout, constraints can have priority values ranging from 1 to 1000, where a higher value indicates a stronger priority. The default priority for constraints is 1000.
//         
//         In this context, a priority of 999 means that this constraint is very important but not required. If there were conflicting constraints, those with a higher priority value would be satisfied first.
//         
//         the height constraint of label1 with a priority of 999 suggests that while it's crucial to maintain this constraint, it can be broken if necessary to satisfy other higher-priority constraints.
//         */
//        
//        // let's use the "metrics" to avoid the hard coding => (==88).
//        let metrics = ["lableHeight": 88]
//
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(lableHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]-(>=10)-|", options: [], metrics: metrics, views: viewDictionary))
        
        // ########################### Using Auto Layout Anchors ##########################
        // ################################################################################
        
        //  to keep track of the previously processed label in the loop.
        var previews: UILabel?
        
        for label in [label1, label2, label3, label4, label5] {
            // sets up a constraint that makes the width of the current label (label) equal to the width of the view.
            label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            // sets up a constraint that sets the height of the current label (label) to a constant value of 88 points.
            label.heightAnchor.constraint(equalToConstant: 88).isActive = true
            
            if let previews = previews {
                // sets up a constraint that pins the top of the current label (label) to the bottom of the previews label, with a constant spacing of 10 points between them.
                label.topAnchor.constraint(equalTo: previews.bottomAnchor, constant: 10).isActive = true
            } else {
                // sets up a constraint that pins the top of the current label (label) to the top of the view's Safe Area.
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 0).isActive = true
            }
            // is updated to store the current label, so it can be used as the previews label in the next iteration of the loop.§
            previews = label
        }
    }


}

