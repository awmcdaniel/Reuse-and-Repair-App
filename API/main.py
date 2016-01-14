# CS491 - Group 8
# Joseph Barlan, Rick Hasson, Adam McDaniel


import webapp2
from google.appengine.ext import ndb


# generic keys to be used as parent/ancestor keys 
config = {
	'ROOT_KEY_REUSE_ORGANIZATION': ndb.Key('Entity', 'reuse_organization_root'),
	'ROOT_KEY_REUSE_ITEM': ndb.Key('Entity', 'reuse_item_root'),
	'ROOT_KEY_REPAIR_ORGANIZATION': ndb.Key('Entity', 'repair_organization_root'),
	'ROOT_KEY_REPAIR_ITEM': ndb.Key('Entity', 'repair_item_root')
	}

# create instance of webapp2
app = webapp2.WSGIApplication([
    ('/', 'uri.URI')
], debug=True, config = config)

# reuse_org GET, POST, PUT
app.router.add(webapp2.Route(r'/reuse_org', 'reuse_org.Reuse_org'))
# reuse_org DELETE
app.router.add(webapp2.Route(r'/reuse_org/delete/<reuse_org_ID:[0-9]+>', 'reuse_org.Reuse_org'))

# reuse_item GET, POST, PUT
app.router.add(webapp2.Route(r'/reuse_item', 'reuse_item.Reuse_item'))
# reuse_item DELETE
app.router.add(webapp2.Route(r'/reuse_item/delete/<reuse_item_ID:[0-9]+>', 'reuse_item.Reuse_item'))
