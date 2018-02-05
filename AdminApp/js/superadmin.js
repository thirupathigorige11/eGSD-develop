/**
 * http://usejsdoc.org/
 */

		 /*  Billing Rate field validation  */
		 document.getElementById("hotelBillingRate").addEventListener("keypress", numbersOnly, false);
		 function numbersOnly(e)
		 {
		          var currency = $('#hotelBillingRate').val();
					 var currencyArr = currency.split('.');
					 if( currencyArr[1].length > 1 )
					 {
						 e.preventDefault();
		            } 
		 }

		 /* PaymentsSystemId field validation*/
       
          document.getElementById("paymentsSystemId").addEventListener("keypress", myEventHandler, false);
           function myEventHandler(e) {
        	 var currency = document.getElementById("paymentsSystemId").value;
        	 var enteredKey = e.keyCode;
        	
        	    if (currency.length > 49) {
        	   e.preventDefault();
        	        
        	    }
        	    if( 
        	            (enteredKey>=97 && enteredKey<=122) ||
        	            (enteredKey>=65 && enteredKey<=90)  ||
        	            (enteredKey>=48 && enteredKey<=57)
        	            ){
        	            console.log("valid character");
        	        }
        	        else{
        	            e.preventDefault();
        	        }
        	};
		
		
			 
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
									 if($('#uploadDirectoryImage').get(0).files[0] == undefined && imageStatus == "1")
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
				  
				  function loading()
					{
						$('.mbody').show();
					}
				  
				  function templateLoading()
				  {
					  $('.templateSpin').show();
				  }
				  function groupLoading()
				  {
					  $('.groupSpin').show();
				  }
				  
				  
				  
					
				  
			  function applyForAll()
			  {
				  $('#applyForAll').val("applyforall");
				  $('.applyButton').attr('disabled','disabled');
				  directorySubmitForm1();
			  }
			  
			  

			  function directorySubmitForm123() {				  
				 // $('.note-editable').last().remove();
				 var result = 0;
				 var editor = $('#mce_0_ifr').contents().find("body").html();
				 
				 $('#112244').val(editor);
				 
				 
				 var x = parseFloat($('#hotelBillingRate').val());
					var convertCurrency=x.toFixed(2);
					$("#hotelBillingRate").val(convertCurrency);
				 
				 /* var currency = $('#hotelBillingRate').val();
				 var currencyArr = currency.split('.');
				 if( currencyArr[0].length > 2 )
				 {
					 alert("Enter Bill Rate having only two decimal values");
					 result++;
				 } */
				 
				 
				 
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
					var numberOfImagesSizes = parseInt($('#numberOfImages').val());
					
					
					
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
							$('#uploadLogoText').text('');
							
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
							$('#uploadHotelFooterText').text('');
							
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
			
					//console.log(result);
				 
					if( result == 0 )
					{
						document.editLocation123.submit();
					} 
					
				 
				  
			  }
				  
			  function directorySubmitForm1() {	
				 // alert($('#test77').is(':checked'))
				 // $('.note-editable').last().remove();
				 var appdata = $(egsdApp).val();
				 var result = 0;
				 var editor = $('#mce_0_ifr').contents().find("body").html();
				 
				 $('#112244').val(editor);
				 
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
					var numberOfImagesSizes = parseInt($('#numberOfImages').val());
					
					
					
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
							$('#uploadLogoText').text('');
							
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
							$('#uploadHotelFooterText').text('');
							
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
					
					console.log(result);
				 
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
				'<label class="active" style="font-weight: normal; margin-left:-7px;font-size: 14px">Price</label></div>'+
				'<input type="button" value="Delete" class="editmenuremoveButton btn input-field col s1"style="margin-left:10px;margin-top:16px;">'+
			
				        
      '</div>');
	
	            
	newTextBoxDiv.appendTo(".editmenuTextBoxesGroup");

				
	editmenucounter++;
	 $('.editmenuCount').val(editmenucounter);
     });
    
    
    $("body").on("click", ".editmenuremoveButton", function () {
        $(this).closest("div").remove();
        
    });
  
		
		
		



    
		
    $(".addButton").click(function () {
				
    	var counter = parseInt($('.counter').val());
		
	var newTextBoxDiv = $(document.createElement('div'))
	     .attr("class", 'TextBoxDiv' + counter);
                
	newTextBoxDiv.after().html('<input type="hidden" value="" name="editmenuObject'+counter+'"><div class="row" style="margin-left:4px">'+
			'<div class="input-field col s4">'+
				'<input type="text" class="description'+counter+' " name="menuDescription'+counter+'" style="font-weight: normal; font-size: 14px">'+
				'<label class="active" style="font-weight: normal;margin-left:-7px; font-size: 14px">Menu Item Description</label></div>'+
			'<div class="input-field col s2">'+
				'<input type="text" class="price'+counter+' " name="menuPrice'+counter+'" onkeypress="return isNumber(event)" style="font-weight: normal; font-size: 14px">'+
				'<label class="active" style="font-weight: normal; font-size: 14px;margin-left:-7px;">Price</label></div>'+
			'<div class="input-field col s2">'+
				'<input type="text" value="0" class="sequence'+counter+' " name="menuSequence'+counter+'" onkeypress="return isNumber(event)" style="font-weight: normal; font-size: 14px">'+
				'<label class="active" style="font-weight: normal; font-size: 14px;margin-left:-7px;">Menu Item Sequence</label></div>'+
				'<input type="button" value="Delete" class="removeButton btn input-field col s1" style="margin-left:10px;margin-top:16px;">'+
			
				        
      '</div>');
	
	            
	newTextBoxDiv.appendTo(".TextBoxesGroup");

				
	counter++;
	 $('.counter').val(counter);
     });
    
    
    $("body").on("click", ".removeButton", function () {
        $(this).closest("div").remove();
        
    });
   

     
	 
	 
     

				
		
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
		    
		    
		    
	
		

			function setStyles(){
				//debugger;
				var elements = document.getElementsByClassName("mce-combobox mce-colorbox mce-last mce-abs-layout-item mce-has-open");
				 for(var i = 0; i < elements.length; i++){
					console.log(elements[i].style.left); 
				 }
			}

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
		
		
	
		
		
		$('#updateAdminDetails').click(function(){
			
			$('#updateAdminhref').click();
			var email1 = $('#updateHideEmail').val();
			
			$('#supertext').text('Update Admin Details');
			$('#updateAdmin').val('Update Admin User');
			var fname = $('#updateFname').val();
	    	var lname = $('#UpdateLname').val();
	    	var uname = $('#updateUname').val();
	    	var email = $('#updateEmail').val();
	    	var phone = $('#updatePhone').val();
	    	$('#updateFnameErr').empty();
	    	$('#updateLnameErr').empty();
	    	$('#updateEmailErr').empty();
	    	$('#updatePhoneErr').empty();
	    	
	    	
			var user = "${user}";
			var data = {
				"user":user,
				"fname" : fname,
				"lname" : lname,					
				"email" :email,
				"phone":phone
			};
			
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
							  var pic = result.directoryList[0].picture;
							  $('#directoryPictureSize').val(result.directoryList[0].hotelPictureSize);
							  
							  var resPic = pic.split("empty.jpg");
							  
							  /* if(resPic.length >= 2)
							  {
								  var dirImg = '';
							  }
							  else
							  { */
								  if( result.directoryList[0].picture != "No Image To Display" )
								  {
									  var dirImg = '<center style="margin-left:35%;width:30%"> <img alt="" style="width: 100%; height: 100%;" src="'+result.directoryList[0].picture+'"></center>';
								  }
							  //}
							  var menuListArray = [];
							  
							  var menuList;
							  var totalDetails;
							  
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
									 '<div	style="text-align:right;font-size:'+result.styleList[0].priceFont+'; color: #'+result.styleList[0].priceColor+';font-family:'+result.styleList[0].captionFamily+'">'+														
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
											  '<div	style="text-align:right;font-family: Courier New, Courier, monospace;">'+												
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
				window.open("http://egsd.mobldir.com:8080/egsdMobileApp/directories.html?id="+hId, "_blank", "toolbar=yes, scrollbars=yes, resizable=yes,left=500, width=320, height=600");
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
				$('.directorySpinner').hide();
				$('#uploadDirectoryImage').val('');
				$('#uploadDirectoryText').text('');
				$('#imgUrl').val('');
				//$('.locPopup').hide();
				$('#addDirItem').click();
				$('#dirTitle0').val('');
				$('#dirCaption0').val('');
				$('#dirTimings0').val('');
		    	/*$('#dirTitleColor0').val('3623DB');
		    	$('#dirTitleFont0').find('option:contains("initial")').attr("selected",true);
		    	$('#dirTitleFamily0').find('option:contains("Courier New")').attr("selected",true);
		    	$('#dirCaption0').val('');
		    	$('#dirCaptionColor0').val('3623DB');
		    	$('#dirCaptionFont0').find('option:contains("initial")').attr("selected",true);
		    	$('#dirCaptionFamily0').find('option:contains("Courier New")').attr("selected",true);
		    	$('#dirTimings0').val('');
		    	$('#dirTimingsColor0').val('3623DB');
		    	$('#dirTimingsFont0').find('option:contains("initial")').attr("selected",true);
		    	$('#dirTimingsFamily0').find('option:contains("Courier New")').attr("selected",true); */
		    	
		    	/* $('#dirPriceColor').val('3623DB');
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
				$('#uploadDirectoryImage').val('');
				$('.directorySpinner').hide();
				$('#displayDirectoryItemImage').empty();
				$('#addDirItem').click();
				$('.TextBoxesGroup').empty();
				$('.manageTextBoxesGroup').empty();
				
				    $('#dirItemTitle').text('Edit Directory Item');
				    $('#dirTitle0').val('');
			    	$('#dirTitleColor0').val('');
			    	
			    	$('#dirCaption0').val('');
			    	$('#dirCaptionColor0').val('');
			    	
			    	$('#dirTimings0').val('');
			    	$('#dirTimingsColor0').val('');
			    	
			    	$('#dirPriceColor').val('');
			    			    	
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
					    	  for(var i=0;i<baaray.length;i++)
					    	  {
					    		  
					    		  menuItems = '<input type="hidden" value="'+baaray[i].objectId+'" name="editmenuObject'+i+'"><div class="row" style="margin-left:4px">'+								
									'<div class="input-field col s4">'+
										'<input type="text" style="font-size:14px;font-weight:normal" name="menuDescription'+i+'" value="'+baaray[i].description+'" class="materialize-textarea validate valid" style="height: 22px;"> <label class="active" for="first_name2" style="margin-left:-7px;font-size:14px;font-weight:normal">Menu Item Description</label>'+
									'</div>'+
									'<div class="input-field col s2">'+
										'<input type="text" style="font-size:14px;font-weight:normal" value="'+baaray[i].price+'" name="menuPrice'+i+'" class="materialize-textarea validate" style="height: 22px;"> <label class="active" for="first_name2" style="margin-left:-7px;font-size:14px;font-weight:normal">Price</label>'+
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
				   

				  //childWindow.location.reload();
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
			
			
			/* account management code */
			function accountManagement_click(clicked_id) {
					//debugger;
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
				$('.accountmanagement').show();

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
		
		
		
		
		
		$('.modal-action').click(function(){
			
			$('.lean-overlay').css({display:'none'});
			
		});
		
		
		$('#aiAdmin').click(function(){
			$('#superFirstname').val('');
			$('#superLastname').val('');
			$('#superUsername').val('');
			$('#superUsername').removeAttr('disabled');
			$('#superPhone').val('');
			$('#superEmail').val('');
			$('#saEmail').val('');
			$('#adminType').val('IT Admin');
			$('#supertext').text('Create IT Admin User');
			$('#createSuperAdmin').text('Create IT Admin');
			//$('#createSuperAdmin').show();
			//$('#updateSuperAdmin').hide();
			$('#sfnameErr').empty();
			$('.userExisted').empty();
			$('#slnameErr').empty();
			$('#sunameErr').empty();
			$('#sphoneErr').empty();
			$('#semailErr').empty();
			
			$('#asAdminhref').click();
			
		});
		
		
		$('#asAdmin').click(function(){
			$('#superFirstname').val('');
			$('#superLastname').val('');
			$('#superUsername').val('');
			$('#superPhone').val('');
			$('#adminType').val('Super Admin');
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
			$('#sphoneErr').empty();
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
			$('#csPhone').val('');
			$('#cstext').text('Create CS Admin User');
			$('#createCSAdmin').text('Create CS Admin');
			//$('#createCSAdmin').show();
			//$('#updateCSAdmin').hide();
			$('#cfnameErr').empty();
			$('.userExisted').empty();
			$('#clnameErr').empty();
			$('#cunameErr').empty();
			$('#cemailErr').empty();
			$('#cPhoneErr').empty();
			$('#csAdminhref').click();
			
		});
		
		$('#alAdmin').click(function(){
			$('#locationFirstname').val('');
			$('#locationLastname').val('');
			$('#locationUsername').val('');
			$('#locationUsername').removeAttr('disabled');
			$('#locationEmail').val('');
			$('#locationPhone').val('');
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
			$('#lPhoneErr').empty();
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
		//$('#egsdApp').val('');
       	//	$('#globalstatus').removeAttr('checked');
		$('#showTemplates').val('');
		$('#groupObjectId').val('');
		$('#Street').val('');
		$('#groupId').val('');
		$('#addLatitude').val('');
		$('#addLongitude').val('');
		$('#showTemplates').show();
		$('#showGroups').hide();
		$('#State').val('');
		$('.file-path').val('');
		$('#zipcode').val('');
		$('#country').val('');
		$('#hotelNameErr').empty();
		$('#hotelExistErr').empty();
		$('#hotelLocationAdminErr').empty();
		//$('#egsdapperr').empty();
		$('#hotelTemplateErr').empty();
		$('#hotelGroupErr').empty();
		$('#hotelAddressErr').empty();
		$('#hotelCityErr').empty();
		$('#hotelStateErr').empty();
		$('#hotelZipcodeErr').empty();
		$('#hotelCountryErr').empty();
		$('#hotelhref').click();
		
		getAddedApps();
		
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
		    	  $('#editAdminId').append(adminsArray);
		    	     	  
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
					    		  $('#addNewTemplate').attr('disabled','disabled');
					    		  $('#addNewTemplate').attr('action','');
					    		  $('.tspin').show();
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
		
	/* 	add group submit functionality code starts */
		
		function groupSubmitform()
		{
			var groupResult = 0;
			var name = $('#addGroupName').val();
			var id = $('#addTemplateId').val();
			if(name == "" || name == null)
			{
				$('#groupNameErr').text("Group Name is required.");
				 $("#groupExistErr").empty();
				groupResult++;
			}
			else
			{
				$('#groupNameErr').empty();     				
			}
			if(id == "" || id == null)
			{
				$('#groupIdErr').text("Please select template from the list.");
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
				    		  $("#groupExistErr").text("This Group is already registered");
				    		  $('#groupNameErr').empty();
				    		  $('.gspin').hide();
				    		  groupResult++;
				    	  }
				    	  else
				          {
				    		  $('#addNewGroup').attr('disabled','disabled');
				    		  $('#addNewGroup').attr('action','');
				    		  $("#groupExistErr").empty();	
				    		  $('.gspin').hide();
				    		  document.addGroup.submit();
				    		  
				    		  groupResult = 0;  
				          }
				    	 
				     },
				     error : function(error) {
				    	 console.log(error);
				    	
				     }
				  });
				
				
			}
			
			
		}
		/* 	add group submit functionality code ends */
		
		
	
		
	
		
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
			var hAddress1 = $('#Address1').val();
			var locId = $('#adminId').val();
			//var egsdapp = $('#egsdAppOptions').val();
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
		/*	
			if(egsdapp == "" || egsdapp == null){
				$('#egsdapperr').text("Please select the App/Brand.");
				hotelResult++;
		}
			else{
				$('#egsdapperr').empty()
			}*/
			
			
			
					
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
				
				//$('#addNewHotel').attr('action','');
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
				    		  $('#addNewHotel').attr('disabled','disabled');
				    		  $('#addNewHotel').attr('action','');
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
			var phone = $('#superPhone').val();
			var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			
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
		        }else if(uname.match(mailformat))
		        {
		        	$('#sunameErr').text("User Name doesn't allow email address");
		        	result++;
		        }
		        else {
		        	$('#sunameErr').empty();
		        }
			}
			
			if(phone == "" || phone == null)
			{
				$('#sphoneErr').text('Phone Number is required');
				result++;
			}
			else
			{
				$('#sphoneErr').empty();		        
			}
			
			
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
						"phone":phone,
						"sEmail":sEmail,
						"user": $('#user').val(),
						"userName": $('#userName').val(),
						"userType":$('#adminType').val()
						
						
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
						    	$('#userType').text($('#adminType').val());
						    	$('#superFirstname').val('');
						    	$('#superLastname').val('');
						    	$('#superUsername').val('');
						    	$('#superEmail').val('');
						    	$('#superPhone').val('');
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
				    	$('#superPhone').val('');
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
			var phone = $('#csPhone').val();
			var cEmail = $('#caEmail').val();
			var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			
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
		        }else if(uname.match(mailformat))
		        {
		        	$('#cunameErr').text("User Name doesn't allow email address");
		        	result++;
		        }
		        else {
		        	$('#cunameErr').empty();
		        }
			}
			
			
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
			
			if(phone == "" || phone == null)
			{
				$('#cPhoneErr').text('Phone Number is required');
				result++;
			}
			else
			{
				$('#cPhoneErr').empty();
			}
			
			if(result == 0)
			{
				var data = {
						
						"firstname":fname,
						"lastname":lname,
						"username":uname,
						"email":email,
						"phone":phone,
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
					    	$('#csPhone').val('');
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
					    	$('#csPhone').val('');
				     }
				  });
			}
			
			
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
  //called when key is pressed in textbox
  $('.abc').keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
  
  
  
  /*Manage App functionality script code started here*/
  

