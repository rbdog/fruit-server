# lib
from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles
from starlette.middleware.cors import CORSMiddleware
import json
from datetime import datetime
# model
from db import session
from fruit import *
import db

FILE_PATH = Jinja2Templates(directory="static")
app = FastAPI()
app.mount("/static", StaticFiles(directory="static"))

# *** テストのためCORSを回避する ***
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)
# ******************************


# --- --- --- #
#   Routing   #
# --- --- --- #

@app.get("/hello")
async def hello(request: Request):
    print('Received Test Request')
    return '{"msg":"hello"}'
    
@app.get("/", response_class=HTMLResponse)
async def read_index(request: Request):
    print('Received GET Request to root')
    return FILE_PATH.TemplateResponse("index.html", {"request": request})
    
@app.get("/api/fruits")
def read_fruits():
    print('Received GET Request to fruits')
    fruits = session.query(Fruit).all()
    json_objects = []
    for fruits in fruits:
        json_objects.append(fruits.json_object())
    joind_json = ','.join(json_objects)
    wrapped_data = '{"data":{"fruits":[' + joind_json +']}}'
    return wrapped_data

@app.post("/api/fruits")
async def create_fruits(request: Request):
    print('Received POST Request to fruits')
    raw_body = await request.body()
    decoded_body = raw_body.decode('utf-8')
    dict_body = json.loads(decoded_body)
    name = dict_body['name']
    price = dict_body['price']
    fruits = Fruit(name, price, datetime.now(), datetime.now())
    session.add(fruits)
    session.commit()
    return '{"msg":"サーバー処理終了"}' # 成否判定はしていません

@app.patch("/api/fruits/{id}")
async def update_fruits(request: Request, id: int):
    print('Received PATCH Request to fruits with id')
    raw_body = await request.body()
    decoded_body = raw_body.decode('utf-8')
    dict_body = json.loads(decoded_body)
    fruits = session.query(Fruit).filter(Fruit.id==id).first()
    fruits.price = dict_body['price']
    fruits.updated_at = datetime.now()
    session.commit()
    return '{"msg":"サーバー処理終了"}'  # 成否判定はしていません

@app.delete("/api/fruits/{id}")
async def delete_fruits(request: Request, id: int):
    print('Received DELETE Request to fruits with id')
    session.query(Fruit).filter(Fruit.id==id).delete()
    session.commit()
    return '{"msg":"サーバー処理終了"}'  # 成否判定はしていません
