{% extends "admin/master.php" %}

{% block body_content %}

{% include 'admin/modals_organizations.php' %}

<!-- MAIN CONTAINER
================================================================= -->
<div class="container" id="body-organizations">

<div class="page-header">
  <h1>ORGANIZATIONS
    <button class="btn btn btn-primary" data-toggle="modal" href='#modal-edit-organization' id="btn_add_organizations">
        <i class="fa fa-plus-circle"></i> New Record
      </button>
  </h1>

</div>

  <table class="table table-hover" id="table_organizations">
    <thead>
      <tr>
        <th class="hidden-xs">TYPE</th>
        <th>BUSINESS</th>
        <th class="hidden-xs">ITEMS</th>
        <th class="hidden-xs"></th>
      </tr>
    </thead>
    <tbody id="tbody-organizations">
    {% for item in results %}
      <tr class="filter_{{item.org_type}}" id="record_{{item.id}}">
        <td id="org_type_{{item.id}}" class="col-md-1 hidden-xs">{{ item.org_type }}</td>
        <td class="col-md-3">
          <strong><span id="org_name_{{item.id}}" class="row_org_name">{{ item.name }}</span></strong><br/>
          {% if item.webpage is defined %}
            {% if (item.webpage|length) and (item.webpage is not null) %}
            <a href="{{ item.webpage }}" id="org_url_{{item.id}}" class="row_org_url" target="_blank">WWW</a>
            {% endif %}
          {% endif %}

          {% if item.phone is defined %}
            {% if (item.phone|length) and (item.phone is not null) %}
            <span id="org_phone_{{item.id}}" class="row_org_phone">{{ item.phone }}</span><br/>
            {% endif %}
          {% endif %}

          {% if (item.street_1 is not null) and (item.street_1|length) %}
            <span id="org_addr1_{{item.id}}" class="row_org_addr1">{{ item.street_1 }}</span><br/>
          {% endif %}

          {% if (item.street_2|length) and (item.street_2 is not null) %}
            <span id="org_addr2_{{item.id}}" class="row_org_addr2">{{ item.street_2 }}</span><br/>
          {% endif %}

          {% if (item.city|length) and (item.city is not null) %}
          <span id="org_city_{{item.id}}" class="row_org_city">{{ item.city }}</span>
          {% endif %}

          {% if (item.state|length) and (item.state is not null) %}
          <span id="org_state_{{item.id}}" class="row_org_state">{{ item.state }}</span>
          {% endif %}

          {% if (item.zip_code|length) and (item.zip_code is not null) %}
          <span id="org_zip_{{item.id}}" class="row_org_zip">{{ item.zip_code }}</span>
          {% endif %}


          {% if (item.notes|length) and (item.notes is not null) %}
          <br /><br />
            <span>Info:</span>
            <em>
              <span id="org_notes_{{item.id}}" class="row_org_note">{{ item.notes }}</span>
            </em>
          {% endif %}


        </td>
        <td class="col-md-7">

          {% for service in item.service_items %}
            <span class="label label-custom-item">{{ service }}</span>
          {% endfor %}

        </td>
        <td class="col-md-1">
          <div class="btn-group btn-group-xs" role="group" aria-label="...">
            <button class="btn edit-org-entry org_edit btn-gray-dark1" data-toggle="modal" href='#modal-edit-organization' data-record-id="{{item.id}}">
              <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
            </button>
            <a class="btn org_edit btn-gray-dark2" href="organizations/{{item.id}}">
              <span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span>
            </a>
            <button class="btn add-orghours-entry org_edit btn-gray-dark2" data-toggle="modal" href='#modal-insert-organizationhours' data-record-id="{{item.id}}" data-record-name="{{item.name}}">
              <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
            </button>
            <button class="btn delete-org-entry org_edit btn-gray-dark1" data-toggle="modal" href='#modal-delete-organization' data-record-id="{{item.id}}" data-record-name="{{item.name}}">
              <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
            </button>
          </div>
        </td>

      </tr>
    {% endfor %}
    </tbody>
    </table>

</div>

{% endblock %}
