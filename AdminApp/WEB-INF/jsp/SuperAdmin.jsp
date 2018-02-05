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
  $(document).ready(function(){
		$('.modal-trigger1').leanModal({
			dismissible: false
		});
	}); 
  
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
  selector: ".textAreaContent",
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
		.qrcodeCSS {
			padding:0 7px 0 0 !important;
		}
	}
	@media (max-width: 1280px) and (min-width: 600px) {   
			
		.qrcodeCSS {
			padding:0 0px 0 0 !important;
		}
	}
	
	.tbl-align > tbody > tr > td{
    padding: 5px 10PX 5PX 10PX !important;
    line-height: 1.42857143;
    vertical-align: middle !important;
    border-top: 1px solid #f0f0f0;
}
a[disabled="disabled"] {
  pointer-events: none;
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
			<li><a href="./home?userName=${userName}&user=${user}" style="font-size: 1rem; padding: 0.5rem 0.5rem;">Home</a></li>
			<li><a  id="updateAdminDetails"style="font-size: 1rem; padding: 0.5rem 0.5rem;">Manage My User Profile</a></li>  
			<li><a  id="changePasswordDetails"style="font-size: 1rem; padding: 0.5rem 0.5rem;">Change My Password</a></li>
			<li style="min-height:31px"><a href="#modal4" class="modal-trigger searchUsers"
				style="font-size: 1.5rem; padding:9px 0 9px 17px;">Manage Users</a></li>
			<!-- <li><a id="aiAdmin" style="font-size: 1rem; padding: 0.5rem 0.5rem;">Create IT Admin User</a></li> --> 
			<li><a id="asAdmin" style="font-size: 1rem; padding: 0.5rem 0.5rem;">Create Super Admin User</a></li>   		
			<li><a  id="acAdmin" style="font-size: 1rem; padding: 0.5rem 0.5rem;">Create CS Admin User</a></li> 
   			<li style="min-height:31px"><a id="alAdmin"	style="font-size: 1.5rem; padding:9px 0 9px 17px;">Create Hotel Admin User</a></li>
   			
   			<li style="min-height:31px"> <a id="agroup"	style="font-size: 1rem; padding:9px 0 9px 17px;">Create Hotel Group/Brand</a></li>
    		<li style="min-height:31px"><a href="#modal3" class="modal-trigger skipGroup"
				style="font-size: 1.5rem; padding:9px 0 9px 17px;">Manage Hotel Groups/Brands</a></li>
				
			<!-- <li style="min-height:31px">	<a class="waves-effect waves-light btn modal-trigger1" href="#modalMA">Manage Apps</a></li> -->
			  <!-- <li style="min-height:31px"><a id="manageapp" href="#modalMA" class="modal-trigger1 skipGroup"
				style="font-size: 1.5rem; padding:9px 0 9px 17px;">Manage Apps</a></li>   -->
			
			<%-- <jsp:include page="ManageApp.jsp"/> 
		      <%@ include file="ManageApp.jsp" %> --%>
				
			<li><a id="ctemplate" style="font-size: 1.5rem; padding:9px 0 9px 17px;">Create Directory Template</a></li>
			<li style="min-height:31px"><a href="#modal2" class="modal-trigger skipTemplate"
				style="font-size: 1.5rem; padding:9px 0 9px 17px;">Manage Directory Templates</a></li>
			<li style="min-height:31px"><a id="ahotel"	style="font-size: 1rem; padding:9px 0 9px 17px;">Create Hotel Directory</a></li>
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
					data-activates="dropdown1" style="width: 260px;font-size:14px;color:white;">${user} (${userName })<i
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
		
				<div class="modal-content " style="padding:30px !important">

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
       <input  type="text" name="editPhone" class="customFont" id="updatePhone"  required style="padding: 0 10px 0 10px">
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
	
	<div id="modal1" class="modal" style="width:90%;margin-top:2% ; overflow: auto;">
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
	 
	 	<!-- Manage Apps popup code starts -->

	 <div id="modalMA" class="modal" style="overflow:auto" data-toggle="modal">
	  <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat right">Close</a>
	     <div class="modal-content" style=box-shadow:none !important>
	       <a id="addapp"   class="modal-trigger1 waves-light btn right" href="#modaladd" style="margin:15px 7px">Add App</a>
	       <center><h5 id="locationtext">Manage Apps</h5></center>
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
		  <span id="noGroupResultss" style="margin-left:40%"></span>
		
		  <!-- <div style="width:50px; height:100px; overflow-y:auto;"> -->
	    <table class="table bordered striped tbl-align" id="groupSearchResults1">
			<thead>
			<tr>
			<th><b style='color:#337ab7;font-size:18px'>App Id</b></th>
	     	<th><b style='color:#337ab7;font-size:18px'>App Name</b></th>
	     	</tr>
	     	</thead>
			
	    	<tbody class="dynamicAppDataAppend">
	    	<!-- <thead><th  style='padding: 10px 0 0 30px'><b style='color:#337ab7;font-size:18px'>System Id</th> <th  style='padding: 10px 0 0 30px'><b style='color:#337ab7;font-size:18px'>System Name</th></thead> -->
		    </tbody>	
	    </table>
	    </div>
      </div>
     	     <!-- <a id="addapp" href="#modaladd" class="modal-trigger skipGroup right"
				style="font-size: 2.5rem; padding:150px 36px 20px 17px;">Add</a> -->
	 </div> 
	 
	<!-- Add App popup code starts  -->
	
	  <div id="modaladd" class="modal" style="height:317px;width:30%;margin-top:0%" data-toggle="modal">
  <form:form action="addApp" method="post" name="addApp">
   
   <a href="#!" id="appadded" class="modal-action modal-close right waves-effect waves-green btn-flat">Close</a>
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
		<p id="msg" style="color:green;font-size:15px"/>
		
         <center><h5 id="locationtext">Add App </h5></center>
         <div class="">
           <div class="input-field col s12">
           
           <%-- <input type="hidden" name="user" value="${user }">
           <input type="hidden" name="userName" value="${userName }">
           <input type="hidden" value="${locId}" name="locId">
            --%>
           <input type="text" name="appId" class="customFont" id="appId"  style="margin-bottom:3px" required>
             <label for="id" class="customFont" style="padding:0 10px 0 10px">App Id</label>
         <span id="appExistErr" style="color:red;font-size:13px"></span>
             <span id="appIdErr" style="color:red;font-size:13px"></span> 
          </div>
   		   <div class="input-field col s12 ">
		  <input  type="text"  name="appName" class="customFont" id="appName" style="margin-bottom:3px" required>
             <label for="name" class="customFont" style="padding:0 10px 0 10px">App Name</label>
             <span id="appExistErr" style="color:red;font-size:13px"></span>
             <span id="appNameErr" style="color:red;font-size:13px"></span> 
		     <!-- <select required  class="browser-default" name="templateId" id="addTemplateId">
		      <option value="" disabled selected>Choose Template</option>
		       
		     </select>
		     <span id="groupIdErr" style="color:red;font-size:13px"></span> -->
		    </div> 
		   </div>
		   
		   <!-- <button class="btn waves-effect waves-light" type="submit"
					name="action">Add</button> -->
		  <center style="margin-top:5%"><a id="addNewApp" href="javascript: addAppSubmitform()" class=" waves-light btn">Add</a></center> 
       </div>
      
        </form:form>
        
			</div>
   <!-- Add App popup code ends  -->
  <!-- Edit App popup code starts -->
   <div id="appEditIds"  class="modal" style="height:340px;width:30%;margin-top:5%" data-toggle="modal">
  <form:form action="editApp" method="post" name="editApp">
   <a href="#!" id="appEdited" class=" modal-action modal-close right waves-effect waves-green btn-flat">Close</a>
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
		<p id="updatemsg" style="color:green;font-size:15px"/>
         <center><h5 id="locationtext">Edit App </h5></center>
         <div class="">
         <input type="hidden" id="editObjectId">
           <div class="input-field col s12">
           
           <%-- <input type="hidden" name="user" value="${user }">
           <input type="hidden" name="userName" value="${userName }">
           <input type="hidden" value="${locId}" name="locId">
            --%>
           <input type="text"   name="appId" class="customFont" id="editAppId" value=""   style="margin-bottom:3px ;padding:0 16px !important;margin-top: 18px; color:#b3b3b3;" disabled>
             <label for="id" class="customFont" style="padding:0 10px 0 10px color:#b3b3b3;">App Id</label>
         <span id="appEditIdErr" style="color:red;font-size:13px"></span>
          </div>
   		   <div class="input-field col s12 ">
		  <input type="text"  placeholder=" " value="" name="appName" class="customFont"  id="editAppName" style="margin-bottom:3px ;padding:0 16px !important;margin-top: 18px;">
             <label for="name" class="customFont" style="padding:0 10px 0 10px">App Name</label>
              <span id="appEditNameErr" style="color:red;font-size:13px"></span> 
		     <!-- <select required  class="browser-default" name="templateId" id="addTemplateId">
		      <option value="" disabled selected>Choose Template</option>
		       
		     </select>
		     <span id="groupIdErr" style="color:red;font-size:13px"></span> -->
		    </div> 
		   </div>
		   
		   <!-- <button class="btn waves-effect waves-light" type="submit"
					name="action">Add</button> -->
		  <center style="margin-top:5%"><a id="editNewApp"  class=" waves-light btn">Update</a></center> 
       </div>
      
        </form:form>
        
			</div>
  <!-- Edit APP popup code ends -->
  <!-- Delete App pop up starts-->
  
  <div id="deleteAppmodal"  class="modal" style="margin-top: 132px; display: none; height: 200px;" data-toggle="modal">
  	 <form:form action="deleteApp" method="post" name="deleteApp">
  	  <a href="#!" id="appDeleted" class=" modal-action modal-close right waves-effect waves-green btn-flat">Close</a>
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
		    <p id="deletedAppMsg" style="color:green;font-size:15px"/>
		    <h3 style="margin-left: 125px;">Are you sure delete this app ?</h3>
		    <input type="hidden" id="appObjectID" name="objectId">
		    <div class="center-block">
	 			<a id="confirmDeleteAdpp"  class=" waves-light btn" style="margin-left: 200px;margin-top: 10px;">Delete</a>
		 	<!-- 	<a id="cancelDeleteApp"  class=" waves-light btn">Cancel</a> -->
			</div>
	 </div>
	 </form:form>
	</div>
	<!--  delete popup ends -->
	 <!-- Manage Apps popup code ends -->
	 
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
     
     <div class="row margin">
      <div class="input-field col s12">
       <!--             <i class="mdi-social-person-outline prefix"></i> -->
       <input  type="text" class="customFont" name="username" required id="superPhone" style="padding: 0 10px 0 10px">
       <span id="sphoneErr" style="color:red;font-size:12px"></span>
       <label  class="center-align active customFont">Phone Number</label>
      </div>
     </div>
     
     <input type="hidden" id="user" name="user" value="${user}">
     <input type="hidden" name="userName" id="userName" value="${userName }">
     <input type="hidden" name="adminType" id="adminType" >
     
           
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
     <div class="row margin">
      <div class="input-field col s12">
       <input  type="text" class="customFont" name="email" id="csPhone" required style="padding: 0 10px 0 10px">
       <span id="cPhoneErr" style="color:red;font-size:12px"></span>
       <label  class="center-align active customFont">Phone Number</label>
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
     
     <div class="row margin">
      <div class="input-field col s12">
       <!--             <i class="mdi-social-person-outline prefix"></i> -->
       <input  type="text" name="email" class="customFont" id="locationPhone" required style="padding: 0 10px 0 10px">
       <span id="lPhoneErr" style="color:red;font-size:12px"></span>
       <label  class="customFont center-align active">Phone Number</label>
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
       	
       <center style="margin-top:5%"><a href="javascript: submitform()" id="addNewTemplate"  class=" waves-light btn">Create Template</a></center>
       
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
       <center style="margin-top:5%"><a id="addNewGroup" href="javascript: groupSubmitform()" class=" waves-light btn">Create Hotel Group</a></center>
       
      </div>
  </form:form>  
  
</div>
 <!-- end of the group hotel popup -->
 <!-- start add hotel popup -->
	
	<div id="addHotel" class="modal" style="overflow:auto">
	
	  <form:form action="addLocation" commandName="addLocation" name="addLocation"
							enctype="multipart/form-data">
	   <a href="#!" class=" modal-action modal-close right waves-effect waves-green btn-flat">Cancel</a>
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
	         		<center ><h5 style="font-size:24px"> Create Hotel Directory</h5></center>
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
								<div class="input-field">
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
								      <option value="" disabled selected>Choose Hotel Admin</option>				
								    </select>
								  <span id="hotelLocationAdminErr" style="font-size:13px;color:red"></span>
									
								</div>
								

							</div>
							
		<div class="row">
       
        <div class="input-field">
         <input type="checkbox" id="checkBox" onclick = "Check()" style="display:none;" />
              <label for="checkBox" style="font-size:14px;padding-left:35px !important;">Group Hotel</label>
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
       <!-- <div class="row">
       <div class="input-field col s6">
							<select class="browser-default" required id="egsdAppOptions" name="appName">
								
							</select> <span id="egsdapperr" style="font-size: 13px; color: red"></span>
						</div>
						<div class="input-field col s1"></div>
						 <div class="input-field col s5">
									<input type="checkbox" id="globalstatus" name="globalstatus" style="display:none"/>
      								<label for="globalstatus" style="font-size:14px;padding-left:35px !important;">Global Participant</label>
								</div>
								</div> -->
       
       
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
							
							<div class="">
								<div class="input-field ">
									<input type="text" name="latitude" id="addLatitude" onkeypress="return isNumber(event)"
										style="font-size: 16px;padding-left:10px;margin-bottom:3px " > <label
										for="first_name2" style="font-size: 14px; font-weight: normal">Latitude
										</label>
									
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
									<a href="javascript: hotelSubmitform()" id="addNewHotel" class="btn ">Submit</a>
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
							<li class="jstree-open"><b>Hotel Directory</b><c:forEach	var="locObj" items="${locObj}">
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
									
									
									
									<table class="table table-hover" style="background-color:#EEEEEE;width:65%">
									     
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
    onclick="preview_Directory_click(this.id,${locObjForAddDirectoryItems.globalStatus},'${locObjForAddDirectoryItems.appId}')" class=" waves-light btn right"
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
           href="#add" style="margin: 0px 7px">Add Directory Item</a>
          
            <a id="${locObjForAddDirectoryItems.objectId }"
    onclick="accountManagement_click(this.id)" class=" waves-light btn modal-trigger right"
    href="#accountmanagement1" style="margin:15px 7px">Account Management</a> 
          
         
           <a  onclick="editHotelAdminUser()"
     class=" waves-light btn right"
     style="margin: 15px 7px">Edit Hotel Admin User</a>
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




											<c:choose>
											
												<c:when
												 test='${((locObjForAddDirectoryItems.appId =="None" or locObjForAddDirectoryItems.appId==null) and locObjForAddDirectoryItems.globalStatus==true)}'> 
													<%-- test='${((locObjForAddDirectoryItems.appId !="WHG" or locObjForAddDirectoryItems.appId==null) and locObjForAddDirectoryItems.globalStatus==true)}'> --%>
													<div onclick="web_preview_Hotel_click(this)"
														class="${locObjForAddDirectoryItems.objectId}"
														style="cursor: pointer; font-size: 11px; margin-top: 10px">
														http://egsd.mobldir.com:8080/egsdMobileApp/<br />directories.html?id=${locObjForAddDirectoryItems.objectId}
													</div>
												</c:when>
												<c:when test='${locObjForAddDirectoryItems.appId=="WHG"}'>
													<div  id="whgPrivewHotel"
														class="${locObjForAddDirectoryItems.objectId}"
														style="cursor: pointer; font-size: 11px; margin-top: 10px">
														http://egsd.mobldir.com:8080/egsdWHGApp/<br />directories.html?id=${locObjForAddDirectoryItems.objectId}
													</div>
												</c:when>
												
												<c:otherwise>
												
												</c:otherwise>
												
											</c:choose>



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
							</div>

						</c:forEach>
					</div>
	
				
				

			</div>

			</div>
		</div>
		
		<!--  Popup code  -->
		
		
		
		<!--start account management -->
				<div class="editLocation" style="display: none; opacity: 1; top: 10%; max-height: 50%">
			<div id="accountmanagement1" class="modal" style="width:91%;margin-top:36px;overflow: auto;">
						
				<div class="modal-content directorySpin">
					<center>
					
						<h2 style="margin-left: 76px;margin-top:-40px;">Account Management</h2>
						
						<span style="margin:2% 0 0 72%" class="customSubmitButton">				
							<a href="javascript: directorySubmitForm123()"  class="btn applyButton" method="post" style="width:100px;color:white;padding: 10PX;" >Submit</a>
							
							 <button type="reset" class="btn clearData" style="width:100px;color:white;">Clear</button>
							
							<a href="#"
							class="waves-effect waves-green modal-action modal-close waves-effect waves-light btn btn" style="background-color:#20B2AA;padding:12px; width:100px;color:white" >CANCEL</a>
						</span>
						
					</center>
												
				<p id="uploadHotelLogoText" style="margin-bottom:2px;color:red;text-align:center"></p>
				<p id="uploadLogoText" style="margin-bottom:2px;color:red;text-align:center"></p>
				<p id="uploadHotelFooterText" style="margin-bottom:2px;color:red;text-align:center"></p>

				<form:form class="col s12" id="formAction" action="accountManagement" name="editLocation123"
											method="post" commandName="editLocation123"
											enctype="multipart/form-data">
											
				<c:forEach var="locObjForEditLocation" items="${locObjForEditLocation}">
				
						
	
						<div class=${locObjForEditLocation.objectId } style="display: none; padding: 10px; text-align: justify">
				
								
								
											
								<input type="hidden" name="locId"
									value="${locObjForEditLocation.objectId }">
								<input type="hidden" name="directory"
									value="${locObjForEditLocation.directory }">
								<input type="hidden" name="user" value="${user}">
								<input type="hidden" name="userName" value="${userName}">
					<div class="row" >

    
    
    <div id="testAccount" class="col s10"style="margin-top: 40px;">
    	
    	<div class="row">
    	
    		<div class="input-field col s3">
				<input type="text" style="font-weight: normal; font-size: 14px;color: #b3b3b3;"  id=""  value="${locObjForEditLocation.objectId }" class="" name="" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;color: #b3b3b3;" class="active">Directory ID</label>
			</div>
												
 	        <div class="input-field col s3">
				<input type="text" style="font-weight: normal; font-size: 14px;color: #b3b3b3;"  id=""  value="${locObjForEditLocation.name}" class="" name="" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;color: #b3b3b3;" class="active">Directory Name</label>
			</div>
			
			<div class="input-field col s3">
				<input type="text" style="font-weight: normal; font-size: 14px;color: #b3b3b3;"  id=""  value="${locObjForEditLocation.templateId}" class="" name="" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;color: #b3b3b3;" class="active">Source Template ID</label>
			</div>
												
 	        <div class="input-field col s3">
				<input type="text" style="font-weight: normal; font-size: 14px;color: #b3b3b3;"  id=""  value="${locObjForEditLocation.templateName}" class="" name="" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;color: #b3b3b3;" class="active">Source Template Name</label>
			</div>
    	
    	</div>
    	
    	<div class="row">
    	
    		<div class="input-field col s3">
				<input type="text" style="font-weight: normal; font-size: 14px;color: #b3b3b3;"  id=""  value="${locObjForEditLocation.createdDate}" class="" name="" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;color: #b3b3b3;" class="active">Directory Creation Date</label>
			</div>
												
 	        <div class="input-field col s3">
				<input type="text" style="font-weight: normal; font-size: 14px;color: #b3b3b3;"  id=""  value="${locObjForEditLocation.updatedDate}" class="" name="" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;color: #b3b3b3;" class="active">Directory Last Modified Date</label>
			</div>
			
			<div class="input-field col s3">
				<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Billing Cycle</label>
				<select name="hotelBillingCycle" id="hotelBillingCycle" class="browser-default">
				<c:if test="${locObjForEditLocation.hotelBillingCycle ne null}">
					<option value="${locObjForEditLocation.hotelBillingCycle}">${locObjForEditLocation.hotelBillingCycle}</option>
				</c:if>
					<option value="Monthly">Monthly</option>
					<option value="Quarterly">Quarterly</option>
					<option value="Annual">Annual</option>
				</select>
			</div>
			
			<div class="input-field col s3">
				<input type="text" style="font-weight: normal; font-size: 14px" onkeypress="return isNumber(event)" id="hotelBillingRate"  value="${locObjForEditLocation.hotelBillingRate}" class="hotelBillingRate" name="hotelBillingRate"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Billing Rate</label>
			</div>
    	
    	</div>
    	
    	<div class="row">
    	
    		<div class="input-field col s3">
				<input type="text" style="font-weight: normal; font-size: 14px"  id="paymentsSystemId"  value="${locObjForEditLocation.paymentsSystemId}" class="paymentsSystemId" name="paymentsSystemId"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Payments System ID</label>
			</div>
												
 	        <div class="input-field col s3">
				<input type="text" style="font-weight: normal; font-size: 14px"  id="accountPaidDate"  value="${locObjForEditLocation.accountPaidDate}" class="accountPaidDate datepicker" name="accountPaidDate"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Account Paid Through Date</label>
			</div>		
    	
    	</div>
    	
    	
    	<div class="row">
        <div class="input-field col s12">
          <textarea  class="materialize-textarea" style="font-weight: normal; font-size: 14px" id="hotelPaymentConcat"   class="hotelPaymentConcat" name="hotelPaymentConcat">${locObjForEditLocation.paymentContact}</textarea>
          <%-- <textarea  class="materialize-textarea" style="font-weight: normal; font-size: 14px" id="hotelPaymentConcat"  value="${locObjForEditLocation.paymentContact}" class="hotelPaymentConcat" name="hotelPaymentConcat"></textarea> --%>
          <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Payment Contact</label>
          <!-- <label for="textarea1" style="font-size:14px">Payment Contact</label> -->
        </div>
      </div>
      
      <div class="row">
        <div class="input-field col s12">
          <textarea  class="materialize-textarea" style="font-weight: normal; font-size: 14px" id="hotelNotes"   class="hotelNotes" name="hotelNotes">${locObjForEditLocation.hotelNotes}</textarea>
          <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Notes</label>
         
        </div>
      </div>
    	<div class="row col s12">  
    	
    		<c:if test="${locObjForEditLocation.hotelActiveAccount}">			
				<input type="checkbox" id="checkboxForAccountActivation" value="checkboxForAccountActivation" name="hotelActiveAccount" style="display:none" checked/>
			</c:if>
			
			<c:if test="${!locObjForEditLocation.hotelActiveAccount}">			
				<input type="checkbox" id="checkboxForAccountActivation" value="checkboxForAccountActivation" name="hotelActiveAccount" style="display:none" />
			</c:if>		
    		
            <label for="checkboxForAccountActivation" style="font-size:14px;padding-left:35px !important;">Active Account</label>
    	
    	</div>
    		
    </div>
     
    </div>
    
    </div>
    
    </c:forEach>
    
    </form:form>
    
    </div>
    
    
    </div>
   </div>
				
				
		<!--end  account management -->
		
		<!--start of edit location  -->
		
						<div class="editLocation"
			style="display: none; opacity: 1; top: 10%; max-height: 50%">
			<div id="editLocation" class="modal" style="width:91%;margin-top:36px;overflow: auto;">
							<div class="modal-content directorySpin">
					<center>
					
						<h2 style="margin-left: 76px;margin-top:-40px;"> Edit Hotel Directory Details </h2>
						
						<span style="margin:2% 0 0 72%" class="customSubmitButton">				
							<a href="javascript: directorySubmitForm1()"  class="btn applyButton" method="post" style="width:100px;color:white;padding: 10PX;" >Submit</a>
							
							 <button type="reset" class="btn clearData" style="width:100px;color:white;">Clear</button>
							
							<a href="#"
							class="waves-effect waves-green modal-action modal-close waves-effect waves-light btn btn" style="background-color:#20B2AA;padding:12px; width:100px;color:white" >CANCEL</a>
						</span>
						
					</center>
												
				<p id="uploadHotelLogoText" style="margin-bottom:2px;color:red;text-align:center"></p>
				<p id="uploadLogoText" style="margin-bottom:2px;color:red;text-align:center"></p>
				<p id="uploadHotelFooterText" style="margin-bottom:2px;color:red;text-align:center"></p>

				<form:form class="col s12" id="formAction" action="editLocation" name="editLocation"
											method="post" commandName="editLocation"
											enctype="multipart/form-data">
											
				<c:forEach var="locObjForEditLocation" items="${locObjForEditLocation}">
				<%-- 
						<div>
							Note: for efficient use of the directory on mobile devices, we apply the following file size limits for uploads:
							<br/>Individual file size limit: ${imageSize } kb
							<br/>Total directory file size limit: ${totalImagesLimit} kb
							<br/>Current total sizes of directory files already uploaded: <span class="updateDirectoriesSize"></span> kb
						</div>
	 --%>
						<div class=${locObjForEditLocation.objectId } style="display: none; padding: 10px; text-align: justify">
				
								
								
											
								<input type="hidden" name="locId"
									value="${locObjForEditLocation.objectId }">
								<input type="hidden" name="directory"
									value="${locObjForEditLocation.directory }">
								<input type="hidden" name="user" value="${user}">
								<input type="hidden" name="userName" value="${userName}">
								<input type="hidden" name="appId" id="editHiddenAppID" value="${locObjForEditLocation.appId}">							 
								<input type="hidden" name="appname" id="editHiddenAppName"value="${locObjForEditLocation.appName}"> 
								<input type="hidden" name="globalLock" value="${locObjForEditLocation.globalLock}">
							   <%--  <c:if test="${locObjForEditLocation.globalLock==true}">
								<input type="hidden"  name="globalstatus" value="${locObjForEditLocation.globalStatus}">
								</c:if>  --%>
					<div class="row" >
    <div class="col s2" style="
    margin-left: -39px;
    margin-top: -21px;
">
      <ul class="tabs tabs-left"style="margin-top: 45px;">
        <!-- <li class="tab col s12"><a class="active" title="Account Management" href="#testAccount"style="color:white !important"> Account Management </a></li> -->
        <li class="tab col s12"><a href="#test111"style="color:white !important">Hotel Details</a></li>
       <!--  <li class="tab col s12"><a href="#test22"style="color:white !important">Group Site ID</a></li> -->
        <li class="tab col s12"><a href="#test33"style="color:white !important">Address</a></li>
        <li class="tab col s12"><a href="#test44"style="color:white !important" >Content</a></li> 
        <li class="tab col s12"><a href="#test55"style="color:white !important">Image</a></li>
        <li class="tab col s12"><a href="#test66"style="color:white !important">Brand Details</a></li>
<!--         <li class="tab col s12"><a href="#test77"style="color:white !important">Welcome Message</a></li>
 -->        <li class="tab col s12"><a href="#test88"style="color:white !important">Footer Details</a></li>
               <li class="tab col s12"><a href="#testapps"style="color:white !important" id="editsystemapps">Apps</a></li>
 
   
      </ul>
    </div>
    
    <div id="test111" class="col s10"style="margin-top: 40px;">
                                               <c:choose>
												<c:when test="${locObjForEditLocation.templateDetails==true}">
    	                                        <div class="row">
	 											<div class="input-field col s3" style="display: none">
													<input type="text" style="font-weight: normal; font-size: 14px"  required="" id="dirTitle"   class="title" name="nameeeee"> <label style="font-weight: normal; font-size: 14px" class="active">Hotel Name</label>

												</div>
												<div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px"  required="" id="dirTitle"  value="${locObjForEditLocation.name}" class="title" name="editHotelName"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Hotel Name</label>

												</div>
												
 												 <div class="input-field col s2">
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219)"  id="dirTitleColor" name="hotelTitleColor" value="${locObjForEditLocation.hotelColor}" class="color" autocomplete="off" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Color</label>
												</div>
												<div class="input-field col s2">
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219)"  id="dirTitleBackgroundColor" name="hotelTitleBackgroundColor" value="${locObjForEditLocation.hotelTitleBackgroundColor}" class="color" autocomplete="off" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Background Color</label>
												</div>
												<div class="input-field col s2">
													<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Size</label>
													<select name="hotelTitleFont" id="dirTitleFont" class="browser-default" disabled>
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
													<select name="hotelTitleFontFamily" id="dirTitleFamily" class="browser-default" disabled>
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
													<input type="text" style="font-weight: normal; font-size: 14px"  required="" id="dirTitle"  value="${locObjForEditLocation.hotelCaption}" class="title" name="hotelCaption" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Caption</label>

												</div>
												
 												 <div class="input-field col s2">
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219)"  id="dirTitleColor" name="hotelCaptionColor" value="${locObjForEditLocation.captionColor}" class="color" autocomplete="off" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Color</label>
												</div>
												<div class="input-field col s2">
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219)"  id="dirTitleBackgroundColor" name="hotelCaptionBackgroundColor" value="${locObjForEditLocation.hotelCaptionBackgroundColor}" class="color" autocomplete="off" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Background Color</label>
												</div>
												<div class="input-field col s2">
													<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Size</label>
													<select name="hotelCaptionFont" id="dirTitleFont" class="browser-default" disabled>
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
													<select name="hotelCaptionFontFamily" id="dirTitleFamily" class="browser-default" disabled>
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

										<div>
											<div class="input-field col s3" style="margin-left: -16px;">
												<input type="text"
													style="font-weight: normal; font-size: 14px" required=""
													id="dirCaption" name="siteIdName"
													value="${locObjForEditLocation.siteId}"> <label
													style="font-weight: normal; font-size: 14px; margin-left: -7px;"
													class="active">Group Site ID</label>
											</div>
										</div>

										<div class="row col s12" style="">
			<c:if test="${locObjForEditLocation.hotelStatus}">			
				<input type="checkbox" id="hotelLockStatus" value="hotelLockStatus" name="hotelStatus" style="display:none" checked/>
			</c:if>
			
			<c:if test="${!locObjForEditLocation.hotelStatus}">			
				<input type="checkbox" id="hotelLockStatus" value="hotelLockStatus" name="hotelStatus" style="display:none"/>
			</c:if>											
			
			
	    	<label for="hotelLockStatus" style="font-size:14px;padding-left:35px !important;">Display in Location Search</label>
	    </div>
	  	    </c:when>
	    <c:otherwise>
	    <div class="row">
	 											<div class="input-field col s3" style="display: none">
													<input type="text" style="font-weight: normal; font-size: 14px"  required="" id="dirTitle"   class="title" name="nameeeee"> <label style="font-weight: normal; font-size: 14px" class="active">Hotel Name</label>

												</div>
												<div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px"  required="" id="dirTitle"  value="${locObjForEditLocation.name}" class="title" name="editHotelName"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Hotel Name</label>

												</div>
												
 												 <div class="input-field col s2">
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219)"  id="dirTitleColor" name="hotelTitleColor" value="${locObjForEditLocation.hotelColor}" class="color" autocomplete="off"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Color</label>
												</div>
												<div class="input-field col s2">
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219)"  id="dirTitleBackgroundColor" name="hotelTitleBackgroundColor" value="${locObjForEditLocation.hotelTitleBackgroundColor}" class="color" autocomplete="off"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Background Color</label>
												</div>
												<div class="input-field col s2">
													<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Size</label>
													<select name="hotelTitleFont" id="dirTitleFont" class="browser-default">
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
													<select name="hotelTitleFontFamily" id="dirTitleFamily" class="browser-default">
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
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219)"  id="dirTitleColor" name="hotelCaptionColor" value="${locObjForEditLocation.captionColor}" class="color" autocomplete="off"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Color</label>
												</div>
												<div class="input-field col s2">
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219)"  id="dirTitleBackgroundColor" name="hotelCaptionBackgroundColor" value="${locObjForEditLocation.hotelCaptionBackgroundColor}" class="color" autocomplete="off"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Background Color</label>
												</div>
												<div class="input-field col s2">
													<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Font Size</label>
													<select name="hotelCaptionFont" id="dirTitleFont" class="browser-default">
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
													<select name="hotelCaptionFontFamily" id="dirTitleFamily" class="browser-default">
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

										<div>
											<div class="input-field col s3" style="margin-left: -16px;">
												<input type="text"
													style="font-weight: normal; font-size: 14px" required=""
													id="dirCaption" name="siteIdName"
													value="${locObjForEditLocation.siteId}"> <label
													style="font-weight: normal; font-size: 14px; margin-left: -7px;"
													class="active">Group Site ID</label>
											</div>
										</div>

										<div class="row col s12" style="">
			<c:if test="${locObjForEditLocation.hotelStatus}">			
				<input type="checkbox" id="hotelLockStatus" value="hotelLockStatus" name="hotelStatus" style="display:none" checked/>
			</c:if>
			
			<c:if test="${!locObjForEditLocation.hotelStatus}">			
				<input type="checkbox" id="hotelLockStatus" value="hotelLockStatus" name="hotelStatus" style="display:none"/>
			</c:if>											
			
			
	    	<label for="hotelLockStatus" style="font-size:14px;padding-left:35px !important;">Display in Location Search</label>
	    </div>
	  
	    </c:otherwise>
	    </c:choose>
		
    </div>

     <div id="test33" class="col s10" style="margin-top: 40px;">
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
													<input type="text" style="font-weight: normal; font-size: 14px" onkeypress="return isNumber(event)" id="editLatitude" required="" class="title" value="${locObjForEditLocation.latitude}" name="latitude"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Latitude</label>
												</div>
												
												<div class="input-field col s6">
													<input type="text" style="font-weight: normal; font-size: 14px" onkeypress="return isNumber(event)" id="editLongitude" required="" class="title" value="${locObjForEditLocation.longitude}" name="longitude"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Longitude</label>
												</div>
																								<!-- <div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px" required="" class="title" id="dirCaption" name="addressId" value="Address details" readonly> <label style="font-weight: normal; font-size: 14px" class="active">Address</label>
												</div> -->
												<!-- <div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="dirCaptionColor" value="3623DB" name="addressbgColor" class="color" autocomplete="off"> <label style="font-weight: normal; font-size: 14px;" class="active">Background Color</label>
												</div> -->
												<!-- LockStandards apply code -->
													
												<c:choose>
												<c:when test="${locObjForEditLocation.addressDetails==true}">
												<div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="dirCaptionColor"  name="addressColor" class="color" autocomplete="off" value="${locObjForEditLocation.addressColor}"disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Address Font Color</label>
												</div>
												
												<div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="dirCaptionColor"  name="addressBackgroundColor" class="color" autocomplete="off" value="${locObjForEditLocation.addressBackgroundColor}"disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Address Background Color</label>
												</div>
												
												<div class="input-field col s3">
													
													<select name="addressFont" id="dirCaptionFont" class="browser-default" disabled>
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
													
													<select name="addressFamily" id="dirTitleFamily" class="browser-default" disabled>
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
												</c:when>
												<c:otherwise>
												<div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="dirCaptionColor"  name="addressColor" class="color" autocomplete="off" value="${locObjForEditLocation.addressColor}"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Address Font Color</label>
												</div>
												
												<div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="dirCaptionColor"  name="addressBackgroundColor" class="color" autocomplete="off" value="${locObjForEditLocation.addressBackgroundColor}"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Address Background Color</label>
												</div>
												
												<div class="input-field col s3">
													
													<select name="addressFont" id="dirCaptionFont" class="browser-default">
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
													
													<select name="addressFamily" id="dirTitleFamily" class="browser-default">
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
												
												
												</c:otherwise>
												</c:choose>
												
												
											
	                                            	</div>
                                                     </div>
									<div id="test44" class="col s10">

										<div class="row" style="margin: 23px 0 0 16px">
											<div class="">
												<div class="">
													<!-- <div class="html-editor" > -->
													<textarea class="textAreaContent"
														onmouseover="setStyles();"></textarea>


												</div>
												<input type="hidden" id="112244" name="descriptionhtml" />

												<input type="hidden" id="editCount" value="0" />

											</div>
										</div>
									</div>

