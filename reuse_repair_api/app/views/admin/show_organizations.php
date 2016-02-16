{% extends "admin/master.php" %}

{% block body_content %}

{% include 'admin/modals_organizations.php' %}

<!-- MAIN CONTAINER
================================================================= -->
<div class="container" id="body-organizations">

<div class="page-header">
  <h1>Organizations
    <small>List All</small>
  </h1>
  <button class="btn btn btn-primary" data-toggle="modal" href='#modal-edit-organization' id="btn_add_organizations">
  <i class="fa fa-plus-circle"></i> New Record</button>
</div>

  <div class="panel panel-default">
    <div class="panel-body">
  <table class="table table-hover" id="table_organizations">
    <thead>
      <tr>
        <th class="hidden-xs">TYPE</th>
        <th>BUSINESS</th>
        <th class="hidden-xs">ITEMS</th>
        <th class="hidden-xs">NOTES</th>
        <th class="hidden-xs"></th>
      </tr>
    </thead>
    <tbody>
    {% for item in results %}
      <tr class="row_{{item.org_type}}" id="record_{{item.id}}">
        <td id="org_type_{{item.id}}" class="row_org_type col-md-1 hidden-xs">{{ item.org_type }}</td>
        <td class="col-md-3">
          <strong><span id="org_name_{{item.id}}" class="row_org_name">{{ item.name }} </span> </strong><br/>
          {% if (item.street1 is defined) and (item.street1 is not null) %}
            <span id="org_addr1_{{item.id}}" class="row_org_addr1">{{ item.street1 }} </span><br/>
          {% endif %}

          {% if item.webpage is defined %}
            {% if (item.webpage is not empty) and (item.webpage is not null) %}
            <a href="{{ item.webpage }}" id="org_url_{{item.id}}" class="row_org_url" target="_blank">Website</a> |

            {% endif %}
          {% endif %}

          {% if item.phone is defined %}
            {% if (item.phone is not empty) and (item.phone is not null) %}
            <span id="org_phone_{{item.id}}" class="row_org_phone ">{{ item.phone }}</span><br/>
            {% endif %}
          {% endif %}

          {% if (item.street2 is defined) and (item.street2 is not null) %}
            <span id="org_addr2_{{item.id}}" class="row_org_addr2">{{ item.street2 }} </span><br/>
          {% endif %}

          {% if (item.city is defined) and (item.city is not null) %}
          <span id="org_city_{{item.id}}" class="row_org_city">{{ item.city }}</span>
          {% endif %}

          {% if (item.state is defined) and (item.state is not null) %}
          <span id="org_state_{{item.id}}" class="row_org_state">{{ item.state }}</span>,
          {% endif %}

          {% if (item.zip_code is defined) and (item.zip_code is not null) %}
          <span id="org_zip_{{item.id}}" class="row_org_zip">{{ item.zip_code }}
          {% endif %}

        </td>
        <td class="col-md-4">

          {% for service in item.service_items %}
            <span class="label label-custom1">{{ service }}</span>
          {% endfor %}

        </td>
        <td class="col-md-3 hidden-xs">
          <span id="org_notes_{{item.id}}" class="row_org_note hidden-xs">{{ item.notes }}</span><br/>
        </td>
        <td class="col-md-1">
          <div class="btn-group btn-group-xs" role="group" aria-label="..." id="action_buttons">
            <button type="button" class="btn btn-primary edit-org-entry org_edit" data-toggle="modal" href='#modal-edit-organization' data-tooltip="tooltip" title="Edit Info">
              <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
              <span class="hidden org_id">{{ item.id }}</span>
            </button>
            <a class="btn btn-success org_edit" href="organizations/{{item.id}}" data-tooltip="tooltip" title="Edit Items">
              <span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span>
            </a>
            <button type="button" class="btn btn-warning add-orghours-entry org_edit" data-toggle="modal" href='#modal-insert-organizationhours' data-tooltip="tooltip" title="Edit Hours">
              <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
              <span class="hidden org_id">{{ item.id }}</span>
              <span class="hidden org_name">{{ item.name }}</span>
            </button>
            <button type="button" class="btn btn-danger delete-org-entry org_edit" data-toggle="modal" href='#modal-delete-organization' data-tooltip="tooltip" title="Delete">
              <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
              <span class="hidden org_id">{{ item.id }}</span>
              <span class="hidden org_name">{{ item.name }}</span>
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

{% endblock %}
