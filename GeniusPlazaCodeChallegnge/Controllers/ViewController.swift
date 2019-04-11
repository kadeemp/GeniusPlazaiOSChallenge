//
//  ViewController.swift
//  GeniusPlazaCodeChallegnge
//
//  Created by Kadeem Palacios on 4/11/19.
//  Copyright © 2019 Kadeem Palacios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var itunesTableView:UITableView!
    var itunesInfo:[itunesData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()

    }

    func setupTableView() {
        itunesTableView = UITableView()
        itunesTableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - 40, height: self.view.frame.height)
        itunesTableView.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
        itunesTableView.delegate = self
        itunesTableView.dataSource = self
        itunesTableView.register(itunesTableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(itunesTableView)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itunesTableView.dequeueReusableCell(withIdentifier: "Cell") as! itunesTableViewCell
        cell.textLabel?.text = "Test"

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 
    }





}