<div id="test55" class="col s10" style="margin-top:3%">
									
     <div class="row">
    	<div class="row">
             <c:choose>
             <c:when test="${locObjForEditLocation.templateLogo==true}">
             <div class="input-field col s7">
          		<div class="file-field input-field">
				    <div class="btn" style="padding: 0 10px 0 10px;color:white">
		            <span>Hotel Logo</span> 
		            <input type="file" name="hotelLogo" id="uploadHotelLogo" disabled>
		           </div>
		           <div class="file-path-wrapper" style="">
		            <input class="file-path validate" id="imgUrl2" type="text" value=""
		             style="font-size: 20px; ">
		           </div>
		        </div>
		        </div>
          	<div class="input-field col s2" style="margin-top:40px">
          		<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="brandBGColor"  name="hotelLogoBackgroundColor" class="color" autocomplete="off" value="${locObjForEditLocation.hotelLogoBackgroundColor}" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active"><p>Hotel Logo Background Color</p></label>
          	</div>
          	<div class="input-field col s3" style="padding:0 1% 0 7%">
          		<c:if test="${locObjForEditLocation.hotelLogo ne 'No Image To Display'}">
		           <image src="${locObjForEditLocation.hotelLogo}" style="width:100%;height:100%;
		           height:100px;"/>
		         
		        </c:if>
		        <input type="hidden" value="${locObjForEditLocation.hotelLogoSize}" id="hotelLogoSize">
          	    </div>
		        </c:when>
		        <c:otherwise>
		        	 <div class="input-field col s7">
          		<div class="file-field input-field">
				    <div class="btn" style="padding: 0 10px 0 10px;color:white">
		            <span>Hotel Logo</span> 
		            <input type="file" name="hotelLogo" id="uploadHotelLogo">
		           </div>
		           <div class="file-path-wrapper" style="">
		           
		            <input class="file-path validate" id="imgUrl2" type="text" value=""
		             style="font-size: 20px; ">
		           </div>
		        </div>
		        </div>
          	<div class="input-field col s2" style="margin-top:40px">
          		<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="brandBGColor"  name="hotelLogoBackgroundColor" class="color" autocomplete="off" value="${locObjForEditLocation.hotelLogoBackgroundColor}"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active"><p>Hotel Logo Background Color</p></label>
          	</div>
          	<div class="input-field col s3" style="padding:0 1% 0 7%">
          		<c:if test="${locObjForEditLocation.hotelLogo ne 'No Image To Display'}">
		           <image src="${locObjForEditLocation.hotelLogo}" style="width:100%;height:100%;
		           height:100px;"/>
		         
		        </c:if>
		        <input type="hidden" value="${locObjForEditLocation.hotelLogoSize}" id="hotelLogoSize">
          	</div>
		        </c:otherwise>
		        </c:choose>
          	         </div>
         <div class="row"> 	
         <c:choose>
         <c:when test="${locObjForEditLocation.templateImage==true}">
                	<div class="input-field col s7">
          		<div class="file-field input-field">
		           <div class="btn" style="padding: 0 10px 0 10px;color:white">
		            <span>Hotel Image</span>
		             <input type="file" name="logo" multiple id="uploadLogo" disabled>
		           </div>
		           <div class="file-path-wrapper" style="width:392px">
		            <input class="file-path" id="imgUrl1" type="text" 
		             style="font-size: 20px;   ">
		           </div>
		        </div>
          	</div>
          	<div class="input-field col s2" style="margin-top:40px">
          		<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="brandBGColor"  name="hotelImageBackgroundColor" class="color" autocomplete="off" value="${locObjForEditLocation.hotelImageBackgroundColor}" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active"><p>Hotel Image Background Color</p></label>
          	</div>
          	<div class="input-field col s3" style="padding:0 1% 0 7%">
          		<c:if test="${locObjForEditLocation.logo ne 'No Image To Display'}">
					<image src="${locObjForEditLocation.logo}" style="width: 100%;height: 100%;"/>         
         		</c:if>
         		  <input type="hidden" value="${locObjForEditLocation.logoSize}" id="logoImageSize">
          	</div>
          	</c:when>
          	<c:otherwise>
          	
          		<div class="input-field col s7">
          		<div class="file-field input-field">
		           <div class="btn" style="padding: 0 10px 0 10px;color:white">
		            <span>Hotel Image</span>
		             <input type="file" name="logo" multiple id="uploadLogo">
		           </div>
		           <div class="file-path-wrapper" style="width:392px">
		            <input class="file-path" id="imgUrl1" type="text" 
		             style="font-size: 20px;   ">
		           </div>
		        </div>
          	</div>
          	<div class="input-field col s2" style="margin-top:40px">
          		<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="brandBGColor"  name="hotelImageBackgroundColor" class="color" autocomplete="off" value="${locObjForEditLocation.hotelImageBackgroundColor}"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active"><p>Hotel Image Background Color</p></label>
          	</div>
          	<div class="input-field col s3" style="padding:0 1% 0 7%">
          		<c:if test="${locObjForEditLocation.logo ne 'No Image To Display'}">
					<image src="${locObjForEditLocation.logo}" style="width: 100%;height: 100%;"/>         
         		</c:if>
         		  <input type="hidden" value="${locObjForEditLocation.logoSize}" id="logoImageSize">
          	</div>
          	</c:otherwise>
          	 </c:choose>
         </div> 	
         
         <div class="row"> 	
         <c:choose>
         <c:when test="${locObjForEditLocation.templateFooter==true}">
          	<div class="input-field col s7">
          		<div class="file-field input-field">
		           <div class="btn" style="padding: 0 10px 0 10px;color:white">
		            <span>Hotel Footer</span>
		             <input type="file" name="hotelFooter" id="uploadHotelFooter" disabled>
		           </div>
		           <div class="file-path-wrapper" style="width:380px">
		            <input class="file-path validate" id="imgUrl3" type="text" value=""
		             style="font-size: 20px; ">
		           </div>
           		</div>
          	</div>
          	<div class="input-field col s2" style="margin-top:40px">
          		<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="brandBGColor"  name="hotelFooterBackgroundColor" class="color" autocomplete="off" value="${locObjForEditLocation.footerImageBackgroundColor}"disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active"><p>Hotel Footer Background Color</p></label>
          	</div>
          	<div class="input-field col s3" style="padding:0 1% 0 7%">
          		<c:if test="${locObjForEditLocation.footerLogo ne 'No Image To Display'}">
					<image src="${locObjForEditLocation.footerLogo}" style="width:100%;height:100%;"/>        
         		</c:if>
         		  <input type="hidden" value="${locObjForEditLocation.footerImageSize}" id="hotelFooterImageSize">
          	</div>
          	</c:when>
          	<c:otherwise>
          	 	<div class="input-field col s7">
          		<div class="file-field input-field">
		           <div class="btn" style="padding: 0 10px 0 10px;color:white">
		            <span>Hotel Footer</span>
		             <input type="file" name="hotelFooter" id="uploadHotelFooter">
		           </div>
		           <div class="file-path-wrapper" style="width:380px">
		            <input class="file-path validate" id="imgUrl3" type="text" value=""
		             style="font-size: 20px; ">
		           </div>
           		</div>
          	</div>
          	<div class="input-field col s2" style="margin-top:40px">
          		<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="brandBGColor"  name="hotelFooterBackgroundColor" class="color" autocomplete="off" value="${locObjForEditLocation.footerImageBackgroundColor}"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active"><p>Hotel Footer Background Color</p></label>
          	</div>
          	<div class="input-field col s3" style="padding:0 1% 0 7%">
          		<c:if test="${locObjForEditLocation.footerLogo ne 'No Image To Display'}">
					<image src="${locObjForEditLocation.footerLogo}" style="width:100%;height:100%;"/>        
         		</c:if>
         		  <input type="hidden" value="${locObjForEditLocation.footerImageSize}" id="hotelFooterImageSize">
          	</div>
          	
          	</c:otherwise>
         </c:choose>
        </div>  	
       <div>
		 Note: for efficient use of the directory on mobile devices, we apply the following file size limits for uploads:
		<br/>Individual file size limit: ${imageSize } kb
		<br/>Total directory file size limit: ${totalImagesLimit} kb
		<br/>Current total sizes of directory files already uploaded: <span class="updateDirectoriesSize"></span> kb
	  </div>	
   
