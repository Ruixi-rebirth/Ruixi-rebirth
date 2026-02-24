import json
import os
import sys
import argparse
from urllib.request import Request, urlopen

def fetch_data():
    query = """
    {
      user(login: "Ruixi-rebirth") {
        repositories(first: 100, isFork: false) {
          nodes {
            name
            languages(first: 100) {
              edges {
                node { name }
                size
              }
            }
          }
        }
      }
    }"""
    
    token = os.environ.get('TOKEN')
    if not token:
        print("错误: 请先设置 TOKEN 环境变量 (export TOKEN=your_token)")
        return None

    try:
        request = Request(
            "https://api.github.com/graphql",
            json.dumps({"query": query}).encode("ascii"),
            {"Authorization": f"token {token}"},
        )
        response = json.load(urlopen(request))
        if "errors" in response:
            print(f"GitHub API 错误: {response['errors']}")
            return None
        return response["data"]
    except Exception as e:
        print(f"连接失败: {e}")
        return None

def main():
    parser = argparse.ArgumentParser(
        description="查询 GitHub 仓库中特定编程语言的使用情况。",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""示例:
  python3 repo_lang_query.py          # 默认查询 Shell
  python3 repo_lang_query.py nix      # 查询 Nix
  python3 repo_lang_query.py python   # 查询 Python"""
    )
    parser.add_argument(
        "language", 
        nargs="?", 
        default="Shell", 
        help="要查询的编程语言名称 (默认为 Shell)"
    )
    
    args = parser.parse_args()
    target_lang = args.language
    
    data = fetch_data()
    if not data:
        return

    stats = []
    repos = data["user"]["repositories"]["nodes"]

    for repo in repos:
        name = repo["name"]
        lang_size = 0
        actual_name = ""
        for lang in repo["languages"]["edges"]:
            if lang["node"]["name"].lower() == target_lang.lower():
                lang_size = lang["size"]
                actual_name = lang["node"]["name"]
                break
        
        if lang_size > 0:
            stats.append((name, lang_size, actual_name))

    if not stats:
        print(f"未找到包含语言 '{target_lang}' 的仓库。")
        return

    # 按字节数降序排序
    stats.sort(key=lambda x: x[1], reverse=True)

    found_lang_name = stats[0][2]
    print(f"正在查询语言: {found_lang_name}")
    print(f"{'仓库名称':<35} | {'大小 (Bytes)':<15}")
    print("-" * 55)
    for name, size, _ in stats:
        print(f"{name:<35} | {size:<15,}")

if __name__ == "__main__":
    main()
