import requests
import xmltodict
import json
from pprint import pprint
import pymysql

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
'''
pprint(dict_data['response']['body']['items']['item'])
print(len(dict_data['response']['body']['items']['item']))
'''
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

# 이제 protect = 'y'인 애들 가져와서 knn구성하기!!!!!!!!!!!!!!!
# 
#
#
conn.close()