<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet" href="../dist/themes/default/style.min.css" />
<link rel="stylesheet" href="../../../dist/themes/default-dark/style.min.css"> 

 <script src="../assets/jquery.min.js"></script> 
 <script src="../assets/dist/jstree.min.js"></script>
<script src="../js/jstree.dnd.js"></script> 


 
  <script>
$(function () {
	 var current_position;
	 var current_node_parent;
	  $("#jstree-proton-1").jstree({
	    "core" : {
	      //"check_callback" : true	      
	      "check_callback": function(operation, node, node_parent, node_position) {
	    	console.log("Entered check call back.......");
	        var check_passed = true;
	       
	        switch(operation) {
	            case "move_node":
	                //console.log("move_node");
	                //console.log("Node  : "+node);
	                //console.log("Node_parent  : "+node_parent);
	                console.log("Node_position  : "+node_position);
	                console.log("Node_parent  : "+node_parent);
	                var some_checks = true;
	                if(some_checks) {
	                    check_passed = true;	                    
	                }
	                break;
	        }
	        current_position = node_position;
	        current_node_parent = node_parent;
	        return check_passed;
	    }
	    },
	    "plugins" : [ "dnd" ],
	    
	  });
	  
	  var sourceElementID = "";
	  var destinationElementID = "";
	  debugger;
	  $(document).on('dnd_start.vakata', function (e, data) {	
		  debugger;
		  console.log("Source Data :"+data);
		  sourceElementID = $(data.element).attr('id');
		  console.log("sourceElementID is "+sourceElementID);
		});
	  $(document).on('dnd_stop.vakata', function (e, data) {
		  debugger;
		  console.log("destination data is "+data);	
		  console.log("destination data target is "+$(data.event.target));	
		  if(data.event && data.event.target){
		  destinationElementID = $(data.event.target).attr('id');
		  
		 
		  console.log("Current position is : "+current_position);
		  console.log("Current node parent  is : "+current_node_parent);
		  console.log(current_node_parent);
		  if(current_node_parent){
			  if(current_node_parent.a_attr){
				  if(current_node_parent.a_attr){
				  	console.log("Parent Id is : " + current_node_parent.a_attr.id);
				  	destinationElementID = current_node_parent.a_attr.id;
				  	
				  }
			  }
		  }
		  //call the update function
		  console.log("destinationElementID is "+destinationElementID);	
		  if(destinationElementID.length==10&&destinationElementID!=sourceElementID){
			  console.log(destinationElementID.length+" "+sourceElementID+" "+destinationElementID+" "+current_position); 
			  
			  $('#spinTree').click();
			 
				$.ajax({
				      type: "POST",
				      url : "jstree",
				      data : {"sourceElementID":sourceElementID,"destinationElementID":destinationElementID,"position":current_position},
				      success :function(result) {
				    	  
				    	  success(result);	
				    	  $('#jstreeSpin').hide();
				    	  $('.lean-overlay').css({display:'none'});
				    	  $("body").css("overflow", "auto");
				     },
				     error : function(error) {
				    	console.log(error);
				    	 $('#jstreeSpin').hide();
				    	  $('.lean-overlay').css({display:'none'});
				    	  $("body").css("overflow", "auto");
				     } 
				      
				     

				  }); 	 	          
		  }
		  }
		  
		});
	  $(document).on("move_node.jstree", function(node,nodes){
		    console.log("node : "+nodes.node.id);
		    console.log("parent : "+nodes.node.parent);
		    console.log("position : "+nodes.position);
		});

	});
	
 
</script>
  
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<title>${userName } Page | eGSD Admin Template</title>


<!-- CORE CSS-->

<link rel="stylesheet" href="../dist/themes/proton/style.min.css" />


<script src="../assets/jquery-1.10.2.min.js"></script>

<script src="../assets/dist/jstree.js"></script>


	<script type="text/javascript" src="../js/jscolor.js"></script>
<script type="text/javascript" src="../styles/js/boot.js"></script>

<!-- html editor -->
<link type="text/css" rel="stylesheet" href="../styles/css/materialize.min.css"  media="screen,projection"/>
      <link type="text/css" rel="stylesheet" href="../styles/css/cust.css" />
		 <link href="../styles/css/app.css" rel="stylesheet">
        <!--  <link href="../styles/vendors/bower_components/material-design-iconic-font/dist/css/material-design-iconic-font.min.css" rel="stylesheet">
        <link href="../styles/vendors/summernote/dist/summernote.css" rel="stylesheet"> -->
        
<!-- <script src="http://tinymce.cachefly.net/4.1/tinymce.min.js"></script> -->
<script src="../styles/tinymce-dist-master/tinymce.js"></script>
<script type="text/javascript">
tinymce.init({
  selector: "textarea",
  height: 150,
  plugins: [
    "advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
    "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
    "table contextmenu directionality emoticons template textcolor paste fullpage textcolor colorpicker textpattern"
  ],

  //toolbar1: "newdocument fullpage | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect",
  //toolbar2: "cut copy paste | searchreplace | bullist numlist | outdent indent blockquote | undo redo | link unlink anchor image media code | insertdatetime preview | forecolor backcolor",
  //toolbar3: "table | hr removeformat | subscript superscript | charmap emoticons | print fullscreen | ltr rtl | spellchecker | visualchars visualblocks nonbreaking template pagebreak restoredraft",
  
  toolbar1: "bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect fontselect fontsizeselect",
  toolbar2: "cut copy paste | searchreplace | bullist numlist | outdent indent blockquote | undo redo | link unlink anchor code | insertdatetime preview | forecolor backcolor",
  toolbar3: "table | hr removeformat | subscript superscript | charmap emoticons | fullscreen | ltr rtl | spellchecker | visualchars visualblocks nonbreaking template pagebreak",

  menubar: false,
  toolbar_items_size: 'small',

  style_formats: [{
    title: 'Bold text',
    inline: 'b'
  }, {
    title: 'Red text',
    inline: 'span',
    styles: {
      color: '#ff0000'
    }
  }, {
    title: 'Red header',
    block: 'h1',
    styles: {
      color: '#ff0000'
    }
  }, {
    title: 'Example 1',
    inline: 'span',
    classes: 'example1'
  }, {
    title: 'Example 2',
    inline: 'span',
    classes: 'example2'
  }, {
    title: 'Table styles'
  }, {
    title: 'Table row 1',
    selector: 'tr',
    classes: 'tablerow1'
  }],

  templates: [{
    title: 'Test template 1',
    content: 'Test 1'
  }, {
    title: 'Test template 2',
    content: 'Test 2'
  }],
  
});
</script>

<script>
	$(function() {
		$('#jstree-proton-1').jstree({
			
			"plugins" : [ "search" ],
			'core' : {
				'themes' : {
					'name' : 'proton',
					'responsive' : true
				}
			},

		});
		var to = false;
		  $('#plugins4_q').keyup(function () {
		    if(to) { clearTimeout(to); }
		    to = setTimeout(function () {
		      var v = $('#plugins4_q').val();
		      $('#jstree-proton-1').jstree(true).search(v);
		    }, 250);
		  });
	});
	
	
	
	
	
</script>

<style>
	@media (max-width: 1280px) and (min-width: 768px) {   
	
		.addDirectoryItemButton {
			margin-top:15px !important;
		}
		.customSubmitButton {
			margin-left:65% !important;
		}
		.customMenuSubmitButton {
			margin-left:72% !important;
		}
	}
	
	@media (max-width: 1280px) and (min-width: 600px) {   
			
		.qrcodeCSS {
			padding:0 0px 0 0 !important;
		}
	}
	
	
</style>

</head>

<body class="loaded" onload="bodyLoad()"
	style="font-family: 'Open Sans', sans-serif;background-color:white">
	
	<a href="#updateAdmin" class="modal-trigger" id="updateAdminhref"
	    style="font-size: 1rem; display:none;padding: 0.5rem 0.5rem;">Edit Profile</a>
	    
	    <a href="#changePassword" class="modal-trigger" id="changePasswordhref"
	    style="font-size: 1rem; display:none;padding: 0.5rem 0.5rem;">Change Password</a>
	
	<a href="#superAdmin" class="modal-trigger" id="asAdminhref"
	    style="font-size: 1rem; display:none;padding: 0.5rem 0.5rem;">Add Super Admin User</a>
	    
	 <a href="#csAdmin" class="modal-trigger" id="csAdminhref"
    	style="font-size: 1rem;display:none; padding: 0.5rem 0.5rem;">Add CS Admin User</a>
    	
     <a href=".locationAdmin" class="modal-trigger " id="locationAdmin"
    	style="font-size: 1rem;display:none; padding: 0.5rem 0.5rem;">Add Hotel Admin User</a>
    	
     <a href="#groupHotel" class="modal-trigger" id="grouphref"
		style="font-size: 1rem;display:none; padding: 0.5rem 0.5rem;">Add Group</a>
		
	 <a href="#addHotel" class="modal-trigger" id="hotelhref"
		style="font-size: 1rem;display:none; padding: 0.5rem 0.5rem;">Add Hotel</a>
		
	 <a href="#createTemplate" class="modal-trigger" id="templatehref"
		style="font-size: 1rem;display:none; padding: 0.5rem 0.5rem;">Create New Template</a>

	<div class="navbar-fixed cyan">
		<ul id="dropdown1" class="dropdown-content">
			<li><a  id="updateAdminDetails"style="font-size: 1rem; padding: 0.5rem 0.5rem;">Manage My User Profile</a></li>  
			<li><a  id="changePasswordDetails"style="font-size: 1rem; padding: 0.5rem 0.5rem;">Change My Password</a></li>
			<!-- <li><a id="asAdmin" style="font-size: 1rem; padding: 0.5rem 0.5rem;">Add Super Admin User</a></li>   		
			<li><a  id="acAdmin" style="font-size: 1rem; padding: 0.5rem 0.5rem;">Add CS Admin User</a></li> 
   			<li style="min-height:31px"><a id="alAdmin"	style="font-size: 1.5rem; padding:9px 0 9px 17px;">Add Hotel Admin User</a></li>
   			<li style="min-height:31px"><a href="#modal4" class="modal-trigger searchUsers"
				style="font-size: 1.5rem; padding:9px 0 9px 17px;">Manage Users</a></li>
   			<li style="min-height:31px"> <a id="agroup"	style="font-size: 1rem; padding:9px 0 9px 17px;">Create Hotel Group</a></li>
    		<li style="min-height:31px"><a href="#modal3" class="modal-trigger skipGroup"
				style="font-size: 1.5rem; padding:9px 0 9px 17px;">Manage Hotel Groups</a></li> 
			<li><a id="ctemplate" style="font-size: 1.5rem; padding:9px 0 9px 17px;">Create Template</a></li>
			<li style="min-height:31px"><a href="#modal2" class="modal-trigger skipTemplate"
				style="font-size: 1.5rem; padding:9px 0 9px 17px;">Manage Templates</a></li>
			<li style="min-height:31px"><a id="ahotel"	style="font-size: 1rem; padding:9px 0 9px 17px;">Create Hotel</a></li> -->
			<li style="min-height:31px"><a style="font-size: 1.5rem; padding:9px 0 9px 17px;" class="modal-trigger skipSelection" 
				href="#modal1">Manage Hotel Directory(s)</a></li> 
			
			
			
			
			
			
			<p class="divider"></p>
			<li style="min-height:31px"><a href="/egsdAdminApp/"
				style="font-size: 1.5rem; padding:9px 0 9px 17px;">Logout</a></li>
		</ul>
		<nav class="cyan" style="padding:0 5% 0 4%">
		<div class="nav-wrapper">
			
				<span class="brand-logo">
					<a href="./home?userName=${userName}&user=${user}" > <img src="../img/logo.png" style="width: 100%; padding-top: 7px;"> </a>
				</span>
			<ul class="right hide-on-med-and-down">

				<li><a class="dropdown-button" href="#!"
					data-activates="dropdown1" style="min-width: 150px;font-size:14px;color:white;">${user} (${userName })<i
						class="material-icons right" style="font-size: 30px;">arrow_drop_down</i></a></li>
			</ul>
		</div>
		</nav>
	</div>
	<br />
	
	
	<input type="hidden" id="numberOfImages" value="${totalImages}"/>
	<input type="hidden" id="uploadDefaultSize" value="${imageSize }">
	<input type="hidden" id="totalImagesSize" value="${totalImagesLimit}">
		
 
 <div id="modal29" class="modal checkbox_input"
		style="overflow: auto; width: 80%;margin-top:0%">
		
			
			
				<div class="modal-content ">

					<div style='margin:-4% 0% 0% 47%;display:none' class='preloader-wrapper small active'>
						<div class='spinner-layer spinner-green-only'>
							<div class='circle-clipper left'>
								<div class='circle'>
								</div>
							</div>
							<div class='gap-patch'>
								<div class='circle'></div>
							</div>
							<div class='circle-clipper right'>
								<div class='circle'></div>
							</div>
						</div>
					</div>
					<span style="margin:2% 0 0 72%" class="customMenuSubmitButton">
							<span id="hotemMItems">
			    				
			    			</span>
								<a href="#" onclick="closeDiv()"
							class="waves-effect waves-green modal-action modal-close waves-effect waves-light btn "
							style="color: white;width: 100px; background-color: #26a69a;!important">CANCEL</a>	
									
								
						</span>
					<center>
						<h5 id="locationtext">Menu Items</h5>
					</center>

					<div class="main">
						<div class="table">
							<table >
								<thead>
									<tr style="width: 81%;">
										<th data-field="show" style="width: 5%;">Show
											
										</th>
										<th data-field="menu" style="width: 11%;">Menu Description
											
										</th>
										<th data-field="swque" style="width: 11%;">Menu Sequence
											
										</th>
										<th data-field="icon" style="width: 11%;">Icon
											
										</th>
										<th data-field="show" style="width: 5%;">Show
											
										</th>
										<th data-field="swque" style="width: 11%;display:none">Menu Sequence
											
										</th>
										<th data-field="sequence" style="width: 11%;">Icon
											Sequence
											
										</th>
										<th data-field="sequence" style="width: 17%;">Action Type
											
											
										</th>
										<th data-field="item" style="width: 15%;">Item Action
											
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										
									</tr>
									
									<tr>
										<td></td>
										<td id="menuDesc0009">Home</td>
										<td><div id="dvPassport0009" style="display: none">
												<input type="text" maxlength="1" id="quantity0009"
													placeholder="Enter Number" onkeypress="return isNumber(event)" 
													style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 95px;" " />
											</div>
											<span id="dvPa9"></span>
											</td>
										<td><i class="large material-icons"><image
													src="../img/home.png" class="img-rounded"
													style="height: 50px"></i></td>
										<td>
										<td><div id="dvPassport80" style="display: none">
												<input type="text" maxlength="1" id="quantity10" 
													placeholder="1" onkeypress="return isNumber(event)"
													style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 95px;" " />
											</div>
											<span id="dvPa19"></span>
											</td>
										<td>
											
										</td>
										<td>
										</td>

									</tr>
									
									<tr>
										<td><input type="checkbox" id="test0000"
											onclick="clicking0000()"
											style="background-color: green; color: green" /></td>
										<td id="menuDesc0000">House Phone</td>
										<td><div id="dvmenu0000" style="display: none">
												<input type="text" maxlength="1" id="quantity0000" onkeypress="return isNumber(event)"
													placeholder="1" value="1"
													style="width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 95px; margin-top: 19px;" />


											</div>
											<span id="dvPa1"></span>
											</td>
											
										<td><i class="large material-icons">call</i></td>
										<td><input type="checkbox" maxlength="1" id="icon0000"
											onclick="clicking00()" /></td>
										<td id="iconDesc0000" style="display:none">House Phone</td>
										<td>										
										<div id="dvicon0000" style="display: none">
												<input type="text" id="quantity0" maxlength="1"
													placeholder="1" onkeypress="return isNumber(event)" value="1"
													style="width: 170px; font-size: 14px; background: white; margin-top: 19px; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 95px;" />
											</div>
											<span id="dvPa11"></span>
											</td>
										<td>
											<select class="browser-default" id="actionType0" required style="width:92%;height:26px;padding-top:3px;margin-top:5px"  name="templateId">
												<option value="Select Action Type" >Select Action Type</option>
												<option value="Phone Number" >Phone Number</option>
												<option value="Directory Link" >Directory Link</option>
												<option value="URL" >URL</option>
												
											</select>
										</td>
										<td><input type="text" id="itemAction0000" 
											style="width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; margin-top: 19px; color: #666; outline: none; height: 23px; width: 120px;" "/>
											<span id="actionErr0" style="font-size:13px;color:red"></span>
										</td>
									</tr>
									<tr>
										<td><input type="checkbox" id="test0001"
											onclick="clicking0001()" /></td>
										<td id="menuDesc0001">Service/Front Desk</td>
										<td><div id="dvmenu0001" style="display: none">
												<input type="text" maxlength="1" id="quantity0001" value="1"
													placeholder="1" onkeypress="return isNumber(event)"
													style="width: 170px; font-size: 14px; margin-top: 19px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 95px;" " />
										</div>
												<span id="dvPa2"></span>
											</td>
										<td><i class="large material-icons"><image
													src="../img/frontdesk.png" class="img-rounded"
													style="height: 50px"></i></td>
										<td><input type="checkbox" id="icon0001"
											onclick="clicking()" /></td>
											<td id="iconDesc0001" style="display:none">Service/Front Desk</td>
										<td><div id="dvicon0001" style="display: none">
												<input type="text" maxlength="1" id="quantity1" value="1"
													placeholder="1" onkeypress="return isNumber(event)"
													style="width: 170px; font-size: 14px; margin-top: 19px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 95px;" " />
											</div>
											<span id="dvPa12"></span>
											</td>
										<td>
											<select class="browser-default" id="actionType1" required style="width:92%;height:26px;padding-top:3px;margin-top:5px"  name="templateId">
												<option value="Select Action Type" >Select Action Type</option>
												<option value="Phone Number" >Phone Number</option>
												<option value="Directory Link" >Directory Link</option>
												<option value="URL" >URL</option>
												
											</select>
										</td>
										<td><input type="text" id="itemAction0001" 
											style="width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; margin-top: 19px; color: #666; outline: none; height: 23px; width: 120px;" "/>
											<span id="actionErr1" style="font-size:13px;color:red"></span>
										</td>
									</tr>
									<tr>
										<td><input type="checkbox" id="test0002"
											onclick="clicking0002()" /></td>
										<td id="menuDesc0002">Bellman/Baggage</td>
										<td><div id="dvmenu0002" style="display: none">
												<input type="text" maxlength="1" id="quantity0002" value="1"
													placeholder="1" onkeypress="return isNumber(event)"
													style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 95px;" " />
											</div>
											<span id="dvPa3"></span>
											</td>
											
										<td><i class="large material-icons"><image
													src="../img/baggage.png" class="img-rounded"
													style="height: 35px;margin-left:12px;"></i></td>
										<td><input type="checkbox" id="icon0002"
											onclick="clicking1()" /></td>
											<td id="iconDesc0002" style="display:none">Bellman/Baggage</td>
										<td><div id="dvicon0002" style="display: none">
												<input type="text" maxlength="1" id="quantity2" value="1"
													placeholder="1" onkeypress="return isNumber(event)"
													style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 95px;" " />
											</div>
											<span id="dvPa13"></span>
											</td>
											<td>
											<select class="browser-default" id="actionType2" required style="width:92%;height:26px;padding-top:3px;margin-top:5px"  name="templateId">
												<option value="Select Action Type" >Select Action Type</option>
												<option value="Phone Number" >Phone Number</option>
												<option value="Directory Link" >Directory Link</option>
												<option value="URL" >URL</option>
												
											</select>
										</td>
										<td><input type="text" id="itemAction0002" 
											style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 120px;" " />
											<span id="actionErr2" style="font-size:13px;color:red"></span>
											</td>
									</tr>
									<tr>
										<td><input type="checkbox" id="test0003"
											onclick="clicking0003()" /></td>
										<td id="menuDesc0003">Maid Service</td>
										<td><div id="dvmenu0003" style="display: none">
												<input type="text" maxlength="1" id="quantity0003" value="1"
													placeholder="1" onkeypress="return isNumber(event)"
													style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 95px;" " />
											</div>
										<span id="dvPa4"></span>	
											</td>
										<td><i class="large material-icons"><image
													src="../img/maidservice.png" class="img-rounded"
													style="    margin-top: 19px;height: 50px;margin-left:4px;"></i></td>
										<td><input type="checkbox" id="icon0003"
											onclick="clicking2()" /></td>
											<td id="iconDesc0003" style="display:none">Maid Service</td>
										<td><div id="dvicon0003" style="display: none">
												<input type="text" maxlength="1" id="quantity3" value="1"
													placeholder="1" onkeypress="return isNumber(event)"
													style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 95px;" " />
											</div>
											<span id="dvPa14"></span>
											</td>
											<td>
											<select class="browser-default" id="actionType3" required style="width:92%;height:26px;padding-top:3px;margin-top:5px"  name="templateId">
												<option value="Select Action Type" >Select Action Type</option>
												<option value="Phone Number" >Phone Number</option>
												<option value="Directory Link" >Directory Link</option>
												<option value="URL" >URL</option>
												
											</select>
										</td>
										<td><input type="text" id="itemAction0003" 
											style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 120px;" " />
											<span id="actionErr3" style="font-size:13px;color:red"></span>
											</td>
									</tr>
									<tr>
										<td><input type="checkbox" id="test0004"
											onclick="clicking0004()" /></td>
										<td id="menuDesc0004">Emergency</td>
										<td><div id="dvmenu0004" style="display: none">
												<input type="text" maxlength="1" id="quantity0004" value="1"
													placeholder="1" onkeypress="return isNumber(event)"
													style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 95px;" " />
											</div>
									    <span id="dvPa5"></span>		
											</td>
										<td><i class="large material-icons"><image
													src="../img/sos.png" class="img-rounded"
													style="height: 55px"></i></td>
										<td><input type="checkbox" id="icon0004"
											onclick="clicking3()" /></td>
											<td id="iconDesc0004" style="display:none">Emergency</td>
										<td><div id="dvicon0004" style="display: none">
												<input type="text" maxlength="1" id="quantity4" value="1"
													placeholder="1" onkeypress="return isNumber(event)"
													style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 95px;" " />
											</div>
											<span id="dvPa15"></span>
											</td>
											<td>
											<select class="browser-default" id="actionType4" required style="width:92%;height:26px;padding-top:3px;margin-top:5px"  name="templateId">
												<option value="Select Action Type" >Select Action Type</option>
												<option value="Phone Number" >Phone Number</option>
												<option value="Directory Link" >Directory Link</option>
												<option value="URL" >URL</option>
												
											</select>
										</td>
										<td><input type="text" id="itemAction0004" 
											style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 120px;"" >
											<span id="actionErr4" style="font-size:13px;color:red"></span>
											</td>
									</tr>
									<tr>
										<td><input type="checkbox" id="test0005"
											onclick="clicking0005()" /></td>
										<td id="menuDesc0005">Food and Beverage</td>
										<td><div id="dvmenu0005" style="display: none">
												<input type="text" maxlength="1" id="quantity0005" value="1"
													placeholder="1" onkeypress="return isNumber(event)"
													style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 95px;" " />
											</div>
										<span id="dvPa6"></span>	
											</td>
										<td><i class="large material-icons"><image
													src="../img/food.png" class="img-rounded"
													style="height: 50px"></i></td>
										<td><input type="checkbox" id="icon0005"
											onclick="clicking4()" /></td>
											<td id="iconDesc0005" style="display:none">Food and Beverage</td>
										<td><div id="dvicon0005" style="display: none">
												<input type="text" maxlength="1" id="quantity5" value="1"
													placeholder="1" onkeypress="return isNumber(event)"
													style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 95px;" " />
											</div>
											<span id="dvPa16"></span>
											</td>
										<td>
											<select class="browser-default" id="actionType5" required style="width:92%;height:26px;padding-top:3px;margin-top:5px"  name="templateId">
												<option value="Select Action Type" >Select Action Type</option>
												<option value="Phone Number" >Phone Number</option>
												<option value="Directory Link" >Directory Link</option>
												<option value="URL" >URL</option>
												
											</select>
										</td>
										<td><input type="text" id="itemAction0005" 
											style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 120px;" " />
											<span id="actionErr5" style="font-size:13px;color:red"></span>
											</td>
									</tr>
									<tr>
										<td><input type="checkbox" id="test0006"
											onclick="clicking0006()" /></td>
										<td id="menuDesc0006">Taxi</td>
										<td><div id="dvmenu0006" style="display: none">
												<input type="text" maxlength="1" id="quantity0006" value="1"
													placeholder="1" onkeypress="return isNumber(event)"
													style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 95px;" " />
											</div>
									<span id="dvPa7"></span>		
											</td>
										<td><i class="large material-icons"><image
													src="../img/taxi.png" class="img-rounded"
													style="height: 50px"></i></td>
										<td><input type="checkbox" id="icon0006"
											onclick="clicking5()" /></td>
											<td id="iconDesc0006" style="display:none">Taxi</td>
										<td><div id="dvicon0006" style="display: none">
												<input type="text" maxlength="1" id="quantity6" value="1"
													placeholder="1" onkeypress="return isNumber(event)"
													style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 95px;" " />
											</div>
											<span id="dvPa17"></span>
											</td>
											<td>
											<select class="browser-default" id="actionType6" required style="width:92%;height:26px;padding-top:3px;margin-top:5px"  name="templateId">
												<option value="Select Action Type" >Select Action Type</option>
												<option value="Phone Number" >Phone Number</option>
												<option value="Directory Link" >Directory Link</option>
												<option value="URL" >URL</option>
												
											</select>
										</td>
										<td><input type="text" id="itemAction0006" 
											style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 120px;" " />
											<span id="actionErr6" style="font-size:13px;color:red"></span>
											</td>
									</tr>
									<tr>
										<td><input type="checkbox" id="test0007"
											onclick="clicking0007()" /></td>
										<td id="menuDesc0007">Local Attractions</td>
										<td><div id="dvmenu0007" style="display: none">
												<input type="text" maxlength="1" id="quantity0007" value="1"
													placeholder="1" onkeypress="return isNumber(event)"
													style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 95px;" " />
											</div>
									<span id="dvPa8"></span>		
											</td>
										<td><i class="large material-icons"><image
													src="../img/map.png" class="img-rounded"
													style="height: 50px"></i></td>
										<td><input type="checkbox" id="icon0007"
											onclick="clicking6()" /></td>
											<td id="iconDesc0007" style="display:none">Local Attractions</td>
										<td><div id="dvicon0007" style="display: none">
												<input type="text" maxlength="1" id="quantity7" value="1"
													placeholder="1" onkeypress="return isNumber(event)"
													style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 95px;" />
											</div>
											<span id="dvPa18"></span>
											</td>
											<td>
											<select class="browser-default" id="actionType7" required style="width:92%;height:26px;padding-top:3px;margin-top:5px"  name="templateId">
												<option value="Select Action Type" >Select Action Type</option>
												<option value="Phone Number" >Phone Number</option>
												<option value="Directory Link" >Directory Link</option>
												<option value="URL" >URL</option>
												
											</select>
										</td>
										<td><input type="text" id="itemAction0007" 
											style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 120px;" " />
											<span id="actionErr7" style="font-size:13px;color:red"></span>
											</td>
									</tr>
									<tr>
										<td><input type="checkbox" id="test0008"
											onclick="clicking0008()" /></td>
										<td id="menuDesc0008">Hotel Directory</td>
										<td><div id="dvmenu0008" style="display: none">
												<input type="text" maxlength="1" id="quantity0008" value="1"
													placeholder="1" onkeypress="return isNumber(event)"
													style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 95px;" " />
											</div>
											<span id="dvPa9"></span>
											</td>
										<td><i class="large material-icons"><image
													src="../img/directory.png" class="img-rounded"
													style="height: 50px"></i></td>
										<td><input type="checkbox" id="icon0008"
											onclick="clicking7()" /></td>
											<td id="iconDesc0008" style="display:none">Hotel Directory</td>
										<td><div id="dvicon0008" style="display: none">
												<input type="text" maxlength="1" id="quantity8" value="1"
													placeholder="1" onkeypress="return isNumber(event)"
													style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 95px;" " />
											</div>
											<span id="dvPa19"></span>
											</td>
											<td>
											<select class="browser-default" id="actionType8" required style="width:92%;height:26px;padding-top:3px;margin-top:5px"  name="templateId">
												<option value="Select Action Type" >Select Action Type</option>
												<option value="Phone Number" >Phone Number</option>
												<option value="Directory Link" >Directory Link</option>
												<option value="URL" >URL</option>
												
											</select>
										</td>
										<td><input type="text" id="itemAction0008" 
											style="margin-top: 19px; width: 170px; font-size: 14px; background: white; border: 1px solid #26a69a; border-radius: 5px; color: #666; outline: none; height: 23px; width: 120px;" " />
											<span id="actionErr8" style="font-size:13px;color:red"></span>
										</td>

									</tr>
								</tbody>
							</table>
						</div>
					</div>



					<!--  <input type="button" name="submit" value="submit" style="margin-left: 1146px;
    margin-top: -667px;"> -->
    
    				
					<!-- <a id="" class="btn"
						onclick="admin_app(this.id)"
						style="margin-top: -698px; margin-left: 33px; width: 100px; color: white; margin-left: 75%; padding: 10PX;">SUBMIT</a> -->



				</div>
			

	</div> 
	 
	 
	 	 <script type="text/javascript">
      $(function () {
        $("#test1350").click(function () {
            if ($(this).is(":checked")) {
                $("#quantity20").show();
            } else {
                $("#quantity20").hide();
            }
        });
      });
    </script>
	 
	 <script type="text/javascript">
      $(function () {
        $("#test0000").click(function () {
            if ($(this).is(":checked")) {
                $("#quantity0000").show();
            } else {
                $("#quantity0000").hide();
            }
        });
      });
    </script>
	 
	 
	 
	 <script type="text/javascript">
      $(function () {
        $("#test0001").click(function () {
            if ($(this).is(":checked")) {
                $("#quantity0001").show();
            } else {
                $("#quantity0001").hide();
            }
        });
      });
    </script>
    <script type="text/javascript">
      $(function () {
        $("#test0002").click(function () {
            if ($(this).is(":checked")) {
                $("#quantity0002").show();
            } else {
                $("#quantity0002").hide();
            }
        });
      });
    </script>
    <script type="text/javascript">
      $(function () {
        $("#test0003").click(function () {
            if ($(this).is(":checked")) {
                $("#quantity0003").show();
            } else {
                $("#quantity0003").hide();
            }
        });
      });
    </script>
    <script type="text/javascript">
      $(function () {
        $("#test0004").click(function () {
            if ($(this).is(":checked")) {
                $("#quantity0004").show();
            } else {
                $("#quantity0004").hide();
            }
        });
      });
    </script>
    <script type="text/javascript">
      $(function () {
        $("#test0005").click(function () {
            if ($(this).is(":checked")) {
                $("#quantity0005").show();
            } else {
                $("#quantity0005").hide();
            }
        });
      });
    </script>
    <script type="text/javascript">
      $(function () {
        $("#test0006").click(function () {
            if ($(this).is(":checked")) {
                $("#quantity0006").show();
            } else {
                $("#quantity0006").hide();
            }
        });
      });
    </script>
    <script type="text/javascript">
      $(function () {
        $("#test0007").click(function () {
            if ($(this).is(":checked")) {
                $("#quantity0007").show();
            } else {
                $("#quantity0007").hide();
            }
        });
      });
    </script>
    <script type="text/javascript">
      $(function () {
        $("#test0008").click(function () {
            if ($(this).is(":checked")) {
                $("#quantity0008").show();
            } else {
                $("#quantity0008").hide();
            }
        });
      });
      
      $(function () {
          $("#test0009").click(function () {
              if ($(this).is(":checked")) {
                  $("#quantity0009").show();
              } else {
                  $("#quantity0009").hide();
              }
          });
        });
    </script>
    <script >
		function clicking0000(){
			
			$("#dvmenu0000").show();
			
		}
		
		</script>
    <script >
		function clicking0001(){
			
			$("#dvmenu0001").show();
			
		}
		
		</script>
		<script >
		function clicking0002(){
			
			$("#dvmenu0002").show();
			
		}
		
		</script>
		<script >
		function clicking0003(){
			
			$("#dvmenu0003").show();
			
		}
		
		</script>
		<script >
		function clicking0004(){
			
			$("#dvmenu0004").show();
			
		}
		
		</script>
		<script >
		function clicking0005(){
			
			$("#dvmenu0005").show();
			
		}
		
		</script>
		<script >
		function clicking0006(){
			
			$("#dvmenu0006").show();
			
		}
		
		</script>
		<script >
		function clicking0007(){
			
			$("#dvmenu0007").show();
			
		}
		
		</script>
		<script >
		function clicking0008(){
			
			$("#dvmenu0008").show();
			
		}
		
		function clicking0009(){
			
			$("#dvmenu0009").show();
			
		}
		
		</script>
			 
	 
	 <!-- shiva  -->
	 
	 <script type="text/javascript">
    $(function () {
        $("#test001").click(function () {
            if ($(this).is(":checked")) {
                $("#dvPassport123").show();
            } else {
                $("#dvPassport123").hide();
            }
        });
    });
</script>
	 
	 <!-- 10 -->
	  <script type="text/javascript">
    $(function () {
        $("#test119").click(function () {
            if ($(this).is(":checked")) {
                $("#dvPassport").show();
            } else {
                $("#dvPassport").hide();
            }
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        $("#test103").click(function () {
            if ($(this).is(":checked")) {
                $("#dvPassport1").show();
            } else {
                $("#dvPassport1").hide();
            }
        });
    });
</script>
<script type="text/javascript">
$(function () {
    $("#test1350").click(function () {
        if ($(this).is(":checked")) {
            $("#quantity20").show();
        } else {
            $("#quantity20").hide();
        }
    });
});
</script>

<script type="text/javascript">
$(function () {
    $("#test135").click(function () {
        if ($(this).is(":checked")) {
            $("#quantity2").show();
        } else {
            $("#quantity2").hide();
        }
    });
});
</script>

<script type="text/javascript">
    $(function () {
        $("#test107").click(function () {
            if ($(this).is(":checked")) {
                $("#quantity3").show();
            } else {
                $("#quantity3").hide();
            }
        });
    });
</script>

<script type="text/javascript">
    $(function () {
        $("#test109").click(function () {
            if ($(this).is(":checked")) {
                $("#quantity4").show();
            } else {
                $("#quantity4").hide();
            }
        });
    });
</script>

<script type="text/javascript">
    $(function () {
        $("#test111").click(function () {
            if ($(this).is(":checked")) {
                $("#quantity5").show();
            } else {
                $("#dquantity5").hide();
            }
        });
    });
</script>

<script type="text/javascript">
    $(function () {
        $("#test113").click(function () {
            if ($(this).is(":checked")) {
                $("#quantity6").show();
            } else {
                $("#quantity6").hide();
            }
        });
    });
</script>

<script type="text/javascript">
    $(function () {
        $("#test115").click(function () {
            if ($(this).is(":checked")) {
                $("#quantity7").show();
            } else {
                $("#quantity7").hide();
            }
        });
    });
</script>

<script type="text/javascript">
    $(function () {
        $("#test117").click(function () {
            if ($(this).is(":checked")) {
                $("#quantity8").show();
            } else {
                $("#quantity8").hide();
            }
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        $("#test119").click(function () {
            if ($(this).is(":checked")) {
                $("#quantity").show();
            } else {
                $("#quantity").hide();
            }
        });
    });
</script>
<script>
$(document).ready(function () {
  //called when key is pressed in textbox
  $("#quantity20").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
});
</script> 
<script>
$(document).ready(function () {
  //called when key is pressed in textbox
  $("#quantity0000").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
});
</script> 
<script>
$(document).ready(function () {
  //called when key is pressed in textbox
  $("#quantity0001").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
});
</script> 
<script>
$(document).ready(function () {
  //called when key is pressed in textbox
  $("#quantity0002").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
});
</script> 
<script>
$(document).ready(function () {
  //called when key is pressed in textbox
  $("#quantity0003").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
});
</script> 
<script>
$(document).ready(function () {
  //called when key is pressed in textbox
  $("#quantity0004").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
});
</script> 
<script>
$(document).ready(function () {
  //called when key is pressed in textbox
  $("#quantity0005").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
});
</script> 
<script>
$(document).ready(function () {
  //called when key is pressed in textbox
  $("#quantity0006").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
});
</script> 
<script>
$(document).ready(function () {
  //called when key is pressed in textbox
  $("#quantity0007").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
});
</script> 

<script>
$(document).ready(function () {
  //called when key is pressed in textbox
  $("#quantity0008").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
});
</script> 
<script>
$(document).ready(function () {
  //called when key is pressed in textbox
  $("#quantity").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
});
</script> 


<script>
$(document).ready(function () {
  //called when key is pressed in textbox
  $("#quantity0").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg0").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
});
</script> 
<script>
$(document).ready(function () {
  //called when key is pressed in textbox
  $("#quantity1").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg1").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
});
</script> 
<script>
$(document).ready(function () {
  //called when key is pressed in textbox
  $("#quantity2").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg2").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
});
</script> 
<script>
$(document).ready(function () {
  //called when key is pressed in textbox
  $("#quantity3").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg3").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
});
</script> 
<script>
$(document).ready(function () {
  //called when key is pressed in textbox
  $("#quantity4").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg4").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
});
</script> 
<script>
$(document).ready(function () {
  //called when key is pressed in textbox
  $("#quantity5").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg5").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
});
</script> 
<script>
$(document).ready(function () {
  //called when key is pressed in textbox
  $("#quantity6").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg6").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
});
</script> 
<script>
$(document).ready(function () {
  //called when key is pressed in textbox
  $("#quantity7").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg7").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
});
</script> 
<script>
$(document).ready(function () {
  //called when key is pressed in textbox
  $("#quantity8").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg8").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
});
</script>  
	 <!-- end of shiva popup -->
	 
	 
<!-- end Admin App -->

<!--  update Super admin popup -->

  
  <div id="updateAdmin" class="modal" style="overflow:auto">
  
  	
  
    <a href="#!" class=" modal-action modal-close right waves-effect waves-green btn-flat">Close</a>
       <div class="modal-content ubody">
       <center><h5 > </h5></center>
          <center><span class="userExisted" style="color:red;font-size:13px;"></span></center>
          <input type="hidden" id="updateHideEmail"/>
          <div class="row margin">
      <div class="input-field col s12">
       <input  type="text" name="editFirstName" class="customFont" id="updateFname"  style="padding: 0 10px 0 10px">
       <span id="updateFnameErr" style="color:red;font-size:12px"></span>
       <label  class="center-align active customFont">First Name</label>
      </div>
     </div>
        <div class="row margin">
      <div class="input-field col s12">
       <input  type="text" name="editLastName" id="UpdateLname" class="customFont" style="padding: 0 10px 0 10px">
       <span id="updateLnameErr" style="color:red;font-size:12px"></span>
       <label  class="center-align active customFont">Last Name</label>
      </div>
     </div>
      <div class="row margin">
      <div class="input-field col s12">
       <!--             <i class="mdi-social-person-outline prefix"></i> -->
       <input  type="text" name="editUserName" required id="updateUname" class="customFont" style="padding: 0 10px 0 10px" disabled>
       <span id="updateUnameErr" style="color:red;font-size:12px"></span>
       <label  class="center-align active customFont">User Name</label>
      </div>
     </div>
     <div class="row margin">
      <div class="input-field col s12">
       <input  type="email" name="editEmail" class="customFont" id="updateEmail" required style="padding: 0 10px 0 10px">
       <span id="updateEmailErr" style="color:red;font-size:12px"></span>
       <label  class="center-align active customFont">Email</label>
      </div>
     </div>
     <div class="row margin">
      <div class="input-field col s12">
       <input  type="text" name="editPhone" class="customFont" id="updatePhone" required style="padding: 0 10px 0 10px">
       <span id="updatePhoneErr" style="color:red;font-size:12px"></span>
       <label  class="center-align active customFont">Phone Number</label>
      </div>
     </div>
     
    
     
           
           <div class="row">
             <div class="input-field col s12">
               
               <button type="submit" id="updateAdminUser" class="btn waves-effect waves-light col s12">Update Admin User</button>
             </div>
             
           </div>
          
       </div>
     
  </div>
 
 
<!--  end of the update Super admin popup -->


<!-- start change hotel popup -->
	
	<div id="modal1" class="modal" style="width:80%;margin-top:2% ; overflow: auto;">
	<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat right">Close</a>
		
			
		
	    <div class="modal-content" style="padding:26px 30px 0 30px; height: 518px;">   
	    	
	    		<center ><h5 id="locationtext">Select Hotel</h5></center>
	
				  <nav style="width:50%;height:40px;margin:14px 0 25px 0px;line-height:45px !important;background-color:#00bcd4">
				    <div class="nav-wrapper">
				      
				        <div class="input-field">
				          <input id="search" type="search" required style="width:100%;font-size:16px;padding:11px 9px 0 50px;color:#fff;background-color:#00bcd4">
				          <label for="search"><i class="material-icons" style="line-height:45px;color:#fff">search</i></label>
				          
				        </div>
				      
				    </div>
				  </nav>
				  	
				  	
				  	  <div class="preloader-wrapper small active mbody" style="display:none;margin:2% 0 0 50%">
					    <div class="spinner-layer spinner-green-only">
					      <div class="circle-clipper left">
					        <div class="circle"></div>
					      </div><div class="gap-patch">
					        <div class="circle"></div>
					      </div><div class="circle-clipper right">
					        <div class="circle"></div>
					      </div>
					    </div>
					  </div>		
	    		<span id="noResults" style="margin-left:29%"></span>
	      		
	      		<center></center>	
				<table class="table bordered striped searchResults" >
					
				</table>
	    </div>
	    
	 </div>
	
	<!-- end of the change hotel popup -->
	
	
	<!-- start managing users popup -->
	
	<div id="modal4" class="modal" style="width:80%;overflow:auto">
	<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat right">Close</a>
		
			
		
	    <div class="modal-content" style="padding:20px 30px 0 30px">  
	    	
	    	<center  style="margin-left:15%"><h5 id="locationtext">Manage Users</h5></center>
	
	  <nav style="width:50%;height:40px;margin:14px 0 27px 0px;line-height:45px !important;background-color:#00bcd4">
	    <div class="nav-wrapper">
	      
	        <div class="input-field">
	          <input id="userSearch" type="search" required style="width:100%;font-size:16px;padding:11px 9px 0 50px;color:#fff;background-color:#00bcd4">
	          <label for="search"><i class="material-icons" style="line-height:45px;color:#fff">search</i></label>
	          
	        </div>
	      
	    </div>
	  </nav>
	  	
	  	
	  	  <div class="preloader-wrapper small active userSpin" style="display:none;margin:2% 0 0 50%">
		    <div class="spinner-layer spinner-green-only">
		      <div class="circle-clipper left">
		        <div class="circle"></div>
		      </div><div class="gap-patch">
		        <div class="circle"></div>
		      </div><div class="circle-clipper right">
		        <div class="circle"></div>
		      </div>
		    </div>
		  </div>
	  	
	  	 		
	    		<span id="noUserResults" style="margin-left:44%"></span>
	      		
	      		<center></center>	
				<table class="table bordered striped" id="userSearchResults">
					<tbody id="userbody">
						
					</tbody>
				</table>
	    </div>
	    
	 </div>
	
	<!-- end of the managing users popup -->
	
	
	<!-- start change Group popup -->
 
	 <div id="modal3" class="modal" style="overflow:auto">
	  <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat right">Close</a>
	     <div class="modal-content">
	       <center><h5 id="locationtext">Select Group</h5></center>
	       
	       <nav style="width:50%;height:40px;line-height:45px !important;background-color:#00bcd4">
			    <div class="nav-wrapper">
			      
			        <div class="input-field">
			          <input id="groupSearch" type="search" required style="font-size:16px;padding:11px 9px 0 50px;color:#fff;background-color:#00bcd4">
			          <label for="search"><i class="material-icons" style="line-height:45px;color:#fff">search</i></label>
			          
			        </div>
			      
			    </div>
		   </nav>
	  	 <br/>
		  
	  	
	  	  <div class="preloader-wrapper small active groupSpin" style="display:none;margin:2% 0 0 50%">
		    <div class="spinner-layer spinner-green-only">
		      <div class="circle-clipper left">
		        <div class="circle"></div>
		      </div><div class="gap-patch">
		        <div class="circle"></div>
		      </div><div class="circle-clipper right">
		        <div class="circle"></div>
		      </div>
		    </div>
		  </div>
		  <span id="noGroupResults" style="margin-left:40%"></span>
		 
	    <table class="table bordered striped" id="groupSearchResults">
	    	<tbody id="groupBody">
		    	
		    </tbody>	
	    </table>
	     </div>
	     
	 </div>
	 
	 <!-- end of the change Group popup -->
	 
	 <!-- start change template popup -->
 
	 <div id="modal2" class="modal" style="overflow:auto">
	  <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat right">Close</a>
	     <div class="modal-content">
	       <center><h5 id="locationtext">Select Template</h5></center>
	       
	       <nav style="width:50%;height:40px;line-height:45px !important;background-color:#00bcd4">
			    <div class="nav-wrapper">
			      
			        <div class="input-field">
			          <input id="templateSearch" type="search" required style="font-size:16px;padding:11px 9px 0 50px;color:#fff;background-color:#00bcd4">
			          <label for="search"><i class="material-icons" style="line-height:45px;color:#fff">search</i></label>
			          
			        </div>
			      
			    </div>
		   </nav>
	  	 <br/>
		  
	  	
	  	  <div class="preloader-wrapper small active templateSpin" style="display:none;margin:2% 0 0 50%">
		    <div class="spinner-layer spinner-green-only">
		      <div class="circle-clipper left">
		        <div class="circle"></div>
		      </div><div class="gap-patch">
		        <div class="circle"></div>
		      </div><div class="circle-clipper right">
		        <div class="circle"></div>
		      </div>
		    </div>
		  </div>
		  <span id="noTemplateResults" style="margin-left:40%"></span>
		 
	    <table class="table bordered striped" id="templateSearchResults">
	    	<tbody id="templateBody">
		    	
		    </tbody>	
	    </table>
	     </div>
	     
	 </div>
	 
	 <!-- end of the change template popup -->
	 
	 
	 
<!--  create edit admin popup -->

  
  <div id="updateAdmin" class="modal" style="overflow:auto;margin-top:0%">
 
  
    <a href="#!" class=" modal-action modal-close right waves-effect waves-green btn-flat">Close</a>
       <div class="modal-content sbody">
       <center><h5 > Update IT Admin User </h5></center>
          <center><span class="updateUserExisted" style="color:red;font-size:13px;"></span></center>
          
          <div class="row margin">
      <div class="input-field col s12">
       <input  type="text" class="customFont" name="firstname" id="updateFirstname"  style="padding: 0 10px 0 10px">
       <span id="updateFnameErr" style="color:red;font-size:12px"></span>
       <label  class="center-align active customFont">First Name</label>
      </div>
     </div>
        <div class="row margin">
      <div class="input-field col s12">
       <input  type="text" class="customFont" name="lastname" id="updateLastname"  style="padding: 0 10px 0 10px">
       <span id="updateLnameErr" style="color:red;font-size:12px"></span>
       <label  class="center-align active customFont">Last Name</label>
      </div>
     </div>
      <div class="row margin">
      <div class="input-field col s12">
       <!--             <i class="mdi-social-person-outline prefix"></i> -->
       <input  type="text" class="customFont" name="username" required id="updateUsername"  style="padding: 0 10px 0 10px">
       <span id="updateUnameErr" style="color:red;font-size:12px"></span>
       <label  class="center-align active customFont">User Name</label>
      </div>
     </div>
     <div class="row margin">
      <div class="input-field col s12">
       <input  type="email" class="customFont" name="email" id="updateEmail" required style="padding: 0 10px 0 10px">
       <span id="updateEmailErr" style="color:red;font-size:12px"></span>
       <label  class="center-align active customFont">Email</label>
      </div>
     </div>
     
     <input type="hidden" id="user" name="user" value="${user}">
     <input type="hidden" name="userName" id="userName" value="${userName }">
     
           
           <div class="row">
             <div class="input-field col s12">
               
               <button type="submit" id="updateSuperAdmin" style="display:none" class="btn waves-light col s12">Update IT Admin User</button>
             </div>
             
           </div>
          
       </div>
    
  </div>
 
 
<!--  end of the edit admin popup -->


<!--  create change password popup -->

  
  <div id="changePassword" class="modal" style="overflow:auto;margin-top:0%">
 
  
    <a href="#!" class=" modal-action modal-close right waves-effect waves-green btn-flat">Close</a>
       <div class="modal-content sbody">
       <center> <span id="changeResultsErr" style="color:red;font-size:12px"></span> </center>
       <center><h5 id="passwordText" style="font-size:18px"> Change User Password </h5></center>
          
          
          <div class="row margin">
      <div class="input-field col s12">
       <input  type="password" class="customFont" name="changepassword" id="cPassword"  style="padding: 0 10px 0 10px">
       <span id="cpasErr" style="color:red;font-size:12px"></span>
       <label  class="center-align active customFont">New Password</label>
      </div>
     </div>
        <div class="row margin">
      <div class="input-field col s12">
       <input  type="password" class="customFont" name="reenterpassword" id="reenterPassword"  style="padding: 0 10px 0 10px">
       <span id="rpassErr" style="color:red;font-size:12px"></span>
       <label  class="center-align active customFont">Re-Enter Password</label>
      </div>
     </div>
      
     
     <input type="hidden" id="changePasswordUser" name="user" value="${user}">
     
     
           
           <div class="row">
             <div class="input-field col s12">
               <button type="submit" id="savePassword" class="btn  waves-light col s12">Save User Password</button>
               
             </div>
             
           </div>
          
       </div>
    
  </div>
 
 
<!--  end of the change password popup -->


<!-- success change password popup -->
 
 	
 		<a class="waves-effect waves-light btn modal-trigger" style="display:none" id="cuPassword" href="#chgPass">Modal</a>
			<div id="chgPass" class="modal" style="height:28%;font-size:16px;top:2% !important">
			    <div class="modal-content">
			     	<center> <p>Succesfully Changed User Password.</p> </center>
			     	
			     	<a href="#!" style="float:right;padding:10px 28px 0 28px" id="confirmChangePassword" class=" modal-action modal-close waves-green btn">Ok</a>
				 
			    </div>
			    
			</div>
 	
 
 <!-- end of chenge password popup -->	
	 
		

<!--  create Add Super admin popup -->

  
  <div id="superAdmin" class="modal" style="overflow:auto;margin-top:0%">
 
  
    <a href="#!" class=" modal-action modal-close right waves-effect waves-green btn-flat">Close</a>
       <div class="modal-content sbody">
       <center><h5 id="supertext"> Create Super Admin User </h5></center>
          <center><span class="userExisted" style="color:red;font-size:13px;"></span></center>
          <input type="hidden" id="saEmail"/>
          <div class="row margin">
      <div class="input-field col s12">
       <input  type="text" class="customFont" name="firstname" id="superFirstname"  style="padding: 0 10px 0 10px">
       <span id="sfnameErr" style="color:red;font-size:12px"></span>
       <label  class="center-align active customFont">First Name</label>
      </div>
     </div>
        <div class="row margin">
      <div class="input-field col s12">
       <input  type="text" class="customFont" name="lastname" id="superLastname"  style="padding: 0 10px 0 10px">
       <span id="slnameErr" style="color:red;font-size:12px"></span>
       <label  class="center-align active customFont">Last Name</label>
      </div>
     </div>
      <div class="row margin">
      <div class="input-field col s12">
       <!--             <i class="mdi-social-person-outline prefix"></i> -->
       <input  type="text" class="customFont" name="username" required id="superUsername"  style="padding: 0 10px 0 10px">
       <span id="sunameErr" style="color:red;font-size:12px"></span>
       <label  class="center-align active customFont">User Name</label>
      </div>
     </div>
     <div class="row margin">
      <div class="input-field col s12">
       <input  type="email" class="customFont" name="email" id="superEmail" required style="padding: 0 10px 0 10px">
       <span id="semailErr" style="color:red;font-size:12px"></span>
       <label  class="center-align active customFont">Email</label>
      </div>
     </div>
     
     <input type="hidden" id="user" name="user" value="${user}">
     <input type="hidden" name="userName" id="userName" value="${userName }">
     
           
           <div class="row">
             <div class="input-field col s12">
               <button type="submit" id="createSuperAdmin" class="btn waves-light col s12">Create Super Admin</button>
               <button type="submit" id="updateSuperAdmin" style="display:none" class="btn waves-light col s12">Update Super Admin</button>
             </div>
             
           </div>
          
       </div>
    
  </div>
 
 
<!--  end of the Super admin popup -->	
	
<!--  create Add cs admin popup -->

  
  <div id="csAdmin" class="modal" style="overflow:auto;margin-top:0%">
   
    <a href="#!" class=" modal-action modal-close right waves-effect waves-green btn-flat">Close</a>
       <div class="modal-content csbody">
       <center><h5 id="cstext"> Create Customer Service Admin User </h5></center>
       <input type="hidden" id="caEmail"/>
          <center><span class="userExisted" style="color:red;font-size:13px;"></span></center>
          <div class="row margin">
      <div class="input-field col s12">
       <input  type="text" class="customFont" name="firstname" id="csFirstname"  style="padding: 0 10px 0 10px">
       <span id="cfnameErr" style="color:red;font-size:12px"></span>
       <label  class="center-align active customFont">First Name</label>
      </div>
     </div>
        <div class="row margin">
      <div class="input-field col s12">
       <input  type="text" class="customFont" name="lastname" id="csLastname" style="padding: 0 10px 0 10px">
       <span id="clnameErr" style="color:red;font-size:12px"></span>
       <label  class="center-align active customFont">Last Name</label>
      </div>
     </div>
      <div class="row margin">
      <div class="input-field col s12">
       <input  type="text" class="customFont" name="username" required id="csUsername"  style="padding: 0 10px 0 10px" >
       <span id="cunameErr" style="color:red;font-size:12px"></span>
       <label  class="center-align active customFont">User Name</label>
      </div>
     </div>
     <div class="row margin">
      <div class="input-field col s12">
       <input  type="email" class="customFont" name="email" id="csEmail" required style="padding: 0 10px 0 10px">
       <span id="cemailErr" style="color:red;font-size:12px"></span>
       <label  class="center-align active customFont">Email</label>
      </div>
     </div>
     
     <input type="hidden" name="user" value="${user}">
     <input type="hidden" name="userName" value="${userName }">
           
           <div class="row">
             <div class="input-field col s12">
               <button type="submit" id="createCSAdmin" class="btn  waves-light col s12">Create CS Admin</button>
               <button type="submit" id="updateCSAdmin" style="display:none" class="btn  waves-light col s12">Update CS Admin</button>
             </div>
             
           </div>
          
       </div>
    
  </div>
 
 
<!--  end of the cs admin popup -->


<!--   start location admin popup -->

  <div  class="modal locationAdmin" style="overflow:auto;margin-top:0%">
  
    <a href="#!" class=" modal-action modal-close right waves-effect waves-green btn-flat">Close</a>
       <div class="modal-content lsbody">
       <center><h5 id="locationtext"> Create Location Admin User </h5></center>
       <input type="hidden" id="laEmail"/>
          <center><span class="userExisted" style="color:red;font-size:13px;"></span></center>
          <div class="row margin">
      <div class="input-field col s12">
       <!--             <i class="mdi-social-person-outline prefix"></i> -->
       <input  type="text" class="customFont" name="firstname" id="locationFirstname" style="padding: 0 10px 0 10px">
       <span id="lfnameErr" style="color:red;font-size:12px"></span>
       <label  class="center-align active customFont">First Name</label>
      </div>
     </div>
        <div class="row margin">
      <div class="input-field col s12">
       <!--             <i class="mdi-social-person-outline prefix"></i> -->
       <input  type="text" name="lastname" class="customFont" id="locationLastname" style="padding: 0 10px 0 10px">
       <span id="llnameErr" style="color:red;font-size:12px"></span>
       <label  class="customFont center-align active">Last Name</label>
      </div>
     </div>
      <div class="row margin">
      <div class="input-field col s12">
       <!--             <i class="mdi-social-person-outline prefix"></i> -->
       <input  type="text" name="username" class="customFont" id="locationUsername" required style="padding: 0 10px 0 10px" >
       <span id="lunameErr" style="color:red;font-size:12px"></span>
       <label  class="customFont center-align active">User Name</label>
      </div>
     </div>
           <div class="row margin">
      <div class="input-field col s12">
       <!--             <i class="mdi-social-person-outline prefix"></i> -->
       <input  type="email" name="email" class="customFont" id="locationEmail" required style="padding: 0 10px 0 10px">
       <span id="lemailErr" style="color:red;font-size:12px"></span>
       <label  class="customFont center-align active">Email</label>
      </div>
     </div>
     
     <input type="hidden" name="user" value="${user}">
     <input type="hidden" name="userName" value="${userName }">
           
           <div class="row">
             <div class="input-field col s12">
               <button type="submit" id="createLocationAdmin" class="btn  waves-light col s12">Create Location Admin</button>
               <button type="submit" id="updateLocationAdmin" style="display:none" class="btn  waves-light col s12">Update Location Admin</button>
             </div>
             
           </div>
          
       </div>
     
  </div>
  

<!--  end of the location admin popup -->



<!--  create template popup -->
 
  <div id="createTemplate" class="modal" style="width:30%;height:317px;margin-top:0%">
 
  <form:form action="addTemplate" method="post" name="addTemplate">
   <a href="#!" class=" modal-action modal-close right waves-effect waves-green btn-flat">Close</a>
      <div class="modal-content">
      	<div class="preloader-wrapper small active tspin" style="display:none;margin:2% 0 0 50%">
		    <div class="spinner-layer spinner-green-only">
		      <div class="circle-clipper left">
		        <div class="circle"></div>
		      </div><div class="gap-patch">
		        <div class="circle"></div>
		      </div><div class="circle-clipper right">
		        <div class="circle"></div>
		      </div>
		    </div>
		  </div>
         <center ><h5 id="locationtext"> Create Template </h5></center>
         <div class="">
           <div class="input-field col s12">
          
             <input  type="text" class="validate customFont" required id="templateName" name="templateName" style="padding:0px 0px 0px 0px;margin-bottom:3px">
             <label for="name" class="customFont" style="padding:0px 0px 0px 0px">Template Name</label>
             <span id="templateNameErr" style="color:red;font-size:13px"></span>             
             <span id="templateExistErr" style="color:red;font-size:13px"></span>
           </div>
         </div>
         
         <div class="">
			<div class="input-field ">
				<select class="browser-default" required id="templateId" name="templateId">
					<option value="" disabled selected>Choose Template</option>
					
				</select>
				<span id="templateIdErr" style="color:red;font-size:13px"></span>
			</div>
		</div>
         
       	
       	<input type="hidden" value="${user }" name="user">
       	<input type="hidden" value="${userName }" name="userName">
       	<input type="hidden" value="${locId}" name="locId">
       	
       <center style="margin-top:5%"><a href="javascript: submitform()" id="cTemplate"  class=" waves-light btn">Create Template</a></center>
       
      </div>
 	</form:form>  
 
  </div>
 
 <!-- end of the template popup -->
 
 <!--  create group hotel popup -->
 <div id="groupHotel" class="modal" style="height:317px;width:30%;margin-top:0%">
  
  <form:form action="addGroup" method="post" name="addGroup">
   <a href="#!" class=" modal-action modal-close right waves-effect waves-green btn-flat">Close</a>
      <div class="modal-content">
      	<div class="preloader-wrapper small active gspin" style="display:none;margin:2% 0 0 50%">
		    <div class="spinner-layer spinner-green-only">
		      <div class="circle-clipper left">
		        <div class="circle"></div>
		      </div><div class="gap-patch">
		        <div class="circle"></div>
		      </div><div class="circle-clipper right">
		        <div class="circle"></div>
		      </div>
		    </div>
		</div>
		
		
         <center><h5 id="locationtext"> Create Hotel Group </h5></center>
         <div class="">
           <div class="input-field col s12">
           
           <input type="hidden" name="user" value="${user }">
           <input type="hidden" name="userName" value="${userName }">
           <input type="hidden" value="${locId}" name="locId">
          
             <input  type="text" required name="groupName" class="customFont" id="addGroupName" style="margin-bottom:3px">
             <label for="name" class="customFont" style="padding:0 10px 0 10px">Group Name</label>
             <span id="groupExistErr" style="color:red;font-size:13px"></span>
             <span id="groupNameErr" style="color:red;font-size:13px"></span>
           </div>
           <div class="">
		    <div class="input-field ">
		     <select required  class="browser-default" name="templateId" id="addTemplateId">
		      <option value="" disabled selected>Choose Template</option>
		       
		     </select>
		     <span id="groupIdErr" style="color:red;font-size:13px"></span>
		    </div>
		   </div>
           
       </div>
        
        
        
       <center style="margin-top:5%"><a href="javascript: groupSubmitform()" class=" waves-light btn">Create Hotel Group</a></center>
       
      </div>
  </form:form>  
  
</div>
 <!-- end of the group hotel popup -->
 
 
 
 <!-- start add hotel popup -->
	
	<div id="addHotel" class="modal" style="overflow:auto">
	
	  <form:form action="addLocation" commandName="addLocation" name="addLocation"
							enctype="multipart/form-data">
	   <a href="#!" class=" modal-action modal-close right waves-effect waves-green btn-flat">Close</a>
	      <div class="modal-content">
	      	<div class="preloader-wrapper small active hspin" style="display:none;margin:2% 0 0 50%">
			    <div class="spinner-layer spinner-green-only">
			      <div class="circle-clipper left">
			        <div class="circle"></div>
			      </div><div class="gap-patch">
			        <div class="circle"></div>
			      </div><div class="circle-clipper right">
			        <div class="circle"></div>
			      </div>
			    </div>
			  </div>
	         		<center ><h5 > Create Hotel </h5></center>
	        		<div style="margin: 1% 3% 0px 3%">
						

							<!--hidden fields  -->
							<input type="hidden" value="${userName}" name="userName">
							<input type="hidden" value="${user}" name="user">
							<input type="hidden" value="${locId}" name="locId">
							
							 

							<div class="">
								<div class="input-field ">
									<input type="text" name="Name" required id="hotelName"
										style="font-size: 16px;padding-left:10px;margin-bottom:3px "> <label
										for="first_name2" style="font-size: 14px; font-weight: normal">Hotel Name
										</label>
									<span id="hotelNameErr" style="font-size:13px;color:red"></span>
									<span id="hotelExistErr" style="font-size:13px;color:red"></span>
								</div>
							</div>
							
							<div class="">
								<div class="input-field ">
									<input type="text" name="siteId" 
										style="font-size: 16px;padding-left:10px;margin-bottom:3px " id="groupId"> <label
										for="first_name2" style="font-size: 14px; font-weight: normal">Group Site ID
										</label>
									<span id="hotelGroupidErr" style="font-size:13px;color:red"></span>
								</div>
							</div>
							
							<div class="row">
								<div class="input-field col s6">
									<select  name="adminId" required id="adminId" class="locAdmin browser-default">
								      <option value="" disabled selected>Choose Location Admin</option>				
								    </select>
								  <span id="hotelLocationAdminErr" style="font-size:13px;color:red"></span>
									
								</div>

							</div>
							
							<div class="row">
       
        <div class="input-field">
         <input type="checkbox" id="checkBox" onclick = "Check()" style="display:none;" />
              <label for="checkBox" style="padding-left:35px !important;">Group Hotel</label>
        </div>
        
        <div class="input-field col s6" id="showGroups" style="display:none">
         <select name="groupId" id="groupObjectId"  class="browser-default">
              <option value="" selected disabled>Choose Group</option>
               
               
            </select>
            <span id="hotelGroupErr" style="font-size:13px;color:red"></span>
        </div>
        
       
        <div class="input-field col s6" >
         <select class="browser-default" required id="showTemplates" name="groupId">
                <option value="" selected disabled>Choose Template</option>
          
            </select>
            <span id="hotelTemplateErr" style="font-size:13px;color:red"></span>
         
        </div>
        <div class="input-field col s6" style="margin-top:4%">
         <span id="l1"></span>
        </div>

       </div>
							
							<div class="">
								<div class="input-field ">
									<input type="text" name="Address1" id="Address1"
										style="font-size: 16px;padding-left:10px;margin-bottom:3px"> <label
										for="first_name2" style="font-size: 14px; font-weight: normal">Address1</label>
										
									<span id="hotelAddressErr" style="font-size:13px;color:red"></span>
								</div>
							</div>
							<div class="">
								<div class="input-field ">
									<input type="text" name="Address2" id="Address2"
										style="font-size: 16px;padding-left:10px;margin-bottom:3px"> <label
										for="first_name2" style="font-size: 14px; font-weight: normal">Address2</label>
								</div>
							</div>
							<div class="">
								<div class="input-field ">
									<input type="text" name="Street" id="Street"
										style="font-size: 16px;padding-left:10px;margin-bottom:3px "> <label
										for="first_name2" style="font-size: 14px; font-weight: normal">City</label>
									<span id="hotelCityErr" style="font-size:13px;color:red"></span>
								</div>
							</div>
							<div class="">
								<div class="input-field ">
									<input type="text" name="Town" id="State"
										style="font-size: 16px;padding-left:10px;margin-bottom:3px "> <label
										for="first_name2" style="font-size: 14px; font-weight: normal">State/Province</label>
									<span id="hotelStateErr" style="font-size:13px;color:red"></span>
								</div>
							</div>
							<div class="">
								<div class="input-field ">
									<input type="text"  name="zipcode" id="zipcode" onkeyup = "Validate(this)"
										style="font-size: 16px;padding-left:10px;margin-bottom:3px "> <label
										for="first_name2" style="font-size: 14px; font-weight: normal">Zip Code/Postal Code</label>
									<span id="hotelZipcodeErr" style="font-size:13px;color:red"></span>
								</div>
							</div>
							
							<div class="">
								<div class="input-field ">
									<input type="text" name="country" id="country"
										style="font-size: 16px;padding-left:10px;margin-bottom:3px "> <label
										for="first_name2" style="font-size: 14px; font-weight: normal">Country</label>
									<span id="hotelCountryErr" style="font-size:13px;color:red"></span>
								</div>
							</div>

							<div class="">
								<div class="input-field ">
									<input type="text" name="longitude" id="addLongitude" onkeypress="return isNumber(event)"
										style="font-size: 16px;padding-left:10px;margin-bottom:3px " > <label
										for="first_name2" style="font-size: 14px; font-weight: normal">Longitude
										</label>
									
								</div>
							</div>
							
							<div class="">
								<div class="input-field ">
									<input type="text" name="latitude" id="addLatitude" onkeypress="return isNumber(event)"
										style="font-size: 16px;padding-left:10px;margin-bottom:3px " > <label
										for="first_name2" style="font-size: 14px; font-weight: normal">Latitude
										</label>
									
								</div>
							</div>


					 <div class="file-field input-field ">
								<div class="btn" style="padding: 0 10px 0 10px;">
									<span>Hotel Logo</span> <input type="file" name="hotelLogo" multiple>
								</div>
								<div class="file-path-wrapper">
									<input class="file-path" type="text"
										placeholder="Upload Hotel Logo"
										style="font-weight: normal; font-size: 14px;">
								</div>
							</div>

							<div class="file-field input-field ">
								<div class="btn" style="padding: 0 10px 0 10px;">
									<span>Hotel Image</span> <input type="file" name="logo" multiple>
								</div>
								<div class="file-path-wrapper">
									<input class="file-path" type="text"
										placeholder="Upload Hotel Image"
										style="font-weight: normal; font-size: 14px;">
								</div>
							</div>
														
														<div class="file-field input-field ">
								<div class="btn" style="padding: 0 10px 0 10px;">
									<span>Hotel Footer</span> <input type="file" name="hotelFooter" multiple>
								</div>
								<div class="file-path-wrapper">
									<input class="file-path" type="text"
										placeholder="Upload Hotel Footer"
										style="font-weight: normal; font-size: 14px;">
								</div>
							</div>
							
							<div class="">
								<div class="input-field ">
									<a href="javascript: hotelSubmitform()" id="addNewHotel" class="btn ">Add Hotel</a>
									<button type="reset" class="btn ">Clear</button>
									<br> <br> <br>
								</div>
							</div>
						
					</div>
	       
	      </div>
	 	</form:form>
	  
	</div>
	
	<!-- end of the add hotel popup -->
	
	
	
	
	<div class="container" style="width: 95%; display: none">
		<div class="row">

			<div class="col col s4 m4 l4 ">
				<div class=" grey lighten-3"
					style="box-shadow: 0 2px 5px 0 #000, 0 2px 10px 0 #000; padding: 1% 0% 3% 6%">

					<div id="jstree-proton-1" class="proton-demo">
						<ul style="font-family: Roboto, sans-serif;">
							<li class="jstree-open"><b>Hotel</b><c:forEach	var="locObj" items="${locObj}">
									<ul>
										<li class="jstree-open"><a onclick="Loc_click(this.id)"
											id="${locObj.objectId }">${locObj.name}
																					
											</a> 
											 <c:forEach
												var="direcObjList" items="${direcObjList}">
												<ul>
													<c:if
														test="${locObj.directory eq direcObjList.directoryId }">
														<li class="jstree-open"
															style="font-family: 'Open Sans', sans-serif;font-size:16px"><a
															id="${direcObjList.objectId}"
															onclick="reply_click(this.id)">${direcObjList.title}</a>
															<ul>
																<c:forEach var="subDirObj" items="${subDirObj}">
																	<c:if
																		test="${direcObjList.objectId eq subDirObj.directoryId }">
																		<li class="jstree-open"><a
																			onclick="reply_click(this.id)"
																			id="${subDirObj.objectId }">${subDirObj.title }</a>
																			<ul>
																				<c:forEach var="subsubDirObj"
																					items="${subsubDirObj }">
																					<c:if
																						test="${(subDirObj.objectId eq subsubDirObj.directoryId) }">


																						<c:if
																							test="${(subsubDirObj.directoryId eq subsubDirObj.directoryId) }">

																							<li class="jstree-open"><a
																								title="${subsubDirObj.title }"
																								id="${subsubDirObj.objectId }"
																								onclick="reply_click(this.id)">
																									${subsubDirObj.title } </a>
																								<ul>
																									<c:forEach var="DirObjId" items="${DirObjId }">
																										<c:if
																											test="${subsubDirObj.objectId eq DirObjId.directoryId }">
																											<li><a id="${DirObjId.objectId }"
																												title="${DirObjId.title }"
																												onclick="reply_click(this.id)">
																													${DirObjId.title }</a></li>
																										</c:if>
																									</c:forEach>
																								</ul></li>
																						</c:if>
																					</c:if>
																				</c:forEach>
																			</ul></li>
																	</c:if>
																</c:forEach>
															</ul></li>
													</c:if>
												</ul>
											</c:forEach>  <!-- </li>
										</ul> --></li>
									</ul>
								</c:forEach> <!-- 	</li>
					</ul> --> <!-- <li> <a href="addLocation"><em>AddLocation</em></a></li> -->
					</li>
					</ul>
					</div>

				</div>
			</div>


			<div id="#addLoc" class="modal">
				<div class="modal-content">
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
						do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
						enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
						reprehenderit in voluptate velit esse cillum dolore eu fugiat
						nulla pariatur. Excepteur sint occaecat cupidatat non proident,
						sunt in culpa qui officia deserunt mollit anim id est laborum</p>
				</div>
				<div class="modal-footer">
					<a href="#"
						class=" waves-red btn-flat modal-action modal-close">Disagree</a>
					<a href="#"
						class=" waves-green btn-flat modal-action modal-close">Agree</a>
				</div>
			</div>


			<div class="col col s8 s8 l8">
				
				<div id="divSection"
					style="display:none;font-family: 'Open Sans', sans-serif; background-color: #fff; border-radius: 5px; box-shadow: 0 2px 5px 0 #000, 0 2px 10px 0 #000;">
					
					<div class="grey lighten-3"
									style="box-shadow: 0 2px 5px 0 #000, 0 2px 10px 0 #000; padding: 2% 5% 3% 5%">
									
									<div class="row" id="actionItems">
										  
										
									</div>

									<div class="divider"></div>
									
									<!-- Displaying Title -->
									<div id="displayDirectoryTitle">
										
									</div>

									<!-- Displaying Caption -->
									<div id="displayDirectoryCaption">
										
									</div>
									
									<br/>

									<!-- Displaying Timings -->
									<div id="displayDirectoryTimings">
										
									</div>
									

									<!-- Displaying Discription-->
									<div id="displayDirectoryDesc">
									
									</div>
									
									<!-- Displaying Image-->
									<div id="displayDirectoryImage">
									
									</div>
									
									<table class="table table-hover" style="background-color:#EEEEEE">
									     
									     <tbody id="displayDirectoryMenuList"></tbody>
									     
									    
									
									</table>
						
									
					</div>
					
				</div>
				
				
				<!--Start of displaying Location Details  -->
				
				
				<div class="locPopup" style="display: none;">
					<div class="row"
						style="border-radius: 5px; box-shadow: 0 2px 5px 0 #000, 0 2px 10px 0 #000;">

						<c:forEach var="locObjForAddDirectoryItems"
							items="${locObjForAddDirectoryItems }">

							<div
								class="${locObjForAddDirectoryItems.objectId } grey lighten-3"
								style="display: none; box-shadow: 0 2px 5px 0 #000, 0 2px 10px 0 #000; padding: 2% 5% 3% 5%">



								
								<div class="row" >
           <a id="${locObjForAddDirectoryItems.objectId }"
    onclick="preview_Directory_click(this.id)" class=" waves-light btn right"
     style="margin: 0 7px">Preview</a>
      <a id="${locObjForAddDirectoryItems.objectId }"
    onclick="adminApp1(this.id)" class=" waves-light btn right modal-trigger right"
    href="#modal29" style="margin: 0 7px">Menu Items</a>
           <a id="${locObjForAddDirectoryItems.objectId }"
    onclick="edit_Directory_click(this.id)" class=" waves-light btn modal-trigger right"
    href="#editLocation" style="margin: 0 7px">Edit Hotel</a> <a id="${locObjForAddDirectoryItems.objectId }"
     onclick="del_Loc_click(this.id)" class=" waves-light btn modal-trigger right"
    href="#deleteLocation"    style="margin: 0 7px">Delete this Hotel</a>
              <a id="${locObjForAddDirectoryItems.objectId }"
       onclick="add_DirectoryItems_click(this.id)" class=" waves-light btn modal-trigger right addDirectoryItemButton"
           href="#add" style="margin: 0 7px">Add Directory Item</a>
          </div>

								<div class="divider"></div>

								 <br/>
<div style="background-color:#${locObjForAddDirectoryItems.brandBackgroundColor}">
    <div class="row" style="margin-left:0px;">   
    	<div class="col col s2 m2 l2" style="margin-top: 148px;padding-right:5px;text-align:right;min-height:0px;background-color:#${locObjForAddDirectoryItems.addressBackgroundColor}">
       
      	<c:if test="${not empty locObjForAddDirectoryItems.address}">
         <span class="active" for="first_name2"
          style="font-size: ${locObjForAddDirectoryItems.addressFont };color:#${locObjForAddDirectoryItems.addressColor };font-family: ${locObjForAddDirectoryItems.locationAddressFontFamily }">${locObjForAddDirectoryItems.address }</span>
        </c:if>
        
        
        <c:if test="${not empty locObjForAddDirectoryItems.address2}">
        	
         <br/><span class="active" for="first_name2"
          style="font-size: ${locObjForAddDirectoryItems.addressFont };color:#${locObjForAddDirectoryItems.addressColor };font-family: ${locObjForAddDirectoryItems.locationAddressFontFamily }">${locObjForAddDirectoryItems.address2 }</span>
        </c:if>
        
        <c:if test="${not empty locObjForAddDirectoryItems.street}">
         <br/><span class="active" for="first_name2"
          style="font-size: ${locObjForAddDirectoryItems.addressFont };color:#${locObjForAddDirectoryItems.addressColor };font-family: ${locObjForAddDirectoryItems.locationAddressFontFamily }">${locObjForAddDirectoryItems.street }</span>, &nbsp
        </c:if>
        
        <c:if test="${not empty locObjForAddDirectoryItems.town}">
         <span class="active" for="first_name2"
          style="font-size: ${locObjForAddDirectoryItems.addressFont };color:#${locObjForAddDirectoryItems.addressColor };font-family: ${locObjForAddDirectoryItems.locationAddressFontFamily }">${locObjForAddDirectoryItems.town }</span>
        </c:if>
        
        <c:if test="${not empty locObjForAddDirectoryItems.zipcode}">
         <br/><span class="active" for="first_name2"
          style="font-size: ${locObjForAddDirectoryItems.addressFont };color:#${locObjForAddDirectoryItems.addressColor };font-family: ${locObjForAddDirectoryItems.locationAddressFontFamily }">${locObjForAddDirectoryItems.zipcode }</span>
        </c:if>
        
         <c:if test="${not empty locObjForAddDirectoryItems.country}">
         <br/><span class="active" for="first_name2"
          style="font-size: ${locObjForAddDirectoryItems.addressFont };color:#${locObjForAddDirectoryItems.addressColor };font-family: ${locObjForAddDirectoryItems.locationAddressFontFamily }">${locObjForAddDirectoryItems.country}</span>
        </c:if> 
        
        <br/>
        
        
        <c:if test="${locObjForAddDirectoryItems.latitude ne 0.0}">
         <span class="active" for="first_name2"
          style="font-size: ${locObjForAddDirectoryItems.addressFont };color:#${locObjForAddDirectoryItems.addressColor };font-family: ${locObjForAddDirectoryItems.locationAddressFontFamily }">${locObjForAddDirectoryItems.latitude}</span><br/>
        </c:if>
        
        <c:if test="${locObjForAddDirectoryItems.longitude ne 0.0}">
        	<span class="active" for="first_name2"
          style="font-size: ${locObjForAddDirectoryItems.addressFont };color:#${locObjForAddDirectoryItems.addressColor };font-family: ${locObjForAddDirectoryItems.locationAddressFontFamily }">${locObjForAddDirectoryItems.longitude}</span><br/>
        </c:if>
        
       </div>
       <div class="col col s6 m6 l6" >
          <center style="background-color:#${locObjForAddDirectoryItems.hotelLogoBackgroundColor }">
          <c:if test="${locObjForAddDirectoryItems.hotelLogo ne 'No Image To Display'}">
          <div style="width:45%;height:85px;margin:0 28% 0 28%">
              <br/><img alt="" style="width: 100%;
    height: 100%;margin-top: -18px ;text-align:center "
                    src="${locObjForAddDirectoryItems.hotelLogo}">
         </div>
          </c:if>
          </center>
         <center>
         <c:if test="${locObjForAddDirectoryItems.name ne null}" >
                  <br/>  <p class="active" for="first_name2"
                        style="margin-bottom:5px;font-size: ${locObjForAddDirectoryItems.hotelFont };background-color:#${locObjForAddDirectoryItems.hotelTitleBackgroundColor };color:#${locObjForAddDirectoryItems.hotelColor };font-family: ${locObjForAddDirectoryItems.hotelFontFamily }">${locObjForAddDirectoryItems.name }</p>
        </c:if>
        </center>
        <center>
         <c:if test="${locObjForAddDirectoryItems.hotelCaption ne null}" >
                  <p class="active" for="first_name2"
                        style="margin-bottom:5px;font-size: ${locObjForAddDirectoryItems.captionFont };background-color:#${locObjForAddDirectoryItems.hotelCaptionBackgroundColor };color:#${locObjForAddDirectoryItems.captionColor };font-family: ${locObjForAddDirectoryItems.captionFontFamily }">${locObjForAddDirectoryItems.hotelCaption }</p>
        </c:if>
        </center>
        <center style="background-color:#${locObjForAddDirectoryItems.hotelImageBackgroundColor }">
        <c:if test="${locObjForAddDirectoryItems.logo ne 'No Image To Display'}">
	        <div style="width:75%;margin-left:0%;height:180px">
	        	
	            <img alt="" style="width: 100%; height:100%;"
	            src="${locObjForAddDirectoryItems.logo}">
	         
	         
	        </div>
         </c:if>
         </center>
       </div>
       <div class="col col s4 m4 l4 qrcodeCSS" >
       <div style="font-size:15px"><span><b>Android & iOS QR Code</b></span></div>
       <img alt="" style="width: 62%; height: 113px;margin-top:10px" src="${locObjForAddDirectoryItems.qRCode}">
        
          <a href="#" onclick="VoucherPrint('${locObjForAddDirectoryItems.qRCode}'); return true;" class=" waves-light btn modal-trigger right" style="margin: 40px 7px;padding-top:10px;margin-bottom:15px;">Print</a>
         
         <%-- <div onclick="preview_Hotel_click(this)" class="${locObjForAddDirectoryItems.objectId }" style="cursor:pointer;font-size:11px;margin-top:10px">
         		
         		https://bnc.lt/a/key_live_hhoW7g0luMxwlGYKg4TelepbrzdSrV36?&<br/>param=directories.html?id=${locObjForAddDirectoryItems.objectId }&<br/>data=eyIkYWx3YXlzX2RlZXBsaW5rIjoiVHJ1ZSJ9==
         	</div> --%>
         <br/>
         <div style="margin-top:15px;font-size:15px"><span><b>Web QR Code</b></span></div>
         <img alt="" style="width: 62%; height: 113px;margin-top:10px" src="${locObjForAddDirectoryItems.webqrCode}">
        
          <a href="#" onclick="VoucherPrint('${locObjForAddDirectoryItems.webqrCode}'); return true;" class=" waves-light btn modal-trigger right" style="margin: 40px 7px;padding-top:10px;margin-bottom:15px;">Print</a>
         
         <div onclick="web_preview_Hotel_click(this)" class="${locObjForAddDirectoryItems.objectId }" style="cursor:pointer;font-size:11px;margin-top:10px">
         		
         		http://egsd.mobldir.com:8080/egsdMobileApp/<br/>directories.html?id=${locObjForAddDirectoryItems.objectId }
         	</div>	
         	
         	
       </div>
       
       </div>
       <c:if test="${locObjForAddDirectoryItems.description ne null}">
                <div id="hotelDescription" style="padding:0 40% 0 23%">${locObjForAddDirectoryItems.description}</div>
        </c:if>
       
       <center style="background-color:#${locObjForAddDirectoryItems.footerImageBackgroundColor }">
       <c:if test="${locObjForAddDirectoryItems.footerLogo ne 'No Image To Display'}">
       <div style="width:18%;height:81px;margin:0 0 2% 2%">
       
        <img alt="" style="width: 100%; height:100%;"src="${locObjForAddDirectoryItems.footerLogo}">  
        
        
       </div>
        </c:if>
        </center>
        
        <center>
        	<c:if test="${locObjForAddDirectoryItems.footerText ne null}">
        		<br/>
                <div style="background-color:#${locObjForAddDirectoryItems.hotelFooterBackgroundColor} ;color:#${locObjForAddDirectoryItems.footerTextColor} ;font-size:${locObjForAddDirectoryItems.footerFont} ; font-family:${locObjForAddDirectoryItems.footerFontFamily} ;">${locObjForAddDirectoryItems.footerText}</div>
       		 </c:if>
        	
        </center>
       
      </div>
       
       
       <%-- <div class="row">
        <div class="col col s4 m4 l4" >
        
        <br/>
              
        <c:if test="${locObjForAddDirectoryItems.name ne null}" >
        <b> <span class="active" for="first_name2"
          style="margin-left-70px;font-size: ${locObjForAddDirectoryItems.hotelFont };color:#${locObjForAddDirectoryItems.hotelColor };font-family: ${locObjForAddDirectoryItems.hotelFontFamily }">${locObjForAddDirectoryItems.name }</span></b><br/>
        </c:if>
        <c:if test="${locObjForAddDirectoryItems.logo ne 'No Image To Display'}">
        <br/><img alt="" style="width: 100%; height: 180px;    margin-left: 243px;    margin-top: 18px;"
         src="${locObjForAddDirectoryItems.logo}">
         
        </c:if>
        
        
        <c:if test="${locObjForAddDirectoryItems.logo ne 'No Image To Display'}">
        <br/><img alt="" style="width: 100%; height: 180px;  margin-left: 243px;margin-top:-470px;"
         src="${locObjForAddDirectoryItems.hotelLogo}">
         
        </c:if><br><br>
        
        
<div class="boxed" style="border: 1px solid green ;width: 840px;margin-left: -41px;height: 124px;">
             <c:if test="${locObjForAddDirectoryItems.description ne null}">
                <b>Description :</b>
        <span class="active" for="first_name2"
          style="font-size: 14px;">${locObjForAddDirectoryItems.description }</span>
        </c:if>
        <br/>
        <c:if test="${locObjForAddDirectoryItems.address ne null}">
         <span class="active" for="first_name2"
          style="font-size: ${locObjForAddDirectoryItems.addressFont };color:#${locObjForAddDirectoryItems.addressColor };font-family: ${locObjForAddDirectoryItems.addressFontFamily }">${locObjForAddDirectoryItems.address }</span><br/>
        </c:if>
        
        <c:if test="${locObjForAddDirectoryItems.address2 ne null}">
         <span class="active" for="first_name2"
          style="font-size: ${locObjForAddDirectoryItems.addressFont };color:#${locObjForAddDirectoryItems.addressColor };font-family: ${locObjForAddDirectoryItems.addressFontFamily }">${locObjForAddDirectoryItems.address2 }</span><br/>
        </c:if>
        
        <c:if test="${locObjForAddDirectoryItems.street ne null}">
         <span class="active" for="first_name2"
          style="font-size: ${locObjForAddDirectoryItems.addressFont };color:#${locObjForAddDirectoryItems.addressColor };font-family: ${locObjForAddDirectoryItems.addressFontFamily }">${locObjForAddDirectoryItems.street }</span>, &nbsp
        </c:if>
        
        <c:if test="${locObjForAddDirectoryItems.town ne null}">
         <span class="active" for="first_name2"
          style="font-size: ${locObjForAddDirectoryItems.addressFont };color:#${locObjForAddDirectoryItems.addressColor };font-family: ${locObjForAddDirectoryItems.addressFontFamily }">${locObjForAddDirectoryItems.town }</span><br/>
        </c:if>
        
        <c:if test="${locObjForAddDirectoryItems.zipcode ne null}">
         <span class="active" for="first_name2"
          style="font-size: ${locObjForAddDirectoryItems.addressFont };color:#${locObjForAddDirectoryItems.addressColor };font-family: ${locObjForAddDirectoryItems.addressFontFamily }">${locObjForAddDirectoryItems.zipcode }</span><br/>
        </c:if>
        
         <c:if test="${locObjForAddDirectoryItems.country ne null}">
         <span class="active" for="first_name2"
          style="font-size: ${locObjForAddDirectoryItems.addressFont };color:#${locObjForAddDirectoryItems.addressColor };font-family: ${locObjForAddDirectoryItems.addressFontFamily }">${locObjForAddDirectoryItems.country}</span><br/>
        </c:if> 
 </div>
        <br>
        
        <c:if test="${locObjForAddDirectoryItems.logo ne 'No Image To Display'}">
        <br/><img alt="" style="width: 100%; height: 180px;  margin-left: 243px;  margin-top: 82px;
        "
         src="${locObjForAddDirectoryItems.footerLogo}">
         
        </c:if>
        
        </div>
        <div class="col col s4 m4 l4" style="    margin-left: 255px;
        ">
         	<img alt="" style="width: 62%; height: 113px;    margin-left: 132px;"
         src="${locObjForAddDirectoryItems.qRCode}">
         <br/>
         <br/>
         <a href="print?qrcode=${locObjForAddDirectoryItems.qRCode}" class="waves-effect waves-light btn modal-trigger right" style="margin: 0 7px">Print</a>
         
         <a href="#" onclick="VoucherPrint('${locObjForAddDirectoryItems.qRCode}'); return true;" class="waves-effect waves-light btn modal-trigger right" style="margin: 0 7px">Print</a>
         
        </div>
        <div class="col col s4 m4 l4" style="        margin-left: 258px;   margin-top: 19px;
        ">
         	<span onclick="preview_Hotel_click(this)" class="${locObjForAddDirectoryItems.objectId }" style="cursor:pointer;font-size:11px">
         		http://betabullsapp.github.io/eGSD/directories.html?id=${locObjForAddDirectoryItems.objectId }
         	</span>
        </div>
        
       </div> --%>
								<%-- 											<input type="hidden" name="user" value="${userName}"> --%>
								<!-- 										<input type="file" name="logo" value="choose Image"> -->
								<!-- 											<input type="submit" value="Submit"> -->


							</div>

						</c:forEach>

						<!-- 					</div> -->
					</div>
				
				

      				<%-- <div class="locPopup" style="display: none;">
					<div class="row"
						style="border-radius: 5px; box-shadow: 0 2px 5px 0 #000, 0 2px 10px 0 #000;">

						<c:forEach var="locObjForAddDirectoryItems"
							items="${locObjForAddDirectoryItems }">

							<div
								class="${locObjForAddDirectoryItems.objectId } grey lighten-3"
								style="display: none; box-shadow: 0 2px 5px 0 #000, 0 2px 10px 0 #000; padding: 2% 5% 3% 5%">



								
								<div class="row" >
           <a id="${locObjForAddDirectoryItems.objectId }"
    onclick="preview_Directory_click(this.id)" class="waves-effect waves-light btn right"
     style="margin: 0 7px">Preview</a>
      <a id="${locObjForAddDirectoryItems.objectId }"
    onclick="adminApp1(this.id)" class="waves-effect waves-light btn right modal-trigger right"
    href="#modal29" style="margin: 0 7px">Menu Items</a>
           <a id="${locObjForAddDirectoryItems.objectId }"
    onclick="edit_Directory_click(this.id)" class="waves-effect waves-light btn modal-trigger right"
    href="#editLocation" style="margin: 0 7px">Edit Hotel</a> <a id="${locObjForAddDirectoryItems.objectId }"
     onclick="del_Loc_click(this.id)" class="waves-effect waves-light btn modal-trigger right"
    href="#deleteLocation"    style="margin: 0 7px">Delete this Hotel</a>
              <a id="${locObjForAddDirectoryItems.objectId }"
       onclick="add_DirectoryItems_click(this.id)" class="waves-effect waves-light btn modal-trigger right"
           href="#add" style="margin: 0 7px">Add Directory Item</a>
          </div>

								<div class="divider"></div>

								 <br/>
       <div class="row">
        <div class="col col s4 m4 l4" >
        <c:if test="${locObjForAddDirectoryItems.name ne null}">
        <b> <span class="active" for="first_name2"
          style="font-size: ${locObjForAddDirectoryItems.hotelFont };color:#${locObjForAddDirectoryItems.hotelColor };font-family: ${locObjForAddDirectoryItems.hotelFontFamily }">${locObjForAddDirectoryItems.name }</span></b><br/>
        </c:if>
        <br/>
                <c:if test="${locObjForAddDirectoryItems.description ne null}">
                <b>Description :</b><br/>
        <span class="active" for="first_name2"
          style="font-size: 14px;">${locObjForAddDirectoryItems.description }</span>
        </c:if>
        <br/>
        <c:if test="${locObjForAddDirectoryItems.address ne null}">
         <span class="active" for="first_name2"
          style="font-size: ${locObjForAddDirectoryItems.addressFont };color:#${locObjForAddDirectoryItems.addressColor };font-family: ${locObjForAddDirectoryItems.addressFontFamily }">${locObjForAddDirectoryItems.address }</span><br/>
        </c:if>
        
        <c:if test="${locObjForAddDirectoryItems.address2 ne null}">
         <span class="active" for="first_name2"
          style="font-size: ${locObjForAddDirectoryItems.addressFont };color:#${locObjForAddDirectoryItems.addressColor };font-family: ${locObjForAddDirectoryItems.addressFontFamily }">${locObjForAddDirectoryItems.address2 }</span><br/>
        </c:if>
        
        <c:if test="${locObjForAddDirectoryItems.street ne null}">
         <span class="active" for="first_name2"
          style="font-size: ${locObjForAddDirectoryItems.addressFont };color:#${locObjForAddDirectoryItems.addressColor };font-family: ${locObjForAddDirectoryItems.addressFontFamily }">${locObjForAddDirectoryItems.street }</span>, &nbsp
        </c:if>
        
        <c:if test="${locObjForAddDirectoryItems.town ne null}">
         <span class="active" for="first_name2"
          style="font-size: ${locObjForAddDirectoryItems.addressFont };color:#${locObjForAddDirectoryItems.addressColor };font-family: ${locObjForAddDirectoryItems.addressFontFamily }">${locObjForAddDirectoryItems.town }</span><br/>
        </c:if>
        
        <c:if test="${locObjForAddDirectoryItems.zipcode ne null}">
         <span class="active" for="first_name2"
          style="font-size: ${locObjForAddDirectoryItems.addressFont };color:#${locObjForAddDirectoryItems.addressColor };font-family: ${locObjForAddDirectoryItems.addressFontFamily }">${locObjForAddDirectoryItems.zipcode }</span><br/>
        </c:if>
        
         <c:if test="${locObjForAddDirectoryItems.country ne null}">
         <span class="active" for="first_name2"
          style="font-size: ${locObjForAddDirectoryItems.addressFont };color:#${locObjForAddDirectoryItems.addressColor };font-family: ${locObjForAddDirectoryItems.addressFontFamily }">${locObjForAddDirectoryItems.country}</span><br/>
        </c:if> 
        
        <c:if test="${locObjForAddDirectoryItems.logo ne 'No Image To Display'}">
        <br/><img alt="" style="width: 100%; height: 180px; margin-left: 243px; margin-top: -247px;"
         src="${locObjForAddDirectoryItems.logo}">
         
        </c:if>
        
        <c:if test="${locObjForAddDirectoryItems.hotelLogo ne 'No Image To Display'}">
        <br/><img alt="" style="width: 100%; height: 180px;  margin-left: -8px;"
         src="${locObjForAddDirectoryItems.hotelLogo}">
         
        </c:if>
        <br>
        
        <c:if test="${locObjForAddDirectoryItems.footerLogo ne 'No Image To Display'}">
        <br/><img alt="" style="width: 100%; height: 180px;  margin-left: 267px;  margin-top: -197px;
        "
         src="${locObjForAddDirectoryItems.footerLogo}">
         
        </c:if>
        
        </div>
        <div class="col col s4 m4 l4" style="    margin-left: 255px;
        ">
         	<img alt="" style="width: 62%; height: 113px;    margin-left: 132px;"
         src="${locObjForAddDirectoryItems.qRCode}">
         <br/>
         <br/>
         <a href="print?qrcode=${locObjForAddDirectoryItems.qRCode}" class="waves-effect waves-light btn modal-trigger right" style="margin: 0 7px">Print</a>
         
         <a href="#" onclick="VoucherPrint('${locObjForAddDirectoryItems.qRCode}'); return true;" class="waves-effect waves-light btn modal-trigger right" style="margin: 0 7px">Print</a>
         
        </div>
        <div class="col col s4 m4 l4" style="        margin-left: 258px;   margin-top: 19px;
        ">
         	<span onclick="preview_Hotel_click(this)" class="${locObjForAddDirectoryItems.objectId }" style="cursor:pointer;font-size:11px">
         		http://betabullsapp.github.io/eGSD/directories.html?id=${locObjForAddDirectoryItems.objectId }
         	</span>
        </div>
        
       </div>
																			<input type="hidden" name="user" value="${userName}">
								<!-- 										<input type="file" name="logo" value="choose Image"> -->
								<!-- 											<input type="submit" value="Submit"> -->


							</div>

						</c:forEach>

						<!-- 					</div> -->
					</div>
					<!--End of Displaying location Details  -->


				</div> --%>
				
				
				

			</div>

			</div>
		</div>
		
		<!--  Popup code  -->


		<!--start of edit location  -->
		
						<div class="editLocation"
			style="display: none; opacity: 1; top: 10%; max-height: 50%">
			<div id="editLocation" class="modal" style="width:91%;margin-top:36px;overflow: auto;">
				
				<div class="modal-content directorySpin">
					<center>
					
						<h2 style="margin-left: 76px;margin-top:-40px;"> Edit Hotel Directory Details </h2>
						<span style="margin:2% 0 0 72%" class="customSubmitButton">				
							<a href="javascript: directorySubmitForm1()"  class="btn" method="post" style="width:100px;color:white;padding: 10PX;" >SUBMIT</a>
							
							 <button type="reset" class="btn clearData" style="width:100px;color:white;">Clear</button>
							
							<a href="#"	class="waves-effect waves-green modal-action modal-close waves-effect waves-light btn" style="background-color:#20B2AA;padding:12px; width:100px;color:white" >CANCEL</a>
						</span>
					
					</center>
					
				<p id="uploadHotelLogoText" style="margin-bottom:2px;color:red;text-align:center"></p>
				<p id="uploadLogoText" style="margin-bottom:2px;color:red;text-align:center"></p>
				<p id="uploadHotelFooterText" style="margin-bottom:2px;color:red;text-align:center"></p>
				
				<form:form class="col s12" id="formAction" action="editLocation" name="editLocation"
											method="post" commandName="editLocation"
											enctype="multipart/form-data">
				<c:forEach var="locObjForEditLocation" items="${locObjForEditLocation}">
				
						<div>
							Note: for efficient use of the directory on mobile devices, we apply the following file size limits for uploads:
							<br/>Individual file size limit: ${imageSize } kb
							<br/>Total directory file size limit: ${totalImagesLimit} kb
							<br/>Current total sizes of directory files already uploaded: <span class="updateDirectoriesSize"></span> kb
						</div>
	
						<div class=${locObjForEditLocation.objectId } style="display: none; padding: 10px; text-align: justify">
				
								
											
								<input type="hidden" name="locId"
									value="${locObjForEditLocation.objectId }">
								<input type="hidden" name="directory"
									value="${locObjForEditLocation.directory }">
								<input type="hidden" name="user" value="${user}">
								<input type="hidden" name="userName" value="${userName}">
					<div class="row" >
    <div class="col s2" style="
    margin-left: -39px;
    margin-top: -21px;
">
      <ul class="tabs tabs-left"style="margin-top: 45px;">
        <li class="tab col s12"><a class="active" href="#test111"style="color:white !important">Hotel Details</a></li>
       <!--  <li class="tab col s12"><a href="#test22"style="color:white !important">Group Site ID</a></li> -->
        <li class="tab col s12"><a href="#test33"style="color:white !important">Address</a></li>
        <li class="tab col s12"><a href="#test44"style="color:white !important" >Content</a></li> 
        <li class="tab col s12"><a href="#test55"style="color:white !important">Image</a></li>
        <li class="tab col s12"><a href="#test66"style="color:white !important">Brand Details</a></li>
<!--         <li class="tab col s12"><a href="#test77"style="color:white !important">Welcome Message</a></li>
 -->        <li class="tab col s12"><a href="#test88"style="color:white !important">Footer Details</a></li>
     <!--    <li class="tab col s12"><a href="#test99"style="color:white !important">Address Message</a></li> -->
<!--          <li class="tab col s12"><a href="#test8"style="color:white !important">AddContact</a></li>
 -->       
      </ul>
    </div>
    <div id="test111" class="col s10"style="margin-top: 40px;">
    	<div class="row">
												<div class="input-field col s3" style="display: none">
													<input type="text" style="font-weight: normal; font-size: 14px"  required="" id="dirTitle"   class="title" name="nameeeee"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Hotel Name</label>

												</div>
												<div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px"  required="" id="dirTitle"  value="${locObjForEditLocation.name}" class="title" name="editHotelName"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Hotel Name</label>

												</div>
												
 												<div class="input-field col s2">
 												 	<c:if test="${locObjForEditLocation.templateDetails}">
							 							<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219)"  id="dirTitleColor" name="hotelTitleColor" value="${locObjForEditLocation.hotelColor}" class="color" autocomplete="off" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Color</label>
													</c:if>
													<c:if test="${!locObjForEditLocation.templateDetails}">
							 							<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219)"  id="dirTitleColor" name="hotelTitleColor" value="${locObjForEditLocation.hotelColor}" class="color" autocomplete="off"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Color</label>
													</c:if>
													
												</div>
												<div class="input-field col s2">
 												 	<c:if test="${locObjForEditLocation.templateDetails}">
							 							<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219)"  id="dirTitleColor" name="hotelTitleColor" value="${locObjForEditLocation.hotelTitleBackgroundColor}" class="color" autocomplete="off" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Background Color</label>
													</c:if>
													<c:if test="${!locObjForEditLocation.templateDetails}">
							 							<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219)"  id="dirTitleColor" name="hotelTitleColor" value="${locObjForEditLocation.hotelTitleBackgroundColor}" class="color" autocomplete="off"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Background Color</label>
													</c:if>
													
												</div>
												<div class="input-field col s2">
													<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Size</label>
													<c:if test="${locObjForEditLocation.templateDetails}">
							 							<select name="hotelTitleFont" id="dirTitleFont" class="browser-default" disabled>
													</c:if>
													<c:if test="${!locObjForEditLocation.templateDetails}">
							 							<select name="hotelTitleFont" id="dirTitleFont" class="browser-default">
													</c:if>
													
													<c:if test="${locObjForEditLocation.hotelFont ne null}">
							 							<option style="font-size:${locObjForEditLocation.hotelFont} " value="${locObjForEditLocation.hotelFont}">${locObjForEditLocation.hotelFont}</option>
													</c:if>
													
														<option style="font-size: initial" value="initial">initial</option>
														<option style="font-size: xx-small" value="xx-small">xx-small</option>
														<option style="font-size: x-small" value="x-small">x-small</option>
														<option style="font-size: small" value="small">small</option>
														<option style="font-size: medium" value="medium">medium</option>
														<option style="font-size: large" value="large">large</option>
														<option style="font-size: x-large" value="x-large">x-large</option>
														<option style="font-size: xx-large" value="xx-large">xx-large</option>
														<option style="font-size: smaller" value="smaller">smaller</option>
														<option style="font-size: larger" value="larger">larger</option>
													</select>
												</div>
												<div class="input-field col s3">
													<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Family</label>
													<c:if test="${locObjForEditLocation.templateDetails}">
							 							<select name="hotelTitleFontFamily" id="dirTitleFamily" class="browser-default" disabled>
													</c:if>
													<c:if test="${!locObjForEditLocation.templateDetails}">
							 							<select name="hotelTitleFontFamily" id="dirTitleFamily" class="browser-default">
													</c:if>
													
													<c:if test="${locObjForEditLocation.hotelFontFamily ne null}">
							 							<option style="font-family:${locObjForEditLocation.hotelFontFamily}" value="${locObjForEditLocation.hotelFontFamily}">${locObjForEditLocation.hotelFontFamily}</option>
													</c:if>
														
														<option style="font-family:Courier New" value="Courier New">Courier New</option>
														<option style="font-family:Lucida Console" value="Lucida Console">Lucida Console</option>
														<option style="font-family:Verdana" value="Verdana">Verdana</option>
														<option style="font-family:sans-serif" value="sans-serif">sans-serif</option>
														<option style="font-family:Tahoma" value="Tahoma">Tahoma</option>
														<option style="font-family:Lucida Grande" value="Lucida Grande">Lucida Grande</option>
														<option style="font-family:Charcoal" value="Charcoal">Charcoal</option>
														<option style="font-family:Comic Sans MS" value="Comic Sans MS">Comic Sans MS</option>
														<option style="font-family:Arial Black" value="Arial Black">Arial Black</option>
														<option style="font-family:Arial" value="Arial">Arial</option>
														<option style="font-family:Times New Roman" value="Times New Roman">Times New Roman</option>
														<option style="font-family:Palatino Linotype" value="Palatino Linotype">Palatino Linotype</option>
														<option style="font-family:Georgia" value="Georgia">Georgia</option>
													</select>
												</div> 
		</div>
		<div class="row">
												<div class="input-field col s3" style="display: none">
													<input type="text" style="font-weight: normal; font-size: 14px"  required="" id="dirTitle"   class="title" name="nameeeee"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Caption</label>

												</div>
												<div class="input-field col s3">
												
													<input type="text" style="font-weight: normal; font-size: 14px"  required="" id="dirTitle"  value="${locObjForEditLocation.hotelCaption}" class="title" name="hotelCaption"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Caption</label>
													

												</div>
												
 												 <div class="input-field col s2">
 												 
 												 	<c:if test="${locObjForEditLocation.templateDetails}">
							 							<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219)"  id="dirTitleColor" name="hotelCaptionColor" value="${locObjForEditLocation.captionColor}" class="color" autocomplete="off" disabled> <label style="font-weight: normal; font-size: 14px;" class="active">Font Color</label>
													</c:if>
													<c:if test="${!locObjForEditLocation.templateDetails}">
							 							<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219)"  id="dirTitleColor" name="hotelCaptionColor" value="${locObjForEditLocation.captionColor}" class="color" autocomplete="off"> <label style="font-weight: normal; font-size: 14px;" class="active">Font Color</label>
													</c:if>
													
												</div>
												<div class="input-field col s2">
 												 
 												 	<c:if test="${locObjForEditLocation.templateDetails}">
							 							<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219)"  id="dirTitleColor" name="hotelCaptionColor" value="${locObjForEditLocation.hotelCaptionBackgroundColor}" class="color" autocomplete="off" disabled> <label style="font-weight: normal; font-size: 14px;" class="active">Background Color</label>
													</c:if>
													<c:if test="${!locObjForEditLocation.templateDetails}">
							 							<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219)"  id="dirTitleColor" name="hotelCaptionColor" value="${locObjForEditLocation.hotelCaptionBackgroundColor}" class="color" autocomplete="off"> <label style="font-weight: normal; font-size: 14px;" class="active">Background Color</label>
													</c:if>
													
												</div>
												<div class="input-field col s2">
													<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Size</label>
													<c:if test="${locObjForEditLocation.templateDetails}">
							 							<select name="hotelCaptionFont" id="dirTitleFont" class="browser-default" disabled>
													</c:if>
													<c:if test="${!locObjForEditLocation.templateDetails}">
							 							<select name="hotelCaptionFont" id="dirTitleFont" class="browser-default">
													</c:if>
													
													<c:if test="${locObjForEditLocation.captionFont ne null}">
							 							<option style="font-size: ${locObjForEditLocation.captionFont}" value="${locObjForEditLocation.captionFont}">${locObjForEditLocation.captionFont}</option>
													</c:if>
														
														<option style="font-size: initial" value="initial">initial</option>
														<option style="font-size: xx-small" value="xx-small">xx-small</option>
														<option style="font-size: x-small" value="x-small">x-small</option>
														<option style="font-size: small" value="small">small</option>
														<option style="font-size: medium" value="medium">medium</option>
														<option style="font-size: large" value="large">large</option>
														<option style="font-size: x-large" value="x-large">x-large</option>
														<option style="font-size: xx-large" value="xx-large">xx-large</option>
														<option style="font-size: smaller" value="smaller">smaller</option>
														<option style="font-size: larger" value="larger">larger</option>
													</select>
												</div>
												<div class="input-field col s3">
													<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Family</label>
													<c:if test="${locObjForEditLocation.templateDetails}">
							 							<select name="hotelCaptionFontFamily" id="dirTitleFamily" class="browser-default" disabled>
													</c:if>
													<c:if test="${!locObjForEditLocation.templateDetails}">
							 							<select name="hotelCaptionFontFamily" id="dirTitleFamily" class="browser-default">
													</c:if>
													
													<c:if test="${locObjForEditLocation.captionFontFamily ne null}">
							 							<option style="font-family:${locObjForEditLocation.captionFontFamily}" value="${locObjForEditLocation.captionFontFamily}">${locObjForEditLocation.captionFontFamily}</option>
													</c:if>
														
														<option style="font-family:Courier New" value="Courier New">Courier New</option>
														<option style="font-family:Lucida Console" value="Lucida Console">Lucida Console</option>
														<option style="font-family:Verdana" value="Verdana">Verdana</option>
														<option style="font-family:sans-serif" value="sans-serif">sans-serif</option>
														<option style="font-family:Tahoma" value="Tahoma">Tahoma</option>
														<option style="font-family:Lucida Grande" value="Lucida Grande">Lucida Grande</option>
														<option style="font-family:Charcoal" value="Charcoal">Charcoal</option>
														<option style="font-family:Comic Sans MS" value="Comic Sans MS">Comic Sans MS</option>
														<option style="font-family:Arial Black" value="Arial Black">Arial Black</option>
														<option style="font-family:Arial" value="Arial">Arial</option>
														<option style="font-family:Times New Roman" value="Times New Roman">Times New Roman</option>
														<option style="font-family:Palatino Linotype" value="Palatino Linotype">Palatino Linotype</option>
														<option style="font-family:Georgia" value="Georgia">Georgia</option>
													</select>
												</div> 
												
		</div>
		
		
		<div row>
		
												<div class="input-field col s3" style="margin-left: -16px;">
													<input type="text" style="font-weight: normal; font-size: 14px" required=""  id="dirCaption" name="siteIdName" value="${locObjForEditLocation.siteId}"> <label style="font-weight: normal; margin-left:-7px;font-size: 14px" class="active">Group Site ID</label>
												</div>
		
		</div>
		
    </div>
<%--      <div id="test22" class="col s10" style="margin-top: 40px;">
    	<div class="row">
    	
    											<div class="input-field col s3" style="display: none">
													<input type="hidden" style="font-weight: normal; font-size: 14px" required="" class="title" id="dirCapt" > <label style="font-weight: normal; font-size: 14px" class="active"></label>
												</div>
    											
												<div class="input-field col s3" style="display: none">
													<input type="text" style="font-weight: normal; font-size: 14px" required="" class="title" id="dirCaption" name="siteIdName" value="${locObjForEditLocation.siteId}"> <label style="font-weight: normal; font-size: 14px" class="active">Group Site ID</label>
												</div>
												
												<div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px" required="" class="title" id="dirCaption" name="siteIdName" value="${locObjForEditLocation.siteId}"> <label style="font-weight: normal; font-size: 14px" class="active">Group Site ID</label>
												</div>
												 <div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="dirCaptionColor"  name="captionColor" class="color" autocomplete="off"> <label style="font-weight: normal; font-size: 14px;" class="active">Color</label>
												</div> 
												 <div class="input-field col s3">
													<select name="captionFont" id="dirCaptionFont" class="browser-default">
														<option style="font-size: initial" value="initial">initial</option>
														<option style="font-size: xx-small" value="xx-small">xx-small</option>
														<option style="font-size: x-small" value="x-small">x-small</option>
														<option style="font-size: small" value="small">small</option>
														<option style="font-size: medium" value="medium">medium</option>
														<option style="font-size: large" value="large">large</option>
														<option style="font-size: x-large" value="x-large">x-large</option>
														<option style="font-size: xx-large" value="xx-large">xx-large</option>
														<option style="font-size: smaller" value="smaller">smaller</option>
														<option style="font-size: larger" value="larger">larger</option>
													</select>
												</div> 
												<div class="input-field col s3">
													<select name="captionFamily" id="dirCaptionFamily" class="browser-default">
														<option style="font-family:Courier New" value="Courier New">Courier New</option>
														<option style="font-family:Lucida Console" value="Lucida Console">Lucida Console</option>
														<option style="font-family:Verdana" value="Verdana">Verdana</option>
														<option style="font-family:Trebuchet MS" value="Trebuchet MS">sans-serif</option>
														<option style="font-family:Tahoma" value="Tahoma">Tahoma</option>
														<option style="font-family:Lucida Sans Unicode" value="Lucida Sans Unicode">Lucida Grande</option>
														<option style="font-family:Charcoal" value="Charcoal">Charcoal</option>
														<option style="font-family:Comic Sans MS" value="Comic Sans MS">Comic Sans MS</option>
														<option style="font-family:Arial Black" value="Arial Black">Arial Black</option>
														<option style="font-family:Arial" value="Arial">Arial</option>
														<option style="font-family:Times New Roman" value="Times New Roman">Times New Roman</option>
														<option style="font-family:Palatino Linotype" value="Palatino Linotype">Palatino Linotype</option>
														<option style="font-family:Georgia" value="Georgia">Georgia</option>
													</select>
												</div> 
		</div>
    </div>
 --%>     <div id="test33" class="col s10" style="margin-top: 40px;">
    	<div class="row">
												
												<div class="input-field col s6" style="display:none">
													<input type="text" style="font-weight: normal; font-size: 14px" id="dirTimgs" required="" class="ttle" value="${locObjForEditLocation}" name="adds"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Addres</label>
												</div>
												
												<div class="input-field col s6">
													<input type="text" style="font-weight: normal; font-size: 14px" id="dirTimings" required="" class="title" value="${locObjForEditLocation.address}" name="address"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Address1</label>
												</div>
												
												<div class="input-field col s6">
													<input type="text" style="font-weight: normal; font-size: 14px" id="dirTimings" required="" class="title" value="${locObjForEditLocation.address2}" name="address2"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Address2</label>
												</div>
												
																								
												<div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px" id="dirTimings" required="" class="title" value="${locObjForEditLocation.street}" name="street"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">City</label>
												</div>
												
												<div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px" id="dirTimings" required="" class="title" value="${locObjForEditLocation.town}" name="town"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">State/Province</label>
												</div>
												<div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px" id="editHotelZipcode" onkeyup = "Validate(this)" required="" class="title" value="${locObjForEditLocation.zipcode}" name="zipcode"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Zip Code/Postal Code</label>
												</div>
												
												<div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px" id="dirTimings" required="" class="title" value="${locObjForEditLocation.country}" name="country"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Country</label>
												</div>
												<br><br>
												
												<div class="input-field col s6">
													<input type="text" style="font-weight: normal; font-size: 14px" onkeypress="return isNumber(event)" id="editLongitude" required="" class="title" value="${locObjForEditLocation.longitude}" name="longitude"> <label style="font-weight: normal;margin-left:-7px; font-size: 14px" class="active">Longitude</label>
												</div>
												
												<div class="input-field col s6">
													<input type="text" style="font-weight: normal; font-size: 14px" onkeypress="return isNumber(event)" id="editLatitude" required="" class="title" value="${locObjForEditLocation.latitude}" name="latitude"> <label style="font-weight: normal;margin-left:-7px; font-size: 14px" class="active">Latitude</label>
												</div>
												
												
												
												<!-- <div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px" required="" class="title" id="dirCaption" name="addressId" value="Address details" readonly> <label style="font-weight: normal; font-size: 14px" class="active">Address</label>
												</div> -->
												<!-- <div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="dirCaptionColor" value="3623DB" name="addressbgColor" class="color" autocomplete="off"> <label style="font-weight: normal; font-size: 14px;" class="active">Background Color</label>
												</div> -->
												<div class="input-field col s3">
													<c:if test="${locObjForEditLocation.addressDetails}">
							 							<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="dirCaptionColor"  name="addressColor" class="color" autocomplete="off" value="${locObjForEditLocation.addressColor}" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Address Font Color</label>
													</c:if>
													<c:if test="${!locObjForEditLocation.addressDetails}">
							 							<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="dirCaptionColor"  name="addressColor" class="color" autocomplete="off" value="${locObjForEditLocation.addressColor}"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Address Font Color</label>
													</c:if>
													
												</div>
												<div class="input-field col s3">
													<c:if test="${locObjForEditLocation.addressDetails}">
							 							<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="dirCaptionColor"  name="addressColor" class="color" autocomplete="off" value="${locObjForEditLocation.addressBackgroundColor}" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Address Background Color</label>
													</c:if>
													<c:if test="${!locObjForEditLocation.addressDetails}">
							 							<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="dirCaptionColor"  name="addressColor" class="color" autocomplete="off" value="${locObjForEditLocation.addressBackgroundColor}"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Address Background Color</label>
													</c:if>
													
												</div>
												<div class="input-field col s3">
													<c:if test="${locObjForEditLocation.addressDetails}">
							 							<select name="addressFont" id="dirCaptionFont" class="browser-default" disabled>
													</c:if>
													<c:if test="${!locObjForEditLocation.addressDetails}">
							 							<select name="addressFont" id="dirCaptionFont" class="browser-default">
													</c:if>
													
													<c:if test="${locObjForEditLocation.addressFont ne null}">
							 							<option style="font-size:${locObjForEditLocation.addressFont}" value="${locObjForEditLocation.addressFont}">${locObjForEditLocation.addressFont}</option>
													</c:if>
														
														<option style="font-size: initial" value="initial">initial</option>
														<option style="font-size: xx-small" value="xx-small">xx-small</option>
														<option style="font-size: x-small" value="x-small">x-small</option>
														<option style="font-size: small" value="small">small</option>
														<option style="font-size: medium" value="medium">medium</option>
														<option style="font-size: large" value="large">large</option>
														<option style="font-size: x-large" value="x-large">x-large</option>
														<option style="font-size: xx-large" value="xx-large">xx-large</option>
														<option style="font-size: smaller" value="smaller">smaller</option>
														<option style="font-size: larger" value="larger">larger</option>
													</select>
													<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Address Font Size</label>
												</div>
												<div class="input-field col s3">
													<c:if test="${locObjForEditLocation.addressDetails}">
							 							<select name="addressFamily" id="dirTitleFamily" class="browser-default" disabled>
													</c:if>
													<c:if test="${!locObjForEditLocation.addressDetails}">
							 							<select name="addressFamily" id="dirTitleFamily" class="browser-default">
													</c:if>
													
													<c:if test="${locObjForEditLocation.locationAddressFontFamily ne null}">
							 							<option style="font-family:${locObjForEditLocation.locationAddressFontFamily}" value="${locObjForEditLocation.locationAddressFontFamily}">${locObjForEditLocation.locationAddressFontFamily}</option>
													</c:if>
														
														<option style="font-family:Courier New" value="Courier New">Courier New</option>
														<option style="font-family:Lucida Console" value="Lucida Console">Lucida Console</option>
														<option style="font-family:Verdana" value="Verdana">Verdana</option>
														<option style="font-family:sans-serif" value="sans-serif">sans-serif</option>
														<option style="font-family:Tahoma" value="Tahoma">Tahoma</option>
														<option style="font-family:Lucida Grande" value="Lucida Grande">Lucida Grande</option>
														<option style="font-family:Charcoal" value="Charcoal">Charcoal</option>
														<option style="font-family:Comic Sans MS" value="Comic Sans MS">Comic Sans MS</option>
														<option style="font-family:Arial Black" value="Arial Black">Arial Black</option>
														<option style="font-family:Arial" value="Arial">Arial</option>
														<option style="font-family:Times New Roman" value="Times New Roman">Times New Roman</option>
														<option style="font-family:Palatino Linotype" value="Palatino Linotype">Palatino Linotype</option>
														<option style="font-family:Georgia" value="Georgia">Georgia</option>
													</select>
													<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Address Font Family</label>
												</div> 
												
												
												
												
		</div>
    </div>
    
    <div id="test44" class="col s10">
   
    	<div class="row" style="width:100%;margin:23px 0 0 16px">
      <div class="" >
                        <div class="">
                            <!-- <div class="html-editor" > -->  
                            <textarea ></textarea>
                            
    
    </div> 
      		     <input type="hidden" id="112244" name="descriptionhtml" />
      		     
      		     <input type="hidden" id="editCount" value="0" />
      						  
 						
                        
  </div>
 </div>      
  </div>
 
   



<div id="test55" class="col s10">
     <div class="row">
    		
    		<div class="row">
				<div class="input-field col s7">
	          		<div class="file-field input-field">
			           <div class="btn" style="padding: 0 10px 0 10px;color:white">
			            <span>Hotel Logo</span> 
			            <c:if test="${locObjForEditLocation.templateLogo}" >
							<input type="file" name="hotelLogo" disabled>
						</c:if>
						<c:if test="${!locObjForEditLocation.templateLogo}">
							<input type="file" name="hotelLogo" id="uploadHotelLogo">
						</c:if>
			           </div>
			           <div class="file-path-wrapper" style="">
			            <input class="file-path validate" id="imgUrl2" type="text" value=""
			             style="font-size: 20px; ">
			           </div>
			        </div>
	          	</div>
	          	<div class="input-field col s2" style="margin-top:40px">
	          		<c:if test="${locObjForEditLocation.templateLogo}" >
						<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="brandBGColor"  name="hotelLogoBackgroundColor" class="color" autocomplete="off" value="${locObjForEditLocation.hotelLogoBackgroundColor}" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Hotel Logo Background Color</label>
					</c:if>
					<c:if test="${!locObjForEditLocation.templateLogo}">
						<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="brandBGColor"  name="hotelLogoBackgroundColor" class="color" autocomplete="off" value="${locObjForEditLocation.hotelLogoBackgroundColor}"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Hotel Logo Background Color</label>
					</c:if>
	          		
	          	</div>
	          	<div class="input-field col s3" style="padding:0 1% 0 7%">
	          		<c:if test="${locObjForEditLocation.hotelLogo ne 'No Image To Display'}">
			           <image src="${locObjForEditLocation.hotelLogo}" style="width:100%;height:100%;
			           height:100px;"/>
			         
			        </c:if>
			        
			        <input type="hidden" value="${locObjForEditLocation.hotelLogoSize}" id="hotelLogoSize">
	          	</div>
	         </div>
	          	
	          	
	         <div class="row"> 	
	          	<div class="input-field col s7">
	          		<div class="file-field input-field">
			           <div class="btn" style="padding: 0 10px 0 10px;color:white">
			            <span>Hotel Image</span>
			             <c:if test="${locObjForEditLocation.templateImage}">
							<input type="file" name="logo" multiple disabled>
						</c:if>
						<c:if test="${!locObjForEditLocation.templateImage}">
							<input type="file" name="logo" multiple id="uploadLogo">
						</c:if>
			           </div>
			           <div class="file-path-wrapper" style="width:392px">
			            <input class="file-path" id="imgUrl1" type="text" 
			             style="font-size: 20px;   ">
			           </div>
			        </div>
	          	</div>
	          	<div class="input-field col s2" style="margin-top:40px">
	          		<c:if test="${locObjForEditLocation.templateImage}" >
						<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="brandBGColor"  name="hotelImageBackgroundColor" class="color" autocomplete="off" value="${locObjForEditLocation.hotelImageBackgroundColor}" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Hotel Image Background Color</label>
					</c:if>
					<c:if test="${!locObjForEditLocation.templateImage}">
						<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="brandBGColor"  name="hotelImageBackgroundColor" class="color" autocomplete="off" value="${locObjForEditLocation.hotelImageBackgroundColor}"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Hotel Image Background Color</label>
					</c:if>
	          		
	          	</div>
	          	<div class="input-field col s3" style="padding:0 1% 0 7%">
	          		<c:if test="${locObjForEditLocation.logo ne 'No Image To Display'}">
						<image src="${locObjForEditLocation.logo}" style="width: 100%;height: 100%;"/>         
	         		</c:if>
	         		<input type="hidden" value="${locObjForEditLocation.logoSize}" id="logoImageSize">
	          	</div>
	         </div> 	
	         
	         <div class="row"> 	
	          	<div class="input-field col s7">
	          		<div class="file-field input-field">
			           <div class="btn" style="padding: 0 10px 0 10px;color:white">
			            <span>Hotel Footer</span>
			             <c:if test="${locObjForEditLocation.templateFooter}">
							<input type="file" name="hotelFooter" disabled>
						</c:if>
						<c:if test="${!locObjForEditLocation.templateFooter}">
							<input type="file" name="hotelFooter" id="uploadHotelFooter">
						</c:if>
			           </div>
			           <div class="file-path-wrapper" style="width:380px">
			            <input class="file-path validate" id="imgUrl3" type="text" value=""
			             style="font-size: 20px; ">
			           </div>
	           		</div>
	          	</div>
	          	<div class="input-field col s2" style="margin-top:40px">
	          		<c:if test="${locObjForEditLocation.templateFooter}" >
						<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="brandBGColor"  name="hotelFooterBackgroundColor" class="color" autocomplete="off" value="${locObjForEditLocation.footerImageBackgroundColor}" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Hotel Footer Background Color</label>
					</c:if>
					<c:if test="${!locObjForEditLocation.templateFooter}">
						<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="brandBGColor"  name="hotelFooterBackgroundColor" class="color" autocomplete="off" value="${locObjForEditLocation.footerImageBackgroundColor}"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Hotel Footer Background Color</label>
					</c:if>
	          		
	          	</div>
	          	<div class="input-field col s3" style="padding:0 1% 0 7%">
	          		<c:if test="${locObjForEditLocation.footerLogo ne 'No Image To Display'}">
						<image src="${locObjForEditLocation.footerLogo}" style="width:100%;height:100%;"/>        
	         		</c:if>
	         		<input type="hidden" value="${locObjForEditLocation.footerImageSize}" id="hotelFooterImageSize">
	          	</div>
	        </div>
		</div>
	</div>


   <div id="test66" class="col s10" style="">
    	<div class="row" style="    margin-left: 10px;
    margin-top: 40px;">
												
												<div class="input-field col s3">
													<c:if test="${locObjForEditLocation.brandDetails}">
							 							<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="brandBGColor"  name="brandBGColor" class="color" autocomplete="off" value="${locObjForEditLocation.brandBackgroundColor}" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Hotel/Brand Background Color</label>
													</c:if>
													<c:if test="${!locObjForEditLocation.brandDetails}">
							 							<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="brandBGColor"  name="brandBGColor" class="color" autocomplete="off" value="${locObjForEditLocation.brandBackgroundColor}"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Hotel/Brand Background Color</label>
													</c:if>
													
												</div>
												<div class="input-field col s3">
													<c:if test="${locObjForEditLocation.brandDetails}">
							 							<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="brandBGColor"  name="brandButtonColor" class="color" autocomplete="off" value="${locObjForEditLocation.brandButtonColor}" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Button Color</label>
													</c:if>
													<c:if test="${!locObjForEditLocation.brandDetails}">
							 							<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="brandBGColor"  name="brandButtonColor" class="color" autocomplete="off" value="${locObjForEditLocation.brandButtonColor}"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Button Color</label>
													</c:if>
													
												</div>
												<div class="input-field col s3">
													<c:if test="${locObjForEditLocation.brandDetails}">
							 							<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="brandBGColor"  name="brandFontColor" class="color" autocomplete="off" value="${locObjForEditLocation.brandFontColor}" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Color</label>
													</c:if>
													<c:if test="${!locObjForEditLocation.brandDetails}">
							 							<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="brandBGColor"  name="brandFontColor" class="color" autocomplete="off" value="${locObjForEditLocation.brandFontColor}"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Color</label>
													</c:if>
													
												</div>
												<div class="input-field col s3">
													<c:if test="${locObjForEditLocation.brandDetails}">
							 							<select name="brandFontFamily" id="dirCaptionFamily" class="browser-default" disabled>
													</c:if>
													<c:if test="${!locObjForEditLocation.brandDetails}">
							 							<select name="brandFontFamily" id="dirCaptionFamily" class="browser-default">
													</c:if>
													
														<c:if test="${locObjForEditLocation.brandFontFamily ne null}">
								 							<option style="font-family:${locObjForEditLocation.brandFontFamily}" value="${locObjForEditLocation.brandFontFamily}">${locObjForEditLocation.brandFontFamily}</option>
														</c:if>
														
														<option style="font-family:Courier New" value="Courier New">Courier New</option>
														<option style="font-family:Lucida Console" value="Lucida Console">Lucida Console</option>
														<option style="font-family:Verdana" value="Verdana">Verdana</option>
														<option style="font-family:sans-serif" value="sans-serif">sans-serif</option>
														<option style="font-family:Tahoma" value="Tahoma">Tahoma</option>
														<option style="font-family:Lucida Grande" value="Lucida Grande">Lucida Grande</option>
														<option style="font-family:Charcoal" value="Charcoal">Charcoal</option>
														<option style="font-family:Comic Sans MS" value="Comic Sans MS">Comic Sans MS</option>
														<option style="font-family:Arial Black" value="Arial Black">Arial Black</option>
														<option style="font-family:Arial" value="Arial">Arial</option>
														<option style="font-family:Times New Roman" value="Times New Roman">Times New Roman</option>
														<option style="font-family:Palatino Linotype" value="Palatino Linotype">Palatino Linotype</option>
														<option style="font-family:Georgia" value="Georgia">Georgia</option>
													</select>
													<label style="font-weight: normal;margin-left:-7px; font-size: 14px" class="active">Font Family</label>
												</div> 
												
												
												<div class="input-field col s12">
												
													<table>
												        <thead>
												          <tr>
												              <th >Directory Folder Section</th>
												              <th >Field</th>
												              <th style="width:15%">Font Color</th>
												              <th style="width:20%">Font Size</th>
												              <th >Font Family</th>
												          </tr>
												        </thead>
												
												        <tbody>
												        
												          <tr>
												            <th >Title</th>
												            <th >Title</th>
												            <th >
												            	<c:if test="${locObjForEditLocation.brandDetails}">
										 							<input type="text" style="width:50%;font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="" value="${locObjForEditLocation.defaultTitleFontColor}" name="defaultTitleFontColor" class="color" autocomplete="off" disabled>
																</c:if>
																<c:if test="${!locObjForEditLocation.brandDetails}">
										 							<input type="text" style="width:50%;font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="" value="${locObjForEditLocation.defaultTitleFontColor}" name="defaultTitleFontColor" class="color" autocomplete="off">
																</c:if>
												            	
												            </th>
												            <th>
												            	<c:if test="${locObjForEditLocation.brandDetails}">
										 							<select name="defaultTitleFontSize" id="" class="browser-default" style="width:90%" disabled>
																</c:if>
																<c:if test="${!locObjForEditLocation.brandDetails}">
										 							<select name="defaultTitleFontSize" id="" class="browser-default" style="width:90%">
																</c:if>
												            	
																	<c:if test="${locObjForEditLocation.defaultTitleFontSize ne null}">
											 							<option style="font-size:${locObjForEditLocation.defaultTitleFontSize}" value="${locObjForEditLocation.defaultTitleFontSize}">${locObjForEditLocation.defaultTitleFontSize}</option>
																	</c:if>																		
																		<option style="font-size: initial" value="initial">initial</option>
																		<option style="font-size: xx-small" value="xx-small">xx-small</option>
																		<option style="font-size: x-small" value="x-small">x-small</option>
																		<option style="font-size: small" value="small">small</option>
																		<option style="font-size: medium" value="medium">medium</option>
																		<option style="font-size: large" value="large">large</option>
																		<option style="font-size: x-large" value="x-large">x-large</option>
																		<option style="font-size: xx-large" value="xx-large">xx-large</option>
																		<option style="font-size: smaller" value="smaller">smaller</option>
																		<option style="font-size: larger" value="larger">larger</option>
																</select>
												            </th>
												            <th >
												            	<c:if test="${locObjForEditLocation.brandDetails}">
										 							<select name="defaultTitleFontFamily" id="" class="browser-default" style="width:90%" disabled>
																</c:if>
																<c:if test="${!locObjForEditLocation.brandDetails}">
										 							<select name="defaultTitleFontFamily" id="" class="browser-default" style="width:90%">
																</c:if>
												            	
																	<c:if test="${locObjForEditLocation.defaultTitleFontFamily ne null}">
											 							<option style="font-family:${locObjForEditLocation.defaultTitleFontFamily}" value="${locObjForEditLocation.defaultTitleFontFamily}">${locObjForEditLocation.defaultTitleFontFamily}</option>
																	</c:if>																	
																	<option style="font-family:Courier New" value="Courier New">Courier New</option>
																	<option style="font-family:Lucida Console" value="Lucida Console">Lucida Console</option>
																	<option style="font-family:Verdana" value="Verdana">Verdana</option>
																	<option style="font-family:sans-serif" value="sans-serif">sans-serif</option>
																	<option style="font-family:Tahoma" value="Tahoma">Tahoma</option>
																	<option style="font-family:Lucida Grande" value="Lucida Grande">Lucida Grande</option>
																	<option style="font-family:Charcoal" value="Charcoal">Charcoal</option>
																	<option style="font-family:Comic Sans MS" value="Comic Sans MS">Comic Sans MS</option>
																	<option style="font-family:Arial Black" value="Arial Black">Arial Black</option>
																	<option style="font-family:Arial" value="Arial">Arial</option>
																	<option style="font-family:Times New Roman" value="Times New Roman">Times New Roman</option>
																	<option style="font-family:Palatino Linotype" value="Palatino Linotype">Palatino Linotype</option>
																	<option style="font-family:Georgia" value="Georgia">Georgia</option>
																</select>
												            </th>
												          </tr>
												          
												          <tr>
												            <th >Caption</th>
												            <th >Caption</th>
												            <th >
												            	<c:if test="${locObjForEditLocation.brandDetails}">
										 							<input type="text" style="width:50%;font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="" value="${locObjForEditLocation.defaultCaptionFontColor}" name="defaultCaptionFontColor" class="color" autocomplete="off" disabled>
																</c:if>
																<c:if test="${!locObjForEditLocation.brandDetails}">
										 							<input type="text" style="width:50%;font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="" value="${locObjForEditLocation.defaultCaptionFontColor}" name="defaultCaptionFontColor" class="color" autocomplete="off">
																</c:if>
												            	
												            </th>
												            <th>
												            	<c:if test="${locObjForEditLocation.brandDetails}">
										 							<select name="defaultCaptionFontSize" id="" class="browser-default" style="width:90%" disabled>
																</c:if>
																<c:if test="${!locObjForEditLocation.brandDetails}">
										 							<select name="defaultCaptionFontSize" id="" class="browser-default" style="width:90%">
																</c:if>
												            	
																	<c:if test="${locObjForEditLocation.defaultCaptionFontSize ne null}">
											 							<option style="font-size:${locObjForEditLocation.defaultCaptionFontSize}" value="${locObjForEditLocation.defaultCaptionFontSize}">${locObjForEditLocation.defaultCaptionFontSize}</option>
																	</c:if>																		
																		<option style="font-size: initial" value="initial">initial</option>
																		<option style="font-size: xx-small" value="xx-small">xx-small</option>
																		<option style="font-size: x-small" value="x-small">x-small</option>
																		<option style="font-size: small" value="small">small</option>
																		<option style="font-size: medium" value="medium">medium</option>
																		<option style="font-size: large" value="large">large</option>
																		<option style="font-size: x-large" value="x-large">x-large</option>
																		<option style="font-size: xx-large" value="xx-large">xx-large</option>
																		<option style="font-size: smaller" value="smaller">smaller</option>
																		<option style="font-size: larger" value="larger">larger</option>
																</select>
												            </th>
												            <th >
												            	<c:if test="${locObjForEditLocation.brandDetails}">
										 							<select name="defaultCaptionFontFamily" id="" class="browser-default" style="width:90%" disabled>
																</c:if>
																<c:if test="${!locObjForEditLocation.brandDetails}">
										 							<select name="defaultCaptionFontFamily" id="" class="browser-default" style="width:90%">
																</c:if>
												            	
																	<c:if test="${locObjForEditLocation.defaultCaptionFontFamily ne null}">
											 							<option style="font-family:${locObjForEditLocation.defaultCaptionFontFamily}" value="${locObjForEditLocation.defaultCaptionFontFamily}">${locObjForEditLocation.defaultCaptionFontFamily}</option>
																	</c:if>																	
																	<option style="font-family:Courier New" value="Courier New">Courier New</option>
																	<option style="font-family:Lucida Console" value="Lucida Console">Lucida Console</option>
																	<option style="font-family:Verdana" value="Verdana">Verdana</option>
																	<option style="font-family:sans-serif" value="sans-serif">sans-serif</option>
																	<option style="font-family:Tahoma" value="Tahoma">Tahoma</option>
																	<option style="font-family:Lucida Grande" value="Lucida Grande">Lucida Grande</option>
																	<option style="font-family:Charcoal" value="Charcoal">Charcoal</option>
																	<option style="font-family:Comic Sans MS" value="Comic Sans MS">Comic Sans MS</option>
																	<option style="font-family:Arial Black" value="Arial Black">Arial Black</option>
																	<option style="font-family:Arial" value="Arial">Arial</option>
																	<option style="font-family:Times New Roman" value="Times New Roman">Times New Roman</option>
																	<option style="font-family:Palatino Linotype" value="Palatino Linotype">Palatino Linotype</option>
																	<option style="font-family:Georgia" value="Georgia">Georgia</option>
																</select>
												            </th>
												          </tr>
												          
												          <tr>
												            <th >Hours of Operation</th>
												            <th >Hours of Operation</th>
												            <th >
												            	<c:if test="${locObjForEditLocation.brandDetails}">
										 							<input type="text" style="width:50%;font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="" value="${locObjForEditLocation.defaultHoursFontColor}"  name="defaultHoursFontColor" class="color" autocomplete="off" disabled>
																</c:if>
																<c:if test="${!locObjForEditLocation.brandDetails}">
										 							<input type="text" style="width:50%;font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="" value="${locObjForEditLocation.defaultHoursFontColor}"  name="defaultHoursFontColor" class="color" autocomplete="off">
																</c:if>
												            	
												            </th>
												            <th>
												            	<c:if test="${locObjForEditLocation.brandDetails}">
										 							<select name="defaultHoursFontSize" id="" class="browser-default" style="width:90%" disabled>
																</c:if>
																<c:if test="${!locObjForEditLocation.brandDetails}">
										 							<select name="defaultHoursFontSize" id="" class="browser-default" style="width:90%">
																</c:if>
												            	
																	<c:if test="${locObjForEditLocation.defaultHoursFontSize ne null}">
											 							<option style="font-size:${locObjForEditLocation.defaultHoursFontSize}" value="${locObjForEditLocation.defaultHoursFontSize}">${locObjForEditLocation.defaultHoursFontSize}</option>
																	</c:if>																		
																		<option style="font-size: initial" value="initial">initial</option>
																		<option style="font-size: xx-small" value="xx-small">xx-small</option>
																		<option style="font-size: x-small" value="x-small">x-small</option>
																		<option style="font-size: small" value="small">small</option>
																		<option style="font-size: medium" value="medium">medium</option>
																		<option style="font-size: large" value="large">large</option>
																		<option style="font-size: x-large" value="x-large">x-large</option>
																		<option style="font-size: xx-large" value="xx-large">xx-large</option>
																		<option style="font-size: smaller" value="smaller">smaller</option>
																		<option style="font-size: larger" value="larger">larger</option>
																</select>
												            </th>
												            <th >
												            	<c:if test="${locObjForEditLocation.brandDetails}">
										 							<select name="defaultHoursFontFamily" id="" class="browser-default" style="width:90%" disabled>
																</c:if>
																<c:if test="${!locObjForEditLocation.brandDetails}">
										 							<select name="defaultHoursFontFamily" id="" class="browser-default" style="width:90%">
																</c:if>
												            	
																	<c:if test="${locObjForEditLocation.defaultHoursFontFamily ne null}">
											 							<option style="font-family:${locObjForEditLocation.defaultHoursFontFamily}" value="${locObjForEditLocation.defaultHoursFontFamily}">${locObjForEditLocation.defaultHoursFontFamily}</option>
																	</c:if>																	
																	<option style="font-family:Courier New" value="Courier New">Courier New</option>
																	<option style="font-family:Lucida Console" value="Lucida Console">Lucida Console</option>
																	<option style="font-family:Verdana" value="Verdana">Verdana</option>
																	<option style="font-family:sans-serif" value="sans-serif">sans-serif</option>
																	<option style="font-family:Tahoma" value="Tahoma">Tahoma</option>
																	<option style="font-family:Lucida Grande" value="Lucida Grande">Lucida Grande</option>
																	<option style="font-family:Charcoal" value="Charcoal">Charcoal</option>
																	<option style="font-family:Comic Sans MS" value="Comic Sans MS">Comic Sans MS</option>
																	<option style="font-family:Arial Black" value="Arial Black">Arial Black</option>
																	<option style="font-family:Arial" value="Arial">Arial</option>
																	<option style="font-family:Times New Roman" value="Times New Roman">Times New Roman</option>
																	<option style="font-family:Palatino Linotype" value="Palatino Linotype">Palatino Linotype</option>
																	<option style="font-family:Georgia" value="Georgia">Georgia</option>
																</select>
												            </th>
												          </tr>
												          
												          <tr>
												            <th >Add Menu</th>
												            <th >Menu Item</th>
												            <th >
												            	<c:if test="${locObjForEditLocation.brandDetails}">
										 							<input type="text" style="width:50%;font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="" value="${locObjForEditLocation.defaultMenuFontColor}"  name="defaultMenuFontColor" class="color" autocomplete="off" disabled>
																</c:if>
																<c:if test="${!locObjForEditLocation.brandDetails}">
										 							<input type="text" style="width:50%;font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="" value="${locObjForEditLocation.defaultMenuFontColor}"  name="defaultMenuFontColor" class="color" autocomplete="off">
																</c:if>
												            	
												            </th>
												            <th>
												            	<c:if test="${locObjForEditLocation.brandDetails}">
										 							<select name="defaultMenuFontSize" id="" class="browser-default" style="width:90%" disabled>
																</c:if>
																<c:if test="${!locObjForEditLocation.brandDetails}">
										 							<select name="defaultMenuFontSize" id="" class="browser-default" style="width:90%">
																</c:if>
												            	
																	<c:if test="${locObjForEditLocation.defaultMenuFontSize ne null}">
											 							<option style="font-size:${locObjForEditLocation.defaultMenuFontSize}" value="${locObjForEditLocation.defaultMenuFontSize}">${locObjForEditLocation.defaultMenuFontSize}</option>
																	</c:if>																		
																		<option style="font-size: initial" value="initial">initial</option>
																		<option style="font-size: xx-small" value="xx-small">xx-small</option>
																		<option style="font-size: x-small" value="x-small">x-small</option>
																		<option style="font-size: small" value="small">small</option>
																		<option style="font-size: medium" value="medium">medium</option>
																		<option style="font-size: large" value="large">large</option>
																		<option style="font-size: x-large" value="x-large">x-large</option>
																		<option style="font-size: xx-large" value="xx-large">xx-large</option>
																		<option style="font-size: smaller" value="smaller">smaller</option>
																		<option style="font-size: larger" value="larger">larger</option>
																</select>
												            </th>
												            <th >
												            	<c:if test="${locObjForEditLocation.brandDetails}">
										 							<select name="defaultMenuFontFamily" id="" class="browser-default" style="width:90%" disabled>
																</c:if>
																<c:if test="${!locObjForEditLocation.brandDetails}">
										 							<select name="defaultMenuFontFamily" id="" class="browser-default" style="width:90%">
																</c:if>
												            	
																	<c:if test="${locObjForEditLocation.defaultMenuFontFamily ne null}">
											 							<option style="font-family:${locObjForEditLocation.defaultMenuFontFamily}" value="${locObjForEditLocation.defaultMenuFontFamily}">${locObjForEditLocation.defaultMenuFontFamily}</option>
																	</c:if>																	
																	<option style="font-family:Courier New" value="Courier New">Courier New</option>
																	<option style="font-family:Lucida Console" value="Lucida Console">Lucida Console</option>
																	<option style="font-family:Verdana" value="Verdana">Verdana</option>
																	<option style="font-family:sans-serif" value="sans-serif">sans-serif</option>
																	<option style="font-family:Tahoma" value="Tahoma">Tahoma</option>
																	<option style="font-family:Lucida Grande" value="Lucida Grande">Lucida Grande</option>
																	<option style="font-family:Charcoal" value="Charcoal">Charcoal</option>
																	<option style="font-family:Comic Sans MS" value="Comic Sans MS">Comic Sans MS</option>
																	<option style="font-family:Arial Black" value="Arial Black">Arial Black</option>
																	<option style="font-family:Arial" value="Arial">Arial</option>
																	<option style="font-family:Times New Roman" value="Times New Roman">Times New Roman</option>
																	<option style="font-family:Palatino Linotype" value="Palatino Linotype">Palatino Linotype</option>
																	<option style="font-family:Georgia" value="Georgia">Georgia</option>
																</select>
												            </th>
												          </tr>
												          
												        </tbody>
												    </table>
												 
												</div>
												
												<div  class="input-field col s12" >
													
													<input type="hidden" value="" name="applyForAll" id="applyForAll" />
													<a href="javascript: applyForAll()"  class="btn applyButton"  style="width:140px;color:white;padding: 10PX;" >Apply for All</a>
												
												</div>
												
		</div>
    </div>    
    
     <div id="test88" class="col s10" style="
    ">
    	<div class="row" style="margin-left:10px;margin-top:40px;">
												<div class="input-field col s3">
													<c:if test="${locObjForEditLocation.footerDetails}">
										 				<input type="text" style="font-weight: normal; font-size: 14px" placeholder="" required="" class="title" id="dirCaption" name="footerSite" value="${locObjForEditLocation.footerText}" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Footer Text</label>
													</c:if>
													<c:if test="${!locObjForEditLocation.footerDetails}">
										 				<input type="text" style="font-weight: normal; font-size: 14px" placeholder="" required="" class="title" id="dirCaption" name="footerSite" value="${locObjForEditLocation.footerText}" > <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Footer Text</label>
													</c:if>
													
													
												</div>
												<div class="input-field col s2">
													<c:if test="${locObjForEditLocation.footerDetails}">
										 				<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="dirCaptionColor"  name="footerbgColor" class="color" autocomplete="off" value="${locObjForEditLocation.hotelFooterBackgroundColor}" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Footer Background Color</label>
													</c:if>
													<c:if test="${!locObjForEditLocation.footerDetails}">
										 				<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="dirCaptionColor"  name="footerbgColor" class="color" autocomplete="off" value="${locObjForEditLocation.hotelFooterBackgroundColor}"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Footer Background Color</label>
													</c:if>
													
												</div>
												<div class="input-field col s2">
													<c:if test="${locObjForEditLocation.footerDetails}">
										 				<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="dirCaptionColor"  name="footerColor" class="color" autocomplete="off"  value="${locObjForEditLocation.footerTextColor}" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Footer Text Color</label>
													</c:if>
													<c:if test="${!locObjForEditLocation.footerDetails}">
										 				<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="dirCaptionColor"  name="footerColor" class="color" autocomplete="off"  value="${locObjForEditLocation.footerTextColor}"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Footer Text Color</label>
													</c:if>
													
												</div>
												 <div class="input-field col s2">
												 	<c:if test="${locObjForEditLocation.footerDetails}">
										 				<select name="footerFont" id="dirCaptionFont" class="browser-default" disabled>
													</c:if>
													<c:if test="${!locObjForEditLocation.footerDetails}">
										 				<select name="footerFont" id="dirCaptionFont" class="browser-default" >
													</c:if>
													
													<c:if test="${locObjForEditLocation.footerFont ne null}">
							 							<option style="font-size:${locObjForEditLocation.footerFont}" value="${locObjForEditLocation.footerFont}">${locObjForEditLocation.footerFont}</option>
													</c:if>
														
														<option style="font-size: initial" value="initial">initial</option>
														<option style="font-size: xx-small" value="xx-small">xx-small</option>
														<option style="font-size: x-small" value="x-small">x-small</option>
														<option style="font-size: small" value="small">small</option>
														<option style="font-size: medium" value="medium">medium</option>
														<option style="font-size: large" value="large">large</option>
														<option style="font-size: x-large" value="x-large">x-large</option>
														<option style="font-size: xx-large" value="xx-large">xx-large</option>
														<option style="font-size: smaller" value="smaller">smaller</option>
														<option style="font-size: larger" value="larger">larger</option>
													</select>
													<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Footer Font Size</label>
												</div>
												<div class="input-field col s3">
													<c:if test="${locObjForEditLocation.footerDetails}">
										 				<select name="footerCaptionFamily" id="dirCaptionFamily" class="browser-default" disabled>
													</c:if>
													<c:if test="${!locObjForEditLocation.footerDetails}">
										 				<select name="footerCaptionFamily" id="dirCaptionFamily" class="browser-default">
													</c:if>
													
													<c:if test="${locObjForEditLocation.footerFontFamily ne null}">
							 							<option style="font-family:${locObjForEditLocation.footerFontFamily}" value="${locObjForEditLocation.footerFontFamily}">${locObjForEditLocation.footerFontFamily}</option>
													</c:if>
														
														<option style="font-family:Courier New" value="Courier New">Courier New</option>
														<option style="font-family:Lucida Console" value="Lucida Console">Lucida Console</option>
														<option style="font-family:Verdana" value="Verdana">Verdana</option>
														<option style="font-family:sans-serif" value="sans-serif">sans-serif</option>
														<option style="font-family:Tahoma" value="Tahoma">Tahoma</option>
														<option style="font-family:Lucida Grande" value="Lucida Grande">Lucida Grande</option>
														<option style="font-family:Charcoal" value="Charcoal">Charcoal</option>
														<option style="font-family:Comic Sans MS" value="Comic Sans MS">Comic Sans MS</option>
														<option style="font-family:Arial Black" value="Arial Black">Arial Black</option>
														<option style="font-family:Arial" value="Arial">Arial</option>
														<option style="font-family:Times New Roman" value="Times New Roman">Times New Roman</option>
														<option style="font-family:Palatino Linotype" value="Palatino Linotype">Palatino Linotype</option>
														<option style="font-family:Georgia" value="Georgia">Georgia</option>
													</select>
													<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Footer Font Family</label>
												</div> 
		</div>
    </div>
  
     
    

    </div>
    
    </div>
    
    	<div class="row" style="margin-left:15%">
			<c:if test="${locObjForEditLocation.hotelStatus}">			
				<input type="checkbox" id="hotelLockStatus" value="hotelLockStatus" name="hotelStatus" style="display:none" checked/>
			</c:if>
			
			<c:if test="${!locObjForEditLocation.hotelStatus}">			
				<input type="checkbox" id="hotelLockStatus" value="hotelLockStatus" name="hotelStatus" style="display:none"/>
			</c:if>											
			
			
	    	<label for="hotelLockStatus" style="font-size:14px;padding-left:35px !important;">Display in Location Search</label>
	    </div>
    </c:forEach>
    </form:form>
    
    </div>
    
    
    </div>
   </div>

		
		
		
		
		
		<!-- End of edit location -->
		
			<!--Deleting Location  -->
		<div class="deleteLocation"
			style="display: none; opacity: 1; top: 10%; max-height: 50%; padding: 0 25px 0 25px;">
			<div id="deleteLocation" class="modal">
				<a href="#"
					class="waves-effect waves-green btn-flat modal-action modal-close right">Close</a>
				<div class="modal-content">

					<center><h5 > Delete Hotel </h5></center>
					<c:forEach var="locObjForDeleteLocation"
						items="${locObjForEditLocation}">

						<div class=${locObjForDeleteLocation.objectId }
							style="display: none;text-align: justify">

							<a>Are you Sure To delete the Following Location and it's
								DirectoryItems</a>


							<form action="deleteLocation" method="post">

								"${locObjForDeleteLocation.name}" <input type="hidden"
									value="${locObjForDeleteLocation.objectId}"
									name="objectIdForDeleteLocation"> <input type="hidden"
									value="${userName}" name="userName"> <input
									type="hidden" value="${user}" name="user">
								<button class="btn btn-sm" type="submit"
									style="float: right; background-color: #46A597; border-radius: 5px; margin: 25px 30px 0 0px;">
									Delete</button>

							</form>

						</div>

					</c:forEach>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>

		<!--End of Deleting Location  -->
		
		
		
		<div id="jstreeSpin" class="modal" style="height:36%">
				<div class="modal-content">
					
					<h5 style="text-align:center"><b >Working....</b></h5>
					<br/>
					<div class="preloader-wrapper small active groupSpin" style="margin:-2% 0 0 46%">
					    <div class="spinner-layer spinner-green-only">
					      <div class="circle-clipper left">
					        <div class="circle"></div>
					      </div><div class="gap-patch">
					        <div class="circle"></div>
					      </div><div class="circle-clipper right">
					        <div class="circle"></div>
					      </div>
					    </div>
					  </div>
					
				</div>
				
			</div>
		
		

		<a href="#jstreeSpin" class="modal-trigger" id="spinTree"
	    style="font-size: 1rem; display:none;padding: 0.5rem 0.5rem;"></a>
	    
		<a href="#add" class="modal-trigger" id="addDirItem"
	    style="font-size: 1rem; display:none;padding: 0.5rem 0.5rem;"></a>
	    
	    <a href="#delete" class="modal-trigger" id="delDirItem"
	    style="font-size: 1rem; display:none;padding: 0.5rem 0.5rem;"></a>


		<!--start of Add Diretory  -->
		
			<div class="addDirectoryItemsPopup"
			style="display: none; opacity: 1; top: 10%; max-height: 50%">
			<div id="add" class="modal" style="width:91%;margin-top:36px;overflow: auto;">
				
				<div class="modal-content directorySpin">
					<center>
						<h2 style="margin-left: 76px;margin-top:-40px;" ><span  id="dirItemTitle"></span>  </h2>
						<span style="margin:2% 0 0 72%" class="customSubmitButton">		
				
							<a href="javascript: directoryeditSubmitForm()" class="btn " id="editDirSubmitForm" style="width:100px;color:white;padding: 10PX;display:none" >SUBMIT</a>
							
							<a href="javascript: directoryaddSubmitForm()" class="btn " id="addDirSubmitForm" style="width:100px;color:white;padding: 10PX;display:none" >SUBMIT</a>
							
							 <button type="reset" class="btn clearData" id="reset1" onclick="reset1()" style="width:100px;color:white;">RESET</button>
							
							<a href="#"
					class="waves-effect waves-green modal-action modal-close waves-effect waves-light btn"style="background-color:#20B2AA;padding:12px; color:white">CANCEL</a>
						</span>
					</center>
					
					<p id="uploadDirectoryText" style="margin-bottom:2px;color:red;text-align:center"></p>

					<form:form class="col s12" id="alwaysEnableButtonForm" action="#" name="addDirectory"
											method="post" commandName="addLocation"
											enctype="multipart/form-data">
											
					<input type="hidden" id="dirObjectId" name="objectId"/>
					<input type="hidden" id="directoryDirectoryId" name="directoryId"/>
					<input type="hidden" id="directoryStyleId" name="styleId"/>
					<input type="hidden" id="directoryLocationId" name="locationId"/>
					
					<input type="hidden" id="objectIdOfLocation" name="objectIdOfLocation"/>
					<input type="hidden" value="${userName}" name="userName">
					<input type="hidden" value="${user}" name="user">
					
					
					<div class="preloader-wrapper small active directorySpinner" style="margin-left:50%;display:none">
					    <div class="spinner-layer spinner-green-only">
					      <div class="circle-clipper left">
					        <div class="circle"></div>
					      </div><div class="gap-patch">
					        <div class="circle"></div>
					      </div><div class="circle-clipper right">
					        <div class="circle"></div>
					      </div>
					    </div>
					  </div>
					
					
					
					<div class="row" >
    <div class="col s2" style="
    margin-left: -39px;
    margin-top: -21px;
">
      <ul class="tabs tabs-left"style="margin-top: 45px;">
        <li class="tab col s12"><a class="active" href="#test1"style="color:white !important">Title</a></li>
        <li class="tab col s12"><a href="#test2"style="color:white !important">Caption</a></li>
        <li class="tab col s12"><a href="#test3"style="color:white !important">Hours of OP</a></li>
        <li class="tab col s12"><a href="#test4"style="color:white !important">Content</a></li> 
        <li class="tab col s12"><a href="#test5"style="color:white !important">Image</a></li>
        <li class="tab col s12"><a href="#test6"style="color:white !important">Add Menu</a></li>
        <li class="tab col s12"><a href="#test7"style="color:white !important">Add Contact</a></li>
<!--        <li class="tab col s12"><a href="#test8"style="color:white !important">AddContact</a></li>
 -->      </ul>
    </div>
    <div id="test1" class="col s10"style="margin-top: 40px;">
    	<div class="row">
												<div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px"  required="" id="dirTitle0"  class="title" name="title"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Title</label>

												</div>
												<div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219)" value="3623DB" id="dirTitleColor0" name="titleColor" class="color" autocomplete="off"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Color</label>
												</div>
												<div class="input-field col s3">
												<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Size</label>
													<select name="titleFont" id="dirTitleFont0" class="browser-default">
														<option style="font-size: initial" value="initial">initial</option>
														<option style="font-size: xx-small" value="xx-small">xx-small</option>
														<option style="font-size: x-small" value="x-small">x-small</option>
														<option style="font-size: small" value="small">small</option>
														<option style="font-size: medium" value="medium">medium</option>
														<option style="font-size: large" value="large">large</option>
														<option style="font-size: x-large" value="x-large">x-large</option>
														<option style="font-size: xx-large" value="xx-large">xx-large</option>
														<option style="font-size: smaller" value="smaller">smaller</option>
														<option style="font-size: larger" value="larger">larger</option>
													</select>
												</div>
												<div class="input-field col s3">
													<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Family</label>
													<select name="titleFamily" id="dirTitleFamily0" class="browser-default">
														<option style="font-family:Courier New" value="Courier New">Courier New</option>
														<option style="font-family:Lucida Console" value="Lucida Console">Lucida Console</option>
														<option style="font-family:Verdana" value="Verdana">Verdana</option>
														<option style="font-family:sans-serif" value="sans-serif">sans-serif</option>
														<option style="font-family:Tahoma" value="Tahoma">Tahoma</option>
														<option style="font-family:Lucida Grande" value="Lucida Grande">Lucida Grande</option>
														<option style="font-family:Charcoal" value="Charcoal">Charcoal</option>
														<option style="font-family:Comic Sans MS" value="Comic Sans MS">Comic Sans MS</option>
														<option style="font-family:Arial Black" value="Arial Black">Arial Black</option>
														<option style="font-family:Arial" value="Arial">Arial</option>
														<option style="font-family:Times New Roman" value="Times New Roman">Times New Roman</option>
														<option style="font-family:Palatino Linotype" value="Palatino Linotype">Palatino Linotype</option>
														<option style="font-family:Georgia" value="Georgia">Georgia</option>
													</select>
												</div>
		</div>
		
    </div>
    <div id="test2" class="col s10" style="margin-top: 40px;">
    	<div class="row">
												<div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px" required="" class="title" id="dirCaption0" name="caption"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Caption</label>
												</div>
												<div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="dirCaptionColor0" value="3623DB" name="captionColor" class="color" autocomplete="off"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Color</label>
												</div>
												<div class="input-field col s3">
													<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Size</label>
													<select name="captionFont" id="dirCaptionFont0" class="browser-default">
														<option style="font-size: initial" value="initial">initial</option>
														<option style="font-size: xx-small" value="xx-small">xx-small</option>
														<option style="font-size: x-small" value="x-small">x-small</option>
														<option style="font-size: small" value="small">small</option>
														<option style="font-size: medium" value="medium">medium</option>
														<option style="font-size: large" value="large">large</option>
														<option style="font-size: x-large" value="x-large">x-large</option>
														<option style="font-size: xx-large" value="xx-large">xx-large</option>
														<option style="font-size: smaller" value="smaller">smaller</option>
														<option style="font-size: larger" value="larger">larger</option>
													</select>
												</div>
												<div class="input-field col s3">
													<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Family</label>
													<select name="captionFamily" id="dirCaptionFamily0" class="browser-default">
														<option style="font-family:Courier New" value="Courier New">Courier New</option>
														<option style="font-family:Lucida Console" value="Lucida Console">Lucida Console</option>
														<option style="font-family:Verdana" value="Verdana">Verdana</option>
														<option style="font-family:sans-serif" value="sans-serif">sans-serif</option>
														<option style="font-family:Tahoma" value="Tahoma">Tahoma</option>
														<option style="font-family:Lucida Grande" value="Lucida Grande">Lucida Grande</option>
														<option style="font-family:Charcoal" value="Charcoal">Charcoal</option>
														<option style="font-family:Comic Sans MS" value="Comic Sans MS">Comic Sans MS</option>
														<option style="font-family:Arial Black" value="Arial Black">Arial Black</option>
														<option style="font-family:Arial" value="Arial">Arial</option>
														<option style="font-family:Times New Roman" value="Times New Roman">Times New Roman</option>
														<option style="font-family:Palatino Linotype" value="Palatino Linotype">Palatino Linotype</option>
														<option style="font-family:Georgia" value="Georgia">Georgia</option>
													</select>
												</div>
		</div>
    </div>
    <div id="test3" class="col s10" style="margin-top: 40px;">
    	<div class="row">
												<div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px" id="dirTimings0" required="" class="title" name="timings"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Hours of Operation</label>
												</div>
												<div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="dirTimingsColor0" value="3623DB" name="timingsColor" class="color" autocomplete="off"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Color</label>
												</div>
												<div class="input-field col s3">
													<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Size</label>
													<select name="timingsFont" id="dirTimingsFont0" class="browser-default">
														<option style="font-size: initial" value="initial">initial</option>
														<option style="font-size: xx-small" value="xx-small">xx-small</option>
														<option style="font-size: x-small" value="x-small">x-small</option>
														<option style="font-size: small" value="small">small</option>
														<option style="font-size: medium" value="medium">medium</option>
														<option style="font-size: large" value="large">large</option>
														<option style="font-size: x-large" value="x-large">x-large</option>
														<option style="font-size: xx-large" value="xx-large">xx-large</option>
														<option style="font-size: smaller" value="smaller">smaller</option>
														<option style="font-size: larger" value="larger">larger</option>
													</select>
												</div>
												<div class="input-field col s3">
													<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Family</label>
													<select name="timingsFamily" id="dirTimingsFamily0" class="browser-default">
														<option style="font-family:Courier New" value="Courier New">Courier New</option>
														<option style="font-family:Lucida Console" value="Lucida Console">Lucida Console</option>
														<option style="font-family:Verdana" value="Verdana">Verdana</option>
														<option style="font-family:sans-serif" value="sans-serif">sans-serif</option>
														<option style="font-family:Tahoma" value="Tahoma">Tahoma</option>
														<option style="font-family:Lucida Grande" value="Lucida Grande">Lucida Grande</option>
														<option style="font-family:Charcoal" value="Charcoal">Charcoal</option>
														<option style="font-family:Comic Sans MS" value="Comic Sans MS">Comic Sans MS</option>
														<option style="font-family:Arial Black" value="Arial Black">Arial Black</option>
														<option style="font-family:Arial" value="Arial">Arial</option>
														<option style="font-family:Times New Roman" value="Times New Roman">Times New Roman</option>
														<option style="font-family:Palatino Linotype" value="Palatino Linotype">Palatino Linotype</option>
														<option style="font-family:Georgia" value="Georgia">Georgia</option>
													</select>
												</div>
		</div>
    </div>
    
    <div id="test4" class="col s10">
   
    <div class="row" style="width:100%;margin:23px 0 0 16px">
    
    				<textarea ></textarea>
    				<input type="hidden" id="dirDescption0" name="description" />
					<!-- <div class="card" >
                        <div class="card-body card-padding">
                            <div class="html-editor" ></div>
                            
                        </div>
                    </div> -->						
		</div>
    </div>
    
    
   <div id="test5" class="col s10">
   		
    		<div class="row col s8">

    <div class="file-field input-field" style="margin-top: 87px;">
      <div class="btn" style="width:133px;height:39px;
    margin-left: 57px; color:white;">
        <span>Upload Image</span>
        <input type="file" id="uploadDirectoryImage" name="logo">
        <input type="hidden" id="uploadImageStatus"/>
      </div>
      <input type="hidden" id="directoryPictureSize" />
      <div class="file-path-wrapper" >
        <input class="file-path validate" id="imgUrl" type="text" style="font-size:20px;width:400px;height:39px; 
    margin-left: 3px;">
      </div>
    </div> 
    
    <button type="button" id="deleteDirectoryImage" class="btn " style="margin-left:50%;margin-top:2%;width:100px;color:white;display:none">Delete</button>
								
		</div>
		<div class="col s4">
			<span id="displayDirectoryItemImage"></span>
		</div>
		<div class="row col s12">
					Note: for efficient use of the directory on mobile devices, we apply the following file size limits for uploads:<br/>
					<br/> &nbspIndividual file size limit: ${imageSize } kb<br/>
					<br/> &nbspTotal directory file size limit: ${totalImagesLimit} kb<br/>
					<br/> &nbspCurrent total sizes of directory files already uploaded: <span class="updateDirectoriesSize"></span> kb
				</div>
    </div>
    <div id="test6" class="col s10">
   <div class="input-field col s12"
						style="margin: 10px 0 0 0px;padding:0 0 0 0">
			
									          
									          

 	<div class="row" style="margin-left:17px;">
												
												<div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" value="3623DB" id="dirPriceColor" name="priceColor" class="color" autocomplete="off"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Color</label>
												</div>
												<div class="input-field col s3">
													<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Size</label>
													<select name="priceFont" id="dirPriceFont" class="browser-default">
														<option style="font-size: initial" value="initial">initial</option>
														<option style="font-size: xx-small" value="xx-small">xx-small</option>
														<option style="font-size: x-small" value="x-small">x-small</option>
														<option style="font-size: small" value="small">small</option>
														<option style="font-size: medium" value="medium">medium</option>
														<option style="font-size: large" value="large">large</option>
														<option style="font-size: x-large" value="x-large">x-large</option>
														<option style="font-size: xx-large" value="xx-large">xx-large</option>
														<option style="font-size: smaller" value="smaller">smaller</option>
														<option style="font-size: larger" value="larger">larger</option>
													</select>
												</div>
												<div class="input-field col s3">
													<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Family</label>
													<select name="priceFamily" id="dirPriceFamily" class="browser-default">
														<option style="font-family:Courier New" value="Courier New">Courier New</option>
														<option style="font-family:Lucida Console" value="Lucida Console">Lucida Console</option>
														<option style="font-family:Verdana" value="Verdana">Verdana</option>
														<option style="font-family:sans-serif" value="sans-serif">sans-serif</option>
														<option style="font-family:Tahoma" value="Tahoma">Tahoma</option>
														<option style="font-family:Lucida Grande" value="Lucida Grande">Lucida Grande</option>
														<option style="font-family:Charcoal" value="Charcoal">Charcoal</option>
														<option style="font-family:Comic Sans MS" value="Comic Sans MS">Comic Sans MS</option>
														<option style="font-family:Arial Black" value="Arial Black">Arial Black</option>
														<option style="font-family:Arial" value="Arial">Arial</option>
														<option style="font-family:Times New Roman" value="Times New Roman">Times New Roman</option>
														<option style="font-family:Palatino Linotype" value="Palatino Linotype">Palatino Linotype</option>
														<option style="font-family:Georgia" value="Georgia">Georgia</option>
													</select>
												</div>
		</div>
		
		<div class="TextBoxesGroup" style="margin-left:12px;">
													<div class="TextBoxDiv0">
														
														<!-- <div class="row" id="menuDiv" style="margin-left:4px;">
															
															<div class="input-field col s4">
																<input type="text" class="description0" name="menuDescription0" style="font-weight: normal; font-size: 14px"> <label class="active" for="first_name2" style="font-weight: normal; font-size: 14px;margin-left:-7px;">Menu Item Description</label>
															</div>
															
															
															
															<div class="input-field col s2">
																<input type="text" class="price0" name="menuPrice0" onkeypress="return isNumber(event)" style="font-weight: normal; font-size: 14px"> <label class="active" for="first_name2" style="font-weight: normal; font-size: 14px;margin-left:-7px;">Price</label>
															</div>
															
															
																<input type="button" value="Delete" style="width:70px;color:white;margin-left:10px;margin-top:16px;"class="removeButton btn input-field col s1">
															
															
															
															
															
															
														  </div> -->
														  
														  <div id="menuItemsDetails"></div>
													</div>
		</div>
<div class="left">
														<input type="button" value="Add Menu Item" class="addButton btn" style="padding:0 47px 0 47px;color:white;margin-left:23px;">
														
													</div>


			
			
			
</div>

    </div>
   
   
    
    
    
    
 <div id="test7" class="col s10">
    <div class="input-field col s12"
						style="margin: 10px 0 17px 0px;padding:0 0 0 0">
  <div class="col s12" id="contactHBFJRBdxRo" style="padding: 0px;margin-top:2%; display: block;">
												
												<!-- <div class="manageTextBoxDiv1"></div> -->
												
												
												<div class="manageTextBoxesGroup" style="margin-left:16px;">
													<div class="manageTextBoxDiv0">
														
														<!-- <div class="row" id="phoneDiv" style="margin-left:10px;">
															<div class="input-field col s3">
																<select class="browser-default type0" name="manageType0">
																	<option value="" disabled="" selected="">
																		Phone/Email/Website</option>
																	<option value="phone">Phone</option>
																	<option value="email">Email</option>
																	<option value="website">Website</option>
																</select>
															</div>
															
															<div class="input-field col s4">
																<input type="text" name="manageDetails0" class="details0" style="font-size:14px;font-weight:normal"> <label for="textbox1">
																	</label>
															</div>
															<input type="button" value="Delete" style="width:70px;color:white;margin-left:10px;margin-top:16px;"class="manageRemoveButton btn input-field col s1">
															
														</div> -->
														
														<div id="phoneItemsDetails"></div>
														
													</div>
												</div>
											<input type="button" value="Add Contact" class="manageAddButton btn" style="width:203px;margin-left:34px;color:white;">
											 
											</div>
											<input type="hidden" class="counter" name="counter" value="0" />
											<input type="hidden" value="0" name="manageCount" class="manageCount"/>
											</div>
	<br/>

			
	
	
	
	
    </div>
  
   
    </div></form:form>
   </div>
		</div>
		
		
		</div>
		
		
		<!-- End of Add Directory -->



		<!--Displaying Deleted files -->
		<div class="delPopup"
			style="display: none; margin-top: 10px; padding: 40px 20px 40px 20px;">


			<div id="delete" class="modal">
				<a href="#"
					class="waves-effect waves-green btn-flat modal-action modal-close right">Close</a>
				<div class="modal-content">
					<center><h5 > Delete Directory Item </h5></center>
					<c:forEach var="showDiscriptionObjId"
						items="${showDiscriptionObjId }">
						<div>

							<div class=${showDiscriptionObjId.objectId }
								style="display: none; text-align: justify">

								<a>Are you sure to delete?</a>

								<form action="delete">

									${showDiscriptionObjId.title} <input type="hidden"
										value="${showDiscriptionObjId.objectId}"
										name="objectIdForDelete"> <input type="hidden"
										value="${showDiscriptionObjId.directoryId}" name="directoryId">
									<input type="hidden"
										value="${showDiscriptionObjId.parentDirectoryId}"
										name="parentDirectoryId"> <input type="hidden"
										value="${showDiscriptionObjId.locationId}" name="locationId">
									<input type="hidden" value="${userName}" name="userName">
									<input type="hidden" value="${user}" name="user">
									<button class="btn btn-sm" type="submit"
										style="float: right; background-color: #46A597; border-radius: 5px; margin: 25px 30px 0 0px;">
										Delete</button>

								</form>

							</div>

						</div>
					</c:forEach>

				</div>
				<div class="modal-footer"></div>
			</div>

		</div>
		<!--End of Delete items  -->
			

		

		<a class="waves-effect waves-light btn modal-trigger" style="display:none" id="narshimha" href="#modal6">Modal</a>
			<div id="modal6" class="modal">
			    <div class="modal-content">
			     	 <p><span id="userType"></span> has been created successfully. Notification email has been sent to the email id entered with user credentials.</p>
				 
			    </div>
			    <div class="modal-footer">
			      <a href="#!" class=" modal-action modal-close waves-green btn-flat">Ok</a>
			    </div>
			  </div>
 



		 <script type="text/javascript" src="../js/materialize.js"></script>
		 <script type="text/javascript" src="../js/plugins.js"></script>
		 <script type="text/javascript" src="../styles/js/materialize.js"></script>
	 <script type="text/javascript" src="../styles/js/materialize.min.js"></script>
<script src="../styles/vendors/summernote/dist/summernote-updated.min.js"></script>
<script type="text/javascript" src="../styles/js/fun.js"></script>
	
		
		<script>
				  
		function directoryaddSubmitForm() {				  
			 
			 /* var editor = $('.note-editable').last().html();
			 editor = "<p>"+editor+"</p>";
			 $('#dirDescption0').val(editor); */
			 var result = 0;
			 $('#uploadDirectoryText').text('');
			 	
			 var hotelLogoSize = parseInt($('#uploadDefaultSize').val());
			 var hotelImagesLimitationSize = parseInt($('#totalImagesSize').val());
			 var numberOfImagesSizes = parseInt($('#numberOfImages').val());
			 var uploadDirectoryImageSize = 0;
				
			 if( $('#uploadDirectoryImage')[0].files[0] != undefined )
			 {
				
				 uploadDirectoryImageSize = parseInt($('#uploadDirectoryImage')[0].files[0].size);
				 uploadDirectoryImageSize = Math.round((uploadDirectoryImageSize / 1024));
				 
				 if( hotelLogoSize < uploadDirectoryImageSize )
				 {
					 result++;
					 $('#uploadDirectoryText').text('Individual image size cannot exceed '+hotelLogoSize+'KB');
				 }
				 else
				 {
					 
					 if( (numberOfImagesSizes+uploadDirectoryImageSize) > hotelImagesLimitationSize )
						{
							$('#uploadDirectoryText').text('Sum total of all image sizes in directory cannot exceed '+hotelImagesLimitationSize+'KB');
							result++;
						}
						else
						{
							$('#uploadDirectoryText').text('');
						}
										 
				 }
			 }
			 
			 var editor = $('#mce_34_ifr').contents().find("body").html();
			 
			 
			 $('#dirDescption0').val(editor);
			 
			 if( result == 0 )
			 {
				 $('#numberOfImages').val((numberOfImagesSizes+uploadDirectoryImageSize));
				 $('.directorySpinner').show();
				 document.addDirectory.submit();
			 }
			 
			 
			 
			  
		  }		


		  function directoryeditSubmitForm() {				  
				 
			 /* var editor = $('.note-editable').last().html();
			 editor = "<p>"+editor+"</p>";
			 $('#dirDescption0').val(editor); */
			 
			 
			 
			 
			 var result = 0;
			 var editor = $('#mce_34_ifr').contents().find("body").html();
			 
			 
			 $('#dirDescption0').val(editor);
			 
			 var objId = $('#dirObjectId').val();
			 var dirTitle = $('#dirTitle0').val();
			 var dirTitleColor = $('#dirTitleColor0').val();
			 var dirTitleSize = $('#dirTitleFont0').val();
			 var dirTitleFamily = $('#dirTitleFamily0').val();
			 var dirCaption = $('#dirCaption0').val();
			 var dirCaptionColor = $('#dirCaptionColor0').val();
			 var dirCaptionSize = $('#dirCaptionFont0').val();
			 var dirCaptionFamily = $('#dirCaptionFamily0').val();
			 var dirOperation = $('#dirTimings0').val();
			 var dirOperationColor = $('#dirTimingsColor0').val();
			 var dirOperationSize = $('#dirTimingsFont0').val();
			 var dirOperationFamily = $('#dirTimingsFamily0').val();
			 var imgData = new FormData($('#uploadDirectoryImage').get(0).files[0]); 
			 var menuJson = [];
			 var contactJson = [];
			 var menuCount = $('.counter').val();
			 var contactCount = $('.manageCount').val();
			 for(var i=0;i<menuCount;i++)
			 {
				 var temp = {};
				 
				 if( document.getElementsByName('menuDescription'+i)[0] != undefined )
			     {
					 temp["editmenuObject"] = document.getElementsByName('editmenuObject'+i)[0].value;
					 temp["menuDescription"] = document.getElementsByName('menuDescription'+i)[0].value;
					 temp["menuPrice"] = document.getElementsByName('menuPrice'+i)[0].value;
					 temp["menuSequence"] = document.getElementsByName('menuSequence'+i)[0].value;
					 menuJson.push(temp);						    							 
			     }	
				 else
				 {
					 temp["editmenuObject"] = document.getElementsByName('editmenuObject'+i)[0].value;
					 temp["menuDescription"] = "";
					 temp["menuPrice"] = "";
					 temp["menuSequence"] = "";
					 menuJson.push(temp);
				 }
			 }
			 
			 for(var i=0;i<contactCount;i++)
			 {
				 var temp = {};
				 
				 if( document.getElementsByName('manageType'+i)[0] != undefined )
				 {
					 temp["editphoneObjectId"] = document.getElementsByName('editphoneObjectId'+i)[0].value;
					 temp["manageType"] = document.getElementsByName('manageType'+i)[0].value;
					 temp["manageDetails"] = document.getElementsByName('manageDetails'+i)[0].value;						 
					 contactJson.push(temp);							 							 
				 }	
				 else
				 {
					 temp["editphoneObjectId"] = document.getElementsByName('editphoneObjectId'+i)[0].value;
					 temp["manageType"] = "";
					 temp["manageDetails"] = "";						 
					 contactJson.push(temp);
				 }
			 }	
			 var dirSize = parseInt($('#directoryPictureSize').val());
			 dirSize = Math.round((dirSize / 1024));
			 var uploadDirectoryImage = parseInt($('#uploadDefaultSize').val());
			 var hotelImagesLimitationSize = parseInt($('#totalImagesSize').val());
			 var numberOfImagesSizes = parseInt($('#numberOfImages').val());
			 var uploadDirectoryImageSize = 0;
			 
			 if( $('#uploadDirectoryImage')[0].files[0] != undefined )
			 {
				 
				 uploadDirectoryImageSize = parseInt($('#uploadDirectoryImage')[0].files[0].size);
				 uploadDirectoryImageSize = Math.round((uploadDirectoryImageSize / 1024));
				 
				 if( uploadDirectoryImage < uploadDirectoryImageSize )
				 {
					 result++;
					 $('#uploadDirectoryText').text('Individual image size cannot exceed '+uploadDirectoryImage+'KB');
				 }
				 else
				 {
					 
					 if( (numberOfImagesSizes+uploadDirectoryImageSize) > hotelImagesLimitationSize )
						{
							$('#uploadDirectoryText').text('Sum total of all image sizes in directory cannot exceed '+hotelImagesLimitationSize+'KB');
							result++;
						}
						else
						{
							$('#uploadDirectoryText').text('');
						}
										 
				 }
			 }	
			 var imageStatus = $('#uploadImageStatus').val();
			 if( result == 0 )
			 {
				 $('.directorySpinner').show();
				 var data = {
						 "objectId" : $('#dirObjectId').val(),
						 "directoryId" : $('#directoryDirectoryId').val(),
						 "styleId" : $('#directoryStyleId').val(),
						 "locationId" : $('#directoryLocationId').val(),							 
						 "title" : dirTitle,
						 "titleColor" : dirTitleColor,
						 "titleFont" : dirTitleSize,
						 "titleFamily" : dirTitleFamily,
						 "caption" : dirCaption,
						 "captionColor" : dirCaptionColor,
						 "captionFont" : dirCaptionSize,
						 "captionFamily" : dirCaptionFamily,
						 "timings" : dirOperation,
						 "timingsColor" : dirOperationColor,
						 "timingsFont" : dirOperationSize,
						 "timingsFamily" : dirOperationFamily,
						 "description" : editor,
						 "priceColor" : $('#dirPriceColor').val(),
						 "priceFont" : $('#dirPriceFont').val(),
						 "priceFamily" : $('#dirPriceFamily').val(),
						 "menuData" : menuJson,
						 "contactData" : contactJson,
						 //"logo" : $('#uploadDirectoryImage').get(0).files[0],
				 };
				 
				 console.log(data);			          
				 
				 $.ajax({
				      type: "POST",
				      url: "edit1",
				      data : JSON.stringify(data),
				      async: false,			      
				      contentType : 'application/json',
				      dataType : 'json',
				      beforeSend: function(xhr) {  
	                     xhr.setRequestHeader("Accept", "application/json");  
	                     xhr.setRequestHeader("Content-Type", "application/json");  
	                 },
				      
				      success :function(result) {
				    	  console.log("success :"+result);
				    	  $('#add').hide();
				    	  $('.lean-overlay').css({display:'none'});
				    	  reply_click($('#dirObjectId').val());
				    	  
				    	  
				     },
				     error : function(error) {
				    	console.log("error :"+error);
				    	 
				    	  
				    	  
				    	  $('#'+objId).html('<i class="jstree-icon jstree-themeicon"></i>'+dirTitle);
				    	  var oMyForm = new FormData();
							 if($('#uploadDirectoryImage').get(0).files[0] == undefined && imageStatus == "1" )
							 {
								 oMyForm.append("file", null);
								 oMyForm.append("dirId",$('#dirObjectId').val());
								 $.ajax({dataType : 'json',
						              url : "deleteImage",
						              data : oMyForm,
						              type : "POST",
						              enctype: 'multipart/form-data',
						              processData: false, 
						              contentType:false,
						              success : function(result) {
						            	  $('#numberOfImages').val( ( numberOfImagesSizes - dirSize ) );
								    	  reply_click($('#dirObjectId').val());
								    	  $('#add').hide();
								    	  $('.directorySpinner').hide();
								    	  $('.lean-overlay').css({display:'none'});
								    	  $('body').css({overflow:'auto'});
						              	 console.log("successfully uploaded");
						              },
						              error : function(result){
						            	  console.log("successfully uploaded");
						            	  $('#numberOfImages').val( ( numberOfImagesSizes - dirSize ) );
								    	  reply_click($('#dirObjectId').val());
								    	  $('#add').hide();
								    	  $('.directorySpinner').hide();
								    	  $('.lean-overlay').css({display:'none'});
								    	  $('body').css({overflow:'auto'});
						              }
						          });			
							 }
							 else
							 {
								 oMyForm.append("file", $('#uploadDirectoryImage').get(0).files[0]);
								 oMyForm.append("dirId",$('#dirObjectId').val());
								 $.ajax({dataType : 'json',
						              url : "uploadImage",
						              data : oMyForm,
						              type : "POST",
						              enctype: 'multipart/form-data',
						              processData: false, 
						              contentType:false,
						              success : function(result) {
						            	  $('#numberOfImages').val( ( numberOfImagesSizes + uploadDirectoryImageSize ) );
								    	  reply_click($('#dirObjectId').val());
								    	  $('#add').hide();
								    	  $('.directorySpinner').hide();
								    	  $('.lean-overlay').css({display:'none'});
								    	  $('body').css({overflow:'auto'});
						              	 console.log("successfully uploaded");
						              },
						              error : function(result){
						            	  console.log("successfully uploaded");
						            	  $('#numberOfImages').val( ( numberOfImagesSizes + uploadDirectoryImageSize ) );
								    	  reply_click($('#dirObjectId').val());
								    	  $('#add').hide();
								    	  $('.directorySpinner').hide();
								    	  $('.lean-overlay').css({display:'none'});
								    	  $('body').css({overflow:'auto'});
						              }
						          });
							 }
				    	  
				    	  
				     }
				  });   
			 }		 
			  
			  
			 //document.addDirectory.submit();
			  
		  }			    	  
				  
				
			  function applyForAll()
			  {
				  $('#applyForAll').val("applyforall");
				  $('.applyButton').attr('disabled','disabled');
				  directorySubmitForm1();
			  }
		  
			  function directorySubmitForm1() {				  
				 // $('.note-editable').last().remove();
				 var result = 0;
				 var editor = $('#mce_0_ifr').contents().find("body").html();
				 
				 $('#112244').val(editor);
				 
				 var applyValue = $('#applyButton').text();
				 
				 var latitude = $('#editLatitude').val();
					var longitude = $('#editLongitude').val();
					
					if(latitude != "" && latitude != null)
					{
						if(longitude == "" || longitude == null)
						{
							alert("Enter Longitude Value");
							result++;
						}	
						else
						{
							if( parseFloat(longitude).toFixed(2) <= -180 ||  parseFloat(longitude).toFixed(2) >= 180)
							{
								alert("Longitude value must between -180 to 180");
								result++;
							}
							
						}
					}
					if(longitude != "" && longitude != null)
					{
						if(latitude == "" || latitude == null)
						{
							alert("Enter Latitude Value");
							result++;
						}	
						else
						{
							if( parseFloat(latitude).toFixed(2) <= -90 ||  parseFloat(latitude).toFixed(2) >= 90)
							{
								alert("Langtude value must between -90 to 90");
								result++;
							}
						}
					}
					else
					{				
						console.log("not required");				
					}
					
					var hotelLogoSize = parseInt($('#uploadDefaultSize').val());
					var hotelImagesLimitationSize = parseInt($('#totalImagesSize').val());
					var hotelImagesLimitationSize1 = 0;
					var numberOfImagesSizes = parseInt($('#numberOfImages').val())*hotelLogoSize;
					
					
					
					if( $('#uploadHotelLogo')[0].files[0] != undefined )
					{
						var uploadHotelLogo = $('#uploadHotelLogo')[0].files[0].size;
						uploadHotelLogo = Math.round((uploadHotelLogo / 1024));
						if( hotelLogoSize < uploadHotelLogo )
						{
							result++;
							$('#uploadHotelLogoText').text('Individual image size cannot exceed '+hotelLogoSize+'KB');
							
						}
						else
						{
							
							hotelImagesLimitationSize1= hotelImagesLimitationSize1+uploadHotelLogo;
							$('#uploadHotelLogoText').text('');
							
						}
					}
					
					
					
					if( $('#uploadLogo')[0].files[0] != undefined )
					{
						var uploadLogo = $('#uploadLogo')[0].files[0].size;
						uploadLogo = Math.round((uploadLogo / 1024));
						
						if( hotelLogoSize < uploadLogo )
						{
							result++;
							$('#uploadLogoText').text('Individual image size cannot exceed '+hotelLogoSize+'KB');
						}
						else
						{
							hotelImagesLimitationSize1= hotelImagesLimitationSize1+uploadLogo;
							$('#uploadHotelLogoText').text('');
							
						}
					}
					
					if( $('#uploadHotelFooter')[0].files[0] != undefined )
					{
						var uploadHotelFooter = $('#uploadHotelFooter')[0].files[0].size;
						uploadHotelFooter = Math.round((uploadHotelFooter / 1024));
						
						if( hotelLogoSize < uploadHotelFooter )
						{
							result++;
							$('#uploadHotelFooterText').text('Individual image size cannot exceed '+hotelLogoSize+'KB');
						}
						else
						{
							hotelImagesLimitationSize1= hotelImagesLimitationSize1+uploadHotelFooter;
							$('#uploadHotelLogoText').text('');
							
						}
						
						
					}	
					
					if( $('#uploadHotelLogo')[0].files[0] != undefined || $('#uploadHotelFooter')[0].files[0] != undefined || $('#uploadHotelFooter')[0].files[0] != undefined )
					{
						if( (hotelImagesLimitationSize1+numberOfImagesSizes) > hotelImagesLimitationSize )
						{
							$('#uploadHotelLogoText').text('Sum total of all image sizes in directory cannot exceed '+hotelImagesLimitationSize+'KB');
							result++;
						}
					}
					
				 
					if( result == 0 )
					{
						document.editLocation.submit();
					}
					
				  
				  
			  }
			  
			  function handleClick(cb) {
							
				var spl = cb.split(":");
				var che = document.getElementById('check:'+spl[1]).checked;
				if(che)
				{
					for(var i=2;i<20;i++)
					{
						$('.TextBoxDiv'+i).hide();
						
					}	
					$('#menu'+spl[1]).show();
					
					$('.hr').show();
					$('.counter').val('2');
				}
				else {
					//$('#manage'+spl[1]).hide();
					$('#menu'+spl[1]).hide();
					$('.hr').hide();
					$('.counter').val('0');
				}			
						
			}  
			  
			  function edithandleClick(cb) {
				  var spl = cb.split(":");
				  
					var che = document.getElementById('editmenu:'+spl[1]).checked;
					
					if(che)
					{
						$('.edithr1').show();
						
						$('#editmenu'+spl[1]).show();
						//var val = $('.editmenuCount').val();
						
						for(var i=2;i<20;i++)
						{
							$('.editmenuTextBoxDiv'+i).hide();
							
						}	
					}
					else
					{
						$('#editmenu'+spl[1]).hide();
						$('.edithr1').hide();
						$('.editmenuCount').val('0');
					}
						
				}  
			  
			  function editcontactClick(cb) {
					
					var spl = cb.split(":");
					var che = document.getElementById('editcontact:'+spl[1]).checked;
					
					if(che)
					{
						$('.edithr2').show();
						
						//$('.editcontactCount').val('2');
						$('#editcontact'+spl[1]).show();
						
						for(var i=2;i<20;i++)
						{
							$('.editmanageTextBoxDiv'+i).hide();
							
						}
					} else {
						//$('#manage'+spl[1]).hide();
						$('#editcontact'+spl[1]).hide();
						$('.edithr2').hide();
						$('.editcontactCount').val('0');
					}							
				} 

			  
			
			function contactClick(cb) {
				
				var spl = cb.split(":");
				
				var che = document.getElementById('contact:'+spl[1]).checked;
				
				if(che)
				{
					/* for(var i=2;i<20;i++)
					{
						$('.TextBoxDiv'+i).hide();
						
					} */	
					$('#contact'+spl[1]).show();
					
					$('.hr1').show();
					$('.manageCount').val('2');
				}
				else {
					//$('#manage'+spl[1]).hide();
					$('#contact'+spl[1]).hide();
					$('.hr1').hide();
					$('.manageCount').val('0');
				}
					
			}			
		
		</script>	
		
		
		
		<script type="text/javascript">
			$('#customOrder').click(function(){
				
				var orderNum = document.getElementById("customOrder");
				if(orderNum.checked)
					{
						$('#customNumber').show();
					}
				else
					{
						$('#customNumber').hide();
					}
			});
			
			
			function customOrder(number)
			{
				var orderNum = document.getElementById(number);
				var id=number.split(':');
				if(orderNum.checked)
					{
					$(".displaydrop").show();
					}
				else
					{
					$(".displaydrop").hide();
					}
				$('#subCustomNumber:SSwSagzAaA').show();
			}
				
		
		</script>
		
		<script type="text/javascript">



    //var counter = 2;
    
		
    $(".editmenuaddButton").click(function () {
		
    	//alert($('.editmenuCount').val());
    	var editmenucounter = $('.editmenuCount').val();
    	
    	editmenucounter = parseInt(editmenucounter);
    	if( editmenucounter == 0 )
		{
    		editmenucounter = editmenucounter+30;
		}
		
	var newTextBoxDiv = $(document.createElement('div'))
	     .attr("class", 'editmenuTextBoxDiv' + editmenucounter);
                
	newTextBoxDiv.after().html('<div class="row">'+
			
			'<div class="input-field col s4">'+
				'<input type="text" class="description'+editmenucounter+' " name="editmenuDescription'+editmenucounter+'" style="font-weight: normal; font-size: 14px">'+
				'<label class="active" style="font-weight: normal;margin-left:-7px; font-size: 14px">Menu Item Description</label></div>'+
			'<div class="input-field col s2">'+
				'<input type="text" class="price'+editmenucounter+' " name="editmenuPrice'+editmenucounter+'" style="font-weight: normal; font-size: 14px">'+
				'<label class="active" style="font-weight: normal;margin-left:-7px; font-size: 14px">Price</label></div>'+
				'<input type="button" value="Delete" class="editmenuremoveButton btn input-field col s1"style="margin-left:10px;margin-top:16px;">'+
			
				        
      '</div>');
	
	            
	newTextBoxDiv.appendTo(".editmenuTextBoxesGroup");

				
	editmenucounter++;
	 $('.editmenuCount').val(editmenucounter);
     });
    
    
    $("body").on("click", ".editmenuremoveButton", function () {
        $(this).closest("div").remove();
        
    });
  </script>
		
		
		<script type="text/javascript">



    
		
    $(".addButton").click(function () {
				
    	var counter = parseInt($('.counter').val());
		
	var newTextBoxDiv = $(document.createElement('div'))
	     .attr("class", 'TextBoxDiv' + counter);
                
	newTextBoxDiv.after().html('<input type="hidden" value="" name="editmenuObject'+counter+'"><div class="row" style="margin-left:4px">'+
			
			'<div class="input-field col s4">'+
				'<input type="text" class="description'+counter+' " name="menuDescription'+counter+'" style="font-weight: normal; font-size: 14px">'+
				'<label class="active" style="font-weight: normal; font-size: 14px;margin-left:-7px;">Menu Item Description</label></div>'+
			'<div class="input-field col s2">'+
				'<input type="text" class="price'+counter+' " name="menuPrice'+counter+'" onkeypress="return isNumber(event)" style="font-weight: normal; font-size: 14px">'+
				'<label class="active" style="font-weight: normal; font-size: 14px;margin-left:-7px;">Price</label></div>'+
			'<div class="input-field col s2">'+
				'<input type="text" value="0" class="sequence'+counter+' " name="menuSequence'+counter+'" onkeypress="return isNumber(event)" style="font-weight: normal; font-size: 14px">'+
				'<label class="active" style="font-weight: normal; font-size: 14px;margin-left:-7px;">Manu Item Sequence</label></div>'+
				'<input type="button" value="Delete" class="removeButton btn input-field col s1" style="margin-left:10px;margin-top:16px;">'+
			
				        
      '</div>');
	
	            
	newTextBoxDiv.appendTo(".TextBoxesGroup");

				
	counter++;
	 $('.counter').val(counter);
     });
    
    
    $("body").on("click", ".removeButton", function () {
        $(this).closest("div").remove();
        
    });
   

     
	 
	 
     
</script>
				
		<script type="text/javascript">
			(function($) {
				$(function() {

					$(".dropdown-button").dropdown();

				}); // End Document Ready
				$('.counter').val('0');
				$('.manageCount').val('0');
			})(jQuery);
			
			$('#remember-me').click(function(){
				
					$("#but").show();
				});
			
			
			
			
		</script>
		
		<script type="text/javascript">



		    
				
		    $(".editmanageAddButton").click(function () {
						
		    	var editManageCounter = $('.editcontactCount').val();
		    	editManageCounter = parseInt(editManageCounter);
		    	if( editManageCounter == 0 )
		    		{
		    		editManageCounter = editManageCounter+30;
		    		}
				
			var newTextBoxDiv = $(document.createElement('div'))
			     .attr("class", 'editmanageTextBoxDiv' + editManageCounter);
		                
			newTextBoxDiv.after().html('<div class="row">'+
				'<div class="input-field col s3"><select name="editmanageType'+editManageCounter+'" style="display:-webkit-inline-box;" class="type'+editManageCounter+'"><option value="" disabled selected>Phone/Email/Website</option>'+
						  '<option value="phone">Phone</option>'+
						  '<option value="email">Email</option>'+
						  '<option value="website">Website</option></select></div>'+
				
		        '<div class="input-field col s4">'+
		          '<input class="details'+editManageCounter+'" type="text" name="editmanageDetails'+editManageCounter+'">'+
		          '<label for="first_name"></label>'+
		        '</div>'+
		        '<input type="button" value="Delete" class="editmanageremoveButton btn input-field col s1" style="margin-left:10px;margin-top:16px;">'+
		        
		      '</div>');
		            
			newTextBoxDiv.appendTo(".editmanageTextBoxesGroup");
			
									
			editManageCounter++;
			$('.editcontactCount').val(editManageCounter);
			
		     });
		    
		    $("body").on("click", ".editmanageremoveButton", function () {
		        $(this).closest("div").remove();
		        
		    });
		    
		    
		    </script>
		
		
		<script type="text/javascript">



		    
				
		    $(".manageAddButton").click(function () {
						
		    	var counter = parseInt($('.manageCount').val());
				
			var newTextBoxDiv = $(document.createElement('div'))
			     .attr("class", 'manageTextBoxDiv' + counter);
		                
			newTextBoxDiv.after().html('<input type="hidden" name="editphoneObjectId'+counter+'" value=""><div class="row" style="margin-left:10px">'+
				'<div class="input-field col s3"><select name="manageType'+counter+'" style="display:block;" class="type'+counter+'"><option value="" disabled selected>Phone/Email/Website</option>'+
						  '<option value="phone">Phone</option>'+
						  '<option value="email">Email</option>'+
						  '<option value="website">Website</option></select></div>'+
				
		        '<div class="input-field col s4">'+
		          '<input class="details'+counter+'" type="text" style="font-size:14px;font-weight:normal" name="manageDetails'+counter+'">'+
		          '<label for="first_name"></label>'+
		        '</div>'+
		        '<input type="button" value="Delete" class="manageRemoveButton btn input-field col s1"style="margin-left:10px;margin-top:16px;">'+
		        
		      '</div>');
		            
			newTextBoxDiv.appendTo(".manageTextBoxesGroup");
			
									
			counter++;
			$('.manageCount').val(counter);
			
		     });
		    
		    $("body").on("click", ".manageRemoveButton", function () {
		        $(this).closest("div").remove();
		        
		    });
		
		     /* $(".manageRemoveButton").click(function () {
			if(counter==1){
		          alert("No more textbox to remove");
		          return false;
		       }   
		        
			counter--;
			$('.manageCount').val(counter);
					
		        $(".manageTextBoxDiv" + counter).remove();
					
		     }); */
			 
			  
		    
		 
				
		     
		</script>
		
		
		
		<script type="text/javascript">
		
		$('#updateAdminDetails').click(function(){
			
			$('#updateAdminhref').click();
			var email1 = $('#updateHideEmail').val();
			
			$('#supertext').text('Update Admin Details');
			$('#updateAdmin').val('Update Admin User');
			var fname = $('#updateFname').val();
	    	var lname = $('#UpdateLname').val();
	    	var uname = $('#updateUname').val();
	    	var email = $('#updateEmail').val();
			var user = "${user}";
			var data = {
				"user":user,
				"fname" : fname,
				"lname" : lname,					
				"email" :email
				
			};
			
			if(email1 != ""  )
			{
				$.ajax({
				      type: "POST",
				      url: "updateAdminDetails",
				      async: true,
				      data : data,
				     
				      success :function(results) {			    	  
				    	  
				    	  console.log(results);
				    	  $('.lean-overlay').css({display:'none'});
				    	 
				     },
				     error : function(error) {
				    	 console.log(error);
				    	
				     }
				  });	
			}
			else
			{
				$.ajax({
				      type: "POST",
				      url: "getAdminDetails",
				      async: true,
				      data : data,
				     
				      success :function(results) {			    	  
				    	  
				    	  console.log(results);
				    	  $('#updateHideEmail').val(results[0].objectId);
				    	  $('#updateFname').val(results[0].firstname);
				    	  $('#UpdateLname').val(results[0].lastname);
				    	  $('#updateUname').val(results[0].username);
				    	  $('#updateEmail').val(results[0].email);
				    	  $('#updatePhone').val(results[0].phone);
				     },
				     error : function(error) {
				    	 console.log(error);
				    	
				     }
				  });	
			}
			
			
			
			
		});
		
$('#updateAdminUser').click(function(){
			
			var sEmail = $('#updateHideEmail').val();
			var fname = $('#updateFname').val();
			var lname = $('#UpdateLname').val();
			var uname = $('#updateUname').val();
			var email = $('#updateEmail').val();
			var phone = $('#updatePhone').val();
			var result = 0;
			
			if(fname == "" || fname == null)
			{
				$('#updateFnameErr').text('First Name is required');
				result++;
			}
			else
			{
				$('#updateFnameErr').empty();
			}
			
			if(lname == "" || lname == null)
			{
				$('#updateLnameErr').text('Last Name is required');
				result++;
			}
			else
			{
				$('#updateLnameErr').empty();
			}
			
			if(uname == "" || uname == null)
			{
				$('#updateUnameErr').text('User Name is required');
				result++;
			}
			else
			{
				var unameVal = uname.replace(/^\s+|\s+$/g, "");
				var CharArray = unameVal.split(" ");
		        if (CharArray.length >= 2) {
		        	$('#updateUnameErr').text("User Name doesn't allow spaces");
		        	result++;
		        }
		        else {
		        	$('#updateUnameErr').empty();
		        }
			}
			
			var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			if(email == "" || email == null)
			{
				$('#updateEmailErr').text('E-mail is required');
				result++;
			}
			else if(!(email.match(mailformat)))
			 {
				 
			  $('#updateEmailErr').text('Invalid email format. Please enter in right format');
			   result++;
			 }
			else
			{
				$('#updateEmailErr').empty();
			}
			
			if(phone == "" || phone == null)
			{
				$('#updatePhoneErr').text('Phone Number is required');
				result++;
			}
			else
			{
				$('#updatePhoneErr').empty();
			}
			var data = {
					
					"firstname":fname,
					"lastname":lname,
					"username":uname,
					"email":email,
					"phone":phone,
					"sEmail":sEmail,
					
					
					
			};
			if(result == 0)
			{
				$.ajax({
				      type: "POST",
				      url: "updateAdminUser",
				      async: true,
				      data : data,
				     
				      success :function(results) {
				    	  console.log(results);
				    	  $('#updateAdmin').hide();
				    	  $('.lean-overlay').css({display:'none'});
				    	
				    	
				     },
				     error : function(error) {
				    	 console.log(error);
				    	
				     }
				  });
			}
			
			
			
			
		});
		
			var lastUsed = null;
			
			$(".locAdmin").click(function(){
				
				var admin = $(this).val();
				//alert(admin);
				
			});

			function reply_click(clicked_id) {
				
				$('#divSection').hide();
				$('.locPopup').hide();
				
				var searchElement = {
		    			"searchId" : clicked_id			    			
		    	};
				$.ajax({
				      type: "POST",
				      url: "editDirectoryDetails",
				      async: true,
				      data : searchElement,
				          
				      success :function(result) {
				    	  	  $('#divSection').show();
				    	  	  debugger;
				    	  	  console.log(result);
				    	  	  localStorage.setItem("TotalDirectoryDetails", JSON.stringify(result));
				    	  	  $('#actionItems').empty();
				    	  	  $('#displayDirectoryTitle').empty();
				    		  $('#displayDirectoryCaption').empty();
				    		  $('#displayDirectoryTimings').empty();
				    		  $('#displayDirectoryDesc').empty();
				    		  $('#displayDirectoryImage').empty();
				    		  $('#displayDirectoryMenuList').empty();
				    		  $('#displayDirectoryPhoneList').empty();
				    		  
				    		  var actionItems = '<a id="'+clicked_id+'" class="waves-light btn modal-trigger right"'+
										        'onclick="edit_DirectoryItems_click(this.id)" '+
										        'style="margin: 0 7px;width:95px;padding:12px;color:white;">Edit</a>'+ 
												'<a	id="'+clicked_id+'" onclick="del_click(this.id)" class="waves-light btn modal-trigger right"'+
												'href="#delete" style="margin: 0 7px;width:107px;padding:12px;color:white;">Delete</a>'+
												'<a	id="'+clicked_id+'" onclick="add_DirectoryItems_click(this.id)" class="waves-light btn modal-trigger right"'+
												'href="#add" style="margin: 0 7px;width:225px; padding:12px;color:white;">ADD DIRECTORY ITEM</a>';
				    	  	  
				    	  	  var dirTitle = '<center style="color: #'+result.styleList[0].titleColor+' ; font-size: '+result.styleList[0].titleFont+';font-family:'+result.styleList[0].titleFamily+'">'+
											 '<b><u>'+result.directoryList[0].title+'</u></b>'+
								             '</center>';
								             
							  var dirCaption = '<center style="color: #'+result.styleList[0].captionColor+' ; font-size: '+result.styleList[0].captionFont+';font-family:'+result.styleList[0].captionFamily+'">'+
											 '<b><u>'+result.directoryList[0].caption+'</u></b>'+
								             '</center>';
								             
							  var dirTimings = '<center style="color: #'+result.styleList[0].timingsColor+' ; font-size: '+result.styleList[0].timingsFont+';font-family:'+result.styleList[0].timingsFamily+'">'+
											 '<b><u>'+result.directoryList[0].timings+'</u></b>'+
								             '</center>';
								             
							  var dirDesc = result.directoryList[0].description;
							  $('#directoryPictureSize').val(result.directoryList[0].hotelPictureSize);
							  
							  if( result.directoryList[0].picture != "No Image To Display" )
							  {
								  var dirImg = '<center style="margin-left:35%;width:30%"> <img alt="" style="width: 100%; height: 100%;" src="'+result.directoryList[0].picture+'"></center>';
							  }
							  
							  
							  
							  var menuListArray = [];
							  var menuList;
							  var totalDetails;
							  
							  var menuListLength = result.menuList;
							  var baaray=[];
							  var dupElements = result.menuList;
							  var duplicates = [];
							  
							  for(i = 0;i<dupElements.length;i++)
							  {
								  duplicates.push(dupElements[i].sequence);
							  }
							  
							  
							  
							  Array.prototype.contains = function(v) {
								    for(var i = 0; i < this.length; i++) {
								        if(this[i] === v) return true;
								    }
								    return false;
								};

								Array.prototype.unique = function() {
								    var arr = [];
								    for(var i = 0; i < this.length; i++) {
								        if(!arr.contains(this[i])) {
								            arr.push(this[i]);
								        }
								    }
								    return arr; 
								}
								
							  
							  var uniques = duplicates.unique();
							  console.log(uniques);
							  
							  function getAllIndexes(arr, val) {
								    var indexes = [], i = -1;
								    while ((i = arr.indexOf(val, i+1)) != -1){
								        indexes.push(i);
								    }
								    return indexes;
								}
							  
							  
								var baaray=[];
								for(i=0;i<uniques.length;i++)
								{
									var indexes = getAllIndexes(duplicates, uniques[i]);
									for(j=indexes.length-1;j>=0;j--)
									{
										baaray.push(dupElements[indexes[j]]);
									}
								}
							  
							  console.log("baaray :"+baaray);
							  
							  
							  for(var i=0;i<baaray.length;i++)
							  {
								  menuList = '<tr> <td style="padding:7px 0px;width:10%">'+
									 '<p style="margin-top: 0px;margin-bottom:0px;font-size:'+result.styleList[0].priceFont+'; color: #'+result.styleList[0].priceColor+';font-family:'+result.styleList[0].captionFamily+' ">'+baaray[i].description+'</p> </td>'+
									 '<td style="padding:7px 5px;width:15%">'+
									 '<div	style="font-size:'+result.styleList[0].priceFont+'; color: #'+result.styleList[0].priceColor+';font-family:'+result.styleList[0].captionFamily+'">'+														
									 '<b>'+baaray[i].price+'</b>'+
									 '</div> </td> </tr>';
								  menuListArray.push(menuList);
							  }						  
							  
							  console.log(menuListArray);
							  
							  var phoneListArray = [];
							  var phoneList;
							  var phoneListLength = result.phoneList;
							  
							  for(var i=0;i<phoneListLength.length;i++)
							  {
								  phoneList = '<tr>	<td style="padding:7px 0px;width:10%">'+
											  '<p style="margin-top: 0px;margin-bottom:0px;font-size:14px; font-family: Courier New, Courier, monospace">'+phoneListLength[(phoneListLength.length - 1) - i].type+'</p>'+
										      '</td>'+
											  '<td style="padding:7px 5px;width:15%">'+
											  '<div	style="font-family: Courier New, Courier, monospace;">'+												
											  '<b>'+phoneListLength[(phoneListLength.length -1) - i].ext+'</b>'+						
											  '</div> </td></tr>';
								  
								  phoneListArray.push(phoneList);
							  }
							  
							  
							  
							  $('#actionItems').append(actionItems);
				    		  $('#displayDirectoryTitle').append(dirTitle);
				    		  $('#displayDirectoryCaption').append(dirCaption);
				    		  $('#displayDirectoryTimings').append(dirTimings);
				    		  $('#displayDirectoryDesc').append(dirDesc);
				    		  $('#displayDirectoryImage').append(dirImg);
				    		  totalDetails = menuListArray+phoneListArray;
				    		  $('#displayDirectoryMenuList').append(totalDetails);
				    		  //$('#displayDirectoryPhoneList').append(phoneListArray);
				    		  
				    		  
					    	  
					    	  
					    	  
					    	  
					    	  
					    	  /* var menuLength = result.menuList;
					    	  console.log(menuLength.length);
					    	  $('#menuDiv').remove();
					    	  var menuDetails = "";
					    	  var menuItems = "";
					    	  for(var i=0;i<menuLength.length;i++)
					    	  {
					    		  
					    		  menuItems = '<input type="hidden" value="'+result.menuList[i].objectId+'" name="editmenuObject'+i+'"><div class="row" style="margin-left:4px">'+								
									'<div class="input-field col s4">'+
										'<input type="text" style="font-size:14px;font-weight:normal" name="menuDescription'+i+'" value="'+result.menuList[i].description+'" class="materialize-textarea validate valid" style="height: 22px;"> <label class="active" for="first_name2" style="font-size:14px;font-weight:normal">MenuItem Description</label>'+
									'</div>'+
									'<div class="input-field col s2">'+
										'<input type="text" style="font-size:14px;font-weight:normal" value="'+result.menuList[i].price+'" name="menuPrice'+i+'" class="materialize-textarea validate" style="height: 22px;"> <label class="active" for="first_name2" style="font-size:14px;font-weight:normal">Price</label>'+
									'</div>'+
									
									'<input type="button" value="Delete" style="margin-left:10px" class="editmenuremoveButton btn input-field col s1">'+
									
								'</div>';
					    		  menuDetails = menuDetails+menuItems;
					    		  
					    	  }
					    	  $('#menuItemsDetails').html(menuDetails);
					    	  $('.counter').val(menuLength.length);
					    	  
					    	  $('#phoneDiv').remove();
					    	  var phoneLength = result.phoneList;
					    	  var phoneDetails = "";
					    	  var phoneItems = "";
					    	  for(var i=0;i<phoneLength.length;i++)
					    	  {
					    		  
					    		  phoneItems = '<input type="hidden" name="editphoneObjectId'+i+'" value="'+result.phoneList[i].objectId+'"><div class="row" style="margin-left:10px">'+
								        '<div class="input-field col s3">'+
											'<select class="browser-default type'+i+'" name="manageType'+i+'">'+
												'<option value="'+result.phoneList[i].type+'" selected="">'+result.phoneList[i].type+'</option>'+
												'<option value="phone">Phone</option>'+
												'<option value="email">Email</option>'+
												'<option value="website">Website</option>'+
											'</select>'+
										'</div>'+												
																																
								'<div class="input-field col s2">'+
									'<input type="text" style="font-size:14px;font-weight:normal" value="'+result.phoneList[i].ext+'" name="manageDetails'+i+'" class="materialize-textarea validate" style="height: 22px;"> <label class="active" for="first_name2"></label>'+
								'</div>'+
								
								'<input type="button" value="Delete" style="margin-left:10px" class="editmanageremoveButton btn input-field col s1">'+
							'</div>';
					    		  
					    		phoneDetails = phoneDetails+phoneItems;  
					    		  
					    	  }
					    	  
					    	  $('#phoneItemsDetails').html(phoneDetails);
					    	  $('.manageCount').val(phoneLength.length);
					    	   
					    	  $('.addDirectoryItemsPopup').show(); */
				    	  
					    	  
				    	     	  
				     },
				     error : function(error) {
				    	console.log(error);
				     }
				  });

			}
			
			
			
            function preview_Directory_click(clicked_id) {
			    
			    //alert(clicked_id);
				window.open("http://egsd.mobldir.com:8080/egsdMobileApp/directories.html?id="+clicked_id, "_blank", "toolbar=yes, scrollbars=yes, resizable=yes,left=500, width=320, height=600");
			    
			   }
			
			function preview_Hotel_click(obj)	{
				
				var hId = $(obj).attr("class");
				window.open("https://bnc.lt/a/key_live_hhoW7g0luMxwlGYKg4TelepbrzdSrV36?&param=directories.html?id="+hId+"&data=eyIkYWx3YXlzX2RlZXBsaW5rIjoiVHJ1ZSJ9==", "_blank", "toolbar=yes, scrollbars=yes, resizable=yes,left=500, width=320, height=600");
			}
			
			function web_preview_Hotel_click(obj)	{
				
				var hId = $(obj).attr("class");
				window.open("http://egsd.mobldir.com:8080/egsdMobileApp/directories.html?id="+hId, "_blank", "toolbar=yes, scrollbars=yes, resizable=yes,left=500, width=320, height=600");
			}

			function Loc_click_redirect(clicked_id) {
				
				/* alert(clicked_id); */
				window.location = clicked_id;
				
				
				
				
				

			}

			function Loc_click(clicked_id) {
				$('.addLocationDiv').hide();

				$('#divSection').hide();

				var hotelDesc = $('#hotelDescription').html();
				
				
				$('#mce_0_ifr').contents().find("body").html(hotelDesc);
				
				$('.locPopup').show();

				$("." + clicked_id).show();
				

			}
			
			
			
			
			
			
			function desc_click(clicked_id) {
				$('.edithr1').hide();
				$('.edithr2').hide();
				
				var fa = $('.fcheck'+clicked_id).val();
				var sa = $('.scheck'+clicked_id).val();
				
				if(fa == undefined)
				{
					
					document.getElementById("editmenu:"+clicked_id).checked = false;
					$('#editmenu'+clicked_id).hide();
				}
				else {
					
					document.getElementById("editmenu:"+clicked_id).checked = true;
					$('#editmenu'+clicked_id).show();
				}
				
				if(sa == undefined)
				{
					
					document.getElementById("editcontact:"+clicked_id).checked = false;
					$('#editcontact'+clicked_id).hide();
				}
				else {
					
					document.getElementById("editcontact:"+clicked_id).checked = true;
					$('#editcontact'+clicked_id).show();
				}
				
				$('#overlay').show();
				$('.popup').show();
				$('.selectLocation').hide();
				$('.save').hide();

				$('.addLocationForm').hide();

				$('.editPopup').show();
				$("." + clicked_id).show();
			} 
			function del_click(clicked_id) {
				
				$('#delDirItem').click();
				$('#overlay').show();
				$('.popup').show();
				$('.selectLocation').hide();
				$('.save').hide();
				$('.addLocationForm').hide();

				$('.delPopup').show();
				prevClicked = lastUsed;
				$("." + prevClicked).hide();

				$("." + clicked_id).show();
				lastUsed = clicked_id;
			}
			function manage_contact_click(clicked_id) {
				$('#overlay').show();
				$('.popup').show();

				$('.addLocationDiv').hide();
				$('.addLocationForm').hide();

				$('.manageDetailsPopup').show();
				prevClicked = lastUsed;
				$("." + prevClicked).hide();

				$("." + clicked_id).show();
				lastUsed = clicked_id;
			}
			
						
			function add_DirectoryItems_click(clicked_id) {
				$('.updateDirectoriesSize').text($('#numberOfImages').val());
				$('#uploadDirectoryImage').val('');
				$('#uploadDirectoryText').text('');
				$('.directorySpinner').hide();
				$('.locPopup').hide();
				$('#addDirItem').click();
				$('#dirTitle0').val('');
				$('#dirCaption0').val('');
				$('#dirTimings0').val('');
		    	/* $('#dirTitleColor0').val('3623DB');
		    	$('#dirTitleFont0').find('option:contains("initial")').attr("selected",true);
		    	$('#dirTitleFamily0').find('option:contains("Courier New")').attr("selected",true);
		    	$('#dirCaption0').val('');
		    	$('#dirCaptionColor0').val('3623DB');
		    	$('#dirCaptionFont0').find('option:contains("initial")').attr("selected",true);
		    	$('#dirCaptionFamily0').find('option:contains("Courier New")').attr("selected",true);
		    	$('#dirTimings0').val('');
		    	$('#dirTimingsColor0').val('3623DB');
		    	$('#dirTimingsFont0').find('option:contains("initial")').attr("selected",true);
		    	$('#dirTimingsFamily0').find('option:contains("Courier New")').attr("selected",true);
		    	
		    	$('#dirPriceColor').val('3623DB');
		    	$('#dirPriceFont').find('option:contains("initial")').attr("selected",true);
		    	$('#dirPriceFamily').find('option:contains("Courier New")').attr("selected",true); */
		    			    	
		    	$('#mce_34_ifr').contents().find("body").html("");
		    	
		    	$('#displayDirectoryItemImage').hide();
							
		    	$('.TextBoxesGroup').empty();
				$('.manageTextBoxesGroup').empty();
				
				$('#addDirSubmitForm').show();
				$('#editDirSubmitForm').hide();
				$("#alwaysEnableButtonForm").attr("action", "addDirectoryItems");
	    		$('#dirItemTitle').text('Add Directory Item');
				
				$('#dirTitle').val('');
				
				$('#dirCaption').val('');
				
				$('#dirTimings').val('');
				
				$('#dirDescption').val('');
				$('#imgUrl').val('');
				$('#overlay').show();
				$('.popup').show();
				 $('input:checkbox').removeAttr('checked');
				 $('#menu'+clicked_id).hide();
				$('.addLocationDiv').hide();
				$('.addLocationForm').hide();
				var searchElement = {
		    			"searchId" : clicked_id			    			
		    	};
				$.ajax({
				      type: "POST",
				      url: "getDirectoryDetails",
				      async: true,
				      data : searchElement,
				      
				      success :function(result) {
console.log(result);
				    	  
				    	  if( result == "")
				    	  {
				    		  $('#objectIdOfLocation').val(clicked_id);
				    		  $('#dirObjectId').val('');
					    	  $('#directoryDirectoryId').val('');
					    	  $('#directoryStyleId').val('');
					    	  $('#directoryLocationId').val('');
					    	  $('.addDirectoryItemsPopup').show();
				    	  }
				    	  else
				    	  {
				    		  if(result[0].objectId == "" || result[0].objectId == null )
					    	  {
					    		  $('#objectIdOfLocation').val(clicked_id);
					    		  $('#dirObjectId').val('');
						    	  $('#directoryDirectoryId').val('');
						    	  $('#directoryStyleId').val('');
						    	  $('#directoryLocationId').val('');
						    	  $('.addDirectoryItemsPopup').show();
					    	  }
					    	  else
					    	  {
					    		  //$("#formAction").attr("action", "editDirectoryItem");
					    		  $('#dirObjectId').val(result[0].objectId);
						    	  $('#directoryDirectoryId').val(result[0].directoryId);
						    	  $('#directoryStyleId').val(result[0].styleId);
						    	  $('#directoryLocationId').val(result[0].locationId);
						    	  $('#objectIdOfLocation').val('');
						    	  $('.addDirectoryItemsPopup').show();
					    	  }
					    	  
					    	  if( result[0].defaultTitleFontColor != null )
					    	  {
					    		  $('#dirTitleColor0').val(result[0].defaultTitleFontColor);
					    	  }
					    	  if( result[0].defaultTitleFontSize != null )
					    	  {
					    		  $('#dirTitleFont0').val(result[0].defaultTitleFontSize);
					    	  }
					    	  if( result[0].defaultTitleFontFamily != null )
					    	  {
					    		  $('#dirTitleFamily0').val(result[0].defaultTitleFontFamily);
					    	  }
					    	  
					    	  if( result[0].defaultCaptionFontColor != null )
					    	  {
					    		  $('#dirCaptionColor0').val(result[0].defaultCaptionFontColor);
					    	  }
					    	  if( result[0].defaultCaptionFontSize != null )
					    	  {
					    		  $('#dirCaptionFont0').val(result[0].defaultCaptionFontSize);
					    	  }
					    	  if( result[0].defaultCaptionFontFamily != null )
					    	  {
					    		  $('#dirCaptionFamily0').val(result[0].defaultCaptionFontFamily);
					    	  }
					    	  
					    	  if(result[0].defaultHoursFontColor != null )
					    	  {
					    		  $('#dirTimingsColor0').val(result[0].defaultHoursFontColor);
					    	  }
					    	  if( result[0].defaultHoursFontSize!= null )
					    	  {
					    		  $('#dirTimingsFont0').val(result[0].defaultHoursFontSize);
					    	  }
					    	  if( result[0].defaultHoursFontFamily != null )
					    	  {
					    		  $('#dirTimingsFamily0').val(result[0].defaultHoursFontFamily);
					    	  }
					    	  
					    	  if( result[0].defaultMenuFontColor != null )
					    	  {
					    		  $('#dirPriceColor').val(result[0].defaultMenuFontColor);
					    	  }
					    	  if( result[0].defaultMenuFontSize != null )
					    	  {
					    		  $('#dirPriceFont').val(result[0].defaultMenuFontSize);
					    	  }
					    	  if(result[0].defaultMenuFontFamily != null )
					    	  {
					    		  $('#dirPriceFamily').val(result[0].defaultMenuFontFamily);
					    	  }
					    	  
				    	  }
				    	  
				    	     	  
				     },
				     error : function(error) {
				    	console.log(error);
				     }
				  }); 

				 
			}
			
			
			function edit_DirectoryItems_click(clicked_id) {
				$('.updateDirectoriesSize').text($('#numberOfImages').val());
				$('#uploadImageStatus').val('0');
				$('#uploadDirectoryText').text('');
				$('.directorySpinner').hide();
				$('#displayDirectoryItemImage').empty();
				$('#addDirItem').click();
				$('.TextBoxesGroup').empty();
				$('.manageTextBoxesGroup').empty();
				
				    $('#dirItemTitle').text('Edit Directory Item');
				    $('#dirTitle0').val('');
			    	$('#dirTitleColor0').val('3623DB');
			    	
			    	$('#dirCaption0').val('');
			    	$('#dirCaptionColor0').val('3623DB');
			    	
			    	$('#dirTimings0').val('');
			    	$('#dirTimingsColor0').val('3623DB');
			    	
			    	$('#dirPriceColor').val('3623DB');
			    			    	
			    	$('#mce_34_ifr').contents().find("body").html("");
				$('#imgUrl').val('');
				$('#overlay').show();
				$('.popup').show();
				 $('input:checkbox').removeAttr('checked');
				 $('#menu'+clicked_id).hide();
				$('.addLocationDiv').hide();
				$('.addLocationForm').hide();
				$("#alwaysEnableButtonForm").attr("action", "edit");
				$('#editDirSubmitForm').show();
				$('#addDirSubmitForm').hide();
				var result = JSON.parse(localStorage.getItem('TotalDirectoryDetails'));
				    		  $('#dirObjectId').val(result.directoryList[0].objectId);
					    	  $('#directoryDirectoryId').val(result.directoryList[0].directoryId);
					    	  $('#directoryStyleId').val(result.directoryList[0].styleId);
					    	  $('#directoryLocationId').val(result.directoryList[0].locationId);
					    	  $('#objectIdOfLocation').val('');
					    	  $('#dirTitle0').val(result.directoryList[0].title);
					    	  $('#dirTitleColor0').val(result.styleList[0].titleColor);
					    	  $('#dirTitleFont0').val(result.styleList[0].titleFont);					    	  
					    	  $('#dirTitleFamily0').val(result.styleList[0].titleFamily);
					    	  $('#dirCaption0').val(result.directoryList[0].caption);
					    	  $('#dirCaptionColor0').val(result.styleList[0].captionColor);
					    	  $('#dirCaptionFont0').val(result.styleList[0].captionFont);
					    	  $('#dirCaptionFamily0').val(result.styleList[0].captionFamily);
					    	  $('#dirTimings0').val(result.directoryList[0].timings);
					    	  $('#dirTimingsColor0').val(result.styleList[0].timingsColor);
					    	  $('#dirTimingsFont0').val(result.styleList[0].timingsFont);
					    	  $('#dirTimingsFamily0').val(result.styleList[0].timingsFamily);
							  $('#imgDirUrl').val(result.directoryList[0].picture);
							  
					    	  
					    	  if( result.directoryList[0].picture != "No Image To Display" )
							  {
								  var dirImg = '<center style="margin-left:35%;width:80%;margin-top:13%"> <img alt="" style="width: 100%; height: 100%;" src="'+result.directoryList[0].picture+'"></center>';
								  $('#deleteDirectoryImage').show();
							  }
					    	  $('#displayDirectoryItemImage').html(dirImg);
					    	  $('#dirPriceColor').val(result.styleList[0].priceColor);
					    	  $('#dirPriceFont').val(result.styleList[0].priceFont);
					    	  $('#dirPriceFamily').val(result.styleList[0].priceFamily);
					    	  $('#mce_34_ifr').contents().find("body").html(result.directoryList[0].description);
					    	  
					    	  $('#displayDirectoryItemImage').show();
					    	  
					    	  
					    	  var menuLength = result.menuList;
					    	  var menuListLength = result.menuList;
							  var baaray=[];
							  var dupElements = result.menuList;
							  var duplicates = [];
							  
							  for(i = 0;i<dupElements.length;i++)
							  {
								  duplicates.push(dupElements[i].sequence);
							  }
							  
							  
							  
							  Array.prototype.contains = function(v) {
								    for(var i = 0; i < this.length; i++) {
								        if(this[i] === v) return true;
								    }
								    return false;
								};

								Array.prototype.unique = function() {
								    var arr = [];
								    for(var i = 0; i < this.length; i++) {
								        if(!arr.contains(this[i])) {
								            arr.push(this[i]);
								        }
								    }
								    return arr; 
								}
								
							  
							  var uniques = duplicates.unique();
							  console.log(uniques);
							  
							  function getAllIndexes(arr, val) {
								    var indexes = [], i = -1;
								    while ((i = arr.indexOf(val, i+1)) != -1){
								        indexes.push(i);
								    }
								    return indexes;
								}
							  
							  
								var baaray=[];
								for(i=0;i<uniques.length;i++)
								{
									var indexes = getAllIndexes(duplicates, uniques[i]);
									for(j=indexes.length-1;j>=0;j--)
									{
										baaray.push(dupElements[indexes[j]]);
									}
								}
							  
							  console.log("baaray :"+baaray);				    	  
					    	  
					    	  
					    	  $('#menuDiv').remove();
					    	  var menuDetails = "";
					    	  var menuItems = "";
					    	  for(var i=0;i<menuLength.length;i++)
					    	  {
					    		  
					    		  menuItems = '<input type="hidden" value="'+baaray[i].objectId+'" name="editmenuObject'+i+'"><div class="row" style="margin-left:4px">'+								
									'<div class="input-field col s4">'+
										'<input type="text" style="font-size:14px;font-weight:normal" name="menuDescription'+i+'" value="'+baaray[i].description+'" class="materialize-textarea validate valid" style="height: 22px;"> <label class="active" for="first_name2" style="font-size:14px;font-weight:normal;margin-left:-7px;">Menu Item Description</label>'+
									'</div>'+
									'<div class="input-field col s2">'+
										'<input type="text" style="font-size:14px;font-weight:normal" value="'+baaray[i].price+'" name="menuPrice'+i+'" class="materialize-textarea validate" style="height: 22px;"> <label class="active" for="first_name2" style="font-size:14px;font-weight:normal;margin-left:-7px;">Price</label>'+
									'</div>'+
									'<div class="input-field col s2">'+
										'<input type="text" style="font-size:14px;font-weight:normal" value="'+baaray[i].sequence+'" name="menuSequence'+i+'" class="materialize-textarea validate" style="height: 22px;"> <label class="active" for="first_name2" style="margin-left:-7px;font-size:14px;font-weight:normal">Menu Item Sequence</label>'+
									'</div>'+
									
									'<input type="button" value="Delete" style="margin-left:10px" class="editmenuremoveButton btn input-field col s1">'+
									
								'</div>';
					    		  menuDetails = menuDetails+menuItems;
					    		  
					    	  }
					    	  $('.TextBoxesGroup').html(menuDetails);
					    	  $('.counter').val(menuLength.length);
					    	  
					    	  $('#phoneDiv').remove();
					    	  var phoneLength = result.phoneList;
					    	  var phoneDetails = "";
					    	  var phoneItems = "";
					    	  for(var i=0;i<phoneLength.length;i++)
					    	  {
					    		  
					    		  phoneItems = '<input type="hidden" name="editphoneObjectId'+i+'" value="'+result.phoneList[(phoneLength.length - 1) - i].objectId+'"><div class="row" style="margin-left:10px">'+
								        '<div class="input-field col s3">'+
											'<select class="browser-default type'+i+'" name="manageType'+i+'">'+
												'<option value="'+result.phoneList[(phoneLength.length - 1) - i].type+'" selected="">'+result.phoneList[(phoneLength.length - 1) - i].type+'</option>'+
												'<option value="phone">Phone</option>'+
												'<option value="email">Email</option>'+
												'<option value="website">Website</option>'+
											'</select>'+
										'</div>'+												
																																
								'<div class="input-field col s4">'+
									'<input type="text" style="font-size:14px;font-weight:normal" value="'+result.phoneList[(phoneLength.length - 1) - i].ext+'" name="manageDetails'+i+'" class="materialize-textarea validate" style="height: 22px;"> <label class="active" for="first_name2"></label>'+
								'</div>'+
								
								'<input type="button" value="Delete" style="margin-left:10px" class="editmanageremoveButton btn input-field col s1">'+
							'</div>';
					    		  
					    		phoneDetails = phoneDetails+phoneItems;  
					    		  
					    	  }
					    	  
					    	  $('.manageTextBoxesGroup').html(phoneDetails);
					    	  $('.manageCount').val(phoneLength.length);
					    	   
					    	  $('.addDirectoryItemsPopup').show();     	  
				   

				  childWindow.location.reload();
			}
			
			
			
			function add_Directory_click(clicked_id) {
				$('#overlay').show();
				$('.popup').show();
				$('.addLocationDiv').hide();
				$('.addLocationForm').hide();
				$('.addDirectoryPopup').show();
				$('#add').modal('show');
				$('#directoryLocationId').val(clicked_id);
				//$("." + clicked_id).show();

			}
			function del_Loc_click(clicked_id) {

				$('#overlay').show();
				$('.popup').show();
				$('.selectLocation').hide();
				$('.save').hide();
				$('.addLocationForm').hide();

				$('.deleteLocation').show();
				$('.addDirectoryPopup').hide();
				$("." + clicked_id).show();
			}
			function edit_Directory_click(clicked_id) {
					debugger;
					$('.updateDirectoriesSize').text($('#numberOfImages').val());
					$('#uploadHotelLogo').val('')
					$('#uploadLogo').val('')
					$('#uploadHotelFooter').val('')
					$('#uploadHotelLogoText').text('');
					$('#uploadLogoText').text('');
					$('#uploadHotelFooterText').text('');
					$('#imgUrl2').val('');
					$('#imgUrl1').val('');
					$('#imgUrl3').val('');
				$('#overlay').show();
				$('.popup').show();
				$('.addDirectoryPopup').hide();

				$('.addLocationForm').hide();

				$('.editLocation').show();

				prevClicked = lastUsed;
				$("." + prevClicked).hide();

				$("." + clicked_id).show();
				lastUsed = clicked_id;

			}
			CloseDiv()
			function add_Loc() {
				$('#divSection').hide();
				$('.addLocationForm').show();

				$('.selectLocation').hide();
				$('.editPopup').hide();
				$('.delPopup').hide();
				$('.menuPopup').hide();

				$('.save').hide();
				$('.popup').hide();

				$('.locPopup').hide();

			}
			function CloseDiv() {
				$('.selectLocation').hide();
				$('.editPopup').hide();
				$('.delPopup').hide();
				$('.menuPopup').hide();

				$('.save').hide();
				$('.popup').hide();

				$('.addLocationForm').hide();
				$('.addLocationDiv').hide();
				$('.addDirectoryItemsPopup').hide();
				$('.addDirectoryPopup').hide();

				$('.deleteLocation').hide();

			}
			
			
			
		</script>
		
		
		
		<script type="text/javascript">
		
			$(document).ready(function(){
			 	$("#add11").trigger('click');
			 	
			 	
			});
			
			function bodyLoad() {
				$('.container').show();
				
				window.onbeforeunload = function() {};
				
				
				
				//var myParam = location.search.split('user')[1];
				//alert(myParam);

			}
			$(".locAdmin").change(function() {
			       var details = $('option:selected', this).text() ;
			       if(details == "Please Add Location Admin" )
			    	{
			    	   
			    	   $('#locationAdmin').click();
			    	}
					//$('#narshimha').click();
			 });
		</script>
		
		<script>
		
		
		$('.modal-action').click(function(){
			
			$('.lean-overlay').css({display:'none'});
			
		});
		
		
		$('#asAdmin').click(function(){
			$('#superFirstname').val('');
			$('#superLastname').val('');
			$('#superUsername').val('');
			$('#superUsername').removeAttr('disabled');
			$('#superEmail').val('');
			$('#saEmail').val('');
			$('#supertext').text('Create Super Admin User');
			$('#createSuperAdmin').text('Create Super Admin');
			//$('#createSuperAdmin').show();
			//$('#updateSuperAdmin').hide();
			$('#sfnameErr').empty();
			$('.userExisted').empty();
			$('#slnameErr').empty();
			$('#sunameErr').empty();
			$('#semailErr').empty();
			
			$('#asAdminhref').click();
			
		});
		
		
		
		$('#acAdmin').click(function(){
			$('#csFirstname').val('');
			$('#csLastname').val('');
			$('#csUsername').val('');
			$('#csUsername').removeAttr('disabled');
			$('#csEmail').val('');
			$('#caEmail').val('');
			$('#cstext').text('Create CS Admin User');
			$('#createCSAdmin').text('Create CS Admin');
			//$('#createCSAdmin').show();
			//$('#updateCSAdmin').hide();
			$('#cfnameErr').empty();
			$('.userExisted').empty();
			$('#clnameErr').empty();
			$('#cunameErr').empty();
			$('#cemailErr').empty();
			
			$('#csAdminhref').click();
			
		});
		
		$('#alAdmin').click(function(){
			$('#locationFirstname').val('');
			$('#locationLastname').val('');
			$('#locationUsername').val('');
			$('#locationUsername').removeAttr('disabled');
			$('#locationEmail').val('');
			$('#laEmail').val('');
			$('#locationtext').text('Create Location Admin User');
			$('#createLocationAdmin').text('Create Location Admin');
			//$('#createLocationAdmin').show();
			//$('#updateLocationAdmin').hide();
			$('#lfnameErr').empty();
			$('.userExisted').empty();
			$('#lfnameErr').empty();
			$('#llnameErr').empty();
			$('#lunameErr').empty();
			$('#lemailErr').empty();			
			$('#locationAdmin').click();
			
		});
		
	$('#agroup').click(function(){
		$('#addGroupName').val('');
		$('#addTemplateId').val('');
		$('#groupNameErr').empty();
		$('#groupExistErr').empty();
		$('#groupIdErr').empty();		
		$('#grouphref').click();
		
		$.ajax({
		      type: "POST",
		      url: "getTemplates",
		      async: true,
		      		      
		      success :function(result) {
		    	  
		    	  console.log(result);
		    	  var templates;
		    	  var templatesArray = [];
		    	  
		    	  for(var i=0;i<result.length;i++)
		    	  {
		    		  templates = "<option value="+result[i].objectId+"> "+result[i].name+" </option>"; 
		    		  templatesArray.push(templates);
		    	  }
		    	  
		    	  $('#addTemplateId').append(templatesArray);
		    	     	  
		     },
		     error : function(error) {
		    	console.log(error);
		     }
		  });		
				
	});
	
	$('#ahotel').click(function(){
		$('#checkBox').attr("checked",false);
		$('#hotelName').val('');
		$('#Address1').val('');
		$('#Address2').val('');
		$('#adminId').val('');
		$('#showTemplates').val('');
		$('#groupObjectId').val('');
		$('#Street').val('');
		$('#groupId').val('');
		
		
		$('#State').val('');
		$('.file-path').val('');
		$('#zipcode').val('');
		$('#country').val('');
		$('#hotelNameErr').empty();
		$('#hotelExistErr').empty();
		$('#hotelLocationAdminErr').empty();
		$('#hotelTemplateErr').empty();
		$('#hotelGroupErr').empty();
		$('#hotelAddressErr').empty();
		$('#hotelCityErr').empty();
		$('#hotelStateErr').empty();
		$('#hotelZipcodeErr').empty();
		$('#hotelCountryErr').empty();
		
		$('#hotelhref').click();
		
		$.ajax({
		      type: "POST",
		      url: "getLocationAdmins",
		      async: true,
		      		      
		      success :function(result) {
		    	  
		    	  console.log(result);
		    	  var admins;
		    	  var adminsArray = [];
		    	  
		    	  for(var i=0;i<result.length;i++)
		    	  {
		    		  admins = "<option value="+result[i].objectId+"> "+result[i].username+"-"+result[i].firstname+" "+result[i].lastname+" </option>"; 
		    		  adminsArray.push(admins);
		    	  }
		    	  
		    	  $('#adminId').append(adminsArray);
		    	     	  
		     },
		     error : function(error) {
		    	console.log(error);
		     }
		  });
		
		$.ajax({
		      type: "POST",
		      url: "getTemplates",
		      async: true,
		      		      
		      success :function(result) {
		    	  
		    	  console.log(result);
		    	  var templates;
		    	  var templatesArray = [];
		    	  
		    	  for(var i=0;i<result.length;i++)
		    	  {
		    		  templates = "<option value="+result[i].objectId+"> "+result[i].name+" </option>"; 
		    		  templatesArray.push(templates);
		    	  }
		    	  
		    	  $('#showTemplates').append(templatesArray);
		    	     	  
		     },
		     error : function(error) {
		    	console.log(error);
		     }
		  });
		
		$.ajax({
		      type: "POST",
		      url: "getGroups",
		      async: true,
		      		      
		      success :function(result) {
		    	  
		    	  console.log(result);
		    	  
		    	  var groups;
		    	  var groupsArray = [];
		    	  
		    	  for(var i=0;i<result.length;i++)
		    	  {
		    		  groups = "<option value="+result[i].objectId+"> "+result[i].name+" </option>"; 
		    		  groupsArray.push(groups);
		    	  }
		    	  
		    	  $('#groupObjectId').append(groupsArray);
		    	     	  
		     },
		     error : function(error) {
		    	console.log(error);
		     }
		  });
		
	});
	
	$('#ctemplate').click(function(){
		$('#templateName').val('');
		$('#templateId').val('');
		$('#templateNameErr').empty();
		$('#templateExistErr').empty();
		$('#templateIdErr').empty();
		
		$('#templatehref').click();
		
		$.ajax({
		      type: "POST",
		      url: "getTemplates",
		      async: true,
		      		      
		      success :function(result) {
		    	  
		    	  console.log(result);
		    	  var templates;
		    	  var templatesArray = [];
		    	  
		    	  for(var i=0;i<result.length;i++)
		    	  {
		    		  templates = "<option value="+result[i].objectId+"> "+result[i].name+" </option>"; 
		    		  templatesArray.push(templates);
		    	  }
		    	  
		    	  $('#templateId').append(templatesArray);
		    	     	  
		     },
		     error : function(error) {
		    	console.log(error);
		     }
		  });
		
	});
	
	
	
		function submitform(){
			var templateResult = 0;
			var name = $('#templateName').val();
			var id = $('#templateId').val();
			if(name == "" || name == null)
			{
				$('#templateNameErr').text("Template Name is required");
				$('#templateExistErr').empty();
				templateResult++;
			}
			else
			{
				$('#templateNameErr').empty();				
			}
			if(id == "" || id == null)
			{
				$('#templateIdErr').text("Please select template from the list");
				templateResult++;
			}
			else
			{
				$('#templateIdErr').empty();
				
			}
			
			
			
			if(templateResult == 0)
			{
				$(".tspin").show();
				var data = {
						"templateName" : name					
					};
					
					$.ajax({
					      type: "POST",
					      url: "verifyTemplate",
					      async: true,
					      data : data,
					     
					      success :function(results) {
					    	  if(results == "noduplicate")
					    	  {
					    		  $('.tspin').hide();
					    		  $("#templateExistErr").empty();
					    		  document.addTemplate.submit();
					    		  templateResult = 0;
					    	  }
					    	  else
					    	  {
					    		  $('#templateNameErr').empty();
					    		  $("#templateExistErr").text("This Template is already registered");
					    		 
					    		  $('.tspin').hide();
					    		  templateResult++;
					    	  }
					    	  
					    	  console.log(results);
					    	 
					     },
					     error : function(error) {
					    	 console.log(error);
					    	
					     }
					  });			
				
			} 
			 
		}		
				
		function groupSubmitform()
		{
			var groupResult = 0;
			var name = $('#addGroupName').val();
			var id = $('#addTemplateId').val();
			if(name == "" || name == null)
			{
				$('#groupNameErr').text("Group Name is required");
				 $("#groupExistErr").empty();
				groupResult++;
			}
			else
			{
				$('#groupNameErr').empty();     				
			}
			if(id == "" || id == null)
			{
				$('#groupIdErr').text("Please select template from the list");
				groupResult++;
			}
			else
			{
				$('#groupIdErr').empty();
				
			} 
			
			
			if(groupResult == 0)
			{
				
				$(".gspin").show();
				$.ajax({
				      type: "POST",
				      url: "verifyGroup",
				      async: true,
				      data : {"groupName":name},
				     
				      success :function(results) {
				    	  if(results == "duplicate")
				    	  {
				    		  $("#groupExistErr").text("This group is already registered");
				    		  $('#groupNameErr').empty();
				    		  $('.gspin').hide();
				    		  groupResult++;
				    	  }
				    	  else
				          {
				    		  $("#groupExistErr").empty();				    		  
				    		  document.addGroup.submit();
				    		  $('.gspin').hide();
				    		  groupResult = 0;  
				          }
				    	 
				     },
				     error : function(error) {
				    	 console.log(error);
				    	
				     }
				  });
				
				
			}
		}
		
		function Validate(txt) {
            txt.value = txt.value.replace(/[^a-zA-Z 0-9\n\r]+/g, '');
        }
		
		/* $.fn.regexMask = function(mask) {
		    $(this).keypress(function (event) {
		        if (!event.charCode) return true;
		        var part1 = this.value.substring(0, this.selectionStart);
		        var part2 = this.value.substring(this.selectionEnd, this.value.length);
		        if (!mask.test(part1 + String.fromCharCode(event.charCode) + part2))
		            return false;
		    });
		};

		$(document).ready(function() {
		    var mask = new RegExp('^[A-Za-z0-9 ]*$');
		    $("#zipcode").regexMask(mask); 
		}); */
		
		/* $('#zipcode').keydown(function (e) {
			var regex = new RegExp("^[a-zA-Z0-9]+$");
		    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
		    if (regex.test(str)) {
		        return true;
		    }

		    e.preventDefault();
		    return false;
		});
		 */
		
		
		
		function hotelSubmitform()
		{
			var hotelResult = 0;
			var hName = $('#hotelName').val();
			$('#addNewHotel').attr('disabled','disabled');
			var hAddress1 = $('#Address1').val();
			var locId = $('#adminId').val();
			var tempId = $('#showTemplates').val();
			var groupId = $('#groupObjectId').val();			
			var hCity = $('#Street').val();
			var hState = $('#State').val();
			var hZipcode = $('#zipcode').val();
			var hCountry = $('#country').val();
			
			var latitude = $('#addLatitude').val();
			var longitude = $('#addLongitude').val();
			
			if(latitude != "" && latitude != null)
			{
				if(longitude == "" || longitude == null)
				{
					alert("Enter Longitude Value");
					hotelResult++;
				}	
				else
				{
					if( parseFloat(longitude).toFixed(2) <= -180 ||  parseFloat(longitude).toFixed(2) >= 180)
					{
						alert("Longitude value must between -180 to 180");
						hotelResult++;
					}
					
				}
			}
			if(longitude != "" && longitude != null)
			{
				if(latitude == "" || latitude == null)
				{
					alert("Enter Latitude Value");
					hotelResult++;
				}	
				else
				{
					if( parseFloat(latitude).toFixed(2) <= -90 ||  parseFloat(latitude).toFixed(2) >= 90)
					{
						alert("Langtude value must between -90 to 90");
						hotelResult++;
					}
				}
			}
			else
			{				
				console.log("not required");				
			}
			
			
			
			if(document.getElementById('checkBox').checked) {
				$('#hotelGroupErr').empty();
				$('#hotelTemplateErr').empty();
				if(groupId == "" || groupId == null)
				{
					$('#hotelGroupErr').text("Please select Group from the list");
					hotelResult++;
				}
				else
				{
					$('#hotelTemplateErr').empty();				
					
				} 
			    
			} else {
				
				$('#hotelGroupErr').empty();
				$('#hotelTemplateErr').empty();
				if(tempId == "" || tempId == null)
				{
					$('#hotelTemplateErr').text("Please select template from the list");
					hotelResult++;
				}
				else
				{
					$('#hotelTemplateErr').empty();				
					
				} 
				
			}
			
			if(hName == "" || hName == null)
			{
				$('#hotelNameErr').text("Hotel Name is required");
				hotelResult++;			
			}
			else
			{
				$('#hotelNameErr').empty();
				
				
			}
			
			/* if(hAddress1 == "" || hAddress1 == null)
			{
				$('#hotelAddressErr').text("Address is required");
				hotelResult++;
			}
			else
			{
				$('#hotelAddressErr').empty();				
				
			} */
			
			if(locId == "" || locId == null)
			{
				$('#hotelLocationAdminErr').text("Please select Location Admin from the list");
				hotelResult++;
			}
			else if(locId == "empty")
			{
				$('#locationAdmin').click();
				$('#addHotel').hide();
			}
			else
			{
				$('#hotelLocationAdminErr').empty();				
				
			}		
			
			
			
					
			/* if(hCity == "" || hCity == null)
			{
				$('#hotelCityErr').text("City is required");
				hotelResult++;
			}
			else
			{
				$('#hotelCityErr').empty();				
				
				
			}
			
			if(hState == "" || hState == null)
			{
				$('#hotelStateErr').text("State is required");
				hotelResult++;
			}
			else
			{
				$('#hotelStateErr').empty();
				
			}
			
			if(hZipcode == "" || hZipcode == null)
			{
				$('#hotelZipcodeErr').text("Zipcode is required");
				hotelResult++;
			}
			else
			{
				$('#hotelZipcodeErr').empty();				
			}
			
			if(hCountry == "" || hCountry == null)
			{
				$('#hotelCountryErr').text("Country is required");
				hotelResult++;
			}
			else
			{
				$('#hotelCountryErr').empty();			
			} */
			
			
			
			if(hotelResult == 0)
			{
				$(".hspin").show();
				$.ajax({
				      type: "POST",
				      url: "verifyHotel",
				      async: true,
				      data : {"hotelName":hName},
				     
				      success :function(results) {
				    	  if(results == "duplicate")
				    	  {
				    		  $('#hotelNameErr').empty();
				    		  $("#hotelExistErr").text("This hotel is already registered");
				    		  $('.hspin').hide();
				    		  hotelResult++;
				    	  }
				    	  else
				          {
				    		  $("#hotelExistErr").empty();
				    		  $(".hspin").show();
				    		  document.addLocation.submit();
				    		  
				    		  hotelResult = 0;  
				          }
				    	 
				     },
				     error : function(error) {
				    	 console.log(error);
				    	
				     }
				  }); 
			}   
		}
		
		
		
		
		$('#createSuperAdmin').click(function(){
			
			$('.userExisted').empty();
			var result = 0;
			var sEmail = $('#saEmail').val();
			var fname = $('#superFirstname').val();
			var lname = $('#superLastname').val();
			var uname = $('#superUsername').val();
			var email = $('#superEmail').val();
			
			if(fname == "" || fname == null)
			{
				$('#sfnameErr').text('First Name is required');
				result++;
			}
			else
			{
				$('#sfnameErr').empty();
			}
			
			if(lname == "" || lname == null)
			{
				$('#slnameErr').text('Last Name is required');
				result++;
			}
			else
			{
				$('#slnameErr').empty();
			}
			
			if(uname == "" || uname == null)
			{
				$('#sunameErr').text('User Name is required');
				result++;
			}
			else
			{
				var unameVal = uname.replace(/^\s+|\s+$/g, "");
				var CharArray = unameVal.split(" ");
		        if (CharArray.length >= 2) {
		        	$('#sunameErr').text("User Name doesn't allow spaces");
		        	result++;
		        }
		        else {
		        	$('#sunameErr').empty();
		        }
			}
			
			var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			if(email == "" || email == null)
			{
				$('#semailErr').text('E-mail is required');
				result++;
			}
			else if(!(email.match(mailformat)))
			 {
				 
			  $('#semailErr').text('Invalid email format. Please enter in right format');
			   result++;
			 }
			else
			{
				$('#semailErr').empty();
			}
			
			if(result == 0)
			{
				var data = {
						
						"firstname":fname,
						"lastname":lname,
						"username":uname,
						"email":email,
						"sEmail":sEmail,
						"user": $('#user').val(),
						"userName": $('#userName').val()
						
						
				};
				
				 $(".sbody").append("<div style='margin:-55% 46%' class='preloader-wrapper small active'><div class='spinner-layer spinner-green-only'><div class='circle-clipper left'><div class='circle></div></div><div class='gap-patch'><div class='circle'></div></div><div class='circle-clipper right'><div class='circle'></div></div></div></div>");
				
				$.ajax({
				      type: "POST",
				      url: "registerSuperAdmin",
				      async: true,
				      data : data,
				     
				      success :function(results) {
				    	  console.log(results);
				    	  if(results == "userExisted")
					    	{
					    		$('.userExisted').text("This username is already taken");
					    		$('.sbody > :last-child').remove();
					    		
					    	}
					    	else if(results == "emailExisted")
					    	{
					    		$('.userExisted').text("This email is already existing in the system. Same email id is not allowed for multiple users.");
					    		$('.sbody > :last-child').remove();
					    		
					    	}
					    	else if(results == "userUpdated")
					    	{
					    		$('.userExisted').text("Successfully updated admin details.");
					    		$('.userExisted').css("color","green");
					    		$('.sbody > :last-child').remove();
					    	}
					    	else
					    	{
					    		$('#superAdmin').hide();
						    	$('.sbody > :last-child').remove();
						    	$('.lean-overlay').css({display:'none'});
						    	$('#narshimha').click();
						    	$('#userType').text("Super Admin");
						    	$('#superFirstname').val('');
						    	$('#superLastname').val('');
						    	$('#superUsername').val('');
						    	$('#superEmail').val('');
					    	}
				    	
				    	
				     },
				     error : function(error) {
				    	 console.log(error);
				    	$('#superAdmin').hide();
				    	$('.sbody > :last-child').remove();
				    	$('.lean-overlay').css({display:'none'});
				    	$('#superFirstname').val('');
				    	$('#superLastname').val('');
				    	$('#superUsername').val('');
				    	$('#superEmail').val('');
				     }
				  });
			}		
			
		});
		
		
		
		
		$('#createCSAdmin').click(function(){
			$('.userExisted').empty();
			var result = 0;
			var fname = $('#csFirstname').val();
			var lname = $('#csLastname').val();
			var uname = $('#csUsername').val();
			var email = $('#csEmail').val();
			var cEmail = $('#caEmail').val();
			
			
			if(fname == "" || fname == null)
			{
				$('#cfnameErr').text('First Name is required');
				result++;
			}
			else
			{
				$('#cfnameErr').empty();
			}
			
			if(lname == "" || lname == null)
			{
				$('#clnameErr').text('Last Name is required');
				result++;
			}
			else
			{
				$('#clnameErr').empty();
			}
			
			if(uname == "" || uname == null)
			{
				$('#cunameErr').text('User Name is required');
				result++;
			}
			else
			{
				var unameVal = uname.replace(/^\s+|\s+$/g, "");
				var CharArray = unameVal.split(" ");
		        if (CharArray.length >= 2) {
		        	$('#cunameErr').text("User Name doesn't allow spaces");
		        	result++;
		        }
		        else {
		        	$('#cunameErr').empty();
		        }
			}
			
			var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			if(email == "" || email == null)
			{
				$('#cemailErr').text('E-mail is required');
				result++;
			}
			else if(!(email.match(mailformat)))
			 {
				 
			  $('#cemailErr').text('Invalid email format. Please enter in right format');
			   result++;
			 }
			else
			{
				$('#cemailErr').empty();
			}
			
			if(result == 0)
			{
				var data = {
						
						"firstname":fname,
						"lastname":lname,
						"username":uname,
						"email":email,
						"sEmail":cEmail,
						"user": $('#user').val(),
						"userName": $('#userName').val()
						
						
				};
				$(".csbody").append("<div style='margin:-55% 46%' class='preloader-wrapper small active'><div class='spinner-layer spinner-green-only'><div class='circle-clipper left'><div class='circle></div></div><div class='gap-patch'><div class='circle'></div></div><div class='circle-clipper right'><div class='circle'></div></div></div></div>");
				$.ajax({
				      type: "POST",
				      url: "registerCSAdmin",
				      async: true,
				      data : data,
				     
				      success :function(results) {
				    	  
				    	  console.log(results);
				    	  
				    	  if(results == "userExisted")
					    	{
					    		$('.userExisted').text("This username is already taken");
					    		$('.csbody > :last-child').remove();
					    		
					    	}
					    	else if(results == "emailExisted")
					    	{
					    		$('.userExisted').text("This email is already existing in the system. Same email id is not allowed for multiple users.");
					    		$('.csbody > :last-child').remove();
					    		
					    	}
					    	else if(results == "userUpdated")
					    	{
					    		$('.userExisted').text("Successfully updated admin details.");
					    		$('.userExisted').css("color","green");
					    		$('.csbody > :last-child').remove();
					    	}
				    	else
				    	{
				    		$('#csAdmin').hide();
					    	$('.csbody > :last-child').remove();
					    	$('.lean-overlay').css({display:'none'});
					    	$('#narshimha').click();
					    	$('#userType').text("CS Admin");
					    	$('#csFirstname').val('');
					    	$('#csLastname').val('');
					    	$('#csUsername').val('');
					    	$('#csEmail').val('');
				    	}
				    	
				     },
				     error : function(error) {
				    	 $('#csAdmin').hide();
				    	 $('.csbody > :last-child').remove();
					    	$('.lean-overlay').css({display:'none'});
					    	$('#csFirstname').val('');
					    	$('#csLastname').val('');
					    	$('#csUsername').val('');
					    	$('#csEmail').val('');
				     }
				  });
			}
			
			
		});
		
		$('#createLocationAdmin').click(function(){
			
			var result = 0;
			$('.userExisted').empty();
			var fname = $('#locationFirstname').val();
			var lname = $('#locationLastname').val();
			var uname = $('#locationUsername').val();
			var email = $('#locationEmail').val();
			var lEmail = $('#laEmail').val();
			
			$("#locationUsername").on("keydown", function (e) {
			    return e.which !== 32;
			});
			
			if(fname == "" || fname == null)
			{
				$('#lfnameErr').text('First Name is required');
				result++;
			}
			else
			{
				$('#lfnameErr').empty();
			}
			
			if(lname == "" || lname == null)
			{
				$('#llnameErr').text('Last Name is required');
				result++;
			}
			else
			{
				$('#llnameErr').empty();
			}
			
			if(uname == "" || uname == null)
			{
				$('#lunameErr').text('User Name is required');
				result++;
			}
			else
			{
				var unameVal = uname.replace(/^\s+|\s+$/g, "");
				var CharArray = unameVal.split(" ");
		        if (CharArray.length >= 2) {
		        	$('#lunameErr').text("User Name doesn't allow spaces");
		        	result++;
		        }
		        else {
		        	$('#lunameErr').empty();
		        }
			}
			
			var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			if(email == "" || email == null)
			{
				$('#lemailErr').text('E-mail is required');
				result++;
			}
			else if(!(email.match(mailformat)))
			 {
				 
			  $('#lemailErr').text('Invalid email format. Please enter in right format');
			   result++;
			 }
			else
			{
				$('#lemailErr').empty();
			}
			
			
			
			if(result == 0)
			{
				var data = {
						
						"firstname":fname,
						"lastname":lname,
						"username":uname,
						"email":email,
						"sEmail":lEmail,
						"user": $('#user').val(),
						"userName": $('#userName').val()
						
						
				};
				$(".lsbody").append("<div style='margin:-55% 46%' class='preloader-wrapper small active'><div class='spinner-layer spinner-green-only'><div class='circle-clipper left'><div class='circle></div></div><div class='gap-patch'><div class='circle'></div></div><div class='circle-clipper right'><div class='circle'></div></div></div></div>");
				$.ajax({
				      type: "POST",
				      url: "registerLocationAdmin",
				      async: true,
				      data : data,
				     
				      success :function(results) {
				    	  console.log(results);
				    	if(results == "userExisted")
				    	{
				    		$('.userExisted').text("This username is already taken");
				    		$('.lsbody > :last-child').remove();
				    		
				    	}
				    	else if(results == "emailExisted")
				    	{
				    		$('.userExisted').text("This email is already existing in the system. Same email id is not allowed for multiple users.");
				    		$('.lsbody > :last-child').remove();
				    		
				    	}
				    	else if(results == "userUpdated")
				    	{
				    		$('.userExisted').text("Successfully updated admin details.");
				    		$('.userExisted').css("color","green");
				    		$('.lsbody > :last-child').remove();
				    	}
				    	else
				    	{
				    		$('.locationAdmin').hide();	
					    	$('.lsbody > :last-child').remove();
					    	$('.lean-overlay').css({display:'none'});
					    	$('#narshimha').click();
					    	$('#userType').text("Location Admin");
					    	var a ="<option value='"+results+"'>"+$('#locationUsername').val()+" - "+$('#locationFirstname').val()+" "+$('#locationLastname').val()+"  </option>";
							  $('#adminId').html(a);
					    	$('#locationFirstname').val('');
					    	$('#locationLastname').val('');
					    	$('#locationUsername').val('');
					    	$('#locationEmail').val('');
				    	}
				    	
				     },
				     error : function(error) {
				    	 console.log(error);
				    	 $('.locationAdmin').hide();
				    	 $('.lsbody > :last-child').remove();
					    	$('.lean-overlay').css({display:'none'});
					    	$('#locationFirstname').val('');
					    	$('#locationLastname').val('');
					    	$('#locationUsername').val('');
					    	$('#locationEmail').val('');
				     }
				  });
			}
			
			
			
		});
			function Check() {
				$('#hotelTemplateErr').empty();	
		    	$('#l1').hide();
		        var chkPassport = document.getElementById("checkBox");
		        if (chkPassport.checked) {
		            
		        	$('#showGroups').show();
	            	//$("#showTemplates").prop("disabled", true);
	            	$("#showTemplates").hide();
		        	
		        } else {
		        	$('#l1').show();
		        	$('#showGroups').hide();
	            	//$("#showTemplates").prop("disabled", false);
	            	$("#showTemplates").show();
		        	
		        }
		    }
			
			$('#showTemplates').on('change', function() {
				  
				  var a ="<span onclick='preview_Hotel_click(this)' class='"+this.value+"' style='cursor:pointer;font-size:15px;color:#00bcd4;text-decoration:underline'>Preview</span>";
				  $('#l1').html(a);
				});
		
			
			
			
			
		</script>
		
		<script type="text/javascript">
			function VoucherSourcetoPrint(source) {
				return "<html><head><script>function step1(){\n" +
						"setTimeout('step2()', 10);}\n" +
						"function step2(){window.print();window.close()}\n" +
						"</scri" + "pt></head><body onload='step1()'>\n" +
						"<img  style='height:300px;width:300px' src='" + source + "' /></body></html>";
			}
			function VoucherPrint(source) {
				Pagelink = "about:blank";
				var pwa = window.open(Pagelink, "_blank");
				pwa.document.open();
				pwa.document.write(VoucherSourcetoPrint(source));
				//$('#lean-overlay').css({display:'none !important'});
				
				pwa.document.close();
				location.reload();
				//document.getElementById("lean-overlay").style.display = "none";
			}
		</script>
		<script>
				jQuery(window).bind(
			     	"beforeunload",
			    	$('.lean-overlay').css('dispaly','none')   
			 )
		</script>
		
		<script type="text/javascript">
		
		
				function editUser(user)
				{
					var userName = "${userName}";
					$('.userExisted').empty();
					var userVal = user.split(":");
					var email=userVal[1];
					var searchElement = {
			    			"searchId" : email,
			    			"userName" : userName
			    	};
					$('.userSpin').show();
					$.ajax({
					      type: "POST",
					      url: "searchUsers",
					      async: true,
					      data : searchElement,
					     
					      success :function(result) {
					    	  console.log(result);
					    	  for(i=0;i<result.length;i++)
					    	  {
					    		  if(result[i].user == "it admin")
					    		  {
					    			  $('#modal4').hide();
					    			  $('.lean-overlay').css({display:'none'});
					    			  $('#asAdminhref').click();
					    			  $('.userSpin').hide();
					    			  $('#supertext').text('Update IT Admin User');
					    			  //$('#updateSuperAdmin').show();
					    			 // $('#createSuperAdmin').hide();
					    			 $('#createSuperAdmin').text('Update IT Admin');
					    			  $('#saEmail').val(result[i].objectId);
					    			  $('#superFirstname').val(result[i].firstname);
					    			  $('#superLastname').val(result[i].lastname);
					    			  $('#superUsername').val(result[i].username);
					    			  $('#superUsername').attr('disabled',true);
					    			  
					    			  $('#superEmail').val(result[i].email);
					    		  }
					    		  else if(result[i].user == "super admin")
					    		  {		
					    			  $('#modal4').hide();
					    			  $('.lean-overlay').css({display:'none'});
					    			  $('#asAdminhref').click();
					    			  $('.userSpin').hide();
					    			  $('#supertext').text('Update Super Admin User');
					    			  //$('#updateSuperAdmin').show();
					    			 // $('#createSuperAdmin').hide();
					    			 $('#createSuperAdmin').text('Update Super Admin');
					    			  $('#saEmail').val(result[i].objectId);
					    			  $('#superFirstname').val(result[i].firstname);
					    			  $('#superLastname').val(result[i].lastname);
					    			  $('#superUsername').val(result[i].username);
					    			  $('#superUsername').attr('disabled',true);
					    			  $('#superEmail').val(result[i].email);
					    		  }
					    		  else if(result[i].user == "cs admin")
					    		  {
					    			  $('#modal4').hide();
					    			  $('.lean-overlay').css({display:'none'});
					    			  $('#csAdminhref').click();
					    			  $('.userSpin').hide();
					    			  $('#cstext').text('Update CS Admin User');
					    			 // $('#createCSAdmin').hide();
					    			  //$('#updateCSAdmin').show();
					    			  $('#createCSAdmin').text('Update CS Admin');
					    			  $('#caEmail').val(result[i].objectId);
					    			  $('#csFirstname').val(result[i].firstname);
					    			  $('#csLastname').val(result[i].lastname);
					    			  $('#csUsername').val(result[i].username);
					    			  $('#csUsername').attr('disabled',true);
					    			  $('#csEmail').val(result[i].email);
					    		  }
					    		  else
					    		  {
					    			  $('#modal4').hide();
					    			  $('.lean-overlay').css({display:'none'});
					    			  $('#locationAdmin').click();
					    			  $('.userSpin').hide();
					    			  $('#locationtext').text('Update Location Admin User');
					    			 // $('#createLocationAdmin').hide();
					    			 // $('#updateLocationAdmin').show();
					    			 $('#createLocationAdmin').text('Update Location Admin');
					    			  $('#laEmail').val(result[i].objectId);
					    			  $('#locationFirstname').val(result[i].firstname);
					    			  $('#locationLastname').val(result[i].lastname);
					    			  $('#locationUsername').val(result[i].username);
					    			  $('#locationUsername').attr('disabled',true);
					    			  $('#locationEmail').val(result[i].email);
					    		  }
					    	  }
					    	  	
						     },
						  error : function(error) {
						    	console.log(error);
						     }
					  });					
				}
				
				
				function deleteUser(userId)
				{
					
					var userVal = userId.split(":");
					var objId = userVal[1];
					$('#modal4').hide();
	    			$('.lean-overlay').css({display:'none'});
					$('#deleteAdmin').click();
					$('#deleteUserId').val(objId);
					
				}
				
				$('#deleteAdminDetails').click(function(){
					
					var userId = $('#deleteUserId').val();
					var searchElement = {
			    			"searchId" : userId			    			
			    	};
					$(".deletebody").append("<div style='margin:0 0 0 30%' class='preloader-wrapper small active'><div class='spinner-layer spinner-green-only'><div class='circle-clipper left'><div class='circle></div></div><div class='gap-patch'><div class='circle'></div></div><div class='circle-clipper right'><div class='circle'></div></div></div></div>");
					$.ajax({
					      type: "POST",
					      url: "deleteUser",
					      async: true,
					      data : searchElement,
					      
					      success :function(result) {
					    	  
					    	  $('#modal5').hide();
				    		  $('.lean-overlay').css({display:'none'});
					    	     	  
					     },
					     error : function(error) {
					    	console.log(error);
					     }
					  });
					
					
				});
		
				function loading()
				{
					$('.mbody').show();
				}
				
				$('.skipSelection').click(function(){
					
						$('.search').val(''); 
						var username = "${user}";
				    	var searchElement = {
				    			"searchId" : "",
				    			"username" : username
				    	};
				    	
				    	$('.mbody').show();
				    	
				    	
				    	$.ajax({
						      type: "POST",
						      url: "searchHotels",
						      async: true,
						      data : searchElement,
						     
						      success :function(result) {
						    	  $(".searchResults").empty();
						    	  
						    	  console.log(result.length);
						    	  if(result.length == 0)
						    	  {					    		  
						    		  $('.noResults').text('Search results not found');
						    		  $('.mbody').hide();
						    	  }
						    	  else
						    	  {
						    		  $('.noResults').empty();
						    		  $('.tbody').remove();
							    	  var tableDetails = "<tbody><tr>"+
										"<td style='padding: 6px 0px 0px 30px;''><b style='color:#337ab7;font-size:18px'>Hotel Name</b></td>"+
										"<td style='padding:10px 0'><b style='color:#337ab7;font-size:18px'>Hotel Id</b></td>"+
										"<td style='padding:10px 0'><b style='color:#337ab7;font-size:18px'>Group Site ID</b></td>"+
										"<td style='padding:10px 0'><b style='color:#337ab7;font-size:18px'>Zip/Postal Code</b></td>"+
										"<td style='padding:10px 0'><b style='color:#337ab7;font-size:18px'>Group Name</b></td>"+
										"</tr>";
							    	  for(var i=0;i<result.length;i++)
							    	  {
							    		  if(result[i].groupName == null)
							    		  {
							    			  result[i].groupName = "";
							    		  }
							    		  var table = "<tr>"+
												"<td style='padding: 6px 0px 0px 30px;'> <a onclick='loading()' style='color:#337ab7' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"'>"+
												""+result[i].name+""+
												"</a>"+
												"</td>"+
												"<td style='padding:10px 0'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
												""+result[i].hotelId+""+
												"</a>"+
												"</td>"+
												"<td style='padding:10px 0'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
												""+result[i].groupId+""+
												"</a>"+
												"</td>"+
												"<td style='padding:10px 0'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
												""+result[i].zipcode+""+
												"</a>"+
												"</td>"+
												"<td style='padding:10px 0'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
												""+result[i].groupName+""+
												"</a>"+
												"</td>"+
												
											"</tr><tbody>";
							    		  tableDetails = tableDetails+table;
							    		  
							    	  }
							    	  console.log(tableDetails);
							    	  $(".searchResults").append(tableDetails);
							    	  $('.mbody').hide();
						    	  }    	  
						     },
						     error : function(error) {
						    	console.log(error);
						     }
						  });
				   
				    
				});
		
		</script>
		
		
		<script>
			$('#search').keyup(function(e){
				
				if(e.keyCode == 13)
			    {	    	
					var username = "${user}";
			    	var searchElement = {
			    			"searchId" : $(this).val(),
			    			"username" : username
			    	};
			    	
			    	$('.mbody').show();
			    	
			    	
			    	$.ajax({
					      type: "POST",
					      url: "searchHotels",
					      async: true,
					      data : searchElement,
					     
					      success :function(result) {
					    	  $(".searchResults").empty();
					    	  
					    	  console.log(result.length);
					    	  if(result.length == 0)
					    	  {					    		  
					    		  $('#noResults').text('Search results not found');
					    		  $('.mbody').hide();
					    	  }
					    	  else
					    	  {
					    		  $('#noResults').empty();
					    		  $('#tbody').remove();
						    	  var tableDetails = "<tbody><tr>"+
									"<td style='padding: 6px 0px 0px 30px;''><b style='color:#337ab7;font-size:18px'>Hotel Name</b></td>"+
									"<td style='padding:10px 0'><b style='color:#337ab7;font-size:18px'>Hotel Id</b></td>"+
									"<td style='padding:10px 0'><b style='color:#337ab7;font-size:18px'>Group Site ID</b></td>"+
									"<td style='padding:10px 0'><b style='color:#337ab7;font-size:18px'>Zip/Postal Code</b></td>"+
									"<td style='padding:10px 0'><b style='color:#337ab7;font-size:18px'>Group Name</b></td>"+
									"</tr>";
						    	  for(var i=0;i<result.length;i++)
						    	  {
						    		  if(result[i].groupName == null)
						    		  {
						    			  result[i].groupName = "";
						    		  }
						    		  var table = "<tr>"+
											"<td style='padding: 6px 0px 0px 30px;'> <a onclick='loading()' style='color:#337ab7' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"'>"+
											""+result[i].name+""+
											"</a>"+
											"</td>"+
											"<td style='padding:10px 0'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
											""+result[i].hotelId+""+
											"</a>"+
											"</td>"+
											"<td style='padding:10px 0'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
											""+result[i].groupId+""+
											"</a>"+
											"</td>"+
											"<td style='padding:10px 0'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
											""+result[i].zipcode+""+
											"</a>"+
											"</td>"+
											"<td style='padding:10px 0'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
											""+result[i].groupName+""+
											"</a>"+
											"</td>"+
										"</tr><tbody>";
						    		  tableDetails = tableDetails+table;
						    		  
						    	  }
						    	  console.log(tableDetails);
						    	  $(".searchResults").append(tableDetails);
						    	  $('.mbody').hide();
					    	  }
					    	 
					    	  
					     },
					     error : function(error) {
					    	console.log(error);
					     }
					  });
			    }
			    
			});
			
		</script>
		
		
		<script>
			$('#templateSearch').keyup(function(e){
				
				if(e.keyCode == 13)
			    {	    	
			    	var searchElement = {
			    			"searchId" : $('#templateSearch').val(),
			    			"username" : "null"
			    	};
			    	
			    	$('.templateSpin').show();
			    	
			    	
			    	$.ajax({
					      type: "POST",
					      url: "searchTemplates",
					      async: true,
					      data : searchElement,
					     
					      success :function(result) {
					    	  $("#templateSearchResults").empty();
					    	  
					    	  console.log(result.length);
					    	  if(result.length == 0)
					    	  {					    		  
					    		  $('#noTemplateResults').text('Search results not found');
					    		  $('.templateSpin').hide();
					    	  }
					    	  else
					    	  {
					    		  $('#noTemplateResults').empty();
					    		  $('#templateSpin').remove();
						    	  var tableDetails = "<tbody><tr>"+
										"<td style='padding: 6px 0px 0px 30px;''><b style='color:#337ab7;font-size:18px'>Template Name</b></td>"+
										"<td style='padding:10px 0'><b style='color:#337ab7;font-size:18px'>Template Id</b></td>"+
									"</tr>";
						    	  for(var i=0;i<result.length;i++)
						    	  {
						    		  var table = "<tr>"+
						    		  "<td style='padding: 6px 0px 0px 30px;''> <a style='color:#337ab7' href='viewTemplates?user=${user}&userName=${userName}&tempId="+result[i].templateId+"'>"+
								   	      ""+result[i].templateName+"</a>"+
								   	  "</td>"+
								   	  "<td style='padding:10px 0'> <a  href='viewTemplates?user=${user}&userName=${userName}&tempId="+result[i].templateIId+"' style='color:#337ab7'>"+
								   	     ""+result[i].templateId+"</a>"+
								   	  "</td>"+
											
										"</tr><tbody>";
						    		  tableDetails = tableDetails+table;
						    		  
						    	  }
						    	  console.log(tableDetails);
						    	  $("#templateSearchResults").append(tableDetails);
						    	  $('.templateSpin').hide();
					    	  }
					    	 
					    	  
					     },
					     error : function(error) {
					    	console.log(error);
					     }
					  });
			    }
			    
			});	
			
			
			$('#groupSearch').keyup(function(e){
				
				if(e.keyCode == 13)
			    {	    	
			    	var searchElement = {
			    			"searchId" : $('#groupSearch').val(),
			    			"username" : "null"
			    	};
			    	
			    	$('.groupSpin').show();
			    	
			    	
			    	$.ajax({
					      type: "POST",
					      url: "searchGroups",
					      async: true,
					      data : searchElement,
					     
					      success :function(result) {
					    	  $("#groupSearchResults").empty();
					    	  
					    	  console.log(result.length);
					    	  if(result.length == 0)
					    	  {					    		  
					    		  $('#noGroupResults').text('Search results not found');
					    		  $('.groupSpin').hide();
					    	  }
					    	  else
					    	  {
					    		  $('#noGroupResults').empty();
					    		  $('.groupSpin').hide();
						    	  var tableDetails = "<tbody><tr>"+
										"<td style='padding: 6px 0px 0px 30px;''><b style='color:#337ab7;font-size:18px'>Group Name</b></td>"+
										"<td style='padding:10px 0'><b style='color:#337ab7;font-size:18px'>Group Id</b></td>"+
									"</tr>";
						    	  for(var i=0;i<result.length;i++)
						    	  {
						    		  var table = "<tr>"+
						    		  "<td style='padding: 6px 0px 0px 30px;''> <a style='color:#337ab7' href='viewGroups?user=${user}&userName=${userName}&tempId="+result[i].templateId+"'>"+
								   	      ""+result[i].templateName+"</a>"+
								   	  "</td>"+
								   	  "<td style='padding:10px 0'> <a  href='viewGroups?user=${user}&userName=${userName}&tempId="+result[i].templateIId+"' style='color:#337ab7'>"+
								   	     ""+result[i].templateId+"</a>"+
								   	  "</td>"+
											
										"</tr><tbody>";
						    		  tableDetails = tableDetails+table;
						    		  
						    	  }
						    	  console.log(tableDetails);
						    	  $("#groupSearchResults").append(tableDetails);
						    	  $('.groupSpin').hide();
					    	  }
					    	 
					    	  
					     },
					     error : function(error) {
					    	console.log(error);
					     }
					  });
			    }
			    
			});
			
			
			
			
			
			
			 /* $('#quantity0000').keyup(function()
			    		{
			    	
			    	
			    	var v1 = $('#quantity0000').val();
			    	var v2 = $('#quantity0001').val();
			    	var v3 = $('#quantity0002').val();
			    	var v4 = $('#quantity0003').val();
			    	var v5 = $('#quantity0004').val();
			    	var v6 = $('#quantity0005').val();
			    	var v7 = $('#quantity0006').val();
			    	var v8 = $('#quantity0007').val();
			    	var v9 = $('#quantity0008').val();
			    	
			    	
			    	
			    	if(v1 == v2 || v1 === v3 || v1 == v4 || v1 == v5 || v1 == v6 || v1 == v7 || v1 == v8 || v1 == v9)
			    		{
			    		
			    		$('#quantity0000').val('');
			    		 $('#dvPa1').text('number exist');
			    		}
			    	else{
			    		
			    		$('#dvPa1').empty();
			    	}
			    		   
			    }) 
			    
			
		
			    $('#quantity0001').keyup(function()
			    		{
			    	
			    	
			    	var v1 = $('#quantity0000').val();
			    	var v2 = $('#quantity0001').val();
			    	var v3 = $('#quantity0002').val();
			    	var v4 = $('#quantity0003').val();
			    	var v5 = $('#quantity0004').val();
			    	var v6 = $('#quantity0005').val();
			    	var v7 = $('#quantity0006').val();
			    	var v8 = $('#quantity0007').val();
			    	var v9 = $('#quantity0008').val();
			    	
			    	
			    	
			    	if(v2 == v1 || v2 === v3 || v2 == v4 || v2 == v5 || v2 == v6 || v2 == v7 || v2 == v8 || v2 == v9)
			    		{
			    		
			    		$('#quantity0001').val('');
			    		 $('#dvPa2').text('number exist');
			    		}
			    	else{
			    		
			    		$('#dvPa2').empty();
			    	}
			    		   
			    }) 
			    
			    
			     $('#quantity0002').keyup(function()
			    		{
			    	
			    	
			    	var v1 = $('#quantity0000').val();
			    	var v2 = $('#quantity0001').val();
			    	var v3 = $('#quantity0002').val();
			    	var v4 = $('#quantity0003').val();
			    	var v5 = $('#quantity0004').val();
			    	var v6 = $('#quantity0005').val();
			    	var v7 = $('#quantity0006').val();
			    	var v8 = $('#quantity0007').val();
			    	var v9 = $('#quantity0008').val();
			    	
			    	
			    	
			    	if(v3 == v1 || v3 === v2 || v3 == v4 || v3 == v5 || v3 == v6 || v3 == v7 || v3 == v8 || v3 == v9)
			    		{
			    		
			    		$('#quantity0002').val('');
			    		 $('#dvPa3').text('number exist');
			    		}
			    	else{
			    		
			    		$('#dvPa3').empty();
			    	}
			    		   
			    }) 
			    
			    
			    $('#quantity0003').keyup(function()
			    		{
			    	
			    	
			    	var v1 = $('#quantity0000').val();
			    	var v2 = $('#quantity0001').val();
			    	var v3 = $('#quantity0002').val();
			    	var v4 = $('#quantity0003').val();
			    	var v5 = $('#quantity0004').val();
			    	var v6 = $('#quantity0005').val();
			    	var v7 = $('#quantity0006').val();
			    	var v8 = $('#quantity0007').val();
			    	var v9 = $('#quantity0008').val();
			    	
			    	
			    	
			    	if(v4 == v1 || v4 === v2 || v4 == v3 || v4 == v5 || v4 == v6 || v4 == v7 || v4 == v8 || v4 == v9)
			    		{
			    		
			    		$('#quantity0003').val('');
			    		 $('#dvPa4').text('number exist');
			    		}
			    	else{
			    		
			    		$('#dvPa4').empty();
			    	}
			    		   
			    }) 
			    
			    
			    $('#quantity0004').keyup(function()
			    		{
			    	
			    	
			    	var v1 = $('#quantity0000').val();
			    	var v2 = $('#quantity0001').val();
			    	var v3 = $('#quantity0002').val();
			    	var v4 = $('#quantity0003').val();
			    	var v5 = $('#quantity0004').val();
			    	var v6 = $('#quantity0005').val();
			    	var v7 = $('#quantity0006').val();
			    	var v8 = $('#quantity0007').val();
			    	var v9 = $('#quantity0008').val();
			    	
			    	
			    	
			    	if(v5 == v1 || v5 === v2 || v5 == v3 || v5 == v4 || v5 == v6 || v5 == v7 || v5 == v8 || v5 == v9)
			    		{
			    		
			    		$('#quantity0004').val('');
			    		 $('#dvPa5').text('number exist');
			    		}
			    	else{
			    		
			    		$('#dvPa5').empty();
			    	}
			    		   
			    }) 
			    
			    $('#quantity0005').keyup(function()
			    		{
			    	
			    	
			    	var v1 = $('#quantity0000').val();
			    	var v2 = $('#quantity0001').val();
			    	var v3 = $('#quantity0002').val();
			    	var v4 = $('#quantity0003').val();
			    	var v5 = $('#quantity0004').val();
			    	var v6 = $('#quantity0005').val();
			    	var v7 = $('#quantity0006').val();
			    	var v8 = $('#quantity0007').val();
			    	var v9 = $('#quantity0008').val();
			    	
			    	
			    	
			    	if(v6 == v1 || v6 === v2 || v6 == v3 || v6 == v4 || v6 == v5 || v6 == v7 || v6 == v8 || v6 == v9)
			    		{
			    		
			    		$('#quantity0005').val('');
			    		 $('#dvPa6').text('number exist');
			    		}
			    	else{
			    		
			    		$('#dvPa6').empty();
			    	}
			    		   
			    }) 
			    
			    
			     $('#quantity0006').keyup(function()
			    		{
			    	
			    	
			    	var v1 = $('#quantity0000').val();
			    	var v2 = $('#quantity0001').val();
			    	var v3 = $('#quantity0002').val();
			    	var v4 = $('#quantity0003').val();
			    	var v5 = $('#quantity0004').val();
			    	var v6 = $('#quantity0005').val();
			    	var v7 = $('#quantity0006').val();
			    	var v8 = $('#quantity0007').val();
			    	var v9 = $('#quantity0008').val();
			    	
			    	
			    	
			    	if(v7 == v1 || v7 === v2 || v7 == v3 || v7 == v4 || v7 == v5 || v7 == v6 || v7 == v8 || v7 == v9)
			    		{
			    		
			    		$('#quantity0006').val('');
			    		 $('#dvPa7').text('number exist');
			    		}
			    	else{
			    		
			    		$('#dvPa7').empty();
			    	}
			    		   
			    }) 
			    
			     $('#quantity0007').keyup(function()
			    		{
			    	
			    	
			    	var v1 = $('#quantity0000').val();
			    	var v2 = $('#quantity0001').val();
			    	var v3 = $('#quantity0002').val();
			    	var v4 = $('#quantity0003').val();
			    	var v5 = $('#quantity0004').val();
			    	var v6 = $('#quantity0005').val();
			    	var v7 = $('#quantity0006').val();
			    	var v8 = $('#quantity0007').val();
			    	var v9 = $('#quantity0008').val();
			    	
			    	
			    	
			    	if(v8 == v1 || v8 === v2 || v8 == v3 || v8 == v4 || v8 == v5 || v8 == v6 || v8 == v7 || v8 == v9)
			    		{
			    		
			    		$('#quantity0007').val('');
			    		 $('#dvPa8').text('number exist');
			    		}
			    	else{
			    		
			    		$('#dvPa8').empty();
			    	}
			    		   
			    }) 
			    
			    
			     $('#quantity0008').keyup(function()
			    		{
			    	
			    	
			    	var v1 = $('#quantity0000').val();
			    	var v2 = $('#quantity0001').val();
			    	var v3 = $('#quantity0002').val();
			    	var v4 = $('#quantity0003').val();
			    	var v5 = $('#quantity0004').val();
			    	var v6 = $('#quantity0005').val();
			    	var v7 = $('#quantity0006').val();
			    	var v8 = $('#quantity0007').val();
			    	var v9 = $('#quantity0008').val();
			    	
			    	
			    	
			    	if(v9 == v1 || v9 === v2 || v9 == v3 || v9 == v4 || v9 == v5 || v9 == v6 || v9 == v7 || v9 == v8)
			    		{
			    		
			    		$('#quantity0008').val('');
			    		 $('#dvPa9').text('number exist');
			    		}
			    	else{
			    		
			    		$('#dvPa9').empty();
			    	}
			    		   
			    }) 
			    
			    
			    
			    
			    
			    
			    
			    $('#quantity1').keyup(function()
			    		{
			    	
			    	
			    	var v1 = $('#quantity1').val();
			    	var v2 = $('#quantity2').val();
			    	var v3 = $('#quantity3').val();
			    	var v4 = $('#quantity4').val();
			    	var v5 = $('#quantity5').val();
			    	var v6 = $('#quantity6').val();
			    	var v7 = $('#quantity7').val();
			    	var v8 = $('#quantity8').val();
			    	var v9 = $('#quantity9').val();
			    	
			    	
			    	
			    	if(v1 == v2 || v1 === v3 || v1 == v4 || v1 == v5 || v1 == v6 || v1 == v7 || v1 == v8 || v1 == v9)
			    		{
			    		
			    		$('#quantity1').val('');
			    		 $('#dvPa11').text('number exist');
			    		}
			    	else{
			    		
			    		$('#dvPa11').empty();
			    	}
			    		   
			    }) 
			    
			
		
			    $('#quantity2').keyup(function()
			    		{
			    	
			    	
			    	var v1 = $('#quantity1').val();
			    	var v2 = $('#quantity2').val();
			    	var v3 = $('#quantity3').val();
			    	var v4 = $('#quantity4').val();
			    	var v5 = $('#quantity5').val();
			    	var v6 = $('#quantity6').val();
			    	var v7 = $('#quantity7').val();
			    	var v8 = $('#quantity8').val();
			    	var v9 = $('#quantity9').val();
			    	
			    	
			    	
			    	if(v2 == v1 || v2 === v3 || v2 == v4 || v2 == v5 || v2 == v6 || v2 == v7 || v2 == v8 || v2 == v9)
			    		{
			    		
			    		$('#quaquantity2').val('');
			    		 $('#dvPa12').text('number exist');
			    		}
			    	else{
			    		
			    		$('#dvPa12').empty();
			    	}
			    		   
			    }) 
			    
			    
			     $('#quantity3').keyup(function()
			    		{
			    	
			    	
			    	var v1 = $('#quantity0000').val();
			    	var v2 = $('#quantity2').val();
			    	var v3 = $('#quantity3').val();
			    	var v4 = $('#quantity4').val();
			    	var v5 = $('#quantity5').val();
			    	var v6 = $('#quantity6').val();
			    	var v7 = $('#quantity7').val();
			    	var v8 = $('#quantity8').val();
			    	var v9 = $('#quantity9').val();
			    	
			    	
			    	
			    	if(v3 == v1 || v3 === v2 || v3 == v4 || v3 == v5 || v3 == v6 || v3 == v7 || v3 == v8 || v3 == v9)
			    		{
			    		
			    		$('#quantity3').val('');
			    		 $('#dvPa13').text('number exist');
			    		}
			    	else{
			    		
			    		$('#dvPa13').empty();
			    	}
			    		   
			    }) 
			    
			    
			    $('#quantity4').keyup(function()
			    		{
			    	
			    	
			    	var v1 = $('#quantity1').val();
			    	var v2 = $('#quantity2').val();
			    	var v3 = $('#quantity3').val();
			    	var v4 = $('#quantity4').val();
			    	var v5 = $('#quantity5').val();
			    	var v6 = $('#quantity6').val();
			    	var v7 = $('#quantity7').val();
			    	var v8 = $('#quantity8').val();
			    	var v9 = $('#quantity9').val();
			    	
			    	
			    	
			    	if(v4 == v1 || v4 === v2 || v4 == v3 || v4 == v5 || v4 == v6 || v4 == v7 || v4 == v8 || v4 == v9)
			    		{
			    		
			    		$('#quantit4').val('');
			    		 $('#dvPa14').text('number exist');
			    		}
			    	else{
			    		
			    		$('#dvPa14').empty();
			    	}
			    		   
			    }) 
			    
			    
			    $('#quantity5').keyup(function()
			    		{
			    	
			    	
			    	var v1 = $('#quantity1').val();
			    	var v2 = $('#quantity2').val();
			    	var v3 = $('#quantity3').val();
			    	var v4 = $('#quantity4').val();
			    	var v5 = $('#quantity5').val();
			    	var v6 = $('#quantity6').val();
			    	var v7 = $('#quantity7').val();
			    	var v8 = $('#quantity8').val();
			    	var v9 = $('#quantity9').val();
			    	
			    	
			    	
			    	if(v5 == v1 || v5 === v2 || v5 == v3 || v5 == v4 || v5 == v6 || v5 == v7 || v5 == v8 || v5 == v9)
			    		{
			    		
			    		$('#quantity5').val('');
			    		 $('#dvPa15').text('number exist');
			    		}
			    	else{
			    		
			    		$('#dvPa15').empty();
			    	}
			    		   
			    }) 
			    
			    $('#quantity6').keyup(function()
			    		{
			    	
			    	
			    	var v1 = $('#quantity1').val();
			    	var v2 = $('#quantity2').val();
			    	var v3 = $('#quantity3').val();
			    	var v4 = $('#quantity4').val();
			    	var v5 = $('#quantity5').val();
			    	var v6 = $('#quantity6').val();
			    	var v7 = $('#quantity7').val();
			    	var v8 = $('#quantity8').val();
			    	var v9 = $('#quantity9').val();
			    	
			    	
			    	
			    	if(v6 == v1 || v6 === v2 || v6 == v3 || v6 == v4 || v6 == v5 || v6 == v7 || v6 == v8 || v6 == v9)
			    		{
			    		
			    		$('#quantity6').val('');
			    		 $('#dvPa16').text('number exist');
			    		}
			    	else{
			    		
			    		$('#dvPa16').empty();
			    	}
			    		   
			    }) 
			    
			    
			     $('#quantity7').keyup(function()
			    		{
			    	
			    	
			    	var v1 = $('#quantity1').val();
			    	var v2 = $('#quantity2').val();
			    	var v3 = $('#quantity3').val();
			    	var v4 = $('#quantity4').val();
			    	var v5 = $('#quantity5').val();
			    	var v6 = $('#quantity6').val();
			    	var v7 = $('#quantity7').val();
			    	var v8 = $('#quantity8').val();
			    	var v9 = $('#quantity9').val();
			    	
			    	
			    	
			    	if(v7 == v1 || v7 === v2 || v7 == v3 || v7 == v4 || v7 == v5 || v7 == v6 || v7 == v8 || v7 == v9)
			    		{
			    		
			    		$('#quantity7').val('');
			    		 $('#dvPa17').text('number exist');
			    		}
			    	else{
			    		
			    		$('#dvPa17').empty();
			    	}
			    		   
			    }) 
			    
			     $('#quantity8').keyup(function()
			    		{
			    	
			    	
			    	var v1 = $('#quantity1').val();
			    	var v2 = $('#quantity2').val();
			    	var v3 = $('#quantity3').val();
			    	var v4 = $('#quantity4').val();
			    	var v5 = $('#quantity5').val();
			    	var v6 = $('#quantity6').val();
			    	var v7 = $('#quantity7').val();
			    	var v8 = $('#quantity8').val();
			    	var v9 = $('#quantity9').val();
			    	
			    	
			    	
			    	if(v8 == v1 || v8 === v2 || v8 == v3 || v8 == v4 || v8 == v5 || v8 == v6 || v8 == v7 || v8 == v9)
			    		{
			    		
			    		$('#quantity8').val('');
			    		 $('#dvPa18').text('number exist');
			    		}
			    	else{
			    		
			    		$('#dvPa18').empty();
			    	}
			    		   
			    }) 
			    
			    
			     $('#quantity9').keyup(function()
			    		{
			    	
			    	
			    	var v1 = $('#quantity1').val();
			    	var v2 = $('#quantity2').val();
			    	var v3 = $('#quantity3').val();
			    	var v4 = $('#quantity4').val();
			    	var v5 = $('#quantity5').val();
			    	var v6 = $('#quantity6').val();
			    	var v7 = $('#quantity7').val();
			    	var v8 = $('#quantity8').val();
			    	var v9 = $('#quantity9').val();
			    	
			    	
			    	
			    	if(v9 == v1 || v9 === v2 || v9 == v3 || v9 == v4 || v9 == v5 || v9 == v6 || v9 == v7 || v9 == v8)
			    		{
			    		
			    		$('#quantity9').val('');
			    		 $('#dvPa19').text('number exist');
			    		}
			    	else{
			    		
			    		$('#dvPa19').empty();
			    	}
			    		   
			    })  */
			 
			var sortUsersList;
			
			$('#userSearch').keyup(function(e){
				
				var userName = "${userName}";
				
				if(e.keyCode == 13)
			    {	    	
			    	var searchElement = {
			    			"searchId" : $(this).val(),
			    			"userName" : userName
			    	};
			    	
			    	$('.userSpin').show();
			    	
			    	
			    	$.ajax({
					      type: "POST",
					      url: "searchUsers",
					      async: true,
					      data : searchElement,
					     
					      success :function(result) {
					    	  $("#userSearchResults").empty();
					    	  sortUsersList = result;
					    	  console.log(result.length);
					    	  if(result.length == 0)
					    	  {					    		  
					    		  $('#noUserResults').text('Search results not found');
					    		  $('.userSpin').hide();
					    	  }
					    	  else
					    	  {
					    		  $('#noUserResults').empty();
					    		  $('#userbody').remove();
					    		  $('.userSpin').hide();
					    		  var tableDetails = "<th style='padding:10px 0;text-align:center;' onclick='sortOrder(this.id)' id='username'><b style='cursor:pointer;color:#337ab7;font-size:18px'>User Name</b></td>"+
									"<th style='padding:10px 0;text-align:center;' onclick='sortOrder(this.id)' id='firstname'><b style='cursor:pointer;color:#337ab7;font-size:18px'>First Name</b></td>"+
									"<th style='padding:10px 0;text-align:center;' onclick='sortOrder(this.id)' id='lastname'><b style='cursor:pointer;color:#337ab7;font-size:18px'>Last Name</b></td>"+
									"<th style='padding:10px 0;text-align:center;' onclick='sortOrder(this.id)' id='email'><b style='cursor:pointer;color:#337ab7;font-size:18px'>Email</b></td>"+
									"<th style='padding:10px 0;text-align:center;' onclick='sortOrder(this.id)' id='phone'><b style='cursor:pointer;color:#337ab7;font-size:18px'>Phone Number</b></td>"+
									"<th style='padding:10px 0;text-align:center;' onclick='sortOrder(this.id)' id='user'><b style='cursor:pointer;color:#337ab7;font-size:18px'>Role</b></td>"+
									"<th style='padding:10px 0;text-align:center;' ><b style='cursor:pointer;color:#337ab7;font-size:18px'>Actions</b></td>"+
									"</tr>";
						    	  for(var i=0;i<result.length;i++)
						    	  {
						    		  var table = "<tr>"+
											"<td style='padding: 6px 0px 0px 0px;text-align:left;''> <a style='color:#337ab7' href='#'>"+											
											""+result[i].username+"</a>"+
											"</td>"+
											"<td style='padding:10px 0;text-align:left;'> <a  href='#' style='color:#337ab7'>"+										
											""+result[i].firstname+"</a>"+
											"</td>"+
											"<td style='padding:10px 0;text-align:left;'> <a  href='#' style='color:#337ab7'>"+											
											""+result[i].lastname+"</a>"+
											"</td>"+
											"<td style='padding: 6px 0px 0px 0px;text-align:left;''> <a style='color:#337ab7' href='#'>"+											
											""+result[i].email+"</a>"+
											"</td>"+
											"<td style='padding:10px 0;text-align:left;'> <a  href='#' style='color:#337ab7'>"+											
											""+result[i].user+"</a>"+
											"</td>"+
											"<td style='padding:10px 0;text-align:left'> <a  href='#' style='color:#337ab7'>"+
											"<span id='edit:"+result[i].email+"' onclick='editUser(this.id)'>Edit </span > &nbsp <span id='delete:"+result[i].objectId+"' onclick='deleteUser(this.id)'> Delete </span>"+
											"</a>"+
											"</td>"+								
										"</tr> <tbody>";
						    		  tableDetails = tableDetails+table;
						    		  
						    	  }
						    	  console.log(tableDetails);
						    	  $("#userSearchResults").append(tableDetails);
						    	  $('.userSpin').hide();
					    	  }
					    	 
					    	  
					     },
					     error : function(error) {
					    	console.log(error);
					     }
					  });
			    }
			    
			});
			
			$('.searchUsers').click(function(e){
				
				var userName = "${userName}";
				
				var searchElement = {
			    			"searchId" : "",
			    			"userName" : userName
			    	};
			    	
			    	$('.userSpin').show();
			    	
			    	
			    	$.ajax({
					      type: "POST",
					      url: "searchUsers",
					      async: true,
					      data : searchElement,
					     
					      success :function(result) {
					    	  $("#userSearchResults").empty();
					    	  sortUsersList = result;
					    	  console.log(result.length);
					    	  if(result.length == 0)
					    	  {					    		  
					    		  $('#noUserResults').text('Search results not found');
					    		  $('.userSpin').hide();
					    	  }
					    	  else
					    	  {
					    		  $('#noUserResults').empty();
					    		  $('#userbody').remove();
					    		  $('.userSpin').hide();
					    		  var tableDetails = "<th style='padding:10px 0;text-align:center;' onclick='sortOrder(this.id)' id='username'><b style='cursor:pointer;color:#337ab7;font-size:18px'>User Name</b></td>"+
									"<th style='padding:10px 0;text-align:center;' onclick='sortOrder(this.id)' id='firstname'><b style='cursor:pointer;color:#337ab7;font-size:18px'>First Name</b></td>"+
									"<th style='padding:10px 0;text-align:center;' onclick='sortOrder(this.id)' id='lastname'><b style='cursor:pointer;color:#337ab7;font-size:18px'>Last Name</b></td>"+
									"<th style='padding:10px 0;text-align:center;' onclick='sortOrder(this.id)' id='email'><b style='cursor:pointer;color:#337ab7;font-size:18px'>Email</b></td>"+
									"<th style='padding:10px 0;text-align:center;' onclick='sortOrder(this.id)' id='phone'><b style='cursor:pointer;color:#337ab7;font-size:18px'>Phone Number</b></td>"+
									"<th style='padding:10px 0;text-align:center;' onclick='sortOrder(this.id)' id='user'><b style='cursor:pointer;color:#337ab7;font-size:18px'>Role</b></td>"+
									"<th style='padding:10px 0;text-align:center;' ><b style='cursor:pointer;color:#337ab7;font-size:18px'>Actions</b></td>"+
									"</tr>";
						    	  for(var i=0;i<result.length;i++)
						    	  {
						    		  var table = "<tr>"+
											"<td style='padding: 6px 0px 0px 0px;text-align:left;''> <a style='color:#337ab7' href='#'>"+											
											""+result[i].username+"</a>"+
											"</td>"+
											"<td style='padding:10px 0;text-align:left;'> <a  href='#' style='color:#337ab7'>"+										
											""+result[i].firstname+"</a>"+
											"</td>"+
											"<td style='padding:10px 0;text-align:left;'> <a  href='#' style='color:#337ab7'>"+											
											""+result[i].lastname+"</a>"+
											"</td>"+
											"<td style='padding: 6px 0px 0px 0px;text-align:left;''> <a style='color:#337ab7' href='#'>"+											
											""+result[i].email+"</a>"+
											"</td>"+
											"<td style='padding:10px 0;text-align:left;'> <a  href='#' style='color:#337ab7'>"+											
											""+result[i].user+"</a>"+
											"<td style='padding:10px 0;text-align:left'> <a  href='#' style='color:#337ab7'>"+
											"<span id='edit:"+result[i].email+"' onclick='editUser(this.id)'>Edit </span > &nbsp <span id='delete:"+result[i].objectId+"' onclick='deleteUser(this.id)'> Delete </span>"+
											"</a>"+
											"</td>"+
											
										"</tr> <tbody>";
						    		  tableDetails = tableDetails+table;
						    		  
						    	  }
						    	  console.log(tableDetails);
						    	  $("#userSearchResults").append(tableDetails);
						    	  $('.userSpin').hide();
					    	  }
					    	 
					    	  
					     },
					     error : function(error) {
					    	console.log(error);
					     }
					  });
			    
			    
			});
			
			
			function sortOrder(prop){
				
				sortUsersList.sort( predicatBy(prop) );
				$("#userSearchResults").empty();
				var result = sortUsersList;
				var tableDetails = "<th style='padding:10px 0;text-align:center;' onclick='sortOrder(this.id)' id='username'><b style='cursor:pointer;color:#337ab7;font-size:18px'>User Name</b></td>"+
				"<th style='padding:10px 0;text-align:center;' onclick='sortOrder(this.id)' id='firstname'><b style='cursor:pointer;color:#337ab7;font-size:18px'>First Name</b></td>"+
				"<th style='padding:10px 0;text-align:center;' onclick='sortOrder(this.id)' id='lastname'><b style='cursor:pointer;color:#337ab7;font-size:18px'>Last Name</b></td>"+
				"<th style='padding:10px 0;text-align:center;' onclick='sortOrder(this.id)' id='email'><b style='cursor:pointer;color:#337ab7;font-size:18px'>Email</b></td>"+
				"<th style='padding:10px 0;text-align:center;' onclick='sortOrder(this.id)' id='phone'><b style='cursor:pointer;color:#337ab7;font-size:18px'>Phone Number</b></td>"+
				"<th style='padding:10px 0;text-align:center;' onclick='sortOrder(this.id)' id='user'><b style='cursor:pointer;color:#337ab7;font-size:18px'>Role</b></td>"+
				"<th style='padding:10px 0;text-align:center;' ><b style='cursor:pointer;color:#337ab7;font-size:18px'>Actions</b></td>"+
				"</tr>";
	    	  for(var i=0;i<result.length;i++)
	    	  {
	    		  if(result[i].phone == null)
	    		  {
	    			  result[i].phone = "";
	    		  }
	    		  var table = "<tr>"+
						"<td style='padding:10px 0;text-align:center;'> <a style='color:#337ab7' href='#'>"+											
						""+result[i].username+"</a>"+
						"</td>"+
						"<td style='padding:10px 0;text-align:center;'> <a  href='#' style='color:#337ab7'>"+										
						""+result[i].firstname+"</a>"+
						"</td>"+
						"<td style='padding:10px 0;text-align:center;'> <a  href='#' style='color:#337ab7'>"+											
						""+result[i].lastname+"</a>"+
						"</td>"+
						"<td style='padding:10px 0;text-align:center;''> <a style='color:#337ab7' href='#'>"+											
						""+result[i].email+"</a>"+
						"</td>"+
						"<td style='padding:10px 0;text-align:center;''> <a style='color:#337ab7' href='#'>"+											
						""+result[i].phone+"</a>"+
						"</td>"+
						"<td style='padding:10px 0;text-align:center;'> <a  href='#' style='color:#337ab7'>"+											
						""+result[i].user+"</a>"+
						"<td style='padding:10px 0;text-align:center'> <a  href='#' style='color:#337ab7'>"+
						"<span id='edit:"+result[i].email+"' onclick='editUser(this.id)'>Edit </span > &nbsp <span id='delete:"+result[i].objectId+"' onclick='deleteUser(this.id)'> Delete </span>"+
						"</a>"+
						"</td>"+
						
					"</tr>";
	    		  tableDetails = tableDetails+table;
	    		  
	    	  }
	    	  //console.log(tableDetails);
	    	  $("#userSearchResults").append("<tbody style='font-size:14px' id='headings'>"+tableDetails+"</tbody>");
				
			}
			
			function predicatBy(prop){
				   return function(a,b){
				      if( a[prop] > b[prop]){
				          return 1;
				      }else if( a[prop] < b[prop] ){
				          return -1;
				      }
				      return 0;
				   }
			}
			
			
			
			$('.manageUsers').click(function(e){
				
				$('#userSearch').val('');
				
				var searchElement = {
			    			"searchId" : ""			    			
			    	};
			    	
			    	$('.userSpin').show();
			    	
			    	
			    	$.ajax({
					      type: "POST",
					      url: "searchUsers",
					      async: true,
					      data : searchElement,
					     
					      success :function(result) {
					    	  $("#userSearchResults").empty();
					    	  
					    	  console.log(result.length);
					    	  if(result.length == 0)
					    	  {					    		  
					    		  $('#noUserResults').text('Search results not found');
					    		  $('.userSpin').hide();
					    	  }
					    	  else
					    	  {
					    		  $('#noUserResults').empty();
					    		  $('#userbody').remove();
					    		  $('.userSpin').hide();
						    	  var tableDetails = "<tbody><td style='padding: 6px 0px 0px 30px;''><b style='color:#337ab7;font-size:18px'>User Name</b></td>"+
									"<td style='padding:10px 0'><b style='color:#337ab7;font-size:18px'>First Name</b></td>"+
									"<td style='padding:10px 0'><b style='color:#337ab7;font-size:18px'>Last Name</b></td>"+
									"<td style='padding: 6px 0px 0px 30px;'><b style='color:#337ab7;font-size:18px'>Email</b></td>"+
									"<td style='padding:10px 0'><b style='color:#337ab7;font-size:18px'>Role</b></td>"+
									"<td style='padding:10px 0'><b style='color:#337ab7;font-size:18px'>Actions</b></td>"+
									"</tr>";
						    	  for(var i=0;i<result.length;i++)
						    	  {
						    		  var table = "<tr>"+
											"<td style='padding: 6px 0px 0px 30px;''> <a style='color:#337ab7' href='dfgdfg'>"+											
											""+result[i].username+"</a>"+
											"</td>"+
											"<td style='padding:10px 0'> <a  href='dfgdfg' style='color:#337ab7'>"+										
											""+result[i].firstname+"</a>"+
											"</td>"+
											"<td style='padding:10px 0'> <a  href='dfgdfg' style='color:#337ab7'>"+											
											""+result[i].lastname+"</a>"+
											"</td>"+
											"<td style='padding: 6px 0px 0px 30px;''> <a style='color:#337ab7' href='dfgdfg'>"+											
											""+result[i].email+"</a>"+
											"</td>"+
											"<td style='padding:10px 0'> <a  href='dfgdfg' style='color:#337ab7'>"+											
											""+result[i].user+"</a>"+
											"</td>"+
											"<td style='padding:10px 0'> <a  href='dfgdfg' style='color:#337ab7'>"+
											"Edit &nbsp Delete	</a>"+
											"</td>"+								
										"</tr> <tbody>";
						    		  tableDetails = tableDetails+table;
						    		  
						    	  }
						    	  console.log(tableDetails);
						    	  $("#userSearchResults").append(tableDetails);
						    	  $('.userSpin').hide();
					    	  }
					    	 
					    	  
					     },
					     error : function(error) {
					    	console.log(error);
					     }
					  });
			    
			    
			});
			
			
			
			
			$('.skipTemplate').click(function(e){
				
				$('#templateSearch').val('');
				var searchElement = {
			    			"searchId" : "",
			    			"username" : "null"
			    	};
			    	
			    	$('.templateSpin').show();
			    	
			    	
			    	$.ajax({
					      type: "POST",
					      url: "searchTemplates",
					      async: true,
					      data : searchElement,
					     
					      success :function(result) {
					    	  $("#templateSearchResults").empty();
					    	  
					    	  console.log(result.length);
					    	  if(result.length == 0)
					    	  {					    		  
					    		  $('#noTemplateResults').text('Search results not found');
					    		  $('.templateSpin').hide();
					    	  }
					    	  else
					    	  {
					    		  $('#noTemplateResults').empty();
					    		  $('#templateSpin').remove();
						    	  var tableDetails = "<tbody><tr>"+
										"<td style='padding: 6px 0px 0px 30px;''><b style='color:#337ab7;font-size:18px'>Template Name</b></td>"+
										"<td style='padding:10px 0'><b style='color:#337ab7;font-size:18px'>Template Id</b></td>"+
									"</tr>";
						    	  for(var i=0;i<result.length;i++)
						    	  {
						    		  var table = "<tr>"+
						    		  "<td style='padding: 6px 0px 0px 30px;''> <a style='color:#337ab7' href='viewTemplates?user=${user}&userName=${userName}&tempId="+result[i].templateId+"'>"+
								   	      ""+result[i].templateName+"</a>"+
								   	  "</td>"+
								   	  "<td style='padding:10px 0'> <a  href='viewTemplates?user=${user}&userName=${userName}&tempId="+result[i].templateIId+"' style='color:#337ab7'>"+
								   	     ""+result[i].templateId+"</a>"+
								   	  "</td>"+
											
										"</tr><tbody>";
						    		  tableDetails = tableDetails+table;
						    		  
						    	  }
						    	  console.log(tableDetails);
						    	  $("#templateSearchResults").append(tableDetails);
						    	  $('.templateSpin').hide();
					    	  }
					    	 
					    	  
					     },
					     error : function(error) {
					    	console.log(error);
					     }
					  });
			  
			    
			});
			
			
			$('.skipGroup').click(function(e){
				$('#groupSearch').val('');
				var searchElement = {
			    			"searchId" : "",
			    			"username" : "null"
			    	};
			    	
			    	$('.groupSpin').show();
			    	
			    	
			    	$.ajax({
					      type: "POST",
					      url: "searchGroups",
					      async: true,
					      data : searchElement,
					     
					      success :function(result) {
					    	  $("#groupSearchResults").empty();
					    	  
					    	  console.log(result.length);
					    	  if(result.length == 0)
					    	  {					    		  
					    		  $('#noGroupResults').text('Search results not found');
					    		  $('.groupSpin').hide();
					    	  }
					    	  else
					    	  {
					    		  $('#noGroupResults').empty();
					    		  $('.groupSpin').hide();
						    	  var tableDetails = "<tbody><tr>"+
										"<td style='padding: 6px 0px 0px 30px;''><b style='color:#337ab7;font-size:18px'>Group Name</b></td>"+
										"<td style='padding:10px 0'><b style='color:#337ab7;font-size:18px'>Group Id</b></td>"+
									"</tr>";
						    	  for(var i=0;i<result.length;i++)
						    	  {
						    		  var table = "<tr>"+
						    		  "<td style='padding: 6px 0px 0px 30px;''> <a style='color:#337ab7' href='viewGroups?user=${user}&userName=${userName}&tempId="+result[i].templateId+"'>"+
								   	      ""+result[i].templateName+"</a>"+
								   	  "</td>"+
								   	  "<td style='padding:10px 0'> <a  href='viewGroups?user=${user}&userName=${userName}&tempId="+result[i].templateIId+"' style='color:#337ab7'>"+
								   	     ""+result[i].templateId+"</a>"+
								   	  "</td>"+
											
										"</tr><tbody>";
						    		  tableDetails = tableDetails+table;
						    		  
						    	  }
						    	  console.log(tableDetails);
						    	  $("#groupSearchResults").append(tableDetails);
						    	  $('.groupSpin').hide();
					    	  }
					    	 
					    	  
					     },
					     error : function(error) {
					    	console.log(error);
					     }
					  });
			    
			    
			});
			
		$('.clearData').click(function(){
			
			$('#dirTitle').val('');
			
			$('#dirCaption').val('');
			
			$('#dirTimings').val('');
			
			$('#dirDescption').val('');
			$('#imgUrl').val('');
			$('#mce_0_ifr').contents().find("body").empty();
			
			
		});
			
			
		</script>
		
		<script type="text/javascript">
			$('#groupId').bind('keypress', function (event) {
			    var regex = new RegExp("^[a-zA-Z0-9\b]+$");
			    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
			    if (!regex.test(key)) {
			       event.preventDefault();
			       return false;
			    }
			});
		</script>
		
		
		
		

 <script>
   function isNumber(evt) {
       evt = (evt) ? evt : window.event;
       var charCode = (evt.which) ? evt.which : evt.keyCode;
       if(charCode==46){
        return true;
       }
       else if (charCode > 31 && (charCode < 48 || charCode > 57)) {
           return false;
       }else{
       return true;
       }
   }
  </script>
		
		<script>
		function adminApp1(id){
			
			$('#modal29').show();
			
			var butn = '<a id="'+id+'" class="btn"	onclick="admin_app(this.id)" style="width: 100px; color: white;padding: 10PX;">SAVE</a>';
			
			$('#hotemMItems').html(butn);
			
			for(var i=0;i<9;i++)
			{
				$('#actionErr'+i).empty();
				$('#dvmenu000'+i).hide();
				$('#dvicon000'+i).hide();
				document.getElementById("quantity000"+i).value = "1";	
				$('#actionType'+i).find('option:contains("Select Action Type")').attr("selected",true);
				document.getElementById("itemAction000"+i).value = "";
				document.getElementById("test000"+i).checked = false;
				document.getElementById("icon000"+i).checked = false;
				
				document.getElementById("quantity"+i).value = "1";
				
			}
			
			
		
			$.ajax({
			      type: "POST",
			      url: "findHotelMenuList",
			      async: true,
			      data : {id:id},
			     
			      success :function(results) {
			    	  console.log(results);
			    	  if(results=="")
			    	  {
			    		  $('#hotelMenuId').val('');
			    	  }
			    	  else
			    	  {
			    		  $('#hotelMenuId').val(id); 
			    		  var length = results.length-1;
			    		  for(var i = 0; i < results.length;i++)
			    		  {			    				  			    				  
			    				  for(var x = 0;x < 9;x++)
			    				  {
			    					  var descVal = $('#menuDesc000'+x).text();
			    					  
			    					  if(descVal == results[length - i].menuDesc)
			    					  {
			    						  if(results[length - i].menuQuan == 0)
					    				  {
					    					  $('#test000' + x).prop('checked', false);
					    					  
					    				  }
					    				  else
					    				  {
					    					  $('#test000' + x).prop('checked', true);
					    					  $('#dvmenu000'+x).show();
					    				  } 			    			 	  
					    				  $('#quantity000' + x).val(results[length - i].menuQuan);
					    				  
										  
			    					  }
			    					 
			    					  
			    					  
			    				  }
			    				  for(var x = 0;x < 9;x++)
			    				  {
			    					  var iconVal = $('#iconDesc000'+x).text();
			    					  if( iconVal ==  results[length - i].iconDesc )
			    					  {
			    						  $('#quantity' + x).val(results[length - i].itemQuan);
					    				  if(results[length - i].itemQuan == 0)
					    				  {
					    					  $('#icon000' + x).prop('checked', false);
					    					  
					    				  }
					    				  else
					    				  {
					    					  $('#icon000'+x).prop('checked', true);
					    					  $('#dvicon000'+x).show();
					    				  }	
					    				  if(results[length - i].actionType == null)
					    				  {
					    					  $('#actionType'+x).find('option:contains("Select Action Type")').attr("selected",true); 
					    				  }
					    				  else
					    				  {
					    					  $('#actionType' + x).val(results[length - i].actionType);
					    				  }
										  
					    				  $('#itemAction000' + x).val(results[length - i].itemAction);
			    					  }
			    				  }
			    				  
			    				  
			    		  }
			    	  }
			    	 
			     },
			     error : function(error) {
			    	 console.log("error"+error);
			    	
			     }
			  });	
			
			
			
			
		}
		</script>
		<script >
		
		
		
		function admin_app(id){
			var hotelId = $('#hotelMenuId').val();
			 var json = [];
			 var result = 0;
			 for(var i=0;i<9;i++)
			 {
				 var temp = {};
				 var testMenuCheck  = document.getElementById('test000'+i).checked;
				 if(testMenuCheck)
				 {					 
					 var menuDesc = $('#menuDesc000'+i).text();
					 var menuQuan = $('#quantity000'+i).val();					
				 }
				 
				 else
				 {
					 var menuDesc = "";
					 var menuQuan = "";
				 }
				 
				 var data = $('#menuDesc000'+i).text()+","+$('#quantity000'+i).val();
				 
				 var iconDesc = $('#iconDesc000'+i).text();
				 var action = $('#itemAction000'+i).val();
				 var actionType = $('#actionType'+i).val();
				 
				 if( actionType == "Phone Number" )
				 {
					   if(isNaN(action))
					    {
						    $('#actionErr'+i).text('Enter only numeric values');
						    $('#itemAction000'+i).css('margin-bottom','0px');
					    	result++;
					    }
					   else
						{
						   $('#actionErr'+i).empty();
						}
				 }
				 else if( actionType == "URL" )
				 {
					 var regUrl = /^(((ht|f){1}(tp:[/][/]){1})|((www.){1}))[-a-zA-Z0-9@:%_\+.~#?&/=]+$/;

					 if(regUrl.test(action) == false)
					 {				 
						 $('#actionErr'+i).text('Incorrect URL');
						 
						 $('#itemAction000'+i).css('margin-bottom','0px');
					    	result++;
					 }
					 else
					 {
						 $('#actionErr'+i).empty();
					 }
				 }
				 
				 var testIconCheck = document.getElementById('icon000'+i).checked;
				 
				 if(testIconCheck)
				 {
					 
					 var innerData = $('#quantity'+i).val();
					 
				 }
				 else
				 {
					 
					 var innerData = "";
					 
				 }
				 temp["HotelId"] = id;
				 temp["MenuDesc"] = menuDesc;
				 temp["MenuQuan"] = menuQuan;
				 temp["ItemAction"] = $('#itemAction000'+i).val();
				 temp["ActionType"] = $('#actionType'+i).val();
				 temp["IconDesc"] = iconDesc;
				 temp["ItemQuan"] = innerData;
				 temp["image"] = i;
				 json.push(temp);
				 
			 }	
			 
			 console.log(JSON.stringify(json));
			 
			 $(".menuBody").show();
			 
			 $.ajax({
			      type: "POST",
			      url: "hotelMenuItems",			      
			      async: false,			      
			      contentType : 'application/json',
			      dataType : 'json',
			      data : JSON.stringify(json),
			      beforeSend: function(xhr) {  
                      xhr.setRequestHeader("Accept", "application/json");  
                      xhr.setRequestHeader("Content-Type", "application/json");  
                  },
			      success :function(result) {
			    	  console.log(result);
			    	  $('#modal29').hide();
			    	  $('.lean-overlay').css({display:'none'});
			    	  $('.menuBody').hide();
			    	  $('body').css({overflow:'auto'});
			    	  
			    	     	  
			     },
			     error : function(error) {
			    	console.log(error);
			    	$('#modal29').hide();
			    	$('.lean-overlay').css({display:'none'});
			    	$('.menuBody').hide();
			    	$('body').css({overflow:'auto'});
			     }
			  });  
			 
			 
			 
		}
		
		
		function clicking00(){
			var clicking00 = document.getElementById("icon0000").checked;
			if(clicking00)
			{
				$("#dvicon0000").show();
				
			}
			else
			{
				$("#dvicon0000").hide();
				
				
			}
			
		}
		
		function clicking(){
			
			var click0 = document.getElementById("icon0001").checked;
			if(click0)
			{
				$("#dvicon0001").show();
				
			}
			else
			{
				$("#dvicon0001").hide();
				
			}
			
			
		}		
		
		function clicking1(){
			var click1 = document.getElementById("icon0002").checked;
			if(click1)
			{
				$("#dvicon0002").show();
				
			}
			else
			{
				$("#dvicon0002").hide();
			}
			
		}		
		
		function clicking2(){
			var click2 = document.getElementById("icon0003").checked;
			if(click2)
			{
				$("#dvicon0003").show();
				
			}
			else
			{
				$("#dvicon0003").hide();
			}
			
		}		
		
		function clicking3(){
			var click3 = document.getElementById("icon0004").checked;
			if(click3)
			{
				$("#dvicon0004").show();
				
			}
			else
			{
				$("#dvicon0004").hide();
			}
			
		}
				
		function clicking4(){
			
			var click4 = document.getElementById("icon0005").checked;
			if(click4)
			{
				$("#dvicon0005").show();
				
			}
			else
			{
				$("#dvicon0005").hide();
			}
			
			
		}		
		
		function clicking5(){
			
			var click5 = document.getElementById("icon0006").checked;
			if(click5)
			{
				$("#dvicon0006").show();
				
			}
			else
			{
				$("#dvicon0006").hide();
			}
			
			
		}
		
		function clicking6(){
			var click6 = document.getElementById("icon0007").checked;
			if(click6)
			{
				$("#dvicon0007").show();
				
			}
			else
			{
				$("#dvicon0007").hide();
			}
			
		}
		
		function clicking7(){
			var click7 = document.getElementById("icon0008").checked;
			if(click7)
			{
				$("#dvicon0008").show();
				
			}
			else
			{
				$("#dvicon0008").hide();
			}
			
		}
		
		function clicking8(){
			var click8 = document.getElementById("icon0009").checked;
			if(click8)
			{
				$("#dvicon0009").show();
				
			}
			else
			{
				$("#dvicon0009").hide();
			}
			
		}
		
		
		
		</script>
		<script >
		function closeDiv(){
// 			document.getElementById("quantity0000").value = "";
// 			document.getElementById("quantity0001").value = "";
// 			document.getElementById("quantity0002").value = "";
// 			document.getElementById("quantity0003").value = "";
// 			document.getElementById("quantity0004").value = "";
// 			document.getElementById("quantity0005").value = "";
// 			document.getElementById("quantity0006").value = "";
// 			document.getElementById("quantity0007").value = "";
// 			document.getElementById("quantity0008").value = "";
			

			 
			
			
// 			document.getElementById("quantity20").value = "";
// 			document.getElementById("quantity2").value = "";
// 			 document.getElementById("quantity3").value = "";
// 			 document.getElementById("quantity4").value = "";
// 			 document.getElementById("quantity5").value = "";
// 			 document.getElementById("quantity6").value = "";
// 			 document.getElementById("quantity7").value = "";
// 			 document.getElementById("quantity8").value = "";
// 			 document.getElementById("quantity").value = "";
// 			 document.getElementById("test1350").checked = false;
// 			 document.getElementById("test135").checked = false;
// 			 document.getElementById("test107").checked = false;
// 			 document.getElementById("test109").checked = false;
// 			 document.getElementById("test111").checked = false;
// 			 document.getElementById("test113").checked = false;
// 			 document.getElementById("test115").checked = false;
// 			 document.getElementById("test117").checked = false;
// 			 document.getElementById("test119").checked = false;
// 			 document.getElementById("test0000").checked = false;
// 			 document.getElementById("test0001").checked = false;
// 			 document.getElementById("test0002").checked = false;
// 			 document.getElementById("test0003").checked = false;
// 			 document.getElementById("test0004").checked = false;
// 			 document.getElementById("test0005").checked = false;
// 			 document.getElementById("test0006").checked = false;
// 			 document.getElementById("test0007").checked = false;
// 			 document.getElementById("test0008").checked = false;
			 /* $('#quantity0000').hide();
			 $('#quantity0001').hide();
			 $('#quantity0002').hide();
			 $('#quantity0003').hide();
			 $('#quantity0004').hide();
			 $('#quantity0005').hide();
			 $('#quantity0006').hide();
			 $('#quantity0007').hide();
			 $('#quantity0008').hide();
			 
			 
			 $('#quantity20').hide();
			 
			 $('#quantity2').hide();
	 			 $('#quantity3').hide();
				 $('#quantity4').hide();
				 $('#quantity5').hide();
	 			 $('#quantity6').hide();
				 $('#quantity7').hide();
	 			 $('#quantity8').hide();
	 			 $('#quantity').hide();  */
			 
			 
			 $('#modal29').hide();	
			
		}
		
		</script>
		
		<script >
		function clickings0(){
			
			$("#dvPassport5001").show();
		}
		
		
		
		
		</script>
		
		<script >
		function reset1(){
			
			
			$('#dirTitle0').val('');
	    	$('#dirTitleColor0').val('3623DB');
	    	$('#dirTitleFont0').append('<option selected style="font-size:initial" value="initial">initial</option>');
	    	$('#dirTitleFamily0').append('<option selected style="font-family:Courier New" value="Courier New">Courier New</option>');
	    	$('#dirCaption0').val('');
	    	$('#dirCaptionColor0').val('3623DB');
	    	$('#dirCaptionFont0').append('<option selected style="font-size:initial" value="initial">initial</option>');
	    	$('#dirCaptionFamily0').append('<option selected style="font-family:Courier New" value="Courier New">Courier New</option>');
	    	$('#dirTimings0').val('');
	    	$('#dirTimingsColor0').val('3623DB');
	    	$('#dirTimingsFont0').append('<option selected style="font-size:initial" value="initial">initial</option>');
	    	$('#dirTimingsFamily0').append('<option selected style="font-family:Courier New" value="Courier New">Courier New</option>');
	    	$('#dirPriceColor').val('3623DB');
	    	$('#dirPriceFont').append('<option selected style="font-size:initial" value="initial">initial</option>');
	    	$('#dirPriceFamily').append('<option selected style="font-family:Courier New" value="Courier New">Courier New</option>');		    	
	    	$('#mce_34_ifr').contents().find("body").html("");
	    	$('.TextBoxesGroup').empty();
			$('.manageTextBoxesGroup').empty();
		
		}
		
		$('#changePasswordDetails').click(function(){
			
			$('#changePasswordhref').click();
			
		});
		
		$('#savePassword').click(function(){
			
			var result = 0;
			var username = "${user}";
			var password = $('#cPassword').val();
			var repassword = $('#reenterPassword').val();
			
			
			if(password == "" || password == null)
			{
				$('#cpasErr').text('Password is required');
				result++;
			}
			else
			{
				$('#cpasErr').empty();
			}
			
			if(repassword == "" || repassword == null)
			{
				$('#rpassErr').text('Re-Enter Password is required');
				result++;
			}
			
			else if(password != repassword )
			{
				$('#rpassErr').text('Password s is not Match');
				$('#cpasErr').empty();
				result++;
			}
			else
			{
				$('#rpassErr').empty();
				$('#cpasErr').empty();
			}
			
			
			
			
			if( result == 0 )
			{
				var data = {
						"username" : username,
						"password" : password,
						"repassword" : repassword
					};
					
					$.ajax({
					      type: "POST",
					      url: "updateUserPassword",
					      async: true,
					      data : data,
					     
					      success :function(results) {
					    	  
					    	  if(results == "success")
					    	  {
					    		  $('#changeResultsErr').text('');
					    		  $('#cuPassword').click();
					    		  $('#changePassword').hide();
					    		  $('#cPassword').val('');
					    		  $('#reenterPassword').val('');
					    		  
					    		  
					    	  }
					    	  else
					    	  {
					    		  	$('#changeResultsErr').text("Sorry some error occured, Please try again");			    		  
					    	  }
					    	  	    	  		    	
					     },
					     error : function(error) {
					    	 console.log(error);
					    	
					     }
					  });
			}
			
			
		});
		
		
		$('#confirmChangePassword').click(function(){
			
			location.href = "/egsdAdminApp";
			
		});
		
		$('#deleteDirectoryImage').click(function(){
			
			$('#imgUrl').val('');
			$('#uploadImageStatus').val('1');
			$('#uploadDirectoryImage').val('');
			$('#displayDirectoryItemImage').hide();
			
		});
		
		$( "#uploadDirectoryImage" ).change(function() {
			  
			$('#deleteDirectoryImage').show();
			
			
		});
		
		
		/* jQuery('#updatePhone').keyup(function () { 
		    this.value = this.value.replace(/[^0-9()|+-\.]/g,'');
		});  */
		
	
  //called when key is pressed in textbox
  $('.abc').keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });

</script>
		
</body>
</html>