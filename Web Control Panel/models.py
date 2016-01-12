from google.appengine.ext import ndb

class OrganizationEntity(ndb.Model):
    name        = ndb.StringProperty()
    phone       = ndb.StringProperty()
    website     = ndb.StringProperty()
    address     = ndb.StringProperty()
    other_info  = ndb.StringProperty()
    category    = ndb.StringProperty(repeated=True) #Reuse and/or repair
    items       = ndb.StringProperty(repeated=True)
    created_on  = ndb.DateTimeProperty( auto_now=True )
    updated_on  = ndb.DateTimeProperty()
    