//
//  ViewController.swift
//  alpaca
//
//  Created by onexip / Matthias Hänel on 25.03.23.
//

import UIKit

class ViewController: UIViewController, AlpacaDelegate {

    @IBOutlet weak var question: UITextField!
    @IBOutlet weak var answer: UITextView!
    
    private let nativeBridge: AlpacaBridge = AlpacaBridge()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nativeBridge.delegate = self
        if let fileURL = Bundle.main.url(forResource: "ggml-alpaca-7b-q4", withExtension: "bin") {
            DispatchQueue.global(qos: .default).async { [weak self] in
                self?.nativeBridge.setModelPath(fileURL.path)
            }
        }
    }

    @IBAction func submitQuestion(_ sender: Any) {
        let questionText = self.question.text
        DispatchQueue.global(qos: .default).async { [weak self] in
            self?.nativeBridge.submitQuestion("\"\(questionText)\"")
        }
    }
    
    @objc func alpacaResponse(_ response: String) {
        DispatchQueue.main.async {
            self.answer.text.append(response)
        }
    }
}

