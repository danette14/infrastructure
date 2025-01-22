#!groovy
//Create an admin user if not exists
import jenkins.model.*
import hudson.security.*
import hudson.model.User

def instance = Jenkins.getInstance()
def realm = new HudsonPrivateSecurityRealm(false)
instance.setSecurityRealm(realm)
def strategy = new GlobalMatrixAuthorizationStrategy()
instance.setAuthorizationStrategy(strategy)


def user = User.get('admin', false)

if (user == null) {
    println "Creating admin user..."
    user = User.createUser('admin', null)
    user.setFullName('Admin')
    user.setPassword('123456')  
    user.save()
} else {
    println "Admin user already exists, skipping creation."
}

instance.save()