</div>

</div>

   <div id="test66" class="col s10" style="">
										<div class="row" style="margin-left: 10px; margin-top: 40px;">
											<c:choose>
												<c:when test="${locObjForEditLocation.brandDetails==true}">
													<div class="input-field col s3">
														<input type="text"
															style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);"
															id="brandBGColor" name="brandBGColor" class="color"
															autocomplete="off"
															value="${locObjForEditLocation.brandBackgroundColor}" disabled>
														<label
															style="font-weight: normal; font-size: 14px; margin-left: -7px;"
															class="active">Hotel/Brand Background Color</label>
													</div>
													<div class="input-field col s3">
														<input type="text"
															style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);"
															id="brandBGColor" name="brandButtonColor" class="color"
															autocomplete="off"
															value="${locObjForEditLocation.brandButtonColor}" disabled>
														<label
															style="font-weight: normal; font-size: 14px; margin-left: -7px;"
															class="active">Button Color</label>
													</div>
													<div class="input-field col s3">
														<input type="text"
															style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);"
															id="brandBGColor" name="brandFontColor" class="color"
															autocomplete="off"
															value="${locObjForEditLocation.brandFontColor}" disabled>
														<label
															style="font-weight: normal; font-size: 14px; margin-left: -7px;"
															class="active">Font Color</label>
													</div>
													<div class="input-field col s3">

														<select name="brandFontFamily" id="dirCaptionFamily"
															class="browser-default" disabled>
															<c:if
																test="${locObjForEditLocation.brandFontFamily ne null}">
																<option
																	style="font-family:${locObjForEditLocation.brandFontFamily}"
																	value="${locObjForEditLocation.brandFontFamily}">${locObjForEditLocation.brandFontFamily}</option>
															</c:if>

															<option style="font-family: Courier New"
																value="Courier New">Courier New</option>
															<option style="font-family: Lucida Console"
																value="Lucida Console">Lucida Console</option>
															<option style="font-family: Verdana" value="Verdana">Verdana</option>
															<option style="font-family: sans-serif"
																value="sans-serif">sans-serif</option>
															<option style="font-family: Tahoma" value="Tahoma">Tahoma</option>
															<option style="font-family: Lucida Grande"
																value="Lucida Grande">Lucida Grande</option>
															<option style="font-family: Charcoal" value="Charcoal">Charcoal</option>
															<option style="font-family: Comic Sans MS"
																value="Comic Sans MS">Comic Sans MS</option>
															<option style="font-family: Arial Black"
																value="Arial Black">Arial Black</option>
															<option style="font-family: Arial" value="Arial">Arial</option>
															<option style="font-family: Times New Roman"
																value="Times New Roman">Times New Roman</option>
															<option style="font-family: Palatino Linotype"
																value="Palatino Linotype">Palatino Linotype</option>
															<option style="font-family: Georgia" value="Georgia">Georgia</option>
														</select> <label
															style="font-weight: normal; font-size: 14px; margin-left: -7px;"
															class="active">Font Family</label>
													</div>

													<div class="input-field col s12">

														<table>
															<thead>
																<tr>
																	<th>Directory Folder Section</th>
																	<th>Field</th>
																	<th style="width: 15%">Font Color</th>
																	<th style="width: 20%">Font Size</th>
																	<th>Font Family</th>
																</tr>
															</thead>

															<tbody>

																<tr>
																	<th>Title</th>
																	<th>Title</th>
																	<th><input type="text"
																		style="width: 50%; font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);"
																		id=""
																		value="${locObjForEditLocation.defaultTitleFontColor}"
																		name="defaultTitleFontColor" class="color"
																		autocomplete="off" disabled></th>
																	<th><select name="defaultTitleFontSize" id=""
																		class="browser-default" style="width: 90%" disabled>
																			<c:if
																				test="${locObjForEditLocation.defaultTitleFontSize ne null}">
																				<option
																					style="font-size:${locObjForEditLocation.defaultTitleFontSize}"
																					value="${locObjForEditLocation.defaultTitleFontSize}">${locObjForEditLocation.defaultTitleFontSize}</option>
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
																	</select></th>
																	<th><select name="defaultTitleFontFamily" id=""
																		class="browser-default" style="width: 90%" disabled>
																			<c:if
																				test="${locObjForEditLocation.defaultTitleFontFamily ne null}">
																				<option
																					style="font-family:${locObjForEditLocation.defaultTitleFontFamily}"
																					value="${locObjForEditLocation.defaultTitleFontFamily}">${locObjForEditLocation.defaultTitleFontFamily}</option>
																			</c:if>
																			<option style="font-family: Courier New"
																				value="Courier New">Courier New</option>
																			<option style="font-family: Lucida Console"
																				value="Lucida Console">Lucida Console</option>
																			<option style="font-family: Verdana" value="Verdana">Verdana</option>
																			<option style="font-family: sans-serif"
																				value="sans-serif">sans-serif</option>
																			<option style="font-family: Tahoma" value="Tahoma">Tahoma</option>
																			<option style="font-family: Lucida Grande"
																				value="Lucida Grande">Lucida Grande</option>
																			<option style="font-family: Charcoal"
																				value="Charcoal">Charcoal</option>
																			<option style="font-family: Comic Sans MS"
																				value="Comic Sans MS">Comic Sans MS</option>
																			<option style="font-family: Arial Black"
																				value="Arial Black">Arial Black</option>
																			<option style="font-family: Arial" value="Arial">Arial</option>
																			<option style="font-family: Times New Roman"
																				value="Times New Roman">Times New Roman</option>
																			<option style="font-family: Palatino Linotype"
																				value="Palatino Linotype">Palatino Linotype</option>
																			<option style="font-family: Georgia" value="Georgia">Georgia</option>
																	</select></th>
																</tr>

																<tr>
																	<th>Caption</th>
																	<th>Caption</th>
																	<th><input type="text"
																		style="width: 50%; font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);"
																		id=""
																		value="${locObjForEditLocation.defaultCaptionFontColor}"
																		name="defaultCaptionFontColor" class="color"
																		autocomplete="off" disabled></th>
																	<th><select name="defaultCaptionFontSize" id=""
																		class="browser-default" style="width: 90%" disabled>
																			<c:if
																				test="${locObjForEditLocation.defaultCaptionFontSize ne null}">
																				<option
																					style="font-size:${locObjForEditLocation.defaultCaptionFontSize}"
																					value="${locObjForEditLocation.defaultCaptionFontSize}">${locObjForEditLocation.defaultCaptionFontSize}</option>
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
																	</select></th>
																	<th><select name="defaultCaptionFontFamily" id=""
																		class="browser-default" style="width: 90%" disabled>
																			<c:if
																				test="${locObjForEditLocation.defaultCaptionFontFamily ne null}">
																				<option
																					style="font-family:${locObjForEditLocation.defaultCaptionFontFamily}"
																					value="${locObjForEditLocation.defaultCaptionFontFamily}">${locObjForEditLocation.defaultCaptionFontFamily}</option>
																			</c:if>
																			<option style="font-family: Courier New"
																				value="Courier New">Courier New</option>
																			<option style="font-family: Lucida Console"
																				value="Lucida Console">Lucida Console</option>
																			<option style="font-family: Verdana" value="Verdana">Verdana</option>
																			<option style="font-family: sans-serif"
																				value="sans-serif">sans-serif</option>
																			<option style="font-family: Tahoma" value="Tahoma">Tahoma</option>
																			<option style="font-family: Lucida Grande"
																				value="Lucida Grande">Lucida Grande</option>
																			<option style="font-family: Charcoal"
																				value="Charcoal">Charcoal</option>
																			<option style="font-family: Comic Sans MS"
																				value="Comic Sans MS">Comic Sans MS</option>
																			<option style="font-family: Arial Black"
																				value="Arial Black">Arial Black</option>
																			<option style="font-family: Arial" value="Arial">Arial</option>
																			<option style="font-family: Times New Roman"
																				value="Times New Roman">Times New Roman</option>
																			<option style="font-family: Palatino Linotype"
																				value="Palatino Linotype">Palatino Linotype</option>
																			<option style="font-family: Georgia" value="Georgia">Georgia</option>
																	</select></th>
																</tr>

																<tr>
																	<th>Hours of Operation</th>
																	<th>Hours of Operation</th>
																	<th><input type="text"
																		style="width: 50%; font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);"
																		id=""
																		value="${locObjForEditLocation.defaultHoursFontColor}"
																		name="defaultHoursFontColor" class="color"
																		autocomplete="off" disabled></th>
																	<th><select name="defaultHoursFontSize" id=""
																		class="browser-default" style="width: 90%"  disabled>
																			<c:if
																				test="${locObjForEditLocation.defaultHoursFontSize ne null}">
																				<option
																					style="font-size:${locObjForEditLocation.defaultHoursFontSize}"
																					value="${locObjForEditLocation.defaultHoursFontSize}">${locObjForEditLocation.defaultHoursFontSize}</option>
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
																	</select></th>
																	<th><select name="defaultHoursFontFamily" id=""
																		class="browser-default" style="width: 90%" disabled> 
																			<c:if
																				test="${locObjForEditLocation.defaultHoursFontFamily ne null}">
																				<option
																					style="font-family:${locObjForEditLocation.defaultHoursFontFamily}"
																					value="${locObjForEditLocation.defaultHoursFontFamily}">${locObjForEditLocation.defaultHoursFontFamily}</option>
																			</c:if>
																			<option style="font-family: Courier New"
																				value="Courier New">Courier New</option>
																			<option style="font-family: Lucida Console"
																				value="Lucida Console">Lucida Console</option>
																			<option style="font-family: Verdana" value="Verdana">Verdana</option>
																			<option style="font-family: sans-serif"
																				value="sans-serif">sans-serif</option>
																			<option style="font-family: Tahoma" value="Tahoma">Tahoma</option>
																			<option style="font-family: Lucida Grande"
																				value="Lucida Grande">Lucida Grande</option>
																			<option style="font-family: Charcoal"
																				value="Charcoal">Charcoal</option>
																			<option style="font-family: Comic Sans MS"
																				value="Comic Sans MS">Comic Sans MS</option>
																			<option style="font-family: Arial Black"
																				value="Arial Black">Arial Black</option>
																			<option style="font-family: Arial" value="Arial">Arial</option>
																			<option style="font-family: Times New Roman"
																				value="Times New Roman">Times New Roman</option>
																			<option style="font-family: Palatino Linotype"
																				value="Palatino Linotype">Palatino Linotype</option>
																			<option style="font-family: Georgia" value="Georgia">Georgia</option>
																	</select></th>
																</tr>

																<tr>
																	<th>Add Menu</th>
																	<th>Menu Item</th>
																	<th><input type="text"
																		style="width: 50%; font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);"
																		id=""
																		value="${locObjForEditLocation.defaultMenuFontColor}"
																		name="defaultMenuFontColor" class="color"
																		autocomplete="off" disabled></th>
																	<th><select name="defaultMenuFontSize" id=""
																		class="browser-default" style="width: 90%" disabled>
																			<c:if
																				test="${locObjForEditLocation.defaultMenuFontSize ne null}">
																				<option
																					style="font-size:${locObjForEditLocation.defaultMenuFontSize}"
																					value="${locObjForEditLocation.defaultMenuFontSize}">${locObjForEditLocation.defaultMenuFontSize}</option>
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
																	</select></th>
																	<th><select name="defaultMenuFontFamily" id=""
																		class="browser-default" style="width: 90%" disabled>
																			<c:if
																				test="${locObjForEditLocation.defaultMenuFontFamily ne null}">
																				<option
																					style="font-family:${locObjForEditLocation.defaultMenuFontFamily}"
																					value="${locObjForEditLocation.defaultMenuFontFamily}">${locObjForEditLocation.defaultMenuFontFamily}</option>
																			</c:if>
																			<option style="font-family: Courier New"
																				value="Courier New">Courier New</option>
																			<option style="font-family: Lucida Console"
																				value="Lucida Console">Lucida Console</option>
																			<option style="font-family: Verdana" value="Verdana">Verdana</option>
																			<option style="font-family: sans-serif"
																				value="sans-serif">sans-serif</option>
																			<option style="font-family: Tahoma" value="Tahoma">Tahoma</option>
																			<option style="font-family: Lucida Grande"
																				value="Lucida Grande">Lucida Grande</option>
																			<option style="font-family: Charcoal"
																				value="Charcoal">Charcoal</option>
																			<option style="font-family: Comic Sans MS"
																				value="Comic Sans MS">Comic Sans MS</option>
																			<option style="font-family: Arial Black"
																				value="Arial Black">Arial Black</option>
																			<option style="font-family: Arial" value="Arial">Arial</option>
																			<option style="font-family: Times New Roman"
																				value="Times New Roman">Times New Roman</option>
																			<option style="font-family: Palatino Linotype"
																				value="Palatino Linotype">Palatino Linotype</option>
																			<option style="font-family: Georgia" value="Georgia">Georgia</option>
																	</select></th>
																</tr>

															</tbody>
														</table>

													</div>
												</c:when>

												<c:otherwise>
													<div class="input-field col s3">
														<input type="text"
															style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);"
															id="brandBGColor" name="brandBGColor" class="color"
															autocomplete="off"
															value="${locObjForEditLocation.brandBackgroundColor}">
														<label
															style="font-weight: normal; font-size: 14px; margin-left: -7px;"
															class="active">Hotel/Brand Background Color</label>
													</div>
													<div class="input-field col s3">
														<input type="text"
															style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);"
															id="brandBGColor" name="brandButtonColor" class="color"
															autocomplete="off"
															value="${locObjForEditLocation.brandButtonColor}">
														<label
															style="font-weight: normal; font-size: 14px; margin-left: -7px;"
															class="active">Button Color</label>
													</div>
													<div class="input-field col s3">
														<input type="text"
															style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);"
															id="brandBGColor" name="brandFontColor" class="color"
															autocomplete="off"
															value="${locObjForEditLocation.brandFontColor}">
														<label
															style="font-weight: normal; font-size: 14px; margin-left: -7px;"
															class="active">Font Color</label>
													</div>
													<div class="input-field col s3">

														<select name="brandFontFamily" id="dirCaptionFamily"
															class="browser-default">
															<c:if
																test="${locObjForEditLocation.brandFontFamily ne null}">
																<option
																	style="font-family:${locObjForEditLocation.brandFontFamily}"
																	value="${locObjForEditLocation.brandFontFamily}">${locObjForEditLocation.brandFontFamily}</option>
															</c:if>

															<option style="font-family: Courier New"
																value="Courier New">Courier New</option>
															<option style="font-family: Lucida Console"
																value="Lucida Console">Lucida Console</option>
															<option style="font-family: Verdana" value="Verdana">Verdana</option>
															<option style="font-family: sans-serif"
																value="sans-serif">sans-serif</option>
															<option style="font-family: Tahoma" value="Tahoma">Tahoma</option>
															<option style="font-family: Lucida Grande"
																value="Lucida Grande">Lucida Grande</option>
															<option style="font-family: Charcoal" value="Charcoal">Charcoal</option>
															<option style="font-family: Comic Sans MS"
																value="Comic Sans MS">Comic Sans MS</option>
															<option style="font-family: Arial Black"
																value="Arial Black">Arial Black</option>
															<option style="font-family: Arial" value="Arial">Arial</option>
															<option style="font-family: Times New Roman"
																value="Times New Roman">Times New Roman</option>
															<option style="font-family: Palatino Linotype"
																value="Palatino Linotype">Palatino Linotype</option>
															<option style="font-family: Georgia" value="Georgia">Georgia</option>
														</select> <label
															style="font-weight: normal; font-size: 14px; margin-left: -7px;"
															class="active">Font Family</label>
													</div>

													<div class="input-field col s12">

														<table>
															<thead>
																<tr>
																	<th>Directory Folder Section</th>
																	<th>Field</th>
																	<th style="width: 15%">Font Color</th>
																	<th style="width: 20%">Font Size</th>
																	<th>Font Family</th>
																</tr>
															</thead>

															<tbody>

																<tr>
																	<th>Title</th>
																	<th>Title</th>
																	<th><input type="text"
																		style="width: 50%; font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);"
																		id=""
																		value="${locObjForEditLocation.defaultTitleFontColor}"
																		name="defaultTitleFontColor" class="color"
																		autocomplete="off"></th>
																	<th><select name="defaultTitleFontSize" id=""
																		class="browser-default" style="width: 90%">
																			<c:if
																				test="${locObjForEditLocation.defaultTitleFontSize ne null}">
																				<option
																					style="font-size:${locObjForEditLocation.defaultTitleFontSize}"
																					value="${locObjForEditLocation.defaultTitleFontSize}">${locObjForEditLocation.defaultTitleFontSize}</option>
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
																	</select></th>
																	<th><select name="defaultTitleFontFamily" id=""
																		class="browser-default" style="width: 90%">
																			<c:if
																				test="${locObjForEditLocation.defaultTitleFontFamily ne null}">
																				<option
																					style="font-family:${locObjForEditLocation.defaultTitleFontFamily}"
																					value="${locObjForEditLocation.defaultTitleFontFamily}">${locObjForEditLocation.defaultTitleFontFamily}</option>
																			</c:if>
																			<option style="font-family: Courier New"
																				value="Courier New">Courier New</option>
																			<option style="font-family: Lucida Console"
																				value="Lucida Console">Lucida Console</option>
																			<option style="font-family: Verdana" value="Verdana">Verdana</option>
																			<option style="font-family: sans-serif"
																				value="sans-serif">sans-serif</option>
																			<option style="font-family: Tahoma" value="Tahoma">Tahoma</option>
																			<option style="font-family: Lucida Grande"
																				value="Lucida Grande">Lucida Grande</option>
																			<option style="font-family: Charcoal"
																				value="Charcoal">Charcoal</option>
																			<option style="font-family: Comic Sans MS"
																				value="Comic Sans MS">Comic Sans MS</option>
																			<option style="font-family: Arial Black"
																				value="Arial Black">Arial Black</option>
																			<option style="font-family: Arial" value="Arial">Arial</option>
																			<option style="font-family: Times New Roman"
																				value="Times New Roman">Times New Roman</option>
																			<option style="font-family: Palatino Linotype"
																				value="Palatino Linotype">Palatino Linotype</option>
																			<option style="font-family: Georgia" value="Georgia">Georgia</option>
																	</select></th>
																</tr>

																<tr>
																	<th>Caption</th>
																	<th>Caption</th>
																	<th><input type="text"
																		style="width: 50%; font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);"
																		id=""
																		value="${locObjForEditLocation.defaultCaptionFontColor}"
																		name="defaultCaptionFontColor" class="color"
																		autocomplete="off"></th>
																	<th><select name="defaultCaptionFontSize" id=""
																		class="browser-default" style="width: 90%">
																			<c:if
																				test="${locObjForEditLocation.defaultCaptionFontSize ne null}">
																				<option
																					style="font-size:${locObjForEditLocation.defaultCaptionFontSize}"
																					value="${locObjForEditLocation.defaultCaptionFontSize}">${locObjForEditLocation.defaultCaptionFontSize}</option>
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
																	</select></th>
																	<th><select name="defaultCaptionFontFamily" id=""
																		class="browser-default" style="width: 90%">
																			<c:if
																				test="${locObjForEditLocation.defaultCaptionFontFamily ne null}">
																				<option
																					style="font-family:${locObjForEditLocation.defaultCaptionFontFamily}"
																					value="${locObjForEditLocation.defaultCaptionFontFamily}">${locObjForEditLocation.defaultCaptionFontFamily}</option>
																			</c:if>
																			<option style="font-family: Courier New"
																				value="Courier New">Courier New</option>
																			<option style="font-family: Lucida Console"
																				value="Lucida Console">Lucida Console</option>
																			<option style="font-family: Verdana" value="Verdana">Verdana</option>
																			<option style="font-family: sans-serif"
																				value="sans-serif">sans-serif</option>
																			<option style="font-family: Tahoma" value="Tahoma">Tahoma</option>
																			<option style="font-family: Lucida Grande"
																				value="Lucida Grande">Lucida Grande</option>
																			<option style="font-family: Charcoal"
																				value="Charcoal">Charcoal</option>
																			<option style="font-family: Comic Sans MS"
																				value="Comic Sans MS">Comic Sans MS</option>
																			<option style="font-family: Arial Black"
																				value="Arial Black">Arial Black</option>
																			<option style="font-family: Arial" value="Arial">Arial</option>
																			<option style="font-family: Times New Roman"
																				value="Times New Roman">Times New Roman</option>
																			<option style="font-family: Palatino Linotype"
																				value="Palatino Linotype">Palatino Linotype</option>
																			<option style="font-family: Georgia" value="Georgia">Georgia</option>
																	</select></th>
																</tr>

																<tr>
																	<th>Hours of Operation</th>
																	<th>Hours of Operation</th>
																	<th><input type="text"
																		style="width: 50%; font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);"
																		id=""
																		value="${locObjForEditLocation.defaultHoursFontColor}"
																		name="defaultHoursFontColor" class="color"
																		autocomplete="off"></th>
																	<th><select name="defaultHoursFontSize" id=""
																		class="browser-default" style="width: 90%">
																			<c:if
																				test="${locObjForEditLocation.defaultHoursFontSize ne null}">
																				<option
																					style="font-size:${locObjForEditLocation.defaultHoursFontSize}"
																					value="${locObjForEditLocation.defaultHoursFontSize}">${locObjForEditLocation.defaultHoursFontSize}</option>
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
																	</select></th>
																	<th><select name="defaultHoursFontFamily" id=""
																		class="browser-default" style="width: 90%">
																			<c:if
																				test="${locObjForEditLocation.defaultHoursFontFamily ne null}">
																				<option
																					style="font-family:${locObjForEditLocation.defaultHoursFontFamily}"
																					value="${locObjForEditLocation.defaultHoursFontFamily}">${locObjForEditLocation.defaultHoursFontFamily}</option>
																			</c:if>
																			<option style="font-family: Courier New"
																				value="Courier New">Courier New</option>
																			<option style="font-family: Lucida Console"
																				value="Lucida Console">Lucida Console</option>
																			<option style="font-family: Verdana" value="Verdana">Verdana</option>
																			<option style="font-family: sans-serif"
																				value="sans-serif">sans-serif</option>
																			<option style="font-family: Tahoma" value="Tahoma">Tahoma</option>
																			<option style="font-family: Lucida Grande"
																				value="Lucida Grande">Lucida Grande</option>
																			<option style="font-family: Charcoal"
																				value="Charcoal">Charcoal</option>
																			<option style="font-family: Comic Sans MS"
																				value="Comic Sans MS">Comic Sans MS</option>
																			<option style="font-family: Arial Black"
																				value="Arial Black">Arial Black</option>
																			<option style="font-family: Arial" value="Arial">Arial</option>
																			<option style="font-family: Times New Roman"
																				value="Times New Roman">Times New Roman</option>
																			<option style="font-family: Palatino Linotype"
																				value="Palatino Linotype">Palatino Linotype</option>
																			<option style="font-family: Georgia" value="Georgia">Georgia</option>
																	</select></th>
																</tr>

																<tr>
																	<th>Add Menu</th>
																	<th>Menu Item</th>
																	<th><input type="text"
																		style="width: 50%; font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);"
																		id=""
																		value="${locObjForEditLocation.defaultMenuFontColor}"
																		name="defaultMenuFontColor" class="color"
																		autocomplete="off"></th>
																	<th><select name="defaultMenuFontSize" id=""
																		class="browser-default" style="width: 90%">
																			<c:if
																				test="${locObjForEditLocation.defaultMenuFontSize ne null}">
																				<option
																					style="font-size:${locObjForEditLocation.defaultMenuFontSize}"
																					value="${locObjForEditLocation.defaultMenuFontSize}">${locObjForEditLocation.defaultMenuFontSize}</option>
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
																	</select></th>
																	<th><select name="defaultMenuFontFamily" id=""
																		class="browser-default" style="width: 90%">
																			<c:if
																				test="${locObjForEditLocation.defaultMenuFontFamily ne null}">
																				<option
																					style="font-family:${locObjForEditLocation.defaultMenuFontFamily}"
																					value="${locObjForEditLocation.defaultMenuFontFamily}">${locObjForEditLocation.defaultMenuFontFamily}</option>
																			</c:if>
																			<option style="font-family: Courier New"
																				value="Courier New">Courier New</option>
																			<option style="font-family: Lucida Console"
																				value="Lucida Console">Lucida Console</option>
																			<option style="font-family: Verdana" value="Verdana">Verdana</option>
																			<option style="font-family: sans-serif"
																				value="sans-serif">sans-serif</option>
																			<option style="font-family: Tahoma" value="Tahoma">Tahoma</option>
																			<option style="font-family: Lucida Grande"
																				value="Lucida Grande">Lucida Grande</option>
																			<option style="font-family: Charcoal"
																				value="Charcoal">Charcoal</option>
																			<option style="font-family: Comic Sans MS"
																				value="Comic Sans MS">Comic Sans MS</option>
																			<option style="font-family: Arial Black"
																				value="Arial Black">Arial Black</option>
																			<option style="font-family: Arial" value="Arial">Arial</option>
																			<option style="font-family: Times New Roman"
																				value="Times New Roman">Times New Roman</option>
																			<option style="font-family: Palatino Linotype"
																				value="Palatino Linotype">Palatino Linotype</option>
																			<option style="font-family: Georgia" value="Georgia">Georgia</option>
																	</select></th>
																</tr>

															</tbody>
														</table>

													</div>
											</c:otherwise>
										</c:choose>
										</div>
										<div  class="input-field col s12" >
													<input type="hidden" value="" name="applyForAll" id="applyForAll" />
													<a href="javascript: applyForAll()"  class="btn applyButton"  style="width:185px;color:white;padding: 10PX;" >Apply to All Folders</a>
												
												</div>
											
	
		
    </div>    
    
     <div id="test88" class="col s10" style=" ">
    	<div class="row" style="margin-left:10px;margin-top:40px;">
    	<c:choose>
    	<c:when test="${locObjForEditLocation.footerDetails==true}">
    	
												<div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px" placeholder="" required="" class="title" id="dirCaption" name="footerSite" value="${locObjForEditLocation.footerText}" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Footer Text</label>
												</div>
												<div class="input-field col s2">
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="dirCaptionColor"  name="footerbgColor" class="color" autocomplete="off" value="${locObjForEditLocation.hotelFooterBackgroundColor}" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active"><p>Footer Background Color</p></label>
												</div>
												<div class="input-field col s2">
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="dirCaptionColor"  name="footerColor" class="color" autocomplete="off"  value="${locObjForEditLocation.footerTextColor}" disabled> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Footer Text Color</label>
												</div>
												 <div class="input-field col s2">
												 	
													<select name="footerFont" id="dirCaptionFont" class="browser-default" disabled>
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
													<select name="footerCaptionFamily" id="dirCaptionFamily" class="browser-default" disabled>
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
													<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active ">Footer Font Family</label>
												</div> 
												</c:when>
												<c:otherwise>
												<div class="input-field col s3">
													<input type="text" style="font-weight: normal; font-size: 14px" placeholder="" required="" class="title" id="dirCaption" name="footerSite" value="${locObjForEditLocation.footerText}" > <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Footer Text</label>
												</div>
												<div class="input-field col s2">
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="dirCaptionColor"  name="footerbgColor" class="color" autocomplete="off" value="${locObjForEditLocation.hotelFooterBackgroundColor}"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active"><p>Footer Background Color</p></label>
												</div>
												<div class="input-field col s2">
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="dirCaptionColor"  name="footerColor" class="color" autocomplete="off"  value="${locObjForEditLocation.footerTextColor}"> <label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active">Footer Text Color</label>
												</div>
												 <div class="input-field col s2">
												 	
													<select name="footerFont" id="dirCaptionFont" class="browser-default" >
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
													<select name="footerCaptionFamily" id="dirCaptionFamily" class="browser-default">
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
													<label style="font-weight: normal; font-size: 14px;margin-left:-7px;" class="active ">Footer Font Family</label>
												</div> 
												
												</c:otherwise>
												</c:choose>
											
		</div>
			    </div>
        
    <!-- app pop up code starts -->
									<div id="testapps" class="col s10" style="margin-top: 40px;">
										<div class="row">
												<div class="input-field col s4">
												<label style="font-weight: normal; font-size: 14px;" class="active">eGSD System</label> 
											<c:choose>
 												 <c:when test="${locObjForEditLocation.appLock==true}">
													<select class="browser-default" required id="egsdApp" name="egsdApp" disabled>
														
														 <option value="${locObjForEditLocation.appId}" selected>${locObjForEditLocation.appName}</option>
														
														
														<!-- <option value=""  disabled>Choose App/Brand</option> -->
														
													</select> <span id="editegsdApperr" style="font-size: 13px; color: red"></span>
												</c:when>
												<c:otherwise>
													<select class="browser-default" required id="egsdApp" name="egsdApp">
														
														 <option value="${locObjForEditLocation.appId}" selected>${locObjForEditLocation.appName}</option>
														
														
														<!-- <option value=""  disabled>Choose App/Brand</option> -->
														
													</select> <span id="editegsdApperr" style="font-size: 13px; color: red"></span>
												</c:otherwise>
											</c:choose>
												</div>
													<div class="input-field col s2">
													</div>

												<div class="input-field col s4">
													
														<c:choose>
															<c:when test="${locObjForEditLocation.globalLock==true}">
																<c:choose>
																	<c:when test="${locObjForEditLocation.globalStatus==true}">
			                                                           <input type="checkbox" id="globalcheck" name="globalstatus" style="display:none;" disabled  checked />
			                                                        <!--   <input type="hidden" id="globalcheck" name="globalstatus"  style="display:none" checked/> --> 
																	</c:when>
																	<c:otherwise>
			                                                            <input type="checkbox" id="globalcheck" name="globalstatus" style="display:none;"  disabled/>
			                                                          <!-- <input type="hidden" id="globalcheck" name="globalstatus" style="display:none"/> --> 
																	</c:otherwise>
																</c:choose>
															</c:when>
															<c:otherwise>
															<c:choose>
																<c:when test="${locObjForEditLocation.globalStatus==true}">
			                                                         <input type="checkbox" id="globalcheck"  name="globalstatus" style="display:none" checked onclick="statusCheck()"/> 
			                                                          <!--  <input type="checkbox" id="globalcheck"  name="globalstatus" style="display:none"/> --> 
																</c:when>
																<c:otherwise>
			                                                           <input type="checkbox" id="globalcheck" name="globalstatus" style="display:none" onclick="statusCheck()"/>
																</c:otherwise>
															</c:choose>
														</c:otherwise>
													</c:choose>


													<label for="globalcheck" style="font-size: 14px; padding-left: 35px !important;">Global Participant</label>
												</div>
												
											</div>

									</div>

									<!-- app pop up code ends-->
  
    </div>
    
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
					class="waves-effect waves-green btn-flat modal-action modal-close right">Cancel</a>
				<div class="modal-content">

					<center><h5 > Delete Hotel Directory</h5></center>
					<c:forEach var="locObjForDeleteLocation"
						items="${locObjForEditLocation}">

						<div class=${locObjForDeleteLocation.objectId }
							style="display: none;text-align: justify">

							<a>Are you Sure To delete the Following Hotel Directory and it's
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
							
							 <button type="reset" class="btn clearData" id="reset1" onclick="reset1()" style="width:100px;color:white;">CLEAR</button>
							
							<a href="#" class="waves-effect waves-green modal-action modal-close waves-effect waves-light btn"style="background-color:#20B2AA;padding:12px; color:white">CANCEL</a>
						
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
        <li class="tab col s12"><a href="#test3"style="color:white !important">Hours of Op</a></li>
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
													<input type="text" style="font-weight: normal; font-size: 14px; background-image: none; color: rgb(54, 35, 219);" id="dirCaptionColor0" value="3623DB" name="captionColor" class="color" autocomplete="off"> <label style="font-weight: normal;margin-left:-7px; font-size: 14px;" class="active">Font Color</label>
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
    
    				<textarea class="textAreaContent" ></textarea>
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
															
															
															<div class="input-field col s2">
																<input type="text" class="sequence0" name="menuSequence0" value="0" onkeypress="return isNumber(event)" style="font-weight: normal; font-size: 14px"> <label class="active" for="first_name2" style="font-weight: normal; font-size: 14px;margin-left:-7px;">Menu Item Sequence</label>
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
  
   
    </div> </form:form> 
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
			  
			  
		<a class="waves-effect waves-light btn modal-trigger" style="display:none" id="laList" href="#locationAdminsList">Modal</a>
			<div id="locationAdminsList" class="modal" style="height:75%;font-size:16px;top:2% !important">
				<a href="#!" class=" modal-action modal-close right waves-effect waves-green btn-flat">Close</a>
			    <div class="modal-content">
			     	 <c:forEach	var="locObj" items="${locObj}">
			     	 	<input value="${locObj.objectId }" type="hidden" id="editHotelId"/>
			     	 
			     	 
				     	 <select  name="adminId" required id="editAdminId" class="locAdmin browser-default">
				     	 	<c:if test="${locObj.locationAdmin ne null}">
								<option value="${locObj.locObjectId }">${locObj.locationAdmin } - ${locObj.locFirstName } ${locObj.locLastName }</option>
							</c:if>
											
						 </select>
					 </c:forEach>
					 <span id="updateLocationAdminErr" style="color:red;font-size:12px"></span>
					 <button type="submit" id="changeAdminSubmit" style="float:right;color:#ffffff;padding:0px 28px 0 28px;margin-top:25px" class="btn waves-effect waves-light col s12">Update Admin User</button>
				 
			    </div>
			    
			  </div>
			  
			  
			  
	 <a href="#modal5" class="modal-trigger" id="deleteAdmin" style="font-size: 1rem;display:none; padding: 0.5rem 0.5rem;">Add CS Admin</a>
 
	 <div id="modal5" class="modal">
	  
	     <div class="modal-content deleteConfirmBody">
	     	 <center><h5>Delete Admin </h5></center>
	     	 <input type="hidden" id="deleteUserId"/>
	     	 <br/>
	         Are you Sure To delete this user?
	         <br/>
	         <br/>
	         <button type="submit" id="deleteAdminDetails" class="btn">YES</button>
	         <a href="#!" class="btn modal-action modal-close waves-effect waves-green">NO</a>
		 </div>
	     
	 </div>
	 
	 
	 <a href="#deleteforAdmin" class="modal-trigger" id="deleteNotConfirmationAdmin" style="font-size: 1rem;display:none; padding: 0.5rem 0.5rem;">Add CS Admin</a>
 
	 <div id="deleteforAdmin" class="modal">
	  <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat right">Close</a>
	     <div class="modal-content">
	     	 
	        This user is assigned to one or more hotels. Cannot be deleted. Please contact support team.
	         <br/>
	         <br/>
	         
		 </div>
	     
	 </div>
	 
		 <script type="text/javascript" src="../js/materialize.js"></script>
		 <script type="text/javascript" src="../js/plugins.js"></script>
		 <script type="text/javascript" src="../styles/js/materialize.js"></script>
	<!--  <script type="text/javascript" src="../styles/js/materialize.min.js"></script> -->