//get data from system collection (add apps)  
$("#manageapp").click(function(){
	$(".dynamicAppDataAppend").empty();
	getAddedApps();
});

 $("#appadded").click(function(){
	 $("#msg").empty();
	// $(".dynamicAppDataAppend").empty();
		//getAddedApps();
});
 
 $("#appEdited").click(function(){
		$("#appEditIds").hide('modal');
		getAddedApps();
	})
	
 function getAddedApps(){
	 //alert("Hi");
	 $("#egsdAppOptions").empty();
	// $("#egsdApp").empty();
	 $(".dynamicAppDataAppend").empty();
	 $.ajax({
			type:'POST',
			url:'getAddedApps',
			 async: true,
			success:function(appData){
				function sortByKey(jsObj){
				  	var sortedArray = [];

				  	// Push each JSON Object entry in array by [key, value]
				  	for(var i in jsObj)
				  	{
						sortedArray.push([jsObj[i]]);
					}

					// Run native sort function and returns sorted array.
					return sortedArray.sort();
				}
				var sortedbyKeyJSONArray = sortByKey(appData);
				var dynamicData="";
				var appoptions="<option value='' selected disabled>"+"Choose App/Brand"+"</option>";
				var editHiddenAppId = $("#editHiddenAppID").val();
				var editHiddenAppName = $("#editHiddenAppName").val();
				//alert(editHiddenAppId);
				console.log(editHiddenAppName);
				var  editOptions = "<option value='"+editHiddenAppId+"' selected>"+editHiddenAppName+"</option>";
				var data;
				var optionArray=[];
				for(var i=0;i<sortedbyKeyJSONArray.length;i++){
					dynamicData=dynamicData+
							"<tr>"+
							"<td>"+sortedbyKeyJSONArray[i][0].appId+"</td>"+
							"<td>"+sortedbyKeyJSONArray[i][0].appName+"</td>"+
							"<td>"+"<a style='' id='"+sortedbyKeyJSONArray[i][0].objectId+"' onclick=editAppData(this.id) class='btn'>"+"Edit"+"</a>"+"</td>"+
							"<td>"+"<a style='' id='"+sortedbyKeyJSONArray[i][0].objectId+"' onclick=deleteAppData(this.id) class='btn'>"+"Delete"+"</a>"+"</td>"+
							"</tr>";
							data=data+"<option value='"+sortedbyKeyJSONArray[i][0].appId+"'>"+sortedbyKeyJSONArray[i][0].appName+"</option>";
							
						}
				var staticfiled="<option value='none'>"+"None"+"</option>";
				$(".dynamicAppDataAppend").append(dynamicData);
				$("#egsdAppOptions").html(appoptions+data+staticfiled);
				$("#egsdApp").html(editOptions+data+staticfiled);
				
				
			},
			error:function(err){
				console.log(err);
			}
		})
 }




