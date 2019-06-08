//
//  ViewController.swift
//  BingeBot
//
//  Created by 大石耕司 on 2019/06/07.
//  Copyright © 2019 大石耕司. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showsLabel: UILabel!
    @IBOutlet weak var randomShowLabel: UILabel!
    @IBOutlet weak var bingebotSpokenLabel: UILabel!
    @IBOutlet weak var addShowTextField: UITextField!
    @IBOutlet weak var addShowButton: UIButton!
    @IBOutlet weak var randomShowStackView: UIStackView!
    @IBOutlet weak var addShowStackView: UIStackView!
    @IBOutlet weak var showsStackView: UIStackView!
    
    var shows: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showsStackView.isHidden = true
        randomShowStackView.isHidden = true
    }

    func updateShowsLabel() {
        showsLabel.text = shows.joined(separator: ", ")
    }
    @IBAction func randomBingeShowButtonWasPressed(_ sender: Any) {
        randomShowLabel.text = shows.randomElement()
        randomShowLabel.isHidden = false
        bingebotSpokenLabel.isHidden = false
    }
    @IBAction func addShowButtonWasPressed(_ sender: Any) {
        guard let showName = addShowTextField.text else { return }
        if showName.isEmpty { return }
        shows.append(showName)
        updateShowsLabel()
        addShowTextField.text = ""
        showsStackView.isHidden = false
        if shows.count > 1 {
            randomShowStackView.isHidden = false
            bingebotSpokenLabel.isHidden = true
            randomShowLabel.isHidden = true
        }
    }
    
}

