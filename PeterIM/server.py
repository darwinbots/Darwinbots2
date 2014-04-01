from socket import *
import select,time
theTotalMemory=0
class ConnectedClient:
    def __init__(self, client, listOfClients):
        self.client = client
        self.name = "NO_NAME"
        self.organisms=[]
        self.listOfClients =listOfClients
        self.listOfClientsCounter = 0
        self.receivedFromCounter=0
        self.sendToCounter=0
        self.status = "B"
        self.fase = 0
        self.lengthNextBot=0
        self.sendCounter=0
        self.sendData=""
        self.nextRecvFile = True
        self.fileInMemory=""
        self.address = ""
        self.header_size = 0
        self.sendFileHeader = 0
    def _readHeader(self):
        # 5 reserved for filesize
        # 32 reserved for name
        print self.fase
        headerInMemory=""        
        if self.header_size ==0:
            self.header_size = 38
            headerInMemory=""

        # HEADER_SIZE = 38
        # headerInMemory=""
        if (self.header_size) > 0:
            rec = self.client.recv(self.header_size)
            headerInMemory+=rec
            self.header_size -= len(rec)
        print headerInMemory
        if self.header_size > 0:
            raise Exception("Corrupt header")
            return
        length = int(headerInMemory[:5])
        self.name = headerInMemory[5:36]
        self.status = headerInMemory[37]
        self.fileInMemory=""
        self.lengthNextBot = length
        theTotalMemory += length
        if self.status in ['B','S']:
            self.fase =1
        elif self.status == 'R':
            self.fase = 2
            self.nextRecvFile= False
        
    def _recvFile(self):
        if (self.lengthNextBot) > 0:
            rec = self.client.recv(min(1024, self.lengthNextBot))
            self.fileInMemory+=rec
            self.lengthNextBot -= len(rec)
        if (self.lengthNextBot) > 0:
            self.nextRecvFile = False
            return            
        self.organisms.append(self.fileInMemory)
        self.receivedFromCounter+=1
        if self.status == 'B':
            self.fase = 2
            self.nextRecvFile = False
        elif self.status == 'S':
            self.fase = 0
    
    def encode_length(self, l):
        return str(l).zfill(5)

    def handleClient(self):
        self.nextRecvFile = True
        # print 'fase', self.fase
        if self.fase ==0:
            # print '_readHeader'                        
            self._readHeader()
        elif self.fase ==1:
            # print 'self._recvFile()'            
            self._recvFile()
        elif self.fase ==2:
            # print 'sendFileHeader'
            self.sendFileHeader_init()
        elif self.fase ==3:
            self._sendFile()
        return self.nextRecvFile

    def incClientCounter(self):
        self.listOfClientsCounter+=1
        if self.listOfClientsCounter >= len(self.listOfClients):
            self.listOfClientsCounter=0

    def sendFileHeader_init(self):
        startCounter=self.listOfClientsCounter
        self.incClientCounter()
        while len(self.listOfClients[self.listOfClientsCounter].organisms)==0 \
        or self.listOfClients[self.listOfClientsCounter].name ==self.name :        
            # no bots availeble, reset to fase 0
            if startCounter == self.listOfClientsCounter:
                self.client.sendall(self.encode_length(0))
                self.fase =0
                return
            self.incClientCounter()
        data = self.listOfClients[self.listOfClientsCounter].organisms.pop()
        self.sendFileHeader = self.encode_length(len(data))
        lengthSend = self.client.send(self.sendFileHeader)
        #print 'lengthSend , self.sendFileHeader ',lengthSend , self.sendFileHeader 
        if lengthSend !=5:
            print "oops, guess client will hang"
        self.sendCounter=0
        self.sendData=data
        self.fase =3
        self.nextRecvFile= False

    def _sendFile(self):
        print self.sendCounter,len(self.sendData)        
        self.sendCounter += self.client.send(self.sendData[self.sendCounter:])
        if self.sendCounter != len(self.sendData):
            self.nextRecvFile= False            
            return
        self.sendToCounter+=1
        self.fase = 0

i=0

