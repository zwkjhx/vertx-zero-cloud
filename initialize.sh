#!/usr/bin/env bash
# The bash version must be > 4.x
<<comment
  1. 基础环境：environment
      kmini:    本地Minicube开发环境
      k8s:      远程Minicube开发测试环境（单点）
      kmt:      预发布压力测试环境（单点/集群）
      ki:       远程生产标准环境（单点/集群）
      kiha:     远程HA高可用环境（单点/集群）
comment
mkdir -p environment
declare -A envs
envs=(
  ["kmini"]="本地Minicube开发环境"
  ["k8s"]="远程Minicube开发测试环境（单点）"
  ["kmt"]="预发布压力测试环境（单点/集群）"
  ["ki"]="远程生产标准环境（单点/集群）"
  ["kiha"]="远程HA高可用环境（单点/集群）"
)
declare -A plugins
plugins=(
  ["istio"]="Kernel Mesh: Istio K8s"
  ["mysql"]="Database: MySQL"
  ["tidb"]="Database: TiDb"
  ["neo4j"]="Database: Neo4j"
  ["redis"]="Cache: Redis"
  ["es"]="Elastic Search"
  ["elk"]="ELK Logging System"
  ["hcp"]="HCP Vault Sensitive"
  ["kafka"]="Kafka"
  ["zipkin"]="Monitor: Zipkin"
  ["pts"]="Monitor: Prometheus"
  ["cloud"]="Cloud: Zero Cloud"
)
for name in ${!envs[*]}
do
  # 主目录
  echo "---------- Begin: $name ----------"
  mkdir -p environment/$name
  echo ${envs[$name]} > environment/$name/README.txt
  for plugin in ${!plugins[*]}
  do
    # 每个目录
    mkdir -p environment/$name/$plugin
    echo ${plugins[$plugin]} > environment/$name/$plugin/README.txt
    echo "${plugin} 插件初始化完成 !"
  done
  mkdir -p environment/$name
  echo "---------- End: $name ----------"
  echo "    "
done

<<comment
  2. 平台环境：platform
      cn: 中文    / en: 英文
      kidd: 生产  / kinect: 开发  / kzero: 出厂设置
comment
declare -A langs
langs=(
  ["cn"]="中文"
  ["en"]="英文"
  ["jp"]="日文"
)
declare -A platforms
platforms=(
  ["kidd"]="Zero Cloud生产环境"
  ["kinect"]="Zero Cloud开发环境"
  ["kzero"]="Zero Cloud出厂设置"
)
mkdir -p platform
for lang in ${!langs[*]}
do
  # 语言主目录
  mkdir -p platform/$lang
  # 环境目录
  for platform in ${!platforms[*]}
  do
    # 三种环境初始化
    mkdir -p platform/$lang/$platform
    echo ${platforms[$platform]} > platform/$lang/$platform/README.txt
    echo "(${langs[$lang]})${platforms[$platform]} initialized !"
  done
done