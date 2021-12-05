import UIKit

// 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
// 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

struct queuer <T: Comparable> {
    
    var elements: [T] = []
    
    mutating func add (_ element: T) {
        elements.append(element)
    }
    
    mutating func remove() -> T {
        print("Удален элемент \(elements.first!)")
        return elements.removeFirst()
    }
    
    func filter(element: T) {
        print("Отфильтрованные элементы\(elements.filter{$0 == element})")
    }
    
    mutating func elementSort() -> [T] {
        return elements.sorted(by: >)
    }
    
    // Задание 3. *Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
    
    subscript (index: Int) -> T? {
        return (index < elements.count ? elements[index] : nil)
    }
    
    func printCount(){
        print(elements.count)
    }
}

var round = queuer<String>(elements:["1"])

round.add("2")
round.add("3")
round.add("5")
round.add("5")
round.add("8")
print(round.elements)
print("Отсортированный: \(round.elementSort())")

round.remove()
round.remove()
round.add("11")
print(round)
round.filter(element: "5")
round.printCount()

print(round)
print(round[4])
print(round[1])





