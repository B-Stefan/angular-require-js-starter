define(['socketio-lib','require'],function(re,global){
    console.log(this,re,global,document,window,window.io)
    if (typeof window.io != 'undefined'){
        return window.io
    }
    else {
        return re
    }
});
