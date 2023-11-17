// eventScript.js
const { Web3 } = require('web3');
const config = require('./config');

const infuraUrl = `https://polygon-mumbai.infura.io/v3/${config.infuraApiKey}`;
const web3 = new Web3(infuraUrl);

const contractAddress = config.contractAddress;
const abi = []; 
const contract = new web3.eth.Contract(abi, contractAddress);

// Функция для просмотра событий
function watchEvents() {
  contract.events.allEvents((error, event) => {
    if (error) {
      console.error('Error in event:', error);
    } else {
      console.log('Event:', event.event, 'Data:', event.returnValues);
    }
  });
}

// Функция для просмотра слотов storage контракта
async function viewStorageSlots() {
  const storage = await web3.eth.getStorageAt(contractAddress, 0);
  console.log('Storage at slot 0:', storage);
}

// Вызов функций
watchEvents();
viewStorageSlots();
