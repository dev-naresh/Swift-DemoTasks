//
//  FeedbackViewController.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 06/03/23.
//

import Cocoa

class FeedbackViewController: NSViewController {
    
    var feedbackView = FeedbackView()
    
    override func loadView() {
        view = feedbackView
        feedbackView.frame = NSRect(x: 300, y: 300, width: 550, height: 600)
        feedbackView.wantsLayer = true
        feedbackView.layer?.backgroundColor = .white
//        feedbackView.wantsLayer = true
//        feedbackView.layer?.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let form = feedbackView.feedbackForm
        
        feedbackView.scrollView.documentView = form
        
        form.translatesAutoresizingMaskIntoConstraints = false
//        feedbackView.textView1.delegate = feedbackView.textView1
        
        feedbackView.addSubview(feedbackView.scrollView)
        feedbackView.addSubview(feedbackView.btnView)
        
        feedbackView.btnView.addSubview(feedbackView.submitButton)
        feedbackView.btnView.addSubview(feedbackView.pinButton)
        feedbackView.btnView.addSubview(feedbackView.screenShotButton)
        
        form.addSubview(feedbackView.titleLabelField)
        form.addSubview(feedbackView.subTitleLabelField)
        form.addSubview(feedbackView.subView)
        
        feedbackView.subView.addSubview(feedbackView.textView1)
        
        NSLayoutConstraint.activate([
            feedbackView.scrollView.topAnchor.constraint(equalTo: feedbackView.topAnchor),
            feedbackView.scrollView.leadingAnchor.constraint(equalTo: feedbackView.leadingAnchor),
            feedbackView.scrollView.trailingAnchor.constraint(equalTo: feedbackView.trailingAnchor),
            feedbackView.scrollView.bottomAnchor.constraint(equalTo: feedbackView.bottomAnchor, constant: -50),
            
            feedbackView.subView.topAnchor.constraint(equalTo: feedbackView.subTitleLabelField.topAnchor, constant: 30),
            feedbackView.subView.leadingAnchor.constraint(equalTo: form.leadingAnchor, constant: 20),
            feedbackView.subView.trailingAnchor.constraint(equalTo: form.trailingAnchor, constant: -20),
            feedbackView.subView.bottomAnchor.constraint(equalTo: feedbackView.scrollView.bottomAnchor, constant: -10),
            feedbackView.subView.heightAnchor.constraint(greaterThanOrEqualToConstant: 400),
            
            form.topAnchor.constraint(equalTo: feedbackView.scrollView.topAnchor),
            form.bottomAnchor.constraint(equalTo: feedbackView.scrollView.bottomAnchor),
            form.leadingAnchor.constraint(equalTo: feedbackView.scrollView.leadingAnchor),
            form.trailingAnchor.constraint(equalTo: feedbackView.scrollView.trailingAnchor),
            
            feedbackView.titleLabelField.leadingAnchor.constraint(equalTo: form.leadingAnchor, constant: 20),
            feedbackView.titleLabelField.topAnchor.constraint(equalTo: form.topAnchor, constant: 20),
            feedbackView.subTitleLabelField.leadingAnchor.constraint(equalTo: form.leadingAnchor, constant: 20),
            feedbackView.subTitleLabelField.topAnchor.constraint(equalTo: feedbackView.titleLabelField.bottomAnchor, constant: 10),
            
//            feedbackView.textView1.centerXAnchor.constraint(equalTo: feedbackView.subView.centerXAnchor),
//            feedbackView.textView1.centerYAnchor.constraint(equalTo: feedbackView.subView.centerYAnchor, constant: feedbackView.textView1.bounds.height / 2)
            feedbackView.textView1.topAnchor.constraint(equalTo: feedbackView.subView.topAnchor),
            feedbackView.textView1.leadingAnchor.constraint(equalTo: feedbackView.subView.leadingAnchor),
            feedbackView.textView1.trailingAnchor.constraint(equalTo: feedbackView.subView.trailingAnchor),
//            feedbackView.textView1.widthAnchor.constraint(equalToConstant: 400)
//            feedbackView.textView1.heightAnchor.constraint(equalToConstant: feedbackView.textView1.hgt),
//            feedbackView.textView1.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
            
        ])
        
        
        
    }
    
}
