with open("cookies.txt", "r", encoding="utf-8", newline="") as f:
    content = f.read()

# 把所有 CRLF 和 CR 统一转成 LF
content = content.replace("\r\n", "\n").replace("\r", "\n")

with open("cookies.txt", "w", encoding="utf-8", newline="\n") as f:
    f.write(content)

print("✅ 换行符已统一为 LF")
