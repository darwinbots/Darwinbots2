from socket import *
import glob, os, time,sys,argparse, bz2,traceback,json,zlib

parser = argparse.ArgumentParser()
parser.add_argument('-in', help='inbound directory')
parser.add_argument('-out', help='outbound directory')
parser.add_argument('-name', help='username')
parser.add_argument('-pid ', help='pid?')
parser.add_argument('-waittime', help='time between requests in seconds')
parser.add_argument('-server', help='ip of the server')
parser.add_argument('-port', help='port of the server')
parser.add_argument('-maxinbound', help='maximum of bots to transfer into the inbound folder, default 25')
parser.add_argument('-n', help="If n = 0 then the client will run normally.\
                                    If n = 1 all robots are simply moved from the 'out folder' to the 'in folder'\
                                    If n >= 2 then every nth robot will simply moved from the 'out folder' to the 'in folder'")

args = vars(parser.parse_args())

inbound = args['in'] if args['in']!= None else 'inbound'
outbound = args['out'] if args['out']!= None else 'outbound'
name = args['name'] if args['name']!= None else 'NO_NAME'
waittime = int(args['waittime']) if args['waittime']!= None else 10
server = args['server'] if args['server']!= None else "198.50.150.51"
port = int(args['port']) if args['port']!= None else 4669
hybrid = args['n'] if args['n']!= None else 0
defmaxinbound = int(args['maxinbound']) if args['maxinbound']!= None else 25

