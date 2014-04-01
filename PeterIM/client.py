from socket import *
import glob, os, time,sys,argparse, bz2,traceback

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
waittime = args['waittime'] if args['waittime']!= None else 10
server = args['server'] if args['server']!= None else "82.72.32.181"
port = args['port'] if args['port']!= None else 21013
hybrid = args['n'] if args['n']!= None else 0
maxinbound = args['maxinbound'] if args['maxinbound']!= None else 25

class Client(socket):

    def __init__(self, *args, **kwargs):
        self.totalSend=0
        self.totalReceived=0
        socket.__init__(self, *args, **kwargs)
        self.name=""
        self.status= "B"
        self.counter=0


    def _run(self, counter):
        files= glob.glob("%s/*.dbo"%outbound)
        filesInbound= glob.glob("%s/*.dbo"%inbound)
        while len(files)==0 and len(filesInbound)>maxinbound:
            time.sleep(waittime)
            files= glob.glob("%s/*.dbo"%outbound)
            filesInbound= glob.glob("%s/*.dbo"%inbound)
            
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

    def _sendFile(self, path, status):
        try:
            os.rename(path, path+".temp")
            os.rename(path+".temp", path)
            sendfile = open(path, 'r+b')
        except Exception,e:
            print 'too quick'
            print e       
            traceback.print_exc()
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
        LENGTH_SIZE = 5
        length = self.decode_length(self.recv(LENGTH_SIZE))
        if  length==0:
            if self.status == "R":
                print 'server got no bots'
                time.sleep(waittime)
                self.currentInbound+=100
            return
        fileInMemory=""
        while (length) > 0:
            # print length
            rec = self.recv(min(1024, length))
            fileInMemory+=rec
            length -= len(rec)
        
        dup_file= True
        while dup_file:
            dup_file=False
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
        print "received",path
        self.totalReceived+=1
        if self.totalReceived %100 ==0:
            print "received %s send %s" % (self.totalReceived, self.totalSend)

    def decode_length(self, l):
        print "decode_length(%s)" % l
        return int(l)

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