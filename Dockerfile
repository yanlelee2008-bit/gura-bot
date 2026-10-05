FROM python:3.12-slim

# 安装必要的系统依赖
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

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# 在后台启动 POT 服务，然后启动 bot
CMD ["sh", "-c", "npx -y bgutil-ytdlp-pot-provider --port 4416 & sleep 5 && python bot.py"]
