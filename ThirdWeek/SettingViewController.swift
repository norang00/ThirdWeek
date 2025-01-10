//
//  SettingViewController.swift
//  ThirdWeek
//
//  Created by Kyuhee hong on 1/10/25.
//

import UIKit

enum SettingOptions: Int, CaseIterable {
    case total
    case personal = 100
    case others

    var mainOption: String {
        switch self {
        case .total:
            return "전체설정"
        case .personal:
            return "개인설정"
        case .others:
            return "기타"
        }
    }
    
    var subOption: [String] {
        switch self {
        case .total:
            return ["공지사항", "실험실", "버전정보"]
        case .personal:
            return ["개인/보안", "알림", "채팅"]
        case .others:
            return ["고객센터/도움말"]
        }
    }
}

class SettingViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    let sectionList: [SettingOptions] = SettingOptions.allCases

    override func viewDidLoad() {
        super.viewDidLoad()

        print(SettingOptions.allCases[0].subOption[0])
    
        print(SettingOptions.total.rawValue)
        print(SettingOptions.personal.rawValue)
        print(SettingOptions.others.rawValue)

        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingOptions.allCases[section].mainOption
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingOptions.allCases[section].subOption.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell")!
        let row = SettingOptions.allCases[indexPath.section].subOption[indexPath.row]
        cell.textLabel?.text = row
        
        return cell
    }
    
    
}
