## PHP API  
  

#### ItemCategories  

>###### ```GET``` /itemcategories 
>###### ```GET``` /itemcatgory/{id}
>###### ```POST``` /itemcatgory  
>* **param:** description (varchar, required)   
>###### ```PUT``` /itemcategory/{id} 
>* **param:** description (varchar)     
>###### ```DELETE``` /itemcategory/{id}   



#### Items

>###### ```GET``` /items 
>###### ```GET``` /item/{id}
>###### ```POST``` /item 
>* **param:** name* (varchar), type (int), category (int)  
>* **other notes:**   type must be id of an itemtype entity; category must be an id of an itemcategory entity
>###### ```PUT``` /item/{id}
>* **param:**  name (varchar), type (int), category (int) 
>###### ```DELETE``` /item/{id} 
  


#### ItemTypes
>###### ```GET``` /itemtypes 
>###### ```GET``` /itemtype/{id}
>###### ```POST``` /itemtype
>* **param:** description* (varchar) 
>###### ```PUT``` /itemtype/{id}
>* **param:**  description* (varchar)
>###### ```DELETE``` /itemtype/{id} 


#### Organizations
>###### ```GET``` /organizations
>###### ```GET``` /organization/{id}
>###### ```POST``` /organization
>* **param:** name*, org_type (int), name, street1, street2, city, state, zip, webpage, phone, notes,  
>* **other notes:**   all varchar except for org_type; org_type must be an id of itemtypes {reuse | repair}
>###### ```PUT``` /organization/{id}
>* **param:**  description* (varchar)
>###### ```DELETE``` /organization/{id} 