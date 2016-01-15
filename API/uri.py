# CS491 - Group 8
# Joseph Barlan, Rick Hasson, Adam McDaniel


import webapp2
import cgi


class URI(webapp2.RequestHandler):
	def get(self):
		self.response.write('<head><title>CORVALLIS REUSE AND REPAIR DIRECTORY API</title></head>')
		self.response.write('<body>')
		self.response.write('<h1>CORVALLIS REUSE AND REPAIR DIRECTORY API</h1>')	
		self.response.write('<ul>')		
		
		# /reuse_org
		self.response.write('<li><h2>/reuse_org</h2></li>')
		self.response.write('<ul>')
		self.response.write('<li><h4>HTTP GET returns JSON object of all Resuse_org entities (in alphabetical order) with their properties.</h4></li>')
		self.response.write('<li><h4>HTTP POST creates a new Reuse_org entity and returns a JSON object of the entity and its properties</h4></li>')
		self.response.write('<ul>')
		self.response.write('<li>name - stored as a StringProperty, REQUIRED</li>')
		self.response.write('<li>address - stored as a TextProperty</li>')
		self.response.write('<li>longitude - stored as a StringProperty</li>')
		self.response.write('<li>latitude - stored as a StringProperty</li>')
		self.response.write('<li>phone - stored as a StringProperty</li>')
		self.response.write('<li>webpage - stored as a StringProperty</li>')
		self.response.write('<li>hours - stored as a TextProperty</li>')
		self.response.write('<li>notes - stored as a TextProperty</li>')
		self.response.write('<li>items - stored as a list of KeyProperties (format is a urlsafe key)</li>')
		self.response.write('</ul>')	
		self.response.write('<li><h4>HTTP PUT updates properties of an existing Reuse_org entity and returns a JSON object of the updated entity and its properties</h4></li>')
		self.response.write('<ul>')	
		self.response.write('<li>reuse_org_ID - the id portion of key of the Reuse_org entity to be updated, REQUIRED</li>')
		self.response.write('<li>name - stored as a StringProperty, REQUIRED</li>')
		self.response.write('<li>address - stored as a TextProperty</li>')
		self.response.write('<li>longitude - stored as a StringProperty</li>')
		self.response.write('<li>latitude - stored as a StringProperty</li>')
		self.response.write('<li>phone - stored as a StringProperty</li>')
		self.response.write('<li>webpage - stored as a StringProperty</li>')
		self.response.write('<li>hours - stored as a TextProperty</li>')
		self.response.write('<li>notes - stored as a TextProperty</li>')
		self.response.write('<li>items - stored as a list of KeyProperties (format is a urlsafe key)</li>')
		self.response.write('</ul>')	
		self.response.write('</ul>')	

		# /reuse_org/delete/<reuse_org_ID>
		self.response.write('<li><h2>')
		self.response.write(cgi.escape('/reuse_org/delete/<reuse_org_ID>'))
		self.response.write('</h2></li>')
		self.response.write('<ul>')
		self.response.write('<li><h4>HTTP DELETE deletes an entire Reuse_org entity from the datastore</h4></li>')
		self.response.write('<ul>')	
		self.response.write('<li>reuse_org_ID - The ID portion of the Reuse_org entity\'s key</li>')		
		self.response.write('</ul>')					
		self.response.write('</ul>')	
		
		# /reuse_org/search_by_item/<reuse_item_ID>
		self.response.write('<li><h2>')
		self.response.write(cgi.escape('/reuse_org/search_by_item/<reuse_item_ID>'))
		self.response.write('</h2></li>')
		self.response.write('<ul>')
		self.response.write('<li><h4>HTTP GET returns JSON object with all Reuse_org entities (in alphabetical order) which have a key reference to a the queried Reuse_item entity</h4></li>')
		self.response.write('<ul>')	
		self.response.write('<li>reuse_item_ID - The ID portion of the Reuse_item entity\'s key</li>')		
		self.response.write('</ul>')					
		self.response.write('</ul>')	
		
		# /reuse_item
		self.response.write('<li><h2>/reuse_item</h2></li>')
		self.response.write('<ul>')
		self.response.write('<li><h4>HTTP GET returns JSON object of all Resuse_item entities (in alphabetical order) with their property.</h4></li>')
		self.response.write('<li><h4>HTTP POST creates a new Reuse_item entity and returns a JSON object of the entity and its property</h4></li>')
		self.response.write('<ul>')
		self.response.write('<li>name - stored as a StringProperty, REQUIRED</li>')		
		self.response.write('</ul>')	
		self.response.write('<li><h4>HTTP PUT updates properties of an existing Reuse_item entity and returns a JSON object of the updated entity and its property</h4></li>')
		self.response.write('<ul>')	
		self.response.write('<li>reuse_item_ID - the id portion of key of the Reuse_item entity to be updated, REQUIRED</li>')
		self.response.write('<li>name - stored as a StringProperty, REQUIRED</li>')		
		self.response.write('</ul>')	
		self.response.write('</ul>')	

		# /reuse_item/delete/<reuse_item_ID>
		self.response.write('<li><h2>')
		self.response.write(cgi.escape('/reuse_item/delete/<reuse_item_ID>'))
		self.response.write('</h2></li>')
		self.response.write('<ul>')
		self.response.write('<li><h4>HTTP DELETE deletes all references to the Reuse_item in existing Reuse_org entities and deletes the Reuse_item entity from the datastore</h4></li>')
		self.response.write('<ul>')	
		self.response.write('<li>reuse_org_ID - The ID portion of the Reuse_item entity\'s key</li>')		
		self.response.write('</ul>')					
		self.response.write('</ul>')					

