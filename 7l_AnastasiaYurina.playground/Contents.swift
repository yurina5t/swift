import UIKit
import Foundation

//Задание 1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

//Задание 2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

enum PremiumTicketsError: Error { //ошибки премиальных билетов
    
    case invalidSelection
    case outOfStock
    case insufficientFunds(milesNeeded: Int) // недостаточно миль, передаем недостаточную сумму
}
// позиции по премиальным билетам
struct Item {
var mile: Int //цена в милях
var count: Int // количество билетов
let direction: Direction // направление полета
}

struct Direction{
let name: String
}
// премиальные билеты за мили
class PremiumTickets {
    // хранилище
    var inventory = [
        "Санкт-Петербург": Item(mile: 10000, count: 3, direction: Direction(name: "Билет в Санкт-Петербург")),
        "Сочи": Item(mile: 7500, count: 10, direction: Direction(name: "Билет в Сочи")),
        "Лондон": Item(mile: 15000, count: 5, direction: Direction(name: "Билет в Лондон"))
    ]
// количество миль, накопленное покупателем
    var milesDeposited = 6000
// выбираем направление за мили
    func vend(itemNamed name: String) throws -> Direction {
// если в нашей системе нет такого направления
        guard let item = inventory[name] else {
// возвращаем nil вместо билета и ошибку
            throw PremiumTicketsError.invalidSelection
        }
// Если направления нет в наличии
        guard item.count > 0 else {
// генерируем ошибку
            throw PremiumTicketsError.outOfStock
        }
// Если недостаточно миль
        guard item.mile <= milesDeposited else {
// возвращаем nil вместо продукта и ошибку
            throw PremiumTicketsError.insufficientFunds(milesNeeded: item.mile - milesDeposited)
        }
// продаем билет за мили
        milesDeposited -= item.mile
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
// Возвращаем билет
        return newItem.direction
    }
}

enum BuyError: Error { // ошибки покупки
case buyerNotFound // покупатель не найден
}
// список покупателей и товаров, которые они хотят купить
let favoriteDirections = [
    "buyer1": "Санкт-Петербург",
    "buyer2": "Сочи",
    "buyer3": "Лондон",
]
// метод покупки, тоже генерирует исключение
func buyFavoriteDirection(person: String, PremiumTickets: PremiumTickets) throws -> Direction {
// если покупатель не найден, генерируем исключение
    guard let directionName = favoriteDirections[person] else { throw BuyError.buyerNotFound
    }
// иначе покупаем билет
    return try PremiumTickets.vend(itemNamed: directionName)
}
let premiumTickets = PremiumTickets()

do {
    try buyFavoriteDirection(person: "buyer1", PremiumTickets: premiumTickets)
} catch PremiumTicketsError.invalidSelection {
    print("Такого направления не существует")
} catch PremiumTicketsError.insufficientFunds(let coinsNeeded) {
    print("Количество миль недостаточно. Необходимо еще \(coinsNeeded) миль")
} catch BuyError.buyerNotFound {
    print("Покупатель не найден")
} catch let error {
// если во время выполнения возникла ошибка, обрабатываем ее
    print(error.localizedDescription)
}