class Client(socket):

    def __init__(self, *args, **kwargs):
        self.totalSend=0
        self.totalReceived=0
        socket.__init__(self, *args, **kwargs)
        self.name=""
        self.status= "B"
        self.counter=0
        self.LENGTH_SIZE=0
        self.infoByte=0
    def _run(self, counter):
        maxinbound = defmaxinbound
        loop=True
        while loop:
            time.sleep(waittime)
            maxSent = self.totalReceived*2 - self.totalSend+10
            maxRec = self.totalSend*2 - self.totalReceived+10
            if maxRec<0:
                maxRec=0
            maxinbound  = min(maxRec,maxinbound)
            if maxSent<0:
                maxSent=0
            files= glob.glob("%s/*.dbo"%outbound)
            filesInbound = glob.glob("%s/*.dbo"%inbound)

            if maxSent==0:
                files=[]
            elif maxSent<len(files):
                files = files[:maxSent]
            loop=len(files)==0 and len(filesInbound)>=maxinbound
        #maxTeleport = maxinbound - len(filesInbound)
        i=0
        self.currentInbound = len(filesInbound)
        client.settimeout(300)
        while maxinbound > self.currentInbound or len(files)>0:
            self.status ="B"
            # print "status%s", self.status
            if len(files)>0 and (maxinbound <= self.currentInbound):
                self.status ="S"
            elif len(files)==0 and (maxinbound > self.currentInbound):
                self.status = "R"
            
            self.counter+=1
            #if (hybrid ==0)   
            if self.status in ['B','S']:
                client._sendFile(files.pop(), self.status)
            else:
                #send header package with info that there's no dbo afterwards
                client.sendall(client.encode_length(0, self.status))

            if self.status in ['B','R']:
                client._recvFile(inbound)
                self.currentInbound+=1
            else:
                # Not accepting a bot back should be handled in the first status package
                pass
            i+=1

        statFiles = glob.glob("%s/*.stats"%outbound)
        if len(statFiles)>0:
            if len(statFiles)>5000:
                self._sendStats(statFiles[:5000])
            else:
                self._sendStats(statFiles)
        time.sleep(waittime)


    def _sendStats(self, allFiles):
    #try except block is kinda double from sendfile
        allData=[]
        timestamps={}
        for filee in allFiles:
            try:
                os.rename(filee, filee+".temp")
                os.rename(filee+".temp", filee)
                openfile = open(filee, 'r+b')
            except Exception,e:
                print e
                return
            jsonData= openfile.read()
            data = json.loads(jsonData)
            openfile.close()
            if int(data["unixtime"]) not in timestamps:
                timestamps[data["unixtime"]]=list()
                timestamps[data["unixtime"]].append(data["simId"])
            else:
                if data["simId"] in timestamps[data["unixtime"]]:
                    continue
                else:
                    timestamps[data["unixtime"]].append(data["simId"])  
            allData.append(data)


        allData =  json.dumps(allData)
        # print len(bz2.compress(allData))
        zippedData = zlib.compress(allData)

        # partly copied from _sendfile
        if len(data) > 999999:
            print 'too big'
            return
        # print self.encode_length(len(zippedData), 's')
        self.sendall(self.encode_length(len(zippedData), 's'))
        self.sendall(zippedData)
        print "sending %s stats" % len(allFiles)

        for filee in allFiles:
            os.remove(filee)


    def _sendFile(self, path, status):
        try:
            os.rename(path, path+".temp")
            os.rename(path+".temp", path)
            sendfile = open(path, 'r+b')
        except Exception,e:
            print 'too quick'
            print e       
            traceback.print_exc()
            if self.status =='B':
                self.sendall(self.encode_length(0,'R'))
            time.sleep(waittime)
            return
        data = bz2.compress(sendfile.read())
        sendfile.close()
        if len(data) > 999999:
            print 'too big'
            os.rename(path, path+".toobig")
            self.sendall(self.encode_length(0,'R'))
            time.sleep(waittime)            
            return
        self.sendall(self.encode_length(len(data),status))
        self.sendall(data)
        self.totalSend+=1
        print 'sending'  ,path
        os.remove(path)
        if self.totalSend %100 ==0:
            print "received %s send %s" % (self.totalReceived, self.totalSend)

    def encode_length(self, l, status):
        # print str(l).zfill(5) +self.name.ljust(32) + status
        return str(l).zfill(5) +self.name.ljust(32) + status

    def _recvFile(self, inbound):
        if self.LENGTH_SIZE==0:
            self.LENGTH_SIZE = 38
        strLength=""
        timesWaited = 0
        while (self.LENGTH_SIZE) > 0:
            rec = self.recv(self.LENGTH_SIZE)
            strLength+=rec
            self.LENGTH_SIZE -= len(strLength)
            if self.LENGTH_SIZE != 0:
                print "waiting..."
                timesWaited+=1
                time.sleep(timesWaited)
                if timesWaited >10:
                    raise Exception("Waited too long")

        (length, username, infoByte) = self.decode_length(strLength)
        self.infoByte = infoByte
        if  length==0:
            print 'server got no bots'
            if self.status == "R":
                time.sleep(waittime)
                self.currentInbound+=100
            return
        fileInMemory=""
        while (length) > 0:
            rec = self.recv(min(1024, length))
            fileInMemory+=rec
            length -= len(rec)
        
        dup_file= True
        while dup_file:
            dup_file=False
            kill_infinite_loop = 10
            try:
                path = "%s/neworganism_%s"%(inbound,str(self.counter))
                writefile = open(path+".temp", 'w+b')
                writefile.write(bz2.decompress(fileInMemory))
                writefile.close()
                os.rename(path+".temp", path+".dbo")
            except Exception,e:
                dup_file= True
                self.counter+=1
                #print 'file already exists!!'
                print e
                traceback.print_exc()
                kill_infinite_loop-=1
                if kill_infinite_loop<0:
                    dup_file=False;
        print "received bot from", username
        self.totalReceived+=1
        if self.totalReceived %100 ==0:
            print "received %s send %s" % (self.totalReceived, self.totalSend)

    def decode_length(self, headerInMemory):
        length = int(headerInMemory[:5])
        name = headerInMemory[5:36]
        status = headerInMemory[37]
        return (length, name, status)



counter=0
while True:
    try:
        client = Client(AF_INET, SOCK_STREAM)
        client.connect((server, port))
        client.name = name
        while True:
            client._run(counter)
            #try:

    except Exception,e:
        print str(e)
        traceback.print_exc()        
        time.sleep(100)