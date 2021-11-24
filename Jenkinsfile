node('maven') {
  stage('Maven Build') {
    sh " oc whoami"
    sh " pwd ; id;"
    git url: "http://github.com/3siksfather/pipeline.git"
    sh "cp configuration/settings.xml ~/.m2/"
    sh "mvn package"
    sh "ls  *"
  }
  stage('Test') {
    parallel(
      "Cart Tests": {
        sh "curl -s -X POST http://jws-app-pipeline.apps.cluster.test.com/index.jsp"
      },
      "Discount Tests": {
        sh "curl -s -X POST http://jws-app-pipeline.apps.cluster.test.com/failover.jsp"
      }
    )
  }
  stage('Build Image') {
    sh "oc start-build jws-app-pipeline --from-file=target/ROOT.war --follow"
  }
 
//  stage('Deploy') {
//    sh "oc rollout latest dc/jws-app-pipeline -n jenkins"
//  }
 
 
  stage('System Test') {
    sh " sleep 30"
    sh "curl -s http://jws-app-pipeline.apps.cluster.test.com/index.jsp"
  }
}
