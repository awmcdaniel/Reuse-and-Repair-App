{% include 'admin/header.php' %}

<!-- EDIT MODAL
================================================================= -->
<div class="modal fade" id="modal-edit-organization">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">EDIT</h4>
      </div>
      <div class="modal-body">

        <form>
          <input type="text" name="input_org_id" class="hidden">

          <div class="form-group">
            <label for="input_orgtype">Org. Type</label>
            <input type="text" class="form-control" id="input_orgtype" name="input_orgtype" placeholder="Organization Type">
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
                <input type="text" class="form-control" id="input_state" name="input_state" placeholder="State" maxlength="2">
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
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>



<!-- MAIN CONTAINER
================================================================= -->
<div class="container">

<div class="page-header">
  <h1>Organizations <small>List All</small></h1>
</div>

  <div class="panel panel-default">
    <div class="panel-body">
  <table class="table table-hover">
    <thead>
      <tr>
        <th>id</th>
        <th>Org. Type</th>
        <th>Name</th>
        <th>Address</th>
        <th>URL</th>
        <th>Phone#</th>
        <th>Notes</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    {% for item in results %}
      <tr id="org_{{item.id}}">
        <td id="org_id_{{item.id}}" class="row_org_id">{{ item.id }}</td>
        <td id="org_type_{{item.id}}" class="row_org_type">{{ item.org_type }}</td>
        <td id="org_name_{{item.id}}" class="row_org_name">{{ item.name }}</td>
        <td>
          {% if item.street1 is defined %}
            <span id="org_addr1_{{item.id}}" class="row_org_addr1">{{ item.street1 }} </span><br/>
          {% endif %}

          {% if item.street2 is defined %}
            <span id="org_addr2_{{item.id}}" class="row_org_addr2">{{ item.street2 }} </span><br/>
          {% endif %}

          <span id="org_city_{{item.id}}" class="row_org_city">{{ item.city }}</span>
          <span id="org_state_{{item.id}}" class="row_org_state">{{ item.state }}</span>,
          <span id="org_zip_{{item.id}}" class="row_org_zip">{{ item.zip_code }}
        </td>
        <td id="org_url_{{item.id}}" class="row_org_url">
          {% if item.webpage is defined %}
            <a href="{{ item.webpage }}">Website</a>
          {% endif %}
        </td>
        <td id="org_phone_{{item.id}}" class="row_org_phone">{{ item.phone }}</td>
        <td id="org_notes_{{item.id}}" class="row_org_notes">{{ item.notes }}</td>
        <td>
      <div class="btn-group btn-group-xs" role="group" aria-label="...">
        <button type="button" class="btn btn-warning edit-org-entry">
          <span class="glyphicon glyphicon-pencil" aria-hidden="true" data-toggle="modal" href='#modal-edit-organization'></span>
          <span class="hidden org_id">{{ item.id }}</span>
        </button>
        <button type="button" class="btn btn-danger delete-org-entry">
          <span class="glyphicon glyphicon-remove" aria-hidden="true" data-toggle="modal" href='#modal-delete-organization'></span>
        </button>
      </div>
        </td>

      </tr>
    {% endfor %}
    </tbody>

    </table>
    </div>
  </div>

</div>

{% include 'admin/footer.php' %}
