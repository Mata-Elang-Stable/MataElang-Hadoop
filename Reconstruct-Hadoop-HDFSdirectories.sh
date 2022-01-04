#!/bin/sh

#Reconstruct Hadoop-HDFS directories
#(1)Move directory to HOME
cd "${HOME}"

#(2)Ask to deleate and reconstruct files
read -p "Do you agree to delete and recreate the HDFS files? (y/n)" ans
case "$ans" in
  [Yy])
    echo "Yes"
    #Variable
    HADOOP_URL_PREFIX=hdfs://localhost:9000/user/${USER}
    #Delete directories
    hdfs dfs -rm -r ${HADOOP_URL_PREFIX}/job
    hdfs dfs -rm -r ${HADOOP_URL_PREFIX}/kaspa
    hdfs dfs -rm -r ${HADOOP_URL_PREFIX}/kafka-checkpoint
    hdfs dfs -rm -r ${HADOOP_URL_PREFIX}/kaspa-checkpoint
    hdfs dfs -rm -r ${HADOOP_URL_PREFIX}/schema/raw_kaspa
    #Reconstruct directries
    hdfs dfs -mkdir -p ${HADOOP_URL_PREFIX}/job
    hdfs dfs -mkdir -p ${HADOOP_URL_PREFIX}/kaspa
    hdfs dfs -mkdir -p ${HADOOP_URL_PREFIX}/kafka-checkpoint
    hdfs dfs -mkdir -p ${HADOOP_URL_PREFIX}/kaspa-checkpoint
    hdfs dfs -mkdir -p ${HADOOP_URL_PREFIX}/schema/raw_kaspa
    ;;
  [Nn])
    echo "NO"
    echo The process is canceled.
    ;;
  *)
    echo "undefined";;
esac

#(3) move directory
cd "${OLDPWD}"


