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
        sh "curl -s -X POST http://jws-app-jenkins-cicd.apps.cluster.test.com/index.jsp"
      },
      "Discount Tests": {
        sh "curl -s -X POST http://jws-app-jenkins-cicd.apps.cluster.test.com/failover.jsp"
      }
    )
  }
  stage('Build Image') {
    sh "oc start-build jws-app --from-file=target/ROOT.war -n jenkins-cicd --follow"
  }
 
//  stage('Deploy') {
//    sh "oc rollout latest dc/jws-app-jenkins-cicd -n jenkins"
//  }
 
 
  stage('System Test') {
    sh " sleep 30"
    sh "curl -s http://jws-app-jenkins-cicd.apps.cluster.test.com/index.jsp"
  }
}