function editAppData(appId){
	$("#updatemsg").empty();
	$("#editNewApp").removeAttr("disabled");
	$("#appEditIdErr").empty();
	$("#appEditNameErr").empty();
	$("#editAppId").val('');
	$("#editAppName").val('');
	$("#editObjectId").val('');
	
	
	$("#appEditIdErr").val('');
	$("#appEditNameErr").val('');
	$.ajax({
		type:'post',
		url:'editApp',
		data:{'appId':appId},
		success:function(appResult){
			
			console.log(appResult);
			$("#appEditIds").show('modal');
			$("#editAppId").val(appResult[0].appId);
			$("#editAppName").val(appResult[0].appName);
			$("#editObjectId").val(appResult[0].objectId);
		},
		error:function(err){
			console.log(err)
		}
	})
}


 

	 function deleteAppData(appId){
			$("#deleteAppmodal").show('modal');
			$("#appObjectID").val(appId);
			
 }

$("#confirmDeleteAdpp").click(function(){
	//alert($("#appObjectID").val())
	$.ajax({
		type:'post',
		url:'deleteApp',
		data:{'appObjectID':$("#appObjectID").val()},
		success:function(appResult){
			console.log(appResult);
			if(appResult=="deletedSuccessfully"){
				 $('#confirmDeleteAdpp').attr('disabled','disabled');
				$('#deletedAppMsg').text('App deleted successfully.');
				// $('#editNewApp').attr('disabled','disabled');
			}
			else{
				$('#confirmDeleteAdpp').text('App deleted failed.');
			}
		},
		error:function(err){
			console.log(err)
		}
	})


});
$("#appDeleted").click(function(){
	$('#deletedAppMsg').text('');
	$("#deleteAppmodal").hide('modal');
	getAddedApps();
})

 

 /*add app after submit validation code starts*/
