const { Web3 } = require('web3');
const config = require('./config');

// Подключение к Infura
const infuraUrl = `https://polygon-mumbai.infura.io/v3/${config.infuraApiKey}`;
const web3 = new Web3(infuraUrl);

// Создание экземпляра контракта
const contractAddress = config.contractAddress;
const abi = []; 
const contract = new web3.eth.Contract(abi, contractAddress);

// Функция для добавления структуры в отображение
async function addDataToMapping(key, intValue, addressValue, stringValue, boolValue) {
  const accounts = await web3.eth.getAccounts();
  
  // Вызов функции смарт-контракта
  const result = await contract.methods.addData(key, intValue, addressValue, stringValue, boolValue).send({ from: accounts[0] });
  
  // Логирование события
  console.log('DataAdded event:', result.events.DataAdded.returnValues);
}

// Функция для удаления структуры из отображения
async function removeDataFromMapping(key) {
  const accounts = await web3.eth.getAccounts();
  
  // Вызов функции смарт-контракта
  const result = await contract.methods.removeData(key).send({ from: accounts[0] });
  
  // Логирование события
  console.log('DataRemoved event:', result.events.DataRemoved.returnValues);
}

// Вызов функций
addDataToMapping(1, 42, '0xAddress', 'Hello', true);
removeDataFromMapping(1);
