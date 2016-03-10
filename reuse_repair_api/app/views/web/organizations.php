{% extends "web/master.php" %}

{% block body_content %}

<!-- MAIN CONTAINER
================================================================= -->
<div class="container">

<div class="page-header">
<a href="http://sustainablecorvallis.org/"><img src="http://sustainablecorvallis.org/wp-content/uploads/2014/07/header_new3.png" style="float: left;"></a>
<br>
  <h1>&nbsp;&nbsp;Reuse + Repair Directory</h1>
<br>
<br>
<p>The organizations below accept the item you selected for reuse/repair.</p>
</div>

  <table class="table" id="table_organizations">
    <thead>
      <tr>
        <th>Type</th>
        <th>Organization</th>
        <th>Address</th>
        <th>Website</th>
      </tr>
    </thead>
    <tbody id="tbody-organizations">
    {% for item in results %}
      <tr class="filter_{{item.org_type}}" id="record_{{item.id}}">
        <td id="org_type_{{item.id}}" class="col-md-1 hidden-xs">{{ item.org_type }}</td>
        <td class="col-md-3">
          <strong><span id="org_name_{{item.id}}" class="row_org_name">{{ item.name }}</span></strong><br/>
          {% if item.phone is defined %}
            {% if (item.phone|length) and (item.phone is not null) %}
            <span id="org_phone_{{item.id}}" class="row_org_phone">{{ item.phone }}</span><br/>
            {% endif %}
          {% endif %}

          {% if (item.notes|length) and (item.notes is not null) %}
          <br /><br />
            <span>Info:</span>
            <em>
              <span id="org_notes_{{item.id}}" class="row_org_note">{{ item.notes }}</span>
            </em>
          {% endif %}
        </td>
        <td class="col-md-3">
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
        </td>
        <td class="col-md-2">
          {% if item.webpage is defined %}
            {% if (item.webpage|length) and (item.webpage is not null) %}
            <a href="{{ item.webpage }}" id="org_url_{{item.id}}" class="external-link" target="_blank">{{ item.name }} Website</a>
            {% endif %}
          {% endif %}
        </td>
      </tr>
    {% endfor %}
    </tbody>
    </table>

</div>

{% endblock %}