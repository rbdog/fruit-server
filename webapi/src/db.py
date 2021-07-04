from sqlalchemy import *
from sqlalchemy.orm import *
from sqlalchemy.ext.declarative import declarative_base

# データベース設定
# --- --- --- --- --- 
DATABASE = 'postgresql' # データベース は PostgreSQL
USER = 'user' # ユーザー名
PASSWORD = 'password' # パスワード
HOST = 'db' # ホスト ~= Docker の コンテナ名
PORT = '5432' # ポート = PostgreSQL では 一般的に 5432
DB_NAME = 'fruitdb' # データベース名
# --- --- --- --- --- 
CONNECT_STR = '{}://{}:{}@{}:{}/{}'.format(DATABASE, USER, PASSWORD, HOST, PORT, DB_NAME)

# ENGINE
ENGINE = create_engine(
    CONNECT_STR,
    encoding = "utf-8",
    echo=True # 実行のたびにSQLを出力: True  
)

# session
session = scoped_session(
  # ORM実行時の設定
    sessionmaker(
        autocommit = False, # 自動コミット: False
        autoflush = False, # 自動反映: False
        bind = ENGINE
    )
)

# model紐付け用のBaseオブジェクト
Base = declarative_base()
Base.query = session.query_property()
