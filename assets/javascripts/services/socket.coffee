define ['./services'], (services)->
  services.factory 'socket', (socketFactory)->
    mySocket = socketFactory();
    #Add events to broadcast
    mySocket.forward('msg')
    return mySocket;