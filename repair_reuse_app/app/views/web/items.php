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
<p>Choose the item below which best describes the item you'd like to donate/repair.</p>
</div>

  <table class="table table-hover" id="table-itemcategories">
    <thead>
      <tr>
        <th>Category</th>
        <th>Item</th>
      </tr>
    </thead>
    <tbody id="tbody-items">
    {% for item in results %}
      <tr class="filter_{{item.category_id}}" id="record_{{item.id}}">
        <td class="col-md-4" id="item_category_{{item.id}}" >{{ item.category }}</td>
        <td class="col-md-7" id="item_desc_{{item.id}}" ><a href="/web/organizations/{{ item.id }}" class="internal-link">{{ item.description }}</a></td>
      </tr>
    {% endfor %}
    </tbody>

    </table>


</div>

{% endblock %}