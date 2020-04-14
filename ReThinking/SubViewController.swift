//
//  SubViewController.swift
//  ReThinking
//
//  Created by Pires Cerullo on 12/03/20.
//  Copyright © 2020 Pires Cerullo. All rights reserved.
//

import UIKit

class SubViewController: UIViewController,UITextViewDelegate {
    
    //declare outlet
    @IBOutlet weak var Question: UILabel!
    @IBOutlet weak var CBtn: UIButton!
    @IBOutlet weak var SBtn: UIButton!
    @IBOutlet weak var txt: UITextView!
    var QNS = 0
    //declare var for placeholder
    var placeholderLabel : UILabel!
    //userdefault declare
    let answer = UserDefaults.standard
    //array of question
    var question:[String] = []
    //a total of 5 question in string var
    var ques1 = "What worries me most about the future?\n"
    var ques2 = "Who am I, really?\n\n\n"
    var ques3 = "If this the last day of my life, is my choice any different?"
    var ques4 = "What am I really scared of?\n\n"
    var ques5 = "Am I holding on to something I need to let go of?\n"
    
    //an attempt to use for loop ...
    func pushQues(){
            for i in 1...5{
                if(i==1){
                question.append(ques1)
                }
                if(i==2){
                question.append(ques2)
                }
                if(i==3){
                question.append(ques3)
                }
                if(i==4){
                question.append(ques4)
                }
                if(i==5){
                question.append(ques5)
                }
        }
    }

    //print question from array to lable
    func printQuestion(QNS: Int){
        pushQues()
        switch QNS {
        case 1:
            Question.text=question[0]
        case 2:
            Question.text=question[1]
        case 3:
            Question.text=question[2]
        case 4:
            Question.text=question[3]
        case 5:
            Question.text=question[4]
        default:
            break;
        }
    }
    //function to take from userdefault to textview
    func filltxt(QNS: Int) {
        switch QNS {
        case 1:
            textViewDidChange(txt)
            txt.text=answer.string(forKey: "answer1")
        case 2:
            textViewDidChange(txt)
            txt.text=answer.string(forKey: "answer2")
        case 3:
            textViewDidChange(txt)
            txt.text=answer.string(forKey: "answer3")
        case 4:
            textViewDidChange(txt)
            txt.text=answer.string(forKey: "answer4")
        case 5:
            textViewDidChange(txt)
            txt.text=answer.string(forKey: "answer5")
        default:
        txt.text=""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //placeholder maker
        txt.delegate = self
        placeholderLabel = UILabel()
        //dilakukan hanya bila textview kosong
        if(txt.text==""){
            placeholderLabel.text = "Enter some text..."
            placeholderLabel.font = UIFont.italicSystemFont(ofSize: (txt.font?.pointSize)!)
            placeholderLabel.sizeToFit()
            txt.addSubview(placeholderLabel)
            placeholderLabel.frame.origin = CGPoint(x: 5, y: (txt.font?.pointSize)! / 2)
            placeholderLabel.textColor = UIColor.lightGray
            placeholderLabel.isHidden = !txt.text.isEmpty
        }
        printQuestion(QNS: QNS)
        filltxt(QNS: QNS)
        textViewDidChange(txt)
    }

        //function yang diletakan tiap textview berganti
        func textViewDidChange(_ textView: UITextView) {
            placeholderLabel.isHidden = !textView.text.isEmpty
            print(textView)
        }
    
    @IBAction func submit(_ sender: Any) {
        dismiss(animated: true, completion: nil)
               //assign text from textview to userdefault "" jika nga ada apa apa di textview
                if(txt.text==""){
                    switch QNS {
                        case 1:
                        textViewDidChange(txt)
                            answer.set("", forKey: "answer1")
                        case 2:
                        textViewDidChange(txt)
                            answer.set("", forKey: "answer2")
                        case 3:
                        textViewDidChange(txt)
                            answer.set("", forKey: "answer3")
                        case 4:
                        textViewDidChange(txt)
                            answer.set("", forKey: "answer4")
                        case 5:
                        textViewDidChange(txt)
                            answer.set("", forKey: "answer5")
                        default:
                        txt.text=""
                    }
                }
                else{
                switch QNS {
                    case 1:
                        textViewDidChange(txt)
                        answer.set(txt.text, forKey: "answer1")
                    case 2:
                    textViewDidChange(txt)
                        answer.set(txt.text, forKey: "answer2")
                    case 3:
                    textViewDidChange(txt)
                        answer.set(txt.text, forKey: "answer3")
                    case 4:
                    textViewDidChange(txt)
                        answer.set(txt.text, forKey: "answer4")
                    case 5:
                    textViewDidChange(txt)
                        answer.set(txt.text, forKey: "answer5")
                    default:
                        txt.text=""
                    }
                }
                //reset Question Number for next choose
                QNS=0

    }
    
    @IBAction func clear(_ sender: Any) {
        txt.text=""
            switch QNS {
                case 1:
                textViewDidChange(txt)
                    answer.set("", forKey: "answer1")
                case 2:
                textViewDidChange(txt)
                    answer.set("", forKey: "answer2")
                case 3:
                textViewDidChange(txt)
                    answer.set("", forKey: "answer3")
                case 4:
                textViewDidChange(txt)
                    answer.set("", forKey: "answer4")
                case 5:
                textViewDidChange(txt)
                    answer.set("", forKey: "answer5")
                default:
                txt.text=""
            }
        textViewDidChange(txt)
    }
    //function to remove ke keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
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
