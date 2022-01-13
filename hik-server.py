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
	def LblNames(self):
		Lbls = []
		for line in open(os.path.expanduser('~/hik/cameras.config')):
			if line.startswith('PRENAMES='):
				for a in line.split("="):
					if a != "NAMES":
						for b in a.split("|"):
							b = b.replace('"', '')
							Lbls.append(b)
							
		return Lbls
	def get(self):
		print ("[HTTP](MainHandler) User Connected.")
		PresetLabels = self.LblNames()
		self.render("index.html", PresetLabels=PresetLabels)
class WSHandler(tornado.websocket.WebSocketHandler):
	def open(self):
		print ('[WS] Connection was opened.', flush=True)
		
	def on_message(self, message):
		print (('[WS] Incoming message:', message), flush=True)
		
		if message == "Preset1":
			print ('Changing to preset 1', flush=True)
			subprocess.run(["~/hik/changepreset.sh 1"], shell=True)
			
		if message == "Preset2":
			print ('Changing to preset 2', flush=True)
			subprocess.run(["~/hik/changepreset.sh 2"], shell=True)
		
		if message == "Preset3":
			print ('Changing to preset 3', flush=True)
			subprocess.run(["~/hik/changepreset.sh 3"], shell=True)
			
		if message == "Preset4":
			print ('Changing to preset 4', flush=True)
			subprocess.run(["~/hik/changepreset.sh 4"], shell=True)
			
		if message == "Preset5":
			print ('Changing to preset 5', flush=True)
			subprocess.run(["~/hik/changepreset.sh 5"], shell=True)
		
		if message == "Preset6":
			print ('Changing to preset 6', flush=True)
			subprocess.run(["~/hik/changepreset.sh 6"], shell=True)
			
		if message == "Preset7":
			print ('Changing to preset 7', flush=True)
			subprocess.run(["~/hik/changepreset.sh 7"], shell=True)
			
		if message == "Preset8":
			print ('Changing to preset 8', flush=True)
			subprocess.run(["~/hik/changepreset.sh 8"], shell=True)
			
		if message == 'reload':
			print ('Reloading screens ...', flush=True)
			subprocess.run(["~/hik/hik.sh reload"], shell=True)
			
		if message == 'off':
			print ('Turning off Screens', flush=True)
			subprocess.run(["~/hik/changepreset.sh 0"], shell=True)

	def on_close(self):
		print ('[WS] Connection was closed.', flush=True)


application = tornado.web.Application([
	(r'/', MainHandler),
	(r'/ws', WSHandler),
  ], **settings)

if __name__ == "__main__":
	try:
		http_server = tornado.httpserver.HTTPServer(application)
		http_server.listen(PORT)
		main_loop = tornado.ioloop.IOLoop.instance()
		
		print ("Tornado Server started", flush=True)
		main_loop.start()
	
	except:
		print ("Exception triggered - Tornado Server stopped.", flush=True)
