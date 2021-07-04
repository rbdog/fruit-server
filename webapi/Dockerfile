FROM python:3-alpine

WORKDIR /webapi

# パッケージ一覧を保持
COPY requirements.txt .

# 起動後のコンテナ内でコマンドを実行
RUN apk update \
&& apk add postgresql-libs \
&& apk add --virtual .build-deps gcc musl-dev postgresql-dev \
&& apk add --no-cache build-base \
&& python3 -m pip install -r requirements.txt --no-cache-dir \
&& apk del build-base \
&& apk --purge del .build-deps \
&& apk --no-cache add postgresql-client 

# FastAPIを実行し8000ポートで待機
#COPY ./src/main.py .
CMD ["uvicorn", "main:app", "--reload", "--host", "0.0.0.0", "--port", "8000"]
