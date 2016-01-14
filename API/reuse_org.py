# CS491 - Group 8
# Joseph Barlan, Rick Hasson, Adam McDaniel


import webapp2
import entities
from google.appengine.ext import ndb
import re
import json


class Reuse_org(webapp2.RequestHandler):
	# returns json object with all Reuse_org entities with all entity information
	def get(self):
		if 'application/json' not in self.request.accept:
			self.response.status = 406
			self.response.status_message = 'Not acceptable. API only supports application/json MIME type'
			self.response.write('Not acceptable. API only supports application/json MIME type')
			return
			
		# get all Reuse_org entities from the datastore
		query = entities.Reuse_org.query(ancestor = self.app.config.get('ROOT_KEY_REUSE_ORGANIZATION')).order(entities.Reuse_org.name).fetch()
		output = {}
		# create json object 
		for entity in query:
			output[entity.key.id()] = entity.to_dict()
		self.response.write(json.dumps(output))
		return
		
	# creates a Reuse_org entity	
	def post(self):
		if 'application/json' not in self.request.accept:
			self.response.status = 406
			self.response.status_message = 'Not acceptable. API only supports application/json MIME type'
			self.response.write('Not acceptable. API only supports application/json MIME type')
			return
		
		# make sure name has been submitted
		if not self.request.get('name'):
			self.response.status = 400
			self.response.status_message = 'Required field: name'
			self.response.write('Required field: name')
			return	
			
		# check validity of longitude
		longitude = self.request.get('longitude', None)
		if longitude:
			if re.match('^[-+]?[0-9]*\.?[0-9]+$', longitude) == None:
				self.response.status = 400
				self.response.status_message = 'Longitude must be a float between -180.0 and 180.0'
				self.response.write( 'Longitude must be a float between -180.0 and 180.0')
				return
			if longitude[0] == '+':
				longitude = longitude[1:]
			if float(longitude) < -180.0 or float(longitude) > 180.0:
				self.response.status = 400
				self.response.status_message = 'Longitude must be a float between -180.0 and 180.0'
				self.response.write( 'Longitude must be a float between -180.0 and 180.0')
				return								
		
		# check validity of latitude
		latitude = self.request.get('latitude', None)
		if latitude:
			if re.match('^[+]?[0-9]*\.?[0-9]+$', latitude) == None:
				self.response.status = 400
				self.response.status_message = 'Latitude must be a float between 0.0 and 90.0'
				self.response.write( 'Latitude must be a float between 0.0 and 90.0')
				return
			if latitude[0] == '+':
				latitude = latitude[1:]
			if float(latitude) < 0.0 or float(latitude) > 90.0:
				self.response.status = 400
				self.response.status_message = 'Latitude must be a float between 0.0 and 90.0'
				self.response.write('Latitude must be a float between 0.0 and 90.0')
				return
			
		# create Reuse_org entity 
		new_entity = entities.Reuse_org(parent = self.app.config.get('ROOT_KEY_REUSE_ORGANIZATION'))
		new_entity.name = self.request.get('name')
		new_entity.address = self.request.get('address')
		new_entity.longitude = longitude
		new_entity.latitude = latitude
		new_entity.phone = self.request.get('phone')
		new_entity.webpage = self.request.get('webpage')
		new_entity.hours = self.request.get('hours')
		new_entity.note = self.request.get('note')
		items = self.request.get_all('items')
		for item in items:
			# item will be a urlsafe key
			new_entity.items.append(ndb.Key(urlsafe = item))	

		# save entity to datastore and return entity information to user
		new_entity_key = new_entity.put()
		output = new_entity.to_dict()
		self.response.write(json.dumps(output))
		return
	
	#  update an existing Reuse_org entity
	# requires the id of the Reuse_org entity being updated (variable = reuse_org_ID)		
	def  put(self):
		if 'application/json' not in self.request.accept:
			self.response.status = 406
			self.response.status_message = 'Not acceptable. API only supports application/json MIME type'
			self.response.write('Not acceptable. API only supports application/json MIME type')
			return
					
		# validate reuse_org_ID and get Reuse_org entity to update
		reuse_org_ID = self.request.get('reuse_org_ID', None)
		if not reuse_org_ID or re.match('^[0-9]+$', reuse_org_ID) == None:
			self.response.status = 400
			self.response.status_message = 'reuse_org_ID is missing or invalid'
			self.response.write( 'reuse_org_ID is missing or invalid')
			return	
		reuse_entity = ndb.Key('Entity', 'reuse_organization_root', 'Reuse_org', int(reuse_org_ID)).get()
		if not reuse_entity:
			self.response.status = 400
			self.response.status_message = 'reuse_org_ID is invalid'
			self.response.write( 'reuse_org_ID is invalid')
			return	
					
		# update entity values and save to datastore, returning new information to user
		# check for required name field and update entity if present
		if not self.request.get('name'):
			self.response.status = 400
			self.response.status_message = 'Required field: name'
			self.response.write('Required field: name')
			return
		reuse_entity.name = self.request.get('name')	

 		# check validity of longitude and update entity if valid
 		longitude = self.request.get('longitude', None)
		if longitude:
			if re.match('^[-+]?[0-9]*\.?[0-9]+$', longitude) == None:
				self.response.status = 400
				self.response.status_message = 'Longitude must be a float between -180.0 and 180.0'
				self.response.write( 'Longitude must be a float between -180.0 and 180.0')
				return
			if longitude[0] == '+':
				longitude = longitude[1:]
			if float(longitude) < -180.0 or float(longitude) > 180.0:
				self.response.status = 400
				self.response.status_message = 'Longitude must be a float between -180.0 and 180.0'
				self.response.write( 'Longitude must be a float between -180.0 and 180.0')
				return
			reuse_entity.longitude = longitude								
		
		# check validity of latitude and update entity if valid
		latitude = self.request.get('latitude', None)
		if latitude:
			if re.match('^[+]?[0-9]*\.?[0-9]+$', latitude) == None:
				self.response.status = 400
				self.response.status_message = 'Latitude must be a float between 0.0 and 90.0'
				self.response.write( 'Latitude must be a float between 0.0 and 90.0')
				return
			if latitude[0] == '+':
				latitude = latitude[1:]
			if float(latitude) < 0.0 or float(latitude) > 90.0:
				self.response.status = 400
				self.response.status_message = 'Latitude must be a float between 0.0 and 90.0'
				self.response.write('Latitude must be a float between 0.0 and 90.0')
				return
			reuse_entity.latitude = latitude
			
		# update other values
		reuse_entity.address = self.request.get('address')
		reuse_entity.phone = self.request.get('phone')
		reuse_entity.webpage = self.request.get('webpage')
		reuse_entity.note = self.request.get('note')
		reuse_entity.hours = self.request.get('hours')
		itemIDs = self.request.get_all('items')
		reuse_entity.items = []
		for item in itemIDs:
			# item will be a urlsafe key		
			reuseEntity.item.append(ndb.Key(urlsafe = item))
		
		# save entity and return information to user	
		reuse_entity.put()
		output = reuse_entity.to_dict()
		self.response.write(json.dumps(output))
		return		
		
	# delete a Reuse_org entity from the datastore
	# requires the id of the Reuse_org entity being deleted (variable = resuse_org_ID)
	def delete(self, **kwargs):
		if 'application/json' not in self.request.accept:
			self.response.status = 406
			self.response.status_message = 'Not acceptable. API only supports application/json MIME type'
			self.response.write('Not acceptable. API only supports application/json MIME type')
			return
				
		if 'reuse_org_ID' not in kwargs:
			self.response.status = 400
			self.response.status_message = 'reuse_org_ID is missing or invalid'
			self.response.write('reuse_org_ID is missing or invalid')	
			return		
		
		# get Reuse_org entity to delete
		entity = ndb.Key('Entity', 'reuse_organization_root', 'Reuse_org', int(kwargs['reuse_org_ID'])).get()
		if not entity:
			self.response.status = 400
			self.response.status_message = 'Invalid reuse_org_ID'
			self.response.write('Invalid reuse_org_ID')	
			return			
	
		# delete Reuse_org entity
		entity.key.delete()
		self.response.write('Reuse_org entity with reuse_org_ID = ' + kwargs['reuse_org_ID'] + ' was successfully deleted from the datastore')			
		return
			
	
		