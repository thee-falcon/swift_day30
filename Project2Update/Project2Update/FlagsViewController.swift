//
//  FlagsViewController.swift
//  Project2Update
//
//  Created by Omar Makran on 10/3/2024.
//

import UIKit

class FlagsViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    // to store the countries.
    var countries = [String]()
    // the score of the game.
    var score = 0
    // corect answer
    var correctAnswer = 0
    // count questions:
    var countAnswers = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "morocco", "nigeria", "poland", "russia", "spain", "uk", "us"]

        button1.layer.borderWidth = 0.1
        button2.layer.borderWidth = 0.1
        button3.layer.borderWidth = 0.1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func    askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        countAnswers += 1

        if countAnswers == 11 {
            showFinalCount()
        }
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased() + "   | Your Score: \(score)"
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
        }
       
        let ac = UIAlertController(title: title, message: "The Correct Answer is: \(countries[correctAnswer].uppercased())", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }

    func showFinalCount() {
        let alertContr = UIAlertController(title: "Quiz Completed", message: "Your Final Score is: \(score) out of 10", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            // Use popToRootViewController to go back to the home screen
            self?.navigationController?.popToRootViewController(animated: true)
        }
        
        alertContr.addAction(okAction)
        present(alertContr, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
