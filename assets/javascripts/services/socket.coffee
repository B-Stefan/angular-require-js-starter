define ['./services'], (services)->
  services.factory 'socket', (socketFactory)->
    mySocket = socketFactory();
    mySocket.forward('hipchat-state')
    window.test = mySocket
    return mySocket;