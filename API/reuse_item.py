# CS491 - Group 8
# Joseph Barlan, Rick Hasson, Adam McDaniel


import webapp2
import entities
from google.appengine.ext import ndb
import re
import json


class Reuse_item(webapp2.RequestHandler):
	# returns json object with all Reuse_item entities with all entity information
	def get(self):
		if 'application/json' not in self.request.accept:
			self.response.status = 406
			self.response.status_message = 'Not acceptable. API only supports application/json MIME type'
			self.response.write('Not acceptable. API only supports application/json MIME type')
			return
			
		# get all Reuse_item entities from the datastore
		query = entities.Reuse_item.query(ancestor = self.app.config.get('ROOT_KEY_REUSE_ITEM')).order(entities.Reuse_item.name).fetch()
		output = {}
		# create json object 
		for entity in query:
			output[entity.key.id()] = entity.to_dict()
		self.response.write(json.dumps(output))
		return
		
	# creates a Reuse_item entity	
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
			
		# check datastore for duplicate
		query = entities.Reuse_item.query(ancestor = self.app.config.get('ROOT_KEY_REUSE_ITEM')).fetch()
		for entity in query:
			if entity.name.lower() == self.request.get('name').lower():
				self.response.status = 400
				self.response.status_message = 'That Reuse_item name is already in the datastore'
				self.response.write('That Reuse_item name is already in the datastore')
				return			
			
		# create Reuse_item entity 
		new_entity = entities.Reuse_item(parent = self.app.config.get('ROOT_KEY_REUSE_ITEM'))
		new_entity.name = self.request.get('name')

		# save entity to datastore and return entity information to user
		new_entity_key = new_entity.put()
		output = new_entity.to_dict()
		self.response.write(json.dumps(output))
		return
		
	#  update an existing Reuse_item entity
	# requires the id of the Reuse_item entity being updated (variable = reuse_item_ID)		
	def  put(self):
		if 'application/json' not in self.request.accept:
			self.response.status = 406
			self.response.status_message = 'Not acceptable. API only supports application/json MIME type'
			self.response.write('Not acceptable. API only supports application/json MIME type')
			return
					
		# validate reuse_org_item and get Reuse_item entity to update
		reuse_item_ID = self.request.get('reuse_item_ID', None)
		if not reuse_item_ID or re.match('^[0-9]+$', reuse_item_ID) == None:
			self.response.status = 400
			self.response.status_message = 'reuse_item_ID is missing or invalid'
			self.response.write( 'reuse_item_ID is missing or invalid')
			return	
		reuse_entity = ndb.Key('Entity', 'reuse_item_root', 'Reuse_item', int(reuse_item_ID)).get()
		if not reuse_entity:
			self.response.status = 400
			self.response.status_message = 'reuse_item_ID is invalid'
			self.response.write( 'reuse_item_ID is invalid')
			return	
					
		# update entity values and save to datastore, returning new information to user
		# check for required name field and update entity if present
		if not self.request.get('name'):
			self.response.status = 400
			self.response.status_message = 'Required field: name'
			self.response.write('Required field: name')
			return
		reuse_entity.name = self.request.get('name')	
		
		# save entity and return information to user	
		reuse_entity.put()
		output = reuse_entity.to_dict()
		self.response.write(json.dumps(output))
		return
		
	# delete a Reuse_item entity from the datastore
	# requires the id of the Reuse_item entity being deleted (variable = resuse_item_ID)
	def delete(self, **kwargs):
		if 'application/json' not in self.request.accept:
			self.response.status = 406
			self.response.status_message = 'Not acceptable. API only supports application/json MIME type'
			self.response.write('Not acceptable. API only supports application/json MIME type')
			return
				
		if 'reuse_item_ID' not in kwargs:
			self.response.status = 400
			self.response.status_message = 'reuse_item_ID is missing or invalid'
			self.response.write('reuse_item_ID is missing or invalid')	
			return		
		
		# get Reuse_org entity to delete
		entity_to_delete = ndb.Key('Entity', 'reuse_item_root', 'Reuse_item', int(kwargs['reuse_item_ID'])).get()
		if not entity_to_delete:
			self.response.status = 400
			self.response.status_message = 'Invalid reuse_org_ID'
			self.response.write('Invalid reuse_org_ID')	
			return
			
		# delete Reuse_item key from all Reuse_org entities containing it in Reuse_org.items property
		query = entities.Reuse_org.query(ancestor = self.app.config.get('ROOT_KEY_REUSE_ORGANIZATION')).fetch()
		for entity in query:
			if len(entity.items) > 0:
				entity.items = [item for item in entity.items if item != entity_to_delete.key]
			entity.put()		
	
		# delete Reuse_org entity
		entity_to_delete.key.delete()
		self.response.write('Reuse_item entity with reuse_item_ID = ' + kwargs['reuse_item_ID'] + ' was successfully deleted from the datastore')			
		return		