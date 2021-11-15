import UIKit
import Darwin

// задание №1
//решить квадратное уравнение A*x^2 + B*x + C

var x1: Double = 0
var x2: Double = 0
var D: Double = 0

var A: Double = 2
var B: Double = 3
var C: Double = 1

D = (B * B) - 4 * A * C // для решения уравнения находим дискриминант квадратного уравнения

switch D {
case _ where D > 0:
    x1 = (-B - sqrt(D)) / (2 * A)
    x2 = (-B + sqrt (D)) / (2 * A)
    print ("x1 = \(x1); x2 = \(x2)")
case _ where D == 0:
    x1 = (-B - sqrt(D)) / (2 * A)
        print ("x1 = x2 = \(x1)")
default:
        print("нет корней")
}


// задание №2 Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

var a = 3, b = 4 // даны катеты прямоугольного треугольника a и b

var S = Double((a * b)/2)  // находим площадь
var c = sqrt(Double((a*a)+(b*b))) // находим гипотенузу
/*
 можно использовать для степени pow(Double(a),2), но запись получается длинная
 в отличие от умножения переменной на себя
 */
var P = Double(a + b) + c // находим периметр

print ("Площадь прямоугольного треугольника равна \(S)")
print ("Периметр прямоугольного треугольника равен \(P)")
print ("Гипотенуза равна \(c)")


// задание №3 *Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

print("Введите сумму вклада: ")
let vklad = readLine()
print("Введите годовой процент: ")
let percent = readLine()
let years = 5.0

func summaVklada (vklad: Double, years: Double, percent: Double) -> Double {
    let result = vklad * pow((1 + percent/100),years)
    print (result)
    return result
}


