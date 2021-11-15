import UIKit


// Задание №1. Написать функцию, которая определяет, четное число или нет.

func myInt(_ number: Int) -> (){
    
    if number.isMultiple(of: 2) {
 //  if number % 2 == 0 { (второй вариант)
      print("четное число")
    } else {
        print("нечетное число")
    }
}
 
myInt(3) // проводим проверку
myInt(10)

// Задание №2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func myIntThree(_ number: Int) -> () {
    
    if number.isMultiple(of: 3) {
 //  if number % 3 == 0 { (второй вариант)
      print("число делится на 3 без остатка")
    } else {
        print("число не делится на 3 без остатка")
    }
}

myIntThree(9) // проводим проверку
myIntThree(17)


// Задание №3. Создать возрастающий массив из 100 чисел.

var myArray = [Int] (1...100)
print(myArray)


// Задание №4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for element in myArray {
    if element.isMultiple(of: 2) || !element.isMultiple(of: 3) {
        myArray.remove(at: myArray.firstIndex(of: element)!)
    }
}
print ("Новый массив \(myArray)")


// Задание №5. *Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.

func fibonacci (num: Int) -> [Int]{
    var newArray: [Int] = [0,1]
    for i in 0...num {
        newArray.append(newArray[i] + newArray[i+1])
    }
    return newArray
}
print(fibonacci(num: 50))


/* Задание №6 *Заполнить массив элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n (пусть будет 100)*/

var someArray = [Int] (2...1000)

for p in someArray {
    for someElement in someArray {
        if someElement % p == 0 && someElement != p {
            someArray.remove(at: someArray.firstIndex(of: someElement)!)
        }
    }
    
    if someArray.count > 100 {
        someArray.removeLast()
    }
}

someArray.removeAll(){i in i==0}

print(someArray)


