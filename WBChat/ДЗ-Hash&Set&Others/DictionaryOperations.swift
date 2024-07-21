//
//  DictionaryOperations.swift
//  WBChat
//
//  Created by Александр on 21.07.2024.
//

import Foundation
// Словари в Swift не сохраняют порядок элементов
// и используют хеширование для быстрого доступа к значениям

// Задание 4. Dictionary:
// Создайте словарь, где ключами будут строки (названия городов), а значениями — целые числа (их население).
// Добавьте несколько пар ключ-значение в словарь.
// Удалите одну пару ключ-значение.
// Обновите значение для одного из ключей.
// Получите значение для одного из ключей.

// Создаем словарь с названиями городов в качестве ключей и их населением в качестве значений
var cityPopulation: [String: Int] = [
    "Астрахань": 529793,
    "Ростов-на-Дону": 1137704,
    "Волгоград": 1008998
]

func printInitialDict() {
    print("Исходный словарь:")
    cityPopulation.forEach { city, population in
        print("\(city): \(population)")
    }
}
//Исходный словарь:
//Астрахань: 529793
//Ростов-на-Дону: 1137704
//Волгоград: 1008998

// Добавляем новую пару ключ-значение в словарь
func addNewKeyValuePair() {
    cityPopulation["Самара"] = 1156659
    cityPopulation["Москва"] = 13_149_803
    print("\nСловарь после добавления Самары и Москвы:")
    cityPopulation.forEach { city, population in
        print("\(city): \(population)")
    }
}
//Словарь после добавления Самары и Москвы:
//Волгоград: 1008998
//Москва: 13149803
//Самара: 1156659
//Астрахань: 529793
//Ростов-на-Дону: 1137704

// Удаляем одну пару ключ-значение из словаря
func deleteKeyValuePair() {
    cityPopulation.removeValue(forKey: "Волгоград")
    print("\nСловарь после удаления Волгограда:")
    cityPopulation.forEach { city, population in
        print("\(city): \(population)")
    }
}
//Словарь после удаления Волгограда:
//Москва: 13149803
//Самара: 1156659
//Астрахань: 529793
//Ростов-на-Дону: 1137704

// Обновляем значение для одного из ключей
func updateValue(){
    cityPopulation["Астрахань"] = 534241
    print("\nСловарь после обновления населения Астрахани:")
    cityPopulation.forEach { city, population in
        print("\(city): \(population)")
    }
}
//Словарь после обновления населения Астрахани:
//Москва: 13149803
//Самара: 1156659
//Астрахань: 534241
//Ростов-на-Дону: 1137704

// Получаем значение для одного из ключей
func getValue(){
    if let rostovPopulation = cityPopulation["Ростов-на-Дону"] {
        print("\nНаселение Ростова-на-Дону: \(rostovPopulation)")
    } else {
        print("\nРостов-на-Дону не найден в словаре")
    }
}

//Население Ростова-на-Дону: 1137704

