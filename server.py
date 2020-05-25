#! /usr/bin/python

import os.path
import tornado.httpserver
import tornado.websocket
import tornado.ioloop
import tornado.web
import subprocess

#Tornado Folder Paths
settings = dict(
	template_path = os.path.join(os.path.dirname(__file__), "templates"),
	static_path = os.path.join(os.path.dirname(__file__), "static")
	)

#Tonado server port
PORT = 8080


class MainHandler(tornado.web.RequestHandler):
  def get(self):
     print ("[HTTP](MainHandler) User Connected.")
     self.render("index.html")

	
class WSHandler(tornado.websocket.WebSocketHandler):
  def open(self):
    print ('[WS] Connection was opened.')
 
  def on_message(self, message):
    print ('[WS] Incoming message:'), message
    
    if message == "mgcaravans1":
      print ('Changing to preset 1')
      subprocess.run(["~/hik/changepreset.sh 1"], shell=True)
    if message == "mgcaravans2":
      print ('Changing to preset 2')
      subprocess.run(["~/hik/changepreset.sh 2"], shell=True)      
    if message == "ardbrin":
      print ('Changing to preset 3')
      subprocess.run(["~/hik/changepreset.sh 3"], shell=True)
    if message == "sonparc":
      print ('Changing to preset 4')
      subprocess.run(["~/hik/changepreset.sh 4"], shell=True)
      
    if message == 'reload':
      print ('Reloading screens ...')
      subprocess.run(["~/hik/hik.sh reload"], shell=True)
    
  def on_close(self):
    print ('[WS] Connection was closed.')


application = tornado.web.Application([
  (r'/', MainHandler),
  (r'/ws', WSHandler),
  ], **settings)


if __name__ == "__main__":
    try:
        http_server = tornado.httpserver.HTTPServer(application)
        http_server.listen(PORT)
        main_loop = tornado.ioloop.IOLoop.instance()

        print ("Tornado Server started")
        main_loop.start()

    except:
        print ("Exception triggered - Tornado Server stopped.")
        GPIO.cleanup()
