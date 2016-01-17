# CS491 - Group 8
# Joseph Barlan, Rick Hasson, Adam McDaniel


from google.appengine.ext import ndb
#import datetime


# create subclass of ndb.Model with override of to_dict() method to return information to user
class Model(ndb.Model):
	def to_dict(self):
		dict = super(Model, self).to_dict()
		dict['key'] = self.key.urlsafe()
		return dict	
		
class Reuse_org(Model):
	name = ndb.StringProperty(required = True)
	address = ndb.TextProperty(default = None)
	longitude = ndb.StringProperty(default = None)
	latitude = ndb.StringProperty(default = None)
	phone = ndb.StringProperty(default = None)
	webpage = ndb.StringProperty(default = None)
	hours = ndb.TextProperty(default = None)
	items = ndb.KeyProperty(repeated = True)
	note = ndb.TextProperty(default = None)
	created = ndb.DateTimeProperty	(default = None)
	updated = ndb.DateTimeProperty(default = None)
	updated_by = ndb.StringProperty(default = None)
	
	def to_dict(self):
		dict = super(Reuse_org, self).to_dict()
		dict['items'] = [x.key.urlsafe() for x in dict['items']]
		dict['created'] = str(dict['created'])
		dict['updated'] = str(dict['updated'])
		return dict
		
class Reuse_item(Model):
	name = ndb.StringProperty(required = True)
	created = ndb.DateTimeProperty(default = None)
	updated = ndb.DateTimeProperty(default = None)
	updated_by = ndb.StringProperty(default = None)
	
	def to_dict(self):
		dict = super(Reuse_item, self).to_dict()
		dict['created'] = str(dict['created'])
		dict['updated'] = str(dict['updated'])
		return dict
