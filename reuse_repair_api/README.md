API

| METHOD | ROUTES | PARAMETERS | DESCRIPTION | OTHER REQUIREMENTS |
|--------|-----------------------|-----------------|---------------------------|--------------------------------|
| |
| GET | /itemcategories |  | returns list of all item categories |  |
| GET | /itemcatgory/{id} |  | returns one item category |  |
| POST | /itemcategory | description (varchar) | create a new category |  |
| PUT | /itemcategory/{id} | description (varchar) | updates entry if it exist |  |
| DELETE | /itemcategory/{id} |  | deletes entity if it exist |  |
| |
| GET | /items |  | returns list of all item entities |  |
| GET | /item/{id} |  | returns a specific item entity |  |
| POST | /item | name* (varchar), type (int), category (int) | create a new item entity | type must be id of an itemtype entity; category must be an id of an itemcategory entity |
| PUT | /item/{id} |  | updates an existing entity |  |
| DELETE | /item/{id} |  | delete an existing entity |  |
| |
| GET | /itemtypes |  | returns list of all itemtype entities |  |
| GET | /itemtype/{id} |  | returns a specific itemtype entity |  |
| POST | /itemtype | description* (varchar) | create a new itemtype entity |  |
| PUT | /itemtype/{id} | description* (varchar) | updates an existing entity |  |
| DELETE | /itemtype/{id} |  | delete an existing entity |  |
| |
| GET | /organizations |  | returns list of all organization entities |  |
| GET | /organization/{id} |  | returns one organization entity |  |
| POST | /organization | name*, org_type (int), name, street1, street2, city, state, zip, webpage, phone, notes, | create a new organization entity | all varchar except for org_type; org_type must be an id of itemtypes {reuse | repair} |
| PUT | /organization/{id} | description* (varchar) | updates an existing organization entity |  |
| DELETE | /organization/{id} |  | delete an existing organization entity |  |