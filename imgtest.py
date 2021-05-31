# 컨트롤러단에서 보낸거 받아서 detect,crop,classification해서 결과로 sql을 통해서 해당 cid들 반환
# import
import requests
import xmltodict
import json
from pprint import pprint
import pymysql

import urllib.request

from imageai.Detection import ObjectDetection
import glob
import cv2
import tensorflow.keras
from PIL import Image, ImageOps
import numpy as np
import requests
import os
import shutil

import sys

# 매개변수로 받은 파일경로
img_path = sys.argv[1]

#To detectset. detector에 모델 load 이걸 매번하면 검색이 너무 느려짐.
def detectsetting():
    print('hi~3')
    detector = ObjectDetection()
    detector.setModelTypeAsYOLOv3()
    detector.setModelPath("/home/wndvlf96/abandog/yolo.h5")
    detector.loadModel()
    custom_objects = detector.CustomObjects(dog=True)
    print('Cropsetting completed')
    return detector,custom_objects
def DetectCrop(input_image,detect_path,detector,custom_objects):
    #print('here1')
    detections = detector.detectCustomObjectsFromImage(custom_objects=custom_objects,
                                                       input_image=input_image,
                                                       output_image_path=detect_path,
                                                       minimum_percentage_probability=30)
                                                       #얘가 crop and 바운딩박스그려놓은걸 detected crop 저장 !!쓸데없음
    #print('here2')
    # 강아지 영역 detect
    box_point = tuple(detections[0]['box_points'])
    #print('here3')
    src = cv2.imread(input_image)
    crop_image = src[box_point[1]:box_point[3], box_point[0]:box_point[2]]
    #cv2.imwrite(crop_path, crop_image)
    pil_Image = Image.fromarray(crop_image)
    return pil_Image


detector, custom_objects=detectsetting()    #다른곳에서 detectsetting을 해줘야할듯.
model = tensorflow.keras.models.load_model('/home/wndvlf96/abandog/keras_model.h5')
np.set_printoptions(suppress=True)
flag = True
# detect & crop & classification
image = Image.open(img_path)
image.save('/home/wndvlf96/abandog/rec/test.jpg')
input_image='/home/wndvlf96/abandog/rec/test.jpg' #test1.jpg로 저장.
detect_path='/home/wndvlf96/abandog/recdetect/detect.jpg' #./Testdetect폴더 하위에 detect.jpg로 저장됨.
ans = []
try:
    cropped_img = DetectCrop(input_image, detect_path, detector, custom_objects)
    # classfication 진행
    data = np.ndarray(shape=(1, 224, 224, 3), dtype=np.float32)
    size = (224, 224)
    cropped_img = ImageOps.fit(cropped_img, size, Image.ANTIALIAS)
    image_array = np.asarray(cropped_img)
    normalized_image_array = (image_array.astype(np.float32) / 127.0) - 1
    data[0] = normalized_image_array
    prediction = model.predict(data)
    pred_label = np.argmax(prediction)
    # pred_label 값으로 sql문 준비
    conn = None
    cur = None
    sql=""
    # 메인 코드 
    conn = pymysql.connect(host='34.64.190.82', user='root', password='abandog', db='abandog_data', charset='utf8')
    # 접속정보
    cur = conn.cursor(pymysql.cursors.DictCursor)
    pred_label_str = str(pred_label)
    sql="SELECT * FROM dog WHERE protect='y' AND specials = %s;" % pred_label_str
    cur.execute(sql)
    rows=cur.fetchall()
    for i in range(len(rows)):
        ans.append(int(rows[i]['cid']))


except:
    flag = False    

# sql을 통해서 매개변수로 받은 경로를 통해서 ans에 img와 비슷한 유기견 가져와서 넣기

print("fromhere")
if flag:
    for i in ans:
        print(i)
else:
    print('error')