$('#editAppId').keypress(function (e) {
var regex = new RegExp("^[a-zA-Z0-9]+$");
var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	 if (regex.test(str)) {
		$("#appEditIdErr").empty();
	 	return true;
}
	 e.preventDefault();
	$("#appEditIdErr").text('Enter only Alphanumeric');
	 return false;
});


$("#editNewApp").click(function(){
	 $("#updatemsg").empty();
	var appEditId = $("#editAppId").val();
	var appEditName = $("#editAppName").val();
	var i=0;
	if(appEditId=="" || appEditId==null){
		$("#appEditIdErr").text('Enter app id.');
		i++;
	}
	else if(appEditId.length<3 || appEditId.length>9){
		$('#appEditIdErr').text("App id length must be 3 to 9.");
		 
		i++;
	}
	else{
		$("#appEditIdErr").empty();
	}
	if(appEditName=="" || appEditName==null){
		$("#appEditNameErr").text('Enter app name.');
		i++;
	}
	else{
		$("#appEditNameErr").empty();
	}
	if(i==0){
		$.ajax({
			type:'post',
			url:'updateApp',
			data:{"objectId":$("#editObjectId").val(),"editAppId":appEditId,"editAppName":appEditName},
			success:function(res){
				 if(res="success"){
				 $('#editNewApp').attr('disabled','disabled');
   				  $("#updatemsg").text("The app updated successfully.");
   				
   				  
			//	 $('#editNewApp').attr('disabled','disabled');
				 }
   				  else{
   				  $("#updateerr").text("Some error occurs.");  
   				  $("#updatemsg").empty();
   				  }
				
				//console.log(res)
			},
			error:function(err){
			//	console.log(err)
			}
		})
	}
})

