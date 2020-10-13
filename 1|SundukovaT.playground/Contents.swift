//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport



// Given: the quadratic equation a * x * x + b * x + c = 0
var a: Double = 2
var b: Double = 6
var c: Double = 4.5
var disckriminant: Double = (b * b - 4 * a * c)
var sqRoot: Double = 0
var x1: Double = 0
var x2: Double = 0
if disckriminant > 0 {
    sqRoot = sqrt(disckriminant)
    x1 = (-b + sqRoot) / 2 * a
    x2 = (-b - sqRoot) / 2 * a
    print ("The solutions to the quadratic equation are: x1 = \(x1), x2 = \(x2).")
} else if disckriminant == 0 {
    x1 = (-b + sqRoot) / 2 * a
    print("There is only one solution to the quadratic equation, x = \(x1).")
} else {
print("There is no solutions to this quadratic equation.")
}

// Given: length of the cathetus in a right-angled triangle
var cathetusA: Double = 3
var cathetusB: Double = 4
let hypotLength = sqrt(cathetusA * cathetusA + cathetusB * cathetusB)
print("The length of the hypotenuse = \(hypotLength)")
let perimeter: Double = cathetusA + cathetusB + hypotLength
print("The perimeter = \(perimeter)")
let area: Double = a * b / 2
print("The area = \(area)")

// Given: the amount of deposit, compound interest. Find the balance on the account after 5 years
var sum: Float = 1000
var percent: Float = 5
var year = 1
let interest: Float = 1 + percent / 100

//Long solution:
//the 1st year
//sum *= interest
//the 2nd year
//summa *= interest
//the 3d year
//summa *= interest
//the 4th year
//summa *= interest
//the 5th year
//summa *= interest

//Short solution:
while  year <= 5  {
    sum *=   interest
    year += 1
}
sum
print("The balance on the account after \(year - 1) years will be \(round(100 * sum) / 100) rubles.")
