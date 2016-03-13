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
<p>Choose the category below which best describes the item you'd like to donate/repair.</p>
</div>

  <table class="table table-hover" id="table-itemcategories">
    <thead>
      <tr>
        <th>Item Categories</th>
        <th></th>
      </tr>
    </thead>
    <tbody id="tbody-itemcategories">
    {% for item in results %}
      <tr id="record_{{item.id}}">
        <td class="col-md-11" id="itemcat_desc_{{item.id}}"><a href="items/{{ item.id }}" class="internal-link">{{ item.description }}</a></td>
        <td class="col-md-1" id="itemcat_action_{{item.id}}"></td>
      </tr>
    {% endfor %}
    </tbody>

    </table>


</div>

{% endblock %}