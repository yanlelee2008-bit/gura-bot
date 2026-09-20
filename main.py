import os
import staypresent

staypresent.web.json({"status": "running"})

# 部署后把网址换成 Render 给你的真实网址
staypresent.cron("https://gura-bot.onrender.com", interval=240)

staypresent.run(
    "bot.py",
    port=int(os.getenv("PORT", 8080)),
)