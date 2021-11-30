import UIKit
import Foundation
import Darwin


/*
1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
2. Описать пару его наследников TrunkCar и SportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.
 */


class Car {
    var brand: String
    var yearOfRelease: Int
    var engineStart: EngineStatus = .off
    var windowState: WindowStatus = .close
    
 
    enum EngineStatus: CustomStringConvertible {
        case on, off
        
        var description: String {
            switch self {
            case .on:
                return "Двигатель заведён"
            case .off:
                return "Двигатель заглушен"
            }
        }
    }
    
    enum WindowStatus: CustomStringConvertible{
        case open, close
        
        var description: String{
            switch self {
            case .open:
                return "окна открыты"
            case .close:
                return "окна закрыты"
        }
    }
}

    enum TrunkBodyType: CustomStringConvertible {
        case openBody, closedBody, special
        
        var description: String{
            switch self {
            case .openBody:
                return "Открытый тип кузова"
            case .closedBody:
                return "Закрытый тип кузова"
            case .special:
                return "Специального назначения"
            }
        }
    }
    
    enum Action {
        case switchEngine(EngineStatus)
        case switchWindow(WindowStatus)
        case loadCargo(Double)
        case attachTruckBody(TrunkBodyType)
        case replaceTyres
    }
    
    init(brand: String, yearOfRelease: Int) {
        self.brand = brand
        self.yearOfRelease = yearOfRelease
    }
    
    func perform(action: Action){
        }
    }

class TrunkCar: Car, CustomStringConvertible {
    static var typeEmoji = "🚚"
    var maxCargoVolume: Double
    var currentCargoVolume: Double = 0
    var body: TrunkBodyType?
    
    var description: String{
        let bodyDescription = body?.description ?? "отцеплен"
    
        return "\(TrunkCar.typeEmoji) \(brand) \nГод выпуска: \(yearOfRelease) \nКузов: \(bodyDescription) \(currentCargoVolume)/ \(maxCargoVolume) \nСостояние: \(engineStart)| \(windowState)\n"
        }
    
    init(brand: String, yearOfRelease: Int, maxCargoVolume: Double, body: TrunkBodyType?) {
        self.body = body
        self.maxCargoVolume = maxCargoVolume
        super.init(brand: brand, yearOfRelease: yearOfRelease)
    }
    override func perform(action: Action) {
        switch action{
        case .switchEngine(let status):
            engineStart = status
        case .switchWindow(let status):
            windowState = status
        case .loadCargo(let load):
            guard body != nil else{
                return
            }
            let expectedLoad = load + currentCargoVolume
            switch expectedLoad {
            case _ where expectedLoad > maxCargoVolume:
                currentCargoVolume = maxCargoVolume
            case _ where expectedLoad < 0:
                currentCargoVolume = 0
            default:
                currentCargoVolume += load
            }
        case .attachTruckBody(let newBody):
            self.body = newBody
            currentCargoVolume = 0
        default:
            break
        }
    }
}
class SportCar: Car, CustomStringConvertible {
    static var typeEmoji = "🏎"
    var overClocking: Double
    var maxSpeed: Int = 0
    
    var description: String{
        return "\(SportCar.typeEmoji) \(brand)\nГод выпуска: \(yearOfRelease)\nРазгон 0-100 км/ч: \(overClocking) с\nМаксимальная скорость: \(maxSpeed) км/ч \n Состояние: \(engineStart) | \(windowState)\n"
    }
    
    init(brand: String, yearOfRelease: Int, overClocking: Double, maxSpeed: Int) {
        self.maxSpeed = maxSpeed
        self.overClocking = overClocking
        super.init(brand: brand, yearOfRelease: yearOfRelease)
    }
        
    override func perform(action: Action) {
        switch action {
        case .switchEngine(let status):
            engineStart = status
        case.switchWindow(let status):
            windowState = status
        case.replaceTyres:
            print("Произведена замена шин")
        default:
            break
            }
        }
    }


var IsuzuElf = TrunkCar(brand: "Isuzu", yearOfRelease: 2017, maxCargoVolume: 2.9, body: nil)
IsuzuElf.perform(action: .attachTruckBody(.closedBody))
IsuzuElf.perform(action: .switchWindow(.close))
IsuzuElf.windowState
IsuzuElf.perform(action: .switchEngine(.on))
print(IsuzuElf)


var Porsche918Spyder = SportCar(brand: "Porsche", yearOfRelease: 2020, overClocking: 2.8, maxSpeed: 345)
Porsche918Spyder.perform(action: .switchEngine(.off))
Porsche918Spyder.perform(action: .switchWindow(.open))
Porsche918Spyder.perform(action: .replaceTyres)
print(Porsche918Spyder)






  



