# Zero Cloud

## 1. 环境目录

> `development`为开发目录，无规范。
> 开发环境参考：[引用](LINKS.md)

### 1.1. 环境分类

每个环境目录包含四个核心目录：

| 目录名     | 类型     | 说明              |
|---------|--------|-----------------|
| `kmini` | 开发     | 本地Minikube开发环境。 |
| `k8s`   | 开发/测试  |远程Minikube开发测试环境（单节点）。|
| `kmt`| 压测| 预发布压力测试专用环境（单节点 / 集群）。|
| `ki`    | 生产     |远程标准环境（单节点 / 集群）。|
| `kiha`  | 生产/高可用 |远程HA环境（集群）。|

### 1.2. 基础环境

* 目录：`environment`

| 项          | 说明                    |
|:-----------|-----------------------|
| `/istio/*` | Istio启动脚本。            |
| `/mysql/*` | MySQL部署脚本/配置。         |
| `/neo4j/*` | Neo4J部署脚本/配置。         |
| `/redis/*` | Redis部署脚本/配置。         |
|`/es/*`| ElasticSearch部署脚本/配置。 |
|`/elk/*`| ELK日志平台部署脚本/配置。|
|`/hcp/*`| HCP Vault部署脚本/配置。|
|`/kafka/*`| Kafka部署脚本/配置。|
|`/zipkin/*`| Zipkin部署脚本/配置。|
|`/pts/*`|Prometheus部署脚本/配置。|
|`/cloud/*`| Zero Cloud部署脚本/配置。|

> `etcd`是K8S自带，所以此处不考虑etcd的启动和部署脚本，以上环境是目前可以直接和zero执行集成的核心环境，大部分内容zero-framework中已提供了集成客户端以及相关代码。

## 2. 平台/应用目录

### 2.1. 环境分类

| 项        | 类型  | 说明                        |
|----------|-----|---------------------------|
| `kzero`  | 出厂  | 平台基础默认环境。                 |
| `kidd`   | 运行 | 不下线的云端运行环境，kzero冗余镜像。     |
| `kinect` | 测试/预发布 | 从`kzero -> kidd`的预发布验证环境。 |

1. `kzero`为静态环境，环境中不包含相关配置，云端部署和发布时，会直接以此目录中的所有配置信息为基版本。
2. `kidd/kinect`为运行环境，其中会包含整套配置信息，基于平台目录相关配置都存储于该目录中。

### 2.2. 平台目录

* 目录
    * 「生产」`platform/kidd`
    * 「开发」`platform/kinect`（仅限平台开发）

#### 2.2.1. 配置文件

|项|说明|
|---|---|
|zcloud.yml|平台连接配置目录。|
|zcloud-plugin.yml|插件启用配置，可配置`environment`中所需部署脚本。|
|zcloud-axis.yml|开发专用配置，配置低代码平台。|
|zcloud-modulat.yml|模块化专用配置文件。|

#### 2.2.2. 配置目录

|项|说明|
|---|---|
|asset/admin|「OOB」平台共享管理目录。|
|asset/modulat|「OOB」模块化专用目录。|
|asset/tenant|「OOB」租户专用目录。|
|asset/istio|「OOB」K8S连接配置专用目录。|
|atom/workflow|「OOB」工作流引擎专用配置目录。|
|atom/emf|「OOB」模型专用配置目录（基于EMF）。|
|atom/authorize|「OOB」权限管理配置专用目录。|
|atom/integration|「OOB」集成服务配置专用目录。|
|atom/graphic|「OOB」拓扑图配置专用目录。|
|atom/tpl|「OOB」模板系统配置专用目录。|
|action/job|「OOB」操作执行任务定义。|
|action/api|「OOB」操作执行接口定义。|
|action/lexeme|「OOB」操作执行语义转换定义。|
|action/rule|「OOB」操作执行规则定义。|
|above/page|「OOB」呈现配置页面。|
|above/form|「OOB」呈现配置表单。|
|above/list|「OOB」呈现配置列表。|
|above/event|「OOB」呈现行为配置目录。|

### 2.3. 应用目录

* 目录
    * 「开发」`apps/xx/kidd`
    * 「生产」`apps/xx/kinect`

#### 2.3.1. 配置文件

|项|说明|
|---|---|
|zapp.yml|应用配置核心目录。|
|zapp-plugin.yml|应用使用插件专用配置。|
|zapp-axis.yml|应用开发专用配置。|
|zapp-modulat.yml|应用模块化专用配置文件。|
|zapp-up.yml|和平台对接的核心配置文件。|
|zapp-down.yml|子系统专用配置文件。|

#### 2.2.2. 配置目录

> 应用配置主要以核心镜像为主，所有核心配置中存在的内容都会在应用配置中有所反应，其运行时连接的配置目录和开发时连接的配置目录需实现无缝切换，并且在容器本体中实现自动化部署。

| 项      |说明|
|--------|---|
| kzero  |对应平台目录结构，如果有改动以应用目录为主体目录。|
| kidd   |（开发专用目录）和平台目录结构维持一致。|
| kinect |和平台目录结构维持一致，应用生产配置。|

#### 2.2.3. 环境变量

| 类型       | 名称                | 说明                     |
|----------|-------------------|------------------------|
| Zero App | `ZC_NS`           | 应用APP的名空间。             |
| Zero App | `ZC_APP`          | 应用APP核心配置文件路径。         |
| Zero App | `ZC_MODE`         | 应用APP发布模式，五种**环境目录**选一种。       |
| Zero App | `ZC_LANG`         | 应用APP的语言，保留，三选一，默认cn。|
| TiDB     | `ZC_TIDB_CLUSTER` | TiDB集群名称。              |
| TiDB     | `ZC_TIDB_NAME`    | TiDB部署到K8S的名称。         |
| TiDB     | `ZC_TIDB_STORE`   | TiDB挂载的存储数据文件的路径（物理路径。 |

## 3. 应用业务目录

> 应用业务目录主要位于应用下的`kis`目录，主要用于应用运行过程中的单体集成，兼容本地环境和云端环境。

## 4. 总结

整体拓扑图参考官方网站链接，此处就不做多余说明。