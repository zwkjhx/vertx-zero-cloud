#!/usr/bin/env bash
# The bash version must be > 4.x
<<comment
  3. 应用环境

comment
declare -A assets
assets=(
  ["admin"]="系统：平台管理"
  ["modulat"]="系统：模块化"
  ["tenant"]="系统：租户管理"
  ["istio"]="系统：环境连接"
)
declare -A atoms
atoms=(
  ["workflow"]="建模：工作流"
  ["emf"]="建模：EMF"
  ["authorize"]="建模：安全"
  ["integration"]="建模：集成"
  ["graphic"]="建模：拓扑图"
  ["tpl"]="建模：模板"
)
declare -A actions
actions=(
  ["job"]="行为：任务"
  ["api"]="行为：接口"
  ["lexeme"]="行为：智能语义"
  ["rule"]="行为：规则引擎"
)
declare -A aboves
aboves=(
  ["page"]="呈现：页面"
  ["form"]="呈现：表单"
  ["list"]="呈现：列表"
  ["event"]="呈现：事件"
)
# 系统
mkdir -p $1/asset
for asset in ${!assets[*]}
do
  mkdir -p $1/asset/$asset
  echo ${assets[$asset]} > $1/asset/$asset/README.txt
  echo "(${assets[$asset]}) initialized !"
done
# 建模
mkdir -p $1/atom
for atom in ${!atoms[*]}
do
  mkdir -p $1/atom/$atom
  echo ${atoms[$atom]} > $1/atom/$atom/README.txt
  echo "(${atoms[$atom]}) initialized !"
done
# 行为
mkdir -p $1/action
for action in ${!actions[*]}
do
  mkdir -p $1/action/$action
  echo ${actions[$action]} > $1/action/$action/README.txt
  echo "(${actions[$action]}) initialized !"
done
# 呈现
mkdir -p $1/above
for above in ${!aboves[*]}
do
  mkdir -p $1/above/$above
  echo ${aboves[$above]} > $1/above/$above/README.txt
  echo "(${aboves[$above]}) initialized !"
done