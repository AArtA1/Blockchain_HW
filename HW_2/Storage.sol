// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Storage {
    // Добавление структуры произвольного содержания
    struct CustomData {
        uint256 intValue;
        address addressValue;
        string stringValue;
        bool boolValue;
    }

    // Добавление отображения
    mapping(uint256 => CustomData) public dataMapping;

    // Добавление событий
    event DataAdded(uint256 key, uint256 intValue, address addressValue, string stringValue, bool boolValue);
    event DataRemoved(uint256 key);

    // Функция добавления структуры в отображение
    function addData(
        uint256 key,
        uint256 intValue,
        address addressValue,
        string memory stringValue,
        bool boolValue
    ) external {
        // Добавление структуры в отображение
        CustomData memory newData = CustomData({
            intValue: intValue,
            addressValue: addressValue,
            stringValue: stringValue,
            boolValue: boolValue
        });
        dataMapping[key] = newData;

        //  Логирование события
        emit DataAdded(key, intValue, addressValue, stringValue, boolValue);
    }

    //  Функция удаления структуры из отображения
    function removeData(uint256 key) external {
        //  Удаление структуры из отображения
        delete dataMapping[key];

        //  Логирование события
        emit DataRemoved(key);
    }
}
