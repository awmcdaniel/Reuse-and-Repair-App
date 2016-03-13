<!-- ADD/EDIT MODAL
================================================================= -->
<div class="modal fade" id="modal-edit-organization">
  <div class="modal-dialog">
  <form id="form_insert_organization" method="POST">
  <input type="text" name="{{csrf_key}}" value="{{csrf_token}}" class="hidden"></input>
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
            <input type="text" class="form-control" id="input_name" name="name" placeholder="Organization Name" required>
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
        <button type="submit" class="btn btn-success">Save changes</button>
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
    <input type="hidden" name="{{csrf_key}}" value="{{csrf_token}}"></input>
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




<!-- BUSINESS HOURS MODAL
================================================================= -->
<div class="modal fade" id="modal-insert-organizationhours">
  <div class="modal-dialog">
    <form method="PUT" id="form_insert_organizationhours">
      <input type="text" id="input_org_id" name="id" class="hidden">
      <input type="text" id="token" name="{{csrf_key}}" value="{{csrf_token}}" class="hidden">

      <div class="modal-content">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">BUSINESS HOURS</h4>
        </div><!-- modal-header -->

        <div class="modal-body">
          <div class="form-horizontal">
          <p class="bg-warning">Format: HH:MM:SS </p>


            <div class="form-group">
              <label class="col-sm-2 control-label"></label>
              <div class="col-sm-5">
                <label>Start</label>
              </div>
              <div class="col-sm-5">
                <label>End</label>
              </div>
            </div><!-- End Form Group-->


            <div class="form-group">
              <label class="col-sm-2 control-label">Monday</label>
              <div class="col-sm-5">
                <input type="time" step="1" class="form-control" name="mon_start">
              </div>
              <div class="col-sm-5">
                <input type="time" step="1" class="form-control" name="mon_end">
              </div>
            </div><!-- End Form Group-->

            <div class="form-group">
              <label class="col-sm-2 control-label">Tuesday</label>
              <div class="col-sm-5">
                <input type="time" step="1" class="form-control" name="tue_start">
              </div>
              <div class="col-sm-5">
                <input type="time" step="1" class="form-control" name="tue_end">
              </div>
            </div><!-- End Form Group-->

            <div class="form-group">
              <label class="col-sm-2 control-label">Wednesday</label>
              <div class="col-sm-5">
                <input type="time" step="1" class="form-control" name="wed_start">
              </div>
              <div class="col-sm-5">
                <input type="time" step="1" class="form-control" name="wed_end">
              </div>
            </div><!-- End Form Group-->

            <div class="form-group">
              <label class="col-sm-2 control-label">Thursday</label>
              <div class="col-sm-5">
                <input type="time" step="1" class="form-control" name="thu_start">
              </div>
              <div class="col-sm-5">
                <input type="time" step="1" class="form-control" name="thu_end">
              </div>
            </div><!-- End Form Group-->

            <div class="form-group">
              <label class="col-sm-2 control-label">Friday</label>
              <div class="col-sm-5">
                <input type="time" step="1" class="form-control" name="fri_start">
              </div>
              <div class="col-sm-5">
                <input type="time" step="1" class="form-control" name="fri_end">
              </div>
            </div><!-- End Form Group-->

            <div class="form-group">
              <label class="col-sm-2 control-label">Saturday</label>
              <div class="col-sm-5">
                <input type="time" step="1" class="form-control" name="sat_start">
              </div>
              <div class="col-sm-5">
                <input type="time" step="1" class="form-control" name="sat_end">
              </div>
            </div><!-- End Form Group-->

            <div class="form-group">
              <label class="col-sm-2 control-label">Sunday</label>
              <div class="col-sm-5">
                <input type="time" step="1" class="form-control" name="sun_start">
              </div>
              <div class="col-sm-5">
                <input type="time" step="1" class="form-control" name="sun_end">
              </div>
            </div><!-- End Form Group-->

          </div><!-- End Form Horizontal-->

        </div><!-- modal-body -->

        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-success">Save</button>
        </div><!-- modal-footer -->

      </div><!-- modal-content -->
    </form>
  </div><!-- modal-dialog -->
</div><!-- modal -->
