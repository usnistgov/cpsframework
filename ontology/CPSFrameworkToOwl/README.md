# NIST use of xsd2owl and ontomalizer
This software, under Apache License 2.0 is being modified for use in a National Institute of Standards and Technology project:
	[https://github.com/usnistgov/cpsframework](https://github.com/usnistgov/cpsframework "NIST CPSFramework Github Project")

NIST values the contributions of the authors.

Since these projects are modified for local purposes, they were not forked from the originals and just modified as is. The versions used were:

ontmalizer: commit 2dcaa705648acefab181a1026e6ec5f3b6ab9f04

xsd2owl: commit 166c6c609433108e013787477266796c7e37a2d3


# xsd2owl
A tool for generating OWL from XSD and XML.

# Introduction
This tool is used in Mudrod to generate an OWL manifestation of the 
[Directory Interchange Format (DIF) Standard](https://earthdata.nasa.gov/standards/directory-interchange-format-dif-standard), 
a specific set of attributes for describing Earth science data. 
From its conception in the late 1980’s as a way to document and exchange information on scientific data 
to its implementation in the Global Change Master Directory (GCMD), the DIF has evolved to serve the 
user community in the discovery, access and use of Earth science and related data.

# Requirements
 * Java8
 
# Installation
You must first install [Ontmalizer](https://github.com/srdc/ontmalizer.git) as it is not yet available in Maven Central.
```
$ git clone https://github.com/srdc/ontmalizer.git && cd ontmalizer
$ mvn clean install
```
You can then install xsd2owl as follows
```
$ git clone https://github.com/mudrod/xsd2owl.git && cd xsd2owl
$ mvn clean install
```

# Usage

The tool does not need to be invoked with any input parameters. By default it will
look on the classpath for the [dif_v10.2.xsd](https://github.com/mudrod/xsd2owl/blob/master/src/main/resources/dif_v10.2.xsd)
file which is the XSD manifestation of the DIF as mentioned above.

If however you wish to use a different file, you should invoke the tool with the parameter as below

```
$ java -jar target/xsd2owl-0.0.1-SNAPSHOT-jar-with-dependencies.jar -h
usage: Mapper
    --inputFile <file>   A path to a local XSD file.
```

# License
xsd2owl is licensed permissively under the [Apache License v2.0](https://www.apache.org/licenses/LICENSE-2.0) 
a copy of which is shipped with this source code.
