//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

//Task 1: Написать функцию, которая определяет, четное число или нет.
func evenFunc (a: Int) {
    if  a % 2 == 0 {
        print("Number \(a) is an even number")
    }else {
        print("Number \(a) is an odd number")
    }
}
evenFunc(a: 24)
evenFunc(a: 45)


//Task 2: Написать функцию, которая определяет, делится ли число без остатка на 3.
func reminderFunc (b: Int) {
    if  b % 3 == 0 {
        print("Number \(b) can be divided by 3 without a reminder")
    }else {
        print("Number \(b) can not be divided by 3 without a reminder")
    }
}
reminderFunc(b: 24)
reminderFunc(b: 11)
reminderFunc(b: 332)


// Task 3: Создать возрастающий массив из 100 чисел.
var myArray = Array(1...100)
print(myArray)
myArray.count
print("There are \(myArray.count) numbers in the array")

//Task 4:Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
// variant 1
func deleteFromArrayOne (arr: [Int]) -> [Int] {
    var anotherNewArray = arr
    anotherNewArray.removeAll {value -> Bool in (value % 3) != 0  || (value % 2) == 0
    }
    return anotherNewArray
}
var anotherNew = deleteFromArrayOne(arr: myArray);
print(anotherNew)
print("После очистки в массиве осталось \(anotherNew.count) элементов")

// variant 2
func deleteFromArraySecond (arr: [Int]) -> [Int]{
    let cleanArr = myArray.filter{$0 % 2 != 0 && $0 % 3 == 0}
    return cleanArr
}
var arrClean = deleteFromArraySecond(arr: myArray)
print("Функция, по очистке массива вторым способом вернула такой же массив: \(deleteFromArraySecond(arr: myArray)) из \(arrClean.count) чисел")

//* Task 5: Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
func fibonacci(a: [Int]) -> [Int] {
    var arrFib = a
    var num1 = 0
    var num2 = 1
    arrFib.append(num1)
    arrFib.append(num2)
    for _ in 0..<48 {
        
        let numFib = num1 + num2
        arrFib.append(numFib)
        num1 = num2
        num2 = numFib
    }
    return arrFib
}
var arrFib = fibonacci(a: arrClean)
print("Отсортированный массив с числами Фибоначи \(arrFib.sorted())содержит \(arrFib.count) элементов")

