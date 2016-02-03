<!-- ADD/EDIT MODAL
================================================================= -->
<div class="modal fade" id="modal-edit-organization">
  <div class="modal-dialog">
  <form id="form_insert_organization" method="POST">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Edit Organization</h4>
      </div>
      <div class="modal-body">

          <input type="text" id="input_org_id" name="id" class="hidden">

          <div class="form-group" id="form_container_orgtype">
            <label for="input_orgtype">Org. Type</label>
            <select class="form-control" id="input_orgtype" name="org_type" p>
            </select>
          </div>

          <div class="form-group">
            <label for="input_name" >Name</label>
            <input type="text" class="form-control" id="input_name" name="name" placeholder="Organization Name">
          </div>

          <div class="form-group">
            <label for="input_addr1" >Address Line</label>
            <input type="text" class="form-control" id="input_addr1" name="street1" placeholder="Address Line1">
            <input type="text" class="form-control" id="input_addr2" name="street2" placeholder="Address Line2">
          </div>
          <div class="form-group form-inline">
            <div class="row">
              <div class="col-sm-4">
                <label for="input_city" >City</label>
                <input type="text" class="form-control" id="input_city" name="city" placeholder="City">
              </div>
              <div class="col-sm-4">
                <label for="input_state" >State</label>
                <select class="form-control" id="input_state" name="state" size="1">
                  <option value="AL">Alabama</option>
                  <option value="AK">Alaska</option>
                  <option value="AZ">Arizona</option>
                  <option value="AR">Arkansas</option>
                  <option value="CA">California</option>
                  <option value="CO">Colorado</option>
                  <option value="CT">Connecticut</option>
                  <option value="DE">Delaware</option>
                  <option value="DC">Dist of Columbia</option>
                  <option value="FL">Florida</option>
                  <option value="GA">Georgia</option>
                  <option value="HI">Hawaii</option>
                  <option value="ID">Idaho</option>
                  <option value="IL">Illinois</option>
                  <option value="IN">Indiana</option>
                  <option value="IA">Iowa</option>
                  <option value="KS">Kansas</option>
                  <option value="KY">Kentucky</option>
                  <option value="LA">Louisiana</option>
                  <option value="ME">Maine</option>
                  <option value="MD">Maryland</option>
                  <option value="MA">Massachusetts</option>
                  <option value="MI">Michigan</option>
                  <option value="MN">Minnesota</option>
                  <option value="MS">Mississippi</option>
                  <option value="MO">Missouri</option>
                  <option value="MT">Montana</option>
                  <option value="NE">Nebraska</option>
                  <option value="NV">Nevada</option>
                  <option value="NH">New Hampshire</option>
                  <option value="NJ">New Jersey</option>
                  <option value="NM">New Mexico</option>
                  <option value="NY">New York</option>
                  <option value="NC">North Carolina</option>
                  <option value="ND">North Dakota</option>
                  <option value="OH">Ohio</option>
                  <option value="OK">Oklahoma</option>
                  <option value="OR">Oregon</option>
                  <option value="PA">Pennsylvania</option>
                  <option value="RI">Rhode Island</option>
                  <option value="SC">South Carolina</option>
                  <option value="SD">South Dakota</option>
                  <option value="TN">Tennessee</option>
                  <option value="TX">Texas</option>
                  <option value="UT">Utah</option>
                  <option value="VT">Vermont</option>
                  <option value="VA">Virginia</option>
                  <option value="WA">Washington</option>
                  <option value="WV">West Virginia</option>
                  <option value="WI">Wisconsin</option>
                  <option value="WY">Wyoming</option>
                  <option value="NULL">Unknown</option>
                </select>
              </div>
              <div class="col-sm-4">
                <label for="input_zipcode" >Zip Code</label>
                <input type="text" class="form-control" id="input_zipcode" name="zip" placeholder="ZipCode" maxlength="11">
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="input_url" >URL</label>
            <input type="url" class="form-control" id="input_url" name="webpage" placeholder="https://">
          </div>
          <div class="form-group">
            <label for="input_phone" >Phone Number</label>
            <input type="text" class="form-control" id="input_phone" name="phone" placeholder="000-000-0000">
          </div>
          <div class="form-group">
            <label for="input_notes" >Notes</label>
            <input type="text" class="form-control" id="input_notes" name="notes" placeholder="">
          </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
    </div>
    </form>
  </div>
</div>

<!-- DELETE MODAL
================================================================= -->
<div class="modal fade" id="modal-delete-organization">
  <div class="modal-dialog">
    <form method="DELETE" id="form_delete_organization">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">DELETE</h4>
      </div>
      <div class="modal-body">
        <input type="text" id="input_org_id" name="id" class="hidden">
        <div class="alert alert-danger" role="alert">
          <strong>WARNING! </strong> <br/>
          You are about to delete the <span class="label label-default" id="org_del_item"></span> organization.
          This is permanent and cannot be undone once processed.
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-danger">Delete</button>
      </div>
    </div>
    </form>
  </div>
</div>


<!-- Add Item to Org
================================================================= -->
<div class="modal fade" id="modal-insert-organizationitem">
  <div class="modal-dialog">
    <form method="DELETE" id="form_insert_organizationitem">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">ADD ITEM</h4>
      </div>
      <div class="modal-body">
        <input type="text" id="input_org_id" name="id" class="hidden">

        <div class="tab-pane" id="org_items">
          <div class="alert alert-warning" role="alert">
            <strong>INFO! </strong>
            Item must already exist in the database to associate with a business. If you need to add a new item to the DB,
            select 'Items' in the Add/Edit dropdown above.
          </div>

        <div id="container_org_items">
          <input type="text" class="form-control"  id="input_org_items" name="items[]" value="" Placeholder="Service Items">
        </div>


        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-danger">Save</button>
      </div>
    </div>
    </form>
  </div>
</div>
