#!/usr/bin/env python
#
# Copyright 2007 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
import os

from google.appengine.ext import ndb
import jinja2
import webapp2
from models import OrganizationEntity
from datetime import datetime


# Jinja environment instance necessary to use Jinja templates.
jinja_env = jinja2.Environment(loader=jinja2.FileSystemLoader(os.path.dirname(__file__)), autoescape=True)

# Generic key used to group into an entity group.
ROOT_KEY_REPAIR_ITEMS = ndb.Key("Entity", "repair_items_root")
ROOT_KEY_REUSE_ITEMS = ndb.Key("Entity", "reuse_items_root")
ROOT_KEY_ORGANIZATION = ndb.Key("Entity", "organization_root")


class HomePageHandler(webapp2.RequestHandler):
    def get(self):
        result_query = OrganizationEntity.query(ancestor=ROOT_KEY_ORGANIZATION).order(-OrganizationEntity.updated_on)
        template = jinja_env.get_template("templates/index.html")
        self.response.out.write(template.render({"organization_results": result_query}))

class AddNewEntry(webapp2.RequestHandler):
    def post(self):
        name = self.request.get("business_name")
        phone_number = self.request.get("phone_number")
        website = self.request.get("website")
        address = self.request.get("address")
        other_info = self.request.get("other_info")
        items = self.request.get_all("item")
        category = self.request.get_all("category")
        
        new_organization = OrganizationEntity(parent=ROOT_KEY_ORGANIZATION,
                                              name=name,
                                              phone=phone_number,
                                              website=website,
                                              address=address,
                                              other_info=other_info,
                                              category=category,
                                              items=items,
                                              updated_on=datetime.now()
                                              )
        new_organization.put()
        self.redirect(self.request.referer)

app = webapp2.WSGIApplication([
    ('/', HomePageHandler),
    ('/add_new_entry', AddNewEntry),
], debug=True)
