/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
var app = {
    // Application Constructor
initialize: function() {
    this.bindEvents();
},
    // Bind Event Listeners
    //
    // Bind any events that are required on startup. Common events are:
    // 'load', 'deviceready', 'offline', and 'online'.
bindEvents: function() {
    
    document.addEventListener('deviceready', this.onDeviceReady, false);
    document.addEventListener('resume', this.onResume, false);
    document.addEventListener("offline", onOffline, false);
    document.addEventListener("online", onOnline, false);
},
    // deviceready Event Handler
    //
    // The scope of 'this' is the event. In order to call the 'receivedEvent'
    // function, we must explicitly call 'app.receivedEvent(...);'
onDeviceReady: function() {
    
//    if (parseFloat(window.device.version) >6.0) {
//        document.body.style.marginTop = "20px";
//        
//       // StatusBar.overlaysWebView(false);
//    }
    app.receivedEvent('deviceready');
    ImgCache.init();
   
},
onResume: function() {
//    if (parseFloat(window.device.version) >6.0) {
//        document.body.style.marginTop = "20px";
//    }
    InitSession();
    //app.receivedEvent('resume');
    GetLatestReferringParams()
},
    // Update DOM on a Received Event
receivedEvent: function(id) {
 //  alert(id)
    var parentElement = document.getElementById(id);
    var listeningElement = parentElement.querySelector('.listening');
    var receivedElement = parentElement.querySelector('.received');
    
    listeningElement.setAttribute('style', 'display:none;');
    receivedElement.setAttribute('style', 'display:block;');
    
    console.log('Received Event: ' + id);
    SetDebug(true);
    InitSession();
}
};

app.initialize();
function DeepLinkHandler(data)
{
    localStorage.clear();
    if (data) {
        // alert('DeeplinkInitialize: ' + JSON.stringify(data));
        // alert(data.param);
        
        // alert(path)
         window.location=path;
        var hpath=data.param;
        var hid=data.id;
        
       // alert('path1')
        //alert(hid)
        if(hpath.constructor === Array){
            //alert("array");
          //  alert(path[1])
            path=hpath[1]+"?id="+hid
            window.location=path;
        }else{
            //alert("varaible")
            path=hpath+"?id="+hid
            //alert('path2')
            window.location=path;
        }
        
    } else {
        //alert('No data found');
        //alert('path3')
        window.location="home.html"
    }
}

function NonBranchLinkHandler(data)
{
    // localStorage.clear();
    if (data) {
        //alert('path4')
        //alert(JSON.stringify(data));
        
        var url=localStorage.getItem("url");
        
        if(url==undefined||url==""||url==null)
        {
          //  alert(url)
           // alert('path4-1')
            window.location = "home.html";
        }
        else
        {
            localStorage.clear();
            
            //alert('path4-2')
            window.location=url;
        }
        //alert('Non-branch link found: ' + JSON.stringify(data));
    }
}

function SetDebug(isEnabled)
{
    console.log('Trigger SetDebug()');
    
    Branch.setDebug(isEnabled);
    
    /* alert('Debug mode enabled'); */
}

function InitSession()
{
    console.log('Trigger InitSession()');
    
    Branch.initSession().then(function (res) {
                              
                              
                             // alert('InitResponse: ' + JSON.stringify(res));
                              var result=res.param;
                              var dirid=res.id;
                              
                              var resultparse=JSON.stringify(res)
                              if((resultparse=="")||(resultparse==undefined)||(result==undefined)||(result=="")){
                              
                              var lastHotelId=localStorage.getItem('parentid');
                              //alert("Last HotelId"+lastHotelId);
                              var Lid=JSON.parse(lastHotelId);
                              
                              //alert(Lid);
                              if((Lid!=undefined)||(Lid!=null)){
                              //alert("checked"+Lid);
                           //  window.location ="directories.html?id="+Lid
                              $('#myModal').modal('show');
                              $('#LastHotel').attr("href","directories.html?id="+Lid)
                              }else{
                               //alert('path5')
                              window.location = "home.html";
                              }
                              
                              }else{
                              // var result=res.param;
                              
                              if(result.constructor === Array){
                              //alert("array");
                              //alert(result[1])
                              dirpath=result[1]+"?id="+dirid;
                              //alert('path6')
                              window.location=dirpath;
                              }else{
                              //alert("varaible")
                              dirpath=result+"?id="+dirid;
                              //alert('path7'+dirpath)
                              localStorage.setItem("url",dirpath);
                              window.location=dirpath;
                              }
                              
                              
                              }
                              }).catch(function (err) {
                                       console.error(err);
                                      // alert("model 1")
                                       
                                       var lastHotelId=localStorage.getItem('parentid');
                                      // alert("Last HotelId"+lastHotelId);
                                       var Lid=JSON.parse(lastHotelId);
                                       
                                       if((Lid!=undefined)||(Lid!=null)){
                                      // alert("model 2")
                                       // alert("catch checked"+Lid);
                                  //  window.location ="directories.html?id="+Lid
                                       $('#myModal').modal('show');
                                       $('#LastHotel').attr("href","directories.html?id="+Lid)
                                       }else{
                                       //alert('path8')
                                       window.location = "home.html";
                                       } 
                                       /* window.location = "home.html"; */
                                       //alert('Error: ' + JSON.stringify(err));
                                       });
}

function CustomAction()
{
    // alert('Trigger CustomAction()');
    
    var action = document.getElementById('custom-action').value;
    
    Branch.userCompletedAction(action).then(function (res) {
                                            console.log(res);
                                            // alert('ResponseCompleted: ' + JSON.stringify(res));
                                            }).catch(function (err) {
                                                     console.error(err);
                                                     // alert('Error: ' + JSON.stringify(err));
                                                     });
}


function GetLatestReferringParams()
{
    //alert('Trigger GetLatestReferringParams()');
    
    Branch.getLatestReferringParams().then(function (res) {
                                           console.log(res);
                                           // alert('ResponseLatest: ' + JSON.stringify(res));
                                           var path=res.param;
                                           //alert("latest:"+path);
                                           if((path=="")||(path==undefined)){
                                         //  alert("NoPath")
                                           console.log("no path for redirecting")
                                           }else{
                                           //
                                           //alert('path9')
                                           $('#myModal').modal('show');
                                           $('#LastHotel').attr("href","directories.html?id="+Lid)
                                          // window.location=path;
                                           }
                                           
                                           }).catch(function (err) {
                                                    console.error(err);
                                             //       alert('refferError: ' + JSON.stringify(err));
                                                    });
}
function GetCurrentReferringParams()
{
    //alert('Trigger GetCurrentReferringParams()');
    
    Branch.getCurrentReferringParams().then(function (res) {
                                            console.log(res);
                                            //alert('ResponseCurrent: ' + JSON.stringify(res));
                                            }).catch(function (err) {
                                                     console.error(err);
                                                     // alert('Error: ' + JSON.stringify(err));
                                                     });
}
var checkonline,onOffline;
function onOnline() {
//    if (parseFloat(window.device.version) >6.0) {
//        document.body.style.marginTop = "20px";
//    }
    // Handle the online event
    var networkState = navigator.connection.type;
    //console.log(networkState)
    //alert("online:"+networkState);
    checkonline=100;
    
    
}
function onOffline() {
//    if (parseFloat(window.device.version) >6.0) {
//        document.body.style.marginTop = "20px";
//    }
    
    // Handle the offline event
    var networkState = navigator.connection.type;
    // console.log("lost connection");
    //alert("offline:"+networkState);
    /* checkOffline=200; */
    
    
} 
