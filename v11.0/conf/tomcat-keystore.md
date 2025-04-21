#!/bin/bash
# Create a keystore and generate a key pair.
keytool -genkey -dname "cn=localhost, ou=TI, o=Tomcat, c=US" -alias tomcat -storepass changeit -keyalg RSA -keystore tomcat.keystore
# Create a request and save to keystore
keytool -certreq -keyalg RSA -storepass changeit -alias tomcat -file tomcat.csr -keystore tomcat.keystore
