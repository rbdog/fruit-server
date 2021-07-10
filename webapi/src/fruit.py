# 使用する型
from sqlalchemy import Column, Integer, String, DateTime
# テーブルとの紐付けに使用するBaseオブジェクト
from db import Base

# Fruit モデル
class Fruit(Base):
    # テーブルと紐付ける
    __tablename__ = 'fruits'

    # id カラム
    id = Column(Integer, primary_key=True)
    # name カラム
    name = Column(String)
    # price カラム
    price = Column(Integer)
    # created_at カラム
    created_at = Column(DateTime)
    # updated_at カラム
    updated_at = Column(DateTime)
    
    # required
    def __init__(self, name, price, created_at, updated_at):
        self.name = name
        self.price = price
        self.created_at = created_at
        self.updated_at = updated_at

    # required
    def __str__(self):
        return 'id:{}, name:{}, price:{}, created_at:{}, updated_at:{}'.format(self.id, self.name, self.price, self.created_at, self.updated_at)
    
    def json_object(self):
        # 保存した日付のタイムゾーンは+00:00
        key_values = '"id":"{}", "name":"{}", "price":{}, "created_at":"{}+00:00", "updated_at":"{}+00:00"'.format(self.id, self.name, self.price, self.created_at, self.updated_at)
        object = "{" + key_values + "}"
        return object
