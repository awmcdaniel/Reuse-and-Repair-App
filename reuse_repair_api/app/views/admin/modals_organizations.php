<!-- ADD/EDIT MODAL
================================================================= -->
<div class="modal fade" id="modal-edit-organization">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Edit Organization</h4>
      </div>
      <div class="modal-body">

        <ul class="nav nav-pills nav-justified" id="nav_tabContent">
                <li class="active"><a href="#org_details" data-toggle="tab">Organization Details</a></li>
                <li><a href="#org_items" data-toggle="tab">Add Items</a></li>
        </ul>

        <form method="POST">
        <div class="tab-content">
        <div class="tab-pane active" id="org_details">
          <input type="text" name="input_org_id" class="hidden">

          <div class="form-group" id="form_container_orgtype">
            <label for="input_orgtype">Org. Type</label>
            <select class="form-control" id="input_orgtype" name="input_orgtype" p>
            </select>
          </div>
          <div class="form-group">
            <label for="input_name" >Name</label>
            <input type="text" class="form-control" id="input_name" name="input_name" placeholder="Organization Name">
          </div>
          <div class="form-group">
            <label for="input_addr1" >Address Line</label>
            <input type="text" class="form-control" id="input_addr1" name="input_addr1" placeholder="Address Line1">
            <input type="text" class="form-control" id="input_addr2" name="input_addr2" placeholder="Address Line2">
          </div>
          <div class="form-group form-inline">
            <div class="row">
              <div class="col-sm-4">
                <label for="input_city" >City</label>
                <input type="text" class="form-control" id="input_city" name="input_city" placeholder="City">
              </div>
              <div class="col-sm-4">
                <label for="input_state" >State</label>
                <select class="form-control" id="input_state" name="input_state" size="1">
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
                </select>
              </div>
              <div class="col-sm-4">
                <label for="input_zipcode" >Zip Code</label>
                <input type="text" class="form-control" id="input_zipcode" name="input_zipcode" placeholder="ZipCode" maxlength="11">
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="input_url" >URL</label>
            <input type="url" class="form-control" id="input_url" name="input_url" placeholder="https://">
          </div>
          <div class="form-group">
            <label for="input_phone" >Phone Number</label>
            <input type="text" class="form-control" id="input_phone" name="input_phone" placeholder="000-000-0000">
          </div>
          <div class="form-group">
            <label for="input_notes" >Notes</label>
            <input type="text" class="form-control" id="input_notes" name="input_notes" placeholder="">
          </div>

          </div>

          <div class="tab-pane" id="org_items">
          content
          </div>

          </div>
        </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<!-- DELETE MODAL
================================================================= -->
<div class="modal fade" id="modal-delete-organization">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">DELETE</h4>
      </div>
      <div class="modal-body">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-danger">Delete</button>
      </div>
    </div>
  </div>
</div>
