FROM nikolaik/python-nodejs:python3.10-nodejs20

# تثبيت ffmpeg وffprobe وأي مكتبات Linux إضافية
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg curl wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# نسخ كل ملفات البوت
COPY . .

# تثبيت مكتبات Python المطلوبة
RUN pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir --upgrade -r requirements.txt

# تشغيل البوت
CMD bash start
