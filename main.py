import os
import threading
from keep_alive_ping import create_service
from flask import Flask

app = Flask(__name__)

@app.route("/")
def health():
    return {"status": "running"}

def run_bot():
    os.system("python bot.py")

if __name__ == "__main__":
    service = create_service(port=10000)
    bot_thread = threading.Thread(target=run_bot, daemon=True)
    bot_thread.start()
    port = int(os.getenv("PORT", 8080))
    app.run(host="0.0.0.0", port=port)