<!-- INSERT MODAL
================================================================= -->
<div class="modal fade" id="modal-insert-itemcategories">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">INSERT</h4>
      </div>
      <div class="modal-body">
        <form id="form_insert_itemcategories" method="POST">
          <input type="text" name="id" class="hidden" disabled>
          <div class="form-group">
            <label for="input_description" >Description</label>
            <input type="text" class="form-control" id="input_description" name="description" placeholder="Description">
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" id="submit_itemcategory">Save changes</button>
      </div>
      </form>
    </div>
  </div>
</div>


<!-- DELETE MODAL
================================================================= -->
<div class="modal fade" id="modal-delete-itemcategories">
  <div class="modal-dialog">

    <form id="form_delete_itemcategories" method="DELETE">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">DELETE</h4>
      </div>
      <div class="modal-body">
        <input type="text" name="id" class="hidden">
        <div class="alert alert-danger" role="alert">
          <strong>WARNING! </strong> <br/>
          You are about to delete the <span class="label label-default" id="itemcat_del_item"></span> category.
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
