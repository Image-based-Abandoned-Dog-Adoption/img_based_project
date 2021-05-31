# 매일 업데이트 되기 위해 실행되는 것

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

#To detectset. detector에 모델 load 이걸 매번하면 검색이 너무 느려짐.
def detectsetting():
    print('hi~3')
    detector = ObjectDetection()
    # detector.setModelTypeAsYOLOv3()
    # detector.setModelPath("./yolo.h5")
    detector.setModelTypeAsYOLOv3()
    detector.setModelPath("/home/wndvlf96/abandog/yolo.h5")
#    detector.setModelTypeAsRetinaNet()
#    detector.setModelPath('./resnet50_coco_best_v2.1.0.h5')
#    detector.setModelTypeAsRetinaNet()
#    detector.setModelPath("./yolo.h5")
#    detector.setModelPath('./resnet50_coco_best_v2.1.0.h5')
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
    # detect 영역 저장


# API에서 데이터 가져오기
url = 'http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic'
params = {
    'serviceKey' : 'Rus9dDKGLW82fx3Pa1TAdg03ZE6Z0NjE1bHto1KZyzscvcHAFnwl3K4ImVdgj50R3b6Vgkce/v4oEuNg0y0QAg==',
    'upkind' : '417000',
    'state' : 'protect',
    'pageNo' : '1',
    'numOfRows':'10000'
}
res = requests.get(url, params=params)
#print(res.text)

# xml -> dict
dict_data = xmltodict.parse(res.text)

# dict -> json
json_data = json.dumps(dict_data)

# json -> dict
dict_data = json.loads(json_data)

# DB와 비교 후 1차 updt
conn = None
cur = None
sql=""
# 메인 코드 
conn = pymysql.connect(host='34.64.190.82', user='root', password='abandog', db='abandog_data', charset='utf8')
# 접속정보
cur = conn.cursor(pymysql.cursors.DictCursor)
# 커서생성
# 모든 컬럼 N인거 지울까말까 -> 마이페이지와 얘기해보기
# 모든 protect 컬럼 N으로 만들기
sql = 'UPDATE `dog` SET protect = %s'
cur.execute(sql, 'n')
conn.commit()
for i in range(len(dict_data['response']['body']['items']['item'])):
    # popfile을 통해서 사진하나하나의 특징벡터 얻기!
    dict_data['response']['body']['items']['item'][i]['happenDt'] = "123"
# 하나하나 보며 insert할지 updt할지 결정
sql = "INSERT INTO `dog` (age, careAddr, careNm, careTel, color, img, kind, sex, neuter, specials, marks) VALUES (%(age)s, %(careAddr)s, %(careNm)s, %(careTel)s, %(colorCd)s, %(popfile)s, %(kindCd)s, %(sexCd)s, %(neuterYn)s, %(happenDt)s, %(specialMark)s) ON DUPLICATE KEY UPDATE `protect` = 'y';"
cur.executemany(sql, dict_data['response']['body']['items']['item'])
conn.commit()
conn.close()


# DB에서 아직 분류 안 된것 가져오기 (protect가 y이며, specials 컬럼이 123인것들)
#def receive_Serverimage():
conn = None
cur = None
sql="SELECT * FROM dog WHERE protect='y' AND specials = '123';"
# 메인 코드
conn = pymysql.connect(host='34.64.190.82', user='root', password='abandog', db='abandog_data', charset='utf8')
# 접속정보
cur = conn.cursor(pymysql.cursors.DictCursor)
# 커서생성
cur.execute(sql)
#{'age': '2020(년생)', 'careAddr': '경상북도 울진군 울진읍 대흥신림로 916-37 [*미고시]',
# 'careNm': '울진군동물보호센터', 'careTel': '054-789-6795', 'color': '흰색',
# 'img': 'http://www.animal.go.kr/files/shelter/2021/04/202104151004472.jpg',
# 'kind': '[개] 믹스견', 'sex': 'M', 'neuter': 'N', 'cid': 2441, 'protect': 'y', 'specials': None, 'marks': None}

rows=cur.fetchall()
    #print(rows[0]['cid'])
    
    #print(rows[0])
    #Image_Urllist=[]
    #for info in rows:
    #    Image_Urllist.append((info['img'],info['cid']))
    
    #image_dir='./original_data'
    
    # if os.path.isdir(image_dir):
    #     shutil.rmtree(image_dir)
    # os.makedirs(image_dir)

    #for index,(url,cid) in enumerate(Image_Urllist,start=1):
    #   try:
    #       if os.path.isfile(f'{image_dir}/{cid}.jpg'):    #기존 존재하는 파일은 안지움.
    #           continue
    #       else:
    #            urllib.request.urlretrieve(url, f'{image_dir}/{cid}.jpg')
    #            if index%100==0:
    #                print(f'현재 {index}장 저장완료')
    #    except Exception:
    #        print(f'{index} 사진은 에러뜸. pass')
    #print('이미지 저장이 완료되었습니다.')
# 반복문으로 rows에 대해서 crop and detection 진행, classification까지 진행 (만약 개가 없다면?, 개가 여러마리라면?)

detector, custom_objects=detectsetting()    #다른곳에서 detectsetting을 해줘야할듯.
model = tensorflow.keras.models.load_model('/home/wndvlf96/abandog/keras_model.h5')
np.set_printoptions(suppress=True)
new_updt_list = []

for i in range(len(rows)):
    url = rows[i]['img']
    cid = rows[i]['cid']
    try:
        image = Image.open(requests.get(url, stream=True).raw)
        image.save('/home/wndvlf96/abandog/Test/test.jpg')
        input_image='/home/wndvlf96/abandog/Test/test.jpg' #test1.jpg로 저장.
        detect_path='/home/wndvlf96/abandog/Testdetect/detect.jpg' #./Testdetect폴더 하위에 detect.jpg로 저장됨.
        try:
            print(i)
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
            # pred_label 값을 specials컬럼에 저장하기 위한 준비
            # new_updt_list.append([pred_label, cid])
            sql = "UPDATE `dog` SET `specials`=%s WHERE `cid` = %s;" %(pred_label, cid)
            cur.execute(sql)
            conn.commit()
        except:
            pass
            # classification 될 것도 없이 다음 것으로
    except:
        pass
# 반복문이 끝난 이후 specials칼럼에 pred_label에 따라서 업데이트
#sql = "UPDATE `dog` SET `specials` = %s WHERE `cid` = %s;"
#cur.executemany(sql, new_updt_list)
conn.close()