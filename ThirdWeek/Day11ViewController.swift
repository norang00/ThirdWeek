//
//  Day11ViewController.swift
//  ThirdWeek
//
//  Created by Kyuhee hong on 1/8/25.
//

import UIKit
import MapKit

class Day11ViewController: UIViewController {

    @IBOutlet var userTextField1: UITextField!
    @IBOutlet var userTextField2: UITextField!

    var pickerView = UIPickerView()
    var mountainList = ["설악산", "지리산", "한라산", "도봉산", "수락산"]
    var regionList = ["속초", "제주", "광주", "서울"]

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
        setPickerView()
        setMapView()
    }

}

// MARK: - TextField 설정
extension Day11ViewController: UITextFieldDelegate {
    // 얘는 왜 데이터 소스 없지?? -> 데이터 소스 받아서 그릴만한 게 없으니까
    
    func setTextField() {
        userTextField1.delegate = self
        
        userTextField1.tintColor = .systemMint // 커서 색
        userTextField2.inputView = pickerView

    }
    
    // 키보드에서 엔터키 클릭했을 때 (did end on exit 이랑 조금 다르다)
    // * did end on exit 은 키보드 내리는 것도 포함....(안내려가던디 다시 확인 필요)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function, textField)

        // 특정 텍스트 필드에만 적용하고 싶다고 하면?
        //1. 이 안에서 조건 처리를 해줄 수 있다.
        //2. delegate 할당 자체를 해주지 않기.
        
        view.endEditing(true)
        return true
    }
    
}

// MARK: - PickerView 설정
extension Day11ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func setPickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? mountainList.count : regionList.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == 0 ? mountainList[row] : regionList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(component, row)
        if component == 0 {
            userTextField1.text = mountainList[row]
        } else {
            userTextField2.text = regionList[row]
        }
        
    }
    
}

// MARK: - MapView 설정
extension Day11ViewController: MKMapViewDelegate {
    // MapKit 을 사용할 때
    // 1. 중간 지점을 어디로 할지
    // 2. 축척을 어떻게 설정할지 (반경 몇미터까지 보여줄지)
    // 3. (옵션) 핀 설정 -> 핀은 어노테이션이라고 지칭 함!
    // 사용자가 움직이고 있는 시점, 지도 탐색을 멈춘 시점.
    
    func setMapView() {
        mapView.delegate = self
        
        configureMapView()
    }
    
    func configureMapView() {
        // 1. 중간 지점을 어디로 할지
        let center = CLLocationCoordinate2D(latitude: 37.65370, longitude: 127.04740)
        
        // 2. 축척을 어떻게 설정할지 (반경 몇미터까지 보여줄지)
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 100, longitudinalMeters: 100)
        // MKCoordinateRegion : MapKit 위도경도해수면 등등... 의 지역 정보
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = "창동역?"
        mapView.addAnnotation(annotation)
    }
    
    
    
}
