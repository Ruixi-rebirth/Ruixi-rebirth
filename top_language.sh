#!/bin/bash

# 构造GitHub API URL
URL="https://api.github.com/users/Ruixi-rebirth/repos?per_page=1000"

# 数组用于存储所有仓库的主要编程语言
declare -A languages

# 请求API，每次请求获取100个仓库的信息
i=1
while [[ true ]]
do
    # 请求API
    response=$(curl -s "$URL&page=$i")

    # 检查响应中是否还有更多的仓库需要获取
    if [[ $(echo "$response" | jq '. | length') -eq 0 ]]
    then
        break
    fi

    # 获取每个仓库的主要编程语言并添加到数组中
    for language in $(echo "$response" | jq -r '.[].language')
    do
        if [[ $language != "null" ]]
        then
            languages[$language]=$((languages[$language]+1))
        fi
    done
    # 检查响应中是否还有更多的仓库需要获取
    if [[ $(echo "$response" | jq '. | length') -lt 100 ]]
    then
        break
    fi

    # 更新URL以获取下一页的仓库信息
    i=$((i+1))
done

# 计算出每个语言的百分比并输出结果
total=0
for language in "${!languages[@]}"
do
    total=$((total + ${languages[$language]}))
done

# 输出Markdown表格
# 将结果按百分比降序排列
printf '%s\n' "${!languages[@]}" | while read -r language; do
    percentage=$(echo "scale=2; ${languages[$language]} / $total * 100" | bc)
    echo "$percentage% $language"
done | sort -rn | awk '{print "| "$2" | "$1" |"}' | sed '1i| 语言 | 百分比 |' | column -t
