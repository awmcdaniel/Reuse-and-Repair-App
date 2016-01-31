{% include 'admin/header.php' %}

{% include 'admin/modals_organizations.php' %}

<!-- MAIN CONTAINER
================================================================= -->
<div class="container">

<div class="page-header">
  <h1>Organizations
    <small>List All</small>
    <button type="button" class="btn btn btn-primary btn-lg pull-right add-org-entry" data-toggle="modal" href='#modal-edit-organization'>ADD Organization</button>
  </h1>
</div>

  <div class="panel panel-default">
    <div class="panel-body">
  <table class="table table-hover">
    <thead>
      <tr>
        <th class="hidden-xs">id</th>
        <th>Org. Type</th>
        <th>Name</th>
        <th class="hidden-xs">Address</th>
        <th>URL</th>
        <th class="hidden-xs">Phone#</th>
        <th class="hidden-xs">Notes</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    {% for item in results %}
      <tr id="org_{{item.id}}">
        <td id="org_id_{{item.id}}" class="row_org_id hidden-xs">{{ item.id }}</td>
        <td id="org_type_{{item.id}}" class="row_org_type">{{ item.org_type }}</td>
        <td id="org_name_{{item.id}}" class="row_org_name">{{ item.name }}</td>
        <td class="hidden-xs">
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
        <td >
          {% if item.webpage is defined %}
            <a href="{{ item.webpage }}" id="org_url_{{item.id}}" class="row_org_url" target="_blank">Website</a>
          {% endif %}
        </td>
        <td id="org_phone_{{item.id}}" class="row_org_phone hidden-xs">{{ item.phone }}</td>
        <td id="org_notes_{{item.id}}" class="row_org_note hidden-xs">{{ item.notes }}</td>
        <td>
      <div class="btn-group btn-group-xs" role="group" aria-label="...">
        <button type="button" class="btn btn-warning edit-org-entry" data-toggle="modal" href='#modal-edit-organization'>
          <span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>
          <span class="hidden org_id">{{ item.id }}</span>
        </button>
        <button type="button" class="btn btn-danger delete-org-entry" data-toggle="modal" href='#modal-delete-organization'>
          <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
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
