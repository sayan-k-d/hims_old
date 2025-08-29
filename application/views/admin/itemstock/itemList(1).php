<?php $currency_symbol = $this->customlib->getHospitalCurrencyFormat(); ?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"> <?php echo $this->lang->line('item_stock_list'); ?></h3>
                        <div class="box-tools pull-right">
                            <?php if ($this->rbac->hasPrivilege('item_stock', 'can_add')) { ?>
                                <a data-toggle="modal" data-target="#myModal" class="btn btn-primary btn-sm additemstock"><i class="fa fa-plus"></i> <?php echo $this->lang->line('add_item_stock'); ?></a>
                            <?php } ?>
                            <?php if ($this->rbac->hasPrivilege('issue_item', 'can_view')) { ?>
                                <a href="<?php echo base_url(); ?>admin/issueitem" class="btn btn-primary btn-sm"><i class="fa fa-reorder"></i> <?php echo $this->lang->line('issue_item'); ?> </a>  
                                <?php
                            }
                            if ($this->rbac->hasPrivilege('item', 'can_view')) {
                                ?>
                                <a href="<?php echo base_url(); ?>admin/item" class="btn btn-primary btn-sm"><i class="fa fa-reorder"></i> <?php echo $this->lang->line('item'); ?> </a> 
                            <?php } ?>
                        </div>
                    </div><!-- /.box-header -->					
                    <div class="box-body">
                        <div class="table-responsive mailbox-messages overflow-visible">
						 <?php if ($this->rbac->hasPrivilege('item_stock', 'can_view')) { ?>
                            <div class="download_label"><?php echo $this->lang->line('item_stock_list'); ?></div>
                            <table class="table table-hover table-striped table-bordered ajaxlist" data-export-title="<?php echo $this->lang->line('item_stock_list'); ?>">
                                <thead>
                                    <tr>
                                        <th><?php echo $this->lang->line('name'); ?></th>
                                        <th><?php echo $this->lang->line('category'); ?></th>
                                        <th><?php echo $this->lang->line('supplier'); ?></th>
                                        <th><?php echo $this->lang->line('store'); ?></th>
                                        <th><?php echo $this->lang->line('date'); ?></th>
                                        <th><?php echo $this->lang->line('description'); ?></th>
                                        <th><?php echo $this->lang->line('total_quantity'); ?></th>
                                        <th class="text-right"><?php echo $this->lang->line('purchase_price') ." (".$currency_symbol.")"; ?></th>      
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table><!-- /.table -->
							<?php } ?>
                        </div><!-- /.mail-box-messages -->
                    </div><!-- /.box-body -->					
                </div>
            </div><!--/.col (left) -->
            <!-- right column -->
        </div>       
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="follow_up">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content modal-media-content mx-2">
            <div class="modal-header modal-media-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><?php echo $this->lang->line('add_item_stock') ?></h4>
            </div>
            <form id="form1" action="#" name="itemstockform" method="post" enctype="multipart/form-data">
    <div class="modal-body scroll-area">
        <div class="pt-3 pb-3">
            <div class="row">

                <!-- CSRF Token Placeholder -->
                <input type="hidden" name="csrf_token" value="STATIC_CSRF_TOKEN_HERE" />

                <!-- Item Category -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="item_category_id">Item Category <small class="req">*</small></label>
                        <select autofocus id="item_category_id" name="item_category_id" class="form-control" autocomplete="off">
                            <option value="">Select</option>
                            <option value="1">Medical Equipment</option>
                            <option value="2">Medical Consumables &amp; Disposables</option>
                            <option value="4">Surgical Instruments</option>
                            <option value="5">General Supplies</option>
                        </select>
                        <span class="text-danger"></span>
                    </div>
                </div>

                <!-- Item -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="item_id">Item <small class="req">*</small></label>
                        <select id="item_id" name="item_id" class="form-control" autocomplete="off">
                            <option value="">Select</option>
                            <option value="5">Portable ECG Machine</option>
                            <option value="6">Digital Blood Pressure Monitor</option>
                        </select>
                        <span class="text-danger"></span>
                    </div>
                </div>

                <!-- Supplier -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="supplier_id">Supplier <small class="req">*</small></label>
                        <select id="supplier_id" name="supplier_id" class="form-control">
                            <option value="">Select</option>
                            <option value="1">Arjun</option>
                            <option value="3">SurgiMed Disposables</option>
                            <option value="4">TechHealth Instruments &amp; Devices</option>
                            <option value="5">OfficeMart Essentials</option>
                            <option value="6">SteriTech Medical Systems</option>
                        </select>
                        <span class="text-danger"></span>
                    </div>
                </div>

                <!-- Store -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="store_id">Store</label>
                        <select id="store_id" name="store_id" class="form-control">
                            <option value="">Select</option>
                            <option value="1">Main Store</option>
                            <option value="2">Surgical Store</option>
                            <option value="3">Pharmacy Store</option>
                        </select>
                        <span class="text-danger"></span>
                    </div>
                </div>

                <!-- Quantity -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="quantity">Quantity <small class="req">*</small> <span id="item_unit">(pcs)</span></label>
                        <div class="d-flex">
                            <select class="form-control" name="symbol" style="width: 20%;">
                                <option value="+">+</option>
                                <option value="-">-</option>
                            </select>
                            <input id="quantity" name="quantity" type="text" class="form-control ml-2" style="width: 80%;" />
                        </div>
                        <span class="text-danger"></span>
                    </div>
                </div>

                <!-- Purchase Price -->
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="purchase_price">Purchase Price <small class="req">*</small></label>
                        <input id="purchase_price" name="purchase_price" type="text" class="form-control" />
                        <span class="text-danger"></span>
                    </div>
                </div>

                <!-- Purchase Date -->
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="date">Purchase Date</label>
                        <input id="date" name="date" type="text" class="form-control" value="03/07/2025" readonly />
                        <span class="text-danger"></span>
                    </div>
                </div>

                <!-- Depreciation Fields: initially hidden -->
                <div class="col-md-12" id="depreciation-fields" style="display: none;">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="salvage_value">Salvage Value</label>
                                <input type="text" id="salvage_value" name="salvage_value" class="form-control" placeholder="Enter salvage value" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="useful_life">Useful Life (in years)</label>
                                <input type="text" id="useful_life" name="useful_life" class="form-control" placeholder="Enter useful life" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="annual_depreciation">Annual Depreciation</label>
                                <input type="text" id="annual_depreciation" name="annual_depreciation" class="form-control" placeholder="Enter depreciation amount" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6" id="expiry-date-field" style="display: none;">
                  <div class="form-group">
                    <label for="expiry_date">Expiry Date</label>
                    <input type="date" id="expiry_date" name="expiry_date" class="form-control" />
                  </div>
                </div>

                <!-- Description -->
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea class="form-control" id="description" name="description" rows="3" placeholder="Enter item details..."></textarea>
                        <span class="text-danger"></span>
                    </div>
                </div>

                <!-- Attach Document -->
                   
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="item_photo">Attach Document</label>
                        <input id="item_photo" name="item_photo" type="file" class="form-control" />
                        <span class="text-danger"></span>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Submit Button -->
    <div class="modal-footer">
        <div class="text-right w-100">
            <button type="submit" class="btn btn-info">
                <i class="fa fa-check-circle"></i> Save
            </button>
        </div>
    </div>
