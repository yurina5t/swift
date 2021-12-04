import UIKit
import Foundation


// 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

enum windowStatus {
    case open, close
}

enum engineStatus {
    case on, off
}

protocol Car: AnyObject {
    var brand: String { get }
    var yearOfRelease: Int { get }
    var engine: engineStatus { get set }
    var window: windowStatus { get set}
}

extension Car {
    func windowStatus(status: windowStatus) {
        switch status {
        case .open:
            print("\(brand): окна открыты")
            self.window = .open
        case .close:
            print("\(brand): окна закрыты")
            self.window = .close
        }
    }
    
    func engineStatus(status: engineStatus) {
        switch status {
        case .on:
            print("\(brand): двигатель заведён")
            self.engine = .on
        case .off:
            print("\(brand): двигатель заглушен")
            self.engine = .off
        }
    }
}
        
 // 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).


protocol TrunkCar: Car {
    var bodyVolume: Double {get}
    var bodyFreeSpace: Double {get}
    var cargoVolume: Double {get set}
}
    
extension TrunkCar {
    func PutCargo(volume: Double){
        if bodyFreeSpace >= volume {
            print("\(brand): свободный объем загрузки \(volume) куб.м ")
            self.cargoVolume += volume
        } else {
            print("\(brand): нет места для загрузки груза \(volume) куб.м ")
        }
    }
        
        func RemoveCargo(volume: Double) {
            if self.bodyVolume >= volume {
                print("\(brand): объем кузова \(volume) куб.м выгрузили")
                self.cargoVolume -= volume
            } else {
                print("\(brand): в кузове нет груза объемом \(volume) куб.м.")
            }
        }
    }
    
    protocol SportCar: Car {
        var maxSpeed: Int {get}
        var currentSpeed: Int {get set}
    }
   
    extension SportCar {
        func IncreaseSpeed(speed: Int) {
            if speed + currentSpeed <= maxSpeed {
                print("\(brand): набрал скорость \(speed)")
                self.currentSpeed += speed
            } else {
                print ("\(brand): не может ускориться до \(speed + currentSpeed) км/ч, максимальная скорость - \(maxSpeed) км/ч")
            }
        }
        func ReduceSpeed(speed: Int) {
            if self.currentSpeed >= speed {
                print("\(brand): замедлилась до \(speed) км/ч")
                self.currentSpeed -= speed
            } else {
                print("\(brand): остановилась ")
                self.currentSpeed = 0
            }
        }
    }

// 3. Создать два класса, имплементирующих протокол «Car»: tunkCar и sportCar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

class trunkCar: TrunkCar {
    var brand: String
    var yearOfRelease: Int
    var window: windowStatus
    var engine: engineStatus
    let bodyVolume: Double
    var bodyFreeSpace: Double {
        get {
            return bodyVolume - cargoVolume
        }
    }
   var cargoVolume: Double
    
    init (brand: String, yearOfRelease: Int, bodyVolume: Double) {
        self.bodyVolume = bodyVolume
        self.cargoVolume = 0
        self.brand = brand
        self.yearOfRelease = yearOfRelease
        self.engine = .off
        self.window = .close
    }
}

class sportCar: SportCar {
    let maxSpeed: Int
    var currentSpeed: Int
    var brand: String
    var yearOfRelease: Int
    var window: windowStatus
    var engine: engineStatus
    
    init(brand: String, yearOfRelease: Int, maxSpeed: Int) {
        self.maxSpeed = maxSpeed
        self.currentSpeed = 0
        self.brand = brand
        self.yearOfRelease = yearOfRelease
        self.engine = .on
        self.window = .close
        }
    }

// 4. Для каждого класса написать расширение, имплементирующее протокол «CustomStringConvertible».

extension trunkCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль: \(brand)\nГод выпуска: \(yearOfRelease)\nДвигатель: \(engine)\nОкна: \(window)\nОбъем кузова: \(bodyVolume) куб.м \nОбъем груза: \(cargoVolume) куб.м \n"
    }
}

extension sportCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль: \(brand)\nГод выпуска: \(yearOfRelease)\nДвигатель: \(engine)\nОкна: \(window)\nМаксимальная скорость: \(maxSpeed) км/ч \nТекущая скорость: \(currentSpeed) км/ч \n"
    }
}


// 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

var Porsche1 = sportCar(brand: "Porsche 918 Spyder", yearOfRelease: 2020, maxSpeed: 345)

var Isuzu1 = trunkCar(brand: "Isuzu Elf", yearOfRelease: 2017, bodyVolume: 2.9)

Porsche1.engineStatus(status: .on)
Porsche1.windowStatus(status: .close)
Porsche1.IncreaseSpeed(speed: 100)
Porsche1.IncreaseSpeed(speed: 300)
Porsche1.ReduceSpeed(speed: 60)

Isuzu1.PutCargo(volume: 1.2)
Isuzu1.bodyFreeSpace
Isuzu1.engineStatus(status: .off)
Isuzu1.windowStatus(status: .open)


// 6. Вывести сами объекты в консоль.
print("_______")
print(Porsche1)
print(Isuzu1)
