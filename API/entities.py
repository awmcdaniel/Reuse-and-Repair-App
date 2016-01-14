# CS491 - Group 8
# Joseph Barlan, Rick Hasson, Adam McDaniel


from google.appengine.ext import ndb


# create subclass of ndb.Model with override of to_dict() method to return information to user
class Model(ndb.Model):
	def to_dict(self):
		dict = super(Model, self).to_dict()
		dict['key'] = self.key.id()
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
	
	def to_dict(self):
		dict = super(Reuse_org, self).to_dict()
		dict['items'] = [x.id for x in dict['items']]
		return dict
		
class Reuse_item(Model):
	name = ndb.StringProperty(required = True)
	

	
