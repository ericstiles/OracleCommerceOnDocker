#ATG Environment Running On Docker

# Current Status

* Endeca 3.1.1 install works
* Endeca 3.1.2 install works
* JBoss eap 5.1.2 install works
* ATG install is in progress
* docker-compose is in progress

# Goals

A quick and repeatable install for development or testing purposes that can be quickly stood up using docker-compose.

# Docker

Docker is....  A container, not a VM

# Components

For those with access the Oracle files can be downloaded from https://edelivery.oracle.com.  The jdbc driver is available through http://oracle.com.

I don't have a location to get the JBoss files other than http://redhat.com.

## Application Server

JBoss EAP 5.1.2 is used.

## ATG / Oracle Commerce

The ATG install will use the images that has JBoss installed on it.

The oracle jdbc driver (ojdbc6.jar) is also installed from the tools/ folder.

## Endeca

Dockerfiles are provided for 3.1.1 and 3.1.2.  I'm in the processing of writing a file for 11.1

## Database

I'm using an existing image of xe

# Install Information

## JBoss EAP 5.1.2

The expected file name and location for the jboss file you will need to provide

* tools/jboss-eap-5.1.2.zip

## Oracle Commerce

Using ATG(Commerce) 10.1.2 built on top of the jboss created image.

You will need to provide the necessary zip files provided by Oracle.  The ATG files are
* V35852-01.zip

## Endeca

You will need to provide the Endeca files.  

* The Endeca version being installed in from media pack 3.1.1:
 * MDEX 6.4.0
 * Platform Services 6.1.3
 * Tools And Frameworks 3.1.1
 * CAS 3.1.1
 * Experience Manager
 * Relevancy Ranking

* The Endeca version being installed in from media pack 3.1.2:
 * MDEX 6.4.1.2
 * Platform Services 6.1.4
 * Tools And Frameworks 3.1.2
 * CAS 3.1.2.1
 * Experience Manager
 * Relevancy Ranking

### Endeca 3.1.1 

* The files needed for the 3.1.1 install are
 * V31171-01.zip
 * V33316-01.zip
 * V35739-01.zip
 * V35740-01.zip
 * V35742-01.zip
 * V35744-01.zip

By default the Endeca install is under /appl/endeca/.  

Copy the necessary Oracle supplied zip files to the /tools folder.

Run the build-endeca-3.1.2.sh shell script:

```
docker run -d -p 2222:22  -p 8006:8006 -p 8888:8888 -p 15000:15000 -p 15002:15002 -p 15010:15010 --name endeca-3.1.1 ets04uga/endeca:3.1.1
```

### Endeca 3.1.2 

The install for 3.1.2 is more flexible than the 3.1.1 install. Environment variables are set at the beginning for flexibility. By default the install location is /opt/endeca

* The files needed for the 3.1.2 install are
 * V37716-01.zip
 * V40311-01.zip
 * V40319-01.zip
 * V40324-01.zip

Copy the necessary Oracle supplied zip files to the /tools folder.

Run the build-endeca-3.1.2.sh shell script:

```
docker run -d -p 2222:22  -p 8006:8006 -p 8888:8888 -p 15000:15000 -p 15002:15002 -p 15010:15010 --name endeca-3.1.2 ets04uga/endeca:3.1.2
```

## XE Database

See the README notes on the xe database in the xe folder.  I'm using an existing image.

# Docker Compose

There is a docker compose file that will start the following three images.  I am still in the process of getting these integrated as a fully tested solution.
* storefront
* search
* database

# Various

The following is still in draft.

# Install Discover App in Endeca

By default the build script installs the reference app

./apps/Discover/config/ifcr/configuration/tools/preview.json
./apps/Discover/config/script/WorkbenchConfig.xml
./apps/Discover/config/script/DataIngest.xml
./apps/Discover/config/script/LiveDgraphCluster.xml
./apps/Discover/config/script/ReportGeneration.xml
./apps/Discover/config/script/AuthoringDgraphCluster.xml
./apps/Discover/config/script/AppConfig.xml
./apps/Discover/config/editors_config/editors.xml
./apps/Discover/config/editors_config/services/dataservice.json
./apps/Discover/config/editors_config/services/endecaBrowserService.json
./apps/Discover/control/set_templates.sh
./apps/Discover/control/get_templates.sh


