//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

var bigArray = [[1, 2, 3, 4, 5, 6, 7],
                [8, 9, 10, 11, 12, 13, 14],
                [15, 16, 17, 18, 19, 20, 21],
                [22, 23, 24, 25, 26, 27, 28],
                [29, 30, 31, 32, 33, 34, 35],
                [36, 37, 38, 39, 40, 41, 42],
                [43, 44, 45, 46, 47, 48, 49]]
type(of: bigArray)
var first = bigArray[0][0]
bigArray[1][1]
bigArray[2][2]

func diagonal(arr: [[Int]]) -> Int {
    var diagonal = 0
    for i in 0..<arr.count {
        diagonal += arr[i][i]
    }
    print(diagonal)
    return diagonal
}
diagonal(arr: bigArray)
var myArr = Array(repeating: [1, 2, 3], count: 3)
diagonal(arr: myArr)


// дан массив из 30 целых положительных чисел, для всех чисел которые ровно делятся на 3 нужно напечатать Привет, на 5 - Андрей, на 15 - Привет Андрей
var arrNew = [3, 5, 15, 45, 6, -99, 70, 32, 64, -30, 44, 65, 89, 76, -75, 60, 43, 98, 77, 96, 58, 59, -4, 8, 10, 12, -17, 85, 37, 51]
arrNew.count
func division (a: [Int]) {
    for i in a {
        if i % 15 == 0 && i % 5 == 0 && i % 3 == 0 {
            print("Hello, Andrey")
            print("Andrey")
            print("Hello")
            
        } else if i % 5 == 0 {
            print("Andrey")
        } else if i % 3 == 0 {
            print("Hello")
        }
    }
}
division (a: arrNew)

//дан одномерный массив Int из 15 элементов. Написать фукцию которая принимает как входной параметр массив и число Х, функция должна вернуть количество элементов массива равных числу Х
var taskFirst = [3, 5, 15, 45, 6, -99, 32, 64, -30, 44, 65, 76, -75, 60, 43]
taskFirst.count
func amount (a: [Int], b: Int) -> [Int] {
    var arrReturn = [Int]()
    arrReturn = a.suffix(b)
    return arrReturn
}
amount (a: taskFirst, b:7)
print(amount(a: taskFirst, b: 7))

func anotherAmount (a: [Int], b: Int) -> [Int] {
    var arrReturn = [Int]()
    var d = arrReturn.count
    for i in a {
        if d <= b {
            arrReturn.append(i)
            d += 1
        }
    }
    return arrReturn
}
print(anotherAmount(a: taskFirst, b: 14))
print(anotherAmount(a: taskFirst, b: 7))
