import random

file = open("sql.txt", "w")
links = ['http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4',
'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4',
'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4',
'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4',
'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4',
'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4',
'//vjs.zencdn.net/v/oceans.mp4']

query = '''UPDATE [dbo].[courses]
   SET [courseVideoLink] = {}
 WHERE id = {}
GO'''

for i in range(8, 51):
    print(query.format("'" + random.choice(links) + "'", i))
    file.write(query.format("'" + random.choice(links) + "'", i)+'\n')

file.close()

