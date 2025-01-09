//
//  tips.swift
//  ThirdWeek
//
//  Created by Kyuhee hong on 1/9/25.
//

import Foundation


class test {
    
    struct User {
        var name: String = ""
    }
    
    let userArray1: [User] = [
        User(name: "a"),
        User(name: "b"),
        User(name: "c")
    ]

    let userArray2: [User] = [
        .init(name: "a"),
        .init(name: "b"),
        .init(name: "c")
    ]
    // .init -> 인스턴스를 초기화 해주는 것, 초기화 하는 방법엔 여러가지 있는데 얘가 제일 오래걸림
    // 요즘은 디바이스가 좋아서 사실 티도 안남. 그래도 알아두자

}


struct User {
    let name: String = "고래밥"
    static var nickname: String = "칙촉"
    
    func test1() {}
    func test2() {}
}
