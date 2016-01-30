{% include 'admin/header.php' %}

<!-- MAIN CONTAINER
================================================================= -->
<div class="container">

<div class="page-header">
  <h1>Items <small>List All</small></h1>
</div>

  <div class="panel panel-default">
    <div class="panel-body">
  <table class="table table-hover">
    <thead>
      <tr>
        <th>id</th>
        <th>Category</th>
        <th>Description</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
    {% for item in results %}
      <tr>
        <td>{{ item.id }}</td>
        <td>{{ item.category }}</td>
        <td>{{ item.description }}</td>
        <td>
      <div class="btn-group btn-group-xs" role="group" aria-label="...">
        <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button>
        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
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
