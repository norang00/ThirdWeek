//
//  Day10ViewController.swift
//  ThirdWeek
//
//  Created by Kyuhee hong on 1/7/25.
//

import UIKit

// 왜 여기서는 TableView 관련 메서드가 나오지 않을까?
// 테이블뷰를 만들 때 필요한 것들이 있다. 수동으로 설정 해주어야 함!

/*
 1. 테이블뷰 이름!
 2. 테이블뷰 부하직원! (프로토콜)
 3. 필수기능 추가
 4. 테이블뷰와 프로토콜을 연결 (= 타입으로서의 프로토콜, Protocol as Type)
 */
class Day10ViewController: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: TestTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TestTableViewCell.identifier)
        tableView.rowHeight = 44
        // 테이블뷰와 관련 프로토콜을 연결!
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension Day10ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // TVC 와 달리 별도 override 없음
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return 10
    }
    
    // TVC 와 달리 별도 override 없음
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        let cell = tableView.dequeueReusableCell(withIdentifier: TestTableViewCell.identifier, for: indexPath) as! TestTableViewCell
        
        cell.backgroundColor = .lightGray
        
        return cell
    }

}
