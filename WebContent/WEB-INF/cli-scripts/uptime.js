importPackage(org.jboss.as.cli.scriptsupport)  
  
cli = CLI.newInstance()  
cli.connect("192.168.56.101", 9999, "admin", ['r','p','l','i','n','u','x','1','2','#'])  
  
if (cli.getCommandContext().isDomainMode()) {  
  cli.cmd("cd /host=master/core-service=platform-mbean/type=runtime")  
} else {  
  cli.cmd("cd /core-service=platform-mbean/type=runtime")  
}  
  
result = cli.cmd(":read-attribute(name=start-time)")  
response = result.getResponse()  
startTime = response.get("result").asLong()  
  
result = cli.cmd(":read-attribute(name=uptime)")  
response = result.getResponse()  
serveruptime = response.get("result").asString()  
  
print()  
print("The server was started on " + new Date(startTime))  
print("It has been running for " + serveruptime + "ms")  
  
cli.disconnect()  