class ServerControl:
    def __init__(self, *args, **kwargs):
        server = socket(AF_INET, SOCK_STREAM)
        #server.setsockopt(SOL_SOCKET,SO_REUSEADDR,1)         
        server.setblocking(0)
        server.settimeout(300)
        server.bind(("", 21013))
        server.listen(100) # max 100 clients waiting
        self.clients = []
        readList =[server]
        writeList =[]
        self.clientSocket={}
        socketsInLine=0
        #bannedIPs=[]
        while True:
                #print 'readList: %s writeList: %s' %(len(readList), len(writeList))
                inputready,outputready,exceptready = select.select(readList,writeList,[])
                # if server in inputready:
                #     socketsInLine+=1
                # else:
                #     socketsInLine=0                    
                print inputready, outputready
                for sock in inputready:
                    # new connection
                    if  sock == server:
                        #print 'new connection'
                        connClient, address = server.accept()
                        #if address[0] not in bannedIPs:
                        connClient.setblocking(0)
                        readList.append(connClient)
                        client = ConnectedClient(connClient,self.clients)
                        client.address = address[0]
                        self.clients.append(client)
                        self.clientSocket[connClient] = client
                #        print "adding socket from %s|%s" % (client.name,client.address)
                        if (len(readList)+ len(writeList))> 500:
                            # avoid overflow, remove oldest inactive socket                                                                                  
                            killSock = readList.pop(1)
                            killSock.close()
                            self.clients.remove(client)
                #            print 'avoid overflow: removing socket from %s|%s' % (self.clientSocket[killSock].name  , self.clientSocket[killSock].address)

                    else:                         
                        try:
                            if not self.clientSocket[sock].handleClient():
                                readList.remove(sock)
                                writeList.append(sock)
                        except Exception,e:
                            print str(e)
                            sock.close()
                            readList.remove(sock)
                for sock in outputready:
                    try:
                        if self.clientSocket[sock].handleClient():
                            writeList.remove(sock)
                            readList.append(sock)
                    except Exception,e:
                        print str(e)
                        sock.close()
                        writeList.remove(sock)

                # cleanup
                for i in reversed(range(len(self.clients))):
                    if self.clients[i] not in self.clientSocket.values():
                        for client2 in self.clients:
                            if self.clients[i].name  == client2.name and self.clients[i] != client2:
                                client2.listOfClientsCounter += self.clients[i].listOfClientsCounter
                                client2.receivedFromCounter += self.clients[i].receivedFromCounter
                                client2.organisms.extend(self.clients[i].organisms)
                                self.clients.remove(self.clients[i])
                # if socketsInLine >90:
                #     # defaultdict ought to be better, but I want to avoid extra library installs
                #     d = dict()
                #     for oneClient in self.clients:
                #         if oneClient.address not in d:
                #             d[oneClient.address]=1
                #         else:
                #             d[oneClient.address] = d[oneClient.address]+1
                #     bannedIP = max(d.iterkeys(), key=(lambda key: d[key]))
                #     print "%s has been banned, too many connections" % bannedIP
                #     bannedIPs.append(bannedIP)
                #print 'totalMemory',theTotalMemory                
                if theTotalMemory >20000000 :
                    totalMemory=0
                    totalMemory2=0                
                    for client in self.clients:
                        for organism in client.organisms:                              
                            totalMemory+= len(organism)
                #    print 'totalMemory',totalMemory
                    # cap max bots
                    cap = 4096
                    if totalMemory > 20000000:
                        while totalMemory > 10000000:
                            cap /=2
                            #totalCache=0
                            for i in range(len(self.clients)):
                                if len(self.clients[i].organisms)>cap*2:
                                    self.clients[i].organisms = self.clients[i].organisms[-cap:]
                                    #totalCache += len(self.clients[i].organisms)
                            totalMemory=0
                            for client in self.clients:
                                for organism in client.organisms:                              
                                    totalMemory+= len(organism)
                    theTotalMemory = totalMemory





while(True):
    try:
        ServerControl()
    except Exception,e:
        print str(e)
        print "Server crashed, restarting in 100 seconds"
        time.sleep(100)