$("#editsystemapps").click(function(){
	getAddedApps();
})

$('#addapp').click(function(){
		$("#msg").empty();
		$('#addNewApp').removeAttr('disabled');
		//$('#addNewApp').attr('enabled','enabled');
		//$('#addNewApp').removeAttr('disabled');
		//$("#addNewApp").attr("disabled", "disabled");
		$('#appName').val('');
		$('#appId').val('');
		$('#appName').empty();
		$('#appId').empty();
		$('#appNameErr').empty();
		$('#appExistErr').empty();
		$('#appIdErr').empty();		
		
	});

 /*add app after submit validation code starts*/
$('#appId').keypress(function (e) {
var regex = new RegExp("^[a-zA-Z0-9]+$");
var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	 if (regex.test(str)) {
		$("#appExistErr").empty();
	 	return true;
}
	 e.preventDefault();
	$("#appExistErr").text('Enter only Alphanumeric');
	 return false;
});
function addAppSubmitform()
{
	var appResult = 0;
	var id = $('#appId').val();
	var name = $('#appName').val();
	if(id == "" || id == null)
	{
		$('#appIdErr').text("App id is required.");
		 $("#appExistErr").empty();
		 appResult++;
	}
	else if(id.length<3 || id.length>9){
		$('#appExistErr').text("App id length must be 3 to 9.");
		 
		 appResult++;
	}
	else
	{
		$('#appNameErr').empty();     				
	}
	if(name == "" || name == null)
	{
		$('#appNameErr').text("App name is required.");
           	appResult++;
	}
	else
	{
		$('#appIdErr').empty();
		
	} 
	
	
	if(appResult == 0)
	{
		
		$(".gspin").show();
		$.ajax({
		      type: "POST",
		      url: "verifyApp",
		      async: true,
		      data : {"appId":id, "appName" : name},
		     
		      success :function(result) {
		    	  if(result == "duplicate")
		    	  {
		    		  $("#appExistErr").text("This app is already registered.");
		    		  $('#appNameErr').empty();
		    		  $('.gspin').hide();
		    		  appResult++;
		    	  }
		    	  else
		          {
		    		  $('#addNewApp').attr('disabled','disabled');
		    		  $('#addNewApp').attr('action','');
		    		  $("#appExistErr").empty();	
		    		  $('.gspin').hide();
		    		 // alert("hi");
		    		 // document.addApp.submit();
		    			
		    		  $.ajax({
		    			  type:'post',
		    			  url:'addApp',
		    			  data:{"appId":$("#appId").val(),"appName":$("#appName").val()},
		    			  success:function(res){
		    				  if(res="success"){
		    				  //console.log("HELLO: "+res)
		    				  $("#msg").text("The app added successfully.");
		    				  getAddedApps();
		    				  }
		    				  else{
		    				  $("#msg1").text("Some error occurs.");  
		    				  $("#msg").empty();
		    				  $('.gspin').hide();
		    				  
		    				  
		    				  }
		    	
		    			  },
		    			  error:function(err){
		    				  console.log(err)
		    			  }
		    		  })
		    		
		    		  
		    		  
		    		  appResult = 0;  
		          }
		    	 
		     },
		     error : function(error) {
		    	 console.log(error);
		    	
		     }
		  });
		
		
	}
}

function statusCheck(){
	var ckbox = $('#globalcheck');

    $('input').on('click',function () {
        if (ckbox.is(':checked')) {
        	$('input:checkbox[name=globalstatus]').attr('checked',true);
        } else {
        	$('input:checkbox[name=globalstatus]').attr('checked',false);
        }
    });
}

 /*add app after submit validation code ends 

Manage App functionality script code ended here*/