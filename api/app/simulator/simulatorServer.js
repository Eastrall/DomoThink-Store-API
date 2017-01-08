/**
 * simulatorServer.js
 * Main class of the virtual devices server simulator.
 *
 */

import network from 'net';
import logger from './../modules/logger';

var devices = [];

class SimulatorServer {

  /**
   * Initialize and start the simulator server.
   *
   */
  start() {
    var simulatorServer = network.createServer(function(socket) {
      var socketRemote = socket.remoteAddress;

      logger.notice('New device connected from : ' + socketRemote);
      devices.push(socket);
      sendWelcomeNewObject(socket);

      socket.on('data', function(incomingData) {
        handleIncomingData(incomingData, socket);
      });

      socket.on('close', function(socket) {
        logger.info('Device disconnected.');
      });

      socket.on('end', function (socket) {
        logger.info('Device disconnected');
      });
    });

    simulatorServer.listen(4444, "127.0.0.1");
    logger.notice('SimulatorServer listening on port 4444');
  }
}

function sendWelcomeNewObject(socket){
  var data = "";
  var buffer = Buffer.from('0x01;HelloWorld!');

  console.log(buffer.toString('hex'));

  socket.write(buffer.toString('hex'));
  logger.info("sending data: " + buffer.toString('hex'));
}

/**
 * Handles the incoming data from a virtual device.
 *
 * @param {object} buffer The incoming buffer containing the data.
 * @param {object} socket The socket where the incoming data come from.
 */
function handleIncomingData(buffer, socket) {
  logger.info('Incoming data from : ' + socket.remoteAddress);
  logger.info(buffer);
}

const server = new SimulatorServer();

export default server;
