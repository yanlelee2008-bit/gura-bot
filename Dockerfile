FROM python:3.12-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    nodejs \
    npm \
    curl \
    unzip \
    git \
    && rm -rf /var/lib/apt/lists/* \
    && curl -fsSL https://deno.land/install.sh | sh

ENV PATH="/root/.deno/bin:${PATH}"

# 安装 bgutil PO Token 提供程序（全局）
RUN npm install -g bgutil-ytdlp-pot-provider

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# 先启动 PO Token 提供程序（后台，端口 4416），等它起来后再跑 bot
CMD ["sh", "-c", "node \"$(npm root -g)/bgutil-ytdlp-pot-provider/server/build/main.js\" --port 4416 & sleep 5 && python bot.py"]
