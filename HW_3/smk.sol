// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    // Добавление структуры произвольного содержания
    struct MyStruct {
        uint256 intValue;
        address addressValue;
        string stringValue;
        bool boolValue;
    }

    // Добавление отображения
    mapping(uint256 => MyStruct) public myMapping;

    // Добавление событий
    event StructAdded(uint256 key, uint256 intValue, address addressValue, string stringValue, bool boolValue);
    event StructRemoved(uint256 key);

    // Функция добавления структуры в отображение
    function addStruct(
        uint256 key,
        uint256 intValue,
        address addressValue,
        string memory stringValue,
        bool boolValue
    ) external {
        // Добавление структуры в отображение
        MyStruct memory newStruct = MyStruct({
            intValue: intValue,
            addressValue: addressValue,
            stringValue: stringValue,
            boolValue: boolValue
        });
        myMapping[key] = newStruct;

        // Логирование события
        emit StructAdded(key, intValue, addressValue, stringValue, boolValue);
    }

    // Функция удаления структуры из отображения
    function removeStruct(uint256 key) external {
        // Удаление структуры из отображения
        delete myMapping[key];

        // Логирование события
        emit StructRemoved(key);
    }
}