</form>



        </div>
    </div>
</div>

<div class="modal fade" id="editmyModal" tabindex="-1" role="dialog" aria-labelledby="follow_up">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content modal-media-content mx-2">
            <div class="modal-header modal-media-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><?php echo $this->lang->line('edit_item_stock'); ?></h4>
            </div>
            <form id="form1" action="#" name="itemstockform" method="post" enctype="multipart/form-data">
            <div class="scroll-area">
        <div class="pt-3 pb-3">
            <div class="row">

                <!-- CSRF Token Placeholder -->
                <input type="hidden" name="csrf_token" value="STATIC_CSRF_TOKEN_HERE" />

                <!-- Item Category -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="item_category_id">Item Category <small class="req">*</small></label>
                        <select autofocus id="item_category_id" name="item_category_id" class="form-control" autocomplete="off">
                            <option value="">Select</option>
                            <option value="1">Medical Equipment</option>
                            <option value="2">Medical Consumables &amp; Disposables</option>
                            <option value="4">Surgical Instruments</option>
                            <option value="5">General Supplies</option>
                        </select>
                        <span class="text-danger"></span>
                    </div>
                </div>

                <!-- Item -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="item_id">Item <small class="req">*</small></label>
                        <select id="item_id" name="item_id" class="form-control" autocomplete="off">
                            <option value="">Select</option>
                            <option value="5">Portable ECG Machine</option>
                            <option value="6">Digital Blood Pressure Monitor</option>
                        </select>
                        <span class="text-danger"></span>
                    </div>
                </div>

                <!-- Supplier -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="supplier_id">Supplier <small class="req">*</small></label>
                        <select id="supplier_id" name="supplier_id" class="form-control">
                            <option value="">Select</option>
                            <option value="1">Arjun</option>
                            <option value="3">SurgiMed Disposables</option>
                            <option value="4">TechHealth Instruments &amp; Devices</option>
                            <option value="5">OfficeMart Essentials</option>
                            <option value="6">SteriTech Medical Systems</option>
                        </select>
                        <span class="text-danger"></span>
                    </div>
                </div>

                <!-- Store -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="store_id">Store</label>
                        <select id="store_id" name="store_id" class="form-control">
                            <option value="">Select</option>
                            <option value="1">Main Store</option>
                            <option value="2">Surgical Store</option>
                            <option value="3">Pharmacy Store</option>
                        </select>
                        <span class="text-danger"></span>
                    </div>
                </div>

                <!-- Quantity -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="quantity">Quantity <small class="req">*</small> <span id="item_unit">(pcs)</span></label>
                        <div class="d-flex">
                            <select class="form-control" name="symbol" style="width: 20%;">
                                <option value="+">+</option>
                                <option value="-">-</option>
                            </select>
                            <input id="quantity" name="quantity" type="text" class="form-control ml-2" style="width: 80%;" />
                        </div>
                        <span class="text-danger"></span>
                    </div>
                </div>

                <!-- Purchase Price -->
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="purchase_price">Purchase Price <small class="req">*</small></label>
                        <input id="purchase_price" name="purchase_price" type="text" class="form-control" />
                        <span class="text-danger"></span>
                    </div>
                </div>

                <!-- Purchase Date -->
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="date">Purchase Date</label>
                        <input id="date" name="date" type="text" class="form-control" value="03/07/2025" readonly />
                        <span class="text-danger"></span>
                    </div>
                </div>

                <!-- Depreciation Fields (only for Medical Equipment) -->
                <div class="col-md-12" id="depreciation-fields" style="display: none;">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="salvage_value">Salvage Value</label>
                                <input type="text" id="salvage_value" name="salvage_value" class="form-control" placeholder="Enter salvage value" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="useful_life">Useful Life (in years)</label>
                                <input type="text" id="useful_life" name="useful_life" class="form-control" placeholder="Enter useful life" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="annual_depreciation">Annual Depreciation</label>
                                <input type="text" id="annual_depreciation" name="annual_depreciation" class="form-control" placeholder="Enter depreciation amount" />
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Expiry Date (only for Medical Consumables) -->


                <!-- Attach Document -->
                <div class="col-md-12" >
                    <div class="form-group">
                        <label for="expiry_date">Expiry Date</label>
                        <input type="date" id="expiry_date" name="expiry_date" class="form-control" />
                    </div>
                </div>

                <!-- Description -->
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea class="form-control" id="description" name="description" rows="3" placeholder="Enter item details..."></textarea>
                        <span class="text-danger"></span>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="item_photo">Attach Document</label>
                        <input id="item_photo" name="item_photo" type="file" class="form-control" />
                        <span class="text-danger"></span>
                    </div>
                </div>

            </div>
        </div>
    </div>

            <!-- Submit Button -->
            <div class="modal-footer">
        <div class="text-right w-100">
            <button type="submit" class="btn btn-info">
                <i class="fa fa-check-circle"></i> Save
            </button>
        </div>
    </div>
            </form>



        </div>
    </div>