<script src="../styles/vendors/summernote/dist/summernote-updated.min.js"></script>
<script type="text/javascript" src="../styles/js/fun.js"></script>
<script src="../js/superadmin.js"></script>


<!-- scrpit code for data  starts-->
<script>

$('#createLocationAdmin').click(function(){
	
	var result = 0;
	$('.userExisted').empty();
	var fname = $('#locationFirstname').val();
	var lname = $('#locationLastname').val();
	var uname = $('#locationUsername').val();
	var email = $('#locationEmail').val();
	var phone = $('#locationPhone').val();
	var lEmail = $('#laEmail').val();
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	
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
        }else if(uname.match(mailformat))
        {
        	$('#lunameErr').text("User Name doesn't allow email address");
        	result++;
        }
        else {
        	$('#lunameErr').empty();
        }
	}
	
	
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
	
	if(phone == "" || phone == null)
	{
		$('#lPhoneErr').text('Phone Number is required');
		result++;
	}
	else
	{
		$('#lPhoneErr').empty();
	}
	
	
	if(result == 0)
	{
		var data = {
				
				"firstname":fname,
				"lastname":lname,
				"username":uname,
				"email":email,
				"phone":phone,
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
			    	$('#locationPhone').val('');
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
			    	$('#locationPhone').val('');
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




	function VoucherSourcetoPrint(source) {
		return "<html><head>function step1(){\n" +
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


		jQuery(window).bind(
	     	"beforeunload",
	    	$('.lean-overlay').css('dispaly','none')   
	 )





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
			    			  $('#superPhone').val(result[i].phone);
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
			    			  $('#superPhone').val(result[i].phone);
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
			    			  $('#csPhone').val(result[i].phone);
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
			    			  $('#locationPhone').val(result[i].phone);
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
			$('.userSpin').show();
			
			
			var searchElement = {
	    			"searchId" : objId			    			
	    	};
			//$(".deletebody").append("<div style='margin:0 0 0 30%' class='preloader-wrapper small active'><div class='spinner-layer spinner-green-only'><div class='circle-clipper left'><div class='circle></div></div><div class='gap-patch'><div class='circle'></div></div><div class='circle-clipper right'><div class='circle'></div></div></div></div>");
			$.ajax({
			      type: "POST",
			      url: "deleteUser",
			      async: true,
			      data : searchElement,
			      
			      success :function(result) {
			    	  if( result == "nolocations" )
			    	  {
			    		  $('#modal4').hide();
			    		  $('.lean-overlay').css({display:'none'});
			    		  $('.userSpin').hide();
			    		  $('#deleteAdmin').click();
						  $('#deleteUserId').val(objId);					    		  
			    	  }
			    	  else
			    	  {
			    		  $('#modal4').hide();
			    		  $('.userSpin').hide();
			    		  $('.lean-overlay').css({display:'none'});
			    		  $('#deleteNotConfirmationAdmin').click();
			    	  }
			    	     	  
			     },
			     error : function(error) {
			    	console.log(error);
			     }
			  });
			
		}
		
		$('#deleteAdminDetails').click(function(){
			
			var userId = $('#deleteUserId').val();
			var searchElement = {
	    			"searchId" : userId			    			
	    	};
			
			$(".deleteConfirmBody").append("<div style='margin:0 0 0 30%' class='preloader-wrapper small active'><div class='spinner-layer spinner-green-only'><div class='circle-clipper left'><div class='circle></div></div><div class='gap-patch'><div class='circle'></div></div><div class='circle-clipper right'><div class='circle'></div></div></div></div>");
			$.ajax({
			      type: "POST",
			      url: "confirmDeleteUser",
			      async: true,
			      data : searchElement,
			      
			      success :function(result) {	
			    	  $('.deleteConfirmBody').hide();
			    	  $('#modal5').hide();
		    		  $('.lean-overlay').css({display:'none'});
			     },
			     error : function(error) {
			    	console.log(error);
			     }
			  });
		});


		$('.skipSelection').click(function(){
			
				$('.search').val('');   	
		    	var searchElement = {
		    			"searchId" : "",
		    			"username" : "null"
		    	};
		    	
		    	$('.mbody').show();
		    	
		    	
		    	$.ajax({
				      type: "POST",
				      url: "searchHotels",
				      async: true,
				      data : searchElement,
				     
				      success :function(result) {
				    	  $(".searchResults").empty();
				    	  sortHotelsList = result;
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
				    		  var tableDetails = "<tr>"+
								"<td style='padding: 6px 0px 0px 0px;text-align:center' onclick='hotelsSortOrder(this.id)' id='name'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Hotel Name</b></td>"+
								"<td style='padding:10px 0;text-align:center' onclick='hotelsSortOrder(this.id)' id='hotelId'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Hotel Id</b></td>"+
								"<td style='padding:10px 0;text-align:center' onclick='hotelsSortOrder(this.id)' id='groupId'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Group Site ID</b></td>"+
								"<td style='padding:10px 0;text-align:center' onclick='hotelsSortOrder(this.id)' id='zipcode'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Zip/Postal Code</b></td>"+
								"<td style='padding:10px 0;text-align:center' onclick='hotelsSortOrder(this.id)' id='groupName'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Group Name</b></td>"+
								"<td style='padding:10px 0;text-align:center' onclick='hotelsSortOrder(this.id)' id='adminName'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Hotel Admin</b></td>"+
								"<td style='padding:10px 0;text-align:center' onclick='hotelsSortOrder(this.id)' id='email'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Email</b></td>"+
								"</tr>";
					    	  for(var i=0;i<result.length;i++)
					    	  {
					    		  if(result[i].groupName == null)
					    		  {
					    			  result[i].groupName = "";
					    		  }
					    		  if(result[i].adminName == null)
					    		  {
					    			  result[i].adminName = "";
					    		  }
					    		  if(result[i].email == null)
					    		  {
					    			  result[i].email = "";
					    		  }
					    		  
					    		  var table = "<tr>"+
										"<td style='padding: 6px 0px 0px 0px;text-align:center'> <a onclick='loading()' style='color:#337ab7' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"'>"+
										""+result[i].name+""+
										"</a>"+
										"</td>"+
										"<td style='padding:10px 0;text-align:center'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
										""+result[i].hotelId+""+
										"</a>"+
										"</td>"+
										"<td style='padding:10px 0;text-align:center'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
										""+result[i].groupId+""+
										"</a>"+
										"</td>"+
										"<td style='padding:10px 0;text-align:center'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
										""+result[i].zipcode+""+
										"</a>"+
										"</td>"+
										"<td style='padding:10px 0;text-align:center'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
										""+result[i].groupName+""+
										"</a>"+
										"</td>"+
										"<td style='padding:10px 0;text-align:center'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
										""+result[i].adminName+""+
										"</a>"+
										"</td>"+
										"<td style='padding:10px 0;text-align:center'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
										""+result[i].email+""+
										"</a>"+
										"</td>"+
										
									"</tr>";
					    		  tableDetails = tableDetails+table;
					    		  
					    	  }
					    	  console.log(tableDetails);
					    	  $(".searchResults").append("<tbody style='font-size:14px'>"+tableDetails+"</tbody>");
					    	  $('.mbody').hide();
				    	  }    	  
				     },
				     error : function(error) {
				    	console.log(error);
				     }
				  });
		});





	$('#search').keyup(function(e){
		
		if(e.keyCode == 13)
	    {	    	
	    	var searchElement = {
	    			"searchId" : $('#search').val(),
	    			"username" : "null"
	    	};
	    	
	    	$('.mbody').show();
	    	
	    	
	    	$.ajax({
			      type: "POST",
			      url: "searchHotels",
			      async: true,
			      data : searchElement,
			     
			      success :function(result) {
			    	  $(".searchResults").empty();
			    	  sortHotelsList = result;
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
			    		  var tableDetails = "<tr>"+
							"<td style='padding: 6px 0px 0px 0px;text-align:center' onclick='hotelsSortOrder(this.id)' id='name'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Hotel Name</b></td>"+
							"<td style='padding:10px 0;text-align:center' onclick='hotelsSortOrder(this.id)' id='hotelId'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Hotel Id</b></td>"+
							"<td style='padding:10px 0;text-align:center' onclick='hotelsSortOrder(this.id)' id='groupId'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Group Site ID</b></td>"+
							"<td style='padding:10px 0;text-align:center' onclick='hotelsSortOrder(this.id)' id='zipcode'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Zip/Postal Code</b></td>"+
							"<td style='padding:10px 0;text-align:center' onclick='hotelsSortOrder(this.id)' id='groupName'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Group Name</b></td>"+
							"<td style='padding:10px 0;text-align:center' onclick='hotelsSortOrder(this.id)' id='adminName'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Hotel Admin</b></td>"+
							"<td style='padding:10px 0;text-align:center' onclick='hotelsSortOrder(this.id)' id='email'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Email</b></td>"+
							"</tr>";
				    	  for(var i=0;i<result.length;i++)
				    	  {
				    		  if(result[i].groupName == null)
				    		  {
				    			  result[i].groupName = "";
				    		  }
				    		  if(result[i].adminName == null)
				    		  {
				    			  result[i].adminName = "";
				    		  }
				    		  if(result[i].email == null)
				    		  {
				    			  result[i].email = "";
				    		  }
				    		  
				    		  var table = "<tr>"+
								"<td style='padding: 6px 0px 0px 0px;text-align:center'> <a onclick='loading()' style='color:#337ab7' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"'>"+
								""+result[i].name+""+
								"</a>"+
								"</td>"+
								"<td style='padding:10px 0;text-align:center'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
								""+result[i].hotelId+""+
								"</a>"+
								"</td>"+
								"<td style='padding:10px 0;text-align:center'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
								""+result[i].groupId+""+
								"</a>"+
								"</td>"+
								"<td style='padding:10px 0;text-align:center'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
								""+result[i].zipcode+""+
								"</a>"+
								"</td>"+
								"<td style='padding:10px 0;text-align:center'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
								""+result[i].groupName+""+
								"</a>"+
								"</td>"+
								"<td style='padding:10px 0;text-align:center'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
								""+result[i].adminName+""+
								"</a>"+
								"</td>"+
								"<td style='padding:10px 0;text-align:center'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
								""+result[i].email+""+
								"</a>"+
								"</td>"+
							"</tr>";
			    		  tableDetails = tableDetails+table;
			    		  
			    	  }
			    	  console.log(tableDetails);
			    	  $(".searchResults").append("<tbody style='font-size:14px'>"+tableDetails+"</tbody>");
			    	  $('.mbody').hide();
			    	  }
			    	 
			    	  
			     },
			     error : function(error) {
			    	console.log(error);
			     }
			  });
	    }
	    
	});
	




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
			    	  sortTemplatesList = result;
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
			    		  var tableDetails = "<tr>"+
							"<td style='padding:10px 0 0 30px;' onclick='templatesSortOrder(this.id)' id='templateName'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Template Name</b></td>"+
							"<td style='padding:10px 0' onclick='templatesSortOrder(this.id)' id='templateId'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Template Id</b></td>"+
						"</tr>";
				    	  for(var i=0;i<result.length;i++)
				    	  {
				    		  var table = "<tr>"+
				    		  "<td style='padding:10px 0 0 30px;'> <a onclick='templateLoading()' style='color:#337ab7' href='viewTemplates?user=${user}&userName=${userName}&tempId="+result[i].templateId+"'>"+
						   	      ""+result[i].templateName+"</a>"+
						   	  "</td>"+
						   	  "<td style='padding:10px 0'> <a onclick='templateLoading' href='viewTemplates?user=${user}&userName=${userName}&tempId="+result[i].templateIId+"' style='color:#337ab7'>"+
						   	     ""+result[i].templateId+"</a>"+
						   	  "</td>"+
									
								"</tr>";
				    		  tableDetails = tableDetails+table;
				    		  
				    	  }
				    	  console.log(tableDetails);
				    	  $("#templateSearchResults").append("<tbody style='font-size:14px'>"+tableDetails+"</tbody>");
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
				    	  var tableDetails = "<tr>"+
								"<td style='padding: 10px 0 0 30px'><b style='color:#337ab7;font-size:18px'>Group </b></td>"+
								"<td style='padding:10px 0'><b style='color:#337ab7;font-size:18px'>Group Id</b></td>"+
							"</tr>";
				    	  for(var i=0;i<result.length;i++)
				    	  {
				    		  var table = "<tr>"+
				    		  "<td style='padding: 10px 0 0 30px'> <a onclick='groupLoading()' style='color:#337ab7' href='viewGroups?user=${user}&userName=${userName}&tempId="+result[i].templateId+"'>"+
						   	      ""+result[i].templateName+"</a>"+
						   	  "</td>"+
						   	  "<td style='padding:10px 0'> <a onclick='groupLoading()' href='viewGroups?user=${user}&userName=${userName}&tempId="+result[i].templateIId+"' style='color:#337ab7'>"+
						   	     ""+result[i].templateId+"</a>"+
						   	  "</td>"+
									
								"</tr>";
				    		  tableDetails = tableDetails+table;
				    		  
				    	  }
				    	  console.log(tableDetails);
				    	  $("#groupSearchResults").append("<tbody style='font-size:14px'>"+tableDetails+"</tbody>");
				    	  $('.groupSpin').hide();
			    	  }
			    	 
			    	  
			     },
			     error : function(error) {
			    	console.log(error);
			     }
			  });
	    }
	    
	});
	

	var sortUsersList;
	var sortHotelsList;
	var sortTemplatesList;  
	 
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
				    		  if(result[i].phone == null)
				    		  {
				    			  result[i].phone = "";
				    		  }
				    		  var table = "<tr>"+
									"<td style='padding:10px 0;text-align:center;''> <a style='color:#337ab7' href='#'>"+											
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
									"</td>"+
									"<td style='padding:10px 0;text-align:center'> <a  href='#' style='color:#337ab7'>"+
									"<span id='edit:"+result[i].email+"' onclick='editUser(this.id)'>Edit </span > &nbsp <span id='delete:"+result[i].objectId+"' onclick='deleteUser(this.id)'> Delete </span>"+
									"</a>"+
									"</td>"+								
								"</tr> ";
				    		  tableDetails = tableDetails+table;
				    		  
				    	  }
				    	  console.log(tableDetails);
				    	  $("#userSearchResults").append("<tbody style='font-size:14px'>"+tableDetails+"</tbody>");
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
		
		$('#userSearch').val('');
		
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
			    	  //console.log(result);
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
		
		function hotelsSortOrder(prop){
			
			sortHotelsList.sort( predicatBy(prop) );
			$(".searchResults").empty();
			var result = sortHotelsList;
			 var tableDetails = "<tr>"+
				"<td style='padding: 6px 0px 0px 0px;text-align:center' onclick='hotelsSortOrder(this.id)' id='name'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Hotel Name</b></td>"+
				"<td style='padding:10px 0;text-align:center' onclick='hotelsSortOrder(this.id)' id='hotelId'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Hotel Id</b></td>"+
				"<td style='padding:10px 0;text-align:center' onclick='hotelsSortOrder(this.id)' id='groupId'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Group Site ID</b></td>"+
				"<td style='padding:10px 0;text-align:center' onclick='hotelsSortOrder(this.id)' id='zipcode'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Zip/Postal Code</b></td>"+
				"<td style='padding:10px 0;text-align:center' onclick='hotelsSortOrder(this.id)' id='groupName'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Group Name</b></td>"+
				"<td style='padding:10px 0;text-align:center' onclick='hotelsSortOrder(this.id)' id='adminName'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Hotel Admin</b></td>"+
				"<td style='padding:10px 0;text-align:center' onclick='hotelsSortOrder(this.id)' id='email'><b style='color:#337ab7;font-size:18px;cursor:pointer'>Email</b></td>"+
				"</tr>";
    	  for(var i=0;i<result.length;i++)
    	  {
    		  if(result[i].groupName == null)
    		  {
    			  result[i].groupName = "";
    		  }
    		  if(result[i].adminName == null)
    		  {
    			  result[i].adminName = "";
    		  }
    		  if(result[i].email == null)
    		  {
    			  result[i].email = "";
    		  }
    		  
    		  var table = "<tr>"+
					"<td style='padding: 6px 0px 0px 0px;text-align:center'> <a onclick='loading()' style='color:#337ab7' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"'>"+
					""+result[i].name+""+
					"</a>"+
					"</td>"+
					"<td style='padding:10px 0;text-align:center'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
					""+result[i].hotelId+""+
					"</a>"+
					"</td>"+
					"<td style='padding:10px 0;text-align:center'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
					""+result[i].groupId+""+
					"</a>"+
					"</td>"+
					"<td style='padding:10px 0;text-align:center'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
					""+result[i].zipcode+""+
					"</a>"+
					"</td>"+
					"<td style='padding:10px 0;text-align:center'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
					""+result[i].groupName+""+
					"</a>"+
					"</td>"+
					"<td style='padding:10px 0;text-align:center'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
					""+result[i].adminName+""+
					"</a>"+
					"</td>"+
					"<td style='padding:10px 0;text-align:center'> <a onclick='loading()' href='select?user=${user}&amp;userName=${userName}&amp;locId="+result[i].hotelId+"' style='color:#337ab7'>"+
					""+result[i].email+""+
					"</a>"+
					"</td>"+
					
				"</tr>";
    		  tableDetails = tableDetails+table;
    		  
    	  }
    	  $(".searchResults").append("<tbody style='font-size:14px' id='headings'>"+tableDetails+"</tbody>");
			
		}
		
		function templatesSortOrder(prop){
			
			sortTemplatesList.sort( predicatBy(prop) );
			$("#templateSearchResults").empty();
			var result = sortTemplatesList;
			var tableDetails = "<tr>"+
					"<td style='padding: 6px 0px 0px 30px;' onclick='templatesSortOrder(this.id)' id='templateName' ><b style='color:#337ab7;font-size:18px;cursor:pointer'>Template Name</b></td>"+
					"<td style='padding:10px 0' onclick='templatesSortOrder(this.id)' id='templateId' ><b style='color:#337ab7;font-size:18px;cursor:pointer'>Template Id</b></td>"+
				"</tr>";
	    	  for(var i=0;i<result.length;i++)
	    	  {
	    		  var table = "<tr>"+
	    		  "<td style='padding: 6px 0px 0px 30px;' > <a style='color:#337ab7' onclick='templateLoading()' href='viewTemplates?user=${user}&userName=${userName}&tempId="+result[i].templateId+"'>"+
			   	      ""+result[i].templateName+"</a>"+
			   	  "</td>"+
			   	  "<td style='padding:10px 0' > <a onclick='templateLoading()' href='viewTemplates?user=${user}&userName=${userName}&tempId="+result[i].templateIId+"' style='color:#337ab7'>"+
			   	     ""+result[i].templateId+"</a>"+
			   	  "</td>"+
						
					"</tr>";
	    		  tableDetails = tableDetails+table;
	    		  
	    	  }
	    	  console.log(tableDetails);
	    	  $("#templateSearchResults").append("<tbody style='font-size:14px'>"+tableDetails+"</tbody>");
			 
			
		}
		
		
		function predicatBy(prop){
			   return function(a,b){
			      if( a[prop].toLowerCase() > b[prop].toLowerCase()){
			          return 1;
			      }else if( a[prop].toLowerCase() < b[prop].toLowerCase() ){
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
				    	  var tableDetails = "<tbody><td style='padding: 10px 0''><b style='color:#337ab7;font-size:18px'>User Name</b></td>"+
							"<td style='padding:10px 0'><b style='color:#337ab7;font-size:18px'>First Name</b></td>"+
							"<td style='padding:10px 0'><b style='color:#337ab7;font-size:18px'>Last Name</b></td>"+
							"<td style='padding: 10px 0'><b style='color:#337ab7;font-size:18px'>Email</b></td>"+
							"<td style='padding: 10px 0'><b style='color:#337ab7;font-size:18px'>Phone Number</b></td>"+
							"<td style='padding:10px 0'><b style='color:#337ab7;font-size:18px'>Role</b></td>"+
							"<td style='padding:10px 0'><b style='color:#337ab7;font-size:18px'>Actions</b></td>"+
							"</tr>";
				    	  for(var i=0;i<result.length;i++)
				    	  {
				    		  if(result[i].phone == null)
				    		  {
				    			  result[i].phone = "";
				    		  }
				    		  var table = "<tr>"+
									"<td style='padding: 10px 0''> <a style='color:#337ab7' href='dfgdfg'>"+											
									""+result[i].username+"</a>"+
									"</td>"+
									"<td style='padding:10px 0'> <a  href='dfgdfg' style='color:#337ab7'>"+										
									""+result[i].firstname+"</a>"+
									"</td>"+
									"<td style='padding:10px 0'> <a  href='dfgdfg' style='color:#337ab7'>"+											
									""+result[i].lastname+"</a>"+
									"</td>"+
									"<td style='padding: 10px 0''> <a style='color:#337ab7' href='dfgdfg'>"+											
									""+result[i].email+"</a>"+
									"</td>"+
									"<td style='padding: 10px 0''> <a style='color:#337ab7' href='dfgdfg'>"+											
									""+result[i].phone+"</a>"+
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
			    	  sortTemplatesList = result;
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
			    		  var tableDetails = "<tr>"+
							"<td style='padding:10px 0 0 30px' onclick='templatesSortOrder(this.id)' id='templateName'><b style='color:#337ab7;font-size:18px'>Template Name</b></td>"+
							"<td style='padding:10px 0;' onclick='templatesSortOrder(this.id)' id='templateId'><b style='color:#337ab7;font-size:18px'>Template Id</b></td>"+
						"</tr>";
				    	  for(var i=0;i<result.length;i++)
				    	  {
				    		  var table = "<tr>"+
				    		  "<td style='padding:10px 0 0 30px;'> <a onclick='templateLoading()' style='color:#337ab7' href='viewTemplates?user=${user}&userName=${userName}&tempId="+result[i].templateId+"'>"+
						   	      ""+result[i].templateName+"</a>"+
						   	  "</td>"+
						   	  "<td style='padding:10px 0;'> <a onclick='templateLoading()'  href='viewTemplates?user=${user}&userName=${userName}&tempId="+result[i].templateIId+"' style='color:#337ab7'>"+
						   	     ""+result[i].templateId+"</a>"+
						   	  "</td>"+
									
								"</tr>";
				    		  tableDetails = tableDetails+table;
				    		  
				    	  }
				    	  console.log(tableDetails);
				    	  $("#templateSearchResults").append("<tbody style='font-size:14px'>"+tableDetails+"</tbody>");
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
				    	  var tableDetails = "<tr>"+
								"<td style='padding:10px 0 0 30px;'><b style='color:#337ab7;font-size:18px'>Group Name</b></td>"+
								"<td style='padding:10px 0;'><b style='color:#337ab7;font-size:18px'>Group Id</b></td>"+
							"</tr>";
				    	  for(var i=0;i<result.length;i++)
				    	  {
				    		  var table = "<tr>"+
				    		  "<td style='padding:10px 0 0 30px;'> <a onclick='groupLoading()' style='color:#337ab7' href='viewGroups?user=${user}&userName=${userName}&tempId="+result[i].templateId+"'>"+
						   	      ""+result[i].templateName+"</a>"+
						   	  "</td>"+
						   	  "<td style='padding:10px 0;'> <a onclick='groupLoading()' href='viewGroups?user=${user}&userName=${userName}&tempId="+result[i].templateIId+"' style='color:#337ab7'>"+
						   	     ""+result[i].templateId+"</a>"+
						   	  "</td>"+
									
								"</tr>";
				    		  tableDetails = tableDetails+table;
				    		  
				    	  }
				    	  console.log(tableDetails);
				    	  $("#groupSearchResults").append("<tbody style='font-size:14px'>"+tableDetails+"</tbody>");
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
	$('.applyButton').removeAttr('disabled');
});
	
	



	$('#groupId').bind('keypress', function (event) {
	    var regex = new RegExp("^[a-zA-Z0-9\b]+$");
	    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
	    if (!regex.test(key)) {
	       event.preventDefault();
	       return false;
	    }
	});



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



function adminApp1(id){
	
	$('#modal29').show();
	
	var butn = '<a id="'+id+'" class="btn"	onclick="admin_app(this.id)" style="width: 100px; color: white; padding: 10PX;">Submit</a>';
	
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


function closeDiv(){

	 
	 
	 $('#modal29').hide();	
	
}




function clickings0(){
	
	$("#dvPassport5001").show();
}





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
	$('#mce_1_ifr').contents().find("body").html("");
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

$('#changeAdminSubmit').click(function(){
	
	var adminId = $('#editAdminId').val();
	var hotelId = $('#editHotelId').val();
	var hotelResult = 0;
	
	if(adminId == "" || adminId == null)
	{
		$('#updateLocationAdminErr').text("Please select Location Admin from the list");
		hotelResult++;
	}
	else
	{
		$('#updateLocationAdminErr').empty();				
		
	}	
	
	var data = {
			"adminId" : adminId,
			"hotelId" : hotelId
	}
	
	if( hotelResult == 0 )
	{
		$.ajax({
		      type: "POST",
		      url: "updateHotelAdmin",
		      data : data,
		      async: true,
		            
		      success :function(result) {
		    	  
		    	  $('#locationAdminsList').hide();		    	  
		    	  $('.lean-overlay').css({display:'none'});
		     },
		     error : function(error) {
		    	console.log(error);
		     }
		  });
	}
	
	
});

function editHotelAdminUser()
{	// $('#editAdminId').empty();
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
	    	  
	    	  
	    	  $('#editAdminId').append(adminsArray);
	    	     	  
	     },
	     error : function(error) {
	    	console.log(error);
	     }
	  });
	
	$('#laList').click();
	
}




/* $('.modal-trigger1').openModal({dismissible:false}); */


</script>

	
</body>
</html>