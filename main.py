import os
import staypresent

# 提供一个健康检查接口，Render 会定期访问这个地址来判断服务是否正常
staypresent.web.json({"status": "running"})

# 设置自 ping，每 4 分钟访问一次自己的公网地址，防止 Render 休眠
# 请把下面的 URL 换成你部署后 Render 分配的真实地址
staypresent.cron("https://gura-bot.onrender.com", interval=240)

# 启动 bot.py，并让它监听 Render 分配的端口
staypresent.run(
    "bot.py",
    port=int(os.getenv("PORT", 8080)),
)