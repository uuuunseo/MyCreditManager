//
//  main.swift
//  MyCreditManager
//
//  Created by 정윤서 on 2023/05/01.
//

import Foundation

let menuErrorMessage = "뭔가 입력이 잘못되었습니다. 1~5사이의 숫자 혹은 X를 입력해주세요."
let inputErrorMessage = "입력이 잘못되었습니다. 다시 확인해주세요."

var name: [String] = []
var subjectGrade: [String:String] = [:]
var loop = true
    
while loop {
    print("원하는 기능을 입력해주세요 \n 1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
        
    let input = readLine() ?? ""
        
    switch input {
    case "1":
        addStudent()
        break
    case "2":
        removeStudent()
        break
    case "3":
        addScore()
        break
    case "4":
        removeScore()
        break
    case "5":
        showAvg()
        break
    case "X", "x":
        print("프로그램을 종료합니다...")
        loop = false
    default:
        print(menuErrorMessage)
    }
}


func addStudent(){
    print("추가할 학생의 이름을 입력해주세요")
    let addName = readLine() ?? ""
    
    if addName.isEmpty {
        print(inputErrorMessage)
    }
    else if name.contains(addName) {
        print("\(addName) 학생을 추가했습니다.")
        name.append(addName)
    }
    else {
        print("\(addName)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
    }
}


func removeStudent(){
    print("삭제할 학생의 이름을 입력해주세요")
    let removeName = readLine() ?? ""
    
    if removeName.isEmpty {
        print(inputErrorMessage)
    }
    else if name.contains(removeName) {
        print("\(removeName) 학생을 삭제하였습니다.")
        if let index = name.firstIndex(of: removeName) {
            name.remove(at: index)
        }
    }
    else {
        print("\(removeName) 학생을 찾지 못했습니다.")
    }
}

func addScore() {
    print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    print("입력예) Mickey swfit A+")
    print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다")
    
    let addGrade = readLine()!.split(separator: " ")
    
    if addGrade.isEmpty {
        print(inputErrorMessage)
    }
    else{
        let userName = addGrade[0]
        let userSubject = addGrade[1]
        let userGrade = addGrade[2]
        
        if (name.contains(String(userName)) == true){
            subjectGrade.updateValue(String(userGrade), forKey: userName + " " + userSubject)
            print(subjectGrade)
        } else if (name.contains(String(userName)) == false){
            print(inputErrorMessage)
        }
    }
}

func removeScore() {}
func showAvg() {}


