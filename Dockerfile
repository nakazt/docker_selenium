FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    wget \
    curl \
    unzip \
    xvfb \
    libxi6 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxrandr2 \
    libatk1.0-0 \
    libcups2 \
    libdrm2 \
    libxss1 \
    libgbm1 \
    chromium-browser \
    chromium-chromedriver \
    libglib2.0-0 \
    libappindicator3-1 \
    libatk-bridge2.0-0 \
    libasound2 \
    libdbus-1-3 \
    libgdk-pixbuf2.0-0 \
    libnspr4

# install selenium
RUN python3 -m venv /app/venv && \
    /app/venv/bin/pip install --upgrade pip && \
    /app/venv/bin/pip install selenium

COPY selenium_on_docker.py /app/selenium_on_docker.py

# Chrome headless mode
ENV DISPLAY=:99

CMD ["sh", "-c", "Xvfb :99 -screen 0 1920x1080x24 & /app/venv/bin/python /app/selenium_on_docker.py"]
