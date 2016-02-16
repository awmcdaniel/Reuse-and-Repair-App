<!-- INSERT MODAL
================================================================= -->
<div class="modal fade" id="modal-insert-items">
  <div class="modal-dialog">

    <form id="form_insert_items" method="POST">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">INSERT</h4>
      </div>
      <div class="modal-body">

          <input type="text" name="id" class="hidden" disabled>
          <div class="form-group" id="form_container_category">
            <label for="input_category">Category</label>
            <select class="form-control" id="input_category" name="category">
            </select>
          </div>

          <div class="form-group">
            <label for="input_description" >Description</label>
            <input type="text" class="form-control" id="input_description" name="description" placeholder="Description">
          </div>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-success">Save changes</button>
      </div>
    </div>
    </form>

  </div>
</div>


<!-- DELETE MODAL
================================================================= -->
<div class="modal fade" id="modal-delete-items">
  <div class="modal-dialog">

    <form id="form_delete_items" method="POST">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">DELETE</h4>
      </div>
      <div class="modal-body">
        <input type="text" name="id" class="hidden">
        <div class="alert alert-danger" role="alert">
          <strong>WARNING! </strong> <br/>
          You are about to delete the <span class="label label-default" id="item_del_item"></span> item.
          This is permanent and cannot be undone once processed.
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="submit" class="btn btn-danger">Delete</button>
      </div>
    </div>
    </form>
  </div>
</div>