</div>
<!-- JavaScript for dynamic field toggle -->
<script>
  document.getElementById('item_category_id').addEventListener('change', function () {
    const category = this.value;
    const depreciation = document.getElementById('depreciation-fields');
    const expiry = document.getElementById('expiry-date-field');

    // Show Depreciation fields for Medical Equipment
    if (category === '1') {
      depreciation.style.display = 'block';
      expiry.style.display = 'none';
    }
    // Show Expiry Date for Medical Consumables
    else if (category === '2') {
      depreciation.style.display = 'none';
      expiry.style.display = 'block';
    }
    // Hide both for all other categories
    else {
      depreciation.style.display = 'none';
      expiry.style.display = 'none';
    }
  });
</script>


<script>
    $(document).ready(function () {		
        $('.detail_popover').popover({
            placement: 'right',
            trigger: 'hover',
            container: 'body',
            html: true,
            content: function () {				
                return $(this).closest('td').find('.fee_detail_popover').html();
            }
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        var item_id_post = '<?php echo set_value('item_id') ?>';
        item_id_post = (item_id_post != "") ? item_id_post : 0;
        var item_category_id_post = '<?php echo set_value('item_category_id'); ?>';
        item_category_id_post = (item_category_id_post != "") ? item_category_id_post : 0;
        populateItem(item_id_post, item_category_id_post);
        var date_format = '<?php echo $result = strtr($this->customlib->getHospitalDateFormat(), ['d' => 'dd', 'm' => 'mm', 'Y' => 'yyyy',]) ?>';
		
        $('#date').datepicker({
            format: date_format,
            autoclose: true
        });

        $('.detail_popover').popover({
            placement: 'right',
            trigger: 'hover',
            container: 'body',
            html: true,
            content: function () {
                return $(this).closest('td').find('.fee_detail_popover').html();
            }
        });

        $(document).on('change', '#item_category_id', function (e) {
            $('#item_id').html("");
            var item_category_id = $(this).val();
            populateItem(0, item_category_id);
        });

        $(document).on('change', '#item_id', function (e) {
            var item_category_id = $(this).val();            
            $.ajax({
                type: "GET",
                url: base_url + "admin/itemstock/getItemunit",
                data: {'id': item_category_id},
                dataType: "json",
                success: function (data) {
                    $('#item_unit').html("<?php echo $this->lang->line('in'); ?>" + " " + data.unit);
                }
            });
        });

        $(document).on('change', '#edititem_category_id', function (e) {
            $('#edititem_id').html("");
            var item_category_id = $(this).val();
            populateItem(0, item_category_id, 'edititem_id');
        });
		
    });
    function populateItem(item_id_post, item_category_id_post, htmlid = 'item_id') {
        if (item_category_id_post != "") {
            $('#' + htmlid).html("");
            var base_url = '<?php echo base_url() ?>';
            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
            $.ajax({
                type: "GET",
                url: base_url + "admin/itemstock/getItemByCategory",
                data: {'item_category_id': item_category_id_post},
                dataType: "json",
                success: function (data) {
                    $.each(data, function (i, obj)
                    {
                        var select = "";
                        if (item_id_post == obj.id) {
                            var select = "selected=selected";
                        }
                        div_data += "<option value=" + obj.id + " " + select + ">" + obj.name + "</option>";
                    });
                    $('#' + htmlid).append(div_data);
                }
            });
		}
    }

    $(document).ready(function (e) {
        $('#form1').on('submit', (function (e) {
            $("#form1btn").button('loading');
            e.preventDefault();
            $.ajax({
                url: $(this).attr('action'),
                type: "POST",
                data: new FormData(this),
                dataType: 'json',
                contentType: false,
                cache: false,
                processData: false,
                success: function (data) {
                    if (data.status == "fail") {
                        var message = "";
                        $.each(data.error, function (index, value) {
                            message += value;
                        });
                        errorMsg(message);
                    } else {
                        successMsg(data.message);
                        window.location.reload(true);
                    }
                    $("#form1btn").button('reset');
                },
                error: function () {

                }
            });
        }));
    });

    $(document).ready(function (e) {

        $('#editform').on('submit', (function (e) {
            $("#editformbtn").button('loading');
            e.preventDefault();
            $.ajax({
                url: $(this).attr('action'),
                type: "POST",
                data: new FormData(this),
                dataType: 'json',
                contentType: false,
                cache: false,
                processData: false,
                success: function (data) {
                    if (data.status == "fail") {
                        var message = "";
                        $.each(data.error, function (index, value) {
                            message += value;
                        });
                        errorMsg(message);
                    } else {
                        successMsg(data.message);
                        window.location.reload(true);
                    }
                    $("#editformbtn").button('reset');
                },
                error: function () {

                }
            });
        }));
    });

    function get_data(id) {

        $.ajax({
            url: "<?php echo base_url() ?>admin/itemstock/edit/" + id,
            type: "POST",
            dataType: "json",
            success: function (res) {              
                $("#edititem_category_id").val(res.item_category_id);
                $("#edititem_id").val(res.item_id);
                $("#editsupplier_id").val(res.supplier_id);
                $("#editstore_id").val(res.store_id);                
                var text = res.quantity ;
                let letter = text.charAt(0);
                var result = text.slice(1);               
                
                if(letter == '-'){
                    
                    $("#edit_symbol").val(letter); 
                    $("#editquantity").val(result);
                    
                } else {
                
                    $("#editquantity").val(res.quantity);   
                    
                }
                
                $("#editdate").val(res.date);               
                $("#epurchase_price").val(res.purchase_price);
                $("#editdescription").text(res.description);
                $("#itemstockid").val(res.id);
                populateItem(res.item_id, res.item_category_id, 'edititem_id');
                $('#editmyModal').modal('show');
               
            }
        });
    }	

    function delete_record(id) {
        if (confirm('<?php echo $this->lang->line('delete_confirm'); ?>')) {
            $.ajax({
                url: '<?php echo base_url(); ?>admin/itemstock/delete/' + id,
                success: function (res) {
                    successMsg('<?php echo $this->lang->line('delete_message'); ?>');
                    window.location.reload(true);
                },
                error: function () {
                    alert("Fail")
                }
            });
        }
    }   

	$(".additemstock").click(function(){
		$('#form1').trigger("reset");
		$(".dropify-clear").trigger("click");
	});

    $(document).ready(function (e) {
        $('#myModal,#editmyModal').modal({
        backdrop: 'static',
        keyboard: false,
        show:false
        });
    });
</script>

<!-- //========datatable start===== -->
<script type="text/javascript">
( function ( $ ) {
    'use strict';
    $(document).ready(function () {
        initDatatable('ajaxlist','admin/itemstock/getitemstockDatatable',[],[],100);
    });
} ( jQuery ) )
</script>
<!-- //========datatable end===== -->