importPackage(org.jboss.as.cli.scriptsupport)  
  
Date.prototype.format = function() {
   var yyyy = this.getFullYear().toString();
   var mm = (this.getMonth()+1).toString(); // getMonth() is zero-based
   var dd  = this.getDate().toString();
   var hh = this.getHours().toString();
    var MM = this.getMinutes().toString();
    var ss = this.getSeconds().toString();
   return yyyy + "-" + (mm[1]?mm:"0"+mm[0]) + "-" + (dd[1]?dd:"0"+dd[0]) + " " + (hh[1]?hh:"0"+hh[0]) + ":" + (MM[1]?MM:"0"+MM[0]) + ":" + (ss[1]?ss:"0"+ss[0]); // padding
  };

function sleep(millis)
 {
  var date = new Date();
  var curDate = null;
  do { curDate = new Date(); }
  while(curDate-date < millis);
}


cli = CLI.newInstance()  
cli.connect("192.168.56.101", 9999, "admin", ['r','p','l','i','n','u','x','1','2','#'])  

DATA_SOURCE="/subsystem=datasources/data-source=mysql5"

time = 60 * 60 * 1  // 1hour
for (i=1; i < time; i++){
  result = cli.cmd(DATA_SOURCE + ":read-resource(include-runtime=true)")
  max_pool_size = result.getResponse().get("result").get("max-pool-size").asString() 
  min_pool_size = result.getResponse().get("result").get("min-pool-size").asString() 

  result = cli.cmd(DATA_SOURCE + "/statistics=pool:read-resource(include-runtime=true)")
  ActiveCount = result.getResponse().get("result").get("ActiveCount").asString()
  InUseCount = result.getResponse().get("result").get("InUseCount").asString()
  MaxUsedCount = result.getResponse().get("result").get("MaxUsedCount").asString()

  print(new Date().format() + 
    " min-pool-size " + min_pool_size + 
    " max-pool-size " + max_pool_size + 
    " ActiveCount " + ActiveCount +
    " InUseCount " + InUseCount + 
    " MaxUsedCount " + MaxUsedCount + 
    " "
  )
  
  sleep(1000)
}
  

cli.disconnect()
