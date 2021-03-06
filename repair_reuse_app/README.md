
###### ```BASE URL``` 	/api   
###### ```EXAMPLE ``` 	GET localhost:8080/api/item/2  


#### ItemCategories  
> **param:** description (varchar, required)  
>###### ```GET``` 		/itemcategories 
>###### ```GET``` 		/itemcatgory/{id}
>###### ```POST``` 		/itemcatgory  
>###### ```PUT``` 		/itemcategory/{id}     
>###### ```DELETE``` 	/itemcategory/{id}   


#### Items
>**param:** description* (varchar), type (int), category (int)  
>**other notes:**   type must be id of an itemtype entity; category must be an id of an itemcategory entity
>###### ```GET``` 		/items 
>###### ```GET``` 		/item/{id}
>###### ```POST``` 		/item 
>###### ```PUT``` 		/item/{id}
>###### ```DELETE``` 	/item/{id} 
  

#### OrganizationTypes
>**param:** description* (varchar) 
>###### ```GET``` 		/organizationtypes 
>###### ```GET``` 		/organizationtype/{id}
>###### ```POST``` 		/organizationtype
>###### ```PUT``` 		/organizationtype/{id}
>###### ```DELETE``` 	/organizationtype/{id} 

#### Organizations
>**param:** name, org_type (int), name, street1, street2, city, state, zip, webpage, phone, notes  
>**other notes:**   all varchar except for org_type; org_type must be an id of itemtypes {reuse | repair}
>###### ```GET``` 		/organizations
>###### ```GET``` 		/organization/{id}
>###### ```POST``` 		/organization
>###### ```PUT``` 		/organization/{id}
>###### ```DELETE``` 	/organization/{id} 

#### OrganizationItems
>**param:** org_id(int), item_id (int)  
>**other notes:**   org_id is an id of an Organization entity. item_id is an id of an Item entity.  
>###### ```GET``` 		/organizationitems  
>###### ```GET``` 		/organizationitem/{id}  
>###### ```POST``` 		/organizationitem  
>###### ```PUT``` 		/organizationitem/{id}  
>###### ```DELETE``` 	/organizationitem/{id}   
