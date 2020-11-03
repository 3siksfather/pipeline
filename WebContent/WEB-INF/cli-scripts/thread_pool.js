importPackage(org.jboss.as.cli.scriptsupport)  
  
// for printing Date format yyyy-mm-dd HH:MM:SS
Date.prototype.format = function() {
   var yyyy = this.getFullYear().toString();
   var mm = (this.getMonth()+1).toString(); // getMonth() is zero-based
   var dd  = this.getDate().toString();
   var hh = this.getHours().toString();
    var MM = this.getMinutes().toString();
    var ss = this.getSeconds().toString();
   return yyyy + "-" + (mm[1]?mm:"0"+mm[0]) + "-" + (dd[1]?dd:"0"+dd[0]) + " " + (hh[1]?hh:"0"+hh[0]) + ":" + (MM[1]?MM:"0"+MM[0]) + ":" + (ss[1]?ss:"0"+ss[0]); // padding
  };

// for sleep of bash
function sleep(millis)
 {
  var date = new Date();
  var curDate = null;
  do { curDate = new Date(); }
  while(curDate-date < millis);
}


cli = CLI.newInstance()  
cli.connect("192.168.56.101", 9999, "admin", ['r','p','l','i','n','u','x','1','2','#'])  

THREAD_POOL="/subsystem=threads/unbounded-queue-thread-pool=http-thread-pool"

var time = 60 * 60 * 1  // 1 hour
for (i=0; i < time; i++){
  result = cli.cmd(THREAD_POOL + ":read-resource(include-runtime=true)")
  max_threads = result.getResponse().get("result").get("max-threads").asString() 
  active_count = result.getResponse().get("result").get("active-count").asString()
  current_thread_count = result.getResponse().get("result").get("current-thread-count").asString()
  largest_thread_count = result.getResponse().get("result").get("largest-thread-count").asString()

  print(new Date().format() + 
    " max-threads " + max_threads + 
    " current-thread-count " + current_thread_count +
    " active-count " + active_count + 
    " largest-thread-count " + largest_thread_count + 
    " "
  )
  
  sleep(1000)
}
  

cli.disconnect()
